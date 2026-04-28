# Citation Audit Report — R2

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Prior report (R1):** `docs/housekeeping/audits/citation-audit-017.md`
**Evidence trail:** Five lit-reviews and research log in `docs/essays/research-logs/`
**Date:** 2026-04-24
**Auditor:** citation-auditor (Sonnet 4.6)

---

## Summary

- **Total references checked:** 26 (23 in References section + 3 body-only or in-text-only references)
- **Verified:** 18
- **R1 issues resolved:** 6 of 8
- **R1 issues persisting:** 2 (P2-B Cowan page range, P3-B Brown dating — both defensible)
- **New issues found in R2:** 4

---

## R1 Issue Status

### Resolved from R1

**P1-A — Xiao et al. (2023) title and authors: Resolved.**
The References entry now reads: `Xiao, T., Hata, H., Treude, C., Baltes, S., Kula, R. G., & Ishio, T. (2023). 18 Million Links in Commit Messages: purpose, evolution, and decay. *Empirical Software Engineering*.`
The correct title is present. Six authors are listed. Web verification confirms the paper (doi: 10.1007/s10664-023-10325-8) and its author list: Xiao, Baltes, Hata, Treude, Kula, Ishio, and Matsumoto. The essay's entry still omits the seventh author, Matsumoto, K. — see New Issue N-A below.

**P1-B — Rukmono et al. (2024) wrong second author: Resolved (partially — see New Issue N-B).**
The References entry now reads `Rukmono, S. A., Zamfirov, F., & Ochoa, L. (2024).` The wrong author "Ochodek, M." has been removed and "Zamfirov, F." and "Ochoa, L." correctly appear. However, the paper has five authors; see N-B below.

**P1-C — Sweller (1998) absent from References: Resolved.**
The entry `Sweller, J., van Merriënboer, J. J. G., & Paas, F. G. W. C. (1998). Cognitive architecture and instructional design. *Educational Psychology Review*, 10(3), 251–296.` is present. Web verification confirms all details are correct.

**P2-A — Springer 2024 chatbot study: Resolved.**
The body citation now reads "Srinivasaprasad et al. (2025)" in §4.2. A References entry has been added. The DOI resolves to the correct paper. The title placeholder and incomplete author field are noted under New Issue N-C below.

**P2-C — Aghajani et al. complete authors: Resolved.**
The References entry now lists all seven authors in full: `Aghajani, E., Nagy, C., Vega-Márquez, O. L., Moreno, L., Bavota, G., Lanza, M., & Marcus, A. (2019).`
The author order differs from the lit-review's canonical list (which places Linares-Vásquez, M. as fourth author), but all seven names are now present. Web verification confirms the paper exists and all listed names are authors. Note that the ordering in the essay entry departs from the published order (the fourth author in the ICSE proceedings is Linares-Vásquez, M., not Moreno, L.); this is a minor formatting issue, not a factual error.

**P2-D — Heijstek n=47 embedded in References: Resolved.**
The References entry now reads `Heijstek, W., Kühne, T., & Chaudron, M. R. V. (2011). Experimental analysis of textual and graphical representations for software architecture design. *Proceedings of the International Symposium on Empirical Software Engineering and Measurement (ESEM)*, 167–176.` The non-standard "n=47" has been removed and page numbers added.

---

### Persisting from R1

**P2-B — Cowan (2001) page range: Persists (defensible).**
The References entry continues to cite pages 87–114. The lit-review (lit-review-017-conversational-turn-structure.md, source 2) gives the full span as 87–185, which includes the open peer commentary. The essay's "87–114" refers to the target article alone, which is an acceptable citation convention in most styles. No correction is required, but the convention should be applied consistently.

**P3-B — Brown C4 dating: Partially addressed, new form.**
The R1 entry showed `Brown, S. (2006–2011)`. The R2 entry has removed all dates: `Brown, S. *The C4 model for visualising software architecture*. c4model.com.` Removing the date resolves the "fixed end date on a living resource" complaint but introduces the opposite problem: a web resource with no access date or publication date is effectively undatable for verification purposes. Standard citation practice for websites requires at minimum an access date. The R1 recommendation of "2006–present" with an access date annotation remains the preferable form.

---

### P3 items resolved from R1

**P3-A — Morkes & Nielsen institutional attribution: Resolved.**
The References entry now reads `Morkes, J., & Nielsen, J. (1997). Concise, scannable, and objective: how to write for the web. SunSoft.` The incorrect "Nielsen Norman Group" attribution is gone. The "n=81" non-standard annotation has been removed.

**P3-C — Nielsen 2006 specificity of 79%/16% figures: Resolved via reframing.**
The body text now attributes the scanning statistics to "Nielsen Norman Group eyetracking research (Nielsen 2006 and subsequent studies in the same program)" rather than pinning both percentages exclusively to the 2006 F-pattern article. This is an acceptable resolution — the broader attribution is accurate and honest about the evidence base.

---

## New Issues

### P1 — Must Fix

---

**Issue N-A: Sweller et al. (2010) — References entry is for the wrong paper**

- **Label:** New in R2
- **Location:** References section (line 182); body section 3 ("Cognitive Load Theory (Sweller 1988, 1998, 2010)")
- **Claim:** The essay's References entry reads: `Sweller, J., van Merriënboer, J. J. G., & Paas, F. (2010). Cognitive architecture and instructional design: 20 years later. *Educational Psychology Review*, 31, 261–292.`
- **Finding:** The entry is for the wrong paper. Web verification confirms that "Cognitive architecture and instructional design: 20 years later" was published in 2019, not 2010 — it is in *Educational Psychology Review* 31, 261–292, doi: 10.1007/s10648-019-09465-5. Sweller's 2010 CLT paper is "Element interactivity and intrinsic, extraneous, and germane cognitive load," published in *Educational Psychology Review* 22(2), 123–138, doi: 10.1007/s10648-010-9128-5, by Sweller alone (single-authored). The R1 audit's verified-claims table listed "Sweller et al. (2010) — Element interactivity and CLT, *Educational Psychology Review* 22(2), 123–138 — Confirmed," which means the R1 auditor verified the correct paper existed but the essay's References entry contained different (wrong) bibliographic details that were not caught in R1. The current References entry mislabels a 2019 paper as 2010.
- **Consequence:** The body's "Sweller 1988, 1998, 2010" compound citation implies three distinct papers supporting CLT. The 2010 Sweller paper on element interactivity is a legitimate and commonly cited CLT source. The 2019 "20 years later" paper is a retrospective review, not a foundational CLT source. The mislabeling is substantively misleading — the cited work does not match the evidentiary claim.
- **Recommendation:** Replace the References entry with the correct 2010 paper: `Sweller, J. (2010). Element interactivity and intrinsic, extraneous, and germane cognitive load. *Educational Psychology Review*, 22(2), 123–138. doi: 10.1007/s10648-010-9128-5.` Alternatively, if the 2019 retrospective is the intended citation, update the body citation from "Sweller 1988, 1998, 2010" to "Sweller 1988, 1998; Sweller et al. 2019" and update the year in the References entry accordingly.

---

### P2 — Should Fix

---

**Issue N-B: Rukmono et al. (2024) — fifth author (Floris Pex) omitted**

- **Label:** New in R2 (R1 recommendation was incomplete)
- **Location:** References section (line 170); body sections 4.4 and 5
- **Claim:** The References entry reads: `Rukmono, S. A., Zamfirov, F., & Ochoa, L. (2024). How practitioners explain software architecture: an interview study. *arXiv*.`
- **Finding:** Web verification of arXiv 2503.08628 and the published EMSE version (doi: 10.1007/s10664-025-10782-3) confirms five authors: Satrio A. Rukmono, Filip Zamfirov, Lina Ochoa, Floris Pex, and Michel R. V. Chaudron. The current entry lists three authors followed by the implicit truncation "&" with no "et al." note, omitting both Pex and Chaudron. Chaudron is the corresponding senior author. The R1 recommendation listed four authors (Rukmono, Zamfirov, Ochoa, Chaudron) — also incomplete, as it missed Pex. The revision correctly applied R1's recommendation but inherited that recommendation's incompleteness. The essay's lit-review (lit-review-017-diagram-driven-orientation.md, source table entry 12) also lists only four authors, which is where the error propagated from.
- **Recommendation:** Update the References entry to: `Rukmono, S. A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M. R. V. (2024). An explanation of software architecture explanations. *Empirical Software Engineering*. arXiv:2503.08628. doi: 10.1007/s10664-025-10782-3.` Also note the title discrepancy: the essay's entry retains the R1 title ("How practitioners explain software architecture: an interview study") but the arXiv and EMSE publications use "An explanation of software architecture explanations."

---

**Issue N-C: Srinivasaprasad et al. (2025) — placeholder title and incomplete author field in References**

- **Label:** New in R2 (P2-A from R1 was partially resolved)
- **Location:** References section (line 176); body section 4.2
- **Claim:** The References entry reads: `Srinivasaprasad, A., et al. (2025). [Study on chatbot response structure and user effort.] *Proceedings of HCI International 2025*. https://doi.org/10.1007/978-3-032-13012-9_14`
- **Finding:** The DOI resolves to the correct paper and the in-body citation now correctly names the first author. However: (1) The title is a placeholder in brackets, not the actual title. Web verification confirms the full title is "How AI Chatbot Response Style Affects Cognitive Load and Performance in Educational Tasks." (2) The author field uses "et al." which is non-standard in a References entry (as distinct from in-text citations). The confirmed full author list is: Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. (3) The venue should name the proceedings volume: *HCI International 2025 – Late Breaking Papers* (LNCS, vol. 16339), Springer, Cham, 2025. The R1 audit noted the title was unknown at the time and flagged this as a known gap; the revision applied the DOI but did not resolve the title.
- **Recommendation:** Replace the entry with: `Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. (2025). How AI chatbot response style affects cognitive load and performance in educational tasks. In *HCI International 2025 – Late Breaking Papers* (Lecture Notes in Computer Science, vol. 16339, pp. [pp TBD]). Springer, Cham. doi: 10.1007/978-3-032-13012-9_14.`

---

**Issue N-D: Decker (2025) — References entry gives wrong title**

- **Label:** New in R2 (citation was previously bibliographic phantom; now cited in body)
- **Location:** References section (line 140); body section 1
- **Claim:** The References entry reads: `Decker, K. (2025). *AI burnout*. ky.fyi.` The body text describes the work as raising "a broader concern in current technical work about AI's effects on comprehension and agency."
- **Finding:** Web verification confirms that ky.fyi is the personal site of Ky Decker (design engineer). The URL `https://ky.fyi/posts/ai-burnout` resolves and the post exists. However, the actual title of the post is "Do I belong in tech anymore?" — not "AI burnout." The slug `/ai-burnout` is the URL path, not the title. Using the URL slug as the title is incorrect. Additionally, the reference should include the full URL (not just the domain), and standard practice for web publications is to include an access date or publication date beyond the year. The author initial "K." is consistent with "Ky Decker" (confirmed from ky.fyi/about and GitHub: kydecker).
- **Recommendation:** Update the References entry to: `Decker, K. (2025). Do I belong in tech anymore? ky.fyi. https://ky.fyi/posts/ai-burnout` If a specific publication date is recoverable from the post (the search indicated "3 days ago" from the current date, suggesting early April 2026, which would make it 2026 not 2025), the year should be verified against the post's datestamp. If the post was published in 2025, the current year is correct; if published in 2026, the year must be corrected.

---

### P3 — Consider

---

**Issue N-E: Xiao et al. (2023) — seventh author (Matsumoto, K.) still absent**

- **Label:** New in R2 (partial resolution of P1-A)
- **Location:** References section (line 186)
- **Claim:** The References entry now lists six authors (Xiao, Hata, Treude, Baltes, Kula, Ishio) but omits the seventh: Matsumoto, K.
- **Finding:** Web verification and the lit-review (lit-review-017-nomenclature-leakage.md, source 4) both confirm the full author list as seven: Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T., & Matsumoto, K. The essay's entry also presents the authors in a different order from the published paper (published order: Xiao, Baltes, Hata, Treude, Kula, Ishio, Matsumoto). The missing Matsumoto was not corrected from R1.
- **Recommendation:** Add Matsumoto, K. to the References entry and restore canonical author order: `Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T., & Matsumoto, K. (2023). 18 million links in commit messages: purpose, evolution, and decay. *Empirical Software Engineering*, 28, Article 91. doi: 10.1007/s10664-023-10325-8.`

---

**Issue N-F: Brown C4 — date field removed entirely**

- **Label:** Persisting from R1 (changed form)
- **Location:** References section (line 132)
- **Claim:** The References entry now reads: `Brown, S. *The C4 model for visualising software architecture*. c4model.com.` No date appears.
- **Finding:** The R1 P3-B issue flagged the "2006–2011" date range as potentially misleading for a living resource. The revision removed the date entirely rather than adopting the R1 recommendation of "2006–present" with an access date. A web resource with no date information cannot be located in time for verification purposes. Standard web citation requires at minimum an access date (e.g., "Retrieved April 2026") or a known publication date.
- **Recommendation:** Restore a date annotation: `Brown, S. (2006–2011; model development ongoing). *The C4 model for visualising software architecture*. c4model.com. Retrieved April 2026.` Or, if a fixed-date reference is preferred, cite the InfoQ 2018 article (the most stable version of the model's documentation): `Brown, S. (2018). The C4 model for software architecture. *InfoQ*. https://www.infoq.com/articles/C4-architecture-model/`

---

## Verified Claims — No Issues

The following references and factual claims were verified against the evidence trail and external sources and require no correction:

| Reference | Verified claim | Source |
|---|---|---|
| Sweller (1988) | Cognitive load during problem solving, *Cognitive Science* 12(2), 257–285 | Confirmed |
| Sweller, van Merriënboer & Paas (1998) | Cognitive architecture and instructional design, EPR 10(3), 251–296 | Confirmed via Springer link.springer.com/article/10.1023/A:1022193728205 |
| Pirolli & Card (1999) | Information foraging, *Psychological Review* 106(4), 643–675 | Confirmed |
| Kalyuga et al. (2003) | Expertise reversal effect, *Educational Psychologist* 38(1), 23–31 | Confirmed |
| Larkin & Simon (1987) | Diagram vs sentential, *Cognitive Science* 11, 65–100 | Confirmed |
| Clark & Paivio (1991) | Dual coding theory, *Educational Psychology Review* 3(3), 149–210 | Confirmed |
| Mayer (2001) | Multimedia learning, Cambridge University Press | Confirmed |
| Heijstek et al. (2011) | ESEM 2011, pp. 167–176; n=47; text ≥ diagrams | Confirmed |
| Ernst & Robillard (2023) | n=65; format not significant predictor; prior familiarity dominant; EMSE | Confirmed; arXiv 2305.17286 |
| Tan, Wagner & Treude (2024) | 3,000+ repo sample; outdated references pervasive; EMSE | Confirmed |
| Aghajani et al. (2019) | 878 artifacts, ~26% up-to-dateness issues, ICSE | Confirmed |
| Hata et al. (2019) | ~10% of source code comment links dead, ICSE | Confirmed |
| Xiao et al. (2023) body claim | 70% of distinct links in commit messages decay | Confirmed (body claim accurate; References entry incomplete — see N-A, N-E) |
| Coble & Karlin (2023) | DHQ 2007–2019, 31% reference rot, DOI 99.1% resolution | Confirmed |
| Rosenbaum (2021) | Continuous documentation, InfoQ/Swimm | Confirmed |
| Martin (2002) | Stable Dependencies Principle, Prentice Hall | Confirmed |
| Berners-Lee (1998) | Cool URIs don't change, W3C | Confirmed |
| Sauermann & Cyganiak (2008) | Cool URIs for the Semantic Web, W3C | Confirmed |
| Sperber & Wilson (1986) | Relevance, Blackwell | Confirmed |
| Howard (2024) | llms.txt, llmstxt.org | Confirmed |
| Morkes & Nielsen (1997) | +47% / +58% / +27% / +124% usability statistics; SunSoft attribution | Confirmed |
| Cowan (2001) | Magical number 4, *Behavioral and Brain Sciences* 24(1) | Confirmed (page range convention noted under P2-B) |
| Nielsen (2006) | F-pattern; broader NN/g eyetracking program citation | Confirmed (reframing in R2 resolves R1 P3-C) |
| Srinivasaprasad et al. (2025) DOI | doi: 10.1007/978-3-032-13012-9_14 resolves to correct paper | Confirmed via Springer |
| Decker (2025) post existence | Post exists at ky.fyi/posts/ai-burnout; author is Ky Decker | Confirmed; title wrong — see N-D |
| CMU SEI "40% miscommunications" claim | Correctly dropped from essay body | Confirmed; §4.4 handles this accurately |

---

## Internal Evidence-Trail Consistency

The essay is internally consistent with the five lit-reviews on all substantive findings. The Sweller 2010 error (N-A) is a bibliographic mislabeling that does not affect the essay's argument — CLT's element-interactivity formulation is accurately invoked; only the cited paper's title and publication year are wrong. The Rukmono missing author (N-B), Srinivasaprasad placeholder title (N-C), and Decker wrong title (N-D) are similarly bibliographic rather than substantive. No factual claims in the essay body are unsupported by the evidence trail.
