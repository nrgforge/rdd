# Integration Verification — Cycle 020 BUILD

**Verified:** 2026-09-04
**Cycle:** 020 — *Corpus Topology and Agent-Navigable Compaction*
**BUILD mode:** auto (per ADR-091; carried DECIDE-gate default, not overridden)
**Target release:** v0.9.0
**Method:** `node --test 'tools/substrate/tests/*.test.js'` (29 cases), `hooks/tests/run_tests.sh` (21 tests), the toolchain run on this corpus (Step 5.5), `git diff` against the cycle-start commit `5edafc5`, and skill-text grep.

---

## Summary

| WP | Title | Status | Verification |
|----|-------|--------|--------------|
| A | Hook defect fix and stale-path corrections | ✅ Complete (`8c47e80`) | Two new fixtures in `test_output_path_regex.sh` pass; nine prior fixtures unchanged; `docs/essays/audits/` gone from Decide and Conform example paths (and from the evaluator agent at WP-H). |
| B | Substrate schemas and Record Validator | ✅ Complete (`7ab4260`) | `validate-fixture-corpus.test.js` 11 cases: Note Discipline names record and link; per-type required fields; extensible link types; nested sub-decisions; identity; resolution; exit codes 0/1/2; zero dependencies. |
| C | Surface Deriver | ✅ Complete (`856028f`) | Five test files, 18 cases: refuses invalid (boundary test, in-process validator verdict echoed); overview order and co-located cross-refs; Surrounding records footer and back-link; compressed marker in first ten lines; nested sub-decisions as `###`; derived ADR header and section order; hand edit does not survive; `--replace` refusal; legacy file byte-identical; marked region only; missing markers exit 1; determinism; `--check` on hand edit, missing, and stale views; single-source change set. |
| D | First corpus; ADR-099/100 as records; Cycle 020 terms | ✅ Complete (`11a7743`) | Pattern + 12 index + 2 full + 9 term records validate; `derive --replace` once; heading sets identical (ADR-099) / plus `### Graduation trigger` (ADR-100); rejected-alternative counts 8 and 9 identical; narrow audit R1 on the derived form: P1 = 0, P2 = 1, P3 = 3, TRIGGERED (`.rdd/audits/argument-audit-decide-020-derived-r1.md`); findings integrated at WP-E; single-purpose re-audit R2 dispatched (`argument-audit-decide-020-derived-r2.md`). |
| E | Legacy index records 001–093, cost measured | ✅ Complete (`74848df`) | 100 ADR records (2 full, 98 index); 389 links, 295 typed with notes, 42 link types; every `ADR-NNN` mention resolves; validator exit 0; cost recorded in cycle-status §From BUILD. |
| F | ADR-099 skill-text steps | ✅ Complete (`5fc38a0`) | `grep -n "validate.js\|derive.js"` hits Decide Step 2 (record-first authoring, in that order, with the record path template and the `tools/substrate/` presence branch), Decide Step 5 (phase-exit derive and `--check`), Model Step 2 and phase exit, Conform Drift Detection Step 2; orchestrator Artifacts Summary and tier list carry `substrate/` and `views/`. |
| G | ADR-100 orchestrator and gate text | ✅ Complete (`58b50f3`) | Orchestrator Stage Gates step 4 Pre-triage; presentation rule in step 6; gate-note template triage sections; Question Toolkit agent-first pass; six phase-skill Decide-step pointers; Research loop-end and Step 4b triage headings. Hook suite green after the edit. |
| H | ADR-100 snapshot briefs and evaluator | ✅ Complete (`92f6bb4`) | `grep -l "Triage record:" skills/*/SKILL.md` → 8; every `Output path:` line unchanged in form and position; evaluator has the triage-record Input, Process step 3, and `## Triage evaluation` output; hook suite green. |
| I | ADR-100 grounding lit-review | ✅ Complete (`9fcb6ba`) | `docs/essays/research-logs/lit-review-020-triage-and-escalation.md`; 22 verified sources; recommendations classified confirms / tightens / adds / moves and carried to the next DECIDE. |
| J | Sweep, Step 5.5, integration verification, v0.9.0 | ✅ This artifact + release housekeeping | Step 5.5 below; field guide, system-design pair (Amendment #19), ORIENTATION, CHANGELOG, roadmap migration, cycle-status; BUILD gate note and snapshot. |

---

## Step 5: Integration Verification (real neighbors, not stubs)

| Boundary | Test | Result |
|---|---|---|
| Surface Deriver → Record Validator | `derive-refuses-invalid.test.js`: real records cross the in-process boundary; the deriver's stderr carries the validator's exact line | ✅ |
| Record Validator → Substrate | `validate-fixture-corpus.test.js` against real fixture files, and `node tools/substrate/validate.js` against the real corpus (100 ADR + 1 pattern + 9 term records) | ✅ exit 0 |
| Surface Deriver → Surface Views | `derive-overview-and-drillin.test.js` and the real corpus: 110 drill-ins + overview; every index drill-in carries the compressed marker within ten lines; every drill-in has `## Surrounding records` and a link to `overview.md` | ✅ |
| Surface Deriver → derived ADR markdown | `derive-adr-markdown.test.js` and the real corpus: `adr-099-*.md` and `adr-100-*.md` begin with the deriver header; no other file under `docs/decisions/` written (`git diff --stat` on ADR-001–098 empty) | ✅ |
| Surface Deriver → `domain-model.md` region | `derive-term-region.test.js` and the real corpus: `git diff 5edafc5 -- docs/domain-model.md` outside the markers is empty | ✅ |
| Surface Deriver (determinism) | `derive-deterministic.test.js` and the real corpus: `derive` then `derive --check` exits 0 | ✅ |
| Decide / Model / Conform Skill → toolchain (skill text) | grep as in the WP-F row | ✅ |
| Orchestrator → Gate Reflection Note | `.rdd/gates/020-build-gate.md` carries the triage tables (engine dispositions; argument audit; snapshot after dispatch) | ✅ (snapshot section added at the gate) |
| Phase Skill → Susceptibility Snapshot Evaluator | hook suite green on the amended briefs; the BUILD snapshot's `## Triage evaluation` section is inspected when it lands | ✅ / pending dispatch |
| Tier 1 Verify Dispatch Hook → Dispatch Log | new fixtures; `.rdd/dispatch-log.jsonl` entries written this session carry clean paths | ✅ |
| Lifecycle / shared mutable state | The deriver returns nothing that aliases the validator's records; `plan()` builds a fresh output map per run; no cache, pool, or retained mutable reference crosses a boundary | n/a (no shared mutable state) |

## Step 5.5: Cycle Acceptance Criteria Table

| Criterion | Layer-match | What was done | Result |
|---|---|---|---|
| Row 1 — "The corpus you don't have to read, backed by the corpus the agent needs" (ADR-099) | no (sample verified by scenarios; corpus scale is BUILD 5.5 and PLAY) | `node tools/substrate/validate.js && node tools/substrate/derive.js && node tools/substrate/derive.js --check` on this repository: exit 0, 0, 0. `git diff --stat docs/decisions/adr-0{01..98}-*.md`: empty. `docs/views/overview.md` (1,179 lines; 110 entries: 1 pattern, 100 ADRs of which 2 full and 98 compressed index, 9 terms) is presented to the practitioner as the BUILD-gate read. | Corpus half verified mechanically; the practitioner's read is the gate's ruling; PLAY on re-entry remains the specified layer's second half |
| Row 2 — "Fewer decisions handed back per loop" (ADR-100) | no (multi-cycle observation and PLAY) | First-cycle evidence recorded from the BUILD gate's triage record: findings produced during BUILD (engine table 14 rows; argument audit 6 rows; lit-review 10 recommendations; snapshot rows) versus rulings requested at the gate (one pivot; route defaults with alternatives). Recorded in cycle-status §From BUILD for the ADR-100 graduation trigger. | Recorded; not verifiable this cycle |

## Cycle 020 Fitness Criteria

| Criterion | Check | Result |
|---|---|---|
| Toolchain has zero dependencies and one runtime | no `node_modules` under `tools/`; no `package.json`; every `require` targets `node:` or a sibling (asserted by `validate-fixture-corpus.test.js`) | ✅ |
| Derivation is deterministic | `derive` twice byte-identical (test); `derive --check` exit 0 on the real corpus | ✅ |
| Legacy files are never written | `git diff --stat` on ADR-001–098 files after every derive this session: empty | ✅ |
| Only the marked region of `domain-model.md` changes | diff outside the markers vs `5edafc5`: empty | ✅ |
| Note Discipline is enforced | validator exit 1 naming record and `links[i]` (test case; message names the link type and target) | ✅ |
| Schemas are per-type | shared required set = `id`, `type`, `title`, `links`; `rejected_alternatives` required by `adr` full only | ✅ |
| Sub-decisions nest | fixture ADR-097 (two sub-decisions) validates and renders `###` sub-sections; real ADR-099 §Authority renders with options A–E | ✅ |
| Index records are marked | 98 of 98 index drill-ins carry the marker in the first ten lines | ✅ |
| Focus+context at drill-in | 110 of 110 drill-ins have Surrounding records and the overview link | ✅ |
| Zero hook changes beyond the defect fix | `git diff --stat 5edafc5 -- hooks/`: only `tier1-verify-dispatch.sh` and `test_output_path_regex.sh` | ✅ |
| Manifest unchanged | `git diff 5edafc5 -- hooks/manifests/tier1-phase-manifest.yaml`: empty | ✅ |
| Centered/infrastructure categories not split | no substrate or view file under `.rdd/`; all under `docs/` | ✅ |
| Every phase-skill brief names the triage record | 8 files | ✅ |
| Dispatch-prompt discipline preserved | hook suite 21/21 after the brief edits | ✅ |
| Gate note carries the triage section | `020-architect-gate.md` and `020-build-gate.md` (this cycle's gates from architect onward) | ✅ |
| Pivot count per gate | BUILD gate presentation: one ruling requested | ✅ (at the gate) |
| No bare identifiers in a presented pivot | gate presentation composed with every citation glossed inline | ✅ (at the gate) |
| Legacy index authoring cost is measured | cycle-status §From BUILD | ✅ |
| ADR-099/100 form change preserves audit-substance | heading sets identical (ADR-099) / plus `### Graduation trigger` (ADR-100, disclosed); rejected-alternative counts identical; R1 on the new form P1 = 0 | ✅ |
| Ownership concentration is stated | Amendment #19 moved no responsibility between modules; the ARCHITECT counts stand | ✅ |

## Discoveries recorded as Design Amendment #19

In-corpus link targets must resolve; `slug` required on full ADR records; optional `additional_sections`; optional titles on sub-decisions and options; term rows in id order; stale views removed and reported; the `index-legacy.js` scaffold; Play and Synthesize non-gate triage instruction; derived ADR-100 gains `### Graduation trigger`; test invocation glob. All presented at the BUILD gate as route defaults.
