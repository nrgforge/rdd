'use strict';
// Surface Deriver → Record Validator boundary (in-process): a fixture Substrate with one
// unnoted link makes derive exit 1, write nothing, and echo the validator's message.
const test = require('node:test');
const assert = require('node:assert/strict');
const path = require('node:path');
const { scratchCorpus, runDerive, readJson, writeJson, listFiles, read } = require('./_helpers.js');
const { validateAll } = require('../validate.js');

test('derive refuses an invalid Substrate: exit 1, nothing written, stderr is the validator verdict', () => {
  const c = scratchCorpus();
  const p = path.join(c.substrate, 'adr', 'adr-098.json');
  const rec = readJson(p);
  delete rec.links[1].note; // continues-discussion-of → adr-097 loses its note
  writeJson(p, rec);
  const expected = validateAll(c.substrate);
  assert.equal(expected.ok, false);

  const r = runDerive(c);
  assert.equal(r.status, 1);
  assert.deepEqual(listFiles(c.views), []);
  assert.deepEqual(listFiles(c.decisions), []);
  assert.match(read(c.domainModel), /Stale Row/); // region untouched
  const expectedLine = `${expected.errors[0].path}: ${expected.errors[0].field}: ${expected.errors[0].message}`;
  assert.ok(r.stderr.includes(expectedLine), `stderr should carry the validator's line\n${r.stderr}`);
});

test('derive exits 2 when the substrate directory is missing', () => {
  const c = scratchCorpus();
  c.substrate = path.join(c.root, 'nope');
  const r = runDerive(c);
  assert.equal(r.status, 2);
});
