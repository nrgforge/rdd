'use strict';
// Record Validator → Substrate boundary test (system-design.agents.md §Cycle 020 Boundary Integration Tests).
// Positive: the Cycle 019 fixture (Pattern + four index records + one full record with two sub-decisions + one term) validates.
// Negative: unnoted non-references link; missing required field per type; unknown link type with a note validates.

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const HERE = __dirname;
const TOOL = path.join(HERE, '..', 'validate.js');
const FIXTURE = path.join(HERE, 'fixtures', 'cycle-019');
const { validateAll } = require('../validate.js');

function copyFixture() {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'substrate-'));
  fs.cpSync(FIXTURE, dir, { recursive: true });
  return dir;
}
function readJson(p) { return JSON.parse(fs.readFileSync(p, 'utf8')); }
function writeJson(p, v) { fs.writeFileSync(p, JSON.stringify(v, null, 2) + '\n'); }
function runCli(args, cwd) {
  return spawnSync(process.execPath, [TOOL, ...args], { cwd, encoding: 'utf8' });
}

test('the Cycle 019 fixture corpus validates (scenarios: per-type schemas permit absent fields; link types are extensible; sub-decisions nest)', () => {
  const result = validateAll(FIXTURE);
  assert.deepEqual(result.errors, []);
  assert.equal(result.ok, true);
  const ids = result.records.map((r) => r.id);
  assert.deepEqual(ids, [
    'adr-094', 'adr-095', 'adr-096', 'adr-097', 'adr-098',
    'pattern-calibration-with-graduation-trigger',
    'term-substrate',
  ]);
  const adr097 = result.byId.get('adr-097');
  assert.equal(adr097.form, 'full');
  assert.equal(adr097.data.sub_decisions.length, 2);
  // A pattern record has no rejected_alternatives and validates; the full ADR has them (required).
  assert.equal(result.byId.get('pattern-calibration-with-graduation-trigger').data.rejected_alternatives, undefined);
  assert.ok(Array.isArray(adr097.data.rejected_alternatives));
  // An unknown-to-the-starting-set link type with a note validated (shares-structural-limit-with).
  assert.ok(adr097.data.links.some((l) => l.type === 'shares-structural-limit-with'));
});

test('CLI exits 0 on the fixture corpus and prints nothing to stderr', () => {
  const r = runCli([FIXTURE], HERE);
  assert.equal(r.status, 0, r.stderr);
  assert.equal(r.stderr, '');
});

test('Note Discipline: an unnoted non-references link fails, naming the record and the link (scenario: Note Discipline validation rejects an unnoted non-trivial link)', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'adr', 'adr-096.json');
  const rec = readJson(p);
  delete rec.links[1].note; // parallel-to → adr-094 loses its note
  writeJson(p, rec);
  const result = validateAll(dir);
  assert.equal(result.ok, false);
  assert.equal(result.errors.length, 1);
  assert.equal(result.errors[0].path, p);
  assert.equal(result.errors[0].field, 'links[1]');
  assert.match(result.errors[0].message, /note/i);
  assert.match(result.errors[0].message, /parallel-to/);
  const r = runCli([dir], HERE);
  assert.equal(r.status, 1);
  assert.equal(r.stderr.trim(), `${p}: links[1]: ${result.errors[0].message}`);
});

test('an unnoted references link is trivial and validates', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'adr', 'adr-094.json');
  const rec = readJson(p);
  assert.equal(rec.links[2].type, 'references');
  assert.equal(rec.links[2].note, undefined);
  assert.equal(validateAll(dir).ok, true);
});

test('per-type required fields: adr full without rejected_alternatives fails; pattern without statement fails; term without definition fails; adr index without canonical_source fails', () => {
  const cases = [
    ['adr/adr-097.json', 'rejected_alternatives'],
    ['pattern/calibration-with-graduation-trigger.json', 'statement'],
    ['term/substrate.json', 'definition'],
    ['adr/adr-098.json', 'canonical_source'],
  ];
  for (const [rel, field] of cases) {
    const dir = copyFixture();
    const p = path.join(dir, rel);
    const rec = readJson(p);
    delete rec[field];
    writeJson(p, rec);
    const result = validateAll(dir);
    assert.equal(result.ok, false, `${rel} without ${field} should fail`);
    assert.ok(result.errors.some((e) => e.path === p && e.field === field && /required/.test(e.message)),
      `${rel}: expected a required-field error on ${field}, got ${JSON.stringify(result.errors)}`);
  }
});

test('an index record must declare compressed: true', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'adr', 'adr-095.json');
  const rec = readJson(p);
  rec.compressed = false;
  writeJson(p, rec);
  const result = validateAll(dir);
  assert.ok(result.errors.some((e) => e.field === 'compressed'));
});

test('a link to an in-corpus id that does not exist fails; external and invariant targets are permitted', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'adr', 'adr-095.json');
  const rec = readJson(p);
  rec.links.push({ type: 'references', target: 'adr-042' });
  writeJson(p, rec);
  const result = validateAll(dir);
  assert.ok(result.errors.some((e) => e.field === 'links[2]' && /adr-042/.test(e.message) && /resolve/.test(e.message)));
});

test('sub-decisions require commitment and rationale', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'adr', 'adr-097.json');
  const rec = readJson(p);
  delete rec.sub_decisions[1].rationale;
  writeJson(p, rec);
  const result = validateAll(dir);
  assert.ok(result.errors.some((e) => e.field === 'sub_decisions[1].rationale'));
});

test('id must match the file location and type', () => {
  const dir = copyFixture();
  const p = path.join(dir, 'term', 'substrate.json');
  const rec = readJson(p);
  rec.id = 'term-something-else';
  writeJson(p, rec);
  const result = validateAll(dir);
  assert.ok(result.errors.some((e) => e.field === 'id'));
});

test('a missing substrate directory exits 2', () => {
  const r = runCli([path.join(os.tmpdir(), 'no-such-substrate-dir')], HERE);
  assert.equal(r.status, 2);
});

test('zero dependencies: validate.js requires only node: built-ins or sibling files', () => {
  const src = fs.readFileSync(TOOL, 'utf8');
  const requires = [...src.matchAll(/require\((['"])([^'"]+)\1\)/g)].map((m) => m[2]);
  for (const r of requires) {
    assert.ok(r.startsWith('node:') || r.startsWith('./') || r.startsWith('../'), `unexpected require: ${r}`);
  }
  assert.equal(fs.existsSync(path.join(HERE, '..', 'node_modules')), false);
});
