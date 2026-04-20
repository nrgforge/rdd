# Active RDD Cycle: Multi-Issue Batch Cycle (Issues #10–#16)

**Started:** 2026-04-15
**Cycle number:** 016
**Cycle type:** Batch cycle (multi-issue, mixed research depth) — experimental shape
**Current phase:** DECIDE (next)
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
| DECIDE | ▶ Next | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
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

None yet — populated at each phase gate.

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

Cycle 016 RESEARCH phase complete. Essay 015-methodology-seams.md is citation-audited, argument-audited (with framing audit), revised, and re-audited clean. Research log archived at `./docs/essays/research-logs/015-methodology-seams.md`. Five lit-reviews in research-logs/. Gate reflection at `docs/housekeeping/gates/016-research-gate.md`. Reflections at `docs/essays/reflections/015-methodology-seams.md`.

Settled premises: structural encoding necessary, cognitive mechanisms second-line, expand/evaluate directional distinction, ADR immutability for provenance, seven issues are real gaps.

Open questions: form of structural encoding per issue, #14 as prerequisite vs. peer, stewardship augmentation without circumvention, ADR amendment/supersession distinction, batch-cycle formal support.
