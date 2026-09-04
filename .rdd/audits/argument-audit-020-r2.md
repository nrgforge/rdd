# Argument Audit Report

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md` (revised post-R1)
**Source material:**
- `docs/essays/research-logs/research-log.md` (Cycle 020 — Loops 1, 2, 3, 5)
- `docs/essays/research-logs/lit-review-020-substrate-and-surface-separation.md` (Loop 2)
- `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md` (Loop 3)
- `docs/essays/research-logs/spike-020-substrate-surface-prototype.md` (Loop 5)
- `.rdd/audits/argument-audit-020.md` (R1 — prior audit for carry-over tracking)
**Genre:** Essay-Outline (per ADR-092)
**Date:** 2026-05-22

---

## Section 1: Argument Audit

### Summary

- **Genre:** Essay-Outline
- **Argument chains mapped:** 7 (C1 through C7)
- **Issues found:** 5 (0 P1, 2 P2, 3 P3)
- **Pyramid coverage map:** included
- **Expansion-fidelity findings:** P1: 0, P2: 0, P3: 0

---

### R2 Scope Verification — R1 Corrections

Before pyramid graph-traversal, the seven specified R1 correction items are verified against the revised document.

**R1 P2-1 (W2.4 reclassification): APPLIED CORRECTLY.**

W2.4 no longer appears as a standalone warrant in the Argument-Graph. The differentiator claim ("corpus scope, not mechanism type") is now encoded as a SCOPE QUALIFICATION parenthetical on W2.2 at line 41 of the Argument-Graph: `*(SCOPE QUALIFICATION on W2.2: the differentiator across holistic-synthesis moments is corpus scope, not mechanism type — but no direct empirical study compares mid-cycle gate-review friction to graduation overwhelm. The conclusion rests on corpus-scope logic plus Rukmono et al. 2025's shared-driver finding, not on direct measurement of cost differences.)*` Section 9 META also carries a corresponding scope qualification referencing W2.4 by name. The content of what was W2.4 is preserved; it is now a qualification rather than a warrant. The logical position is sound: the claim is a scope-of-claim note on W2.2, not an independent warrant for C2. The change is correct.

One residual note: Section 9 META still reads "no direct empirical comparison of mid-cycle vs. graduation friction (W2.4)." The W2.4 label is now vestigial (W2.4 no longer exists in the Argument-Graph), but the reference is in a META-anchored scope-qualification section and does not cause a structural problem. It is a minor inconsistency, noted at P3 below.

**R1 P2-2 (Gupta evidence node): APPLIED CORRECTLY.**

Gupta et al. 2026 now appears as E2.3.4 under W2.3 in the Argument-Graph (line 40). The citation is placed correctly: W2.3 covers the "no one reads them post-graduation" generalization, and E2.3.4 extends that finding to the agent-consumption case with a specific structural mechanism (recency window of 3–5 records). The placement is sound — the Gupta finding is about documentation read-patterns (agent-side), which belongs in the W2.3 cluster alongside Lethbridge et al. 2003, Garousi 2013/2014, and Forward & Lethbridge 2002. The Section 3 body already cited Gupta in the W2.3 EVIDENCE block; the Argument-Graph now has the matching node. Boundary 3 verified: Gupta et al. 2026 is present in References (line 247 of the document).

**R1 P2-3 (C5 hidden premise): APPLIED CORRECTLY.**

Section 6 now contains a META-OBSERVATION bullet (line 183) explicitly naming the hidden premise and the alternative reading: "The 'convergent-but-incomplete lineage' reading rests on a hidden premise — that the prior six ADRs were addressing the same underlying problem the substrate-and-surface separation now names." The alternative reading (prior ADRs were complete answers to genuinely different problems; Cycle 020 identifies a new problem rather than completing a trajectory) is named and engaged. The SYNTHESIS bullet (line 184) presents both readings with their downstream implications and names that the downstream phases inherit the commitment either way. The disclosure is adequate. The framing choice is now visible to the gate reader without requiring the R1 framing audit finding to be cross-referenced. One question for independent re-evaluation: is this META-OBSERVATION bullet itself a developmental expansion that belongs under the Argument-Graph rather than under META? This is evaluated below in the expansion-fidelity findings.

**R1 P2-4 (E1.2.2 scope qualification): APPLIED CORRECTLY.**

E1.2.2 in the Argument-Graph now carries a SCOPE QUALIFICATION parenthetical (line 26): `*(SCOPE QUALIFICATION: single 5-record spike on Cycle 019's ADRs only; the 49% figure is corpus-specific and scaling to ~100 ADRs is not tested. Per Section 9 META and Loop 5.3 Constraint 6, multi-corpus scaling may produce different compression ratios and additional friction not surfaced at this scale.)*` This is well-placed. The qualification is inline with the evidence node rather than deferred to a distant section, which satisfies R1's recommendation that "a reader doing Argument-Graph-only review" not take the figure as general.

**R1 P3-1 (van Merriënboer & Sweller 2005 removal): APPLIED CORRECTLY.**

A search for "van Merriënboer.*Sweller" in the revised document returns no result for the 2005 entry. The References section contains van Merriënboer & Kester 2008 (cited at E2.1.2) but does not contain van Merriënboer & Sweller 2005. The removal is clean; no body text still cites the 2005 paper.

**R1 P3-2 (ADR-064 vs. ADR-072 alignment): VERIFIED — NO CORRECTION WAS NEEDED.**

R1 identified a discrepancy between "research log §Loop 1.5 table row" (said to cite ADR-072) and the Essay-Outline (citing ADR-064). On independent re-examination of the research log, the Loop 1.5 table (line 232 of research-log.md) lists row `064` with "Centered-vs-Infrastructure distinction" — not ADR-072. ADR-072 is the Cycle-Shape Declaration ADR (a different topic). ADR-064's body confirms it contains the centered-vs-infrastructure framing at the DECIDE gate 2026-04-09. The Essay-Outline's citation of ADR-064 throughout is correct. The R1 finding was a misreading of the research log table. No correction was warranted; none was made. This is consistent with the document remaining unchanged at ADR-064.

**R1 P3-3 (C7 Abstract extension): APPLIED CORRECTLY.**

The Abstract's C7 bullet now explicitly reads: "Held caveat: the Calibration-with-Graduation-Trigger Pattern itself inherits the kitchen-sink risk (ADR-097 Target 2 discriminating-criterion limit) — and **by extension the substrate-and-surface architecture inherits the same risk**, since the architecture is what the pattern's application produces." The "by extension" language is present and bolded. The full implications (both pattern and architecture; diagnostic value; multi-cycle observation as response) are stated. The Argument-Graph's C7 label also reads "by extension the substrate-and-surface architecture." The change is complete.

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
| C5. Prior audience-bifurcation lineage is convergent but incomplete; Cycle 020 names the separation. | C5, W5.1, W5.2, W5.3, E5.1.1–E5.1.6, E5.2.1, E5.3.1 | §6 (C5) | ADR-064, ADR-083, ADR-084, ADR-085, ADR-092, ADR-095; Research log §Loop 1.5, Step 1.3 |
| C6. Architecture committed; specific schema language deferred. | C6, W6.1, W6.2, W6.3, E6.1.1, E6.2.1, E6.3.1 | §7 (C6) | Lit-review §Q4; Research log §Loop 5.3 |
| C7. Held caveat — kitchen-sink risk for the Calibration-with-Graduation-Trigger Pattern and by extension the substrate-and-surface architecture. | C7, W7.1, W7.2, W7.3, E7.1.1, E7.2.1, E7.3.1 | §8 (C7) | ADR-097 Target 2; Research log §Loop 1.7, ADR-097, ADR-098 |

**META-anchored sections:** §1 (Methodology preamble — cycle posture and scope), §9 (Scope-of-claim, feed-forward signals, and next-cycle questions)

**Pyramid boundaries — all clean at R2:**

- **Boundary 1 (Abstract → Argument-Graph):** All seven Abstract conclusions (C1–C7) have matching top-level Argument-Graph nodes. No violations.
- **Boundary 2 (Argument-Graph → Citation-Embedded Outline):** All Argument-Graph nodes (C1–C7, all warrants, all evidence nodes) have body content developing them. No orphan nodes.
- **Boundary 3 (Citation-Embedded Outline → References):** All citations verified present in the References section. See note below on Gupta et al. 2026 authorship detail.
- **Reverse Boundary 1 (Argument-Graph → Abstract):** No Argument-Graph top-level claims are absent from the Abstract.
- **Reverse Boundary 2 (Citation-Embedded Outline → Argument-Graph):** No body subsections lack an anchor. §1 and §9 are META-anchored (intentional non-developmental). §2–§8 each carry explicit claim identifiers.

---

### Expansion-Fidelity Findings

**P1 findings (pyramid violations):** None.

**P2 findings (weak expansion or META misclassification):**

None at R2. The Section 9 META borderline-misclassification risk identified in R1 has been resolved by the revision: the META-OBSERVATION bullet added to Section 6 (the hidden premise disclosure) is anchored in Section 6 (C5), not in Section 9 META. Section 9 remains a pure scope-qualification and feed-forward signals section. The provenance driver chain in Section 9 reads as completeness record rather than argument development; no reclassification is warranted.

**P3 findings (minor coverage gaps):** None from pyramid traversal alone.

---

### P1 — Must Fix

No P1 violations found in the argument structure. The pyramid is structurally complete at R2. The seven R1 P2 corrections were all applied, and the two that were actual corrections (W2.4 reclassification, E2.3.4 placement) are logically sound. No new P1 issues were introduced by the revisions.

---

### P2 — Should Fix

**P2-1. Gupta et al. 2026 authorship inconsistency between Argument-Graph and References.**

- **Location:** E2.3.4 in the Argument-Graph; References entry for Gupta et al. 2026.
- **Issue:** The Argument-Graph evidence node at E2.3.4 cites "(Gupta et al. 2026)" with no authorship detail. The References entry reads: `Gupta, A., Dhar, R., Feitosa, D., & Vaidhyanathan, K. (2026).` The Section 3 body citation also uses the truncated form. This is a consistency issue introduced during the R1 correction: the new evidence node was added without checking the authorship rendering against the lit-review source, which cites the paper as `Gupta, A., Dhar, A., Feitosa, D., & Vaidhyanathan, K.` (note second author: "Dhar, A." in the lit-review vs. "Dhar, R." in the References). The R1 correction created a new discrepancy at the authorship level. This is a citation-auditor primary domain, but the argument-auditor flags it here since it was introduced by R2-scope corrections.
- **Recommendation:** Verify the second author's initial (A. or R.?) against the source arXiv preprint (arXiv:2604.03826) and correct the References entry to match. The discrepancy is between the lit-review citation ("Dhar, A.") and the Essay-Outline References ("Dhar, R.") — one of these is a typo. The argument-auditor escalates to P2 because the citation-auditor has already run a prior round (citation-audit-020-reaudit.md exists in the audits directory) and the new discrepancy was introduced after that audit.

**P2-2. Section 6's META-OBSERVATION and SYNTHESIS bullets develop the C5 framing beyond the Argument-Graph's W5.2 scope, introducing content not anchored to any graph node.**

- **Location:** Section 6 body, lines 183–184; Argument-Graph W5.2, E5.2.1.
- **Issue:** W5.2's scope in the Argument-Graph is: "Each prior move chipped at the surface without producing substrate-and-surface separation." E5.2.1 supports this with the pattern synthesis characterization. The META-OBSERVATION bullet added at R1 (line 183) now states: "The lineage framing borrows credibility from prior work that may not have been addressing the same underlying problem. Both readings are coherent on the present evidence; the cycle proceeds under the convergent reading while making the hidden premise explicit." The subsequent SYNTHESIS bullet (line 184) presents both the convergent reading and the alternative reading with their downstream implications, concluding that "the framing affects credibility attribution but not the architectural content."

  These two bullets develop content that goes beyond what W5.2 asserts: W5.2 asserts the prior moves were surface-level (not substrate-and-surface); the META-OBSERVATION and SYNTHESIS bullets assess the epistemic status of the convergent-lineage framing itself and present an alternative. This is substantive framing-level development, not a scope qualification. The section is anchored `(C5)` — correctly, since it is Section 6 developing C5. But the META-OBSERVATION and SYNTHESIS bullets are not developing any Argument-Graph node; they are evaluating the framing of the argument itself.

  This is distinct from the META anchor misclassification pattern (a META-anchored section with developmental bullets). Here the section is correctly anchored to C5, but within the C5-anchored section, two bullets develop content that has no Argument-Graph representation: the "two-readings" meta-commentary and the framing-affects-credibility-not-content conclusion. Under strict pyramid discipline, these bullets should either (a) be anchored to an Argument-Graph node (e.g., a new W5.4 "The convergent-lineage framing is an interpretive choice, not a discovered fact"), or (b) moved to Section 9 as META if they are genuinely scope-of-claim commentary rather than C5 argument development.

- **Recommendation:** The content is valuable and was correctly added to address R1 F-P1. The pyramid hygiene question is whether it needs an Argument-Graph node. Given that the framing disclosure is a methodological honesty obligation rather than a substantive claim about audience-bifurcation history, moving the two bullets to Section 9 META (as scope-of-claim commentary on C5's framing) is the cleaner option. Alternatively, adding a W5.4 node (framing status) to the Argument-Graph preserves Section 6 placement but adds graph complexity for content that does not change the downstream conclusions. The practitioner should choose at the gate; this is a structural tidiness concern, not a logical error.

---

### P3 — Consider

**P3-1. Section 9 META still refers to "W2.4" as a label, which no longer exists in the Argument-Graph.**

- **Location:** Section 9 META, line 215: "SCOPE QUALIFICATION — no direct empirical comparison of mid-cycle vs. graduation friction (W2.4)."
- **Issue:** W2.4 was reclassified at R1 from a standalone warrant to a SCOPE QUALIFICATION on W2.2. The node no longer exists in the Argument-Graph. Section 9's reference to "(W2.4)" is a stale label. A reader of the Argument-Graph who does not find W2.4 may be confused by the Section 9 reference. This is a minor labeling artifact of the reclassification.
- **Recommendation:** Update the Section 9 META bullet to read: "SCOPE QUALIFICATION — no direct empirical comparison of mid-cycle vs. graduation friction (SCOPE QUALIFICATION on W2.2)." This makes the reference consistent with the current Argument-Graph structure.

**P3-2. The "convergent reading" framing in the new SYNTHESIS bullet claims "the amendment is convergent, not divergent, with the prior moves" without establishing what convergence means operationally.**

- **Location:** Section 6 SYNTHESIS bullet, line 184.
- **Issue:** The SYNTHESIS bullet states: "The amendment is in the same calibration pattern Cycle 019 named (research log §Loop 1.5); it is convergent, not divergent, with the prior moves." This uses "convergent" in a rhetorical sense that is distinct from the epistemic sense deployed in the META-OBSERVATION bullet immediately above it. The META-OBSERVATION uses "convergent" to describe the lineage framing (and notes it may be a post-hoc interpretation), while the SYNTHESIS uses "convergent" to claim alignment with the Calibration-with-Graduation-Trigger Pattern. These are two different claims that use the same word. A reader scanning Section 6 could conflate them.
- **Recommendation:** In the SYNTHESIS bullet, replace "convergent, not divergent, with the prior moves" with "consistent with the Calibration-with-Graduation-Trigger Pattern" — this avoids the word "convergent" in proximity to the META-OBSERVATION's epistemic use and is more precise about what the alignment claim means.

**P3-3. E3.1.3 still cites "49% compression" without the scope qualification present in E1.2.2.**

- **Location:** E3.1.3 in the Argument-Graph: "(Cycle 020 research log §Loop 5) Spike demonstrated typed-link substrate on the Cycle 019 5-ADR sample with 49% compression and preserved canonical audit-substance."
- **Issue:** E1.2.2 now carries an inline scope qualification on the 49% figure. E3.1.3 cites the same figure without the qualification. E3.1.3 is under W3.1 (typed-link records support navigation gain and audit-substance preservation), and the 49% figure appears there as evidence for the architecture's practical viability. A reader auditing W3.1 and its evidence nodes sees an unqualified 49% figure. The R1 P2-4 correction was applied to E1.2.2 but not to E3.1.3, which cites the same empirical result.
- **Recommendation:** Add a brief parenthetical to E3.1.3: "(single-cycle sample — see E1.2.2 scope qualification)" so both appearances of the figure carry consistent scope-of-claim treatment. This is a minor consistency gap; it does not change C3's logical case.

---

## Section 2: Framing Audit

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: The five Cycle 019 ADRs were addressing genuinely distinct problems; the "one underlying pattern" is a property of methodology maturity, not reducibility.**

This framing was identified at R1 as a material alternative. The R1 revision addressed it through the META-OBSERVATION bullet in Section 6. On independent re-evaluation at R2, the META-OBSERVATION is a genuine improvement: it names the alternative reading explicitly, characterizes both readings as "coherent on the present evidence," and states that the cycle "proceeds under the convergent reading while making the hidden premise explicit." This is adequate framing disclosure at the gate level.

What the disclosure does not do is present the *evidence* for the alternative reading. The META-OBSERVATION names the alternative but does not show why a reader might find it compelling. The spike's finding E4.3.1 (compression-loss at the sub-argument level) is the strongest available evidence for the alternative: if the sub-argument structure of ADR-094, ADR-097, and ADR-098 cannot be faithfully encoded in the substrate without nested fields, this is evidence that the five ADRs are not in fact one decision expressed at unnecessary granularity — they have first-class sub-structure that the "one pattern" framing elides. The META-OBSERVATION does not connect to this evidence.

This is a P3 observation at R2: the disclosure is present and adequate for gate-level transparency; the missing piece (the evidence-to-alternative-framing link) is a completeness refinement, not a consequential omission at this stage.

**Alternative framing B: Gate-conversation tooling vs. corpus architecture.**

This framing was identified at R1 as a thinner intervention that might address the user's telos without requiring full substrate-and-surface architectural commitment. At R2, the Essay-Outline has not directly addressed this alternative. The framing is not mentioned in Section 6, Section 9, or anywhere in the body. The argument for methodology-wide substrate-and-surface separation (C2, C3) relies on the structural mechanism being the same at every synthesis moment — which supports the methodology-wide scope. But the gate-conversation-tooling framing asks: could the same structural remedy (co-location of cross-references) be achieved more cheaply by changing how gate prompts present context, rather than by changing the corpus architecture?

The research log §Loop 1.6 addresses the threshold question (scaffolded thematic consolidation vs. substrate mechanism) and concludes the substrate mechanism is "necessary but not sufficient" for the full user telos. But Loop 1.6 does not compare against gate-prompt revision as a targeted intervention. The distinction is: Loop 1.6 asks whether consolidation is enough; the gate-conversation-tooling framing asks whether skill-text changes at gate phases could reduce the cross-referential density of gate language without requiring substrate changes.

This alternative remains unaddressed at R2. It is a P2 framing concern: the source material supports the alternative (Chandler & Sweller 1992's split-attention remedy is co-location, which is achievable at the prompt-construction level without substrate changes), and the Essay-Outline does not engage it.

**Alternative framing C: The research was confirmation of a pre-endorsed hypothesis.**

This framing was identified at R1. The Meta-OBSERVATION in Section 6 does not address this concern (it addresses the lineage framing, not the research-as-confirmation concern). The spike's failure modes were correctly integrated into C4 as design constraints. The ADR-082 bracketing discipline is cited twice (Section 1 META and Section 9 PROVENANCE). On re-evaluation, the concern is less acute at R2 because the spike's constraints are named as first-class content (C4 is a conclusion, not a footnote), and C7's held caveat explicitly raises the kitchen-sink risk for the architecture. The research-as-confirmation concern is partially mitigated; the Architecture's failure modes are not suppressed.

This framing concern is at P3 at R2, down from P3 at R1 (no change in priority, but the mitigation is slightly stronger).

---

### Question 2: What truths were available but not featured?

**Finding A: Sub-argument compression-loss as conditional qualifier on audit-substance preservation (carry-over from R1).**

The R1 framing audit identified this as a finding the Essay-Outline underweighted. At R2, the Essay-Outline has not changed its framing of sub-argument compression-loss. The finding appears in C4's W4.3 and E4.3.1, and in Section 5. The framing remains "design constraint DECIDE / ARCHITECT must address." The claim in C1 — "compression to one Pattern ADR plus five structured substrate entries preserves audit-substance" — carries the SCOPE QUALIFICATION on E1.2.2 but does not name the conditionality from sub-argument compression-loss in the Abstract conclusion.

The Abstract's C1 reads: "compression to one Pattern ADR plus five structured substrate entries preserves audit-substance, provided the substrate is treated as a first-class auditable layer." The condition is expressed as "first-class auditable layer." This is not the same condition as "no compression-loss at the sub-argument level." The Abstract could accurately read: "preserves *canonical* audit-substance, provided the substrate is treated as first-class auditable; sub-argument structure requires nested fields or explicit scope-of-claim acceptance." This is a tighter condition. The current formulation is not wrong, but it is less precise about what "audit-substance" means at the sub-decision level.

This remains a P2 framing issue at R2. It was a P2 at R1 under the argument audit section (P2-3's predecessor logic in the framing audit question 2, Finding A). It is not a new finding; it is an unresolved carry-over.

**Finding B: Gupta et al. 2026 ambiguity about comprehensive substrate vs. windowed traversal.**

The R1 framing audit identified that the Gupta finding (3–5-record recency window) does not confirm that a comprehensive structured substrate plus traversal is better than selective windowing without substrate. At R2, the Essay-Outline has added E2.3.4 which cites Gupta as supporting structured traversal over flat-corpus delivery. The ambiguity identified at R1 remains: the Gupta finding is about the window size, not about substrate comprehensiveness. The use of the finding in the Essay-Outline is directionally correct (structured is better than flat), but the implied conclusion (a comprehensive substrate with traversal is the solution) may not follow from the finding.

This is a P3 observation at R2. The framing is directionally supported; the precision concern does not materially change C3's logical case.

**Finding C: Nogueira et al. 2026 on ADR template minimalism (carry-over from R1).**

This finding was identified at R1 as absent from the Essay-Outline despite being present in the Loop 3 lit-review. At R2, it remains absent. The finding (structural minimalism outperforms completeness in ADR comprehension) is relevant to C4's per-type record schema constraint (W4.2). The Loop 3 lit-review cites the paper under Q3. The Essay-Outline could use it to add empirical weight to W4.2's claim that universal record shapes replicate the comprehensiveness trap. Its absence is not a logical error, but it is an available truth that would strengthen C4.

This remains a P3 observation, unchanged from R1.

---

### Question 3: What would change if the dominant framing were inverted?

The R1 framing audit developed two inversions: (1) the prior audience-bifurcation ADRs were complete answers to different questions, and (2) the architecture's primary risk is over-commitment rather than under-commitment.

At R2, the first inversion is partially addressed by the Section 6 META-OBSERVATION. The second inversion (over-commitment risk) is addressed by C7's held caveat and by C4's six design constraints, which collectively make the production cost visible. Neither inversion has been fully engaged at the Essay-Outline's argument level, but both are surfaced enough that the gate reader can evaluate them.

On independent re-evaluation: the over-commitment framing's strongest evidence is the spike's failure modes combined with the Loop 4 skip (cross-cycle topology not examined). The Essay-Outline has one empirical data point at the corpus level (Cycle 019's 5 ADRs, examined in both Loop 1 and Loop 5). The literature provides the mechanism and the architecture class; the specific corpus-level evidence is thin. This observation was made at R1 under F-P2 and remains accurate at R2.

---

### Framing Issues

**F-P1 (carry-over from R1, partially addressed): The "convergent-but-incomplete lineage" framing's hidden premise is now named but not engaged with its evidence.**

- **Location:** C5, W5.2; Section 6 META-OBSERVATION and SYNTHESIS bullets.
- **Status at R2:** The R1 F-P1 finding was "the alternative interpretation is not named or engaged." At R2, the alternative interpretation is named and the hidden premise is made explicit. The issue is not fully resolved: the META-OBSERVATION names the alternative but does not show the evidence that makes the alternative reading compelling (specifically, that the spike's sub-argument compression-loss argues against the "one decision at unnecessary granularity" framing). For the gate reader to evaluate the two readings independently, they need the evidence, not just the label.
- **Assessment:** This is a P2 at R2, downgraded from P1 at R1. The consequential omission from R1 (alternative not named) is addressed; the remaining gap (alternative not evidenced) is a should-fix rather than a must-fix for gate purposes.
- **Recommendation:** In the META-OBSERVATION bullet, add one sentence connecting to the evidence: "The spike's sub-argument compression-loss (E4.3.1 — ADR-097's Target 2/Target 3 sub-decisions are first-class content that the flat schema loses) is the strongest available evidence for the alternative reading." This gives the gate reader the evidence path without requiring a cross-section search.

**F-P2 (carry-over from R1, not addressed): Gate-conversation-tooling as an unengaged alternative intervention.**

- **Location:** C2, C3; Section 3, Section 4 body; Loop 1.6 threshold analysis in the source material.
- **Status at R2:** Unchanged. The source material supports a thinner intervention (gate-prompt co-location of cross-references via skill-text changes) that could address the user's primary friction without requiring substrate-and-surface architectural commitment. The Essay-Outline does not engage this alternative. The R1 recommendation to address the alternative's engagement stands.
- **Assessment:** P2 (should fix), unchanged from R1. The argument for methodology-wide substrate-and-surface separation is strong, but its superiority over a targeted gate-prompt intervention is not established in the essay.
- **Recommendation:** In Section 4 (C3) or Section 9 META, add a brief acknowledgment of the gate-prompt-tooling alternative and why C3's architectural scope is preferred over a targeted intervention. The research log §Loop 1.6's threshold reasoning is the starting point: the substrate mechanism provides multi-resolution viewability and agent-side preservation that skill-text changes cannot deliver. Making this explicit closes the gap.

**F-P3 (carry-over from R1, not addressed): Sweller's element interactivity as the offered framework rather than the tested framework.**

- **Location:** C2, W2.1; Section 3 body.
- **Status at R2:** Unchanged. The Essay-Outline still uses "the structural mechanism" for element interactivity rather than "a structural mechanism" or "the best-supported structural mechanism in the evidence reviewed."
- **Assessment:** P3 (consider), unchanged from R1. The R1 recommendation (soften "the" to "a") stands.
- **Recommendation:** Soften "the structural mechanism" to "a well-supported structural mechanism" in C2's Abstract conclusion and in Argument-Graph W2.1. This is a precision adjustment; it does not change the argument.

**F-P4 (new at R2): The SYNTHESIS bullet in Section 6 presents both the convergent and alternative readings but asserts that "the downstream phases inherit the commitment either way; the framing affects credibility attribution but not the architectural content."**

- **Location:** Section 6 SYNTHESIS bullet, line 184.
- **Issue:** This claim — that the framing choice does not affect the architectural content — is asserted but not examined. Under the alternative reading (Cycle 020 identifies a new problem rather than completing a trajectory), the evidence base for C3's methodology-wide architectural commitment is thinner: there is no convergent lineage to draw on, only the single-cycle spike. A thinner evidence base could reasonably change the tier at which the commitment is made (Skill-Structure Layer vs. Tier-2 methodology principle) or the scope (methodology-wide vs. graduation-scoped). The claim that the downstream phases "inherit the commitment either way" is not neutral; it forecloses the alternative reading's potential implications.
- **Assessment:** P2 (should fix). The SYNTHESIS bullet was introduced as a R1 correction to disclose the hidden premise; in doing so, it introduced a new claim (framing-doesn't-affect-content) that is stronger than the evidence supports. The gate reader should be able to see this claim as an assertion rather than as an established fact.
- **Recommendation:** Revise the SYNTHESIS bullet's final sentence to: "The downstream phases (DECIDE / ARCHITECT) inherit the architectural commitment under either reading; whether the evidence base is sufficient for that commitment's tier and scope is a judgment the gate reader should make with both readings in view." This presents the commitment as a gate-level decision rather than a conclusion the essay draws.

---

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** NOT TRIGGERED

- Round number: R2
- P1 count this round: 0 (zero P1 findings across Section 1 and Section 2)
- P2 count this round (new, non-carry-over): 3
  - P2-1 (Section 1): Gupta et al. 2026 authorship inconsistency introduced by R1 correction (new at R2, not present in R1)
  - P2-2 (Section 1): Section 6 META-OBSERVATION and SYNTHESIS bullets develop framing-level content not anchored to an Argument-Graph node (new at R2, structural consequence of R1 correction)
  - F-P4 (Section 2): SYNTHESIS bullet asserts framing-doesn't-affect-content without examining the claim (new at R2, introduced by R1 correction)
- P2 count this round (carry-over, previously found): 3
  - F-P1 (R1 P1-tier framing finding, now downgraded to P2 at R2 due to partial address)
  - F-P2 (R1 framing finding — gate-conversation-tooling alternative not engaged)
  - Framing Audit Question 2 Finding A (sub-argument compression-loss as conditional qualifier on audit-substance preservation)
- New framings or claim-scope expansions this round:
  - F-P4: "framing affects credibility attribution but not the architectural content" — a new scope claim introduced by the R1 correction's SYNTHESIS bullet, not present in R1's findings
  - P2-2: the structural question of whether the framing-disclosure bullets in Section 6 belong in the Argument-Graph or in Section 9 META — a new structural characterization of the correction's expansion
- Recommendation: CONTINUE to R3

*The signal does not trigger at R2. Condition 1 (P1 count = 0) is met. Condition 2 (P2 count new, non-carry-over ≤ 1) is not met — three new P2 findings at R2, all introduced by R1 corrections rather than by the document's original content. Condition 3 (no new framings or claim-scope expansions) is not met — F-P4 is a new claim-scope expansion introduced by the correction. The three new P2s are correction-introduced structural artifacts, not indicators of scope expansion in the underlying argument; but per ADR-094's signal criteria, they fail condition 2 regardless of origin.*

*Single-purpose re-audits (dispatched per the re-audit-after-revision rule) omit this section. Form-change events reset the round-count baseline — the first audit on a new form is its R1.*
