# Research Design Review — Cycle 019 (R2)

**Cycle:** 019 — Does RDD Over-Engineer?
**Review round:** R2 (re-audit on revised question set)
**Date:** 2026-05-15
**Inputs reviewed:**
- `docs/essays/research-logs/research-log.md` §Step 1.4 (revised driving question, dual-bracketed constraint-removal, five-branch frame, revised loop sequence)
- `.rdd/audits/research-design-review-019.md` (R1 findings — comparison baseline)
- `.rdd/cycle-status.md` (Cycle 019 feed-forward signals 1–7)

**Constraint-removal response included:** Yes (dual-bracketed, agent-generated, with scope-of-claim caveat recorded in Step 1.4)

---

## Summary

R1 surfaced 3 P1 + 4 P2 + 1 P3 + 1 informational findings. The user adopted the full recommended package. The revision is substantial: the driving question, the constraint-removal framing, the branch structure, and the loop sequence were all changed. R2 evaluates each R1 finding for remediation status, then examines new issues the revisions introduce.

Short verdict: the P1s are resolved or substantially resolved; most P2s are resolved; one new P2 and one new P3 appear. The revised set is ready for research-loop dispatch with two advisory notes the user can accept, adapt, or decline.

---

## Section A — R1 Finding Remediation Review

### Finding 3 (P1) — Mechanism presupposition in the driving question

**Original issue:** The phrase "research front-loading produces" committed to one of five candidate diagnoses before any investigation. "Produces" embedded a causal claim; "research front-loading" named the mechanism.

**Revised question:** *"Where in RDD's process, if anywhere, does elaboration accumulate beyond what practitioners find valuable — and what mechanism best accounts for it?"*

**Assessment: RESOLVED.**

The revision removes both embedded elements R1 flagged. "Where in RDD's process, if anywhere" holds the location question open across all five candidate diagnoses rather than presupposing "the early-phase chain is where." "What mechanism best accounts for it" explicitly holds mechanism open as a research output, not a premise. "If anywhere" preserves the falsifiable structure — the question now treats the affirmative, negative, and mis-framing branches as equally reachable outcomes.

**New presuppositions check:** Two residual items, both below P1 threshold.

First, "practitioners find valuable" carries a specification problem that is narrower than R1's Finding 2 (which flagged "the user actually needs" as unfalsifiable). The revised phrase is meaningfully better — it anchors on practitioners' reported valuation rather than on an external needs baseline, which is at least empirically accessible. But "practitioners" remains under-specified (discussed in Section B, new issue B1).

Second, "elaboration accumulates" still implies a directional growth model rather than a static-overhead model. This is a mild framing choice, not a presupposition that forecloses investigation — the research can find that elaboration does not accumulate (i.e., it finds no accumulation pattern) without the question resisting that finding. Not a flag; noting for completeness.

---

### Finding 8 (P1) — Artifact-shaped constraint-removal framing

**Original issue:** Two compounding artifact-shape problems. (a) All four imagined-without-it observations argued for the early-phase chain's value or equivalence — the framing defended the artifact rather than bracketing it. (b) The framing bracketed only the early-phase chain when the audit-infrastructure may be a more consequential bracketing target for the over-engineering question.

**Revised response:** Dual-bracketed (Artifact 1: early-phase chain; Artifact 2: audit infrastructure). Both artifacts now use the structured-alternatives prompt — replacing the dispersal-counterfactual prompt — and each names 4–8 structured alternatives.

**Assessment: RESOLVED — with one P2 advisory (see Section B, new issue B2).**

**Artifact-shape (a) — defense posture:** RESOLVED. The structured-alternatives prompt structurally avoids the defense-posture problem. Instead of "what would the world look like without X?" (which invites the agent to show that absence is worse), both framings now ask "what alternatives achieve the same epistemic goals at different cost profiles?" This is the correct bracketing orientation. The five alternatives for Artifact 1 and the eight alternatives for Artifact 2 each name structurally distinct methodologies or patterns rather than just the dispersal counterfactual. They are substantive in the sense that matters for research calibration: they name alternatives a lit-reviewer could actually examine (type-driven design, pair-walkthrough discovery, spec-driven development with executable specs, single-pass audit, sampled audit, user-as-auditor). These are not straw alternatives that the cycle will trivially dismiss.

**Artifact-shape (b) — wrong-artifact selection:** RESOLVED. Artifact 2 now brackets the audit infrastructure explicitly. The structured-alternatives list for Artifact 2 is notably more complete than the list for Artifact 1 (8 alternatives vs. 5), which is appropriate given that the audit infrastructure's per-cycle cost is more concretely measurable (14 specialist subagent dispatches in Cycle 018 vs. the harder-to-quantify cost of the early-phase chain).

**Straw-alternative check:** The alternatives for Artifact 1 are structurally differentiated — type-driven design, pair-walkthrough, sketch-and-iterate, spec-driven with executable specs, and decision-record-only each target different subsets of the epistemic goals the early-phase chain addresses, at different cost profiles. The trade-off notes for each are honest (each alternative names what it performs poorly on, not just what it saves). For Artifact 2, the alternatives cover the cost-reduction strategies at different granularities (per-round, per-artifact, per-mechanism, structural elimination). No entry reads as a setup for dismissal.

**The one gap:** see Section B, new issue B2.

---

### Finding 1 (P2) — Artifact-framed vs. need-framed question

**Original issue:** "Research front-loading" is artifact language. Layer A lit-review scope would be shaped by whether the question asks about practitioner experience or methodology structure.

**Assessment: RESOLVED.**

The revised question ("what practitioners find valuable") is need-framed rather than artifact-framed. This reorientation is real, not cosmetic — "practitioners find valuable" invites studies of practitioner outcomes and reported experience, which is the empirical surface Layer A needs to engage. The driving question no longer names the mechanism or the artifact as the independent variable; it treats location and mechanism as outputs of the investigation.

---

### Finding 4 (P2) — Branch B foreclosing three candidate diagnoses

**Original issue:** Three branches ("yes / no, methodology-mismatch / mis-framed") collapsed audit-infrastructure-cost, process-vs-product-conflation, and possibility-space-vs-need-space into "no-by-methodology-mismatch" without distinguishing their different remediation paths.

**Revised frame:** Five branches (A through E), mapping 1:1 to the five candidate diagnoses in cycle-status signal 5.

**Assessment: RESOLVED.**

Branch A (yes-by-front-loading), Branch B (yes-by-audit-infrastructure), Branch C (no-by-methodology-mismatch), Branch D (no-by-possibility-space-navigation), Branch E (mis-framed-as-process-vs-product-conflation) each name a distinct mechanism, a distinct amendment target, and a distinct remediation path. The five-branch frame now matches the five-diagnosis space that cycle-status signal 5 held open.

One mild structural observation: Branches A and B are both "yes" routes, but they name different amendment targets (early-phase chain vs. audit infrastructure). The question is whether a researcher could exit into Branch A+B simultaneously — i.e., whether both front-loading and audit-infrastructure are over-engineering drivers at once. The branch frame as written treats the diagnoses as mutually exclusive. In practice, the research may find compounding effects (both mechanisms contribute, at different layers). The five-branch frame is not designed as a MECE partition; it is a diagnostic space. This is fine for the research phase — the synthesis loop will integrate — but the researcher should not feel that finding evidence for Branch A forecloses inquiry into Branch B. No action required; noting for research-loop design.

---

### Finding 5 (P2) — Prior-art treatment downstream rather than formative

**Original issue:** The six prior partial answers were named in Layer C (Loop 3), meaning the lit-review (Loop 1) would run without knowing whether the prior answers already covered the question.

**Revised loop sequence:** Loop 1 is now Layer C3 pre-pass (prior-art fit-to-question), explicitly scoping the lit-review to genuine gaps before Layer A runs.

**Assessment: RESOLVED.**

The reordering directly addresses the incongruity Finding 7 and the prior-art formative-integration concern from Finding 5. The C3 pre-pass is architecturally correct: examine what the corpus has partially answered, calibrate the lit-review scope to gaps, then run the lit-reviewer against what is genuinely unknown. This is consistent with cycle-status signal 3's instruction to reference rather than rediscover prior answers.

---

### Finding 7 (P2) — Research-plan incongruity / sequencing

**Original issue:** A four-loop investigation was proposed for a question with six prior partial answers; the lit-review (Loop 1) was sequenced before the corpus pre-pass (Loop 3), risking uncalibrated scope.

**Revised sequence:** Five loops; Loop 1 is C3 pre-pass; Loops 2–3 are lit-review and web search scoped to gaps; Loops 4–5 are corpus analysis and synthesis.

**Assessment: RESOLVED.**

The reordering resolves the sequencing incongruity. The addition of a fifth loop (synthesis) is appropriate — the revised question is substantively broader (five branches vs. three) and the dual-bracketed constraint-removal opens more investigative territory, so a dedicated synthesis step is warranted rather than treating synthesis as a post-loop addendum. The plan is now five loops for a five-branch question with two bracketed artifacts, which is proportionate.

---

### Finding 2 (P3) — Undefined baseline ("what the user actually needs")

**Original issue:** The comparative "exceeds what the user actually needs" implied a pre-existing, determinable needs baseline without defining it.

**Revised question:** Replaces "what the user actually needs" with "what practitioners find valuable."

**Assessment: RESOLVED at the P3 level.** The revised baseline is anchored on reported practitioner valuation, which is at minimum an empirically accessible surface (surveys, retrospective accounts, comparative studies). The unfalsifiability concern at P3 is substantially diminished. The residual specification problem (which practitioners?) is raised in Section B as a new P3.

---

### Finding 9 (Informational) — Reflexivity posture asymmetry

**Original issue:** The question set named both self-justification and self-flagellation susceptibility symmetrically but structural analysis showed the framing, artifact selection, and branch asymmetry all leaned toward the critique.

**Assessment: PARTIALLY-RESOLVED.**

The revisions address the structural lean substantially. The "if anywhere" clause prevents the question from presupposing over-engineering is the finding. The five-branch frame gives equal structural weight to "no" and "mis-framed" outcomes. The dual-bracketed constraint-removal now includes alternatives that a "no" finding would implicitly vindicate — e.g., the single-pass audit alternative for Artifact 2 is a genuine cost-reduction path that the research might find unnecessary if the current audit architecture earns its keep.

The remaining asymmetry: the lit-reviewer dispatch brief (Loop 2) has not been revised in the research log — it is referenced as "scoped to the gaps identified in Loop 1" but does not include the explicit dual-hypothesis instruction R1 recommended ("frame both hypotheses with equal investigative weight; neither treated as the null hypothesis"). The C3 pre-pass in Loop 1 may naturally produce a balanced brief if it surfaces gaps on both sides of the question, but there is no structural guarantee. This is worth noting as a dispatch-brief design consideration, but it does not block research-loop dispatch. Marked as PARTIALLY-RESOLVED rather than NOT-RESOLVED because the structural lean in the question set itself has been corrected; what remains is a dispatch-brief design note.

---

## Section B — New Issues

### B1 (P2) — "Practitioners" is under-specified in the revised driving question

**What the issue is:**

The revised question anchors its baseline on "what practitioners find valuable." This is a genuine improvement over "what the user actually needs" (which implied a single external baseline). But "practitioners" requires at least a working specification for the research phase to know what evidence counts.

Three distinct referent populations could answer "what practitioners find valuable":

1. **The user-as-sole-practitioner.** The research examines what this specific practitioner has found valuable across cycles. Evidence is internal to the corpus (retrospectives, cycle archives, domain-model annotations).

2. **Practitioners of RDD.** The methodology is used only by this practitioner; there are no other known RDD practitioners to survey. This population has cardinality one at present.

3. **Practitioners of comparable methodologies.** The lit-review could examine what practitioners of spec-driven, BDD, or architecture-decision-record-based methodologies find valuable or excessive — used as a proxy population.

These three populations would produce different research designs and different findings. If the lit-reviewer (Loop 2) interprets "practitioners" as population 3 while the corpus analysis (Loop 4) interprets it as population 1, the synthesis loop will have to reconcile findings from incompatible evidence surfaces.

The research plan does not resolve this. Layer A's lit-review scope (A1–A5) engages populations 3 implicitly. Layer C's corpus reflexive analysis engages population 1 implicitly. The synthesis will need a working definition of "practitioners" to adjudicate between findings — or it will need to treat the population-specification ambiguity as itself a finding (which is also a legitimate outcome but should be chosen deliberately).

**What to do:** The C3 pre-pass (Loop 1) is the natural place to note which referent population the prior partial answers assume — most of the six named prior answers are written from the user-as-practitioner perspective (population 1). If the lit-reviewer is scoped to gaps, the brief should specify what "practitioners" means for the Layer A synthesis. Even a one-line specification ("for the purposes of the lit-review, 'practitioners' means practitioners of comparable specification-intensive or artifact-intensive methodologies as a proxy for practitioner experience more broadly") would calibrate the evidence surfaces.

---

### B2 (P2) — The early-phase chain and audit infrastructure share boundary overlap that the dual-bracket does not surface

**What the issue is:**

Artifact 1 brackets the early-phase chain (RESEARCH → DISCOVER → MODEL → DECIDE). Artifact 2 brackets the audit infrastructure (Tier 1 specialist subagents, iterative-audit rounds). The dual-bracketing correctly names both as candidate over-engineering loci.

But the audit infrastructure runs inside the early-phase chain in RDD's actual process. The research-methods review (this artifact) is a Tier 1 audit that runs at RESEARCH entry. The citation audit and argument audit run on RESEARCH output. The susceptibility snapshot has been dispatched within cycles. In Cycle 018, the approximately 14 specialist subagent dispatches were distributed across multiple phases, not concentrated in one layer. The audit infrastructure is not a separate phase alongside the early-phase chain — it is woven through it.

This creates a diagnostic problem for Branches A and B in the five-branch frame:

- Branch A attributes over-engineering to the early-phase chain's front-loading.
- Branch B attributes it to the audit infrastructure.

But if Branch A's amendment target (the early-phase chain) and Branch B's amendment target (the audit infrastructure) are partially overlapping in the actual process, then "amend the early-phase chain" and "amend the audit infrastructure" are not independent interventions. A scoped-cycle calibration that reduces early-phase chain scope would also reduce the audit infrastructure's footprint (fewer phases = fewer artifacts to audit = fewer audit dispatches). Conversely, a change to the audit infrastructure that reduces dispatch frequency would not change the early-phase chain's elaboration profile at all.

The dual-bracket as written treats the two artifacts as separate bracketing targets, which implies they are separable. The research phase should hold explicitly whether Branch A and Branch B are separable diagnoses or whether they are compounding effects of a single underlying mechanism (the early-phase chain generates auditable artifacts; the audit infrastructure's cost scales with artifact volume; both over-engineering signals are effects of one cause).

**What to do:** This is a design note for the synthesis loop, not a blocker for research-loop dispatch. The C3 pre-pass (Loop 1) is the right place to examine whether the prior partial answers treat these as separable — ADR-083 (Cognitive Economy Criterion) and ADR-091 (Dual-Mode BUILD) address overhead at the human-facing artifact layer and the BUILD layer respectively, which suggests the prior art already implicitly separates front-loading cost from audit cost. Surfacing this separation explicitly in the pre-pass would calibrate Loops 2–4 to examine them as distinct or compounding rather than leaving the question open until synthesis.

---

### B3 (P3) — Structured alternatives for Artifact 1 over-represent technical/formal alternatives

**What the issue is:**

The five structured alternatives for Artifact 1 (early-phase chain) are: type-driven design with property-based testing; pair-walkthrough discovery sessions; sketch-and-iterate; spec-driven development with executable specs; decision-record-only. Of these five, three are technical/formal artifacts (type-driven, spec-driven, decision-record-only) and one is a document (sketch-and-iterate brief). Only one (pair-walkthrough) is primarily an organizational or social process alternative.

The under-represented alternative category is: **process and organizational alternatives without a documentation artifact**. Examples that are missing:

- Continuous stakeholder pairing throughout BUILD (embedding assumption-surfacing in the development conversation rather than as a phase artifact).
- Architecture review boards or lightweight design sessions (organizational gatekeeping as a substitute for individual artifact-production).
- Narrative design documents written for humans rather than structured methodology artifacts (a tradition in game development and some product organizations).
- "Just ship and observe" as a deliberate assumption-surfacing mechanism (production as the test environment for domain hypotheses).

This is P3 because the alternatives that are named are substantive and would serve the research well. The missing category slightly skews the comparative frame toward technical alternatives, which may affect what the lit-reviewer surfaces in Layer A (academic literature on formal method alternatives is more searchable than literature on social-process alternatives). Not a blocker.

---

## Section C — Pre-Loop Readiness Assessment

The revised question set addresses all three P1 findings from R1 and all four P2 findings. The revisions are genuine, not cosmetic: the driving question now holds mechanism open and treats "if anywhere" as a real possibility; the constraint-removal framing uses the structured-alternatives prompt and brackets two separable artifacts; the five-branch frame covers all five candidate diagnoses with distinct amendment targets; and the loop reordering places the prior-art pre-pass before the lit-review. These are the changes R1 recommended, and they are implemented with sufficient substantive depth.

Two new P2 findings appear (B1 — practitioner under-specification; B2 — early-phase chain / audit infrastructure boundary overlap). Neither blocks research-loop dispatch. B1 is best addressed in the Loop 2 dispatch brief rather than in the question set itself: a one-line working specification of "practitioners" in the lit-reviewer's brief will calibrate the evidence surface without requiring further question revision. B2 is a design note for the synthesis loop: the C3 pre-pass (Loop 1) should surface whether the prior art treats the two artifact costs as separable or compounding, which will inform whether Branches A and B are analyzed as independent or as correlated in Loops 4 and 5. One new P3 finding (B3) notes an alternative-category gap in the Artifact 1 structured alternatives; this may affect lit-review surface coverage marginally and can be noted in the Loop 2 brief if the user wishes.

The remaining partial-resolution on Finding 9 (reflexivity posture) is the one area where the loop design — specifically the Loop 2 lit-reviewer dispatch brief — can do further work. The brief should explicitly frame both the over-engineering hypothesis and the methodology-sound hypothesis with equal investigative weight, not treat the former as the primary question and the latter as a branch. This is a dispatch-brief design note, not a question-set revision.

The question set is ready for research-loop dispatch.

---

## Summary

**R1 finding remediation:**

| Finding | Severity | Status |
|---------|----------|--------|
| Finding 1 — artifact-framed vs. need-framed | P2 | RESOLVED |
| Finding 2 — undefined needs baseline | P3 | RESOLVED |
| Finding 3 — mechanism presupposition in driving question | P1 | RESOLVED |
| Finding 4 — Branch B foreclosing three diagnoses | P2 | RESOLVED |
| Finding 5 — prior-art treatment downstream | P2 | RESOLVED |
| Finding 6 — Cycle 018 cost profile as prior art | P3 | RESOLVED (was already advisory; Loop 4 covers it) |
| Finding 7 — research-plan incongruity / sequencing | P2 | RESOLVED |
| Finding 8 — artifact-shaped constraint-removal framing | P1 | RESOLVED |
| Finding 9 — reflexivity posture asymmetry | Informational | PARTIALLY-RESOLVED |

**New issues introduced by revisions:**

| Finding | Severity | Description |
|---------|----------|-------------|
| B1 | P2 | "Practitioners" under-specified; three incompatible referent populations could drive incompatible evidence surfaces |
| B2 | P2 | Early-phase chain and audit infrastructure share boundary overlap the dual-bracket does not surface; Branch A and Branch B may not be separable diagnoses |
| B3 | P3 | Artifact 1 structured alternatives over-represent technical/formal alternatives; organizational/process alternatives under-represented |

**Remaining issues by severity:** 0 P1 / 2 P2 / 1 P3 / 1 informational (partial)

**Readiness verdict: READY FOR RESEARCH-LOOP DISPATCH.** The two P2 advisories are best addressed in dispatch briefs (Loop 1 and Loop 2) rather than in the question set itself. Further question-set revision is not required before research begins.
