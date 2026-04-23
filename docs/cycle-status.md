# RDD Cycle Status

## Cycle Stack

### Active: Multi-Issue Batch Cycle (Issues #10–#16)

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch

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
| BUILD | ▶ Next | — | — |
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

## Context for Resumption

Cycle 016 ARCHITECT phase complete. System design at v13.0 with Amendment #14 (9 module amendments, zero new modules). Roadmap has Cycle 016 work packages A–H with classified dependencies, three transition states, and three open decision points. ORIENTATION.md regenerated per ADR-021 (post-architecture milestone). Gate reflection at `docs/housekeeping/gates/016-architect-gate.md`. Susceptibility snapshot at architect → build boundary triggered Grounding Reframe on ADR-077 copy-shape detection — resolved at gate by reclassifying aspirational triggers explicitly across ADR-077, system-design v13.0 BUILD Skill amendment, Responsibility Matrix entry, Fitness Criteria entry, and interaction-specs. Closely-related Finding 8 fix (supersession-sweep fitness property) applied to Decide Skill amendment.

Per ADR-074, ADR-072 received an `Updated by ADR-078` header at DECIDE acceptance time. Downstream-artifact sweep (system-design.md, ORIENTATION.md, domain-model.md, field-guide.md provenance updates) deferred to BUILD when ADR-078 actually ships and the cycle-status format migrates from per-file to per-entry — at that point the sweep becomes the load-bearing Step 3 fitness property added to the Decide Skill amendment.

Per ADR-076 (fitness criteria decomposition in ARCHITECT) — applied recursively to v13.0 itself. Each module amendment with a qualitative claim carries decomposed `**Fitness:**` properties referenced by named tests. Snapshot Finding 8 caught the one gap (supersession sweep had no fitness property) — closed at gate.

BUILD scope is constrained by the defect-and-mitigation framing: skill-text amendments, hook-script extensions, manifest schema additions, fixture tests. Not new architectural capability. The 8 work packages are the expected work shape; the 13 new boundary integration tests are the acceptance criteria for WP-H.
