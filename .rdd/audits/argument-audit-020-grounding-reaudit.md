# Argument Audit Report — Grounding Re-Audit (Post-Loop 4 / 4b Revisions)

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md` (revised post-grounding)
**Source material:**
- `docs/essays/research-logs/research-log.md` §Grounding loops 4 + 4b
- `.rdd/audits/argument-audit-020-r3.md` (R3 — prior audit history)
- `.rdd/audits/argument-audit-020-gate-reaudit.md` (gate re-audit — prior revision verification)
- `.rdd/audits/susceptibility-snapshot-020-research.md`
**Genre:** Essay-Outline (per ADR-092)
**Date:** 2026-05-23
**Dispatch type:** Verification re-audit per ADR-094 re-audit-after-revision rule (post-grounding Loop 4 / 4b revisions). Does NOT append a Convergence-Saturation Signal verdict line.

---

## Re-Audit Scope

Four grounding-driven revisions are verified:

1. **C3 refinement** — Abstract conclusion now includes "with complementary gate-conversation-tooling improvements" and explains complementarity per Loop 4b finding. New W3.4 added to Argument-Graph with E3.4.1 anchoring to research log §Grounding Loop 4b.
2. **C5 refinement** — Abstract conclusion now acknowledges the alternative reading is strengthened by post-gate Loop 4 cross-cycle topology evidence. New E5.4.4 added under W5.4 anchoring to research log §Grounding Loop 4.
3. **C7 refinement** — Abstract conclusion now incorporates cross-cycle topology gap into the kitchen-sink caveat. New W7.4 + E7.4.1 added to Argument-Graph.
4. **Section 9 META block** — New META-anchored block added containing post-gate grounding findings, with "Combined implication for downstream phases" naming the three Essay-Outline revisions and their warrant basis.

---

## Section 1: Pyramid Re-Verification

### Four-Section Structural Check

All four required sections present and in order. No structural violation.

### New Argument-Graph Nodes

The grounding revisions introduced four new nodes: W3.4, E3.4.1 (under C3), E5.4.4 (under W5.4, under C5), W7.4, E7.4.1 (under C7). Each is verified below.

---

### Revision 1: C3 Refinement — W3.4 + E3.4.1

**Abstract C3 (current text):**

> The methodology should adopt substrate-and-surface separation as a methodology-wide architectural commitment, **with complementary gate-conversation-tooling improvements** (auto-resolve identifier references inline at gate prompts; inline excerpts of referenced ADRs / invariants / scenarios) shipping alongside the architectural commitment. [...] Per the post-gate grounding analysis (research log §Grounding loops 4 + 4b), gate-conversation-tooling addresses the gate-friction specifically; substrate-and-surface addresses multi-resolution viewing, graduation consolidation, and agent-corpus-consumption optimization. The two are complementary, not competing.

**Argument-Graph W3.4 (current text):**

> W3.4. Gate-conversation-tooling improvements are complementary to substrate-and-surface separation, not alternative. Gate-tooling addresses gate-friction specifically (per Chandler & Sweller 1992); substrate-and-surface addresses multi-resolution viewing, graduation consolidation, and agent-corpus-consumption — needs gate-tooling cannot reach.
> - E3.4.1. (Cycle 020 research log §Grounding Loop 4b) Direct analysis: gate-prompt-rendering with auto-resolved identifier references addresses the user's specific friction example but does NOT address multi-resolution viewing, graduation consolidation, or agent-corpus-consumption optimization. Both commitments are warranted.

**Section 4 body:** The body sections anchored to (C3) develop W3.1, W3.2, W3.3 through existing CLAIM-WARRANT-EVIDENCE bullets. W3.4 is asserted in the Argument-Graph but the Section 4 body does not add a corresponding CLAIM-WARRANT-EVIDENCE bullet for it.

**Boundary 2 assessment (W3.4 → body content):** The Section 4 body is anchored to `(C3)` and contains the SYNTHESIS paragraph for C3. W3.4 is a new warrant under C3, but the body's SYNTHESIS bullet — "The methodology amendment should commit the architecture; specific format and tooling are downstream concerns" — does not develop W3.4's claim that gate-tooling is complementary rather than alternative.

The C3 Abstract conclusion carries the substance of W3.4 directly (the "complementary, not competing" framing with Chandler & Sweller attribution is present in the Abstract text). The Argument-Graph W3.4 and E3.4.1 are structurally present. However, the Section 4 body expansion does not add a development bullet for W3.4 — the CLAIM/WARRANT/EVIDENCE series in Section 4 ends at W3.3 (Single-source derivation) and the SYNTHESIS closes without developing the gate-tooling complementarity point.

**Finding: Boundary 2 gap — W3.4 has no body content developing it in Section 4.**

The Section 4 body does not contain a CLAIM bullet addressing gate-tooling complementarity. The Abstract-level content (present in C3) does not substitute for body development. The gate-reaudit's Revision 2 (F-P2 skip verification) confirmed that Sections 3, 4, 7, and 9 are unchanged from R3 with respect to F-P2 — and F-P2 specifically concerned the gate-tooling alternative not being engaged in the body. The grounding revision addressed the Argument-Graph (W3.4 + E3.4.1) and the Abstract (C3 text) but did not add a body section development bullet.

**Severity assessment:** The pyramid technically holds at the Section level (Section 4 is anchored to C3, which encompasses W3.4). However, W3.4 is a warrant-level node under C3, and warrant-level nodes require body content developing them per Boundary 2. A gate reader reading Section 4 would not find the gate-tooling complementarity claim developed in the body — only the substrate claims (W3.1, W3.2, W3.3) are present there.

This is a **P2 (Should Fix)** gap: the pyramid technically traces (Section 4 anchors to C3 which contains W3.4), but the expansion is thin at the warrant level — W3.4 is asserted in the graph and Abstract without a body development bullet. Section 4's SYNTHESIS bullet could be extended to include: "Gate-conversation-tooling improvements (auto-resolved identifier references at gate prompts) address split-attention cost at the gate-friction specifically (Chandler & Sweller 1992); the substrate-and-surface architecture addresses multi-resolution viewing, graduation consolidation, and agent-corpus-consumption — needs gate-tooling cannot reach. Both are warranted and complementary." This would complete the Boundary 2 trace from W3.4 to body content.

**E3.4.1 citation check:** "Cycle 020 research log §Grounding Loop 4b" — the corresponding section in the research log reads "Loop 4b — Gate-conversation-tooling alternative analysis" and contains the direct analysis table showing gate-tooling does not address multi-resolution viewing, graduation consolidation, or agent-corpus-consumption optimization. The citation is correct and the evidence node's characterization is accurate. No Boundary 3 issue.

---

### Revision 2: C5 Refinement — E5.4.4

**Abstract C5 (current text, revised portion):**

> [...] under the alternative reading (strengthened by post-gate Loop 4 cross-cycle topology evidence — see Section 9 META) the prior ADRs were complete answers to genuinely different problems and Cycle 020 is identifying a new architectural problem rather than completing a trajectory. Both readings remain held open at DECIDE; the cross-cycle evidence supports the alternative reading more than the cycle's initial framing acknowledged.

**Argument-Graph E5.4.4 (current text):**

> E5.4.4. (Cycle 020 research log §Grounding Loop 4) Cross-cycle topology evidence supports the alternative reading: Cycle 018 (3 ADRs at different workflow points; different mechanisms) and Cycle 017 (11 ADRs; heterogeneous) do NOT exhibit the same 5-ADR clustering Cycle 019 produced. The Calibration-with-Graduation-Trigger Pattern as methodology-vocabulary recurs (083, 091, 094–098); the topology-level multi-ADR clustering does not. This strengthens the F-P1 reading that Cycle 019 surfaced a problem the prior six ADRs were not addressing.

**Pyramid check:** E5.4.4 is placed under W5.4 in the Argument-Graph. W5.4 states the hidden-premise / alternative-reading warrant. E5.4.4 adds cross-cycle topology evidence for that warrant. Section 6 body is anchored `(C5)`. The Section 6 META-OBSERVATION develops W5.4 and the SYNTHESIS bullet presents both readings as open and consequential. E5.4.4's content is consistent with what Section 6 develops in the META-OBSERVATION bullet ("The lineage framing borrows credibility from prior work that may not have been addressing the same underlying problem").

**Boundary 2 check:** E5.4.4 is an evidence node under W5.4, which the Section 6 body (META-OBSERVATION + SYNTHESIS) develops. The Section 9 META block also contains: "Post-gate grounding findings... Cross-cycle topology evidence supports the alternative reading: Cycle 018 (3 ADRs)... and Cycle 017 (11 ADRs)... do NOT exhibit the same 5-ADR clustering." This META content develops E5.4.4's specific evidence finding. The META section is appropriately anchored and its content is genuinely non-developmental relative to graph nodes — E5.4.4's cross-cycle data is referenced in the META as provenance/feed-forward context, not as a new graph argument. Clean.

**Abstract over-correction check (C5 alternative reading characterization):** The Abstract now states "the cross-cycle evidence supports the alternative reading more than the cycle's initial framing acknowledged." This is a substantively stronger claim than W5.4's formulation ("an alternative reading... is coherent on the present evidence"). The Abstract C5 revision moves from "coherent" to "strengthened" and adds "more than the cycle's initial framing acknowledged." This is consistent with E5.4.4's evidence (cross-cycle topology does not recur) and with the research log's Loop 4 finding ("This finding strengthens the F-P1 alternative reading"). No over-correction: the document's operating posture remains the convergent reading (per E5.4.2: "The convergent reading is preserved as the cycle's operating posture per the practitioner's gate response"). The "strengthened" language applies to the alternative reading's evidential weight, not to a claim that the alternative reading is now preferred.

**E5.4.4 citation check:** "Cycle 020 research log §Grounding Loop 4" — the corresponding section exists and contains the Cycle 018 + Cycle 017 examination finding the evidence node cites. Citation is correct and the characterization is accurate. No Boundary 3 issue.

**Status: REVISION APPLIED AND SOUND.** No pyramid issues introduced. The C5 Abstract revision is calibrated correctly — "strengthened" without "preferred."

---

### Revision 3: C7 Refinement — W7.4 + E7.4.1

**Abstract C7 (current text, revised portion):**

> [...] The post-gate Loop 4 cross-cycle topology evidence (Section 9 META) strengthens this caveat: the 5-ADR-cluster-applying-one-pattern that Cycle 019 produced is anomalous, not characteristic of other cycles' ADR sets. The pattern as methodology-level vocabulary recurs (083 in Cycle 017; 091 in Cycle 018; 094–098 in Cycle 019 all apply variants), but the topology-level clustering does not. Multi-cycle observation per the cycle's graduation-trigger pattern (ADR-097, ADR-098 lineage) is the appropriate response.

**Argument-Graph W7.4 (current text):**

> W7.4. The post-gate Loop 4 cross-cycle topology evidence reinforces the kitchen-sink caveat — the pattern as methodology-vocabulary recurs but the topology-level multi-ADR clustering does not.
> - E7.4.1. (Cycle 020 research log §Grounding Loop 4) Cycle 018 + Cycle 017 examination: no comparable 5-ADR clustering. The pattern (ADR-083 in Cycle 017; ADR-091 in Cycle 018; ADRs 094–098 in Cycle 019) recurs as methodology-vocabulary, but the topology-clustering as a recurring methodology phenomenon is single-cycle evidence at present.

**Section 8 body check:** Section 8 is anchored `(C7)` and contains CLAIM-WARRANT-EVIDENCE bullets for W7.1, W7.2, W7.3. W7.4 is a new warrant under C7, but the Section 8 body does not contain a development bullet for it. The SYNTHESIS bullet in Section 8 closes with: "The caveat is recorded as a held question, not a finding the cycle resolves."

**Boundary 2 assessment (W7.4 → body content):** Same pattern as W3.4: the warrant exists in the Argument-Graph, the evidence node cites the research log correctly, and the Abstract carries the substance. But the Section 8 body does not contain a CLAIM bullet developing W7.4's specific point (that cross-cycle topology evidence reinforces the kitchen-sink caveat by showing the clustering is anomalous).

The Section 9 META block does contain the post-gate grounding findings, including the Loop 4 finding relevant to W7.4's claim. The META text reads: "the Calibration-with-Graduation-Trigger Pattern recurs at the methodology-level... but multi-ADR clustering AT the same level applying the SAME pattern at multiple workflow points is unusual." This META content contextualizes W7.4 but is non-developmental by anchor design (META = non-developmental).

**Finding: Boundary 2 gap — W7.4 has no body content developing it in Section 8.**

Same pattern and severity as W3.4. **P2 (Should Fix):** Section 8's SYNTHESIS bullet could be extended to develop the cross-cycle topology point for W7.4, or a brief CLAIM bullet could be added before the SYNTHESIS.

**E7.4.1 citation check:** "Cycle 020 research log §Grounding Loop 4" — correct. The evidence node's characterization (Cycle 018 + Cycle 017 show no comparable clustering) is accurate per the research log. No Boundary 3 issue.

---

### Revision 4: Section 9 META Block

**New content in Section 9 (META):** The "Post-gate grounding findings" block states:

> Loop 4 (cross-cycle topology) examined Cycle 018 (3 ADRs) and Cycle 017 (11 ADRs) for the 5-ADR-clustering pattern Cycle 019 produced. Finding: Cycle 019's clustering is anomalous, not characteristic. [...] Loop 4b (gate-conversation-tooling alternative) examined whether improved gate-prompt rendering could address gate-friction without architectural commitment. Finding: gate-tooling is necessary but not sufficient [...] Combined implication for downstream phases: (a) C3 refined to explicitly include gate-conversation-tooling as a complementary commitment; (b) C5's alternative reading is strengthened by cross-cycle evidence (held open at DECIDE for scoping); (c) C7's kitchen-sink caveat is reinforced...

**META audit (developmental content check):** The META block contains findings (Loop 4 cross-cycle topology; Loop 4b gate-tooling analysis) and their implications (three Essay-Outline revisions). The question is whether any of this is developmental content that should be in the Argument-Graph proper rather than in META.

The Loop 4 finding ("Cycle 019's clustering is anomalous") is the empirical basis for E5.4.4 (C5 alternative reading) and E7.4.1 (C7 kitchen-sink caveat), both of which are in the Argument-Graph. The META block cites the finding in a summary-and-provenance capacity, not in a primary-development capacity.

The Loop 4b finding ("gate-tooling is necessary but not sufficient") is the basis for W3.4 and E3.4.1 (C3 Argument-Graph nodes). The META block summarizes this finding in a combined-implication format alongside the provenance of the three revisions.

The "Combined implication for downstream phases" names three revisions (a, b, c) that cross-reference Argument-Graph nodes (C3, C5, C7). This is a summary and a feed-forward signal, not independent development of those nodes.

**Assessment:** The META content is genuinely non-developmental relative to graph nodes. The Loop 4 and Loop 4b findings are developed in the Argument-Graph proper (E5.4.4, E7.4.1, W3.4, E3.4.1). The Section 9 META summarizes those findings in provenance/feed-forward context. No P2 misclassification.

**META anchor check:** Section 9's heading reads "Section 9: Scope-of-claim, feed-forward signals, and next-cycle questions (META)." The anchor is present and correctly applied. No Reverse Boundary 2 issue.

---

### Updated Pyramid Coverage Map (C3, C5, C7 revisions only)

The full pyramid map was verified clean at the gate re-audit. This grounding re-audit updates only the affected rows:

| Abstract Conclusion | Argument-Graph Nodes (new additions in bold) | Body Sections | New Nodes' Body Coverage |
|---|---|---|---|
| C3. Substrate-and-surface separation + **complementary gate-tooling** | C3, W3.1–W3.3, **W3.4**, E3.1.1–E3.3.1, **E3.4.1** | §4 (C3) | W3.4: **no body development bullet in §4** — P2 gap |
| C5. Convergent-but-incomplete lineage; alternative reading **strengthened** | C5, W5.1–W5.4, E5.1.1–E5.4.3, **E5.4.4** | §6 (C5) | E5.4.4 developed by §6 META-OBSERVATION and §9 META context — clean |
| C7. Kitchen-sink caveat + **cross-cycle topology reinforcement** | C7, W7.1–W7.3, **W7.4**, E7.1.1–E7.3.1, **E7.4.1** | §8 (C7) | W7.4: **no body development bullet in §8** — P2 gap |

**META-anchored sections:** §1 and §9 (unchanged in anchor status; §9 has new post-gate grounding content, verified as non-developmental above).

---

## Section 1: Argument Audit Findings

### Summary

- **Pyramid revisions introduced:** 4 (W3.4 + E3.4.1; E5.4.4; W7.4 + E7.4.1; Section 9 META block)
- **New issues found:** 2 P2, 0 P3
- **Prior carry-over P2/P3:** Carry-overs from R3 and gate re-audit are unchanged (P3-1 stale W2.4 label; P3-2 unqualified 49% figure in E3.1.3; P3-3 "convergent" proximity; P2-1/F-P2 gate-tooling endorsed skip; minor gate-response provenance gap). No new carry-overs introduced.

### P1 — Must Fix

**None.** All four pyramid boundaries are structurally intact after the grounding revisions. The two new issues (W3.4 and W7.4 body content gaps) are P2 by the expansion-fidelity severity framework: the pyramid trace technically holds at the Section level (§4 anchors to C3; §8 anchors to C7), but the warrant-level expansion is thin. These do not break pyramid connectivity.

### P2 — Should Fix

**P2-GR1: W3.4 has no body development bullet in Section 4.**

- **Location:** Argument-Graph W3.4 (under C3); Section 4 body (anchored to C3).
- **Claim:** The gate-tooling-is-complementary claim (W3.4) is in the Argument-Graph and Abstract, but the Section 4 body ends at W3.3 (Single-source derivation) without developing W3.4.
- **Evidence gap:** A gate reader reading Section 4 sees three CLAIM/WARRANT/EVIDENCE blocks (W3.1 navigation gain; W3.2 focus+context; W3.3 single-source derivation) and a SYNTHESIS bullet, but no development of the gate-tooling complementarity point. The Abstract carries it; the graph carries it; the body does not.
- **Recommendation:** Extend Section 4's body before or at the SYNTHESIS bullet. A brief CLAIM bullet: "Gate-conversation-tooling improvements (auto-resolved identifier references at gate prompts) are complementary to substrate-and-surface separation, not alternatives to it. Gate-tooling addresses split-attention cost at the gate-friction level (per Chandler & Sweller 1992 co-location remedy); it does not address multi-resolution viewing, graduation consolidation, or agent-corpus-consumption optimization. Both are warranted." This completes the Boundary 2 trace from W3.4 to body content.

**P2-GR2: W7.4 has no body development bullet in Section 8.**

- **Location:** Argument-Graph W7.4 (under C7); Section 8 body (anchored to C7).
- **Claim:** The cross-cycle-topology-reinforces-kitchen-sink-caveat point (W7.4) is in the Argument-Graph and Abstract, but the Section 8 body does not contain a development bullet for it. The body develops W7.1–W7.3 (pattern breadth; architecture inherits risk; multi-cycle observation) but does not add W7.4's cross-cycle topology evidence for the caveat.
- **Evidence gap:** The Section 8 SYNTHESIS closes "The caveat is recorded as a held question" without engaging the cross-cycle topology evidence that reinforces WHY it is held rather than resolved. A reader auditing the kitchen-sink caveat at Section 8 would not find the Cycle 017 / Cycle 018 evidence there.
- **Recommendation:** Before Section 8's SYNTHESIS, add a CLAIM bullet: "The post-gate Loop 4 cross-cycle topology examination (Cycle 018's 3 ADRs and Cycle 017's 11 ADRs) shows the 5-ADR-at-same-level clustering is anomalous, not characteristic. The Calibration-with-Graduation-Trigger Pattern recurs as methodology-vocabulary (ADR-083, ADR-091, ADR-094–098) but the topology-level clustering does not. This is the expected observation if the pattern has diagnostic value when applied but occurs rarely enough to test it selectively — further supporting multi-cycle observation as the appropriate response (W7.3)."

### P3 — Consider

No new P3 issues from the grounding revisions. Carry-overs from R3 and gate re-audit are unchanged.

---

## Section 2: Independent Framing Re-Audit

### Overview

The grounding revisions were triggered by the susceptibility snapshot's two grounding actions: (1) examine the gate-tooling alternative before DISCOVER, and (2) name single-corpus evidence scope as a DECIDE-phase scope-of-claim obligation. Both grounding actions were pursued. The question is whether the revisions address the framing concerns they were intended to address, and whether any new framing concerns were introduced.

### Question 1: Did the C3 revision over-correct toward gate-tooling?

**What the revision did:** C3 now explicitly includes gate-conversation-tooling as a complementary commitment with a brief description of its scope (auto-resolve identifier references; inline excerpts). The Abstract explains the complementarity: gate-tooling addresses gate-friction specifically; substrate-and-surface addresses multi-resolution viewing, graduation consolidation, and agent-corpus-consumption.

**Assessment:** The revision correctly characterizes gate-tooling as complementary without demoting the substrate-and-surface commitment. The scope boundaries are clearly drawn. One new framing concern: C3's Abstract text is now the most substantive location for understanding the gate-tooling-vs-architecture distinction, but the body (Section 4) does not develop W3.4. A reader who reads Section 4 without also reading the Abstract will see an argument for substrate-and-surface separation without the gate-tooling complementarity claim being present in the body. This is the same concern as P2-GR1 above — it is both a pyramid gap and a framing gap.

**Does C3 revision under-specify the gate-tooling commitment?** The Abstract names two specific gate-tooling improvements (auto-resolve identifier references; inline excerpts of referenced ADRs / invariants / scenarios). These are named as implementation candidates, not as committed specifications. The formulation "shipping alongside the architectural commitment" is forward-leaning — it implies gate-tooling will ship with the substrate-and-surface commitment. Whether this is too strong a characterization given that gate-tooling is not itself the subject of an ADR-CANDIDATE in §9 is a judgment question. The §9 META's DECIDE section names ADR-CANDIDATE-020.1 through 020.4, none of which are gate-tooling-specific. A practitioner reading C3 might reasonably expect an ADR-CANDIDATE for gate-tooling; its absence is a minor scope-of-claim precision gap.

**Framing concern (P3):** C3 commits gate-conversation-tooling as "shipping alongside the architectural commitment" without a corresponding ADR-CANDIDATE in §9. This creates a scope ambiguity: is gate-tooling a DECIDE-phase commitment that DECIDE should specify as an ADR candidate, or is it already considered part of the methodology amendment by C3's formulation? Flagging at P3 since the §9 META does identify the C3 refinement as a feed-forward signal to DECIDE, which implies DECIDE will scope the gate-tooling aspect.

### Question 2: Did the C5 revision over-correct toward the alternative reading?

**Assessment:** Covered in the pyramid re-verification above (Revision 2). The C5 Abstract text adds "strengthened by post-gate Loop 4 cross-cycle topology evidence" and "the cross-cycle evidence supports the alternative reading more than the cycle's initial framing acknowledged." The document's operating posture remains the convergent reading (E5.4.2). The C5 revision describes the evidential weight correctly and does not assert the alternative reading as preferred. No over-correction detected.

**New framing observation:** E5.4.4's final sentence reads: "This strengthens the F-P1 reading that Cycle 019 surfaced a problem the prior six ADRs were not addressing." The phrase "F-P1 reading" refers to the R1 argument audit's F-P1 finding. This is an internal audit cross-reference, not a labeled reading in the Essay-Outline itself. A reader of E5.4.4 who has not read the audit trail may find "F-P1 reading" opaque — they would need to navigate to the R1 audit to understand what that reading claims. This is a minor provenance precision gap (P3-level) but does not affect the argument's validity since the content of the alternative reading is fully stated in W5.4 and E5.4.1–E5.4.3.

### Question 3: Does the Section 9 META block introduce any new framing risks?

**What was added:** The "Post-gate grounding findings" block reports Loop 4 and Loop 4b findings and names three Essay-Outline revisions.

**Assessment:** The framing in the Section 9 META is summary and provenance, not new argument development. One observation: the "Combined implication for downstream phases" labels three implications (a, b, c) where (a) states "C3 refined to explicitly include gate-conversation-tooling as a complementary commitment." This characterization frames gate-tooling as an addition to C3 — which is accurate — but does not name the W3.4 body-coverage gap described in P2-GR1. A practitioner reviewing Section 9 for DECIDE planning might infer that the C3 commitment is fully developed in the body. This is a minor framing gap consistent with P2-GR1.

### Framing Issues

**F-GR1 (P2): W3.4 body gap creates a framing incompleteness in Section 4.**

- **Location:** Section 4 body; C3 Abstract.
- **Status:** The gate-tooling complementarity claim is fully present in the Abstract and Argument-Graph but absent from the Section 4 body. A reader engaging Section 4 as the body development of C3 sees three substrate claims (navigation gain; focus+context; single-source derivation) without the gate-tooling-is-complementary argument. This is not a logical error — the section accurately develops the substrate claims — but it means C3's revised scope (substrate + gate-tooling) is visible only in the Abstract, not in the body where the claim is developed.
- **Assessment:** P2. The same recommendation as P2-GR1 applies: add a development bullet for W3.4 in Section 4. This finding and P2-GR1 share the same root and the same fix.

**F-GR2 (P3): C3 commits gate-tooling as "shipping alongside" the architectural commitment without a corresponding ADR-CANDIDATE.**

- **Location:** C3 Abstract ("shipping alongside the architectural commitment"); §9 META DECIDE section (ADR-CANDIDATEs 020.1–020.4 named, none gate-tooling-specific).
- **Status:** The "shipping alongside" formulation implies a concrete implementation commitment that DECIDE will need to specify. ADR-CANDIDATE-020.1 scopes Substrate-and-Surface Separation; no parallel candidate for gate-tooling is named in §9. This is not necessarily a gap — DECIDE can scope gate-tooling as part of ADR-CANDIDATE-020.1's amendment, or add a new ADR-CANDIDATE. But the absence of an explicit candidate for gate-tooling while C3 names it as "shipping alongside" is a minor framing precision gap.
- **Recommendation:** Either add an ADR-CANDIDATE-020.5 for gate-conversation-tooling improvements in §9 DECIDE, or revise C3's "shipping alongside" to "as a complementary commitment to be scoped at DECIDE alongside." The latter is a softer formulation that correctly routes the scoping decision to DECIDE.

**F-GR3 (P3): E5.4.4's "F-P1 reading" reference is audit-internal and opaque to non-audit-trail readers.**

- **Location:** E5.4.4 final sentence.
- **Status:** "This strengthens the F-P1 reading that Cycle 019 surfaced a problem the prior six ADRs were not addressing." The "F-P1 reading" label requires navigating to the R1 audit to understand its content. The content of the alternative reading is fully available in W5.4 and the surrounding evidence nodes, so this is a precision gap, not a logical gap.
- **Recommendation:** Replace "the F-P1 reading" with "the alternative reading (W5.4) that Cycle 019 surfaced a problem the prior six ADRs were not addressing." This makes E5.4.4 self-contained.

---

## Summary of Verification Findings

| Revision | Target | Status | Notes |
|----------|--------|--------|-------|
| C3 + W3.4 + E3.4.1 | Gate-tooling complementarity in Abstract, graph | APPLIED — P2 body gap | W3.4 has no body development bullet in Section 4 (P2-GR1 / F-GR1) |
| C5 + E5.4.4 | Alternative reading strengthened by cross-cycle evidence | APPLIED AND SOUND | No over-correction; operating posture preserved |
| C7 + W7.4 + E7.4.1 | Kitchen-sink caveat reinforced by cross-cycle topology | APPLIED — P2 body gap | W7.4 has no body development bullet in Section 8 (P2-GR2) |
| Section 9 META block | Post-gate grounding findings + combined implications | APPLIED AND CLEAN | Non-developmental by content; no misclassification |

**New issues from grounding revisions:**
- P2-GR1 (= F-GR1): W3.4 no body development bullet in Section 4
- P2-GR2: W7.4 no body development bullet in Section 8
- P3 (F-GR2): C3 "shipping alongside" without corresponding ADR-CANDIDATE
- P3 (F-GR3): E5.4.4 audit-internal "F-P1 reading" reference opaque to non-audit-trail readers

**Carry-over items unchanged:**
- P3-1: Stale "(W2.4)" label in §9 META
- P3-2: E3.1.3 unqualified 49% figure
- P3-3: "Convergent" proximity in Section 6 SYNTHESIS
- P2-1 / F-P2: Gate-tooling alternative unengaged in body (endorsed skip — now partially addressed at Abstract/graph level by the grounding revision, but body development gap remains as P2-GR1)
- Minor provenance: practitioner gate response not in Cycle 020 internal references block

**Overall assessment:** The four grounding revisions are applied correctly and the revisions themselves introduce no new logical or framing errors. Two P2 body-coverage gaps (W3.4 and W7.4) were introduced by adding warrant-level Argument-Graph nodes without corresponding body development bullets. These are addressable with brief additions to the Section 4 and Section 8 bodies. The pyramid's structural integrity is maintained; the gaps are expansion-fidelity concerns at warrant resolution.

*Re-audit dispatched per ADR-094 re-audit-after-revision rule. Convergence-Saturation Signal verdict line omitted per that rule.*
