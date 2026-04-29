# Conformance Scan Report — Cycle 017 DECIDE Phase

**Scanned against:** ADR-083, ADR-084, ADR-085, ADR-086, ADR-087, ADR-088, ADR-089, ADR-090  
**Codebase:** `/Users/nathangreen/Development/rdd/`  
**Date:** 2026-04-27  
**Scanner:** Conformance Scanner Agent (rdd:conformance-scanner), Cycle 017 DECIDE

---

## Summary

- **ADRs checked:** 8
- **Fully conforming (zero structural debt):** 3 (ADR-083, ADR-086, ADR-087 — non-implementation ADRs whose conformance criteria are documentation and future skill edits)
- **Violations / debt items found:** 18

The scan distinguishes three classes of finding: **structural debt** (blocks downstream phases if unaddressed), **wrong-structure** (right behavior, wrong path or wrong claim), and **informational** (baseline observations that inform scenario writing with no immediate correctness risk).

---

## Conformance Debt Table

| # | ADR | Violation | Type | Location | Severity | Resolution |
|---|-----|-----------|------|----------|----------|------------|
| 1 | ADR-085 | `tier1-phase-manifest-check.sh` hardcodes `CYCLE_STATUS_POST = docs/housekeeping/cycle-status.md`, `DISPATCH_LOG = docs/housekeeping/dispatch-log.jsonl`, `MIGRATION_MARKER = docs/housekeeping/.migration-version` — all pre-migration paths. ADR-085 prescribes `.rdd/cycle-status.md`, `.rdd/dispatch-log.jsonl`, `.rdd/.migration-version` post-migration. | wrong-structure | `hooks/scripts/tier1-phase-manifest-check.sh:19,27,28` | Structural debt (blocks `.rdd/` migration; hooks will not find artifacts post-migration until updated) | BUILD WP: path substitution pass on hook scripts when `migrate-to-rdd` subcommand runs. ADR-085 §5 specifies the hooks consume manifest-driven paths — but these three are hardcoded. |
| 2 | ADR-085 | `tier1-verify-dispatch.sh` hardcodes `DISPATCH_LOG = docs/housekeeping/dispatch-log.jsonl` | wrong-structure | `hooks/scripts/tier1-verify-dispatch.sh:23` | Structural debt | Same BUILD WP as #1; the dispatch log write path must update to `.rdd/dispatch-log.jsonl` post-migration. |
| 3 | ADR-085 | `tier1-phase-manifest.yaml` contains 20 `path_template` values all pointing to `docs/housekeeping/audits/` and `docs/housekeeping/gates/`. ADR-085 §5 commits to updating manifest `path_template` values as part of the migration. | wrong-structure | `hooks/manifests/tier1-phase-manifest.yaml` (20 entries, lines ~37–314) | Structural debt | BUILD WP: `migrate-to-rdd` migration substitutes `docs/housekeeping/` → `.rdd/` throughout the manifest. This is the single highest-priority file for the path migration. |
| 4 | ADR-085 | All 10 phase skill files (`skills/*/SKILL.md`) contain `Output path: docs/housekeeping/audits/...` and `Output path: docs/housekeeping/gates/...` dispatch instructions. ADR-085 §6 commits to skill text update in lockstep. | wrong-structure | `skills/rdd/SKILL.md` (3 refs), `skills/conform/SKILL.md` (26 refs), `skills/decide/SKILL.md` (2 refs), `skills/research/SKILL.md` (4 refs), `skills/discover/SKILL.md` (1 ref), `skills/model/SKILL.md` (1 ref), `skills/architect/SKILL.md` (1 ref), `skills/build/SKILL.md` (1 ref), `skills/play/SKILL.md` (1 ref), `skills/synthesize/SKILL.md` (3 refs) | Structural debt | BUILD WP: path substitution pass on all skill files is part of the `migrate-to-rdd` migration operation. The `conform/SKILL.md` carries the most references and also describes the ADR-070 `migrate` subcommand — it needs the `migrate-to-rdd` subcommand text added alongside. |
| 5 | ADR-085 | `system-design.md` contains ~59 references to `docs/housekeeping/` paths in architectural drivers, module decomposition, and integration protocol sections — including the Stop hook module's `Owns:`, `Depends on:`, and the susceptibility snapshot integration contract. ADR-085 §7 defers this sweep to ARCHITECT but records it as a known deferred obligation. | wrong-structure | `docs/system-design.md` (59 refs) | Informational (deferred-sweep recorded in ADR-085 — not a surprise; conformance debt, not a defect) | ARCHITECT phase: system-design.md regeneration folds in the `.rdd/` path substitution per ADR-085 downstream-artifact sweep table. |
| 6 | ADR-085 | `docs/ORIENTATION.md` Section "How the Artifacts Fit Together" references `housekeeping/` (without `docs/` prefix but same semantic intent) at line 78. ADR-085 §7 commits that ORIENTATION.md Section 4 gains the process-vs-product distinction sentence and updates path references to `.rdd/`. This sweep is deferred to ARCHITECT. | wrong-structure | `docs/ORIENTATION.md:78` | Informational (deferred-sweep, same status as system-design.md) | ARCHITECT phase: ORIENTATION.md regeneration. |
| 7 | ADR-085 | `docs/domain-model.md` has 1 direct `docs/housekeeping/` path reference (Amendment 18 narrative at line 865) plus the Compound Check concept's definition does not yet mention the post-migration `.rdd/` placement. ADR-085 §4 (migration mechanics) lists `domain-model.md` as a sweep target; ADR-085's downstream-artifact table defers this to "ARCHITECT amendment-log entry." | wrong-structure | `docs/domain-model.md:865` | Informational (deferred-sweep, recorded in ADR-085) | ARCHITECT phase: Amendment Log entry for ADR-085 supersession updates the one path reference. |
| 8 | ADR-085 | 8 hook test fixture files contain `docs/housekeeping/` paths in inline YAML manifests, `make_snapshot` calls, and `make_gate` calls. While tests are not production paths, the test harness will be broken post-migration unless the fixtures update. Not listed in ADR-085's sweep targets. | exists (should not after migration) | `hooks/tests/test_nominal.sh:39-40`, `hooks/tests/test_in_progress_phase.sh:24,31`, `hooks/tests/test_applicable_when.sh:23,68,95,122,148,177,193,196,197`, `hooks/tests/test_in_progress_gate.sh:17,18,31,40`, `hooks/tests/lib.sh:39,40,67,75,116`, `hooks/tests/test_multi_entry_stack.sh:15,16`, `hooks/tests/test_output_path_regex.sh:71` | Structural debt (test suite will fail post-migration; migration correctness unverifiable) | BUILD WP: test fixtures must update alongside production files. Gap in ADR-085's sweep scope — needs a scenario asserting test-fixture migration is included. |
| 9 | ADR-085 | Transition state inconsistency: `docs/housekeeping/.migration-version` = `0.7.1` (ADR-070 migration has run); `docs/housekeeping/` contains audits, gates, dispatch log, and .migration-version — but `cycle-status.md` is at `docs/cycle-status.md`, not `docs/housekeeping/cycle-status.md`. ADR-070's migration was supposed to move cycle-status to `docs/housekeeping/` (ADR-070 Table entry row 3: `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`). The hook handles this via fallback (`CYCLE_STATUS_PRE`), so it is not a runtime defect — but ADR-085 prescribes `.rdd/cycle-status.md` post-migration and the current state is neither the `docs/housekeeping/` target nor the `.rdd/` target. | wrong-structure | `docs/cycle-status.md` (present), `docs/housekeeping/cycle-status.md` (absent despite migration marker 0.7.1) | Informational (runtime-safe due to hook fallback; but the ADR-070 migration appears to have run partially — cycle-status was not moved to housekeeping) | ARCHITECT / BUILD WP: before running `migrate-to-rdd`, confirm whether `cycle-status.md` should first be moved to `docs/housekeeping/` (completing the ADR-070 migration) or whether `migrate-to-rdd` should handle both in one pass. Document the migration order in the scenario. |
| 10 | ADR-088 / ADR-089 | `system-design.md` Stop Hook module at line 392 reads: "Emits `block` on failure to prevent phase completion without Tier 1 verification." Line 397 reads: "phase transitions blocked on enforcement-mode compound check failures." Line 939 reads: "emits block with specific reason on failure in enforcement mode." Line 1184 reads: "Emit `block` with a specific reason in enforcement mode ... on failure." ADR-088 §1 commits that the check "does not block under any condition" as of v0.8.3. ADR-089 commits that system-design.md is in the deferred downstream sweep (ARCHITECT). The gap is real but the sweep is recorded. | wrong-structure | `docs/system-design.md:392,397,939,1184` | Informational (deferred-sweep per ADR-088 and ADR-089; same ARCHITECT phase resolution) | ARCHITECT phase: system-design.md Stop Hook module `Purpose:`, `Depended on by:`, and dependency graph entries must update to advisory language. Merge with the ADR-085 path substitution pass for efficiency. |
| 11 | ADR-088 / ADR-089 | `system-design.md` Architectural Drivers table at line 86 states: "Compound check (PostToolUse dispatch log + Stop manifest cross-reference) is the only structural defense against sophisticated State C fabrication — and only in enforcement mode." ADR-088 §5 amends this to "structurally detectable" not "structurally impossible / only structural defense." | wrong-structure | `docs/system-design.md:86` | Informational (deferred-sweep, ARCHITECT phase) | ARCHITECT phase: update the driver row to "Compound check makes sophisticated State C structurally detectable; the agent cannot inject hook events, so fabrication is detectable via dispatch-log cross-reference. Advisory disposition (v0.8.3)." |
| 12 | ADR-088 / ADR-089 | `system-design.md` Orchestrator module `Owns:` text at lines 124 reads: "the enforcement-mode qualification on the compound check's structural guarantee — the compound check's structural impossibility of sophisticated State C applies only in enforcement mode." ADR-088 §5 amends "impossibility" to "detectability." | wrong-structure | `docs/system-design.md:124` | Informational (deferred-sweep, ARCHITECT phase) | ARCHITECT phase: update the impossibility → detectability language in the Orchestrator module Owns. |
| 13 | ADR-088 / ADR-089 | `domain-model.md` Compound Check concept at line 175 reads: "State C then requires fabricating both the artifact AND inducing a fake PostToolUse event — structurally impossible because the agent cannot inject hook events." ADR-088 §5 and ADR-089 §3 amend this to "structurally detectable." ADR-088/089 both direct this as a MODEL Amendment 22 item. No Amendment 22 exists yet in domain-model.md. | missing | `docs/domain-model.md` Amendment Log (no entry for Amendment 22) | Structural debt (ADR-088 and ADR-089 both explicitly name this as an in-DECIDE amendment target: "domain-model.md — At MODEL Amendment 22 in this cycle") | DECIDE phase (this cycle): Amendment 22 must land before cycle advances to ARCHITECT. Concepts to update: Compound Check (structurally detectable, not impossible), Harness Layer (advisory detection rather than blocking enforcement). |
| 14 | ADR-088 / ADR-089 | `skills/rdd/SKILL.md` line 367 reads: "The compound check's structural guarantee against sophisticated State C holds only in enforcement mode (post-migration corpora with `docs/housekeeping/.migration-version`)." This retains the "structural guarantee" language and the old path. Post-ADR-088, the correct framing is "structural detectability" not "guarantee." The path reference is also an ADR-085 debt item. | wrong-structure | `skills/rdd/SKILL.md:367` | Wrong-structure | BUILD WP: update the orchestrator skill's description to "structural detectability" language and update the path reference. This is a skill-text edit, not a migration-automation target. |
| 15 | ADR-084 | `docs/system-design.md` does not have an F-pattern orientation lead; its first content after the title block is immediately the "## Architectural Drivers" table with no human-facing orientation paragraph. ADR-084 commits that the human-facing `system-design.md` "retains the diagram and adds an F-pattern orientation lead and brief module summaries with cross-references to the companion file." `system-design.md` currently has no diagram and no F-pattern lead. | missing | `docs/system-design.md` (1,692 lines; no orientation lead; no diagram in the file) | Structural debt (ADR-084 Pattern B cannot be evaluated until the restructuring exists; the baseline is not conformant with what the ADR prescribes) | ARCHITECT phase: ADR-084 §3 commits this restructuring as ARCHITECT scope. The conformance scan establishes the baseline: system-design.md currently has no F-pattern lead and no companion file. ARCHITECT must (a) add the F-pattern orientation lead, (b) produce `system-design.agents.md`, (c) move agent-context-dominant sections there, (d) update cross-references. |
| 16 | ADR-084 | No `system-design.agents.md` companion file exists anywhere in the corpus. ADR-084 Pattern B commits this file to a name-derived predictable path (`system-design.agents.md` sibling of `system-design.md`). | missing | `docs/system-design.agents.md` (does not exist) | Structural debt | ARCHITECT phase: companion file creation is the primary ARCHITECT deliverable for ADR-084. |
| 17 | ADR-087 | `skills/research/SKILL.md` has no step at the research → discover gate that names the validation-spike trigger condition or asks the spike-or-no-spike question with rationale. ADR-087 §3 commits: "The `/rdd-research` skill gains an explicit step at the research → discover gate where the trigger condition is named." The research → discover gate currently ends at Step 6 (archive research log) and the NEXT PHASE section — no validation-spike decision point exists. | missing | `skills/research/SKILL.md` (no validation-spike step between the EPISTEMIC GATE section and the Phase Boundary: Susceptibility Snapshot Dispatch section) | Structural debt (the ADR commits this as a BUILD-phase skill-text edit, but it is missing from the current baseline — scenario writing must include this as a `refactor:` commit target) | BUILD WP: add a step between the EPISTEMIC GATE and the Susceptibility Snapshot Dispatch sections in research/SKILL.md that names the trigger condition and the spike-or-no-spike decision with rationale-recording. |
| 18 | ADR-083 | No current skill text (graduate, conform, build, decide) has a structural anchor for the Outcome Test — no step that names the moment a candidate human-facing artifact is proposed and asks the test. ADR-083 §6 explicitly encodes the test at methodology-principle level (not invariant), names the test as Tier 2 (judgment-applied), and holds structural anchoring as a future-cycle scope item. The absence is per-design, not a defect. | informational (by design) | All skill files — `skills/graduate/SKILL.md`, `skills/conform/SKILL.md`, `skills/build/SKILL.md` | Informational | No remediation required in Cycle 017. ADR-083 §6 explicitly defers structural anchoring. Record as a future-cycle candidate (invariant elevation path: find a skill step where the Outcome Test would naturally fire; evaluate whether `/rdd-graduate` or `/rdd-conform` is the right anchor). |

---

## Scope-Item Findings by ADR (narrative)

### Scope 1 — ADR-085 Path-Substitution Debt

The `.rdd/` migration has not run. The corpus is currently in the ADR-070-migrated state (`docs/housekeeping/` with `.migration-version` = `0.7.1`), but `cycle-status.md` was not moved to `docs/housekeeping/` as ADR-070 prescribed — it remains at `docs/cycle-status.md`. The hook handles this via fallback logic and the cycle continues to function correctly, but the partial ADR-070 migration state should be confirmed before the ADR-085 `migrate-to-rdd` operation runs.

**File count with `docs/housekeeping/` references:**

| Category | Files affected | Reference count |
|----------|---------------|----------------|
| Hook scripts | 2 | 6 |
| Hook manifest | 1 | 20 |
| Hook test fixtures | 8 | ~30 |
| Skill files | 10 | 43 |
| `system-design.md` | 1 | 59 |
| `ORIENTATION.md` | 1 | 1 |
| `domain-model.md` | 1 | 1 |

Total: approximately 160 reference-bearing locations. The migration operation is mechanical but the diff will be large. ADR-085 §4 notes this explicitly.

**Critical gap not in ADR-085's sweep list:** hook test fixtures (8 files under `hooks/tests/`). Post-migration, the test harness will fail because its inline manifest YAML, `make_snapshot`, and `make_gate` calls still construct `docs/housekeeping/` paths. This must be added to the BUILD WP's scope.

### Scope 2 — ADR-084 system-design.md Restructuring Baseline

`system-design.md` is 1,692 lines. Its current structure opens immediately with the "Architectural Drivers" table — no orientation paragraph, no diagram. The agent-context-dominant material (module decompositions with full `Owns:` / `Depends on:` / `Depended on by:` / `Note:` entries) comprises the bulk of the file and is the material ADR-084 commits to relocating to `system-design.agents.md`. No companion file exists. ARCHITECT inherits a clear baseline: the current `system-design.md` is entirely in the pre-Pattern-B state (single unified file, mixed audience, no F-pattern lead, no companion).

### Scope 3 — ADR-088 / ADR-089 Hook-Script and Manifest Behavior Debt

The implementation (v0.8.3) is already advisory-only. `tier1-phase-manifest-check.sh` lines 521–548 confirm the advisory demotion shipped: the script comments explicitly document the change ("v0.8.3 demotes the manifest check to always-advisory") and the `block()` function exists but is never called for manifest failures. The live behavior matches ADR-088.

The remaining debt is **documentation debt**, not implementation debt:

- `system-design.md` Stop Hook module still describes blocking semantics in multiple places (findings #10, #11, #12 above).
- The Orchestrator module still uses "structural impossibility" language (finding #12).
- Domain model Amendment 22 has not been written (finding #13 — this is the only finding in this scope that ADR-088 and ADR-089 designate as in-DECIDE scope rather than ARCHITECT/BUILD).

The manifest's schema documentation (`tier1-phase-manifest.yaml` header comments) does not claim blocking semantics — it describes format and detection only. No manifest schema debt on this dimension.

### Scope 4 — ADR-090 In-Progress Phase Set/Clear Discipline

The orchestrator skill (`skills/rdd/SKILL.md` lines 469–477) explicitly documents the set/clear lifecycle in five numbered steps. The documentation is conformant with ADR-090: the field is described as advisory-noise suppressor, set at phase entry, removed at phase-exit readiness. The current `docs/cycle-status.md` has `**In-progress phase:** decide` set, consistent with the DECIDE phase being actively in progress.

No other phase skills (`research/SKILL.md`, `discover/SKILL.md`, etc.) reference the In-progress phase field — conformant with ADR-090's design: the orchestrator manages the field; standalone skill invocation operates without it (noisier but correct).

**No violations found in this scope.**

### Scope 5 — ADR-087 `/rdd-research` Skill-Text Edit

`skills/research/SKILL.md` has no validation-spike decision step at the research → discover gate. The current gate structure ends at:

- Step 4b: Argument / framing audit
- Step 5: Record Reflections (includes the question of whether to loop back)
- Step 6: Archive Research Log
- Then: Phase Boundary: Susceptibility Snapshot Dispatch
- Then: NEXT PHASE

ADR-087 §3 commits a step between the EPISTEMIC GATE section and the Susceptibility Snapshot Dispatch — asking the practitioner the spike-or-no-spike question with the three-criteria trigger condition and requiring rationale recording. This step is **absent from the current skill text**. The natural insertion point is between Step 5 (Record Reflections) and Step 6 (Archive Research Log), or as a named sub-step after the gate conversation before archiving.

The gate does have the "ask whether to proceed to the next phase, revise the essay, or loop back" prompt at the end of Step 5 — this is the composing step the new validation-spike question would sit alongside.

### Scope 6 — ADR-083 Outcome Test Structural Anchoring

No skill text contains a structural anchor for the Outcome Test. Per ADR-083 §6, this is by design: the test operates as Tier 2 (felt at the moment of artifact proposal, not mechanically triggered) and structural anchoring is explicitly deferred to a future cycle. The Outcome Test vocabulary (Outcome Test, bolt-on / felt-additional, in-place-first) exists in the domain model (Amendment 21) but is not referenced in any skill step.

This is an informational baseline finding, not a defect. Scenarios may include a future-cycle candidate noting that the Outcome Test could be anchored at a GRADUATE or CONFORM step.

### Scope 7 — ADR-070 / ADR-085 Transition State Consistency

New Cycle 017 audits (susceptibility snapshots 017-discover, 017-model, 017-research; argument audits 017–r2 through r5; citation audits 017–r2 through r5; research-design-review 017–r2) are all being written to `docs/housekeeping/audits/`. Cycle 017 gate files (017-discover-gate, 017-model-gate, 017-research-gate) are in `docs/housekeeping/gates/`. The dispatch log (`docs/housekeeping/dispatch-log.jsonl`) records entries with `expected_path` values pointing to `docs/housekeeping/audits/`.

This is the **correct current-state behavior** — the corpus is in the ADR-070-migrated state and ADR-085 migration has not run. There is no path inconsistency between new artifacts and manifest expectations. The ADR-085 migration is a future one-shot operation.

The one anomaly is the cycle-status location (finding #9): `docs/cycle-status.md` exists without `docs/housekeeping/cycle-status.md`, despite the migration marker being present at version 0.7.1. This is worth investigating before running `migrate-to-rdd` to determine whether the ADR-070 migration ran fully or whether cycle-status was intentionally kept at the root level.

---

## Notes

**ADR-070 supersession header conformance:** ADR-070 (`docs/decisions/adr-070-housekeeping-migration.md`) carries the ADR-085 supersession header correctly. ADR-064 (`docs/decisions/adr-064-compound-check-hooks.md`) carries the ADR-088 supersession header correctly. ADR-067 (`docs/decisions/adr-067-three-tier-enforcement-classification.md`) carries the ADR-089 supersession header correctly. All three supersession headers are present and correctly formatted per ADR-074's body-immutability workflow.

**Domain model Amendment 22 is the highest-priority action this cycle.** ADR-088 and ADR-089 both designate the Compound Check and Harness Layer concept updates as "At MODEL Amendment 22 in this cycle" — meaning the amendment should land during DECIDE, not deferred to ARCHITECT. All other documentation debt (system-design.md, ORIENTATION.md) is correctly deferred to ARCHITECT per the ADR's downstream-artifact sweep tables.

**Pattern of debt:** Three distinct debt clusters shape the scenario landscape:

1. **Path-migration debt (ADR-085):** 160+ reference locations across hooks, skills, manifests, and docs. All mechanical, all deferred to BUILD. The gap in ADR-085's sweep list (test fixtures) is the only genuine omission — everything else is captured in ADR-085's downstream-artifact table. Scenarios: one `refactor:` commit for the migration operation itself; one scenario asserting test-fixture inclusion in scope.

2. **Advisory-language debt (ADR-088 / ADR-089):** Documentation claims blocking semantics the implementation no longer delivers. All deferred to ARCHITECT (system-design.md, ORIENTATION.md) except domain-model Amendment 22 (in-DECIDE). Scenarios: one DECIDE-phase amendment scenario; one ARCHITECT-phase system-design update scenario.

3. **Missing skill-text edits (ADR-084, ADR-087):** system-design.md restructuring (ADR-084) and validation-spike gate step (ADR-087) are both absent from the current codebase and both committed as future-phase deliverables (ARCHITECT and BUILD respectively). Scenarios: one ARCHITECT scenario for system-design.md Pattern-B restructuring; one BUILD scenario for the research skill validation-spike step insertion.

**ADR-086 (AI-as-Orienter non-adoption):** No codebase changes required. The ADR is a non-adoption decision; the current corpus does not contain any AI-as-orienter structural pattern to remove, and the default position (corpus directly readable; agent assists pragmatic work) is what the corpus already delivers.

**ADR-083 Outcome Test:** No BUILD-phase scenarios implied. The absence of a structural anchor is by-design per ADR-083 §6. Future-cycle scenario backlog item.

**conform/SKILL.md gap:** The `migrate-to-rdd` subcommand described in ADR-085 §4 does not yet exist in `skills/conform/SKILL.md`. The conform skill currently describes only the ADR-070 `migrate` subcommand. Adding `migrate-to-rdd` is a BUILD-phase skill-text addition, not a path-substitution item.
