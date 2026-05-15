# Changelog

## v0.8.6

Cycle 018 release: Essay-Outline as RESEARCH Artifact Form. Two new ADRs (092, 093) ship together at BUILD per the cross-ADR integration constraint. The form change replaces prose essay with **Essay-Outline** as the canonical artifact `/rdd-research` produces — a four-section refinement hierarchy (Abstract / Argument-Graph / Citation-Embedded Outline / References) whose **Pyramid Refinement** property is verifiable by the argument-auditor's pyramid graph-traversal and expansion-fidelity verification at three boundaries plus reverse-direction. The **Outline-Coherence Signal** fires when the pyramid fails and discriminates scope failures (Boundary 1: Abstract → Argument-Graph) from discipline failures (Boundary 2: Argument-Graph → Citation-Embedded Outline). One small Domain Model follow-on (Amendment 24) lands with the auditor amendment.

### Why

In the practitioner's experience, the prose essays produced by `/rdd-research` are not human-read. AI-generated writing is under substantial critique across many domains. RDD's distinctive value is its audit infrastructure (citation audit, argument audit, framing audit) — those audits attach to structure, not necessarily to prose. Cycle 018's research investigated two convergent questions: whether the prose essay is the right form for the artifact RESEARCH produces, and how RDD's phases compare against the CRESS principles for context engineering. The cycle produced Essay 017 via **Dogfooded Both-Form Production** — prose and outline forms of the same essay produced in parallel and audited identically — generating empirical comparison data that the form change rests on (a citation-error asymmetry of 3 unique-to-prose P1 errors vs. 0 unique-to-outline; the prose-form's argument-auditor self-referentially demonstrating the framing-adoption phenomenon the essay describes).

The form change preserves the audit substrate that prose essays carry while removing the connective-tissue surface where framing-adoption susceptibility hides. Downstream phases (DISCOVER, MODEL, DECIDE, ARCHITECT) consume the artifact as agent-fed context; the R2 corpus-consumption analysis confirmed that what downstream consumes substantively is structured content (named claims, framework introductions, synthesis statements), which outline form preserves explicitly via the Argument-Graph plus Outline-Production Discipline's synthesis-bullet requirement.

### New ADRs

- **ADR-092 — Essay-Outline as the RESEARCH Artifact Form.** Four-section structure (Abstract Section / Argument-Graph / Citation-Embedded Outline / References). **Pyramid Refinement** as structural property with operational compliance test (a)/(b)/(c)/(d). **MUST anchor convention** with **META reserved identifier** and audit-time misclassification check. **Outline-Production Discipline** anchored conventionally in skill text (per-bullet Synthesis Bullets, CONFIDENCE-LEVEL tags, named meta-moves: PROVENANCE CORRECTION, SCOPE QUALIFICATION, META-OBSERVATION). **Outline-Coherence Signal** stewardship trigger with Discrimination Test routing (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect). Filename pattern `essay-outline-NNN-<slug>.md` co-exists with legacy `NNN-*.md` (no retroactive migration). Form change is RESEARCH-scoped; reflections and SYNTHESIZE essays retain narrative prose form.
- **ADR-093 — Argument-Auditor Scope Extends to Argument-Graph Consumption and Pyramid Expansion-Fidelity Verification.** Essay-Outline becomes the fourth named genre. Pyramid graph-traversal across the four tiers (Abstract → Argument-Graph → Citation-Embedded Outline → References). Expansion-fidelity verification at Boundary 1/2/3 plus Reverse 1/2. **Discrimination Test routing field** appears inline on every Boundary 1 / Boundary 2 P1 finding (so the practitioner receives the Outline-Coherence Signal's diagnosis directly in the auditor's output). META audit-time review (P2 misclassification when META anchor used for developmental content). Output template extensions for Essay-Outline genre only: pyramid coverage map + expansion-fidelity findings subsections. Skill-Structure Layer anchoring per ADR-067-as-updated-by-ADR-089 in `agents/argument-auditor.md`. The five existing within-document verifications and the framing audit are unchanged in scope.

### Skill and agent amendments

- **`/rdd-research`** — Step 4 (formerly "Essay") rewritten as "Essay-Outline": four-section template, Pyramid Refinement structural property, Argument-Graph format (structured-bullet hierarchy with named identifiers `C1`/`W1.1`/`E1.1.1`/...), MUST anchor convention + META reserved identifier, Outline-Production Discipline production requirements, filename pattern updated to `essay-outline-NNN-<slug>.md`. New Step 4b.1 "Outline-Coherence Signal Stewardship" surfaces the Discrimination Test routing to the practitioner when expansion-fidelity P1 violations fire. Step 4a/4b updated to dispatch the auditor with the Essay-Outline genre indication. Important Principles updated to name the form change ("Research produces structured content, not just notes"). The legacy "If you can't explain it clearly in prose, you don't understand it well enough" line is removed (it directly contradicted the form change).
- **`agents/argument-auditor.md`** — Genre list extended to four (Essay-Outline added). New Process section "Essay-Outline Genre: Pyramid Graph-Traversal" specifies four-tier traversal with operational instructions for each tier. New Process section "Essay-Outline Genre: Expansion-Fidelity Verification" specifies boundary-by-boundary detection (P1 severity for pyramid breaks; P2 for weak expansions and META misclassifications; P3 for minor coverage gaps) with Discrimination Test routing inline on Boundary 1 / Boundary 2 P1 findings (referencing ADR-092 §6 explicitly) and citation-auditor coordination on Boundary 3 (P2 normally, escalated to P1 when citation-auditor absent). Output template extended with Pyramid Coverage Map + Expansion-Fidelity Findings subsections for Essay-Outline genre.
- **`/rdd` orchestrator** — Skill descriptions updated to reference Essay-Outline (or legacy essay for backward compatibility). Artifacts Summary table adds the Essay-Outline canonical-form row and preserves the legacy prose-essay row marked "no retroactive migration." Cross-phase integration descriptions updated to reflect pyramid graph-traversal and expansion-fidelity verification. "Essay as Research Phase Checkpoint" revised to add expansion-fidelity violations as a checkpoint trigger.
- **`docs/ORIENTATION.md`** — Section 4 (artifact map) names Essay-Outline as the canonical RESEARCH artifact form; the existing prose-essay form is named as the prior pattern (no retroactive migration). Top-of-file dateline and "What's settled" entry updated to reflect the BUILD shipping.
- **`docs/domain-model.md`** — Amendment 24 (small follow-on): the Argument-Graph (as artifact section) concept entry's "auditor consumption is currently judgment-anchored" note is updated to "auditor consumption is anchored in `agents/argument-auditor.md` per ADR-093." No invariant changes.

### Test fixtures

- **Two new fixture tests** (the two named load-bearing fixtures from the unified pre-BUILD sweep checklist):
  - `test_essay_outline_form_documented.sh` — verifies the four-section template, Pyramid Refinement, Argument-Graph format conventions, Outline-Production Discipline, Outline-Coherence Signal stewardship with Discrimination Test routing, and the `essay-outline-NNN-<slug>.md` filename pattern are encoded in `skills/research/SKILL.md`. Verifies the legacy "If you can't explain it clearly in prose..." line is revised.
  - `test_argument_auditor_essay_outline_genre.sh` — verifies the four genres + Essay-Outline Process step (pyramid graph-traversal, expansion-fidelity verification at three boundaries plus reverse-direction, Discrimination Test routing with ADR-092 §6 reference, META audit-time review, P2 misclassification, citation-auditor coordination with escalation path) and the output template extensions (Pyramid Coverage Map, Expansion-Fidelity Findings) are encoded in `agents/argument-auditor.md`. Backward-compatibility regression check: the five existing within-document verifications and the framing audit section are retained.
- All 21 hook tests pass (19 prior + 2 new).

### Audit passes

- Four argument-audit rounds on the DECIDE artifacts (R1–R4); R3 surfaced an audit-subagent silent-fallback (delivered inline rather than via Write — file reconstructed at R4 surfacing); all rounds closed clean by R4. The methodology-level pattern (ADR-drafting layer is a susceptibility surface neither the audit loop nor the susceptibility snapshot fully scoped) is recorded as a candidate future-cycle observation for the argument-auditor's scope.
- Conformance scan verified 6 expected deferred-sweep items + 4 P3 unexpected debt items recommending unified BUILD sweep checklist; the unified checklist consolidated ADR-092 §10 + ADR-093 §5 into eight files plus two fixture tests.
- ARCHITECT-gate susceptibility snapshot recommended no Grounding Reframe; two P3 feed-forward observations named, of which Signal #1 was accepted at the gate (WP-B gains the Discrimination Test routing field on Boundary 1 / Boundary 2 P1 findings).

### What this changes for practitioners

- **New RESEARCH artifacts use Essay-Outline form.** Filename pattern `essay-outline-NNN-<slug>.md` distinguishes them from legacy prose essays. The four-section structure is mechanically composable from research-log content; production cost is comparable to (and in Cycle 018's experience, lower than) prose form because outline form does not require connective-tissue prose.
- **The argument-audit gains a coverage map.** Auditor output on Essay-Outline genre now includes a Pyramid Coverage Map showing each Abstract conclusion's trace through Argument-Graph nodes to body sections to references — readable as the structural evidence the audit produces, not as a violation list.
- **Stewardship is operationalized.** The Outline-Coherence Signal's Discrimination Test fires inline in audit findings; the practitioner sees "scope-suspect" or "discipline-suspect" directly on each Boundary 1 / Boundary 2 P1 finding and routes the stewardship response (split the cycle vs. tighten production discipline) without cross-referencing skill text.
- **Backward compatibility preserved.** Legacy prose essays remain at their existing paths and forms; the argument-auditor's behavior on prose essays, ADRs, and synthesis outlines is unchanged. Reflections and SYNTHESIZE essays retain narrative prose form (ADR-092 §8).

### Methodology scope-of-claim

- The form change is justified on directional rather than statistical evidence (Cycle 018's both-form production within one cycle). The methodology's response is to encode the scope-of-claim caveats honestly: CRESS scope-transfer is via analogy (Target 2); the citation-comparison evidence is scoped to one prose-production method (Target 3); Kim et al. Open Question 7 (input-side susceptibility — whether downstream agents over-weight structured Essay-Outline content) is held as a Neutral consequence and a future-cycle empirical test candidate.
- Outline-Production Discipline reliability under task load is an open question structurally analogous to Cycle 10's prose-hardening-doesn't-work finding. The Pyramid Refinement audit operating at the expansion level is the structural backstop; per-bullet discipline reliability is the conventional layer. The methodology does not assert that the convention layer alone is reliable; the structural backstop is what carries the load-bearing claim.
- The form change extends the existing SYNTHESIZE pattern (agent produces outline; user writes shareable prose from it) one phase upstream to `/rdd-research`. It is not novel architecture.

## v0.8.5

Patch release: methodology amendment from the Cycle 017 BUILD-exit gate. ADR-091 (Dual-Mode BUILD) names auto-mode and gated-mode as both legitimate patterns with mode-selection axes the practitioner uses to choose between them. The `/rdd-build` skill reads the new `**BUILD mode:**` field on the active cycle entry and adapts.

### Why

Cycle 017's BUILD ran in auto mode after the practitioner's high-level direction at the start. The agent executed all seven work packages autonomously across seven commits; stewardship was self-administered. The build-phase Susceptibility Snapshot named this as Feed-forward Signal E to the methodology itself: the AID cycle's user-engagement moments are designed to surface design-alternative examination and scoping-judgment surfacing, which self-administered stewardship does not reach. The BUILD-exit gate produced the practitioner commitment that auto-mode and gated-mode are both applicable for different cycle characteristics — and that the methodology should name the framing so practitioners and agents have language and axes for the choice in future cycles.

The methodology had no language for auto-mode BUILD before this patch. Practitioners running the pattern had no axes for deciding when it was appropriate, and the build skill described only the gated pattern as canonical. This patch closes the methodology-vs-practice gap.

### New ADR

- **ADR-091 — Dual-Mode BUILD: Auto-Mode and Gated-Mode as Methodology-Recognized Patterns.** Names both patterns as legitimate. Four mode-selection axes (mechanical-vs-generative work character; practitioner availability and cognitive budget; cycle stakes and reversibility / epistemic cost; stewardship locality catching-vs-teaching). `**BUILD mode:**` per-entry declaration field on the active cycle entry; default is `gated` (existing canonical pattern); `auto` is opt-in by deliberate practitioner declaration. Mid-phase shift mechanic supported via small `cycle-status.md` edit. Cross-cycle inheritance is not supported — each cycle re-evaluates the mode against its own four-axis assessment. Skill-Structure Layer behavior (per ADR-067); not enforced by hook.

### Skill amendments

- **`/rdd-build`** — new "BUILD Mode Selection" subsection at the top of `## PROCESS` (before Step 0). Documents both modes, the four mode-selection axes, the auto-mode failure modes (design-alternative examination, scoping-judgment surfacing) as honest scope-of-claim, and the mid-phase shift mechanic. The skill reads `**BUILD mode:**` from the active cycle entry and adapts: in auto mode, scenario-group EPISTEMIC GATES are suppressed and stewardship runs as self-administered conformance passes; in gated mode, the canonical pattern fires as currently specified. The Tier 1b Applicability Check (ADR-077) at pattern reuse fires regardless of mode.
- **`/rdd` orchestrator** — cycle-status.md schema documentation gains the `**BUILD mode:**` per-entry field with full per-field documentation and ADR-091 cross-reference.

### Test fixtures

- **One new fixture test:** `test_build_mode_selection_documented.sh` verifies the dual-mode framing is encoded in `/rdd-build` (section header, ADR-091 reference, both modes named, default-gated documented, all four axis terms present, auto-mode failure modes named, mid-phase shift documented, section position before Step 0) and the `**BUILD mode:**` field is documented in the orchestrator's cycle-status schema.
- All 19 hook tests pass.

### Audit passes

- Three argument-audit passes on ADR-091 (initial pass: 4 P2 + 2 P3 + 3 framing-audit findings; r2 after corrections: 2 new P3s introduced by the lifecycle correction; r3 after fixes: CLEAN).
- The two framing-audit findings (FF-P2.1 design-alternative-examination compensating mechanism gap; FF-P3.1 heavy-lifting-argument vs. gated-default tension) are carried forward as user-judgment future-cycle scope per the framing-audit-findings-not-auto-corrected policy.

### What this changes for practitioners

- **Cycles where BUILD is mostly mechanical** (claims audited at upstream phases, scenarios well-specified, ADR coverage clean) can declare `**BUILD mode:** auto` at BUILD entry and run autonomously through WP commits, with practitioner engagement at start (direction), at mid-cycle break points (course corrections), and at the end (cycle close).
- **Cycles where BUILD is generative** (likely to reveal new questions, undecided territory, or design flaws) stay in `gated` mode (the default) and engage the practitioner at scenario-group boundaries.
- **Cycles where the practitioner wants targeted teaching engagement on specific WPs without committing the whole BUILD to gated mode** can start in auto mode and shift to gated mid-phase via `cycle-status.md` edit, then shift back when the remaining WPs are mechanical.

### Methodology scope-of-claim

- Auto mode does not catch design-alternative examination or scoping-judgment surfacing. These costs are real and methodology-recognized — the practitioner running auto mode knows what they are accepting. ADR-091 §5 names this explicitly; it does not claim auto mode catches what gated mode catches.
- The four mode-selection axes are judgment-applied; cycle character determines the right mode. The methodology surfaces the question; the practitioner answers it. Per Invariant 8, the mode-selection is not promoted to an unconditional structural mechanism.

## v0.8.4

Cycle 017 release: Readability & Comprehensibility. Eight new ADRs (083–090); supersession headers on ADR-064/067/070; `.rdd/` infrastructure relocation tooling; four-failure-mode classification on the Stop-hook advisory output; In-Progress Phase predicate scope narrowed to per-phase advisories only; `/rdd-research` validation-spike decision step; `/rdd-conform` graduation-check operation. The Pattern A/B catalog for agent-context content placement (ADR-084) shipped, with the system-design split as the canonical Pattern B exemplar.

### Why

Cycle 017's external-stakeholder field evidence diagnosed a corpus-comprehension failure: a mature RDD artifact corpus feels overwhelming on first encounter. The cycle's investigation surfaced **context-mismatch** (initial-handoff vs ongoing-reference are structurally different reading tasks) as the primary mechanism, with audience-conflation, density-ordering, and artifact-form-mismatch as named-inside co-mechanisms. The release ships the methodology amendments and tooling that follow from the diagnosis.

### New ADRs (eight)

- **ADR-083 — Cognitive-Economy Criterion as Outcome Test with In-Place-First Default.** The Outcome Test ("does this produce direct human understanding without AI as workaround?") is the admissibility criterion for human-facing artifacts. In-place-first as default intervention move; bolt-on / felt-additional as failure-mode signal. Methodology-wide default with four named exception conditions.
- **ADR-084 — Agent-Context Content Placement.** Pattern catalog: Pattern A (audience-tagged sections) below ~50% threshold; Pattern B (companion file at predictable path `<artifact>.agents.md`) above. Directory-level audience separation rejected.
- **ADR-085 — `.rdd/` Infrastructure Relocation.** Process-vs-product directory separation via dotfile convention. Relocation of `docs/housekeeping/` → `.rdd/`. Partially supersedes ADR-070. Migration tooling: `/rdd-conform migrate-to-rdd`.
- **ADR-086 — AI-as-Orienter Non-Adoption Pending Operational Criterion.** Default position preserved: corpus directly readable; agent assists pragmatic work. AID-gate bounded agent-mediated dialogue exempt from non-adoption.
- **ADR-087 — Validation Spikes as Research Method, with Grounding Reframe of the Beck Port.** Tightly-scoped prototyping as research method alongside lit-review/search/methods. Anti-elaboration positioning. Beck-port reframed: useful conceptual frame, not load-bearing structural evidence.
- **ADR-088 — ADR-064 Amendment for v0.8.3 Advisory Demotion.** Stop-hook manifest check operates in advisory disposition across all modes. Compound check retained but advisory. State-C "structurally impossible" claim amended to "structurally detectable."
- **ADR-089 — ADR-067 Harness Layer Technique Revision.** Three-Tier Classification's Harness Layer row amended to advisory disposition; substrate primacy ordering preserved.
- **ADR-090 — In-Progress Phase Field Role-Shift Documentation.** Field role amended from v0.8.2 load-bearing predicate to v0.8.3 advisory-noise suppressor; suppression scoped to per-phase manifest advisory only.

### Tooling (skill operations)

- **`/rdd-conform migrate-to-rdd`** (Operation 10) — relocates `docs/housekeeping/` → `.rdd/` per ADR-085 §4. Twelve-step idempotent operation with explicit hook-test-fixture enumeration in the substitution sweep. Refuses uncommitted changes; produces summary report; `git diff`-reviewable in entirety.
- **`/rdd-conform graduation-check`** (Operation 9) — pre-graduation scan for code → doc dangling references (Issue #17). Reverse-direction Tan et al. 2024 detection. Patterns: WP-[A-Z], ADR-NNN, Cycle-N, Tier-N, Spike-N, Invariant-N. Three-category classification: refactor / inline-gloss / historical record. Recommended (not mandatory) at the moment of graduation per Invariant 8.
- **Operation 5 (Housekeeping Audit) extended** with `.rdd/` placement check + In-Progress Phase field hygiene soft notes per ADR-090 §5.

### Skill amendments

- **`/rdd-research` Step 4c (Validation-Spike Decision)** — felt-trigger question (interaction-grounding rationale OR possibility-space-pruning rationale) at the research → discover gate per ADR-087 §3. Optional, not mandatory; rejection with rationale recorded visibly.
- **`/rdd-graduate` Step 1b (Pre-Graduation Scan)** — references `/rdd-conform graduation-check` as the recommended pre-graduation scan; structurally anchored at the moment of graduation.

### Hook layer

- **`tier1-phase-manifest-check.sh`**: three-level cycle-status precedence (.rdd/ → docs/housekeeping/ → docs/); two-level dispatch-log and migration-marker precedence (directory presence); new `resolve_artifact_path` helper (canonical-then-legacy fallback); new `dispatch_log_has_entry` helper (matches both forms); failures partitioned into FAILURES_PHASE (F1/F2/F4 — suppressed by In-Progress Phase) and FAILURES_COMPOUND (F3 fabrication-signal — always surfaced); four-failure-mode classification labels (`[F1: not-dispatched]`, `[F2: dispatched-no-output]`, `[F3: fabrication-signal]`, `[F4: assertion-failure]`) inline on each FAILURE message; advisory message ends with the four-failure-mode legend.
- **`tier1-verify-dispatch.sh`**: dispatch log written to `.rdd/dispatch-log.jsonl` when `.rdd/` directory exists; falls back to `docs/housekeeping/dispatch-log.jsonl` for pre-migration corpora; defaults to `.rdd/` on fresh corpora.
- **`orientation-trigger.sh`**: extended to fire on writes to `system-design.agents.md` per ADR-084 Pattern B. Latent regex bug fixed — the previous pattern required quoted bare filenames and never matched real absolute-path JSON inputs; the new pattern matches the basename portion via `[/"]filename"` anchoring.
- **Manifest path templates**: all `path_template` values migrated from `docs/housekeeping/...` to `.rdd/...` per ADR-085. Hook scripts apply legacy fallback transparently so pre-migration corpora continue to operate.

### Test fixtures

- All eight existing hook test fixtures updated to reference `.rdd/...` paths (`lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_in_progress_gate.sh`, `test_applicable_when.sh`, `test_legacy_format.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh`).
- **Seven new fixture tests:** `test_conform_migrate_to_rdd_basic.sh`, `test_conform_migrate_to_rdd_idempotent.sh`, `test_conform_migrate_to_rdd_hook_fixtures.sh`, `test_orientation_trigger_fires_on_system_design_agents.sh`, `test_hook_reads_rdd_path_with_legacy_fallback.sh`, `test_hook_dispatch_log_writes_rdd_path.sh`, `test_research_validation_spike_step_anchored.sh`, `test_hook_manifest_check_advisory.sh`, `test_hook_in_progress_phase_suppresses_advisory.sh`, `test_graduation_check_detects_code_doc_dangling_refs.sh`.
- All 18 hook tests pass.

### Documentation

- **`field-guide.md`** regenerated for Cycle 016 + 017 amendments per ADR-074 four-artifact downstream sweep. Header updated to v14.0; new System Design Companion File module entry; updated Conformance Audit (10 operations), Research (validation-spike), Build (lifecycle composition, cycle criterion verification, applicability check), Decide (preservation scenarios, cycle acceptance criteria, supersession workflow); Tier 1 hook entries updated for advisory disposition + path resolution.
- **`system-design.md`** restructured to slim human-facing v14.0 with companion `system-design.agents.md` (Pattern B per ADR-084).
- **`ORIENTATION.md`** regenerated with Zero-Prior-Familiarity Reader's reading path, corpus map with audience and purpose annotations, and `.rdd/` sentence per ADR-085 §7.

### User action — opt-in migration

Run `/rdd-conform migrate-to-rdd` when ready to relocate `docs/housekeeping/` → `.rdd/`. The operation:

1. Refuses uncommitted changes
2. Verifies prerequisites (corpus is at the ADR-070 housekeeping placement)
3. Creates `.rdd/` and subdirectories
4. Moves audits, gates, cycle-status, dispatch log, migration marker, session/
5. Performs reference substitution across ADRs, essays, skills, hooks, manifests, and the eight enumerated hook test fixtures
6. Updates `.gitignore`
7. Writes the new migration marker
8. Produces a summary report

The diff is large but mechanical and `git diff`-reviewable. Hook scripts continue to operate transparently against either placement during the transition window.

### Methodology scope-of-claim

Per ADR-087 §4, the cycle-as-instance reflection encodes a standing caveat: research-phase essays and ADRs reflect the cycle's understanding at the time of authoring, audited against literature and conversation. They have not necessarily been validated against built artifacts at the scale the methodology operates. Cycle 017's claims about readability and corpus-comprehension are research-grade evidence at the cycle's encoded scope until tested against actual zero-prior-familiarity reader feedback (the architect-snapshot Signal E "product-facing Outcome Test").

## v0.8.3

Patch release: demotes the Tier 1 phase-manifest check from blocking enforcement to advisory-only. Follow-up to v0.8.2's mid-phase-loop fix, addressing the underlying brittleness rather than patching one more failure path.

### Why

v0.8.2 fixed the pathological loop at RESEARCH Step 1.1 by introducing the `**In-progress phase:**` predicate, which suppresses the manifest check during phase work. That fix worked for orchestrator-driven invocation but left the standalone-skill path vulnerable: any user invoking `/rdd-research` (or any other phase skill) directly on an existing corpus would still hit the loop because no orchestrator was there to set the field.

The deeper observation: the Stop-hook block was never a real wall. Claude Code's Stop hook returning `{"decision":"block"}` feeds the reason back to the agent as next-turn context — the agent processes the message and continues. The "structural prevention" property the block claimed (ADR-064 Harness Layer) was always more cosmetic than load-bearing. Its real cost was producing runaway loops at any Stop event during a phase where the manifest's required artifacts could not yet exist.

The methodology's actual defenses are unaffected by this change:
- Skill-text guidance (always firing) remains the primary driver of "do the audits, write the gate note, run the snapshot."
- The dispatch-log compound fabrication check (ADR-064) still emits its advisory message identifying artifacts that exist without a corresponding logged dispatch — now in all modes, not only enforcement.
- Audits run in isolated subagent contexts (Architectural Isolation) — untouched.

### Hook change (`hooks/scripts/tier1-phase-manifest-check.sh`)

- Manifest check always emits advisory (`allow_with_message`) when failures are found — never blocks. Same content as the prior block reason; same call to action ("specialist subagents must produce these via isolated dispatch"). Just no decision-block.
- Compound fabrication check fires in all modes, not only enforcement. Output is the same advisory format.
- The `ENFORCEMENT_MODE` variable is retained for the migration-version detection it carries but no longer gates the manifest-block branch (which is gone).
- The In-progress phase predicate (introduced v0.8.2) is retained as an advisory-noise suppressor during phase work.

### Orchestrator skill (`skills/rdd/SKILL.md`)

- Phase entry/exit subsection rewritten to reflect advisory semantics. The two-step phase-exit procedure (remove the field; advance Current phase only after the advisory is clean) is still recommended, but is no longer described as load-bearing for correctness — the advisory is information for the agent, not a wall.
- Per-field documentation for `**In-progress phase:**` updated to clarify its role is suppressing advisory noise, not gating correctness.

### Tests

- `test_in_progress_phase.sh`, `test_in_progress_gate.sh`, `test_parses_cycle_stack_phase.sh`, `test_applicable_when.sh`, `test_legacy_format.sh` all updated. Assertions changed from `assert_block_decision` to `assert_no_block` plus `assert_stdout_contains` for the advisory message content (the message is what proves the parser/predicate worked).
- All 8 hook tests pass.

### Methodology scope-of-claim

The methodology's claim about Harness Layer enforcement is honestly weakened. ADR-064 / ADR-067 should be updated in-cycle to reflect this — Cycle 017's readability theme is the natural home for that work. Per ADR-069 scope-of-claim discipline, advisory-with-skill-discipline is closer to the system's actual behavior than advisory-or-block.

## v0.8.2

Patch release: fixes a Stop-hook loop at RESEARCH Step 1.1 that blocks every mid-phase turn-end, not just phase-exit attempts. Observed during Cycle 017 entry — the hook fires the per-phase manifest check on every Stop event, but the RESEARCH manifest requires artifacts (research-design-review, citation audit, argument audit, susceptibility snapshot, gate reflection) that cannot exist until later workflow steps. At pre-dispatch steps where the agent is awaiting user input, every turn-end hits the block and the user sees a runaway wall of block messages.

### Hook change (`hooks/scripts/tier1-phase-manifest-check.sh`)

- **New `**In-progress phase:**` predicate (introduced in v0.8.2).** When the active entry carries `**In-progress phase:** <phase>` and the phase matches the currently-active phase, the entire manifest check short-circuits with a one-time session advisory. Removing the field invites the next Stop to fire the manifest check against the still-current phase — blocks on unmet obligations, allows on clean exit. The orchestrator sets the field at phase entry and removes it at phase-exit readiness.
- Legacy cycles without the field retain prior behavior (manifest check on every Stop). New cycles get the field set by the orchestrator automatically.

### Orchestrator skill (`skills/rdd/SKILL.md`)

- **Phase entry/exit discipline documented.** New subsection specifies the two-step phase-exit procedure: (1) remove `**In-progress phase:**` to invite verification; (2) advance `**Current phase:**` only after the manifest check passes.
- Cycle-status.md schema template updated with the new field.
- Per-field documentation for `**In-progress phase:**` added alongside the other cycle-shape fields, with cross-reference to ADR-083.

### Test (`hooks/tests/test_in_progress_phase.sh`)

- Positive case: field present, names current phase → short-circuit.
- Mismatch case: field present but names a different phase → check still fires.
- Negative case: field absent → check fires normally (legacy behavior preserved).

All 8 hook tests pass.

### Known limitations

- A nonconforming agent that advances `**Current phase:**` without removing `**In-progress phase:**` first will silently skip the phase's manifest verification. The skill text declares this a methodology violation; a future hook hardening (PreToolUse on cycle-status.md edits) could enforce it structurally. Scoped as a follow-up.
- Cycles started before v0.8.2 do not have the field set. If a pre-v0.8.2 cycle resumes under v0.8.2 without the field, the hook continues to fire on every Stop. Either add the field manually or continue as before — both are correct.

## v0.8.1

Patch release: codifies dispatch-prompt discipline and subagent trust-model rules surfaced during Cycle 016 BUILD-exit remediation. No methodology-level changes; small edits to the orchestrator skill and snapshot-evaluator agent plus one artifact remediation.

### Orchestrator skill (`skills/rdd/SKILL.md`)

- **Dispatch prompt discipline (load-bearing).** Dispatches to any specialist subagent (snapshot evaluator, argument auditor, citation auditor, research methods reviewer, conformance scanner) MUST include a literal line of the form `Output path: <path>`. The PostToolUse hook `tier1-verify-dispatch.sh` grep-matches this literal; paraphrases (markdown headers, "Write your output to:" prose) produce `expected_path: null` in the dispatch log, which the Tier 1 manifest check treats as a fabrication signal even when the dispatch is legitimate. Phase-skill briefs already include the line in the correct format — pass them through verbatim.
- **Subagent dispatch-log prohibition.** Subagents MUST NOT write to `dispatch-log.jsonl` to patch missing or malformed entries. A subagent writing its own entry is a trust-model violation: the log is authoritative only if the PostToolUse hook is the sole writer. Defects should be reported in the artifact body; re-dispatch with a corrected prompt is the remediation.
- **Repeated-block Stop-hook guidance.** If a Stop hook blocks with the same error across multiple turns without new information from the user, surface the issue once and stop. Do not repeat the analysis on each fire. Prefer autonomous remediation (e.g., re-dispatching a malformed subagent call) over re-surfacing options.

### Snapshot-evaluator agent (`agents/susceptibility-snapshot-evaluator.md`)

- Explicit prohibition on writing to `docs/housekeeping/dispatch-log.jsonl` or any other dispatch-tracking artifact. Defects should be reported in the snapshot body.

### BUILD-exit remediation (Cycle 016)

- `docs/housekeeping/audits/susceptibility-snapshot-016-build.md` re-dispatched with a proper `Output path:` literal prompt. Two prior attempts archived as `.pre-verification.md` and `.pre-verification-2.md`. Manually-written dispatch-log entry from the first re-dispatch removed. Dispatch log now has a clean hook-written entry with non-null `expected_path`.
- Snapshot finding (unchanged on substance): advance with three advisory carry-forwards, no Grounding Reframe warranted. Architect-boundary reframe on ADR-077 aspirational triggers held through BUILD.

### Known follow-ups

Other agent files (citation-auditor, argument-auditor, conformance-scanner, research-methods-reviewer, orientation-writer, lit-reviewer, spike-runner) do not yet carry the dispatch-log prohibition. The rule is universal but the sweep is deferred as a follow-up issue. A fallback extractor in `tier1-verify-dispatch.sh` that tolerates common `Output path:` paraphrases (markdown headers, bold variants) is also candidate scope for a future patch.

## v0.8.0

Cycle 016: Methodology Seams. A batch cycle addressing seven issues (#10–#16) with targeted methodology interventions at the boundaries where RDD specifies the shape on each side but not the relationship between them. Ten new ADRs (073–082) across DECIDE, ARCHITECT, BUILD, RESEARCH, CONFORM, and the hook / cycle-status schema close structural gaps surfaced in prior cycles. The structural-first / cognitive-second principle held across the seven issues — ADRs 073/074/075/076/078/079/080/081 carry first-line structural enforcement (Skill-Structure Layer, Harness Layer, or canonical-path artifact); ADR-077 carries the second-line conversational layer at BUILD pattern reuse; ADR-082 step-anchored its research-entry protocol into Skill-Structure Layer with a cognitive component.

### DECIDE skill — criterion verification, supersession workflow, preservation scenarios (ADRs 073/074/075)

- **Cycle Acceptance Criteria Table (NEW — Step 4, ADR-073)** — four-column table (Criterion / Specified layer / Verification method / Layer-match check) bridging product-discovery's workflow language to scenarios' action language when criteria are emergent, aggregate, or specify an integration layer scenarios stub. Lives in `scenarios.md` as a top section or in a separate `acceptance-criteria.md`. Null-coverage judgment note for all-atomic cycles. BUILD Step 5.5 reads the table as its input.
- **Role separation — historical record vs. current state (NEW — Step 2, ADR-074)** — explicit statement that ADRs serve the historical-record role (value: fidelity to the moment of decision) while `system-design.md` / `ORIENTATION.md` / `domain-model.md` / `field-guide.md` serve the current-state role (value: currency). ADR template updated with Rejected alternatives + Provenance check sections; status values expanded to `Proposed | Accepted | Updated by ADR-NNN | Superseded by ADR-NNN | Deprecated`.
- **ADR Supersession Workflow (NEW — Step 2.5, ADR-074)** — body-immutable / status-mutable rule; supersession header format (`> **Superseded by ADR-NNN on YYYY-MM-DD.**`) and update header format (`> **Updated by ADR-NNN on YYYY-MM-DD.**` — IETF *Updates* analog); four-step workflow (file superseding ADR → add dated header + update status on old → downstream sweep across four artifacts → record in cycle-status); fitness property for sweep verification; drift resolution decision tree (implementation divergence vs. supersession vs. drift-without-supersession); explicit relationship to the invariant-specific Step 3.7 backward propagation.
- **Preservation Scenarios (NEW — Step 4, ADR-075)** — negative-space complement to behavior scenarios. For each feature-scenario block touching existing modules, at least one `### Preservation:` block asserting an existing observable behavior remains unchanged. Three selection sources outside the new feature's frame (assumption inversions, existing scenarios, system-design provenance) — partial mitigation for authorship-time Einstellung. Null-coverage judgment note for wholly-isolated modules. Refutability standard matches behavior scenarios.
- **Supersession gate check (NEW — Step 5, ADR-074)** — before presenting, verify every new ADR that supersedes a prior one has the corresponding header + status-field update on the old ADR and that the four-artifact downstream sweep has been discharged (or explicitly deferred with rationale in `cycle-status.md`).

### ARCHITECT skill — qualitative claim decomposition hard gate (ADR-076)

- **Qualitative Claim Identification (NEW — Step 5)** — agent walks module responsibilities and responsibility-matrix entries flagging quality language (transparent, seamless, backward-compatible, performant, lossless, isolated, etc.). Concrete, already-testable responsibilities carry no overhead.
- **Fitness Property Format (NEW — Step 9)** — single-line format: `**Fitness:** <observable property> — <how observed/measured>`. Placed inline within the responsibility-matrix entry (when one property suffices) or in a per-module **Fitness** subsection (when multiple). Refutability standard matches scenarios.
- **Compositional pathways** — fitness properties feed forward: ADR-073 criteria table (layer-specifying properties), ADR-075 preservation scenarios (scenario-decomposable properties), ADR-077 prompt 4 (fitness-property consultation at BUILD pattern reuse).
- **Resistance-to-decomposition signal** — genuinely qualitative properties (developer experience, learnability) that resist decomposition are surfaced as *direction-not-constraint* framing explicitly rather than letting undecomposed claims stand as silent constraints.
- **Hard gate (NEW — Step 10 item 7)** — ARCHITECT phase refuses to advance when a qualitative claim remains undecomposed; undecomposed claim surfaced by name. Tier 2 skill-text enforcement (conversational layer; not hook-verified — ADR-076 explicitly rejected LLM-subagent delegation of the decomposition per Invariant 0).
- **System-design template updated** — optional **Fitness** subsection under module Purpose; responsibility-matrix inline-fitness convention; clarified split between system-level criteria (table) and module-level fitness (inline with claim).

### BUILD skill — criterion verification step + applicability-check stewardship (ADRs 073/077)

- **Step 5.5 Cycle Criterion Verification (NEW)** — inserted between Step 5 (Integration Verification) and Step 6 (Generate Field Guide). Reads the Cycle Acceptance Criteria Table; walks each entry; handles Layer-match `yes` via composing-scenario verification; handles Layer-match `no` by writing or identifying an integration test or harness at the criterion's specified layer; triggers a Design Amendment when the specified layer is unreachable from the test harness.
- **Tier 1b: Applicability Check (NEW — ADR-077)** — triggered stewardship prompt, not always-on. Tier 2 conversational mechanism per ADR-058. Operative trigger: explicit conversational reference to an existing pattern as template. Aspirational triggers (structural-similarity detection, copy-shape detection) listed for scope-of-claim honesty; classified explicitly as having no current substrate.
- **Four-prompt form with composition-not-recitation rule** — each prompt contains the actual pattern, original context, new context, and declared fitness properties in the bracketed slots. Prompt 4 is the ADR-076 integration point (reads `**Fitness:**` properties from `system-design.md`; null case records "No declared fitness properties for this module" as judgment, not silent skip).
- **Outcomes** — substantive answer → proceed with recorded reasoning; genuine concern → pause and evaluate; unanswerable prompts → Grounding Reframe (ADR-068 extension) with name-the-gap / offer-grounding-actions / make-decision-visible.
- **Batched application affordance** — refactoring-heavy sessions may batch the check across a coherent batch of analogous reuses rather than per-file, preserving the schema-comparison intervention while reducing ceremonial-recitation pressure.

### RESEARCH skill + reviewer agent + orchestrator — question-isolation at research entry (ADR-082)

- **Five-step Question-Isolation Entry Protocol (NEW — Step 1)** — first-line structural (Skill-Structure Layer per ADR-067) with a cognitive component in the constraint-removal prompt wording:
  1. User articulates research question(s) in the research log as the entry's first content, before any artifact corpus is read for this research entry
  2. Agent composes a *specific-artifact-named* constraint-removal prompt; user responds
  3. Research-methods-reviewer dispatch evaluates the question set + constraint-removal response as one reviewable set, with four criteria
  4. User revises or accepts flagged issues with recorded rationale
  5. Research loop begins
- **Greenfield / irreplaceable-artifact cases** — greenfield case records a one-line null answer (`"No consequential prior artifacts to bracket"`); irreplaceable-artifact case records the judgment with a one-sentence justification. The structural anchor is the recorded engagement.
- **Research-methods-reviewer fourth criterion (NEW — Incongruity Surfacing)** — flags when the research context contains a simple-vs-complex adjacency the question set does not examine. Process §3 (Prior-Art Treatment) extended so the criterion can be satisfied by the constraint-removal response when the question set itself is artifact-framed. Two-artifact evaluation scope (question set + constraint-removal response as one review unit).
- **Question Toolkit seventh form — Constraint-removal (NEW)** — "What would we build if [key infrastructure component] were not available?" Primary form for the research-entry moment; available throughout the cycle when an artifact's gravitational pull is suspected. The six existing forms remain unchanged.
- **Essay 015 §10 reclassification** — the protocol was originally grouped under "second-line cognitive" with ADR-077; DECIDE-phase analysis reclassified it as "first-line structural with cognitive component" because the five-step workflow step-anchors in the skill file with mechanically-observable outputs. WP-F implements the reclassified shape; field evidence across future research cycles will test whether the classification holds in practice.

### Multi-cycle Cycle Stack schema + hook layer (ADRs 078/079/080/081)

- **`## Cycle Stack` schema (NEW — cycle-status.md, ADR-078)** — file represents a stack of cycle entries with the active entry on top; `### Active:` / `### Paused:` section headers; per-entry fields include `**Cycle number:**`, `**Started:**`, `**Current phase:**`, `**Cycle type:**`, `**Parent cycle:**`, `**Phase at pause:**`, `**Spawned by:**`, `**Pause-on-spawn policy:**`, `**Continue-parent rationale:**`, `**In-progress gate:**`. ADR-072's two fields (`**Skipped phases:**`, `**Paused:**`) fold in as per-entry fields. Orchestrator template updated with the new schema and nested-cycle spawn procedure.
- **Parent close policy — pause-parent / continue-parent (NEW — ADR-078)** — Temporal's Parent Close Policy pattern adapted to RDD's human-paced epistemic units. Default: spawning a nested cycle pauses the outer; `continue-parent` requires a one-line `**Continue-parent rationale:**` field. When a `continue-parent` inner cycle is active, the outer cycle's manifest checks are not enforced — the deliberate scope-of-enforcement choice is reviewable in the rationale field.
- **Non-interrupting Stop predicate (NEW — ADR-079)** — `**In-progress gate:**` field set by the orchestrator at AID-gate start (format: `<source-phase> → <target-phase>`), cleared when the gate reflection note is written. While present on the top entry, the Stop hook's gate-reflection-note check returns allow for the source phase only; all other manifest checks continue to fire.
- **Scope-adaptive enforcement via `applicable_when` preconditions (NEW — ADR-080)** — per-manifest-entry `applicable_when` block with five precondition primitives (`cycle_type_in`, `cycle_type_not_in`, `phase_not_skipped`, `parent_cycle_present`, `parent_cycle_absent`). Hook evaluates preconditions before each manifest check; records `skipped: applicable_when condition <X> not met` in dispatch log.
- **Grandfathered enforcement for pre-ADR-072 cycles (NEW — ADR-081)** — Stop hook detects legacy single-entry format and applies advisory mode for that cycle's manifest checks regardless of corpus `.migration-version` state. Grandfathered window ends on per-cycle migration via `/rdd-conform` Operation 8.
- **Stop hook enhancements** — `hooks/scripts/tier1-phase-manifest-check.sh` gains the Cycle Stack parser, in-progress-gate predicate, applicable_when evaluator, and legacy-format detection; `hooks/manifests/tier1-phase-manifest.yaml` gains optional `applicable_when` and `artifact_type` fields per entry.
- **New `hooks/tests/` infrastructure** — `lib.sh` (shared helpers, fixture writers, assertion library) + `run_tests.sh` harness + six scenario tests. Extensible for future hook work.

### CONFORM skill — Cycle-Shape Audit (ADR-081)

- **Operation 8: Cycle-Shape Audit (NEW)** — detects pre-ADR-072 `cycle-status.md` entries and walks the user through migrating each one to the current ADR-078 Cycle Stack schema while preserving the legacy prose body verbatim. Four-step workflow (Detect / Read and Infer / Prompt / Write Migrated Entry). Migration record added to the entry's Pause Log (`Migrated from pre-ADR-072 format on YYYY-MM-DD`). Opt-in per cycle. Cycle 8 (rdd-pair) named as the validation case.
- **Operations table expanded** — from seven to eight operations; new entry describes when to use cycle-shape audit (resuming pre-v0.7.0 paused cycles; unarchiving legacy cycles from `docs/cycle-archive/`; preparing corpora with multiple legacy cycles).

### Issue #15 — PostToolUse dispatch logger regex fix

- **`hooks/scripts/tier1-verify-dispatch.sh` line 59 regex extended** — now matches markdown-formatted variants of `Output path:` (bold, backticked path, fully backticked line, list-item form) alongside the canonical plain-text form. Before, the regex required plain text with no formatting; legitimate dispatches with markdown-bold labels silently logged `expected_path: null` and tripped the Stop hook's fabrication-suspicion message. Same failure-mode class as Cycle 10 WP-F Findings #7 and #9 — a specification-execution gap between prose guidance and regex enforcement surfaced only under operational conditions.
- **`hooks/tests/test_output_path_regex.sh` (NEW)** — 9 assertions covering all seven fixtures from Issue #15 plus two extra cases. Full hook test suite: 7/7 pass.

### Conformance re-scan + inline remediation

- **Cycle 016 BUILD-exit conformance re-scan** — `docs/housekeeping/audits/conformance-scan-build-exit-016.md`. Of the 40 gaps surfaced by the DECIDE-time scan, 38 closed, 1 partial (ADR-082 filename convention — deliberate BUILD decision retaining the prior path name), 1 still open — the still-open gap was a manifest / reviewer output header mismatch (`"## Per-question audit"` vs. `"## Per-Question Review"`) that the Tier 1 Architectural Isolation re-scan caught despite the in-context agent having drifted past it during the WPs. Fixed inline in the same commit series.
- **Field evidence for the methodology catching its own specification-execution gaps** — the same failure-mode class as Cycle 10's nine verification-surfaced defects, recurring at the methodology boundary between hook and agent contracts.

### Issue #10 live validation

- **ADR-071's three-sided catch did not fire during Cycle 016 BUILD because the BUILD work shape was methodology amendments (skill text), not code with shared mutable state.** This is itself the observation: ADR-071 is designed for component-level integration risk at lifecycle boundaries, and a text-only BUILD phase does not exercise that risk surface. The three anchors (design-time prompt in COMPOSABLE TESTS, verification-time anchor in Step 5, review-time detector in Stewardship Tier 1 sub-item 6e) remain available for future cycles with code-level shared-state work. The honest scope-of-claim per ADR-069: ADR-071 applies when it applies; the methodology does not over-claim that every BUILD phase exercises every mitigation.

### Cycle 016 closure

- **Ten ADRs** (073–082), **eight work packages** (A–H), **seven issues addressed** (#10 live validation, #11–#16 structural amendments, #15 regex fix).
- **Seven argument-audit passes** on DECIDE artifacts (cleared at pass 2 with one revision); **two susceptibility snapshots** (decide → architect clean; architect → build produced a Grounding Reframe on ADR-077 aspirational triggers — resolved at gate by reclassifying to operative-only).
- **Plugin versions**: v0.7.3 → v0.8.0.
- **Batch cycle shape as live validation for Issue #14** — the single `cycle-status.md` schema did hold across seven issues with mixed research depth; hook friction, gate-state ambiguity, and resume/pause events across the cycle's execution were recorded as field evidence alongside the literature research. The new Cycle Stack schema (ADR-078) and non-interrupting Stop predicate (ADR-079) ship together, tested against Cycle 016's own use.

## v0.7.3

Cycle 15: Lifecycle Composition in Build Stewardship. Mini-cycle (DECIDE + BUILD only) adding a third integration-risk category to `/rdd-build` and, mid-cycle, cycle-shape declaration fields in `cycle-status.md` honored by the Stop hook in response to a live hook-loop that surfaced during the DECIDE gate itself.

### Lifecycle Composition in build stewardship (ADR-071)

- **COMPOSABLE TESTS §Lifecycle Composition (NEW)** — a third case alongside The N × M Problem, naming shared mutable state as an independent axis. When components share mutable state — cached buffers, pooled connections, retained registry entries, or any returned reference that aliases internal state — the integration test must exercise the production lifecycle sequence, not just individual operations. If component A hands a resource to B and B mutates or disposes it, the test must verify A's retained reference survives B's actions (ADR-071)
- **Step 5 Integration Verification — lifecycle-sequence guidance (NEW)** — an explicit paragraph specifying the ordered sequence (caller obtains → mutates/disposes → original component's retained reference re-read to verify invariants) with cross-reference to the design-time framing
- **Stewardship Tier 1 Test quality sub-item 6e Shared mutable state (NEW)** — adjacent to Boundary coverage and Wiring verification; the review-time detection check that fires when a module boundary crossed in the scenario group involves a returned value aliasing internal state
- **Three-sided catch** — the three anchors (design-time prompt, verification-time anchor, review-time detector) form a three-sided catch; developers land on the anchor relevant to their current task; cross-references between all three
- **Three glossary entries added** — Lifecycle Composition (the category), Shared Mutable State (the bug class), Lifecycle Boundary (the boundary class distinguished from type and structural boundaries)
- **Scoped to build skill only** — debug, refactor, review skills unchanged; the category composes with them via ADR-048 mode shifts

### Cycle-shape declaration (ADR-072)

- **`**Skipped phases:**` optional header field (NEW)** — enumerated phases this cycle does not run, canonical lowercase (`research`, `discover`, `model`, `architect`, `play`, `synthesize`), comma-separated; absent = standard full-pipeline cycle; present = Stop hook treats enumerated phases as having no required artifacts
- **`**Paused:**` optional header field (NEW)** — declares the cycle deliberately dormant (format: `YYYY-MM-DD — reason`); Stop hook short-circuits all per-phase manifest checks and emits a one-time advisory notice per session via `/tmp/rdd-pause-notice-${SESSION_ID}` (distinct marker from `/tmp/rdd-advisory-${SESSION_ID}` so the two don't collide)
- **Pause Log section (NEW)** — audit trail of pause/resume events preserving Invariant 8 observability; appears only when the cycle has been paused at least once
- **Stop hook honors both fields** — `hooks/scripts/tier1-phase-manifest-check.sh` gains Paused short-circuit and Skipped phases short-circuit branches; SESSION_ID extraction hoisted out of the advisory-mode block so both notice types can share it; phase names canonicalize to lowercase for case-insensitive matching
- **Cycle Status template in orchestrator skill** — `skills/rdd/SKILL.md` documents the two fields and the Pause Log convention with explanatory prose wiring ADR-064 and ADR-072
- **Known gap documented and deferred** — in-progress-gate case (no `cycle-status.md` field can be set before Stop fires between agent turns during an active gate conversation); documented in three locations (scenarios.md deferred scenario, ADR-072 Consequences Negative, cycle-status.md Deferred Work); [Issue #14](https://github.com/nrgforge/rdd/issues/14) captures the six-question follow-up cycle brief (multi-cycle composition as first-class methodology concept)
- **Latent PostToolUse hook defect surfaced** — dispatch logger regex only matches canonical plain-text `Output path: <path>` lines, fails on markdown-bolded or backticked variants; produces `expected_path: null` and triggers compound-check fabrication suspicion even for legitimate dispatches; [Issue #15](https://github.com/nrgforge/rdd/issues/15) scoped as a separate fix

### Methodological dog-food

- **The failure mode ADR-072 addresses manifested live during the cycle** — the Stop hook cascaded blocks twice during the DECIDE → BUILD gate itself, because the single-cycle `cycle-status.md` model had no structural representation of an in-progress mini-cycle gate conversation. ADR-072 was drafted and landed in response to this live evidence
- **BUILD-entry susceptibility snapshot caught the ADR-072 gap** the in-conversation agent had drifted past (Tier 1 Architectural Isolation from Cycle 9 firing on its own evidence within a cycle about extending the catchment); recommended writing one failing-case scenario to pin down the gap, which was executed
- **Three BUILD-phase snapshot files preserved** — `.pre-implementation.md` (BUILD-entry, evaluated the design before implementation), `.pre-canonical-format.md` (first BUILD-exit attempt, archived because its dispatch prompt used non-canonical formatting that the PostToolUse regex did not match), and the canonical `susceptibility-snapshot-015-build.md` (re-dispatched with canonical prompt formatting). Preservation pattern matches the Cycle 10 WP-F precedent for artifact/log provenance gaps discovered at enforcement boundaries

### Cycle 15 closure

- **2 new ADRs** (071, 072), **15 active scenarios** satisfied (1 deferred as known gap)
- **Seven argument-audit passes** on DECIDE artifacts (clean on pass 7)
- **Mini-cycle scope** — RESEARCH / DISCOVER / MODEL / ARCHITECT skipped by explicit scoping per ADR-072's `**Skipped phases:**` mechanism; Cycle 015 is the first cycle to use the mechanism it defined (the declaration was added to Cycle 015's own `cycle-status.md` as a permanent live smoke test during WP-E)

## v0.7.2

Cycle 10 WP-F verification-surfaced remediation. Nine latent defects in the v0.7.0/v0.7.1 hook infrastructure caught by the methodology running against its own corpus in enforcement mode. All fixes land in this release. Invariant 8's compound defense is now operational end-to-end on any corpus that runs the plugin.

### Hook infrastructure fixes

- **All RDD hook scripts now read input from stdin**, not `$1`. Since v0.6.0, every input-dependent hook (`invariant-reminder.sh`, `orientation-trigger.sh`, `sizing-check.sh`, `epistemic-gate.sh`, `tier1-verify-dispatch.sh`) has been silently non-functional in Claude Code's actual runtime because `hooks.json` passed input via `$INPUT` (expected as a shell variable) while Claude Code delivers the JSON payload via stdin. Synthetic tests masked the divergence by invoking scripts directly with `$1`. Only `tier1-phase-manifest-check.sh` worked by accident — it reads `cycle-status.md` from disk and falls through on empty input — and that accidental functionality was precisely what caught the gap during WP-F. `hooks.json` drops the `"$INPUT"` argument from every command; scripts read stdin when `$1` is empty and stdin is not a terminal (backward compatible with direct invocation for test harnesses)
- **PostToolUse Tier 1 hook strips plugin namespace prefix** before matching against `TIER1_MECHANISMS`. Claude Code dispatches plugin-provided subagents with the `<plugin>:<name>` form (e.g., `rdd:susceptibility-snapshot-evaluator`), but the mechanism list used bare names. Every prefixed dispatch silently skipped logging, breaking the compound check's cross-reference entirely. `${SUBAGENT_TYPE#*:}` normalizes the name; the original prefixed form is preserved in the dispatch log's `subagent_type` field for forensic record
- **Stop hook schema conformance** — replaced `{"decision":"allow",...}` with plain-text stdout (advisory mode, matching the convention of the project's other stdout-based hooks) and schema-valid `{"decision":"block",...}` (enforcement mode). Claude Code's Stop hook schema only accepts `"approve" | "block"` for the `decision` field; emitting `"allow"` failed JSON validation every invocation and the advisory notice never reached the agent
- **Stop hook E1 dispatch detection is cycle-sensitive.** Matches on mechanism name AND substituted `expected_path`, mirroring the enforcement-mode compound check. Without this, prior-cycle dispatch log residue produced misleading "dispatched but no artifact" messages at the current cycle's phase boundary
- **PostToolUse hook emits JSON `null` (not string `"null"`)** for missing Output path lines. `jq --argjson` replaces `jq --arg` when the path is absent, so downstream queries like `jq '.expected_path == null'` work correctly
- **Distinguish user-tooling mechanisms from subagent dispatches.** The manifest supports a `mechanism_type: user-tooling` field for `aid-cycle-gate-reflection` entries. In enforcement mode, the compound check's dispatch-log cross-reference no longer applies to user-tooling mechanisms — gate reflection notes are produced by the orchestrator in-context, not by an isolated subagent dispatch, so they have no dispatch log entry by design. The structural floor (E1/S1/S2/S3) still applies; the Susceptibility Snapshot at the same phase boundary is the complementary content-level defense

### Migrate subcommand fixes

- **`/rdd-conform migrate` Step 6 includes `docs/system-design.md`** in its mechanical path substitution file list. The system design document contains multiple pre-migration path references (Appendix A per-phase susceptibility snapshot briefs, Test Architecture table, Integration Contracts notes) that were previously not updated by the migration operation, leaving the file in an inconsistent mix post-migration
- **`/rdd-conform migrate` Step 5 rewrites internal relative links in the moved `cycle-status.md`.** When the file moves from `docs/` to `docs/housekeeping/`, its own `./essays/...`, `./product-discovery.md`, `./domain-model.md`, `./system-design.md`, and `./roadmap.md` references need to be rewritten for the new directory depth. Order matters: `./essays/audits/` → `./audits/` must run before `./essays/` → `../essays/`

### Verification evidence

- **First live operational Tier 1 dispatch in project history.** The build-phase susceptibility snapshot fired via the ADR-065 Skill-Structure anchor without ceremonial attention, produced a substantive artifact, was logged by the PostToolUse hook, cross-referenced by the Stop hook compound check, and cleared the build phase boundary block. ARCHITECT phase open question 1 (does the per-phase dispatch actually fire under task load?) is answered empirically: **yes**, and the harness layer captures it
- **First gate reflection note.** The User-Tooling Layer graduated-artifact mechanism (ADR-066) produced its first real artifact at `docs/housekeeping/gates/014-build-gate.md` with all five required headers and four required fields, successfully satisfying the manifest check
- **Three preserved historical snapshots** at `docs/housekeeping/audits/` — `.pre-prefix-fix.md` (first live dispatch that surfaced Finding #7), `.post-prefix-pre-stdin.md` (second dispatch that surfaced Finding #9), and the canonical build snapshot (third, through the fully-fixed chain). The preservation pattern is itself a methodology commitment: Option B (preserve-and-re-dispatch) is the right remediation for artifact/log provenance gaps discovered at enforcement boundaries

### Cycle 10 full closure

- **57 scenarios verified** across two releases (44 v0.7.0 + 13 v0.7.1). All PASS
- **Nine remediation commits** during WP-F verification, each numbered in `docs/housekeeping/cycle-status.md`
- **Cycle 11 candidate research question surfaced:** *what categories of behavior are structurally unreachable by specification-conformant synthetic tests, and which warrant runtime-level testing infrastructure?* A runtime smoke test that fires an actual subagent dispatch and verifies the dispatch log is populated would have caught Findings #7 and #9 before WP-F

## v0.7.1

Housekeeping migration and post-migration path alignment.

- **`/rdd-conform migrate` subcommand (NEW)** — one-shot, opt-in operation that moves infrastructure artifacts (`docs/essays/audits/` → `docs/housekeeping/audits/`, `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`), creates `docs/housekeeping/gates/` for gate reflection notes, performs mechanical path substitutions across the corpus, writes `docs/housekeeping/.migration-version` to enable enforcement mode, and produces a rollback manifest + summary report. Idempotent, refuses uncommitted skill changes, excludes cycle-archive and centered prose (ADR-070)
- **Post-migration canonical paths** — all skill file `Output path:` lines and manifest `path_template` values updated from `docs/essays/audits/` to `docs/housekeeping/audits/`. Ships atomically with the migration tool per ADR-070's lockstep requirement. Pre-migration corpora continue to work in advisory mode
- **Stop hook dual path support** — checks both `docs/cycle-status.md` (pre-migration) and `docs/housekeeping/cycle-status.md` (post-migration) for phase and cycle detection
- **Three new `/rdd-conform` audit scopes (NEW):** housekeeping directory organization audit (detects pre-migration state, orphaned files), gate reflection note template alignment audit (ADR-066 template compliance), dispatch prompt format audit (ADR-065 canonical skeleton and position verification). All produce finding reports without auto-correcting
- **Conform skill expanded to 7 operations** (was 3): audit, remediation, drift detection + migrate, housekeeping audit, gate note audit, dispatch prompt audit

## v0.7.0

Structural enforcement for Invariant 8 — mechanism execution must be structurally anchored.

### Cycle 10: Specification-Execution Gap (WP-A through WP-D)

- **Per-Phase Manifest (NEW)** — YAML manifest at `hooks/manifests/tier1-phase-manifest.yaml` declares required Tier 1 artifacts per phase with canonical paths, size floors, required headers/fields, and audited document references; consumed by the Stop hook for verification; format version 1 with `{cycle}` and `{phase}` token substitution (ADR-063)
- **Compound Check hooks (NEW)** — two hooks implementing the Harness Layer: PostToolUse hook logs every Tier 1 subagent dispatch to `docs/housekeeping/dispatch-log.jsonl` with mechanism, path, and timestamp; Stop hook cross-references dispatch log against manifest to catch State B (missing artifact), State C (fabricated audit), and subagent failure; four distinct failure-mode reasons in block messages (ADR-064)
- **Advisory/enforcement mode split** — Stop hook detects `docs/housekeeping/.migration-version` marker; pre-migration corpora run in advisory mode (non-blocking stderr notice, once per session); migrated corpora run enforcement mode with compound check blocking; Fails-Safe-to-Allow with GitHub issue template surfacing on hook-script errors (ADR-064)
- **Revision-aware re-audit reminder** — Stop hook compares audited document mtime against dispatch log timestamps; fires non-blocking model-visible reminder when documents modified after last audit dispatch; substantiality judgment remains human (ADR-064)
- **Per-phase susceptibility snapshot dispatch** — all 8 phase skills gain a "Phase Boundary: Susceptibility Snapshot Dispatch" subsection at the bottom-third position with phase-specific briefs grounded in Cycle 10 findings; replaces orchestrator-centralized dispatch instruction; the primary fix for the 0% historical coverage gap (ADR-065)
- **Canonical `Output path:` lines** — all Tier 1 dispatch prompts in research, decide, and synthesize skills updated with regex-parseable `Output path:` lines; the skill-hook contract enabling PostToolUse extraction (ADR-065)
- **Gate reflection note protocol (NEW)** — AID cycle at phase boundaries graduated from conversational to artifact-producing; gate reflection note written to `docs/housekeeping/gates/{cycle}-{phase}-gate.md` with required structure (belief-mapping question, user response, pedagogical move, commitment gating outputs); AID Interpret privacy preserved across media; 6 gated phases (play/synthesize exempt per ADR-016/038); manifest entries enforce note existence (ADR-066)
- **Compound defense documented** — three components at phase boundaries covering non-overlapping failure modes: manifest check (structural floor), susceptibility snapshot (content ceiling), belief-mapping (pre-artifact zone); count-extensible pattern; reframe-derailed gate limitation named as load-bearing (ADR-066)
- **Three-Tier Enforcement Classification** — methodology-level taxonomy with four-step decision procedure: Skill-Structure Layer (step-anchorable) → Harness Layer (hook-verifiable) → User-Tooling Layer (artifact-producible) → step 4 (cannot be Tier 1); not a priority hierarchy; mechanisms may use multiple substrates (ADR-067)
- **Grounding Reframe Extension** — protocol now fires on two triggers: unassessable sycophancy risk (ADR-059 original) and significant snapshot finding with in-cycle course-correction implications; three significance properties (specificity, actionability, in-cycle applicability); routing between feed-forward and Reframe (ADR-068)
- **Methodology Scope-of-Claim** — positive scope (competent first-order analysis, Tier 1 structural resistance, conversational mechanisms, compound defense, provenance via architectural drivers) and negative scope (agent does not independently generate second-order critique; "independent" is load-bearing; guarantee rests on mechanisms firing); advisory-mode enforcement-conditional noted (ADR-069)
- **Centered-vs-Infrastructure framing** — centered artifacts (essays, ADRs, system-design) vs. infrastructure artifacts (audit reports, dispatch log, cycle-status, gate notes); `docs/housekeeping/` groups infrastructure; corpus-visible, not hidden (ADR-064)
- **8 phase-specific snapshot briefs** in system design Appendix A, each grounded in concrete Cycle 10 findings
- **8 new ADRs** (063-070), **~45 new scenarios** (2341-2739), **Essay 014** (Specification-Execution Gap), **Invariant 8** added at MODEL, **domain model Amendment 17**

### Cycle 10 research artifacts
- **Essay 014** — "The Specification-Execution Gap in Prompt-Based Methodology" (citation-audited, argument-audited, framing-audited)
- **4 spike reports** — hook feasibility (S1), acceptance criteria with reference Stop hook (S2), corpus base-rate audit (S3), text hardening negative result (S4)
- **2 literature reviews** — instruction-following degradation, telemetry acceptance criteria
- **5 susceptibility snapshots** — one per phase boundary through ARCHITECT, all ceremonial under Invariant 8's own diagnostic

## v0.6.3

- **AID Interpret step is now strictly private** — the AID cycle was designed with Attend and Interpret as private calibration steps (the agent reads engagement signals, forms a hypothesis, adjusts its response) but skill text was narrating interpretations back to the user ("You asked about X", "You engaged with Y") as preambles to probes. This is content-level sycophancy dressed as observation — the user already knows how engaged they've been, so telling them is praise-as-observation, functionally identical to "Great question!" It also corrupts the AID architecture by leaking private calibration into the user-facing conversation, creating conformity pressure. Updated orchestrator AID protocol and all six phase skill gate sections. Probes and challenges now reference specific artifact content directly ("The essay's conclusion on X rests on Y", "ADR-NNN trades A against B") rather than characterizing the user's prior engagement. Explicit anti-pattern note added to the orchestrator's Anti-sycophancy step and Decide step preamble.

## v0.6.2

- **Re-audit after revision is mandatory** — any revision of an artifact (essay, ADRs, outline) made in response to audit findings now triggers a fresh argument auditor dispatch before the pipeline advances. The prior instruction was buried inside a conditional paragraph ("if substantial...then re-dispatch") which gave the agent wiggle room to skip the re-audit. Revisions can introduce new logical gaps, overreach, or framing issues — the re-audit catches these. The loop runs as many times as needed: audit → revise → audit → ... → clean audit. Applied to research, decide, and synthesize skills.

## v0.6.1

- **Framing audit findings surfaced to user** — the argument auditor's two sections are now handled differently: argument audit issues (logical gaps, overreaching claims) are auto-corrected by the agent, but framing audit findings (alternative framings, absent truths, content selection choices) are surfaced to the user at the gate for their judgment. Auto-correcting framing choices would be the exact content selection mechanism the research identified as where sycophancy operates. Updated in research, decide, and synthesize skills.

## v0.6.0

Sycophancy resistance as structural architecture — not just conversational discipline.

### Cycle 9: Sycophancy Resistance Architecture
- **Research Methods Reviewer agent (NEW)** — specialist subagent that reviews research design before execution; applies belief-mapping to each question ("what would the researcher need to believe for a different question to be more productive?"); flags embedded conclusions and premature narrowing; Tier 1 unconditional — fires before every research loop
- **Susceptibility Snapshot Evaluator agent (NEW)** — specialist subagent that evaluates sycophancy susceptibility signals in isolated context at phase boundaries; produces advisory snapshot with signal assessment, pattern interpretation, and Grounding Reframe recommendation; exploits the Self-Correction Blind Spot (fresh context treats prior output as external input)
- **Argument Auditor framing extension** — now produces two-section output: argument audit (logical structure) + framing audit (content selection visibility); three structural questions surface alternative framings, absent truths, and dominant framing inversion; reads source material alongside the artifact; Tier 1 unconditional
- **Question Toolkit** — six research-grounded question forms (belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, open-question reframing) with goal-first composition: determine epistemic goal → review context → select type → compose; non-formulaic requirement is a hard constraint
- **Two-Tier Sycophancy Resistance** — Tier 1 unconditional architectural mechanisms (subagent audits, susceptibility snapshots, research methods review) fire regardless of context; Tier 2 context-responsive conversational mechanisms (question forms, constraint intensity, assertion-aware observation) adapt to engagement quality; the agent cannot self-exempt from Tier 1
- **Grounding Reframe** — when sycophancy risk is unassessable, the agent names what is uncertain, offers concrete grounding actions, and makes visible what the user would be building on without grounding; not a disclaimer — an actionable fork
- **Belief-mapping as Inversion Principle form** — replaces adversarial framing as the default; "what would you need to believe for the alternative to be right?" achieves near-zero preference-driven divergence vs. adversarial framing's 2-6× overcorrection (spike evidence, Essay 013)
- **AID susceptibility extension** — Attend phase reads susceptibility signals (assertion density, narrowing, framing adoption, confidence markers, declining alternative engagement) alongside engagement signals; signals recorded for isolated Susceptibility Snapshot evaluation, not evaluated inline
- **Assertion-aware observation** — semantic detection of embedded conclusions at artifact-production moments; deploys open-question reframing; Tier 2 (agent exercises judgment); accepted limitation: no Architectural Isolation
- **Essay-as-checkpoint** — every substantial change (framing audit, discovery feedback, reflection) circles back to essay revision before the pipeline advances past RESEARCH; the research phase's iterability is its structural advantage
- **8 specialist subagents** (was 6), **62 ADRs** (was 54), **~325 scenarios** (was ~280), **13 essays** (was 11)

### Cycle 8: Pair-RDD (research artifacts)
- **Essay 012** — "Trading Fours" — Pair-RDD research (citation-audited, argument-audited); paused at MODEL boundary
- **Product discovery updated** — pair-RDD stakeholder additions

## v0.5.0

AI in the loop — not human in the loop. Composable skill family for everyday building.

### Cycle 7: Composable Skill Family
- **`/rdd-debug` skill (NEW)** — hypothesis-trace-understand-fix cycle; names the misunderstanding before fixing; standalone or seamless mode shift from build
- **`/rdd-refactor` skill (NEW)** — Three-Level Refactor (smells → patterns → methodology) with AI Smell Taxonomy (novel/exacerbated/accelerated tiers); AI hygiene prompts for novel patterns separate from diagnostic detection; standalone or mode shift from build
- **`/rdd-build` rewritten** — outer loop of the composable skill family; context-reconstructive mode (orientation from tickets, codebase, breadcrumbs — no RDD corpus required); work decomposition with heuristic dependency classification; session artifacts (`session/` directory); time budget mechanism (deep/standard/focused); seamless mode shifts to debug, refactor, and review
- **Context Gathering protocol** — shared five-step orientation protocol (detect mode, prompt for breadcrumbs, fetch, synthesize, validate) defined in orchestrator, implemented by all four composable skills with per-skill adaptation
- **Mode-shift composition** — build composes debug/refactor/review as seamless lens changes, not dispatched sub-workflows; skill boundaries invisible inside the build flow; the developer stays in the thread of understanding
- **"AI in the loop" framing** — RDD inverts the "human in the loop" model; the human builds understanding, the AI is in their loop serving that journey
- **"Reflection-driven development"** — the "research" in RDD is not just upfront investigation but the ongoing practice of reflecting, looping back, and capturing what the practitioner thinks
- **`/rdd-review` updated** — MODE SHIFT FROM BUILD section; Context Gathering protocol reference; ADR-054 supersedes ADR-046 callout model
- **`/rdd-about` updated** — composable skill family overview; AI in the loop and reflection-driven framing
- **Essay 011** — "Building with Understanding: Context-Reconstructive Development as Epistemic Practice" (citation-audited, argument-audited); AI Smell Taxonomy (three tiers), productive resistance framework, five orientation questions, composable skill architecture
- **15 skills** (was 13), **54 ADRs** (was 47), **~280 scenarios** (was 288), **11 essays** (was 10)

## v0.4.2

Continued `/rdd-review` refinements from real-world use.

- **Changeset tree view** — orientation starts with a structural tree of changed files; adapts to scale (individual files for small changes, directory-level summary with cluster highlighting for 20+ files, expand on demand)
- **Codebase context in walkthrough** — each walkthrough item locates code in the repo structure (file path, neighboring files, module ownership, call relationships); the reviewer leaves knowing more about the codebase, not just the diff
- **Existing MR comments** — fetches other reviewers' comments as part of context-gathering; summarizes what's been raised, resolved, and left open so the reviewer builds on existing discussion

## v0.4.1

Post-release refinements to `/rdd-review` based on first real-world use.

- **Facilitated walkthrough** — for large changes, the skill walks through each key area one at a time with real code examples, allowing discussion and comprehension before moving on
- **Persistent review notes** — accumulates the reviewer's observations in a structured file across sessions; reviewer chooses location (RDD corpus or custom path)
- **Articulation step** — after walkthrough, presents notes back one at a time; reviewer phrases each MR comment in their own words; offers closing summary draft for reviewer to edit and own
- **No auto-formatting** — comments never get machine-generated labels (NIT:, SUGGESTION:, etc.); the reviewer's voice stays human

## v0.4.0

Code review as epistemic practice.

### Cycle 6: Code Review Utility Skill
- **`/rdd-review` utility skill** — scaffolds reviewer understanding of code changes through question-driven orientation; two operating modes (corpus-grounded within RDD artifact trail, context-reconstructive for standalone MR review); three-tier output (mechanical findings, observation→question, pure questions); test quality evaluation with mutation testing lens; time-budget adaptation (zone of proximal development)
- **Questions, not findings** — the skill produces questions that guide the reviewer's thinking rather than findings that tell them what to think; no merge verdicts, no severity ratings, no AI-authored review comments; the review belongs to the human
- **Build stewardship integration** — build skill stewardship section includes callout to invoke `/rdd-review` for epistemic review of work packages, complementing architectural conformance checks
- **Context-reconstructive mode (RDD-lite)** — for reviewing colleagues' MRs outside an RDD corpus; collaborative context-gathering (reviewer provides breadcrumbs, agent fetches and synthesizes); graceful degradation when tools are unavailable
- **Anti-patterns named** — reviewer-as-passthrough, reverse centaur, accountability asymmetry, deskilling spiral, guardrails paradox; the skill exists to counter these
- **Essay 010** — "Code Review as Epistemic Practice" (citation-audited, argument-audited); grounded in Bacchelli & Bird (ICSE 2013), CRDM model (2025), Google engineering practices, SmartBear/Cisco study
- **13 skills** (was 12), **47 ADRs** (was 42), **288 scenarios** (was 248), **10 essays** (was 9)

## v0.3.1

- **Hooks format migration** — converted `hooks.json` from flat array to record format required by current Claude Code plugin schema

## v0.3.0

Adaptive gates, play phase, and self-explanation. Two RDD cycles shipped in this release.

### Cycle 4: Play and Interaction Specification
- **Play phase** — post-build experiential discovery through stakeholder inhabitation with agent-as-gamemaster facilitation; three movements (inhabit → explore → reflect); produces field notes (#4)
- **Interaction specifications** — workflow-level specs derived from product discovery stakeholder models, filling the gap between scenarios and implementation; creates the playable surface (#7)
- **Gamemaster role** — agent actively facilitates play sessions: proposes stakeholder roles, introduces complications and inversions, shapes attention without directing outcomes
- **Graduate skill** — extracted from conform as standalone `/rdd-graduate` skill
- **Cycle status tracking** — orchestrator maintains `cycle-status.md` for cross-session state persistence
- **Field notes** — play's artifact; observational discovery records categorized by feedback destination, paired with the field guide (map/journal)

### Cycle 5: Adaptive Epistemic Gates
- **Attend-Interpret-Decide cycle** — gates read engagement signals from the conversation, form a hypothesis about user understanding, and select a pedagogical move (challenge, probe, teach, clarify, re-anchor) — replacing fixed-template prompts across all 6 phase skills
- **"Reflection time" naming** — user-facing gates are "reflection time"; "epistemic gate" stays in research/design vocabulary; dual-register convention
- **`/rdd-about` utility skill** — reports plugin version, checks GitHub for updates, provides adaptive methodology overview for new users
- **Invariant 4 amended** — "must be productive, not merely brief" replaces "5-10 minutes per gate"; constraint is on waste, not duration
- **Anti-sycophancy at gates** — agent resists praise, builds on responses, challenges deeply engaged users rather than validating them
- **Manifesto updated** — reflection time as invitation to inquiry; method-vs-implementation distinction; question-asking process; Principle 6 rewritten
- **11 skills** (was 10), **42 ADRs** (was 39), **248 scenarios** (was 228), **9 essays** (was 8)

## v0.2.0

Coverage, scoping, and session resilience improvements across the pipeline.

- **Artifact location discovery** — orchestrator and research skill scan for existing artifacts before asking where to put them (#1)
- **Audit paths co-located with essays** — audit output moved from `docs/audits/` to `docs/essays/audits/` (#2)
- **Undecided territory detection** — build phase checks scenario-ADR coverage before starting, recognizes in-flight decision gaps, and verifies decision coverage at stewardship checkpoints (#3)
- **Scenario-to-module coverage check** — architect skill verifies work packages span all modules their claimed scenarios require (#5)
- **Solution scoping in discover gate** — agent proposes a solution shape, user reflects on completeness; feeds decide with full scope reference (#6)
- **Session management in build** — guidance for scoping sessions to one WP, re-reading artifacts on resume, recognizing context-loss drift (#6)
- **Orchestrator discoverable** — removed `disable-model-invocation` so the orchestrator can be suggested and can drive the pipeline

## v0.1.0

Initial release. RDD as a Claude Code plugin.

- **9 skills**: research, discover, model, decide, architect, build, synthesize, conform, and the orchestrator
- **6 agents**: citation-auditor, argument-auditor, lit-reviewer, spike-runner, conformance-scanner, orientation-writer
- **5 hooks**: invariant reminder, epistemic gate, skill activator, orientation trigger, sizing check
- **Self-referential artifact corpus**: 7 essays, 36 ADRs, 192 scenarios, domain model, system design, product discovery
- **Manifesto**: GitHub Pages site at nrgforge.github.io/rdd
