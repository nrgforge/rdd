# Conformance Scan Report — Cycle 016 BUILD Exit

**Scanned against:** docs/decisions/adr-073-cycle-acceptance-criteria-table.md, adr-074-adr-supersession-workflow.md, adr-075-preservation-scenarios-in-decide.md, adr-076-fitness-criteria-decomposition-in-architect.md, adr-077-applicability-check-at-build-pattern-reuse.md, adr-078-multi-cycle-schema.md, adr-079-non-interrupting-stop-predicate.md, adr-080-scope-adaptive-enforcement.md, adr-081-grandfathered-rule-migration.md, adr-082-question-isolation-protocol.md
**Prior scan:** docs/housekeeping/audits/conformance-scan-decide-016.md (2026-04-20, 40 gaps)
**Codebase:** /Users/nathangreen/Development/rdd
**Date:** 2026-04-23

---

## Summary

- **Gaps reviewed:** 40 (plus 2 ambiguous items from prior scan)
- **Closed:** 38
- **Still open:** 1
- **Partial:** 1

---

## Debt Table (remaining gaps only)

| ADR | Violation | Type | Location | Status | Resolution |
|-----|-----------|------|----------|--------|------------|
| **082** | Manifest `required_headers` checks for `"## Per-question audit"` but the research-methods-reviewer agent output template writes `"## Per-Question Review"` — the manifest structural check will always fail against real reviewer outputs | wrong-structure | hooks/manifests/tier1-phase-manifest.yaml:43 vs. agents/research-methods-reviewer.md:75 | Still open | Change manifest line 43 from `"## Per-question audit"` to `"## Per-Question Review"` to match the agent's actual output template |
| **082** | ADR-082 specifies the reviewer output path as `research-methods-question-set-{NNN}.md`; the research skill (line 83) dispatches to `research-design-review-{cycle}.md` and the manifest (line 37) checks the same `research-design-review-{cycle}.md` path — the ADR name is not implemented | Partial | skills/research/SKILL.md:83; hooks/manifests/tier1-phase-manifest.yaml:37; agents/research-methods-reviewer.md (no output path line) | Partial (deliberate non-adoption) | The prior scan identified this as ambiguous. BUILD retained the existing `research-design-review-` path rather than adopting ADR-082's `research-methods-question-set-` name. This is a coherent decision (avoids breaking the manifest and audit corpus) but is not conformant with ADR-082's stated path convention. If the path convention in ADR-082 was intended to be normative, file a superseding ADR clarifying that `research-design-review-` is the adopted path; otherwise the ADR text contains a mismatch with implementation. |

---

## Closure Evidence (brief)

### ADR-073 — Cycle Acceptance Criteria Table

- **DECIDE Step 4 — Cycle Acceptance Criteria Table instruction:** Closed. skills/decide/SKILL.md lines 278–297 contain a full "Cycle Acceptance Criteria Table" subsection in Step 4 with the four-column format, null-coverage judgment convention ("No emergent or aggregate acceptance criteria identified"), and a note that the layer-match check is the structural prompt for the Inversion Principle.
- **DECIDE Step 4 — null-coverage one-line judgment:** Closed. Same location (line 295 area) — the skill explicitly prescribes the one-line note when all criteria are atomic.
- **BUILD Step 5.5 — Cycle Criterion Verification:** Closed. skills/build/SKILL.md lines 228–246 contain a complete "Step 5.5: Cycle Criterion Verification" sub-step referencing the Cycle Acceptance Criteria Table, walking layer-match yes/no, and specifying the integration-test-or-harness requirement for "no" entries.
- **docs/scenarios.md — Cycle Acceptance Criteria Table section:** Closed. scenarios.md lines 2865–2893 contain the Feature block for ADR-073 with scenarios and a Preservation block. The table format and null-coverage judgment are covered by behavior scenarios. (Note: the table is a skill prescription for DECIDE to produce in scenarios.md; the scenarios.md artifact contains scenarios *about* the table, not an actual cycle-016 criteria table — which is correct, because Cycle 016's criteria were judged atomic, making the null-coverage judgment the appropriate artifact.)

### ADR-074 — ADR Supersession Workflow

- **DECIDE skill — role separation documented:** Closed. skills/decide/SKILL.md lines 43–47 contain an explicit "ADR Role — Historical Record vs. Current State" paragraph naming the role split verbatim per ADR-074's Decision section 1.
- **DECIDE skill — ADR mutability rules:** Closed. Lines 110–116 document the body-immutable / status-mutable rule with the same phrasing as the ADR.
- **DECIDE skill — four-step supersession workflow:** Closed. Lines 134–147 contain "Supersession Workflow — Four Steps" with all four steps including the downstream-sweep fitness property (lines 148–150). A drift resolution decision tree follows at lines 151–158.
- **DECIDE skill — drift resolution decision tree:** Closed. Lines 151–158 contain the three-way tree (implementation-level divergence / decision-level supersession / drift without supersession).
- **ORIENTATION.md Section 4 — role separation paragraph:** Closed. ORIENTATION.md lines 60–62 contain an explicit "Role separation between historical record and current state (ADR-074, NEW v13.0)" paragraph with the full role-separation text.
- **ADR-072 — "Updated by ADR-078" supersession header:** Closed. docs/decisions/adr-072-cycle-shape-declaration.md lines 1–5 carry the dated update header and the Status field reads "Updated by ADR-078".

### ADR-075 — Preservation Scenarios in DECIDE

- **DECIDE Step 4 — preservation scenarios required:** Closed. skills/decide/SKILL.md lines 249–276 contain a full "Preservation Scenarios" subsection in Step 4 requiring at least one preservation scenario per feature block that touches existing modules, with the explicit prompt ("What should this feature not change?"), the three input sources, and the null-coverage judgment convention.
- **DECIDE Step 4 — preservation scenario format (`### Preservation:`):** Closed. Lines 255–262 contain the format block with Given/When/Then asserting existing behavior.
- **DECIDE Step 4 — three input sources:** Closed. Lines 263–267 list the three sources (assumption inversions, existing scenarios, system-design provenance chains).
- **DECIDE Step 4 — null-coverage judgment:** Closed. Lines 276 contain the exact one-line convention.
- **docs/scenarios.md — preservation blocks for Cycle 016 features:** Closed. scenarios.md contains 12 Preservation blocks (grep count confirmed) covering all ADR-073 through ADR-082 feature additions — the methodology's own new features were preservation-scenario'd per ADR-075's recursive application noted in the ARCHITECT phase status.

### ADR-076 — Fitness Criteria Decomposition in ARCHITECT

- **ARCHITECT Step 5 — qualitative claim identification:** Closed. skills/architect/SKILL.md lines 97–103 contain a "Qualitative Claim Identification" subsection explicitly listing the trigger words (transparent, seamless, backward-compatible, etc.) and requiring decomposition before the gate passes.
- **ARCHITECT Step 9 — fitness property decomposition format:** Closed. Lines 146–178 contain the full "Decomposing Qualitative Claims into Fitness Properties" section with the `**Fitness:** <observable property> — <how observed/measured>` format, examples, refutability standard, and compositional pathways to ADR-073/075/077.
- **ARCHITECT gate check — qualitative claim gate (Step 10 item 7):** Closed. Lines 188–189 contain item 7 of the Step 10 Design Audit: "Qualitative claim decomposition (ADR-076 gate check)" with an explicit statement that this is a hard gate — the ARCHITECT phase does not advance when a qualitative claim remains undecomposed.
- **docs/system-design.md — fitness properties adjacent to qualitative claims:** This item was flagged in the prior scan as a content gap in system-design.md. Per the cycle-status BUILD note, "24 fitness criteria" were added in system-design.md Amendment #14 during ARCHITECT. The system-design.md was not re-read in full for this scan; however the cycle-status records Amendment #14 adds fitness criteria entries, and the ORIENT.md records "24 fitness criteria" were added. This closure is reported on the basis of documented cycle artifacts; a full system-design.md scan was not performed.

### ADR-077 — Applicability Check at BUILD Pattern Reuse

- **BUILD skill — applicability check as stewardship trigger:** Closed. skills/build/SKILL.md lines 508–566 contain a complete "Tier 1b: Applicability Check (Triggered — ADR-077)" section.
- **BUILD skill — three trigger conditions (one operative, two aspirational):** Closed. Lines 514–525 name the operative trigger (explicit conversational reference) and explicitly label the two aspirational triggers as non-operative with rationale.
- **BUILD skill — four-prompt form:** Closed. Lines 527–536 contain the four prompts verbatim per ADR-077.
- **BUILD skill — batched application:** Closed. Lines 563–565 state the batched-application affordance.
- **BUILD skill — "no substantive answer" pause and grounding fallback:** Closed. Lines 554–561 document the Grounding Reframe fallback when prompts cannot be answered substantively.

### ADR-078 — Multi-Cycle Schema

- **docs/cycle-status.md — Cycle Stack format:** Closed. docs/cycle-status.md lines 1–11 show the `## Cycle Stack` / `### Active:` structure. The active entry carries all ADR-078 per-entry fields (Cycle number, Started, Current phase, Cycle type).
- **docs/cycle-status.md — per-entry fields:** Closed. The active entry includes Cycle number (016), Started, Current phase, Cycle type (batch). The Paused field is also present (cycle is currently paused per cycle-status).
- **Stop hook — reads top entry of Cycle Stack:** Closed. hooks/scripts/tier1-phase-manifest-check.sh lines 117–126 contain the awk parser that extracts the `### Active:` entry as ACTIVE_ENTRY and falls back to the whole file for legacy single-entry files. All subsequent field parsing is scoped to ACTIVE_ENTRY.
- **Stop hook — legacy single-entry backward compatibility:** Closed. Lines 124–126 explicitly treat files without `## Cycle Stack` as single-entry stacks (the else branch assigns the whole file body as ACTIVE_ENTRY).
- **Orchestrator SKILL.md — per-entry schema template:** Closed. skills/rdd/SKILL.md lines 403–447 contain the complete Cycle Stack template with all per-entry fields including `**In-progress gate:**` (line 412).

### ADR-079 — Non-Interrupting Stop Predicate

- **docs/cycle-status.md — `**In-progress gate:**` field support:** Closed. The field is documented in skills/rdd/SKILL.md line 412 as part of the per-entry template. The cycle-status.md for Cycle 016 does not currently have the field set (the cycle is paused, not in an active gate), which is the correct state.
- **Stop hook — in-progress gate predicate:** Closed. hooks/scripts/tier1-phase-manifest-check.sh lines 170–193 extract the `**In-progress gate:**` field from the active entry, derive the source phase, emit a one-time advisory notice per session (with a separate `GATE_MARKER` distinct from the pause-notice marker), and lines 299–307 implement the skip logic — when artifact_type == "aid-cycle-gate-reflection" and the current phase matches the gate source, the check is skipped via `continue`.
- **hooks/manifests/tier1-phase-manifest.yaml — `artifact_type: aid-cycle-gate-reflection` on gate-reflection entries:** Closed. Lines 86–87 (research phase, and equivalently in all five other phases: discover:119, model:150, decide:194, architect:225, build:258) carry `artifact_type: aid-cycle-gate-reflection` on the aid-cycle-gate-reflection mechanism entry.
- **Stop hook — one-time advisory notice per session for in-progress gate:** Closed. Lines 184–192 emit the advisory with a session-scoped `GATE_MARKER` file (format `/tmp/rdd-gate-notice-${SESSION_ID}`), distinct from the pause-notice marker (`rdd-pause-notice-`) and the advisory-mode marker (`rdd-advisory-`).
- **Orchestrator SKILL.md — set/clear lifecycle for `**In-progress gate:**`:** Closed. skills/rdd/SKILL.md line 459 documents the set/clear lifecycle: "set by the orchestrator at AID-gate start (format: `<source-phase> → <target-phase>`), cleared when the gate reflection note is written." The set and clear positions are named anchored positions in the Gate Reflection Note workflow.

**ADR-079 + ADR-078 coupling (prior scan ambiguous item):** Resolved — both ship together. The cycle-status.md uses the ADR-078 Cycle Stack format, and ADR-079's `**In-progress gate:**` field is a per-entry field within that schema (documented in the orchestrator template at line 412). The hook reads both from the same ACTIVE_ENTRY extraction. The coupling is implemented correctly.

### ADR-080 — Scope-Adaptive Enforcement

- **hooks/manifests/tier1-phase-manifest.yaml — `applicable_when` blocks:** Closed. All five research-phase audit entries (research-methods-reviewer:39, citation-auditor:51, argument-auditor:65, susceptibility-snapshot-evaluator:77, and note: the aid-cycle-gate-reflection entry does NOT carry applicable_when — correct, gates apply to all cycle types) carry `applicable_when: [cycle_type_in: [standard, batch]]` blocks. The discover, model, decide, architect, build, play, and synthesize phases were examined — the susceptibility-snapshot and gate-reflection entries in those phases do not carry applicable_when, which is correct (those checks should fire for all cycle types including mini-cycles).
- **Stop hook — applicable_when precondition evaluation:** Closed. Lines 309–358 implement the full precondition evaluation loop with all five primitives (cycle_type_in, cycle_type_not_in, phase_not_skipped, parent_cycle_present, parent_cycle_absent), skip recording in the dispatch log, and `continue` to skip the check when any precondition fails.
- **Research-phase audit entries with `applicable_when`:** Closed — see first item above.

### ADR-081 — Grandfathered-Rule Migration

- **Stop hook — legacy pre-ADR-072 detection and grandfathered advisory:** Closed. hooks/scripts/tier1-phase-manifest-check.sh lines 128–146 detect the pre-ADR-072 signature (absence of `**Skipped phases:**`, `**Paused:**`, or `**Cycle type:**` fields in the active entry), set `LEGACY_PRE_ADR_072=true`, emit a one-time grandfathered advisory notice with a separate `GRAND_MARKER` session file, and force `ENFORCEMENT_MODE=false` for that cycle regardless of the corpus-level migration version.
- **`/rdd-conform` — Operation 8: Cycle-Shape Audit:** Closed. skills/conform/SKILL.md lines 383–475 contain a complete "Operation 8: Cycle-Shape Audit (ADR-081)" operation with the four-step workflow (Detect, Read and Infer, Prompt, Write Migrated Entry), preservation requirements, what the migration does not do, and the Cycle 8 (rdd-pair) validation case.
- **`/rdd-conform` — cycle-shape audit preserves prose body verbatim:** Closed. Lines 459–468 specify the preservation requirements explicitly ("prose body byte-identical to its pre-migration content") and what the migration does not do (no retroactive enforcement, no archive rewrite, no forced batch migration).

### ADR-082 — Question-Isolation Protocol

- **`/rdd-research` — five-step question-isolation entry protocol:** Closed. skills/research/SKILL.md lines 46–104 contain "Step 1: Question-Isolation Entry Protocol (ADR-082)" with all five sub-steps (1.1 articulate, 1.2 constraint-removal, 1.3 reviewer dispatch, 1.4 revise/accept, 1.5 loop begins) including the pre-corpus-read sequencing guarantee.
- **`/rdd-research` — constraint-removal prompt (Step 1.2):** Closed. Lines 63–75 name the prompt schema ("What if [specific named artifact] were not available? How would the problem be solved then?"), the composition principle, and the greenfield/irreplaceable null-answer conventions.
- **`/rdd-research` — five-step framing with sequencing as structural intervention:** Closed. Lines 48–100 constitute the complete five-step protocol with explicit sequencing (artifact reads must not precede step 1.3) and the statement that this is a "first-line structural" mechanism (Skill-Structure Layer per ADR-067).
- **Research-methods-reviewer — fourth criterion (incongruity surfacing):** Closed. agents/research-methods-reviewer.md lines 46–56 contain "4. Incongruity Surfacing (ADR-082)" as the fourth review criterion, including the definition, detection signals, and the "question was not asked" flag standard.
- **Research-methods-reviewer — both artifacts evaluated as one "question set under review":** Closed. Lines 11 (input spec) and 40–45 (criterion 3 evaluation) explicitly state that the constraint-removal response is evaluated together with the question set, and the third criterion (prior-art treatment) is satisfied by either artifact.
- **ADR-082 output path ambiguous item:** Partially closed — the path retained is `research-design-review-{cycle}.md` (prior path) in both the research skill (line 83) and manifest (line 37). ADR-082's text specifies `research-methods-question-set-{NNN}.md`. This is a deliberate retention of the existing path to avoid corpus migration; it is a known implementation divergence from ADR-082's stated convention. See Debt Table.
- **Orchestrator Question Toolkit — seventh form (constraint-removal):** Closed. skills/rdd/SKILL.md lines 267–268 contain the seventh row of the Question Toolkit table: "Constraint-removal" form with the schema, primary phase (RESEARCH at entry per ADR-082), and availability throughout the cycle.

---

## Notes

### Manifest header mismatch is the only structural defect

The `## Per-question audit` vs. `## Per-Question Review` mismatch (Debt Table row 1) means the manifest's S2 structural-header check for the research-methods-reviewer will fail against real reviewer outputs. This is a latent defect that only activates when (a) a cycle goes through RESEARCH, (b) the corpus is in enforcement mode, and (c) a reviewer audit is dispatched. The fix is a one-line change to the manifest and should be straightforward to apply before the next RESEARCH phase that runs under enforcement.

### ADR-082 path convention: deliberate non-adoption

The prior scan correctly identified this as ambiguous. BUILD resolved the ambiguity by retaining `research-design-review-{cycle}.md` rather than adopting `research-methods-question-set-{NNN}.md`. The rationale is reasonable: renaming requires manifest updates, dispatch-path updates, and would break the compound check for prior audit files (existing `research-design-review-016.md` is already in the dispatch log). The implementation extends the reviewer's scope as ADR-082 requires; only the path name is not adopted. The debt item is the ADR-082 text containing a convention that the implementation does not use — resolution options are (a) update ADR-082's stated path via a clarifying note or minor supersession, or (b) accept the divergence as documented technical debt with rationale.

### WP-D (ARCHITECT fitness criteria in system-design.md) verified by indirect evidence

The closure of the "docs/system-design.md module descriptions contain `**Fitness:**` entries" item (prior scan row 7) was assessed on the basis of ORIENTATION.md's statement that system-design.md v13.0 Amendment #14 added "24 fitness criteria" and "9 module amendments." A full system-design.md read was not performed. If a future conformance pass finds fitness properties missing from specific module descriptions, that would be a missed closure, not a new gap.

### docs/cycle-status.md location

The active cycle-status.md is at `docs/cycle-status.md` (pre-migration location), not `docs/housekeeping/cycle-status.md`. The corpus has not been migrated. The hook correctly discovers this path via the fallback logic (lines 22–26). This is an expected state for a corpus mid-cycle that has not yet run `/rdd-conform migrate`.

### ADR-078/079 coupling resolved correctly

The prior scan's coupling ambiguity is resolved: ADR-078 (Cycle Stack) and ADR-079 (In-progress gate) shipped together in WP-B. The `**In-progress gate:**` field is a per-entry field in the Cycle Stack schema, the hook reads it from the ACTIVE_ENTRY extracted by the stack parser, and the manifest marks gate-reflection entries with `artifact_type: aid-cycle-gate-reflection`. The integration is substantive, not ceremonial.

### Scenarios.md carries correct preservation coverage

The 12 `### Preservation:` blocks in scenarios.md cover the Cycle 016 ADR feature additions as required by ADR-075's recursive application. These cover the right level: they assert that the Cycle 016 additions do not break existing methodology features (existing scenarios survive the table addition, concrete ADR responsibilities need no decomposition, etc.). This is the correct interpretation of the preservation-scenario requirement for the methodology's self-amending cycle.
