# Citation Audit Report

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Evidence trail:** Five lit-reviews and full research log in `docs/essays/research-logs/`
**Date:** 2026-04-24
**Auditor:** citation-auditor (Sonnet 4.6)

---

## Summary

- **Total references checked:** 24 (22 in References section + 2 body-only citations)
- **Verified:** 20
- **Issues found:** 8

---

## Issues

### P1 — Must Fix

---

**Issue P1-A: Xiao et al. (2023) — Reference entry misidentifies the paper**

- **Location:** References section (line 164); also body section 4.3 ("Xiao et al. (2023) found seventy percent of distinct links in commit messages decay")
- **Claim:** The References entry reads: `Xiao, T., Treude, C., Hata, H., & Matsumoto, K. (2023). 9.6M links in source code comments: purpose, evolution, decay. *Empirical Software Engineering*.`
- **Finding:** Two errors in a single entry.
  1. **Wrong title / wrong paper.** The Xiao et al. (2023) paper is titled "18 Million Links in Commit Messages: Purpose, Evolution, and Decay" (EMSE 28, Art. 91, doi: 10.1007/s10664-023-10325-8). The title "9.6M links in source code comments" belongs to the Hata et al. (2019) ICSE paper — a different work by a different lead author already correctly cited elsewhere in the References section.
  2. **Incomplete author list.** The full author list is Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T., & Matsumoto, K. — seven authors. The entry omits Baltes, Kula, and Ishio. The lit-review (lit-review-017-nomenclature-leakage.md, Source 4) gives the correct full list.
- **Recommendation:** Replace the References entry with: `Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T., & Matsumoto, K. (2023). 18 million links in commit messages: purpose, evolution, and decay. *Empirical Software Engineering*, 28, Article 91. doi: 10.1007/s10664-023-10325-8.`

---

**Issue P1-B: Rukmono et al. (2024) — Wrong author in References entry**

- **Location:** References section (line 152); body sections 4.4 and 5
- **Claim:** `Rukmono, S. A., Ochodek, M., & Chaudron, M. R. V. (2024). How practitioners explain software architecture: an interview study. *arXiv*.`
- **Finding:** The second author "Ochodek, M." does not appear in the paper. Web verification and both lit-reviews that cite this work (lit-review-017-diagram-driven-orientation.md source table; lit-review-017-document-legibility.md source table, entry 16) consistently give the authors as Rukmono, S. A., Zamfirov, F., Ochoa, L., & Chaudron, M. R. V. The arXiv preprint is 2503.08628v1. The journal version is confirmed published in EMSE (DOI: 10.1007/s10664-025-10782-3). The title in the lit-reviews is "An explanation of software architecture explanations" (also cited as "From expert to novice" in one lit-review's source table — the paper has two related versions; the arXiv 2503.08628 version is the confirmed primary).
- **Recommendation:** Replace the References entry with: `Rukmono, S. A., Zamfirov, F., Ochoa, L., & Chaudron, M. R. V. (2024). An explanation of software architecture explanations. *Empirical Software Engineering*. arXiv preprint 2503.08628. doi: 10.1007/s10664-025-10782-3.`

---

**Issue P1-C: Sweller (1998) cited in body but absent from References**

- **Location:** Body section 3, first paragraph: "Cognitive Load Theory (Sweller 1988, 1998, 2010)"
- **Claim:** The essay attributes the intrinsic/extraneous/germane load taxonomy to "Sweller 1988, 1998, 2010" as a compound citation.
- **Finding:** The 1998 paper — Sweller, J., van Merriënboer, J. J. G., & Paas, F. G. W. C. (1998). Cognitive architecture and instructional design. *Educational Psychology Review*, 10(3), 251–296 — appears in the References lists of both the Q2 and Q5 lit-reviews and is the primary source for the three-load taxonomy. It is not listed in the essay's References section. The essay cites two Sweller entries (1988 and 2010) but not the 1998 paper, despite the body text explicitly naming all three years.
- **Recommendation:** Add the 1998 entry to the References section: `Sweller, J., van Merriënboer, J. J. G., & Paas, F. (1998). Cognitive architecture and instructional design. *Educational Psychology Review*, 10(3), 251–296.` (The essay's 2010 entry already includes "Sweller, J., van Merriënboer, J. J. G., & Paas, F." as co-authors, which establishes the correct attribution convention.)

---

### P2 — Should Fix

---

**Issue P2-A: Springer 2024 chatbot study — year and identification imprecise**

- **Location:** Body section 4.2: "The Springer 2024 chatbot study finds unstructured responses elevate physiological arousal and perceived effort."
- **Claim:** The essay attributes findings to a "Springer 2024 chatbot study" without author identification in either the body or the References section. No entry for this study appears in the References.
- **Finding:** Web verification locates the study: Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. "How AI chatbot response style affects cognitive load and performance in educational tasks." In *HCI International 2025 – Late Breaking Papers* (HCII 2025), Lecture Notes in Computer Science, vol. 16339. Springer, Cham. doi: 10.1007/978-3-032-13012-9_14. The proceedings title indicates an HCII 2025 publication (not 2024), though the submission and review process may have occurred in 2024. The findings cited — physiological arousal and perceived effort elevated by unstructured responses — are confirmed as matching the abstract. The lit-review (lit-review-017-conversational-turn-structure.md, entry 20) also notes the citation incompleteness: "ISBN not recoverable from search" and lists it as anonymous. The body's citation style ("Springer 2024 chatbot study") is colloquial and unreproducible.
- **Recommendation:** Add a named, complete References entry and update the body citation to author-year format. Suggested entry: `Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. (2025). How AI chatbot response style affects cognitive load and performance in educational tasks. In *HCI International 2025 – Late Breaking Papers* (LNCS, vol. 16339). Springer. doi: 10.1007/978-3-032-13012-9_14.` Update body citation to "(Srinivasaprasad et al., 2025)." If "2024" is retained as the year, note the discrepancy between submission year and publication year.

---

**Issue P2-B: Cowan (2001) — page range inconsistency between essay and lit-review**

- **Location:** References section (line 120): `Cowan, N. (2001). The magical number 4 in short-term memory. *Behavioral and Brain Sciences*, 24(1), 87–114.`
- **Claim:** Essay gives pages 87–114.
- **Finding:** The Behavioral and Brain Sciences format includes the target article (87–114) followed by peer commentary and open peer discussion, extending to page 185. Multiple citation databases render the full span as 87–185, and the lit-review on turn structure (lit-review-017-conversational-turn-structure.md, source 2) cites it as "24, 87–185." The essay's "87–114" refers correctly to the target article alone, which is acceptable and arguably more precise; "87–185" is also defensible as the full journal issue run. This is a minor inconsistency between the essay and the lit-review it draws from, not an error per se.
- **Recommendation:** Standardize to either form and note the convention. If the essay intends to cite only the target article (not the commentary), "87–114" is correct and preferred. The current entry is defensible; consider adding a note that the commentary extends to 185 if the broader working-memory-limit literature (including respondents) is being invoked.

---

**Issue P2-C: Aghajani et al. (2019) — body claims "25%" but source supports ~26%; References entry incomplete**

- **Location:** Body section 4.3: "Aghajani et al. (2019) found up-to-dateness failures account for roughly one in four documentation content issues across their cross-source study of 878 artifacts." References entry (line 110): `Aghajani, E., Nagy, C., Vega-Márquez, O. L., et al. (2019). Software documentation issues unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE)*.`
- **Claim (body):** "Roughly one in four" (~25%). The audit criteria also names "25%" as the specific claim to verify.
- **Finding (body):** The lit-review (lit-review-017-nomenclature-leakage.md, section 3.1) reports the source figure as 190 of 740 content-related artifacts = 25.7%. "Roughly one in four" is a fair rounding; this is not a substantive error. The audit criteria wording of "25% of doc content issues" and the essay's "roughly one in four" are consistent with the source.
- **Finding (References):** The entry uses "et al." without completing the author list. The full author list is Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G., & Lanza, M. The ICSE entry is also missing its page numbers (1199–1210) and DOI (10.1109/ICSE.2019.00122). Both are available. "et al." for a 7-author list in a References entry (not an in-text citation) is non-standard in most citation styles.
- **Recommendation:** Expand References entry: `Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G., & Lanza, M. (2019). Software documentation issues unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE 2019)* (pp. 1199–1210). doi: 10.1109/ICSE.2019.00122.`

---

**Issue P2-D: Heijstek et al. (2011) — n=47 embedded in References entry (non-standard)**

- **Location:** References section (line 128): `Heijstek, W., Kühne, T., & Chaudron, M. R. V. (2011). Experimental analysis of textual and graphical representations for software architecture design. *Proceedings of the International Symposium on Empirical Software Engineering and Measurement (ESEM)*, n=47.`
- **Claim:** The entry appends "n=47" as if it is bibliographic information.
- **Finding:** The study is confirmed to exist with n=47 participants. The finding and sample size are correctly reported in the body. However, embedding "n=47" directly in the References entry is non-standard in every citation format (APA, Chicago, IEEE). The participant count is a methodological detail that belongs in the body text where the finding is cited, not in the bibliography.
- **Recommendation:** Remove "n=47" from the References entry. Add pages (167–176) and the IEEE DOI (10.1109/METRIC.2011.6092565 or the correct ESEM DOI) as confirmed from web verification. Corrected entry: `Heijstek, W., Kühne, T., & Chaudron, M. R. V. (2011). Experimental analysis of textual and graphical representations for software architecture design. *Proceedings of ESEM 2011* (pp. 167–176). IEEE.`

---

### P3 — Consider

---

**Issue P3-A: Morkes & Nielsen (1997) — institutional attribution in References**

- **Location:** References section (line 142): `Morkes, J., & Nielsen, J. (1997). Concise, scannable, and objective: how to write for the web. Nielsen Norman Group, n=81.`
- **Finding:** The study was conducted at SunSoft usability laboratories in Menlo Park, CA — not at Nielsen Norman Group. The NN/g page hosting the article is the current location of the write-up, but NN/g was not the institutional host of the original study. The n=81 in the References entry is non-standard for the same reason as the Heijstek issue above. The ACM CHI 1998 proceedings also carry a related paper (dl.acm.org/doi/10.1145/286498.286792). The statistics (+47%, +58%, +27%, combined +124%) are verified as correct.
- **Recommendation:** Revise entry to: `Morkes, J., & Nielsen, J. (1997). Concise, SCANNABLE, and objective: how to write for the web. SunSoft usability study. https://www.nngroup.com/articles/concise-scannable-and-objective-how-to-write-for-the-web/` Remove "n=81" from the reference entry; the sample size is appropriately noted in the body.

---

**Issue P3-B: Brown (2006–2011) — date range imprecise for a living resource**

- **Location:** References section (line 114): `Brown, S. (2006–2011). *The C4 model for visualising software architecture*. c4model.com.`
- **Finding:** The C4 model website (c4model.com) is actively maintained and updated beyond 2011. The date range "2006–2011" reflects the period Simon Brown originally developed the model (per the lit-review). However, citing a living online resource with a fixed end date is potentially misleading — the current content at c4model.com reflects updates well past 2011. The lit-review notes this accurately: "Brown developed the model between 2006 and 2011." The InfoQ article version was published 2018.
- **Recommendation:** Consider updating the date convention to reflect the resource's ongoing nature, e.g.: `Brown, S. (2006–present). *The C4 model for visualising software architecture*. c4model.com. (Model development 2006–2011; site last accessed [date].)` Or cite the specific InfoQ 2018 article if a fixed-date reference is preferred.

---

**Issue P3-C: Nielsen (2006) — scan/read statistics not precisely traceable to cited source**

- **Location:** Body section 4.2: "Nielsen's F-pattern eyetracking finds 79% of readers scan and 16% read fully on first encounter of long content."
- **Finding:** The F-pattern research (Nielsen 2006, n=232) is confirmed as existing and correctly attributed. Web verification confirms n=232 and the characteristic F-shaped scanning behavior. However, the specific figures "79% scan and 16% read fully" do not appear to be from the original 2006 F-pattern article — they are cited in the NN/g legibility/readability/comprehension article (2015) and related NN/g materials, where the statistic "users read only 28% of web content on average" and "79% of users scan" are discussed. The lit-review on turn structure (section 3.2) attributes "79% scan / 16% read fully" to "Nielsen 2006" as the F-pattern article. This specific percentage breakdown may derive from a different NN/g study (the broader eyetracking research program) rather than the 2006 F-pattern article specifically. The claim is directionally well-supported but the precise attribution to the single 2006 article is unverified.
- **Recommendation:** Either verify the 79%/16% figures against the Nielsen (2006) F-pattern article directly, or adjust the citation to the broader NN/g eyetracking research body (e.g., Nielsen & Pernice 2010, *Eyetracking Web Usability*). If the figures cannot be confirmed in the 2006 article, reframe as "NN/g eyetracking research finds" with the broader citation.

---

## Verified Claims (no issues)

The following references and factual claims were verified against the evidence trail and external sources:

| Reference | Verified claim | Source |
|---|---|---|
| Sweller (1988) | Cognitive load during problem solving, *Cognitive Science* 12(2), 257–285 | Confirmed via web |
| Sweller et al. (2010) | Element interactivity and CLT, *Educational Psychology Review* 22(2), 123–138 | Confirmed via Springer |
| Pirolli & Card (1999) | Information foraging, *Psychological Review* 106(4), 643–675 | Confirmed via APA PsycNet |
| Kalyuga et al. (2003) | Expertise reversal effect, *Educational Psychologist* 38(1), 23–31 | Confirmed via Tandfonline |
| Larkin & Simon (1987) | Diagram vs sentential, *Cognitive Science* 11, 65–100 | Confirmed via Wiley |
| Clark & Paivio (1991) | Dual coding theory, *Educational Psychology Review* 3(3), 149–210 | Confirmed via Springer |
| Mayer (2001) | Multimedia learning, Cambridge University Press | Confirmed |
| Heijstek et al. (2011) | ESEM n=47, text ≥ diagrams finding, authors' conclusion quoted | Confirmed via Semantic Scholar and IEEE |
| Ernst & Robillard (2023) | n=65, format not significant predictor, prior familiarity dominant, EMSE | Confirmed via Springer and arXiv 2305.17286 |
| Tan, Wagner & Treude (2024) | 3,000+ repo sample, most contain outdated references, EMSE 29(1) Art. 5 | Confirmed via Springer |
| Aghajani et al. (2019) | 878 artifacts, 162 issue types, ~26% up-to-dateness, ICSE | Confirmed via ACM DL |
| Hata et al. (2019) | ~10% of source code comment links dead, ICSE | Confirmed |
| Xiao et al. (2023) body claim | 70% of distinct links in commit messages decay | Confirmed (paper is about commit messages, not source code comments — body text is accurate, References entry is wrong: see P1-A) |
| Coble & Karlin (2023) | DHQ 2007–2019, 31% reference rot, DOI 99.1% resolution, DHQ 17(1) | Confirmed via DHQ primary source |
| Rosenbaum (2021) | Continuous documentation, InfoQ/Swimm, three principles | Confirmed |
| Martin (2002) | Stable Dependencies Principle, Prentice Hall | Confirmed |
| Berners-Lee (1998) | Cool URIs don't change, W3C | Confirmed |
| Sauermann & Cyganiak (2008) | Cool URIs for the Semantic Web, W3C Interest Group Note | Confirmed |
| Sperber & Wilson (1986) | Relevance, Blackwell | Confirmed |
| Howard (2024) | llms.txt, llmstxt.org | Confirmed |
| Morkes & Nielsen (1997) | +47% / +58% / +27% / +124% statistics, n=81 | Confirmed correct |
| CMU SEI "40% miscommunications" claim | Unsourceable — correctly dropped from essay | Confirmed (lit-review conclusion upheld; essay section 4.4 handles this correctly) |

---

## Notes on Internal Evidence-Trail Consistency

The essay is internally consistent with the evidence trail on all substantive findings. The context-mismatch diagnosis, the four-mechanism Q4 ledger, the companion-file Q6 conclusion, the continuous-documentation Q1 lens, and the CMU SEI claim provenance correction all track correctly from the lit-reviews through the research log synthesis to the essay. No facts appear in the essay that lack support in the evidence trail.

The three P1 issues (Xiao title error, Rukmono author error, Sweller 1998 omission) are bibliographic errors that do not affect the accuracy of any substantive claim. The essay's arguments are not weakened by these corrections.
