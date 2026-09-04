#!/usr/bin/env node
'use strict';
// Legacy index-record scaffold (ADR-099 §Authority option C; roadmap Cycle 020 WP-E).
//
// Emits a skeleton `form: index` record for every legacy ADR file under docs/decisions/
// that has no record yet and is not itself derived. Mechanical fields only: id, title,
// status, cycle (when the file states one), canonical source, supersession headers,
// `superseded-by` / `updated-by` typed links from those headers, `references` links for
// every other ADR the file mentions, and a first-paragraph-of-Decision placeholder
// summary. The interpretive fields (a real summary; workflow point; mechanism; typed
// links with note text) are the agent's to write afterwards. Never overwrites a record.
//
//   node tools/substrate/index-legacy.js [--decisions <dir>] [--substrate <dir>] [--only NNN,NNN]

const fs = require('node:fs');
const path = require('node:path');
const { DERIVED_HEADER_PREFIX } = require('./derive.js');

function parseArgs(argv) {
  const cwd = process.cwd();
  const o = { decisions: path.join(cwd, 'docs', 'decisions'), substrate: path.join(cwd, 'docs', 'substrate'), only: null };
  for (let i = 0; i < argv.length; i += 1) {
    if (argv[i] === '--decisions') o.decisions = path.resolve(argv[++i]);
    else if (argv[i] === '--substrate') o.substrate = path.resolve(argv[++i]);
    else if (argv[i] === '--only') o.only = new Set(argv[++i].split(','));
    else { process.stderr.write(`unknown option ${argv[i]}\n`); process.exit(2); }
  }
  return o;
}

function firstParagraphOfDecision(text) {
  const m = /\n## Decision\s*\n([\s\S]*?)(?=\n## |\s*$)/.exec(text);
  if (!m) return '';
  const paras = m[1].split(/\n\s*\n/).map((p) => p.trim()).filter((p) => p && !p.startsWith('#'));
  return (paras[0] || '').replace(/\s+/g, ' ');
}

function scaffold(file, decisionsLabel) {
  const text = fs.readFileSync(file, 'utf8');
  const lines = text.split('\n');
  if (lines[0].startsWith(DERIVED_HEADER_PREFIX)) return null; // derived: has a full record already
  const name = path.basename(file, '.md');
  const num = /^adr-(\d{3})-/.exec(name);
  if (!num) return null;
  const id = `adr-${num[1]}`;
  const title = (/^# ADR-\d{3}:\s*(.+)$/m.exec(text) || [])[1] || name;
  const status = (/^\*\*Status:\*\*\s*(.+)$/m.exec(text) || [])[1] || 'Proposed';
  const cycle = (/^\*\*Cycle:\*\*\s*(\S+)/m.exec(text) || [])[1];
  const supersession = [];
  const links = [];
  // Supersession headers are blockquotes above the Status line. Blockquotes later in
  // the body are quoted examples (an ADR describing the header it places on another
  // file) and must not be read as this file's own header.
  const statusIdx = lines.findIndex((l) => /^\*\*Status:\*\*/.test(l));
  const headerZone = statusIdx >= 0 ? lines.slice(0, statusIdx) : lines;
  for (const l of headerZone) {
    const h = /^>\s*\*\*(Superseded by|Updated by|Erratum|Deprecated)(?:\s+ADR-(\d{3}))?(?:\s+on)?\s+(\d{4}-\d{2}-\d{2})\.\*\*\s*(.*)$/.exec(l);
    if (!h) continue;
    const kind = { 'Superseded by': 'superseded-by', 'Updated by': 'updated-by', Erratum: 'erratum', Deprecated: 'deprecated' }[h[1]];
    const entry = { kind, date: h[3], text: h[4].trim() || h[1] };
    if (h[2]) entry.by = `adr-${h[2]}`;
    supersession.push(entry);
    if (h[2]) links.push({ type: kind, target: `adr-${h[2]}`, note: h[4].trim().slice(0, 300) || `${h[1]} ADR-${h[2]}` });
  }
  const mentioned = new Set([...text.matchAll(/\bADR-(\d{3})\b/g)].map((m) => `adr-${m[1]}`));
  mentioned.delete(id);
  for (const t of [...mentioned].sort()) {
    if (!links.some((l) => l.target === t)) links.push({ type: 'references', target: t });
  }
  const rec = { id, type: 'adr', form: 'index', title, status };
  if (cycle) rec.cycle = cycle.replace(/[^0-9A-Za-z.-]/g, '');
  rec.canonical_source = `${decisionsLabel}/${name}.md`;
  rec.summary = firstParagraphOfDecision(text) || `[scaffold] ${title}`;
  rec.compressed = true;
  if (supersession.length) rec.supersession = supersession;
  rec.links = links;
  return rec;
}

function main() {
  const o = parseArgs(process.argv.slice(2));
  const outDir = path.join(o.substrate, 'adr');
  fs.mkdirSync(outDir, { recursive: true });
  const rel = path.relative(process.cwd(), o.decisions).split(path.sep).join('/') || 'docs/decisions';
  let written = 0, skipped = 0;
  for (const f of fs.readdirSync(o.decisions).sort()) {
    const m = /^adr-(\d{3})-.*\.md$/.exec(f);
    if (!m) continue;
    if (o.only && !o.only.has(m[1])) continue;
    const target = path.join(outDir, `adr-${m[1]}.json`);
    if (fs.existsSync(target)) { skipped += 1; continue; }
    const rec = scaffold(path.join(o.decisions, f), rel);
    if (!rec) { skipped += 1; continue; }
    fs.writeFileSync(target, JSON.stringify(rec, null, 2) + '\n');
    written += 1;
    process.stdout.write(`scaffolded ${path.relative(process.cwd(), target)}\n`);
  }
  process.stdout.write(`${written} scaffolded, ${skipped} skipped (existing record or derived file)\n`);
}

if (require.main === module) main();
module.exports = { scaffold };
