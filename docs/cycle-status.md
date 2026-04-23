# RDD Cycle Status

## Cycle Stack

### Active: Multi-Issue Batch Cycle (Issues #10–#16)

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
**Paused:** 2026-04-23 — WP-B activated enforcement mid-BUILD; exit artifacts do not yet exist. Unpause at the BUILD gate reflection, once all WP work is complete and the phase-exit susceptibility snapshot and gate reflection note are produced.

**Essay:** 015-methodology-seams.md
**Artifact base:** ./docs/
**Driving issues:** #10, #11, #12, #13, #14, #15, #16
**Plugin version during cycle:** v0.7.3

## Scoping Decision

Seven open GitHub issues worked in a single cycle with varying research depth. This is an experimental cycle shape — tests whether one RDD cycle can coherently tackle a collection of distinct issues with mixed depth, and whether the methodology's single-cycle-status.md schema can hold a batch shape.

Not themed. User explicitly cautioned against stretching for unification ("I wouldn't stretch to find a common theme if there isn't one"). Common threads may surface; they will be reported if they hold and absent if they don't. One latent unification question (#13 × #16) is named below and will be tested, not assumed.

## Live Validations Through This Cycle

Two issues will be validated by observing this cycle's execution rather than (or in addition to) by research:

- **Issue #10** (Lifecycle Composition in BUILD) — ADR-071 shipped the proposed mitigations in Cycle 015. This cycle's BUILD phase will exercise those additions in practice. If they function as specified, #10 closes with field evidence. If rough spots surface, they become new evidence.
- **Issue #14** (Multi-cycle composition / cycle-status schema) — this batch cycle shape is itself a stress test for the single-cycle schema. Hook friction, gate-state ambiguity, cross-issue dependencies, and resume/pause events during execution will be recorded as evidence alongside literature research.

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | 015-methodology-seams.md + 5 lit-reviews | Expand-outward (RESEARCH) vs. evaluate-inward (BUILD) are directionally different evaluations sharing a common vulnerability. Invariant 8 extends to cognitive resources: having the lens ≠ having it fire. Structural encoding is the first line; cognitive-mechanism design is second. |
| DISCOVER | ✅ Complete | product-discovery.md updated | User caught stale debt entries (9 items resolved but unmarked); deferred sequencing to pipeline; snapshot flagged 2 register corrections (applied) |
| MODEL | ✅ Complete | domain-model.md updated (9 concepts, Invariant 8 extended, Applicability Check refined at gate) | Applicability Check reframed: grounded alternatives from provenance + open-ended search, complementary strategies. Conway's law argument grounds the provenance approach. Snapshot clean, no reframe needed. |
| DECIDE | ✅ Complete | 10 ADRs (073–082) + scenarios + interaction-specs; argument+framing audit clean (2 revision passes); conformance scan complete; ADR-072 received `Updated by ADR-078` header | User sharpened ADR-078's Rejected Alternatives at gate via cycle-locality framing: directory schema assumes cycle-locality of artifacts; RDD's pattern is a shared durable corpus that cycles contribute to and read from. Snapshot returned advance / no Grounding Reframe with three carry-forward observations (stack-vs-directory framing examined at gate; ADR-077 copy-shape detection substrate; essay-vs-ADR-082 classification divergence). |
| ARCHITECT | ✅ Complete | system-design v13.0 Amendment #14 (9 module amendments, 30 responsibility-matrix entries, 8 integration contracts, 24 fitness criteria, 13 boundary integration tests); roadmap WPs A–H with classified dependencies + 3 transition states; ORIENTATION.md regenerated; ADR-077 aspirational triggers reclassified per Grounding Reframe; ADR-074 supersession-sweep fitness property added | Defect-and-mitigation framing established as the proportional-engineering principle for BUILD scope: nine of ten ADRs are defect-fixing or mitigation work warranting amendments-not-modules; ADR-074 is the one nuance — a recurring lifecycle discipline whose ongoing cost is real but whose structural weight is still skill-text editing. Snapshot triggered Grounding Reframe on ADR-077 copy-shape detection (resolved at gate via option (a) — reclassify aspirational triggers). |
| BUILD | ▶ In Progress | WP-A + WP-B shipped (see roadmap for per-WP status); Cycle 016 paused via ADR-072 until phase-exit artifacts exist | TS-1 operational: hook parses Cycle Stack, honors in-progress-gate + applicable_when + grandfathered advisory; BUILD (next) parens parse bug fixed. Enforcement activation surfaced an uncharted gap: mid-phase active work has no enforcement-aware mitigation between ADR-072 (overbroad) and ADR-079 (gate-only). Workaround: ADR-072 Paused during active WPs; unpause at phase exit. |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Issue Depth Calibration (pre-reviewer-dispatch)

| # | Title | Depth | Method |
|---|-------|-------|--------|
| #15 | PostToolUse regex defect | None (verification only) | Spike against fixtures |
| #10 | Lifecycle composition in BUILD | None (live validation) | Exercise in BUILD phase |
| #11 | Cycle acceptance criteria traceability | Light | Lit-review: traceability + BDD on emergent/aggregate criteria |
| #12 | ADR supersession workflow | Light | Web search: ADR practitioners (Nygard, Tyree/Akerman, ThoughtWorks) on mutability |
| #13 | Pattern reuse without applicability check | Moderate | Lit-review: analogical transfer / case-based reasoning failure |
| #14 | Multi-cycle composition | Heavy + live validation | Lit-review: nested workflow state; this cycle as natural experiment |
| #16 | Research-phase solution-anchoring | Moderate | Lit-review: anchoring / framing effects, inversion techniques |

Depth may adjust as research unfolds. User calibration: "follow our nose as we dig in."

## Latent Unification Question (named, not forced)

Whether #13 and #16 share a common mechanism — existing-artifact gravity suppressing inversion-questioning in both research-phase framing (#16) and BUILD-phase pattern reuse (#13). If the mechanism is shared, that has implications for where the Inversion Principle's procedural home should live. If not, they are distinct failure modes that happen to look related. Tested in research; reported honestly either way.

## Commitments Carrying Forward

### From DECIDE (2026-04-22)

**Settled premises:**
- Structural-first / cognitive-second ordering across the seven issues
- 10 ADRs (073–082) accepted; ADR-078's Rejected Alternatives sharpened at gate with cycle-locality framing
- ADR-072 received `Updated by ADR-078` header per ADR-074's new workflow; downstream sweep deferred to BUILD when ADR-078 ships
- Issue #14 coupling: pause-parent default; continue-parent requires `**Continue-parent rationale:**` field
- Issue #13 integrated defense: ADR-076 fitness properties → ADR-077 prompt 4 consumption; ADR-075 preservation scenarios with named Einstellung-at-authorship residual
- Issue #16 question-isolation classified as first-line structural (Skill-Structure Layer per ADR-067), reclassified from essay 015 §10's "second-line cognitive" framing
- Issues #10 (live validation in BUILD) and #15 (pure implementation) not getting ADRs

**Open questions held into ARCHITECT:**
- Copy-shape detection substrate for ADR-077's trigger (specify in BUILD-skill system-design or reclassify as aspirational)
- Whether multi-cycle schema (ADR-078) must ship before any other Cycle-016 ADR can be enforced
- Conformance-scan implementation groupings (8 groups A–H) — preserve as sequencing recommendation or restructure

**Specific commitments:**
- Module decomposition for Cycle 016 ADR cluster across skill / hook / manifest substrates
- Responsibility allocation for new fields (`**Continue-parent rationale:**`, `**In-progress gate:**`, `applicable_when`, legacy-format detection)
- Provenance chains in system-design.md for the new ADRs traced through to issue and essay 015 sections
- Fitness criteria decomposition per ADR-076 applied to ARCHITECT's own qualitative claims about the new modules

### From ARCHITECT (2026-04-22)

**Settled premises:**
- Nine module amendments; zero new modules
- ADR-074 (supersession workflow) is the one amendment with compounding ongoing cost; downstream-citation sweep is manual this cycle with `/rdd-conform` provenance audit as backstop
- 8 work packages (A–H); WP-A → WP-B is the one hard sequential chain; WP-C / WP-D / WP-F are independent starts; WP-E has implied-logic deps on C and D (stubbable); WP-G depends hard on A; WP-H depends hard on A–G
- ADR-077 applicability check triggers reclassified at architect → build gate Grounding Reframe: operative = explicit reference (Tier 2 conversational); structural-similarity and copy-shape detection are aspirational with no substrate, documented as honest scope-of-claim
- Fitness property added for ADR-074 downstream-citation sweep in Decide Skill amendment (closes architect-boundary snapshot Finding 8)
- Defect-and-mitigation framing as BUILD scope principle: skill-text amendments, hook-script extensions, manifest schema additions, fixture tests — not new architectural capability

**Open questions held into BUILD:**
- Order of TS-1 (hook-layer via WP-A + WP-B) vs. TS-2 (skill-side via WP-C + WP-D + WP-E + WP-F + WP-G)
- Whether WP-F (question-isolation protocol) ships in this cycle or is deferred to allow its first-line-structural reclassification (vs. essay §10's second-line cognitive) to test in practice
- Whether Cycle 014 PLAY is folded into this cycle's BUILD
- Copy-shape detection substrate explicitly deferred as aspirational

**Specific commitments:**
- BUILD does not introduce new architectural capability; the work shape is amendment-scale
- ADR-074's downstream sweep is manual; tooling deferred unless empirically burdensome
- All 13 new boundary integration tests from v13.0 Test Architecture are acceptance criteria for WP-H
- Conformance scan (40 gaps, 8 groups) is the punch list BUILD consumes
- BUILD stewardship Tier 1 should re-examine Decide Skill boundary strain (snapshot Finding 3) if skill text grows unwieldy
- BUILD may revisit WP decomposition if WP-E's stubbing of WP-C / WP-D dependencies proves rough (snapshot Finding 9)
- Research Skill fitness property's recursive use of "mechanically-unavoidable workflow positions" (snapshot Finding 6) candidate for tightening

## Pause Log

| # | Paused     | Resumed | Reason |
|---|------------|---------|--------|
| 1 | 2026-04-23 |         | WP-B (Cycle Stack parser + in-progress-gate + applicable_when + legacy detect) shipped mid-BUILD. With enforcement actually operating (the pre-WP-B parens bug no longer masks it), every Stop would block on missing BUILD-exit artifacts. Paused until the BUILD gate reflection is produced at phase exit. |

## Feed-Forward Signals

### From Cycle 015 (archived)
- Deferred #14 as a follow-up candidate with a six-question set — this cycle picks that thread up
- Deferred mode-shift enforcement — out of scope here unless it surfaces naturally
- BUILD-exit observed hook-cascade friction during active gate — **direct evidence for #14** (already in the corpus, not requiring new research)
- BUILD-exit observed PostToolUse regex failure on markdown-formatted `Output path:` lines — **direct evidence for #15** (already in the corpus)

### From prior essays
- Essay 013 (sycophancy and RDD reflexivity) — framing adoption vulnerabilities; relevant to #13 and #16
- Essay 014 (specification-execution gap) — Cycle 10 failure-mode class; #15 is explicitly an instance of this class per its own issue body

### From RESEARCH (Cycle 016)
1. **Expand-outward vs. evaluate-inward distinction.** RESEARCH and BUILD share a vulnerability (existing-context gravity) but face different directions. Interventions should be designed for the direction, not collapsed.
2. **Invariant 8 extends to cognitive resources.** Having an evaluation lens (Tidy First, stewardship, simple-vs-easy) in the methodology's vocabulary is not the same as having it trigger at the right moment. The Einstellung mechanism suppresses the judgment that would cause the practitioner to reach for the lens.
3. **Structural encoding is first-line defense.** Cognitive-mechanism design (applicability checks, question isolation) is causally prior but enforcement-weaker. Structural and enforcement fixes come first.
4. **X.1 confirmed: shared mechanism, different intervention points.** #13 and #16 share a mechanism family (existing-context gravity) but require direction-appropriate interventions at different pipeline stages.
5. **ADR immutability serves RDD's provenance function specifically.** The living-document alternative is valid for other use cases but introduces silent provenance drift for RDD's system-design citation chains.
6. **Multi-cycle composition may be infrastructure prerequisite.** DISCOVER should surface whether #14 must ship before other structural fixes are enforceable, or whether they can proceed independently.

### From BUILD so far (Cycle 016, 2026-04-23)

1. **Pre-existing silent Fails-Safe-to-Allow on the active cycle.** The `**Current phase:** BUILD (next)` format that ADR-078 prescribes did not match the Stop hook's pre-fix fallback regex (`[A-Z_-]+[[:space:]]+(next|▶|in progress)` — no parens). The hook had been silently allowing every Stop since Cycle 016 began, masking the methodology's enforcement architecture. WP-B's parens fix restored enforcement. This is direct evidence for essay 014's specification-execution-gap framing applied recursively to the enforcement layer that was built to catch exactly this class of failure.
2. **Mid-phase enforcement gap (uncovered by Cycle 016's existing mitigations).** ADR-072 `**Paused:**` pauses the whole cycle (overbroad — disables the compound check and re-audit reminder too). ADR-079 `**In-progress gate:**` relaxes only the gate-reflection-note check and only during an active gate conversation (correct scope, wrong trigger for mid-phase work). Neither covers "active work in the middle of a phase where exit artifacts legitimately exist only at phase boundary." Candidate scope for a future cycle or for this cycle's synthesis — not addressable within WP-B's scope.
3. **Schema-vs-enforcement tension on `**Paused:**` inside `### Active:`.** ADR-078's per-entry field table says `**Paused:**` is "paused entries only." But pragmatic enforcement-state bypass (ADR-072 semantics) places the field on the top-of-stack entry regardless of its heading. Two readings: (a) `### Active:`-with-`**Paused:**` is a schema violation; (b) heading denotes stack position, field denotes enforcement state, and the combination is valid. WP-B's hook implementation treats (b). The ADR doesn't resolve it explicitly. Worth clarifying in a future ADR or an ADR-078 supersession.
4. **Heading hierarchy inside Active entry — acceptable as-is.** WP-A kept existing body `## H2` sections inside the `### Active:` H3 wrapper without demoting them. The Stop hook parses by start-of-line regex, not heading hierarchy, so this works. Readers may find it visually odd but the cost of rewriting every H2 across every future cycle's body sections exceeds the visual-hierarchy benefit. Noted for future WP-B' if multi-entry stacks (real, not test fixture) surface an actual parsing conflict.
5. **`hooks/tests/` infrastructure available for future hook work.** WP-B introduced `hooks/tests/lib.sh` (shared helpers, fixture writers, assertion library) + `run_tests.sh` (harness) + 6 scenario tests. Future hook changes (e.g., WP-H integration tests, Issue #15 regex fixture, or hook extensions in later cycles) can extend this rather than reinventing.
6. **Paused-during-BUILD trade.** Cycle 016 is now paused via ADR-072. This disables ALL enforcement mechanisms (compound check, revision-aware re-audit reminder, etc.) for the duration of BUILD's remaining WPs. WP-level review discipline during C/D/E/F/G/H cannot rely on the hook catching fabrication or drift. Stewardship checks at WP boundaries must compensate.

## Context for Resumption

**Current state (2026-04-23):** Cycle 016 BUILD phase in progress. WP-A (cycle-status.md Cycle Stack schema migration + orchestrator template update) shipped at `b90d4a1`. WP-B (Stop hook Cycle Stack parser + in-progress-gate predicate + applicable_when evaluator + legacy detection + `hooks/tests/` infrastructure) shipped at `f158af4`. Cycle paused via ADR-072 at `8f8a14d` — see Pause Log; unpause at BUILD phase exit once phase-exit susceptibility snapshot and gate reflection note are produced.

**Next WP options (picking up in a fresh session):**
- **WP-C** (DECIDE skill amendments + ORIENTATION.md role-separation note) — independent, edits `skills/decide/SKILL.md` for ADR-073 criteria table + ADR-074 supersession workflow + ADR-075 preservation scenarios; edits `docs/ORIENTATION.md` Section 4 for historical-record/current-state role split. No dependencies.
- **WP-D** (ARCHITECT skill fitness-criteria decomposition gate) — independent, edits `skills/architect/SKILL.md` for ADR-076 qualitative-claim gate check.
- **WP-F** (RESEARCH skill + reviewer agent + orchestrator — question-isolation protocol) — independent, edits `skills/research/SKILL.md` + `agents/research-methods-reviewer.md` + `skills/rdd/SKILL.md` Question Toolkit for ADR-082. Reminder: the roadmap flagged WP-F's reclassification (from essay §10's "second-line cognitive" to ADR-082's "first-line structural") as testable-in-practice; shipping it this cycle gives field evidence.
- **WP-E** (BUILD skill Step 5.5 + Applicability Check stewardship) — implied-dep on WP-C (criteria-table format) and WP-D (fitness-property format); stubbable if either is delayed.
- **WP-G** (CONFORM skill cycle-shape audit) — hard-dep on WP-A (now satisfied); could ship any time after WP-A.
- **WP-H** (integration + release) — hard-dep on A–G.

The recommended TS-1-first sequencing has shipped A + B. TS-2 (skill-side) is now open for WP-C / WP-D / WP-F to proceed in any order. WP-G sits at TS-1 completion — small utility, hard-dep satisfied.

**Pre-WP-B context (still relevant):** System design at v13.0 with Amendment #14 (9 module amendments, zero new modules). Roadmap has Cycle 016 work packages A–H with classified dependencies, three transition states, and three open decision points. ORIENTATION.md regenerated per ADR-021 (post-architecture milestone). Architect-boundary gate reflection at `docs/housekeeping/gates/016-architect-gate.md`. Susceptibility snapshot at architect → build boundary triggered Grounding Reframe on ADR-077 copy-shape detection — resolved at gate.

Per ADR-074, ADR-072 received an `Updated by ADR-078` header at DECIDE acceptance time. Downstream-artifact sweep (system-design.md, ORIENTATION.md, domain-model.md, field-guide.md provenance updates) deferred to BUILD when ADR-078 actually ships and the cycle-status format migrates from per-file to per-entry — at that point the sweep becomes the load-bearing Step 3 fitness property added to the Decide Skill amendment. **ADR-078 has now shipped (WP-A); the downstream sweep is now due** — candidate work to bundle with WP-C or a standalone cleanup.

Per ADR-076 (fitness criteria decomposition in ARCHITECT) — applied recursively to v13.0 itself. Each module amendment with a qualitative claim carries decomposed `**Fitness:**` properties referenced by named tests. Snapshot Finding 8 caught the one gap (supersession sweep had no fitness property) — closed at gate.

BUILD scope is constrained by the defect-and-mitigation framing: skill-text amendments, hook-script extensions, manifest schema additions, fixture tests. Not new architectural capability. The 8 work packages are the expected work shape; the 13 new boundary integration tests are the acceptance criteria for WP-H.
