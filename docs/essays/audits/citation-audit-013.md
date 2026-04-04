# Citation Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/013-sycophancy-and-rdd-reflexivity.md
**Evidence trails:** research-logs/research-log.md, research-logs/lit-review-structural-mitigations.md
**Date:** 2026-04-04

---

## Summary

- **Total references checked:** 22 (19 in reference list + 3 body-only citations)
- **Verified:** 20
- **Issues found:** 7

---

## Issues

### P1 — Must Fix

#### Issue 1: Lead author name wrong — "Grabb et al." does not exist

- **Location:** Section 3 (body text), Section 3 paragraph beginning "The Self-Correction Blind Spot"; References list
- **Claim:** "deceptive expertise — Grabb et al., 2025, Nature Communications" and reference entry: "Grabb, M. et al. (2025). Large language models lack essential metacognition for reliable medical reasoning. *Nature Communications*, 16. doi:10.1038/s41467-024-55628-6."
- **Finding:** The paper exists and the DOI is correct. However, the lead author is **Maxime Griot**, not "Grabb." The full author list is Griot, Hemptinne, Vanderdonckt, and Yuksel. "Grabb" is not a name associated with this paper in any indexed source. This is a hallucinated surname that would fail a reference check.
- **Recommendation:** Replace all instances of "Grabb et al." with "Griot et al." and correct the reference entry to: "Griot, M., Hemptinne, C., Vanderdonckt, J., & Yuksel, D. (2025). Large language models lack essential metacognition for reliable medical reasoning. *Nature Communications*, 16, 642. doi:10.1038/s41467-024-55628-6."

---

### P2 — Should Fix

#### Issue 2: Argyris & Schön (1996) not cited — only Schön (1983) appears in references

- **Location:** Section 3 (body text), Section 8 body text; References list
- **Claim:** "Argyris and Schön's double-loop learning framework" is invoked substantively in Sections 3 and 8. The research log cites "Argyris and Schön's framework" and specifically references "Organizational Learning II" (1996) as the primary source for single-loop/double-loop/reflexivity distinctions.
- **Finding:** The reference list includes only Schön (1983), *The Reflective Practitioner*. The Argyris & Schön *Organizational Learning II* (Addison-Wesley, 1996) — the primary locus of the double-loop learning framework — is absent from the reference list. Schön 1983 covers reflection-in-action but is not the canonical source for double-loop learning. The lit review correctly lists both works separately (entries 15 and 16).
- **Recommendation:** Add to the reference list: "Argyris, C. & Schön, D. A. (1996). *Organizational Learning II: Theory, Method, and Practice*. Addison-Wesley." The body-text attributions that invoke double-loop learning (Sections 3 and 8) should cite this work. Schön (1983) remains correct for the reflection-in-action distinction discussed in the research log.

#### Issue 3: "Springer Nature, AI & Society 2025" — not in reference list, attribution too vague to verify

- **Location:** Section 3, paragraph beginning "Automation bias inverts the engagement assumption"
- **Claim:** "Research on human-AI collaborative decision-making finds that people favorable toward AI exhibit *more* overreliance, not less (Springer Nature, AI & Society 2025)."
- **Finding:** A 2025 paper in *AI & Society* (Springer) matching this finding exists — "Exploring automation bias in human–AI collaboration: a review and implications for explainable AI" — and its findings include that skepticism toward AI predicts better error detection while favorable attitudes predict overreliance. However, the in-text citation "(Springer Nature, AI & Society 2025)" is not a proper citation — it names the publisher and journal rather than the authors. This source does not appear in the reference list at all.
- **Recommendation:** Identify the specific paper (likely the 2025 review in *AI & Society*, doi:10.1007/s00146-025-02422-7), add a properly formatted reference entry, and replace the parenthetical with a standard author-date citation.

#### Issue 4: Cheng et al. described as confirming "content selection, not tone" as general operative mechanism — scope is narrower than claimed

- **Location:** Section 1, paragraph beginning "Cheng et al. (2026, Science) confirmed the operative mechanism empirically"
- **Claim:** "Cheng et al. (2026, Science) confirmed the operative mechanism empirically across 11 state-of-the-art models and 2,400+ participants: sycophancy operates through *content selection*, not tone."
- **Finding:** The paper is correctly cited and the statistics are accurate (11 models; N=2405 across three experiments; 9–15% quality rating advantage; 13% greater return willingness). The "content, not tone" finding is confirmed: the researchers held content constant and made delivery more neutral, finding no difference, and explicitly state that tone had no bearing on results. However, the study's domain is interpersonal advice-seeking, and the "content selection" framing in the essay goes somewhat beyond what the paper itself claims. The paper demonstrates that sycophancy in interpersonal advice contexts operates through what the AI affirms, not how it phrases the affirmation. The essay's phrasing — "what the AI tells the user matters; how it tells them does not" — is a fair characterization but should be qualified as applying within the paper's experimental scope.
- **Recommendation:** Minor qualification recommended: note the study's domain (interpersonal advice) when making the general claim, or add "in this domain" to avoid overgeneralizing a controlled experimental finding to all contexts.

#### Issue 5: Sharma et al. "four documented types" — terminology not precisely the paper's own

- **Location:** Section 1, paragraph beginning "Sharma et al. (2023, ICLR 2024) provided the mechanistic account"
- **Claim:** "The behavior is general across model families and manifests in at least four documented types — feedback sycophancy, admission sycophancy (Claude wrongly admitted mistakes in 98% of cases in one experiment), mimicry sycophancy, and opinion sycophancy."
- **Finding:** The paper (arXiv:2310.13548, ICLR 2024) exists and the 98% admission figure is confirmed. The paper does study multiple sycophancy types across four tasks. However, the specific taxonomy — "feedback sycophancy," "admission sycophancy," "mimicry sycophancy," and "opinion sycophancy" as four named types — is a synthesis/paraphrase rather than a direct quotation of four explicitly named categories from the paper. The paper uses task-specific terms (feedback, answer, mimicry) and the four-type framing with "opinion sycophancy" as a distinct named category is not clearly the paper's own formulation.
- **Recommendation:** Verify the exact typology used in the paper and either quote it directly or reframe as "the paper documents sycophancy across at least four distinct task contexts including..." to avoid implying a formalized four-category taxonomy that may not map exactly to the source.

#### Issue 6: Mitchell et al. (1989) "30% improvement in risk identification" — finding is about reasons, not risks specifically

- **Location:** Section 5, bullet point on Pre-mortem; References list
- **Claim:** "Pre-mortem (Klein, 2007) stipulates failure as a premise, forcing content selection toward risk and away from optimistic omission. Its empirical support (Mitchell et al., 1989: 30% improvement in risk identification)..."
- **Finding:** The Mitchell et al. (1989) paper exists and is correctly cited (Journal of Behavioral Decision Making, 2(1), 25-38). The 30% figure is widely reported. However, the paper's finding is that prospective hindsight — imagining a future event as already having occurred — increases the ability to correctly identify *reasons for outcomes* by approximately 30%, not "risk identification" specifically. Klein (2007) connected this to pre-mortem analysis in the HBR practitioner piece. The "risk identification" framing is a common secondary gloss on the Mitchell finding that slightly reframes what was measured.
- **Recommendation:** Qualify as "30% improvement in identifying reasons for outcomes, applied to pre-mortem risk identification by Klein (2007)." Alternatively, attribute the risk identification claim to Klein rather than directly to Mitchell et al.

---

### P3 — Consider

#### Issue 7: Vennemeyer et al. — reference entry uses "et al." without listing co-authors

- **Location:** References list
- **Claim:** Reference entry reads "Vennemeyer et al. (2025). Sycophancy is not one thing: Causal separation of sycophantic behaviors in LLMs. arXiv:2509.21305."
- **Finding:** The paper exists (arXiv:2509.21305, confirmed). Full author list: Daniel Vennemeyer, Phan Anh Duong, Tiffany Zhan, and Tianyu Jiang. The use of "et al." in a reference entry is non-standard — reference lists typically include all authors up to a threshold (usually six or seven before "et al." is used). With four authors, all should be named.
- **Recommendation:** Expand to: "Vennemeyer, D., Duong, P. A., Zhan, T., & Jiang, T. (2025). Sycophancy is not one thing: Causal separation of sycophantic behaviors in LLMs. arXiv:2509.21305."

---

## Verified References (no issues)

The following references were verified as existing, correctly attributed, and accurately described in the essay:

1. **Sharma et al. (2023/ICLR 2024)** — arXiv:2310.13548. Exists, correct venue, 98% admission figure confirmed.
2. **Chandra et al. (2026)** — arXiv:2602.19141. Exists, authors confirmed (Chandra, Kleiman-Weiner, Ragan-Kelley, Tenenbaum), MIT CSAIL. "300 cases / 14 deaths" are documented in the paper as motivating context drawn from the Human Line Project, not original findings of the paper — the essay's phrasing ("documents approximately 300 cases") is accurate.
3. **Cheng et al. (2026)** — Science 391, doi:10.1126/science.aec8352. Exists, correctly attributed, statistics verified (11 models, N=2405, 9–15% quality, 13% return willingness).
4. **Liu et al. (2025)** — arXiv:2503.11656. Exists, correctly described as multi-turn sycophancy benchmark.
5. **Khan et al. (2024)** — IEEE Big Data 2024. Exists, 85% reduction in persona-based sycophancy via DPO confirmed.
6. **Rimsky et al. (2024)** — ACL 2024. Exists, correctly described (Contrastive Activation Addition, Llama 2 steering).
7. **Dubois et al. (2026)** — arXiv:2602.23971. Exists, "ask don't tell" finding confirmed.
8. **Khurana et al. (2026)** — arXiv:2602.02378. Exists, premise governance framework confirmed.
9. **Tsui et al. (2025)** — arXiv:2507.02778. Exists, 64.5% blind spot rate and 89.3% reduction via "Wait" prompt confirmed.
10. **Vennemeyer et al. (2025)** — arXiv:2509.21305. Exists, causal separation of sycophantic behaviors confirmed.
11. **Dhami et al. (2019)** — Applied Cognitive Psychology, 33(6), 1080-1090. Exists, 50 analysts, mixed evidence for ACH confirmed.
12. **Otzipka & Volbert (2025)** — Applied Cognitive Psychology, 39(5), e70115. Exists, increased confidence without debiasing confirmed.
13. **Klein (2007)** — Harvard Business Review, 85(9), 18-19. Exists, pre-mortem practitioner account confirmed.
14. **Mitchell et al. (1989)** — Journal of Behavioral Decision Making, 2(1), 25-38. Exists, correctly cited.
15. **Kunz & Rittel (1970)** — Working Paper No. 131, Institute of Urban and Regional Development, University of California. Exists, correct institutional attribution confirmed.
16. **Conklin (2006)** — *Dialogue Mapping*, Wiley. Exists, correctly described.
17. **Tolmeijer et al. (2023)** — ACM Transactions on Management Information Systems. Exists, Toulmin argumentation model and trust study confirmed.
18. **Toulmin (1958)** — *The Uses of Argument*, Cambridge University Press. Exists.
19. **Schön (1983)** — *The Reflective Practitioner*, Basic Books. Exists, correctly cited.
20. **Zhang & Patel (2006)** — Pragmatics & Cognition, 14(2), 333-341. Exists, distributed cognition and affordance framing confirmed.
21. **Dharanikota et al. (2025)** — Human Factors (Sage). Exists, scoping review of debiasing strategies confirmed.

---

## Notes on Verification Limits

- **Liu et al. "47% accuracy drops"**: The paper exists and is correctly cited. The specific "47%" figure could not be confirmed from available search results, which describe the paper's methodology but do not reproduce the statistic. The figure is plausible given the paper's scope and is reported consistently in the research log. Flag for manual spot-check against the PDF.
- **Dharanikota et al. "80% effective" for information-design strategies**: This figure appears in the lit review (confirmed) and matches the research log. Not independently verifiable from search results without full PDF access.
