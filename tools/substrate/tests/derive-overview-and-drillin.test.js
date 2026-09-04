'use strict';
// Scenarios: Records with Typed Links derive to an overview and drill-in views;
// Drill-in view preserves focus+context; Surface View signals its own incompleteness.
const test = require('node:test');
const assert = require('node:assert/strict');
const path = require('node:path');
const { scratchCorpus, runDerive, read, listFiles } = require('./_helpers.js');

function derived() {
  const c = scratchCorpus();
  const r = runDerive(c);
  assert.equal(r.status, 0, r.stderr);
  return c;
}

test('overview lists the Pattern first, then ADRs by number, then terms; one drill-in per record', () => {
  const c = derived();
  const files = listFiles(c.views);
  assert.deepEqual(files, [
    'adr-094.md', 'adr-095.md', 'adr-096.md', 'adr-097.md', 'adr-098.md',
    'overview.md',
    'pattern-calibration-with-graduation-trigger.md',
    'term-substrate.md',
  ]);
  const overview = read(path.join(c.views, 'overview.md'));
  const pos = (s) => overview.indexOf(s);
  assert.ok(pos('Calibration-with-Graduation-Trigger Pattern') > 0);
  assert.ok(pos('Calibration-with-Graduation-Trigger Pattern') < pos('ADR-094'));
  assert.ok(pos('ADR-094') < pos('ADR-095'));
  assert.ok(pos('ADR-097') < pos('ADR-098'));
  assert.ok(pos('ADR-098') < pos('term-substrate.md'));
});

test('overview co-locates typed cross-references with each record\'s one-line summary, note text inline', () => {
  const c = derived();
  const overview = read(path.join(c.views, 'overview.md'));
  // ADR-097's entry carries its summary and its motivates link with the note text.
  const entryStart = overview.indexOf('### [ADR-097');
  const entryEnd = overview.indexOf('### [ADR-098');
  const entry = overview.slice(entryStart, entryEnd);
  assert.match(entry, /four paths|four grounding paths|PLAY evidence/);
  assert.match(entry, /`motivates`/);
  assert.match(entry, /ADR-098 applies this filter reflexively/);
  assert.match(entry, /\(adr-098\.md\)/); // link to the drill-in
});

test('drill-in for ADR-097 ends with Surrounding records naming every linked-to-or-from record with workflow point, mechanism, and a one-line summary, and links back to the overview', () => {
  const c = derived();
  const view = read(path.join(c.views, 'adr-097.md'));
  assert.match(view, /\]\(overview\.md\)/);
  const idx = view.indexOf('## Surrounding records');
  assert.ok(idx > 0, 'Surrounding records section present');
  const footer = view.slice(idx);
  assert.ok(view.trim().endsWith(footer.trim()), 'Surrounding records is the last section');
  // Outgoing: pattern, adr-098, adr-095. Incoming: adr-098 (continues-discussion-of), adr-095 (shares-structural-limit-with), pattern (applied-by), term-substrate (defined-by).
  for (const id of ['pattern-calibration-with-graduation-trigger', 'adr-095', 'adr-098', 'term-substrate']) {
    assert.ok(footer.includes(`(${id}.md)`), `footer names ${id}`);
  }
  assert.ok(!footer.includes('(adr-094.md)'), 'adr-094 is not linked to or from adr-097');
  assert.match(footer, /workflow point: methodology audit coverage/);
  assert.match(footer, /mechanism: named deferral/);
  assert.match(footer, /FF1 \(practitioner-originated framing absorption\)/); // adr-098 one-line summary
  // External / invariant targets are shown but not linked as views.
  assert.ok(!footer.includes('invariant-0.md'));
});

test('an index record\'s drill-in carries the compressed marker naming the canonical source in its first ten lines', () => {
  const c = derived();
  const view = read(path.join(c.views, 'adr-094.md'));
  const head = view.split('\n').slice(0, 10).join('\n');
  assert.match(head, /compressed index/);
  assert.match(head, /docs\/decisions\/adr-094-audit-round-count-convergence-saturation\.md/);
  assert.match(head, /canonical/);
  // A full record's drill-in carries no compressed marker.
  const full = read(path.join(c.views, 'adr-097.md'));
  assert.ok(!/compressed index/.test(full));
});

test('a full ADR drill-in renders nested sub-decisions as ### sub-sections under Decision', () => {
  const c = derived();
  const view = read(path.join(c.views, 'adr-097.md'));
  const decision = view.indexOf('## Decision');
  const rejected = view.indexOf('## Rejected alternatives');
  assert.ok(decision > 0 && rejected > decision);
  const body = view.slice(decision, rejected);
  assert.match(body, /\n### Target 2: Discriminating criterion\n/);
  assert.match(body, /\n### Target 3: Standalone at commitment time\n/);
  assert.match(body, /Rationale/);
});
