# Citation Audit Report

**Audited document:** `docs/essays/015-methodology-seams.md`
**Date:** 2026-04-15

---

## Summary

- **Total references checked:** 27
- **Verified:** 26
- **Issues found:** 2 (1 P1, 1 P2)

---

## Issues

### P1 — Must Fix

#### Issue 1: Nosek et al. (2018) does not contain the 44%/96% statistic

**Location:** Section 6 (Research-Phase Anchoring, §16), paragraph beginning "The pre-registration movement provides the strongest evidence."

**Claim:** "Nosek et al. (2018) found that 44% of pre-registered hypotheses yield significant results versus 96% of traditional publications."

**Finding:** The Nosek et al. (2018) PNAS paper ("The Preregistration Revolution," vol. 115, no. 11, pp. 2600–2606) does not contain this statistic. Verified against the PMC full text (PMC5856500). The paper is a conceptual argument for preregistration; it cites Franco et al. for a different finding about selective reporting (96% of consistently significant findings were published vs. 65% of null effects), not a 44% hypothesis-confirmation rate.

The 44%/96% comparison is the finding of Scheel, A. M., Schijen, M. R. M. J., & Lakens, D. (2021), "An Excess of Positive Results: Comparing the Standard Psychology Literature With Registered Reports," *Advances in Methods and Practices in Psychological Science*, 4(2). That paper analyzed 71 registered reports against 152 standard publications and found the 44% vs. 96% confirmation rate.

The lit-review file for Track #16 (`lit-review-anchoring-debiasing.md`, source 23) correctly cites Nosek et al. (2018) for the preregistration movement but does not attribute the 44%/96% statistic to that paper. The misattribution was introduced in the essay itself.

**Recommendation:** Replace the current sentence with one of the following:

Option A (cite the correct source):
> "Scheel et al. (2021) found that 44% of pre-registered hypotheses yield significant results versus 96% of traditional publications — evidence that specifying questions before consulting evidence structurally constrains bias at the question-formation stage."

Option B (retain Nosek citation with an accurate claim):
> "Nosek et al. (2018) argued for pre-registration as a structural solution to post-hoc hypothesis laundering; subsequent evidence (Scheel et al. 2021) confirmed that 44% of pre-registered hypotheses yield significant results versus 96% of traditional publications."

Add to the References section:
> Scheel, A. M., Schijen, M. R. M. J. & Lakens, D. (2021). An Excess of Positive Results: Comparing the Standard Psychology Literature With Registered Reports. *Advances in Methods and Practices in Psychological Science*, 4(2).

---

### P2 — Should Fix

#### Issue 2: Klein (2007) — 30% improvement attributed to Klein; originates from Mitchell, Russo & Pennington (1989)

**Location:** Section 4 (Pattern Reuse and the Einstellung Effect, §13), "Mitigations" subsection, sentence: "Research by Mitchell, Russo and Pennington (cited in Klein 2007) found a 30% improvement in failure-reason identification over standard assessment."

**Finding:** The attribution is technically present and structured as a secondary citation ("cited in Klein 2007"), so it is not wrong. However, the essay body earlier in the same section renders this as:

> "Pre-mortem (Klein 2007) provides a different mechanism... The study demonstrated transfer in a face-to-face negotiation task — above-average ecological validity for this literature."

The phrase "The study demonstrated transfer" following the "(Klein 2007)" parenthetical could be read as attributing the negotiation study to Klein rather than to Gentner et al. (2003). Reading the paragraph carefully, "the study" does refer back to Gentner et al. — but the sentence sequencing creates momentary ambiguity.

More substantively: the 30% figure in the mitigations subsection is correctly flagged as coming from Mitchell, Russo & Pennington 1989 via the secondary citation in Klein 2007. The lit-review (`lit-review-analogical-transfer.md`, source 23) correctly represents this. The Klein reference itself (HBR, September 2007, pp. 18–19) is verified as real and correctly cited. No factual error exists, but the secondary-citation pattern could mislead a reader who does not follow the "(cited in)" qualifier.

**Recommendation:** Consider adding a footnote or parenthetical clarifying that the 30% finding originates with Mitchell, Russo & Pennington (1989) and is reported in Klein (2007). Alternatively, add Mitchell, Russo & Pennington (1989) as a direct reference if the primary source can be located. This is a surface-reading clarity issue, not a fabrication.

---

### P3 — Consider

No P3 issues found.

---

## Verified References

All 27 references were checked. The 26 verified without issues are listed below with the primary evidence consulted.

| # | Reference | Status | Verification source |
|---|-----------|--------|---------------------|
| 1 | Adzic, G. (2020). Specification by Example, 10 Years Later. gojko.net. | Verified | Published 2020-03-17 at gojko.net/2020/03/17/sbe-10-years.html |
| 2 | Bargh, J. A. & Chartrand, T. L. (1999). The Unbearable Automaticity of Being. *American Psychologist*, 54(7), 462–479. | Verified | APA PsycNet; DOI 10.1037/0003-066X.54.7.462; vol. and pages confirmed |
| 3 | Bilalic, M., McLeod, P. & Gobet, F. (2008). Why Good Thoughts Block Better Ones. *Cognition*, 108(3), 652–661. | Verified | PubMed 18565505; ScienceDirect; volume, issue, pages confirmed |
| 4 | Bilalic, M., McLeod, P. & Gobet, F. (2010). The Mechanism of the Einstellung (Set) Effect. *Current Directions in Psychological Science*, 19(2), 111–115. | Verified | SAGE DOI 10.1177/0963721410363571; pages 111–115 confirmed |
| 5 | Brown, W. J. et al. (1998). *AntiPatterns: Refactoring Software, Architectures, and Projects in Crisis*. Wiley. | Verified | Wiley.com product page; full author list confirmed (Brown, Malveau, McCormick, Mowbray) |
| 6 | Chrysikou, E. G. & Weisberg, R. W. (2005). Following the Wrong Footsteps. *Journal of Experimental Psychology: LMC*, 31(5), 1134–1148. | Verified | PubMed 16248755; ERIC EJ734727; vol., issue, pages confirmed |
| 7 | Englich, B., Mussweiler, T. & Strack, F. (2006). Playing Dice With Criminal Sentences. *PSPB*, 32(2), 188–200. | Verified | SAGE DOI 10.1177/0146167205282152; pages 188–200 confirmed |
| 8 | Epley, N. & Gilovich, T. (2006). The Anchoring-and-Adjustment Heuristic. *Psychological Science*, 17(4), 311–318. | Verified | SAGE DOI 10.1111/j.1467-9280.2006.01704.x; vol. 17, issue 4, pages confirmed |
| 9 | Fowler, M. (2023). Architecture Decision Record. martinfowler.com. | Verified | Live at martinfowler.com/bliki/ArchitectureDecisionRecord.html |
| 10 | Galinsky, A. D. & Moskowitz, G. B. (2000). Counterfactuals as Behavioral Primes. *Journal of Experimental Social Psychology*, 36(4), 384–409. | Verified | ScienceDirect; Columbia GSB archive; vol. 36 no. 4, pages confirmed |
| 11 | Gamma, E., Helm, R., Johnson, R. & Vlissides, J. (1994/1995). *Design Patterns*. Addison-Wesley. | Verified | Standard reference; widely cited; publisher confirmed |
| 12 | Gentner, D. (1983). Structure-Mapping: A Theoretical Framework for Analogy. *Cognitive Science*, 7(2), 155–170. | Verified | Wiley Online; Cognitive Science vol. 7, pp. 155–170 confirmed |
| 13 | Gentner, D., Loewenstein, J. & Thompson, L. (2003). Learning and Transfer. *Journal of Educational Psychology*, 95(2), 393–408. | Verified | APA PsycNet; ERIC EJ671102; DOI 10.1037/0022-0663.95.2.393; pages 393–408 confirmed |
| 14 | Harel, D. (1987). Statecharts: A Visual Formalism for Complex Systems. *Science of Computer Programming*, 8(3), 231–274. | Verified | ScienceDirect DOI 10.1016/0167-6423(87)90035-9; vol. 8, pp. 231–274 confirmed |
| 15 | Jansson, D. G. & Smith, S. M. (1991). Design Fixation. *Design Studies*, 12(1), 3–11. | Verified | ScienceDirect DOI 10.1016/0142-694X(91)90003-F; vol. 12 no. 1, pp. 3–11 confirmed |
| 16 | Klein, G. (2007). Performing a Project Premortem. *Harvard Business Review*, 85(9), 18–19. | Verified | HBR September 2007; 30% figure confirmed as originating from Mitchell, Russo & Pennington (1989), correctly attributed as secondary citation in essay |
| 17 | Luchins, A. S. (1942). Mechanization in Problem Solving: The Effect of Einstellung. *Psychological Monographs*, 54(6), i–95. | Verified | APA PsycNet; Semantic Scholar; vol. 54 confirmed; 95-page monograph |
| 18 | Metz, S. (2016). The Wrong Abstraction. sandimetz.com. | Verified | Published at sandimetz.com; widely cited practitioner piece |
| 19 | Morewedge, C. K. et al. (2015). Debiasing Decisions. *Policy Insights from Behavioral and Brain Sciences*, 2(1), 129–140. | Verified | SAGE DOI 10.1177/2372732215600886; vol. 2(1), pp. 129–140; game/video effect sizes confirmed |
| 20 | Mussweiler, T., Strack, F. & Pfeiffer, T. (2000). Overcoming the Inevitable Anchoring Effect. *PSPB*, 26(9), 1142–1150. | Verified | SAGE DOI 10.1177/01461672002611010; vol. 26, pp. 1142–1150 confirmed |
| 21 | Nosek, B. A. et al. (2018). The Preregistration Revolution. *PNAS*, 115(11), 2600–2606. | Verified (with P1 misuse — see above) | PMC5856500; DOI 10.1073/pnas.1708274114; vol. 115 no. 11, pp. 2600–2606 confirmed. Paper exists and is correctly cited in References; the P1 issue is the statistic attributed to it in the essay body. |
| 22 | Nygard, M. T. (2011). Documenting Architecture Decisions. Cognitect blog. | Verified | Live at cognitect.com/blog/2011/11/15/documenting-architecture-decisions |
| 23 | RTCA. (2011). DO-178C: Software Considerations in Airborne Systems and Equipment Certification. | Verified | Standard document; HLR/LLR distinction confirmed via secondary documentation; widely cited in safety-critical literature |
| 24 | Simon, H. A. (1956). Rational Choice and the Structure of the Environment. *Psychological Review*, 63(2), 129–138. | Verified | APA PsycNet; UCSD PDF; vol. 63, pp. 129–138 confirmed |
| 25 | Sommerville, I. (2010). *Software Engineering*, 9th ed. Addison-Wesley. | Verified | Published 2010; ISBN 9780137035151; emergent properties treatment confirmed via secondary sources |
| 26 | Strack, F. & Mussweiler, T. (1997). Explaining the Enigmatic Anchoring Effect. *JPSP*, 73(3), 437–446. | Verified | APA; Semantic Scholar; vol. 73, pp. 437–446 confirmed |
| 27 | Tulving, E. & Schacter, D. L. (1990). Priming and Human Memory Systems. *Science*, 247(4940), 301–306. | Verified | PubMed 2296719; Science DOI 10.1126/science.2296719; vol. 247, pp. 301–306 confirmed |

---

## Additional Claims Checked (Not In References List)

The following factual claims in the essay body were checked against the evidence trail and external sources:

- **Airflow PR #5283 ("Pause dag also pause its subdags"):** Verified. GitHub PR #5283 in apache/airflow exists and matches the described failure — SubDagOperator ran as a BackfillJob that ignored `is_paused`. The essay's description is accurate.
- **Airflow SubDagOperator deprecated in favor of TaskGroup:** Verified. Documented in Airflow 2.x release notes and mailing list discussion.
- **Bilalic et al. 2008 eye-tracking methodology:** Verified. PubMed abstract and Semantic Scholar confirm chess expert eye-tracking study design and the finding that verbal reports of alternative search diverged from actual eye movements.
- **Gentner et al. 2003 Experiment 3 — face-to-face negotiation:** Verified. ERIC record and paper abstract confirm the third experiment used a dynamic face-to-face negotiation exercise.
- **Klein 2007 — 30% improvement:** Verified. The 30% figure originates from Mitchell, Russo & Pennington (1989) and is accurately reported as a secondary citation in the essay (see P2 above).
- **GDS ADR guidance — "other documentation should be updated whenever a new ADR is accepted":** Consistent with the lit-review report's characterization of GDS (S7); quoted language is described as GDS's position in the lit-review, not directly verified against the live GDS page, but the characterization matches the lit-review's synthesis.
