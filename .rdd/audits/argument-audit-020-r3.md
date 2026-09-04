# Argument Audit Report

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md` (revised post-R2)
**Source material:**
- `docs/essays/research-logs/research-log.md` (Cycle 020 — Loops 1, 2, 3, 5)
- `docs/essays/research-logs/lit-review-020-substrate-and-surface-separation.md` (Loop 2)
- `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md` (Loop 3)
- `docs/essays/research-logs/spike-020-substrate-surface-prototype.md` (Loop 5)
- `.rdd/audits/argument-audit-020.md` (R1 — carry-over tracking)
- `.rdd/audits/argument-audit-020-r2.md` (R2 — carry-over tracking)
**Genre:** Essay-Outline (per ADR-092)
**Date:** 2026-05-22

---

## Section 1: Argument Audit

### Summary

- **Genre:** Essay-Outline
- **Argument chains mapped:** 7 (C1 through C7)
- **Issues found:** 5 (0 P1, 1 P2, 4 P3)
- **Pyramid coverage map:** included
- **Expansion-fidelity findings:** P1: 0, P2: 0, P3: 0

---

### R3 Scope Verification — R2 Corrections

Two specific correction items from the R2 dispatch are verified before pyramid graph-traversal.

**R2 P2-1 (Dhar initial in lit-review): RESOLVED.**

The R2 finding identified a discrepancy between the lit-review's citation (`Dhar, A.`) and the Essay-Outline References entry (`Dhar, R.`). The lit-review-020-substrate-and-surface-separation.md References section at line 228 now reads `Gupta, A., Dhar, R., Feitosa, D., & Vaidhyanathan, K.` — matching the Essay-Outline References entry exactly. Both sources now read "Dhar, R." The correction was applied to the lit-review.

**R2 P2-2 (W5.4 anchoring the two-readings framing content): RESOLVED.**

The R2 finding identified that the META-OBSERVATION and SYNTHESIS bullets in Section 6 developed framing-level content with no Argument-Graph anchor. The revised document adds W5.4 to the Argument-Graph (line 83) with E5.4.1 and E5.4.2 (lines 84–85). The addition is structurally sound:

- W5.4 asserts the claim that the "convergent-but-incomplete lineage" reading rests on a hidden premise, and that an alternative reading (independent moves at different problems) is coherent on the present evidence.
- E5.4.1 attributes this framing to the R1 audit's F-P1 finding, which is a legitimate provenance anchor — the cycle's response to the framing audit is itself auditable evidence of what the framing audit surfaced.
- E5.4.2 is labeled "*(working hypothesis)*" and explicitly flags the sub-claim about framing-vs-architectural-content separation for gate review, citing R2's F-P4 finding. This is appropriate self-referential discipline.
- The Section 6 body remains anchored to `(C5)`, and the META-OBSERVATION and SYNTHESIS bullets now have a corresponding Argument-Graph node (W5.4) that the anchor develops.
- The R2 P2-2 structural problem (body content without graph anchor in a claim-anchored section) is resolved.

One residual observation: E5.4.1 cites the R1 audit rather than the spike's sub-argument compression-loss as the evidence for the alternative reading's plausibility. This is noted in the Framing Audit below — the R2 framing finding (F-P1, downgraded from P1 to P2 at R2) identified exactly this gap. It carries forward at P3 level at R3.

---

### Pyramid Coverage Map

#### Four-section structural check

All four required sections are present in order: Abstract (with numbered CONCLUSIONS list C1–C7), Argument-Graph (structured-bullet hierarchy with named identifiers), Citation-Embedded Outline (body subsections with parenthetical anchors), and References (bibliography with reference keys). No structural violation at the section level.

#### Coverage table

| Abstract Conclusion | Argument-Graph Nodes | Body Sections | References Cited |
|---|---|---|---|
| C1. Topology hypothesis confirmed; 5-to-1+5 compression preserves audit-substance if substrate is first-class auditable. | C1, W1.1, W1.2, E1.1.1, E1.1.2, E1.2.1, E1.2.2 | §2 (C1) | Research log §Loop 1.1, 1.2, 1.3, 5.2 |
| C2. Corpus-overwhelm is methodology-wide; Sweller element interactivity is the mechanism; graduation is the most acute case. | C2, W2.1, W2.2, W2.3, E2.1.1, E2.1.2, E2.2.1, E2.2.2, E2.2.3, E2.3.1, E2.3.2, E2.3.3, E2.3.4 | §3 (C2) | Sweller 1988; Sweller 2010; van Merriënboer & Kester 2008; Rukmono et al. 2025; Dagenais et al. 2010; Steinmacher et al. 2015; Chandler & Sweller 1992; Lethbridge et al. 2003; Garousi & Garousi 2013/2014; Forward & Lethbridge 2002; Gupta et al. 2026 |
| C3. Adopt substrate-and-surface separation as methodology-wide architectural commitment. | C3, W3.1, W3.2, W3.3, E3.1.1, E3.1.2, E3.1.3, E3.2.1, E3.2.2, E3.2.3, E3.2.4, E3.3.1 | §4 (C3) | Volpini et al. 2026; GraphReader 2024; Shneiderman 1996; Cockburn et al. 2008; Tufte 1983/1990; Lit-review §Q5 |
| C4. Six design constraints from spike must be honored by any committed amendment. | C4, W4.1–W4.6, E4.1.1–E4.6.1 | §5 (C4) | Research log §Loop 5.3 Constraints 1–6; Lit-review §Q5 |
| C5. Prior audience-bifurcation lineage is convergent but incomplete; Cycle 020 names the separation. | C5, W5.1, W5.2, W5.3, W5.4, E5.1.1–E5.1.6, E5.2.1, E5.3.1, E5.4.1, E5.4.2 | §6 (C5) | ADR-064, ADR-083, ADR-084, ADR-085, ADR-092, ADR-095; Research log §Loop 1.5, Step 1.3; Argument audit R1 §F-P1 |
| C6. Architecture committed; specific schema language deferred. | C6, W6.1, W6.2, W6.3, E6.1.1, E6.2.1, E6.3.1 | §7 (C6) | Lit-review §Q4; Research log §Loop 5.3 |
| C7. Held caveat — kitchen-sink risk for the Calibration-with-Graduation-Trigger Pattern and by extension the substrate-and-surface architecture. | C7, W7.1, W7.2, W7.3, E7.1.1, E7.2.1, E7.3.1 | §8 (C7) | ADR-097 Target 2; Research log §Loop 1.7, ADR-097, ADR-098 |

**META-anchored sections:** §1 (Methodology preamble — cycle posture and scope), §9 (Scope-of-claim, feed-forward signals, and next-cycle questions)

**Pyramid boundaries — all clean at R3:**

- **Boundary 1 (Abstract → Argument-Graph):** All seven Abstract conclusions (C1–C7) have matching top-level Argument-Graph nodes. No violations.
- **Boundary 2 (Argument-Graph → Citation-Embedded Outline):** All Argument-Graph nodes (C1–C7, all warrants and evidence nodes including the new W5.4, E5.4.1, E5.4.2) have body content developing them in Section 6. No orphan nodes.
- **Boundary 3 (Citation-Embedded Outline → References):** All external citations verified present in the References section. Gupta et al. 2026 authorship is now consistent between lit-review and References (both "Dhar, R."). No Boundary 3 violations.
- **Reverse Boundary 1 (Argument-Graph → Abstract):** No Argument-Graph top-level claims absent from the Abstract.
- **Reverse Boundary 2 (Citation-Embedded Outline → Argument-Graph):** No body subsections lack an anchor. §1 and §9 are META-anchored. §2–§8 each carry explicit claim identifiers. The R2 P2-2 issue (Section 6 framing-disclosure bullets without graph anchor) is resolved by W5.4.

**META audit:** §1 and §9 are examined for developmental bullets. §1 contains posture-setting bullets with no claim or evidence development. §9 contains scope qualifications, feed-forward signals, and provenance records — all genuinely non-developmental relative to any specific graph node. The PROVENANCE driver chain in §9 is a completeness record, not argument development. Both META anchors are clean.

---

### Expansion-Fidelity Findings

**P1 findings (pyramid violations):** None.

**P2 findings (weak expansion or META misclassification):** None. All R2 P2 findings resolved.

**P3 findings (minor coverage gaps):** None from pyramid traversal alone. Carry-over minor gaps are noted in the P3 section below.

---

### P1 — Must Fix

No P1 violations found. The pyramid is structurally complete at R3. All R2 P1-tier and P2-tier corrections were applied correctly or confirmed as not requiring correction. No new P1 issues introduced by the R2 revisions.

---

### P2 — Should Fix

**P2-1 (carry-over from R2, not addressed): Gate-conversation-tooling alternative not engaged.**

- **Location:** C2, C3; Section 4 body; Section 9 META.
- **Claim:** The Essay-Outline argues for methodology-wide substrate-and-surface separation as the architectural remedy for cross-referential overwhelm at synthesis moments.
- **Evidence gap:** The source material supports a thinner alternative intervention — gate-prompt co-location of cross-references via skill-text changes — that could address the user's primary friction without requiring substrate-and-surface architectural changes to the entire corpus. Chandler and Sweller (1992) identifies co-location as the structural remedy for split-attention cost; this is achievable at the prompt-construction level without substrate architecture. The Loop 1.6 threshold analysis asks whether scaffolded consolidation suffices but does not compare against targeted gate-prompt revision. The Essay-Outline does not engage this alternative anywhere in Sections 4, 6, 7, or 9.
- **Recommendation:** In Section 4 (C3 body) or Section 9 META, add a brief acknowledgment of the gate-prompt-tooling alternative and why the substrate-and-surface architectural scope is preferred. The research log §Loop 1.6 threshold reasoning is the starting point: the substrate mechanism provides multi-resolution viewability and agent-side preservation that skill-text changes cannot deliver; naming this explicitly closes the gap.

---

### P3 — Consider

**P3-1 (carry-over from R2, not addressed): Section 9 META refers to "(W2.4)" as a label, which no longer exists in the Argument-Graph.**

- **Location:** Section 9 META: "SCOPE QUALIFICATION — no direct empirical comparison of mid-cycle vs. graduation friction (W2.4)."
- **Issue:** W2.4 was reclassified at R1 from a standalone warrant to a SCOPE QUALIFICATION on W2.2. The node no longer exists. The Section 9 "(W2.4)" reference is a stale label, identified at R2 P3-1 and not corrected.
- **Recommendation:** Update to: "SCOPE QUALIFICATION — no direct empirical comparison of mid-cycle vs. graduation friction (SCOPE QUALIFICATION on W2.2)."

**P3-2 (carry-over from R2, not addressed): E3.1.3 cites the 49% compression figure without the scope qualification present in E1.2.2.**

- **Location:** E3.1.3: "(Cycle 020 research log §Loop 5) Spike demonstrated typed-link substrate on the Cycle 019 5-ADR sample with 49% compression and preserved canonical audit-substance."
- **Issue:** E1.2.2 carries an inline scope qualification on the 49% figure. E3.1.3 cites the same empirical result under W3.1 without qualification. A reader auditing W3.1's evidence sees an unqualified figure. Identified at R2 P3-3 and not applied.
- **Recommendation:** Add "(single-cycle sample — see E1.2.2 scope qualification)" to E3.1.3.

**P3-3 (carry-over from R2, not addressed): "Convergent" used in two distinct senses in proximate text in Section 6.**

- **Location:** Section 6 SYNTHESIS bullet.
- **Issue:** The SYNTHESIS bullet uses "convergent, not divergent, with the prior moves" (meaning: consistent with the Calibration-with-Graduation-Trigger Pattern) immediately after the META-OBSERVATION uses "convergent" in its epistemic sense (the convergent-lineage interpretation). The proximity risks conflation.
- **Recommendation:** Replace "convergent, not divergent, with the prior moves" with "consistent with the Calibration-with-Graduation-Trigger Pattern" in the SYNTHESIS bullet.

**P3-4 (carry-over from R2 F-P3, not addressed): "The structural mechanism" vs. "a structural mechanism" for element interactivity.**

- **Location:** C2 Abstract conclusion; Argument-Graph W2.1.
- **Issue:** The Loop 3 lit-review selected Sweller's CLT as the explanatory framework without comparing it against alternatives. "The structural mechanism" overstates epistemic status.
- **Recommendation:** Soften to "a well-supported structural mechanism" in C2 and W2.1.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible.

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: The five Cycle 019 ADRs were addressing genuinely distinct problems.**

At R3, this framing is explicitly named in W5.4 and Section 6's META-OBSERVATION, with both readings characterized as coherent on the present evidence. The disclosure is present and adequate. The remaining gap — that E5.4.1 cites the R1 audit rather than the spike's sub-argument compression-loss as the evidence making the alternative compelling — is a P3 completeness refinement (see F-P1 below).

On independent re-evaluation of the source material at R3: the spike report documents that "ADR-097's Target 2 and Target 3 sub-decisions are first-class commitments inside the Decision section" that the flat schema cannot hold without compression loss. This is the most concrete available evidence that the five ADRs are not simply one decision at unnecessary granularity — they have sub-structure that resists lossless encoding. This evidence lives in E4.3.1 (under C4) but is not connected to W5.4's alternative-reading exposition.

**Alternative framing B: Gate-conversation tooling rather than corpus architecture.**

Unchanged at R3 and still unaddressed in the Essay-Outline. See P2-1 in Section 1 and F-P2 below. No new evidence bearing on this framing surfaced at R3.

**Alternative framing C: The research as confirmation of a pre-endorsed hypothesis.**

At R3 the concern is adequately mitigated: C4's six design constraints are first-class conclusions, C7's kitchen-sink caveat is bolded in the Abstract, and the spike failure modes are integrated throughout. Consistent with R2 assessment; does not rise above P3.

---

### Question 2: What truths were available but not featured?

**Finding A (carry-over from R1/R2): Sub-argument compression-loss as conditional qualifier on audit-substance preservation.**

The spike report (spike-020-substrate-surface-prototype.md, findings §1) states explicitly: "the source ADRs carry more sub-structure than the five flat fields express. A faithful substrate needs nested fields (sub-commitments, warrant-for-what, sub-graduation-triggers) — or it accepts compression loss at the sub-argument level. The lossiness is not catastrophic but it is real, and it is exactly the kind of loss that becomes invisible once the source is no longer the canonical reference."

The Abstract's C1 condition — "provided the substrate is treated as a first-class auditable layer" — does not capture this. The more accurate condition is: "preserves canonical audit-substance; sub-decision structure requires nested fields or explicit scope-of-claim acceptance." The hedge is present in Section 5 and Section 9, but the Abstract's C1 statement remains imprecise about what "audit-substance" means at the sub-decision level. This is a P2 framing concern in the framing audit, unaddressed across three rounds.

**Finding B (carry-over from R2): Gupta et al. 2026 ambiguity about comprehensive substrate vs. windowed traversal.**

The Gupta finding (3–5-record recency window optimal for LLM ADR generation) supports structured traversal over flat-corpus delivery — the Essay-Outline's directional use is correct. The ambiguity that a comprehensive substrate's full delivery might still face the windowing constraint is a second-order concern not materially changed at R3. Remains P3.

**Finding C (carry-over from R1/R2): Nogueira et al. 2026 on ADR template minimalism.**

The Loop 3 lit-review (Q3) cites Nogueira et al. 2026: structural minimalism outperforms completeness-oriented structure on ADR comprehension (median 0.8 vs. 0.7, Wilcoxon p=0.002). The finding is directly relevant to C4's W4.2 (per-type record schemas, not universal) and is available empirical weight the Essay-Outline has not cited across three rounds. Its absence is a missed citation opportunity, not a logical flaw. Remains P3.

---

### Question 3: What would change if the dominant framing were inverted?

At R3 both R1/R2 inversions are substantially addressed:

- The convergent-but-incomplete lineage inversion is named explicitly in W5.4 and Section 6's META-OBSERVATION with both readings presented and the hidden premise exposed. Adequate.
- The over-commitment risk inversion is addressed by C7's kitchen-sink caveat (bolded in the Abstract), C4's six design constraints, and Section 9's multi-cycle observation recommendation.

The one remaining concern on independent re-evaluation: both empirical corpus loops (Loop 1 and Loop 5) examined the same single corpus (Cycle 019's 5 ADRs). Section 9 META names this honestly ("single-cycle topology evidence"). No new inversion surfaces at R3.

---

### Framing Issues

**F-P1 (carry-over from R1, P2 at R2, P3 at R3): The alternative-reading exposition names but does not evidence the alternative.**

- **Location:** W5.4, E5.4.1; Section 6 META-OBSERVATION.
- **Status at R3:** The alternative reading is named, the hidden premise is explicit, and both readings are presented (R1 F-P1 concern resolved at R1/R2). The remaining gap: E5.4.1 cites the R1 audit as evidence rather than the spike's sub-argument compression-loss, which is the most concrete available evidence that the five ADRs have first-class sub-structure that resists lossless compression into one pattern. A gate reader evaluating the alternative reading still needs to navigate to E4.3.1 for the substantive evidence.
- **Assessment:** P3 (consider). Downgraded from P2 at R2. The disclosure is adequate; this is a refinement.
- **Recommendation:** In E5.4.1 or the Section 6 META-OBSERVATION, add one sentence: "The spike's sub-argument compression-loss (E4.3.1 — ADR-097's Target 2/Target 3 sub-decisions are first-class content the flat schema loses) is the most concrete evidence that the five ADRs may not be one decision at unnecessary granularity."

**F-P2 (carry-over from R1/R2, not addressed, holds at P2): Gate-conversation-tooling as an unengaged alternative intervention.**

- **Location:** C2, C3; Section 3, Section 4; Loop 1.6 threshold analysis in source material.
- **Status at R3:** Unchanged across three audit rounds. The source material supports a targeted gate-prompt co-location intervention (Chandler & Sweller 1992's split-attention remedy applied at the skill-text level) that could address the user's friction without requiring substrate-and-surface architectural commitment. The Essay-Outline does not engage this alternative anywhere in the body.
- **Assessment:** P2 (should fix). Three rounds without engagement suggests this is a gate-level decision for the practitioner rather than an oversight; surfacing it here so the gate reader has explicit notice.
- **Recommendation:** In Section 4 (C3) or Section 9 META, add a brief acknowledgment naming the gate-prompt-tooling alternative and explaining why the substrate-and-surface architectural scope is preferred over it. The Loop 1.6 rationale — substrate provides multi-resolution viewability and agent-side preservation that skill-text changes cannot deliver — is available; it simply needs to be stated.

**F-P3 (carry-over from R1/R2, not addressed, holds at P3): Sweller's element interactivity named as "the structural mechanism."**

- **Location:** C2 Abstract conclusion; W2.1.
- **Status at R3:** Unchanged across three rounds. Loop 3 lit-review selected Sweller's CLT without comparing it against alternatives.
- **Assessment:** P3 (consider).
- **Recommendation:** Soften "the structural mechanism" to "a well-supported structural mechanism" in C2 and W2.1.

**F-P4 (new at R2, not addressed in body, holds at P2): The SYNTHESIS bullet asserts framing-doesn't-affect-architectural-content without examining the claim.**

- **Location:** Section 6 SYNTHESIS bullet; E5.4.2 in Argument-Graph.
- **Status at R3:** The SYNTHESIS bullet still reads: "The downstream phases (DECIDE / ARCHITECT) inherit the commitment either way; the framing affects credibility attribution but not the architectural content." E5.4.2 adds a parenthetical flagging this sub-claim for gate review, which is an improvement over R2 — but the flag is in the Argument-Graph, not in the Section 6 body where the assertion sits. The body still presents the claim as a resolved conclusion.
- **Assessment:** P2 (should fix), unchanged from R2.
- **Recommendation:** Revise the SYNTHESIS bullet's final sentence to: "The downstream phases (DECIDE / ARCHITECT) inherit the architectural commitment under either reading; whether the evidence base is sufficient for that commitment's tier and scope is a judgment the gate reader should make with both readings in view."

**Summary of framing carry-overs at R3:**

| Finding | R1 | R2 | R3 | Status |
|---------|----|----|----|----|
| F-P1 (hidden premise evidence) | P1 | P2 | P3 | Converging to close |
| F-P2 (gate-conversation tooling) | P2 | P2 | P2 | Stable carry-over — gate decision |
| F-P3 ("the" vs. "a" mechanism) | P3 | P3 | P3 | Stable carry-over |
| F-P4 (framing-doesn't-affect-content) | — | P2 | P2 | Stable carry-over — gate decision |

F-P2 and F-P4 are gate-level framing choices the practitioner should evaluate explicitly before DECIDE. The audit has surfaced them across multiple rounds; the gate reader decides whether to engage them or proceed.

---

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** TRIGGERED

- Round number: R3
- P1 count this round: 0 (zero P1 findings across Section 1 and Section 2)
- P2 count this round (new, non-carry-over): 0. No P2 findings were surfaced for the first time at R3. All P2 items in this report (P2-1 / F-P2, F-P4) are carry-overs from R1 or R2. The downgrade of F-P1 from P2 to P3 is convergence within a named finding, not a new P2.
- New framings or claim-scope expansions: none. R3's independent re-evaluation surfaced no warrants or claim-scope characterizations that prior rounds' finding records did not name. The pyramid-traversal finding that E5.4.1 references the R1 audit rather than the spike as the evidence for the alternative reading restates a gap already named in R2's F-P1 finding; it is convergence, not a new framing.
- Recommendation: STOP at this round

**Condition evaluation:**

1. **P1 count = 0:** Met.
2. **P2 count this round (new, non-carry-over) ≤ 1:** Met. Zero new P2 findings at R3.
3. **No new framings or claim-scope expansions:** Met. All framings and claim-scope characterizations in this report were on the record from R1 or R2.

**Gate reader note on carry-over P2 findings.** TRIGGERED means the audit round count stops; it does not mean the remaining open items are resolved. The two materially open framing concerns — F-P2 (gate-conversation-tooling alternative not engaged) and F-P4 (framing-doesn't-affect-architectural-content not evidenced in the body) — are gate-level judgments for the practitioner. The Finding A framing concern (sub-argument compression-loss as a conditional qualifier on C1's audit-substance preservation claim) is a precision gap in the Abstract that the practitioner may choose to address or accept as-is. The P3 carry-overs (stale W2.4 label in §9; E3.1.3 unqualified 49% figure; "convergent" terminology proximity; "the structural mechanism") are minor consistency items that do not affect the argument's validity. The audit has done its job; the gate reader decides.

*Single-purpose re-audits (dispatched per the re-audit-after-revision rule) omit this section. Form-change events reset the round-count baseline — the first audit on a new form is its R1.*
