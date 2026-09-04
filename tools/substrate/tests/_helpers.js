'use strict';
// Shared helpers for the Surface Deriver tests. Not a test file (no .test.js suffix).
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const HERE = __dirname;
const DERIVE = path.join(HERE, '..', 'derive.js');
const FIXTURE = path.join(HERE, 'fixtures', 'cycle-019');

// A scratch corpus: substrate copied from the fixture; empty views and decisions dirs;
// a small domain-model file with the term markers and surrounding hand text.
function scratchCorpus({ domainModel = true } = {}) {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'substrate-corpus-'));
  const substrate = path.join(root, 'substrate');
  fs.cpSync(FIXTURE, substrate, { recursive: true });
  const views = path.join(root, 'views');
  const decisions = path.join(root, 'decisions');
  fs.mkdirSync(views);
  fs.mkdirSync(decisions);
  const dm = path.join(root, 'domain-model.md');
  if (domainModel) fs.writeFileSync(dm, DOMAIN_MODEL_WITH_MARKERS);
  return { root, substrate, views, decisions, domainModel: dm };
}

const DOMAIN_MODEL_WITH_MARKERS = [
  '# Domain Model (fixture)',
  '',
  '## Concepts (Nouns)',
  '',
  '| Term | Definition | Related Terms |',
  '|------|-----------|---------------|',
  '| Hand Row | A hand-maintained legacy row that must not change. | Substrate |',
  '<!-- substrate:terms:begin -->',
  '| Stale Row | Whatever was here before derivation. | — |',
  '<!-- substrate:terms:end -->',
  '| Another Hand Row | Also hand-maintained. | — |',
  '',
  '## Actions (Verbs)',
  '',
].join('\n') + '\n';

function runDerive(corpus, extra = []) {
  const args = [DERIVE,
    '--substrate', corpus.substrate,
    '--views', corpus.views,
    '--decisions', corpus.decisions,
    '--domain-model', corpus.domainModel,
    ...extra];
  return spawnSync(process.execPath, args, { cwd: corpus.root, encoding: 'utf8' });
}

function read(p) { return fs.readFileSync(p, 'utf8'); }
function readJson(p) { return JSON.parse(fs.readFileSync(p, 'utf8')); }
function writeJson(p, v) { fs.writeFileSync(p, JSON.stringify(v, null, 2) + '\n'); }
function listFiles(dir) { return fs.readdirSync(dir).sort(); }
function snapshot(dir) {
  const out = {};
  for (const f of listFiles(dir)) out[f] = read(path.join(dir, f));
  return out;
}

module.exports = { DERIVE, FIXTURE, scratchCorpus, runDerive, read, readJson, writeJson, listFiles, snapshot, DOMAIN_MODEL_WITH_MARKERS };
