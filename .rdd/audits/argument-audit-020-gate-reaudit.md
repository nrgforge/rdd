# Argument Audit Report — Gate Re-Audit (Post-R3 Revisions)

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md` (revised post-gate)
**Prior audit:** `.rdd/audits/argument-audit-020-r3.md` (R3 — findings carried into gate response)
**Genre:** Essay-Outline (per ADR-092)
**Date:** 2026-05-23
**Dispatch type:** Verification re-audit per ADR-094 re-audit-after-revision rule. Does NOT append a Convergence-Saturation Signal verdict line.

---

## Re-Audit Scope

Four gate-responsive revisions are verified:

1. **F-P2 (skipped per practitioner gate response)** — no Essay-Outline change; verify no inadvertent modification was introduced.
2. **F-P4 (SYNTHESIS bullet revised)** — C5 SYNTHESIS bullet's "framing affects credibility attribution but not architectural content" foreclosure replaced with an opening framing.
3. **F-P1 (evidence link added to W5.4)** — two new evidence nodes (E5.4.2, E5.4.3) connecting the alternative-reading framing to (a) the spike's sub-argument compression-loss finding and (b) the practitioner's gate response.
4. **F-P3 (CLT softening)** — "The structural mechanism" softened to "a well-supported structural mechanism" in C2 Abstract conclusion and W2.1.

---

## Revision 1: F-P2 Skip Verification

**Status: CONFIRMED CLEAN.**

The R3 F-P2 finding concerned the gate-conversation-tooling alternative not being engaged in the Essay-Outline body (C2, C3; Section 4; Section 9 META). The practitioner's gate response endorsed the skip; no Essay-Outline modification was warranted.

Review of the revised Essay-Outline confirms: Sections 3, 4, 7, and 9 are unchanged relative to the R3 document with respect to F-P2. The gate-prompt co-location alternative is still not engaged in the body — as intended. No inadvertent modification was introduced for this finding.

The F-P2 concern passes to DECIDE as a documented open item, per the R3 audit's gate-reader note.

---

## Revision 2: F-P4 SYNTHESIS Bullet (Section 6)

**Status: REVISION APPLIED AND SOUND.**

**What R3 F-P4 found:** The Section 6 SYNTHESIS bullet closed with: "The downstream phases (DECIDE / ARCHITECT) inherit the commitment either way; the framing affects credibility attribution but not architectural content." This treated "framing doesn't affect architectural content" as a resolved conclusion rather than an inspectable claim. E5.4.2 (added at R2) flagged this in the Argument-Graph, but the body still presented it as settled.

**What the revision does:** The SYNTHESIS bullet now reads (lines 188):

> Under the alternative reading, Cycle 020's amendment is a new architectural move that shares some surface features with prior moves but addresses a problem the prior moves did not. **Which reading holds may affect the amendment's appropriate tier and scope**: the convergent reading carries warrant from the prior lineage and supports a methodology-wide architectural commitment with the prior lineage's accumulated evidence base; the alternative reading carries less inherited warrant and would call for stronger in-cycle empirical grounding before committing at the same tier — possibly suggesting a narrower scope (cycle-internal proof-of-concept) or a different tier (Skill-Structure Layer with explicit empirical grounding per ADR-097, vs. Tier-2 methodology vocabulary). DECIDE evaluates both readings when scoping the amendment; the choice between them is consequential, not merely attributional.

**Assessment:** The foreclosure is opened. The revised text does three things the R3 recommendation called for:

1. It withdraws the "framing affects credibility attribution but not architectural content" claim.
2. It substitutes concrete tier-and-scope consequences that differ under each reading (Skill-Structure Layer with explicit grounding vs. Tier-2 methodology vocabulary; methodology-wide commitment vs. cycle-internal proof-of-concept).
3. It explicitly routes the choice to DECIDE rather than resolving it in the Essay-Outline.

The revision is sound. No new logical issues are introduced. The tier-and-scope consequences stated are well-grounded: the convergent reading's warrant-from-lineage rationale and the alternative reading's call for stronger in-cycle grounding are consistent with the ADR-097 Empirical-Grounding-Filter framework the cycle operates under.

One minor observation (not a finding): the bolded sentence "Which reading holds may affect the amendment's appropriate tier and scope" is placed partway through the SYNTHESIS bullet rather than as a closing sentence. The emphasis is appropriate but the flow is slightly unusual — the tier-and-scope elaboration follows the bolded claim, then "DECIDE evaluates both readings" closes the paragraph. This ordering is coherent; no change required.

**F-P4: RESOLVED.**

---

## Revision 3: F-P1 Evidence Nodes E5.4.2 and E5.4.3

**Status: REVISION APPLIED AND SOUND, WITH ONE MINOR NOTE.**

**What R3 F-P1 found (P3 at R3):** E5.4.1 cited the R1 audit as evidence for the alternative reading's plausibility. The R3 finding noted that the spike's sub-argument compression-loss (E4.3.1) is the most concrete available evidence that the five ADRs have first-class sub-structure that resists lossless compression — and a gate reader evaluating the alternative reading would need to navigate to E4.3.1 for that substantive evidence rather than finding it at W5.4.

**What the revisions do:**

*E5.4.2 (lines 85):*
> (Cycle 020 research log §Loop 5.3 Constraint 3) The spike's sub-argument compression-loss finding (the five-field schema lost ADR-094's signal-evaluation step, ADR-097's Target 2/Target 3 sub-decisions, ADR-098's reflexive-application argument structure) is the strongest evidence making the alternative reading compelling: the prior six ADRs were addressing placement / admissibility / form change, not sub-argument structure; the substrate-and-surface separation is the first move addressing the sub-argument structural concern, suggesting it is a NEW architectural problem rather than the completion of a prior trajectory. The convergent reading is preserved as the cycle's operating posture per the practitioner's gate response (2026-05-23), but the spike-evidence link makes the alternative reading inspectable at DECIDE.

*E5.4.3 (line 86):*
> (Practitioner gate response 2026-05-23, F-P4 engagement) Which reading holds is consequential — it may affect the amendment's appropriate tier (Skill-Structure Layer with stronger empirical grounding per ADR-097 vs. Tier-2 methodology vocabulary) and scope (methodology-wide vs. cycle-internal proof-of-concept). DECIDE engages both readings when scoping ADR-CANDIDATE-020.1.

**Assessment of E5.4.2:** The connection is sound and fills the gap the R3 F-P1 finding named. The spike finding at Loop 5.3 Constraint 3 is the correct evidence node — E4.3.1 establishes that ADR-097's Target 2/Target 3 sub-decisions and ADR-098's reflexive-application argument are first-class content the flat schema loses, and E5.4.2 now cites this directly at W5.4. The inference drawn — that sub-argument structural loss suggests a new architectural problem rather than a completion of a prior trajectory — is a legitimate reading of that evidence. The caveat preserving the convergent reading as the cycle's operating posture while making the evidence link inspectable is the appropriate epistemic posture.

One minor note on "strongest evidence": this characterization is a judgment call. E5.4.2 asserts the spike's compression-loss is "the strongest evidence making the alternative reading compelling." This claim is asserted rather than argued. The evidence is indeed concrete and relevant; whether it is stronger than, say, the operational-vs-attributional distinction (the six prior ADRs have different surface artifacts, different problem types, different enforcement tiers) is debatable. However, this is P3-level precision, not a logical flaw — the claim is defensible, and no counterweight evidence exists in the document that would make it misleading.

**Assessment of E5.4.3:** The connection to the practitioner's gate response is legitimate provenance: the gate response's engagement with F-P4 is a real event that the cycle should record, and noting the tier-and-scope consequences here is appropriate. The content of E5.4.3 substantially overlaps with the F-P4 SYNTHESIS revision (Revision 2 above) — both state the tier-and-scope consequences and route the choice to DECIDE. This is intentional design (the Argument-Graph node makes the claim auditable; the Section 6 body makes it visible to readers), not redundancy.

**Pyramid check on E5.4.2 and E5.4.3:** Both nodes are under W5.4, which is under C5. C5 is an Abstract conclusion. Section 6 is anchored `(C5)`. The Section 6 META-OBSERVATION and SYNTHESIS bullets develop W5.4's claim. The pyramid integrity for C5 is maintained. No new boundary violations introduced.

**F-P1: RESOLVED.**

---

## Revision 4: F-P3 CLT Softening

**Status: PARTIALLY APPLIED — ONE LOCATION CONFIRMED, ONE REQUIRES CLOSER EXAMINATION.**

**What R3 F-P3 found:** "The structural mechanism" in two locations — C2 Abstract conclusion and W2.1 — overstated the epistemic status of Sweller's CLT given the Loop 3 lit-review did not compare CLT against alternative frameworks (Hick's law; Miller; information-density-vs-processing-speed). Recommended softening to "a well-supported structural mechanism."

**Location 1 — C2 Abstract conclusion (line 11):**

The current text reads:
> Sweller's element interactivity is **a well-supported structural mechanism** for cognitive load at synthesis moments; the Loop 3 lit-review did not compare CLT against alternative frameworks (Hick's law; Miller's working-memory limits; information-density-vs-processing-speed), so the cycle's commitment is to CLT as a sufficient explanation, not as the only candidate.

This is correct. "A well-supported structural mechanism" is present. The softening was applied. Additionally, the explicit acknowledgment that CLT was not compared against alternative frameworks — naming Hick's law, Miller's limits, and information-density-vs-processing-speed — is present at C2. This goes beyond the R3 recommendation, which asked only for the softening. The acknowledgment adds precision that closes the framing concern at the Abstract level.

**Location 2 — W2.1 Argument-Graph (line 29):**

The current text reads:
> W2.1. Sweller's element interactivity is **a well-supported structural mechanism** for cognitive load at synthesis moments; the Loop 3 lit-review did not compare CLT against alternative frameworks, so the cycle's commitment is to CLT as a sufficient explanation, not as the only candidate.

This is correct. "A well-supported structural mechanism" is present. The softening was applied. W2.1 also carries the acknowledgment that the lit-review did not compare CLT against alternative frameworks, though without naming the specific frameworks by name (unlike C2). This is acceptable — the Abstract's named alternatives anchor the claim for careful readers; W2.1's acknowledgment matches the Abstract's epistemic posture.

**Check for other locations:** The R3 dispatch asked to verify "no other locations missed." The phrase "the structural mechanism" (with definite article, implying uniqueness) appears in the R3 audit findings themselves but not in the body of the revised Essay-Outline. Section 3's CLAIM bullets use "the structural mechanism for corpus-overwhelm" in two places (lines 128 and 131), referring to element interactivity in the body outline. These are body expansion bullets (under C2's body section), not abstract or graph conclusions. Strictly, these could also be softened for full consistency — however, Section 3's body bullets develop W2.1, and the scope qualification that appears in W2.1 and the Section 3 SCOPE QUALIFICATION bullet is sufficient epistemic cover. The Section 3 body's use of "the mechanism" in a developmental context (warranting claims) rather than a conclusory context (asserting the finding) is a lower-risk usage. This is a P3 precision observation, not a material gap.

**F-P3: RESOLVED at C2 and W2.1. Minor consistency note on Section 3 body bullets (P3, noted, not requiring correction before DECIDE).**

---

## Independent Pyramid Re-Verification (Brief)

**Four-section check:** Abstract (C1–C7 numbered), Argument-Graph (C1–C7 with warrants and evidence), Citation-Embedded Outline (Sections 1–9 with anchors), References (bibliography). All four sections present and in order. No structural violation.

**New evidence nodes introduced:** E5.4.2 (Loop 5.3 Constraint 3 citation) and E5.4.3 (practitioner gate response citation). Both are under W5.4, which is under C5, which anchors Section 6. The Section 6 body (META-OBSERVATION and SYNTHESIS bullets) develops W5.4 and now has concrete Argument-Graph anchoring for the tier-and-scope consequence claims introduced in the SYNTHESIS revision. No orphan nodes, no missing anchors.

**Boundary integrity after revisions:**

- **Boundary 1:** All seven Abstract conclusions still have matching Argument-Graph nodes. C2's revised text is still anchored to C2 in the Argument-Graph. No new boundary 1 issues.
- **Boundary 2:** E5.4.2 and E5.4.3 are developed in Section 6 (META-OBSERVATION and SYNTHESIS respectively). No orphan nodes introduced.
- **Boundary 3:** E5.4.3 cites "Practitioner gate response 2026-05-23" — this is an internal document reference (a dated gate event), not an external citation requiring a References entry. This is consistent with how E5.4.1 cites the R1 audit: internal corpus provenance references appear in the Cycle 020 internal references block, not the external bibliography. The gate response is not currently listed in the Cycle 020 internal references — this is a minor provenance completeness gap but not a Boundary 3 violation (the reference is to a cycle event, not a citable external source). If the gate response produces a written artifact (gate decision record), adding it to the Cycle 020 internal references block would be appropriate.
- **Reverse Boundary 1:** No new Argument-Graph nodes added at the top-level claim tier. E5.4.2 and E5.4.3 are evidence nodes under an existing warrant (W5.4) under an existing claim (C5). No reverse boundary 1 issues.
- **Reverse Boundary 2:** No body subsections were added. Section 6's revised SYNTHESIS bullet now has corresponding Argument-Graph content (W5.4 and its evidence nodes). No reverse boundary 2 issues.

**META sections:** §1 and §9 unchanged. No new developmental content added to META-anchored sections.

**Pyramid is clean after the four gate-responsive revisions.**

---

## Independent Framing Re-Verification (Brief)

**F-P2 (gate-prompt-tooling alternative):** Unchanged and correctly not addressed (per practitioner skip endorsement). No new evidence or framing in the revisions bears on this.

**F-P4 (SYNTHESIS foreclosure):** Resolved as noted in Revision 2. The revised SYNTHESIS bullet does not introduce a new foreclosure or over-correction. Both readings are now presented as open and consequential; neither is asserted as more likely. This is appropriate epistemic balance.

**Potential over-correction check:** Did opening the F-P4 foreclosure tilt the document toward the alternative reading? The revised SYNTHESIS bullet (line 188) describes consequences under each reading at roughly equal length. The document's operating posture remains the convergent reading ("the convergent reading is preserved as the cycle's operating posture per the practitioner's gate response" — E5.4.2). No over-correction to the alternative reading.

**New framing concern introduced by revisions:** None. The revisions are precision additions and a foreclosure-opening — they do not introduce new claims, new evidence characterizations, or new architectural arguments.

---

## Summary of Verification Findings

| Revision | Target | Status | Notes |
|----------|--------|--------|-------|
| F-P2 skip | No change to Essay-Outline | CONFIRMED CLEAN | No inadvertent modification |
| F-P4 SYNTHESIS bullet | Section 6 SYNTHESIS; foreclosure opened | RESOLVED | Tier-and-scope consequences named; both readings presented as open; routed to DECIDE |
| F-P1 E5.4.2 | Spike compression-loss evidence link at W5.4 | RESOLVED | Connection to E4.3.1 is sound; "strongest evidence" characterization is defensible at P3 precision |
| F-P1 E5.4.3 | Practitioner gate response provenance at W5.4 | RESOLVED | Content overlaps with F-P4 revision by design; minor: gate response not yet in internal references block |
| F-P3 C2 softening | "a well-supported structural mechanism" + named alternatives | RESOLVED | Applied; richer than minimum recommendation |
| F-P3 W2.1 softening | "a well-supported structural mechanism" | RESOLVED | Applied; consistent with C2 |

**Residual items not introduced by these revisions (carry-overs from R3):**

- P3-1: Stale "(W2.4)" label in Section 9 META.
- P3-2: E3.1.3 unqualified 49% figure.
- P3-3: "Convergent" proximity in Section 6 SYNTHESIS.
- P2-1 / F-P2: Gate-prompt-tooling alternative unengaged (endorsed skip at gate).
- Minor provenance completeness: practitioner gate response not in Cycle 020 internal references block.

All revisions targeted by the gate response have been applied correctly. The pyramid is structurally sound. No new argument or framing issues were introduced.

*Re-audit dispatched per ADR-094 re-audit-after-revision rule. Convergence-Saturation Signal verdict line omitted per that rule.*
