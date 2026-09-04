#!/usr/bin/env node
'use strict';
// Record Validator (ADR-099; system-design v17.0 §Record Validator).
//
// Rejects any Substrate record that violates its per-type schema or Note
// Discipline, naming the record and the offending field or link.
//
//   node tools/substrate/validate.js [<substrate-dir>]
//
// With no argument, validates every record under docs/substrate/ relative to
// the current working directory. Exit 0 on success; exit 1 on any failure with
// one line per failure on stderr (`<record path>: <field or links[i]>: <message>`);
// exit 2 when the substrate directory does not exist.
//
// Exported: validateAll(dir) → { ok, errors, records, byId }. The deriver
// renders from `records` (the parsed objects), not from re-reading files.
//
// Zero dependencies: node: built-ins only.

const fs = require('node:fs');
const path = require('node:path');

const SCHEMA_DIR = path.join(__dirname, 'schema');
const RECORD_TYPES = ['adr', 'pattern', 'term'];
// Link targets with one of these prefixes are in-corpus record ids and must resolve.
// Other targets (invariant-0, external:..., essay-outline-020) are permitted unresolved.
const IN_CORPUS_PREFIX = /^(adr|pattern|term)-/;

// --- Schema loading ---------------------------------------------------------

function loadSchemas() {
  const link = readJsonFile(path.join(SCHEMA_DIR, 'link.schema.json'));
  const byType = {};
  for (const t of RECORD_TYPES) {
    byType[t] = readJsonFile(path.join(SCHEMA_DIR, `${t}.schema.json`));
  }
  return { link, byType };
}

function readJsonFile(p) {
  return JSON.parse(fs.readFileSync(p, 'utf8'));
}

// --- Minimal schema matcher --------------------------------------------------
// Supports the JSON-Schema subset the record schemas use: type (string or
// array of strings), const, enum, minLength, minItems, required, properties,
// items, and $ref: "link" (the shared link sub-schema). Additional properties
// are always permitted (optional fields may be added without a schema change).

function typeOf(v) {
  if (Array.isArray(v)) return 'array';
  if (v === null) return 'null';
  return typeof v;
}

function matchSchema(value, schema, field, errors, ctx) {
  if (schema.$ref === 'link') {
    matchSchema(value, ctx.schemas.link, field, errors, ctx);
    return;
  }
  if (schema.const !== undefined && value !== schema.const) {
    errors.push({ field, message: `must be ${JSON.stringify(schema.const)}` });
    return;
  }
  if (schema.enum && !schema.enum.includes(value)) {
    errors.push({ field, message: `must be one of ${schema.enum.map((e) => JSON.stringify(e)).join(', ')}` });
    return;
  }
  if (schema.type) {
    const allowed = Array.isArray(schema.type) ? schema.type : [schema.type];
    const actual = typeOf(value);
    if (!allowed.includes(actual)) {
      errors.push({ field, message: `must be ${allowed.join(' or ')}, got ${actual}` });
      return;
    }
  }
  if (typeof value === 'string' && schema.minLength !== undefined && value.length < schema.minLength) {
    errors.push({ field, message: schema.minLength === 1 ? 'must not be empty' : `must be at least ${schema.minLength} characters` });
  }
  if (Array.isArray(value)) {
    if (schema.minItems !== undefined && value.length < schema.minItems) {
      errors.push({ field, message: `must have at least ${schema.minItems} items` });
    }
    if (schema.items) {
      value.forEach((item, i) => matchSchema(item, schema.items, `${field}[${i}]`, errors, ctx));
    }
  }
  if (typeOf(value) === 'object') {
    for (const req of schema.required || []) {
      if (value[req] === undefined) {
        errors.push({ field: joinField(field, req), message: 'required field is missing' });
      }
    }
    for (const [key, sub] of Object.entries(schema.properties || {})) {
      if (value[key] !== undefined) {
        matchSchema(value[key], sub, joinField(field, key), errors, ctx);
      }
    }
    if (schema.noteRequiredUnlessType && typeof value.type === 'string') {
      const trivial = schema.noteRequiredUnlessType;
      const hasNote = typeof value.note === 'string' && value.note.trim().length > 0;
      if (!trivial.includes(value.type) && !hasNote) {
        errors.push({
          field,
          message: `note required for link type "${value.type}" to ${JSON.stringify(value.target)} (Note Discipline; only ${trivial.map((t) => `"${t}"`).join(', ')} is trivial)`,
        });
      }
    }
  }
}

function joinField(base, key) {
  return base ? `${base}.${key}` : key;
}

// --- Record discovery ------------------------------------------------------

function discoverRecordFiles(dir) {
  const files = [];
  for (const t of RECORD_TYPES) {
    const typeDir = path.join(dir, t);
    if (!fs.existsSync(typeDir)) continue;
    for (const name of fs.readdirSync(typeDir).sort()) {
      if (name.endsWith('.json')) files.push({ type: t, path: path.join(typeDir, name) });
    }
  }
  return files;
}

// --- Per-record validation ---------------------------------------------------

function selectSchema(record, schemaForType, errors) {
  if (!schemaForType.forms) return schemaForType;
  const form = record.form;
  const known = Object.keys(schemaForType.forms);
  if (typeof form !== 'string' || !known.includes(form)) {
    errors.push({ field: 'form', message: `must be one of ${known.map((f) => `"${f}"`).join(', ')}` });
    return null;
  }
  return schemaForType.forms[form];
}

function validateIdentity(record, file, errors) {
  const stem = path.basename(file.path, '.json');
  if (typeof record.id !== 'string') return; // reported by the schema pass
  const acceptable = [stem, `${file.type}-${stem}`];
  if (!acceptable.includes(record.id)) {
    errors.push({ field: 'id', message: `must be "${stem}" or "${file.type}-${stem}" to match the file location, got "${record.id}"` });
  }
  if (record.type !== undefined && record.type !== file.type) {
    errors.push({ field: 'type', message: `must be "${file.type}" to match the directory, got ${JSON.stringify(record.type)}` });
  }
}

function validateRecord(file, schemas) {
  const errors = [];
  let record;
  try {
    record = readJsonFile(file.path);
  } catch (e) {
    return { errors: [{ path: file.path, field: '(file)', message: `invalid JSON: ${e.message}` }] };
  }
  if (typeOf(record) !== 'object') {
    return { errors: [{ path: file.path, field: '(file)', message: 'record must be a JSON object' }] };
  }
  const schemaForType = schemas.byType[file.type];
  const schema = selectSchema(record, schemaForType, errors);
  if (schema) matchSchema(record, schema, '', errors, { schemas });
  validateIdentity(record, file, errors);
  return {
    record,
    errors: errors.map((e) => ({ path: file.path, field: e.field, message: e.message })),
  };
}

// --- Cross-record checks -----------------------------------------------------

function validateCrossRecord(entries) {
  const errors = [];
  const ids = new Map();
  for (const e of entries) {
    if (ids.has(e.id)) {
      errors.push({ path: e.path, field: 'id', message: `duplicate id "${e.id}" (also in ${ids.get(e.id)})` });
    } else {
      ids.set(e.id, e.path);
    }
  }
  for (const e of entries) {
    const links = Array.isArray(e.data.links) ? e.data.links : [];
    links.forEach((l, i) => {
      if (typeof l.target === 'string' && IN_CORPUS_PREFIX.test(l.target) && !ids.has(l.target)) {
        errors.push({ path: e.path, field: `links[${i}]`, message: `target "${l.target}" does not resolve to a record in the substrate` });
      }
    });
    if (e.type === 'pattern' && Array.isArray(e.data.applications)) {
      e.data.applications.forEach((a, i) => {
        if (typeof a === 'string' && !ids.has(a)) {
          errors.push({ path: e.path, field: `applications[${i}]`, message: `application "${a}" does not resolve to a record in the substrate` });
        }
      });
    }
  }
  return errors;
}

// --- Public API --------------------------------------------------------------

function validateAll(dir) {
  const schemas = loadSchemas();
  const files = discoverRecordFiles(dir);
  const errors = [];
  const entries = [];
  for (const f of files) {
    const r = validateRecord(f, schemas);
    errors.push(...r.errors);
    if (r.record && r.errors.length === 0) {
      entries.push({ id: r.record.id, type: f.type, form: r.record.form, path: f.path, data: r.record });
    }
  }
  if (errors.length === 0) errors.push(...validateCrossRecord(entries));
  entries.sort((a, b) => (a.id < b.id ? -1 : a.id > b.id ? 1 : 0));
  const byId = new Map(entries.map((e) => [e.id, e]));
  return { ok: errors.length === 0, errors, records: entries, byId };
}

function formatErrors(errors) {
  return errors.map((e) => `${e.path}: ${e.field || '(record)'}: ${e.message}`).join('\n');
}

// --- CLI ---------------------------------------------------------------------

function main(argv) {
  const args = argv.slice(2);
  let dir = path.join(process.cwd(), 'docs', 'substrate');
  for (let i = 0; i < args.length; i += 1) {
    if (args[i] === '--substrate') { dir = path.resolve(args[i + 1]); i += 1; }
    else if (args[i].startsWith('-')) { process.stderr.write(`unknown option ${args[i]}\n`); return 2; }
    else dir = path.resolve(args[i]);
  }
  if (!fs.existsSync(dir) || !fs.statSync(dir).isDirectory()) {
    process.stderr.write(`${dir}: substrate directory not found\n`);
    return 2;
  }
  const result = validateAll(dir);
  if (!result.ok) {
    process.stderr.write(formatErrors(result.errors) + '\n');
    return 1;
  }
  return 0;
}

module.exports = { validateAll, formatErrors, RECORD_TYPES, IN_CORPUS_PREFIX };

if (require.main === module) {
  process.exitCode = main(process.argv);
}
