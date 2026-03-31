# Citation Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/009-adaptive-epistemic-gates.md
**Evidence trail:** /Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md
**Date:** 2026-03-30

---

## Summary

- **Total references checked:** 24
- **Verified:** 21
- **Issues found:** 7 (2 P1, 3 P2, 2 P3)

---

## Issues

### P1 — Must Fix

---

**Issue 1**

- **Location:** Section 7, paragraph beginning "Recent research (ICLR 2026) decomposes LLM sycophancy..."
- **Claim:** "LLMs affirm whichever position the user adopts in 48% of moral conflict scenarios, regardless of which side." This statistic is attributed by context to arXiv:2509.21305 ("Sycophancy Is Not One Thing"), which is cited in the same paragraph and is the only ICLR 2026 sycophancy paper listed in the reference section.
- **Finding:** The 48% figure does not originate from arXiv:2509.21305. That paper decomposes sycophancy into mechanistically separable representations (sycophantic agreement, genuine agreement, sycophantic praise) but does not report a 48% moral-conflict figure. The 48% finding comes from a different ICLR 2026 paper: arXiv:2505.13995, "ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs" (Cheng, Yu, Lee, Khadpe, Ibrahim, Jurafsky). The ELEPHANT paper reports that LLMs affirm both sides of a moral conflict (whichever side the user adopts) in 48% of cases on average, using the AITA-NTA-FLIP benchmark. The two papers are separate works with separate arXiv IDs and separate author teams.
- **Recommendation:** Add arXiv:2505.13995 to the reference list and attribute the 48% moral-conflict finding to it. The paragraph should distinguish the two papers: arXiv:2509.21305 for the mechanistic decomposition into three sycophancy types; arXiv:2505.13995 for the 48% empirical finding on moral conflicts.

---

**Issue 2**

- **Location:** References section — "Søndergaard, M.L.J. (2022). *Staying with the Trouble through Design: Critical-Feminist Design of Intimate Technology*. AU Library/KB Press."
- **Claim:** Publication year is 2022.
- **Finding:** The confirmed publication date is December 3, 2018. The work is a doctoral dissertation defended at Aarhus University on November 19, 2018, published through AU Library Scholarly Publishing Services. No 2022 edition or reprint was found. The publisher label "AU Library/KB Press" is also non-standard — the confirmed citation from the publisher's own catalog reads: "Søndergaard, M. L. J. (2018). *Staying with the Trouble through Design: Critical-feminist Design of Intimate Technology*. Aarhus Universitet." The Royal Danish Library (KB) hosts the platform but is not the named publisher.
- **Recommendation:** Correct the year to 2018 and update the publisher to "Aarhus Universitet" (or "AU Library Scholarly Publishing Services"). Corrected reference: Søndergaard, M.L.J. (2018). *Staying with the Trouble through Design: Critical-Feminist Design of Intimate Technology*. Aarhus Universitet.

---

### P2 — Should Fix

---

**Issue 3**

- **Location:** References section — "(2025). 'The Path to Conversational AI Tutors: Integrating Tutoring Best Practices and Targeted Technologies.' arXiv:2602.19303."
- **Claim:** Year listed as 2025.
- **Finding:** arXiv:2602.19303 ("The Path to Conversational AI Tutors: Integrating Tutoring Best Practices and Targeted Technologies to Produce Scalable AI Agents," Vanacore, Baker, Closser, Roschelle) was submitted to arXiv on February 22, 2026. The arXiv ID prefix "2602" encodes year 2026, month 02. The paper is a 2026 work.
- **Recommendation:** Correct the year to 2026. The title in the reference is also truncated; the full title is "The Path to Conversational AI Tutors: Integrating Tutoring Best Practices and Targeted Technologies to Produce Scalable AI Agents." Update accordingly.

---

**Issue 4**

- **Location:** References section — "(2025). 'Hybrid LLM-Embedded Dialogue Agents for Learner Reflection.' arXiv:2602.20486."
- **Claim:** Year listed as 2025.
- **Finding:** arXiv:2602.20486 ("Hybrid LLM-Embedded Dialogue Agents for Learner Reflection: Designing Responsive and Theory-Driven Interactions," Sharma et al.) was submitted to arXiv on February 24, 2026. The arXiv ID prefix "2602" confirms year 2026, month 02. The paper is a 2026 work.
- **Recommendation:** Correct the year to 2026.

---

**Issue 5**

- **Location:** References section — "Wiliam, D. (2006). 'Formative Assessment and Contingency in the Regulation of Learning Processes.' Paper presented at ICME-10."
- **Claim:** The paper was presented at ICME-10 (International Congress on Mathematical Education, 10th iteration, held in Copenhagen, 2004).
- **Finding:** A paper by Wiliam with this exact title exists and is available as a PDF. However, the conference identification is uncertain. Search results locate this paper in the context of an AERA (American Educational Research Association) 2014 presentation, and the title is also used as a working paper in its own right. ICME-10 was held in 2004, not 2006, which would make a "2006, ICME-10" attribution internally inconsistent — if the paper was presented at ICME-10, the year would be 2004, not 2006. No direct confirmation of a 2006 ICME-10 presentation was found. The paper content is real and Wiliam-authored; only the conference attribution and year combination is uncertain.
- **Recommendation:** Verify the original conference and year against Wiliam's own publication list or the ICME-10 proceedings. If the paper dates to 2004 (ICME-10), correct the year. If 2006, the conference name needs correction. As a fallback, cite it as a working paper or conference presentation with the verified year from the document itself.

---

### P3 — Consider

---

**Issue 6**

- **Location:** References section — "Freire, P. (1970). *Pedagogy of the Oppressed*. Continuum." Also: "Alexander, R. (2020). *A Dialogic Teaching Companion*. Routledge."
- **Claim:** Both works are listed in the references section.
- **Finding:** Both publications are verified as real works with correct bibliographic details. However, neither Freire (1970) nor Alexander (2020) is cited by name in the body of the essay. Freire is mentioned only indirectly via the research log synthesis ("Freire's concept of generative themes"), but the essay body does not include an explicit "(Freire, 1970)" citation. Alexander (2020) appears in the reference list but the body cites only "Alexander, 2008." The research log (Q1, section 8) discusses Wegerif (2025) and "double dialogic pedagogy" but does not attribute this directly to Freire in the essay body.
- **Recommendation:** Either add inline citations in the essay body where these works are relevant, or remove them from the reference list if they are not directly cited. Uncited references in a formatted reference list create the appearance of padding. This is a minor formatting matter, not a factual error.

---

**Issue 7**

- **Location:** Section 2, paragraph beginning "Wells (1999) and Alexander (2008) demonstrate..."
- **Claim:** The essay attributes the 80% IRE statistic to "Alexander, 2008" — "over 80% of classroom talk follows this pattern (Alexander, 2008)."
- **Finding:** The 80% figure is widely cited in the classroom discourse literature but the specific sourcing to Alexander (2008) could not be directly confirmed against the text of that book. The figure is plausible — it circulates in multiple secondary sources discussing Alexander's work — but the research log attributes the source differently, stating simply "Research finds over 80% of classroom talk follows this pattern" without a specific page citation. A figure of this precision usually requires a page number to verify. The claim is not demonstrated to be wrong, but the specific source attribution could not be independently confirmed.
- **Recommendation:** If possible, add a page citation for the 80% figure from Alexander (2008) to allow verification. Alternatively, note that this figure is attributed in the literature to Sinclair and Coulthard (1975) and subsequent studies, and cite accordingly if Alexander (2008) is repeating an earlier finding rather than reporting original data.

---

## Verified References

The following references were checked and confirmed as real, correctly attributed publications with accurate bibliographic details:

| Reference | Status |
|-----------|--------|
| Alexander, R. (2008). *Towards Dialogic Teaching*. 4th ed. Dialogos. | Verified |
| Alexander, R. (2020). *A Dialogic Teaching Companion*. Routledge. | Verified (not cited in body — see Issue 6) |
| Black, P. & Wiliam, D. (1998). "Inside the Black Box." *Phi Delta Kappan*, 80(2), 139-148. | Verified |
| Black, P. & Wiliam, D. (2009). "Developing the Theory of Formative Assessment." *Educational Assessment, Evaluation and Accountability*, 21(1), 5-31. | Verified |
| Bellwether (2025). "Productive Struggle..." | Verified (June 2025 report) |
| Freire, P. (1970). *Pedagogy of the Oppressed*. Continuum. | Verified (not cited in body — see Issue 6) |
| Haraway, D. (2016). *Staying with the Trouble*. Duke University Press. | Verified |
| Hendrick, C. (2024). "The Misunderstood Art of Scaffolding." Substack. | Verified |
| Jacobs, V.R., Lamb, L.L.C. & Philipp, R.A. (2010). "Professional Noticing..." *JRME*, 41(2), 169-202. | Verified |
| Mehan, H. (1979). *Learning Lessons*. Harvard University Press. | Verified |
| Mercer, N. & Littleton, K. (2007). *Dialogue and the Development of Children's Thinking*. Routledge. | Verified |
| Rowe, M.B. (1974). "Wait-Time and Rewards as Instructional Variables." *JRST*, 11(2), 81-94. | Verified |
| Rowe, M.B. (1986). "Wait Time: Slowing Down May Be a Way of Speeding Up!" *JTE*, 37(1), 43-50. | Verified |
| Schon, D.A. (1983). *The Reflective Practitioner*. Basic Books. | Verified |
| Sinclair, J.McH. & Coulthard, R.M. (1975). *Towards an Analysis of Discourse*. Oxford University Press. | Verified |
| Wegerif, R. (2025). "A Dialogic Theoretical Foundation for Integrating Generative AI into Pedagogical Design." *BJET*. | Verified |
| Wells, G. (1999). *Dialogic Inquiry*. Cambridge University Press. | Verified |
| Wiliam, D. (2011). *Embedded Formative Assessment*. Solution Tree Press. | Verified |
| Wood, D., Bruner, J.S. & Ross, G. (1976). "The Role of Tutoring in Problem Solving." *JCPP*, 17(2), 89-100. | Verified |
| arXiv:2506.19484 (2025). "Dialogic Pedagogy for Large Language Models." | Verified |
| arXiv:2503.01694 (2025). "Student-AI Interaction... Cluster Analysis of Engagement Profiles." | Verified (13,855 dialogue rounds confirmed) |
| arXiv:2509.21305 (2026). "Sycophancy Is Not One Thing." ICLR 2026. | Verified (exists; 48% claim misattributed — see Issue 1) |

---

## Notes on Missing Sources

The research log discusses several threads that did not surface as explicit citations in the essay body:

- **Bakhtin** — mentioned in the research log (Q1, section 3) as a theoretical foundation for dialogic teaching. Not cited in the essay. This is appropriate editorial discretion; the essay routes the dialogic teaching thread through Alexander and Mercer rather than primary Bakhtin sources.
- **Vygotsky / ZPD** — the research log references ZPD-responsive scaffolding. Not cited in the essay. Again, this appears to be deliberate — the essay engages scaffolding through Wood, Bruner & Ross rather than Vygotsky directly. No gap.
- **ELEPHANT (arXiv:2505.13995)** — the source of the 48% moral-conflict finding. Missing from the essay's reference list. This is the P1 issue above, not merely a gap.
