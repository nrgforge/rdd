# Conformance Scan: Cycle 016 DECIDE

**Date:** 2026-04-20
**Scanner model:** claude-sonnet-4-6
**ADRs audited:** 073–082 (plus prior ADRs: 055, 058, 060, 063, 064, 066, 067, 070, 071, 072)
**Codebase root:** /Users/nathangreen/Development/rdd

---

## Summary

- **Total declared behaviors examined:** 47
- **Matches (already implemented):** 5
- **Gaps (needs BUILD):** 40
- **Ambiguous (requires clarification):** 2

---

## Debt Table

| ADR | Declared behavior | Current state | Gap type | File:line |
|-----|------------------|---------------|----------|-----------|
| **073** | DECIDE Step 4 writes a Cycle Acceptance Criteria Table in `scenarios.md` (or `acceptance-criteria.md`) for cycles with emergent/aggregate criteria | Not present — Step 4 instructs behavior scenario writing but has no mention of the table, the layer-match question, or the "atomic, 1:1" omission convention | Skill edit needed | skills/decide/SKILL.md:134 |
| **073** | DECIDE records a one-line judgment ("no emergent criteria identified") when no table is needed | Not present | Skill edit needed | skills/decide/SKILL.md:134 |
| **073** | BUILD gains Step 5.5 — Cycle Criterion Verification: for each table entry, verify criterion at specified layer; write integration test when layer-match is "no" | Not present — Step 5 (Integration Verification) ends at line 224 with no 5.5 sub-step | Skill edit needed | skills/build/SKILL.md:215 |
| **073** | `docs/scenarios.md` contains a Cycle Acceptance Criteria Table section (top section, preceding per-feature blocks, for the current cycle) | Not present — scenarios.md top sections are existing feature blocks; no table or one-line judgment note | Missing artifact content | docs/scenarios.md:1 |
| **074** | DECIDE skill (and `/rdd-architect` reference) explicitly documents the role separation: ADRs = historical record, `system-design.md`/`ORIENTATION.md`/`domain-model.md`/`field-guide.md` = current state | Not present in either skill — the distinction is implicit at best | Skill edit needed | skills/decide/SKILL.md (full file); skills/architect/SKILL.md (full file) |
| **074** | DECIDE skill documents ADR mutability rules: immutable fields vs. mutable Status and supersession header | Not present | Skill edit needed | skills/decide/SKILL.md (full file) |
| **074** | DECIDE skill documents the four-step supersession workflow | Not present — Step 2 (Write ADRs) mentions status field but has no supersession workflow | Skill edit needed | skills/decide/SKILL.md:41–82 |
| **074** | DECIDE skill documents the drift resolution decision tree (implementation-level divergence vs. decision-level supersession vs. unannounced violation) | Not present | Skill edit needed | skills/decide/SKILL.md (full file) |
| **074** | `ORIENTATION.md` Section 4 (artifact map) references the role separation (ADRs as historical record; current-state artifacts as current truth) | Not present — Section 4 lists artifact tiers without naming the historical-vs-current-state role split | Missing content | docs/ORIENTATION.md (Section 4) |
| **074** | ADR-072 carries an "Updated by ADR-078" header because ADR-078 folds ADR-072's two fields into the per-entry schema (partial supersession) | Not present — ADR-072 has no supersession header yet; ADR-074 is itself Proposed, so the workflow has not yet been applied | Missing supersession header | docs/decisions/adr-072-cycle-shape-declaration.md:1 |
| **075** | DECIDE Step 4 requires preservation scenarios alongside behavior scenarios for each feature touching existing modules | Not present — Step 4 writes behavior scenarios only; no prompt for "what should this feature not change?" | Skill edit needed | skills/decide/SKILL.md:134 |
| **075** | DECIDE Step 4 names the preservation scenario format: `### Preservation: [name]` with Given/When/Then asserting existing behavior remains unchanged | Not present | Skill edit needed | skills/decide/SKILL.md:134 |
| **075** | DECIDE Step 4 lists the three input sources for selecting preservation candidates: assumption inversions, existing scenarios, system-design provenance chains | Not present | Skill edit needed | skills/decide/SKILL.md:134 |
| **075** | DECIDE Step 4 provides the null-coverage note convention ("No existing observable behavior is in the call path; preservation scenarios omitted") for wholly isolated modules | Not present | Skill edit needed | skills/decide/SKILL.md:134 |
| **075** | `docs/scenarios.md` contains `### Preservation:` blocks (or one-line null-coverage notes) for each feature that touches existing modules | Not present — no Preservation: blocks exist in scenarios.md | Missing artifact content | docs/scenarios.md (multiple feature blocks) |
| **076** | ARCHITECT skill Step 5 (or new sub-step) requires identification of qualitative claims in the responsibility matrix | Not present — Step 5 builds a responsibility matrix but has no qualitative-claim detection step | Skill edit needed | skills/architect/SKILL.md:84 |
| **076** | ARCHITECT skill requires decomposition of each qualitative claim into testable fitness properties before the gate passes | Not present | Skill edit needed | skills/architect/SKILL.md:84–95 |
| **076** | ARCHITECT gate check explicitly refuses to advance when a qualitative claim remains undecomposed ("Are any module responsibilities phrased as qualitative claims without decomposed fitness properties?") | Not present — the gate and design audit (Step 10) have no qualitative-claim gate check | Skill edit needed | skills/architect/SKILL.md:138–148 |
| **076** | `docs/system-design.md` module descriptions contain `**Fitness:** <observable property> — <how observed/measured>` entries adjacent to qualitative claims | Not present — system-design.md has a Fitness Criteria table (Step 9) but module descriptions do not carry per-claim fitness decompositions inline | Missing content | docs/system-design.md:389–392 (Fitness Criteria table has columns but no decomposed-claim entries in module sections) |
| **077** | BUILD skill documents the applicability check as a stewardship-checkpoint trigger: fires when code is extended by analogy | Not present — Tier 1 Stewardship Check (lines 459–484) has eight sub-items but no applicability check prompt for pattern reuse | Skill edit needed | skills/build/SKILL.md:459 |
| **077** | BUILD skill (or refactor skill) names the three trigger conditions for the applicability check (explicit pattern reference / structural similarity / stewardship flag) | Not present | Skill edit needed | skills/build/SKILL.md:459 |
| **077** | BUILD skill provides the four applicability-check prompts (structural alternative / what's different / which assumptions carry forward / fitness-property consultation) | Not present | Skill edit needed | skills/build/SKILL.md:459 |
| **077** | BUILD skill states the "batched application" affordance for pattern-reuse-heavy sessions | Not present | Skill edit needed | skills/build/SKILL.md:459 |
| **077** | BUILD skill states the "no substantive answer" pause behavior and grounding-actions fallback | Not present | Skill edit needed | skills/build/SKILL.md:459 |
| **078** | `docs/cycle-status.md` uses the `## Cycle Stack` format with `### Active:` / `### Paused:` section headers | Not present — current cycle-status.md uses the pre-ADR-078 single-entry flat format | Schema change needed | docs/cycle-status.md:1 |
| **078** | `docs/cycle-status.md` per-entry schema includes `**Cycle type:**`, `**Parent cycle:**`, `**Phase at pause:**`, `**Spawned by:**`, `**Pause-on-spawn policy:**`, `**Continue-parent rationale:**` fields | Not present — current schema lacks all multi-cycle fields except `**Cycle number:**`, `**Started:**`, `**Cycle type:**` (only `**Cycle type:**` informally present in the scoping text, not as a formal ADR-078 header field) | Schema change needed | docs/cycle-status.md:1–15 |
| **078** | Stop hook (`tier1-phase-manifest-check.sh`) reads the top entry of the `## Cycle Stack` to determine active phase, rather than a single `**Phase:**` or `**Current phase:**` field | Not present — the hook reads `**Phase:**` (line 139) and falls back to `**Current phase:**` (line 145); it has no concept of a stack or top-entry parsing | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:136–158 |
| **078** | Stop hook treats legacy single-entry (no `## Cycle Stack` header) files as a single-entry stack for backward compatibility | Not present yet, though the hook's current parsing would incidentally read a single-entry file if the header fields match; the explicit backward-compat recognition path is absent | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:136 |
| **079** | `docs/cycle-status.md` active entry has an `**In-progress gate:**` field that the orchestrator sets/clears at AID-gate boundaries | Not present — no such field in cycle-status.md | Schema + skill edit needed | docs/cycle-status.md:1–15; skills/rdd/SKILL.md (Gate Reflection Note section) |
| **079** | Stop hook reads the top entry's `**In-progress gate:**` field before dispatching to manifest check; when present, skips only the `artifact_type: aid-cycle-gate-reflection` entry for the source phase | Not present — the hook has no in-progress-gate predicate; the existing paused-cycle short-circuit (line 116) is the only relaxation path | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:110–131 |
| **079** | `hooks/manifests/tier1-phase-manifest.yaml` marks the gate-reflection-note entry in each phase with `artifact_type: aid-cycle-gate-reflection` | Not present — the manifest entries use `mechanism_type: user-tooling` but no `artifact_type` field exists | Manifest edit needed | hooks/manifests/tier1-phase-manifest.yaml:77–91 (research phase gate entry, and equivalently for discover:107, model:137, decide:179, architect:209, build:239) |
| **079** | Stop hook emits a distinct one-time advisory notice per session when `**In-progress gate:**` is set (separate session marker from the pause-notice marker) | Not present | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:110–131 |
| **079** | Orchestrator SKILL.md documents the set/clear lifecycle for `**In-progress gate:**` anchored at AID-gate-start / gate-reflection-note-write positions | Not present — the Gate Reflection Note section (lines 204–243) has no mention of setting/clearing an in-progress-gate field | Skill edit needed | skills/rdd/SKILL.md:204 |
| **080** | `hooks/manifests/tier1-phase-manifest.yaml` entries support an optional `applicable_when` block with precondition primitives | Not present — manifest has no `applicable_when` blocks on any entry | Manifest edit needed | hooks/manifests/tier1-phase-manifest.yaml (entire file — no applicable_when blocks) |
| **080** | Stop hook evaluates `applicable_when` preconditions before running each check; records `skipped: applicable_when condition <X> not met` in dispatch log when skipped | Not present — the hook iterates manifest entries unconditionally with no precondition evaluation | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:221–344 (mechanism iteration loop) |
| **080** | At least the `research`-phase audit entries that should not fire for mini-cycles carry `applicable_when: [cycle_type_in: [standard, batch]]` preconditions | Not present | Manifest edit needed | hooks/manifests/tier1-phase-manifest.yaml:27–91 |
| **081** | Stop hook detects pre-ADR-072 cycle-status.md format (no cycle-shape fields) and applies grandfathered advisory enforcement rather than blocking | Not present — hook has no legacy-format detection beyond the pre/post migration path selection; it does not distinguish pre-ADR-072 format from a valid post-ADR-072 format with absent optional fields | Hook implementation needed | hooks/scripts/tier1-phase-manifest-check.sh:110–200 |
| **081** | `/rdd-conform` skill gains a `cycle-shape audit` operation that detects pre-ADR-072 cycle-status.md files and walks the user through populating current-schema fields | Not present — conform skill has seven operations (Audit, Remediation, Drift Detection, Migrate, Housekeeping Audit, Gate Note Audit, Dispatch Prompt Audit); no cycle-shape audit operation exists | Skill edit needed | skills/conform/SKILL.md:20–35 (operations table) |
| **081** | `/rdd-conform` cycle-shape audit preserves prose body verbatim, adds only cycle-shape header fields, and records migration in Pause Log | Not present | Skill edit needed | skills/conform/SKILL.md (full file — new operation) |
| **082** | `/rdd-research` skill gains a Step 0 question-isolation sequence: user articulates research questions before any artifact reads, agent composes constraint-removal prompt, research-methods-reviewer dispatch evaluates the question set, user revises or accepts, research loop begins | Not present — current Step 1 ("Scope the First Question") asks for clarification and runs a partial variant (Step 1b dispatches the research-methods-reviewer on the question set) but does not require pre-artifact question articulation or a constraint-removal prompt response as a first step | Skill edit needed | skills/research/SKILL.md:46–68 |
| **082** | `/rdd-research` skill Step 1b (or new Step 0) names the constraint-removal prompt: "What if [most consequential existing artifact] were not available? How would the problem be solved then?" | Not present in Step 1b | Skill edit needed | skills/research/SKILL.md:56–68 |
| **082** | `/rdd-research` skill documents the five-step research-entry sequence with sequencing as the structural intervention (articulate → constraint-removal → reviewer dispatch → revise → loop begins) | Not present — the sequence exists in fragments (Step 1 clarification, Step 1b review) but the ordering guarantee (artifact reads must not precede step 1-2) and the explicit five-step framing are absent | Skill edit needed | skills/research/SKILL.md:39–88 |
| **082** | Research-methods-reviewer agent (`agents/research-methods-reviewer.md`) evaluates four review criteria: framing (needs vs. artifacts), embedded conclusions, prior-art treatment (at least one question treats existing artifacts as prior art), incongruity surfacing | Not present — current agent evaluates three criteria: Belief-Mapping, Embedded Conclusion Detection, Premature Narrowing; incongruity surfacing (the fourth criterion) is absent | Agent edit needed | agents/research-methods-reviewer.md:16–42 |
| **082** | Research-methods-reviewer agent evaluates both the research question set AND the constraint-removal response together as the "question set under review" | Not present — current agent scope is the question set only; the constraint-removal response artifact is not in scope | Agent edit needed | agents/research-methods-reviewer.md:5–15 |
| **082** | Research-methods-reviewer agent output path convention changes to `docs/housekeeping/audits/research-methods-question-set-{NNN}.md` | Not present — current agent has no output path convention; the dispatch in research/SKILL.md uses `docs/housekeeping/audits/research-design-review-{cycle}.md` (line 60) and the manifest checks for `research-design-review-{cycle}.md` (manifest line 37) | Ambiguous — see notes | agents/research-methods-reviewer.md; hooks/manifests/tier1-phase-manifest.yaml:37 |
| **082** | Orchestrator Question Toolkit gains a seventh form — constraint-removal ("What would we build if [key infrastructure component] were not available?") — listed alongside the existing six forms | Not present — the toolkit (skills/rdd/SKILL.md:258–268) has exactly six forms; the seventh is absent | Skill edit needed | skills/rdd/SKILL.md:258 |

---

## Ambiguous Items

**ADR-082 output path:** ADR-082 declares the reviewer output path as `docs/housekeeping/audits/research-methods-question-set-<NNN>.md`, while the current research skill dispatches to `docs/housekeeping/audits/research-design-review-{cycle}.md` and the manifest checks for the `research-design-review-{cycle}.md` path. If BUILD adopts ADR-082's new path, the manifest, the research skill dispatch, and the reviewer agent's output-path expectation must all change atomically. The existing path name (`research-design-review-`) reflects the ADR-060 scope (design review); the new name (`research-methods-question-set-`) reflects the extended scope. A BUILD decision is needed on whether to rename (consistent with ADR-082's language) or retain the current path while extending the reviewer's scope. Renaming requires a manifest update and a corpus migration step to avoid breaking the compound check for prior audit files.

**ADR-079 + ADR-078 coupling:** ADR-079 notes that its `**In-progress gate:**` field placement "adapts to the single-cycle format trivially (field at top of file, not per entry)" if ADR-078 is deferred. The scan cannot determine from the codebase alone whether ADR-078 and ADR-079 will ship atomically or sequentially. If ADR-078 ships first, the per-entry field placement in ADR-079 is straightforward. If ADR-079 ships first, it needs a single-entry fallback placement. BUILD should confirm the intended sequencing — the debt items for both ADRs are listed separately in the table above; the integration between them is real but not blocking either individual implementation.

---

## Cross-ADR Observations

**Cluster 1 — Hook Layer (ADRs 078, 079, 080, 081):**
These four ADRs all require changes to `hooks/scripts/tier1-phase-manifest-check.sh` and/or `hooks/manifests/tier1-phase-manifest.yaml`. Specifically: 078 changes how the hook reads the active cycle (stack-top parsing vs. flat-field parsing); 079 adds a pre-manifest-check predicate reading `**In-progress gate:**`; 080 adds per-entry `applicable_when` evaluation within the manifest iteration loop; 081 adds legacy-format detection before the manifest check. These are sequential logic stages in the same hook file and will conflict if implemented in separate PRs without coordination. The implementation ordering should be: 078 (stack parsing) → 081 (legacy detection, requires stack-vs-legacy discrimination) → 079 (in-progress-gate predicate, reads per-entry fields) → 080 (applicable_when loop). All four also touch cycle-status.md schema or manifest YAML; they share the same system boundaries.

**Cluster 2 — DECIDE Skill (ADRs 073, 074, 075):**
ADRs 073, 074, and 075 all require edits to `skills/decide/SKILL.md` Step 4. ADR-073 adds the Cycle Acceptance Criteria Table to Step 4; ADR-075 adds preservation scenarios to Step 4. Both require additions to the same step text. ADR-074 adds supersession workflow documentation throughout the skill (new section rather than a step-edit). These can be implemented in sequence without conflict, but the Step 4 edits for 073 and 075 should be coordinated to avoid producing two separate additions to the same paragraph that don't compose cleanly.

**Cluster 3 — ARCHITECT Skill and system-design.md (ADR 076):**
ADR-076 is the only ADR in this set requiring changes to `skills/architect/SKILL.md` Steps 5, 9, and 10 together. It also requires retroactive addition of fitness-property entries to `docs/system-design.md` module descriptions for any modules with existing qualitative claims. The system-design.md scan found two instances of potential qualitative language: "seamless transitions" in the dependency graph (line 787) and "seamless" in the Note for the Build Skill module (line 159). Both describe the mode-shift composition behavior. Whether these constitute "qualitative claims requiring decomposition" under ADR-076's definition (they describe behavior rather than module responsibilities) is a judgment call that belongs to BUILD, not this scan. No clear module-responsibility undecomposed qualitative claims were found in the module Purpose/Owns fields during this scan; the fitness criteria table already exists as a structural slot (system-design.md lines 389–392) but contains no entries derived from qualitative-claim decomposition. The ARCHITECT gate check update (ADR-076 item 3) is the highest-priority change because it is a gate-blocking addition.

**Cluster 4 — RESEARCH Skill and research-methods-reviewer agent (ADR 082):**
ADR-082 requires coordinated changes across `skills/research/SKILL.md`, `agents/research-methods-reviewer.md`, and `skills/rdd/SKILL.md` (Question Toolkit). The research skill already has a Step 1b that dispatches the reviewer, which is the anchor point for the new Step 0 / extended sequence. BUILD should restructure the existing Step 1b into the new five-step protocol rather than adding a new step in parallel, to avoid two partially-overlapping pre-research-loop sequences.

**ADR-074 supersession headers — scope clarification:**
ADR-074's Consequences section explicitly states "Older RDD ADRs may not yet have supersession headers where they should. Backfilling is out of scope for this ADR." The scan confirms that ADR-072 should carry an "Updated by ADR-078" header once ADR-078 is accepted (partial supersession: ADR-078 folds ADR-072's two fields into the per-entry schema while retaining their semantics). No other accepted ADRs in the corpus were found to require retroactive supersession headers as a direct consequence of ADRs 073–082 — the new ADRs introduce new behaviors rather than superseding prior accepted decisions. The ADR-072 "Updated by" header is the only immediate backfill item this scan identified.

**Manifest backward-compatibility note:**
ADR-080's `applicable_when` extension and ADR-079's `artifact_type` field are both declared to be additive and backward-compatible with existing manifest entries (entries without these fields continue to behave as today). This is consistent with the manifest's `format_version: 1` header. If BUILD increments the format version for these extensions, the version-parsing logic in the hook would need updating. If it does not increment the version, no hook change is needed beyond the new precondition evaluation logic.

---

## Implementation Grouping (suggested for BUILD planning)

**Group A — Hook layer (must ship together):**
ADR-078 stack parsing + ADR-079 in-progress-gate predicate + ADR-080 applicable_when evaluation + ADR-081 legacy detection. All in `hooks/scripts/tier1-phase-manifest-check.sh` and `hooks/manifests/tier1-phase-manifest.yaml`. Sequenced internally: 078 → 081 → 079 → 080.

**Group B — cycle-status.md schema migration:**
ADR-078 `## Cycle Stack` format for Cycle 016's active entry + ADR-079 `**In-progress gate:**` field support. Requires updating `docs/cycle-status.md` to the ADR-078 per-entry schema. Can be done as a documentation-only change while Group A is in progress.

**Group C — DECIDE skill edits:**
ADR-073 (Acceptance Criteria Table in Step 4) + ADR-074 (role separation + supersession workflow documentation) + ADR-075 (preservation scenarios in Step 4). All `skills/decide/SKILL.md`. Steps 4 and the new role-separation section can be implemented in a single pass.

**Group D — ARCHITECT skill + system-design.md:**
ADR-076 (fitness-criteria decomposition gate). Edits to `skills/architect/SKILL.md` Steps 5, 9, 10 and the ARCHITECT gate check.

**Group E — BUILD skill:**
ADR-073 (Step 5.5) + ADR-077 (applicability check in stewardship). Both `skills/build/SKILL.md`. The Step 5.5 addition is independent; the stewardship applicability check extends Tier 1 Stewardship Check sub-items.

**Group F — RESEARCH skill + reviewer agent + orchestrator:**
ADR-082 (question-isolation protocol). Edits to `skills/research/SKILL.md` (Step 0 / restructure Step 1b), `agents/research-methods-reviewer.md` (fourth criterion + joint-artifact scope), and `skills/rdd/SKILL.md` (seventh Question Toolkit form).

**Group G — Supersession headers:**
ADR-074 prescribes that ADR-072 gains an "Updated by ADR-078" header once ADR-078 is accepted. This is a documentation-only edit to `docs/decisions/adr-072-cycle-shape-declaration.md` that can be applied as part of Group A's commit.

**Group H — ORIENTATION.md role-separation note:**
ADR-074 requires Section 4 of `docs/ORIENTATION.md` to reference the historical-record / current-state role separation. Small documentation edit, independent of all groups.
