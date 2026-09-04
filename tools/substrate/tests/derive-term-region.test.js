'use strict';
// The docs/domain-model.md marked-region contract: only the text between the markers changes;
// missing markers → exit 1 naming the file; file unchanged.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const { scratchCorpus, runDerive, read, DOMAIN_MODEL_WITH_MARKERS } = require('./_helpers.js');

function outsideRegion(text) {
  const a = text.indexOf('<!-- substrate:terms:begin -->');
  const b = text.indexOf('<!-- substrate:terms:end -->');
  return text.slice(0, a) + text.slice(b);
}

test('derive rewrites only the marked region with one four-column row per term record', () => {
  const c = scratchCorpus();
  const before = read(c.domainModel);
  assert.equal(runDerive(c).status, 0);
  const after = read(c.domainModel);
  assert.equal(outsideRegion(after), outsideRegion(before));
  assert.ok(!after.includes('Stale Row'));
  const region = after.slice(after.indexOf('begin -->') , after.indexOf('<!-- substrate:terms:end'));
  assert.match(region, /\n\| Substrate \| The layer of structured records[^|]*\| "a graph behind a human-friendly format"[^|]*\| Surface View, Typed Link, Note Discipline \|\n/);
  assert.match(after, /\| Hand Row \|/);
  assert.match(after, /\| Another Hand Row \|/);
});

test('missing markers: exit 1 naming the file; file unchanged; nothing else written', () => {
  const c = scratchCorpus();
  const noMarkers = DOMAIN_MODEL_WITH_MARKERS.replace(/<!-- substrate:terms:(begin|end) -->\n/g, '');
  fs.writeFileSync(c.domainModel, noMarkers);
  const r = runDerive(c);
  assert.equal(r.status, 1);
  assert.match(r.stderr, /domain-model\.md/);
  assert.match(r.stderr, /marker/i);
  assert.equal(read(c.domainModel), noMarkers);
  assert.deepEqual(fs.readdirSync(c.views), []);
});

test('a project without a domain-model file is left alone', () => {
  const c = scratchCorpus({ domainModel: false });
  const r = runDerive(c);
  assert.equal(r.status, 0, r.stderr);
  assert.equal(fs.existsSync(c.domainModel), false);
});
