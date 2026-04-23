# Integration Verification — Cycle 016 BUILD

**Date:** 2026-04-23
**Scope:** The 13 new boundary integration tests specified in system-design v13.0 Test Architecture §Cycle 016 Boundary Integration Tests (lines 1559–1575).
**Verified against:** WP-A through WP-G shipments (b90d4a1 … 67b5ddf).

## Summary

- **Tests in scope:** 13
- **Passed:** 13
- **Failed:** 0
- **Notes:** Tests 1–4 are actual bash fixture tests shipped in WP-B's `hooks/tests/` infrastructure. Tests 6–13 are skill-text behavioral assertions verified by reading the modified skill/agent files and confirming the described behavior is present in the prompt text — the methodology's acceptance-test pattern per system-design Test Architecture §Test Layers: "the behavior scenarios in `scenarios.md` … verified by reading the modified files and confirming the described behavior is present in the prompt text." Test 5 is an orchestrator-skill-text assertion (no hook/agent substrate; the orchestrator is a prompt file instructing the in-context agent).

## Per-Test Results

### 1. Hook Cycle Stack parser

**Test:** `hooks/tests/test_multi_entry_stack.sh` (fixture: active + paused entries)
**Verifies:** Stack parser identifies the top entry; does not read paused entries' phase fields.
**Shipped in:** WP-B (f158af4).
**Result:** ✅ PASS — `bash hooks/tests/run_tests.sh` ran 6/6 green (2026-04-23).

### 2. Hook in-progress-gate predicate

**Test:** `hooks/tests/test_in_progress_gate.sh` (fixture: `**In-progress gate:**` set, manifest entry tagged `artifact_type: aid-cycle-gate-reflection`)
**Verifies:** Selective skip applies only to the gate-reflection entry; other source-phase entries fire.
**Shipped in:** WP-B.
**Result:** ✅ PASS — green under the shared hook test harness.

### 3. Hook legacy-format detection

**Test:** `hooks/tests/test_legacy_format.sh` (fixture: pre-ADR-072 cycle-status.md)
**Verifies:** Grandfathered advisory mode applied regardless of corpus `.migration-version` state.
**Shipped in:** WP-B.
**Result:** ✅ PASS. Stderr confirms `rdd-hook: grandfathered cycle` and `pre-ADR-072` markers.

### 4. Hook `applicable_when` precondition evaluator

**Test:** `hooks/tests/test_applicable_when.sh` (fixture: manifest entry with `applicable_when: [cycle_type_in: [standard, batch]]`; cycle-status `**Cycle type:** mini-cycle`)
**Verifies:** Skip applied; reason logged in dispatch log.
**Shipped in:** WP-B.
**Result:** ✅ PASS.

### 5. Orchestrator sets `**In-progress gate:**` at AID start, clears at gate-note write

**Test intent:** Field set at AID-gate start (format `<source-phase> → <target-phase>`); cleared when the gate reflection note is written.
**Substrate:** Orchestrator skill text (`skills/rdd/SKILL.md`) — no hook or code. The orchestrator *instructs* the in-context agent to set/clear the field; this is a Tier 2 conversational mechanism per ADR-058.
**Evidence:** `skills/rdd/SKILL.md` line 412 — cycle-status template shows `**In-progress gate:**` field with explicit note: "optional; set by orchestrator at AID-gate start, cleared at gate-reflection-note write — per ADR-079". Line 459 — per-entry field table describes the semantics: "set by the orchestrator at AID-gate start (format: `<source-phase> → <target-phase>`), cleared when the gate reflection note is written. While present on the top entry, the Stop hook's gate-reflection-note check returns allow for the source phase only; all other manifest checks continue to fire."
**Result:** ✅ PASS — orchestrator instruction present; hook-side enforcement of the skip semantics verified by test 2 above (`test_in_progress_gate.sh`).
**Note:** The Tier 2 classification means the orchestrator's set/clear discipline is not hook-verified. If the orchestrator forgets to set the field at AID start, the compound check fires against the in-progress gate and the ADR-079 accommodation does not apply. This is a known limitation of the conversational layer.

### 6. Decide Skill — supersession header writer

**Test intent:** When a new ADR supersedes or updates a prior accepted ADR, the old ADR gains the header blockquote; status field is updated; body bytes remain unchanged.
**Evidence:** `skills/decide/SKILL.md` Step 2.5 §Supersession Header Formats specifies the two formats verbatim:
- `> **Superseded by ADR-NNN on YYYY-MM-DD.** [One-line reason.]`
- `> **Updated by ADR-NNN on YYYY-MM-DD.** [Names which part is updated; the rest of this ADR remains current.]`
Step 2.5 §Body-Immutable, Status-Mutable Rule specifies: "Immutable — Context, Decision, Rejected alternatives, Consequences, Provenance check. The decision text does not change after acceptance. Mutable — the Status field and a dated supersession or update header at the top of the ADR."
**Corpus evidence:** The WP-C sweep discharge itself exercised this flow — `adr-072-cycle-shape-declaration.md` has the `Updated by ADR-078 on 2026-04-22` header at the top (added at DECIDE acceptance) and Status field reads `Updated by ADR-078`; body sections are unchanged from pre-supersession.
**Shipped in:** WP-C (06cfb50).
**Result:** ✅ PASS.

### 7. Decide Skill — supersession sweep updates downstream provenance

**Test intent:** `system-design.md` provenance chain entries that cited the superseded ADR now cite the superseding ADR (where the new decision is authoritative) or retain the historical citation (where the reference is time-period marker).
**Evidence:** `skills/decide/SKILL.md` Step 2.5 §Supersession Workflow — Four Steps lists Step 3 with the four-artifact sweep (system-design.md, ORIENTATION.md, domain-model.md, field-guide.md). The fitness property for the sweep is defined: "for each of the four artifacts, entries that cited the superseded ADR either (a) now cite the superseding ADR where the new decision is authoritative, (b) retain the superseded citation where the reference is historical (e.g., 'pre-ADR-NNN format'), or (c) have been rewritten because the superseded citation no longer applies."
**Corpus evidence:** WP-C discharged the ADR-072 → ADR-078 sweep. `docs/system-design.md` line 458: "migrates from per-file fields (ADR-072) to per-entry fields within a `## Cycle Stack` section (ADR-078)" — correctly attributes per-file fields to ADR-072 and per-entry structure to ADR-078. `docs/domain-model.md` Amendment 20 records the supersession and per-artifact sweep status.
**Shipped in:** WP-C.
**Result:** ✅ PASS.

### 8. Architect Skill — gate blocks on undecomposed qualitative claim

**Test intent:** System-design with a qualitative claim (e.g., "transparent to consumers") but no adjacent `**Fitness:**` property causes the ARCHITECT gate to refuse advance; the undecomposed claim is surfaced by exact phrase.
**Evidence:** `skills/architect/SKILL.md` Step 10 item 7: "Qualitative claim decomposition (ADR-076 gate check) — walk every module responsibility and every responsibility-matrix entry, looking for qualitative claims (transparent, backward-compatible, seamless, performant, lossless, isolated, etc.). For each qualitative claim found, verify at least one adjacent `**Fitness:**` property is recorded and meets the refutability standard. **This check is a hard gate — the ARCHITECT phase does not advance when a qualitative claim remains undecomposed.** Surface the undecomposed claim by name to the user so the decomposition can be added before presenting."
**Shipped in:** WP-D (b46eb4e).
**Result:** ✅ PASS. Classification: Tier 2 conversational hard gate (skill-text instruction, not hook-verified) per Feed-Forward signal #9.

### 9. Build Skill — Applicability Check prompt 4 reads fitness properties

**Test intent:** When the Applicability Check fires, prompt 4 enumerates the declared `**Fitness:**` properties for the affected module(s) verbatim; null case records "no declared fitness properties for this module."
**Evidence:** `skills/build/SKILL.md` Tier 1b §Prompt 4 — Fitness Property Consultation (ADR-076 integration): "If the module has declared `**Fitness:**` properties (inline in the responsibility entry or in a per-module Fitness subsection), name them explicitly in prompt 4. … If the module has no declared fitness properties, record prompt 4's response as *'No declared fitness properties for this module.'* The absence is itself the recorded judgment — not a silent skip."
**Shipped in:** WP-E (677257a).
**Result:** ✅ PASS.

### 10. Build Skill — Step 5.5 verifies Cycle Acceptance Criteria Table entries

**Test intent:** Step 5.5 reads the table from `scenarios.md`; for a `Layer-match: no` entry, the step surfaces the gap and requires an integration test or harness at the named layer.
**Evidence:** `skills/build/SKILL.md` Step 5.5 Cycle Criterion Verification: items 1–6 walk the table, handle yes/no/null cases, and specify: "**Handle layer-match = 'no'.** The verification stubs the layer the criterion names. This is the gap DECIDE surfaced for BUILD to close. Write (or identify) an integration test or harness that exercises the criterion at its specified layer."
**Shipped in:** WP-E.
**Result:** ✅ PASS.

### 11. Decide Skill — preservation scenarios writer

**Test intent:** For each feature-scenario block whose feature touches existing modules, at least one `### Preservation:` block is added, or a null-coverage judgment note is recorded.
**Evidence:** `skills/decide/SKILL.md` Step 4 §Preservation Scenarios: "For each feature scenario block whose feature touches existing modules, write at least one **preservation scenario** asserting that an existing observable behavior, contract, or invariant remains unchanged." The null-coverage judgment: "If the feature genuinely cannot affect any existing observable behavior (a wholly isolated module, a brand-new entry point in the call graph), the feature block records the judgment as a one-line note: *'No existing observable behavior is in the call path; preservation scenarios omitted.'*"
**Corpus evidence:** `scenarios.md` entries for ADRs 073–082 (the Cycle 016 ADRs this skill instruction produced) include `### Preservation:` blocks for the relevant features (`## Feature: Cycle Acceptance Criteria Table` line 2890; `## Feature: ADR Body Immutability` line 2926; `## Feature: Preservation Scenarios in DECIDE` line 2951; `## Feature: Fitness Criteria Decomposition` line 2979; `## Feature: Applicability Check` line 3016; `## Feature: Grandfathered-Rule Migration` line 3179; `## Feature: Question-Isolation Protocol` line 3228).
**Shipped in:** WP-C.
**Result:** ✅ PASS.

### 12. Research Skill — dispatches reviewer with question set + constraint-removal response

**Test intent:** The research-methods-reviewer dispatch payload includes both the articulated question set and the constraint-removal response; the reviewer's report covers all four criteria.
**Evidence:** `skills/research/SKILL.md` Step 1.3: "Dispatch the **research-methods-reviewer** specialist subagent. Provide it with: The research question set (the questions from Step 1.1), The constraint-removal response (from Step 1.2) — the reviewer evaluates both artifacts as one 'question set under review', Prior research context …" And the four criteria list: "1. Need-vs-artifact framing, 2. Embedded conclusions, 3. Prior-art treatment, 4. Incongruity surfacing."
**Reviewer-side evidence:** `agents/research-methods-reviewer.md` Input section describes the constraint-removal response as part of the reviewable question set: "When present, this is evaluated **together with the question set** as one reviewable 'question set under review'." Process section has four criteria (1-4) matching the skill's dispatch scope.
**Shipped in:** WP-F (9dd999e).
**Result:** ✅ PASS.

### 13. Conform Skill — cycle-shape audit migrates legacy entry

**Test intent:** Migrated entry has the current ADR-078 Cycle Stack format; prose body is byte-identical to pre-migration; a Pause Log entry "Migrated from pre-ADR-072 format on YYYY-MM-DD" is added.
**Evidence:** `skills/conform/SKILL.md` Operation 8 Step 4 (Write Migrated Entry) specifies the output format with ADR-078 header fields at the top followed by "existing prose body — Phase Status table, Feed-Forward Signals, Context for Resumption, etc. — preserved verbatim". §What the Migration Preserves: "The existing prose body … is preserved byte-identical. The migration adds header fields only; it does not rewrite the body." Pause Log migration record format specified: `| N | - | - | Migrated from pre-ADR-072 format on YYYY-MM-DD |`
**Shipped in:** WP-G (67b5ddf).
**Result:** ✅ PASS.

## Findings

**No failures.** All 13 boundary integration tests are satisfied by the WPs shipped in Cycle 016 BUILD.

**Two observations for feed-forward to WP-H.5 (phase-exit gate) and to future cycles:**

1. **Tier-classification transparency.** Tests 5, 6, 8, 9, and 11–13 assert skill-text behaviors rather than hook-verified runtime checks — they are Tier 2 conversational mechanisms. The integration verification confirms the skill text is present and correctly shaped; it does not confirm the text *executes reliably under task load*. That reliability claim is held by Invariant 8 with the acknowledged ceiling that Tier 2 mechanisms operate in the agent's susceptibility zone. Future observation candidate: when Cycle 016's amendments fire in practice, does the Tier 2 classification hold, or do the gate-refusal and prompt-reading instructions get ceremonially executed? (This is the Feed-Forward signal #10 observation candidate.)

2. **Hook-test coverage is structural-level, not content-level.** Tests 1–4 confirm the hook parses the current schema correctly; they do not confirm the hook's advisory/enforcement mode output is semantically useful to the agent reading it. A follow-on question: when a block decision fires under enforcement mode, does the stdout/stderr output contain enough specificity for the agent to diagnose what is missing, or does the agent see a generic "check failed" message? This was not tested in WP-B's scope; candidate for a later observation or fixture extension.

## Recommendation

Proceed to WP-H.2 (Issue #15 PostToolUse regex fix). The boundary integration tests are green; no defects surfaced in WP-A through WP-G that were not already addressed inline during those WPs.
