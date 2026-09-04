#!/usr/bin/env node
'use strict';
// Surface Deriver (ADR-099; system-design v17.0 §Surface Deriver).
//
// Generates every Surface View from a validated Substrate in one deterministic
// pass and refuses to run on an invalid Substrate.
//
//   node tools/substrate/derive.js [--substrate <dir>] [--views <dir>]
//        [--decisions <dir>] [--domain-model <file>] [--check] [--replace]
//
// Outputs: <views>/overview.md; <views>/<id>.md per record; <decisions>/adr-NNN-<slug>.md
// per `adr` record with form `full`; the marked region of <domain-model> for `term` records.
// Defaults: docs/substrate, docs/views, docs/decisions, docs/domain-model.md (cwd-relative).
//
// Exit codes: 0 success; 1 validation failure (nothing written), refusal to overwrite a
// non-derived file (nothing written), missing domain-model markers (nothing written), or
// --check drift (paths listed); 2 missing substrate directory.
//
// Determinism: fixed iteration order (patterns, then ADRs by number, then terms; links in
// record order; surrounding records by id), LF endings, no timestamps.
//
// Zero dependencies: node: built-ins and ./validate.js only.

const fs = require('node:fs');
const path = require('node:path');
const { validateAll, formatErrors, IN_CORPUS_PREFIX } = require('./validate.js');

const BEGIN_MARKER = '<!-- substrate:terms:begin -->';
const END_MARKER = '<!-- substrate:terms:end -->';
const DERIVED_HEADER_PREFIX = '> **Derived from `';
const RERUN = 'node tools/substrate/derive.js';

// --- Small text helpers ------------------------------------------------------

function firstSentence(text, max = 240) {
  if (!text) return '';
  const flat = String(text).replace(/\s+/g, ' ').trim();
  const m = flat.match(/^(.+?[.!?])(\s|$)/);
  let s = m ? m[1] : flat;
  if (s.length > max) s = s.slice(0, max - 1).trimEnd() + '…';
  return s;
}

function oneLine(rec) {
  const d = rec.data;
  if (d.summary) return firstSentence(d.summary, 400);
  if (rec.type === 'pattern') return firstSentence(d.statement);
  if (rec.type === 'term') return firstSentence(d.definition);
  return firstSentence(d.commitment || d.context);
}

function displayName(rec) {
  if (rec.type === 'adr') return `${rec.id.toUpperCase()}: ${rec.data.title}`;
  return rec.data.title;
}

function adrNumber(id) {
  const m = /^adr-(\d+)/.exec(id);
  return m ? Number(m[1]) : Number.MAX_SAFE_INTEGER;
}

function sortRecords(records) {
  const patterns = records.filter((r) => r.type === 'pattern').sort(byId);
  const adrs = records.filter((r) => r.type === 'adr').sort((a, b) => adrNumber(a.id) - adrNumber(b.id) || cmp(a.id, b.id));
  const terms = records.filter((r) => r.type === 'term').sort(byId);
  return { patterns, adrs, terms, ordered: [...patterns, ...adrs, ...terms] };
}

function cmp(a, b) { return a < b ? -1 : a > b ? 1 : 0; }
function byId(a, b) { return cmp(a.id, b.id); }

function cell(text) {
  return String(text || '').replace(/\s*\n\s*/g, ' ').replace(/\|/g, '\\|').trim();
}

function bullets(items, prefix = '- ') {
  return (items || []).map((s) => `${prefix}${s}`).join('\n');
}

function provenanceBlock(p) {
  if (!p) return '';
  return Array.isArray(p) ? bullets(p) : String(p);
}

// --- Link rendering ------------------------------------------------------------

function linkTargetRef(target, byId) {
  const rec = byId.get(target);
  if (rec) return `[${displayName(rec)}](${rec.id}.md)`;
  return `\`${target}\``;
}

function renderLinks(rec, byId) {
  const links = rec.data.links || [];
  if (links.length === 0) return '_No typed links._';
  return links.map((l) => {
    const note = l.note ? ` — ${l.note}` : '';
    return `- \`${l.type}\` → ${linkTargetRef(l.target, byId)}${note}`;
  }).join('\n');
}

// Every record linked to or from `rec`, with the relationships in both directions.
function surroundingRecords(rec, records, byId) {
  const rel = new Map(); // id → [descriptions]
  const add = (id, text) => {
    if (id === rec.id || !byId.has(id)) return;
    if (!rel.has(id)) rel.set(id, []);
    rel.get(id).push(text);
  };
  for (const l of rec.data.links || []) add(l.target, `\`${l.type}\` → ${l.note ? l.note : '(trivial reference; no note)'}`);
  for (const other of records) {
    if (other.id === rec.id) continue;
    for (const l of other.data.links || []) {
      if (l.target === rec.id) add(other.id, `← \`${l.type}\` ${l.note ? l.note : '(trivial reference; no note)'}`);
    }
    if (other.type === 'pattern' && (other.data.applications || []).includes(rec.id)) add(other.id, '← application of this pattern');
  }
  return [...rel.keys()].sort(cmp).map((id) => ({ rec: byId.get(id), relations: rel.get(id) }));
}

function renderSurrounding(rec, records, byId) {
  const items = surroundingRecords(rec, records, byId);
  const lines = ['## Surrounding records', '',
    '_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._', ''];
  if (items.length === 0) {
    lines.push('_None._');
  } else {
    for (const { rec: other, relations } of items) {
      const d = other.data;
      const meta = [];
      if (d.workflow_point) meta.push(`workflow point: ${d.workflow_point}`);
      if (d.mechanism) meta.push(`mechanism: ${d.mechanism}`);
      const metaText = meta.length ? ` *(${meta.join('; ')})*` : '';
      lines.push(`- **[${displayName(other)}](${other.id}.md)**${metaText} — ${oneLine(other)}`);
      for (const r of relations) lines.push(`  - ${r}`);
    }
  }
  lines.push('', '[← Overview](overview.md)');
  return lines.join('\n');
}

// --- Overview ------------------------------------------------------------------

function renderOverview(sorted, byId, substrateLabel) {
  const { patterns, adrs, terms } = sorted;
  const full = adrs.filter((r) => r.form === 'full').length;
  const index = adrs.length - full;
  const lines = [
    '# Corpus overview',
    '',
    `> Derived from the Substrate (\`${substrateLabel}\`) by \`${RERUN}\`. Do not edit this file; correct a record and re-run.`,
    '',
    `${patterns.length} pattern${patterns.length === 1 ? '' : 's'} · ${adrs.length} ADR${adrs.length === 1 ? '' : 's'} (${full} full, ${index} compressed index) · ${terms.length} term${terms.length === 1 ? '' : 's'}. Each entry is a one-line summary with its typed cross-references co-located; open the drill-in for the full record.`,
    '',
  ];
  const section = (heading, recs, describe) => {
    lines.push(`## ${heading}`, '');
    if (recs.length === 0) { lines.push('_None._', ''); return; }
    for (const r of recs) {
      lines.push(`### [${displayName(r)}](${r.id}.md)`, '');
      const tag = describe(r);
      if (tag) lines.push(tag, '');
      lines.push(oneLine(r), '');
      lines.push(renderLinks(r, byId), '');
    }
  };
  section('Patterns', patterns, (r) => {
    const apps = (r.data.applications || []).map((a) => linkTargetRef(a, byId)).join(', ');
    return apps ? `**Applied by:** ${apps}` : '';
  });
  section('Decisions', adrs, (r) => {
    const d = r.data;
    const parts = [`**Status:** ${d.status}`];
    if (d.cycle) parts.push(`**Cycle:** ${d.cycle}`);
    parts.push(r.form === 'index' ? `**Compressed index** of \`${d.canonical_source}\`` : '**Full record**');
    return parts.join(' · ');
  });
  section('Terms', terms, (r) => (r.data.cycle ? `**Cycle:** ${r.data.cycle}` : ''));
  return lines.join('\n').replace(/\n+$/, '') + '\n';
}

// --- Drill-in views --------------------------------------------------------------

function renderCompressedMarker(rec) {
  return `> **This view is a compressed index of \`${rec.data.canonical_source}\`; the source is canonical.** The record carries identifier, title, status, typed links, and a summary; audit-substance lives in the source file.`;
}

function renderAdrBody(rec, byId, { headingLevel = 2 } = {}) {
  const d = rec.data;
  const h = '#'.repeat(headingLevel);
  const hh = '#'.repeat(headingLevel + 1);
  const out = [];
  out.push(`${h} Context`, '', d.context, '');
  out.push(`${h} Decision`, '', d.commitment, '');
  for (const sd of d.sub_decisions || []) {
    out.push(`${hh} ${sd.title || 'Sub-decision'}`, '');
    if (sd.status) out.push(`**Status.** ${sd.status}`, '');
    if (sd.options && sd.options.length) {
      out.push('**Options.**', '');
      for (const o of sd.options) out.push(`- **${o.label}.** ${o.text}`);
      out.push('');
    }
    out.push(`**Commitment.** ${sd.commitment}`, '', `**Rationale.** ${sd.rationale}`, '');
  }
  if (d.graduation_trigger) out.push(`${hh} Graduation trigger`, '', d.graduation_trigger, '');
  if (d.warrants && d.warrants.length) {
    out.push('**Warrants.**', '');
    for (const w of d.warrants) out.push(`- *(${w.warrants_for})* ${w.claim}`);
    out.push('');
  }
  out.push(`${h} Rejected alternatives`, '');
  for (const ra of d.rejected_alternatives || []) {
    const label = [ra.label, ra.title].filter(Boolean).join('. ');
    out.push(label ? `**${label}.** ${ra.reason}` : ra.reason, '');
  }
  out.push(`${h} Consequences`, '');
  const c = d.consequences || {};
  for (const [key, label] of [['positive', 'Positive'], ['negative', 'Negative'], ['neutral', 'Neutral']]) {
    out.push(`**${label}:**`, (c[key] && c[key].length) ? bullets(c[key]) : '- —', '');
  }
  for (const s of d.additional_sections || []) out.push(`${h} ${s.heading}`, '', s.body, '');
  out.push(`${h} Provenance check`, '', provenanceBlock(d.provenance) || '_Not recorded._', '');
  return out;
}

function renderDrillIn(rec, records, byId) {
  const d = rec.data;
  const lines = [`# ${displayName(rec)}`, '', '[← Overview](overview.md)', ''];
  if (rec.type === 'adr' && rec.form === 'index') lines.push(renderCompressedMarker(rec), '');
  if (rec.type === 'adr') {
    const meta = [`**Type:** ADR (${rec.form})`, `**Status:** ${d.status}`];
    if (d.cycle) meta.push(`**Cycle:** ${d.cycle}`);
    if (rec.form === 'index') meta.push(`**Canonical source:** \`${d.canonical_source}\``);
    lines.push(meta.join(' · '), '');
    const wp = [];
    if (d.workflow_point) wp.push(`**Workflow point:** ${d.workflow_point}`);
    if (d.mechanism) wp.push(`**Mechanism:** ${d.mechanism}`);
    if (wp.length) lines.push(wp.join(' · '), '');
    for (const s of d.supersession || []) lines.push(renderSupersession(s), '');
    if (rec.form === 'index') {
      lines.push('## Summary', '', d.summary, '');
    } else {
      if (d.summary) lines.push('## Summary', '', d.summary, '');
      lines.push(...renderAdrBody(rec, byId));
    }
  } else if (rec.type === 'pattern') {
    lines.push('**Type:** Pattern', '');
    if (d.summary) lines.push('## Summary', '', d.summary, '');
    lines.push('## Statement', '', d.statement, '');
    lines.push('## Applications', '', (d.applications || []).map((a) => `- ${linkTargetRef(a, byId)}`).join('\n') || '_None._', '');
    if (d.caveats && d.caveats.length) lines.push('## Caveats', '', bullets(d.caveats), '');
    if (d.provenance) lines.push('## Provenance', '', provenanceBlock(d.provenance), '');
  } else if (rec.type === 'term') {
    const meta = [`**Type:** Term${d.kind ? ` (${d.kind})` : ''}`];
    if (d.cycle) meta.push(`**Cycle:** ${d.cycle}`);
    lines.push(meta.join(' · '), '');
    lines.push('## Definition', '', d.definition, '');
    if (d.actor || d.object) {
      const ao = [];
      if (d.actor) ao.push(`**Actor:** ${d.actor}`);
      if (d.object) ao.push(`**Object:** ${d.object}`);
      lines.push(ao.join(' · '), '');
    }
    if (d.product_origin) lines.push(`**Product origin:** ${d.product_origin}`, '');
    if (d.aliases && d.aliases.length) lines.push(`**Aliases:** ${d.aliases.join(', ')}`, '');
    if (d.related && d.related.length) lines.push(`**Related:** ${d.related.join(', ')}`, '');
  }
  lines.push('## Typed links', '', renderLinks(rec, byId), '');
  lines.push(renderSurrounding(rec, records, byId));
  return lines.join('\n').replace(/\n+$/, '') + '\n';
}

function renderSupersession(s) {
  const map = { 'superseded-by': 'Superseded by', 'updated-by': 'Updated by', erratum: 'Erratum', deprecated: 'Deprecated' };
  const label = map[s.kind] || s.kind;
  const by = s.by ? ` ${s.by.toUpperCase()}` : '';
  return `> **${label}${by} on ${s.date}.** ${s.text}`;
}

// --- Derived ADR markdown --------------------------------------------------------

function derivedHeader(recordPathLabel) {
  return `${DERIVED_HEADER_PREFIX}${recordPathLabel}\` (Substrate record; canonical). Do not edit this file; correct the record and re-run \`${RERUN}\`.**`;
}

function isDerivedFile(p) {
  if (!fs.existsSync(p)) return null;
  const first = fs.readFileSync(p, 'utf8').split('\n', 1)[0];
  return first.startsWith(DERIVED_HEADER_PREFIX);
}

function renderAdrMarkdown(rec, byId, recordPathLabel) {
  const d = rec.data;
  const lines = [derivedHeader(recordPathLabel), ''];
  for (const s of d.supersession || []) lines.push(renderSupersession(s), '');
  lines.push(`# ${displayName(rec)}`, '');
  lines.push(`**Status:** ${d.status}`);
  lines.push(`**Cycle:** ${d.cycle}`);
  if (d.audit_trail) lines.push(`**Audit trail:** ${d.audit_trail}`);
  lines.push('');
  if (d.links && d.links.length) {
    lines.push('**Typed links:**', '');
    for (const l of d.links) {
      const t = byId.get(l.target);
      const name = t ? displayName(t) : l.target;
      lines.push(`- \`${l.type}\` → ${name}${l.note ? ` — ${l.note}` : ''}`);
    }
    lines.push('');
  }
  lines.push(...renderAdrBody(rec, byId));
  return lines.join('\n').replace(/\n+$/, '') + '\n';
}

// --- Domain-model term region ------------------------------------------------------

function renderTermRows(terms) {
  return terms.map((r) => {
    const d = r.data;
    const related = (d.related || []).join(', ');
    return `| ${cell(d.title)} | ${cell(d.definition)} | ${cell(d.product_origin || '—')} | ${cell(related || '—')} |`;
  }).join('\n');
}

function spliceTermRegion(text, rows) {
  const a = text.indexOf(BEGIN_MARKER);
  const b = text.indexOf(END_MARKER);
  if (a < 0 || b < 0 || b < a) return null;
  const head = text.slice(0, a + BEGIN_MARKER.length);
  const tail = text.slice(b);
  return `${head}\n${rows}${rows ? '\n' : ''}${tail}`;
}

// --- Plan and apply ----------------------------------------------------------------

function labelFor(p) {
  const rel = path.relative(process.cwd(), p);
  return rel && !rel.startsWith('..') && !path.isAbsolute(rel) ? rel.split(path.sep).join('/') : p;
}

function plan(opts) {
  const { substrate, views, decisions, domainModel } = opts;
  if (!fs.existsSync(substrate) || !fs.statSync(substrate).isDirectory()) {
    return { exitCode: 2, messages: [`${substrate}: substrate directory not found`] };
  }
  const v = validateAll(substrate);
  if (!v.ok) return { exitCode: 1, messages: [formatErrors(v.errors)] };
  const sorted = sortRecords(v.records);
  const outputs = new Map(); // absolute path → content
  const owned = new Set(); // view files this run owns (for stale detection)

  outputs.set(path.join(views, 'overview.md'), renderOverview(sorted, v.byId, labelFor(substrate)));
  for (const r of sorted.ordered) outputs.set(path.join(views, `${r.id}.md`), renderDrillIn(r, v.records, v.byId));
  for (const p of outputs.keys()) owned.add(p);

  const refusals = [];
  for (const r of sorted.adrs) {
    if (r.form !== 'full') continue;
    const target = path.join(decisions, `${r.id}-${r.data.slug}.md`);
    const derived = isDerivedFile(target);
    if (derived === false && !opts.replace) refusals.push(`refusing to overwrite ${labelFor(target)}: its first line is not the deriver header (pass --replace once to replace a prose file with its derived form)`);
    outputs.set(target, renderAdrMarkdown(r, v.byId, labelFor(r.path)));
  }
  if (refusals.length) return { exitCode: 1, messages: refusals };

  if (sorted.terms.length && fs.existsSync(domainModel)) {
    const text = fs.readFileSync(domainModel, 'utf8');
    const next = spliceTermRegion(text, renderTermRows(sorted.terms));
    if (next === null) return { exitCode: 1, messages: [`${labelFor(domainModel)}: term markers ${BEGIN_MARKER} … ${END_MARKER} not found; the deriver never inserts markers (MODEL places them once)`] };
    outputs.set(domainModel, next);
  }
  return { exitCode: 0, outputs, owned, records: v.records };
}

function staleViews(views, owned) {
  if (!fs.existsSync(views)) return [];
  return fs.readdirSync(views).filter((f) => f.endsWith('.md')).map((f) => path.join(views, f)).filter((p) => !owned.has(p)).sort();
}

function derive(opts) {
  const p = plan(opts);
  if (p.exitCode !== 0) return { exitCode: p.exitCode, messages: p.messages };
  const stale = staleViews(opts.views, p.owned);
  if (opts.check) {
    const drift = [];
    for (const [file, content] of [...p.outputs.entries()].sort((a, b) => cmp(a[0], b[0]))) {
      if (!fs.existsSync(file)) drift.push(`missing: ${labelFor(file)}`);
      else if (fs.readFileSync(file, 'utf8') !== content) drift.push(`differs: ${labelFor(file)}`);
    }
    for (const s of stale) drift.push(`stale: ${labelFor(s)}`);
    return { exitCode: drift.length ? 1 : 0, messages: drift };
  }
  const written = [];
  fs.mkdirSync(opts.views, { recursive: true });
  for (const [file, content] of p.outputs) {
    fs.mkdirSync(path.dirname(file), { recursive: true });
    if (!fs.existsSync(file) || fs.readFileSync(file, 'utf8') !== content) {
      fs.writeFileSync(file, content);
      written.push(file);
    }
  }
  for (const s of stale) { fs.unlinkSync(s); written.push(s); }
  return { exitCode: 0, messages: [], written, records: p.records };
}

// --- CLI -----------------------------------------------------------------------------

function parseArgs(argv) {
  const cwd = process.cwd();
  const o = {
    substrate: path.join(cwd, 'docs', 'substrate'),
    views: path.join(cwd, 'docs', 'views'),
    decisions: path.join(cwd, 'docs', 'decisions'),
    domainModel: path.join(cwd, 'docs', 'domain-model.md'),
    check: false,
    replace: false,
  };
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i];
    const next = () => { i += 1; return path.resolve(argv[i]); };
    if (a === '--substrate') o.substrate = next();
    else if (a === '--views') o.views = next();
    else if (a === '--decisions') o.decisions = next();
    else if (a === '--domain-model') o.domainModel = next();
    else if (a === '--check') o.check = true;
    else if (a === '--replace') o.replace = true;
    else return { error: `unknown option ${a}` };
  }
  return o;
}

function main(argv) {
  const opts = parseArgs(argv.slice(2));
  if (opts.error) { process.stderr.write(opts.error + '\n'); return 2; }
  const r = derive(opts);
  if (r.exitCode !== 0) {
    process.stderr.write(r.messages.join('\n') + '\n');
  } else if (!opts.check && r.written.length) {
    process.stdout.write(r.written.map((w) => `wrote ${labelFor(w)}`).join('\n') + '\n');
  }
  return r.exitCode;
}

module.exports = { derive, plan, renderOverview, renderDrillIn, renderAdrMarkdown, renderTermRows, BEGIN_MARKER, END_MARKER, DERIVED_HEADER_PREFIX };

if (require.main === module) {
  process.exitCode = main(process.argv);
}
