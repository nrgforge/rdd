'use strict';
// Scenario: Regeneration is deterministic and single-source. Surface Views fitness: never hand-maintained.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { scratchCorpus, runDerive, read, readJson, writeJson, snapshot } = require('./_helpers.js');

test('two consecutive derives are byte-identical and --check exits 0', () => {
  const c = scratchCorpus();
  assert.equal(runDerive(c).status, 0);
  const first = { views: snapshot(c.views), decisions: snapshot(c.decisions), dm: read(c.domainModel) };
  assert.equal(runDerive(c).status, 0);
  const second = { views: snapshot(c.views), decisions: snapshot(c.decisions), dm: read(c.domainModel) };
  assert.deepEqual(second, first);
  const check = runDerive(c, ['--check']);
  assert.equal(check.status, 0, check.stderr + check.stdout);
  for (const content of Object.values(second.views)) {
    assert.ok(!content.includes('\r'), 'LF endings only');
    assert.ok(!/\b20\d\d-\d\d-\d\dT\d\d:/.test(content), 'no timestamps');
  }
});

test('a hand edit to a view makes --check exit 1 naming the file, and writes nothing', () => {
  const c = scratchCorpus();
  assert.equal(runDerive(c).status, 0);
  const p = path.join(c.views, 'adr-095.md');
  fs.appendFileSync(p, '\nhand edit\n');
  const before = snapshot(c.views);
  const r = runDerive(c, ['--check']);
  assert.equal(r.status, 1);
  assert.match(r.stdout + r.stderr, /adr-095\.md/);
  assert.deepEqual(snapshot(c.views), before);
});

test('--check reports a missing view and a stale view', () => {
  const c = scratchCorpus();
  assert.equal(runDerive(c).status, 0);
  fs.unlinkSync(path.join(c.views, 'adr-096.md'));
  fs.writeFileSync(path.join(c.views, 'adr-001.md'), 'stale\n');
  const r = runDerive(c, ['--check']);
  assert.equal(r.status, 1);
  assert.match(r.stdout + r.stderr, /adr-096\.md/);
  assert.match(r.stdout + r.stderr, /adr-001\.md/);
});

test('single-source: editing one record changes only the overview, its drill-in, the drill-ins of records linked to or from it, and its derived markdown', () => {
  const c = scratchCorpus();
  assert.equal(runDerive(c).status, 0);
  const before = snapshot(c.views);
  const p = path.join(c.substrate, 'adr', 'adr-096.json');
  const rec = readJson(p);
  rec.summary = 'EDITED SUMMARY for the single-source test.';
  writeJson(p, rec);
  assert.equal(runDerive(c).status, 0);
  const after = snapshot(c.views);
  const changed = Object.keys(after).filter((f) => after[f] !== before[f]).sort();
  // adr-096 links to the pattern and adr-094; adr-094 links back to adr-096. Nothing else touches it.
  assert.deepEqual(changed, ['adr-094.md', 'adr-096.md', 'overview.md', 'pattern-calibration-with-graduation-trigger.md']);
  // A stale view for a removed record is removed on the next derive.
  fs.unlinkSync(path.join(c.substrate, 'term', 'substrate.json'));
  assert.equal(runDerive(c).status, 0);
  assert.equal(fs.existsSync(path.join(c.views, 'term-substrate.md')), false);
});
