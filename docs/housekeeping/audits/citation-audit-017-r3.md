# Citation Audit Report — R3

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Prior reports:** `docs/housekeeping/audits/citation-audit-017.md` (R1), `docs/housekeeping/audits/citation-audit-017-r2.md` (R2)
**Evidence trail:** Five lit-reviews and research log in `docs/essays/research-logs/`
**Date:** 2026-04-24
**Auditor:** citation-auditor (Sonnet 4.6)

---

## Summary

- **Total references checked:** 26 (23 in References section + 3 body-only or in-text-only references)
- **Verified clean:** 18
- **R2 corrections verified resolved:** 4 of 6 (N-A, N-D, N-E, N-F)
- **R2 corrections partially applied with residual issues:** 2 (N-B, N-C)
- **New issues introduced in R3 revision:** 2 (R3-A, R3-B)
- **Persisting from prior rounds:** 1 (Decker year — see R3-C)
- **Total issues found in R3:** 5

---

## R2 Issue Status

### Resolved from R2

**N-A — Sweller 2010 mislabeled as 2019: Resolved.**
The References section now correctly carries two distinct Sweller entries: the 1988 solo paper (Cognitive Science) and the 2019 paper with van Merriënboer and Paas (Educational Psychology Review 31, 261–292, confirmed via Springer doi: 10.1007/s10648-019-09465-5). The body citation in §3 reads "Sweller 1988, 1998, 2019," and the 1998 entry is present and correct. All three entries verified.

**N-D — Decker title corrected: Resolved (title). Year flag persists — see R3-C below.**
The References entry now reads `Decker, K. (2025). *Do I belong in tech anymore?* ky.fyi/posts/ai-burnout.` The correct post title is confirmed present. The year issue is addressed separately as R3-C.

**N-E — Xiao seventh author (Matsumoto) added: Resolved.**
The References entry now lists all seven authors: `Xiao, T., Hata, H., Treude, C., Baltes, S., Kula, R. G., Ishio, T., & Matsumoto, K.` Web verification confirms the full author list (Xiao, Baltes, Hata, Treude, Kula, Ishio, Matsumoto per Springer and arXiv 2305.16591). All seven are present. Author order in the essay differs from the published order (published: Xiao, Baltes, Hata, Treude, Kula, Ishio, Matsumoto; essay: Xiao, Hata, Treude, Baltes, Kula, Ishio, Matsumoto) but this is a minor formatting matter, not a factual error, and all authors are accounted for.

**N-F — Brown C4 access date added: Resolved.**
The References entry now reads `Brown, S. *The C4 model for visualising software architecture*. c4model.com (accessed 2026-04-27).` The access date resolves the R2 N-F complaint that the entry was undatable for verification purposes.

---

### Partially resolved from R2

**N-B — Rukmono: Pex added but Chaudron still absent, author order non-canonical. Partially resolved.**
The R2 recommendation was to add Floris Pex as the fourth author. The entry now reads `Rukmono, S. A., Zamfirov, F., Pex, F., & Ochoa, L. (2024).` Floris Pex has been added. However, Michel R. V. Chaudron — the senior corresponding author — remains absent, and the entry still terminates with Ochoa as the final listed author rather than Chaudron. Web verification of arXiv 2503.08628 and the EMSE publication (doi: 10.1007/s10664-025-10782-3) confirms five authors in published order: Satrio A. Rukmono, Filip Zamfirov, Lina Ochoa, Floris Pex, Michel R. V. Chaudron. The essay's order (Zamfirov, Pex, Ochoa) diverges from the published order (Zamfirov, Ochoa, Pex), and Chaudron is absent entirely. See P2-A below.

**N-C — Srinivasaprasad placeholder title resolved but co-authors replaced with fabricated names. Partially resolved — new P1 introduced.**
The References entry now carries the correct title ("How AI chatbot response style affects cognitive load and performance in educational tasks") and the DOI. However, the author field has been changed from the R2 placeholder `et al.` to three named authors: `Srinivasaprasad, A., Chowdhury, S., & Garg, A.` Web verification confirms the actual co-authors are Kamelia Sepanloo, Saba Naderian Jahromi, Denny Yu, and Vincent G. Duffy. "Chowdhury, S." and "Garg, A." do not appear in the published paper and are fabricated names. See P1-A below.

---

## Issues

### P1 — Must Fix

---

**Issue P1-A: Srinivasaprasad et al. (2025) — co-authors "Chowdhury, S." and "Garg, A." are fabricated**

- **Label:** New in R3 (introduced during N-C correction)
- **Location:** References section (line 176)
- **Claim:** The References entry reads: `Srinivasaprasad, A., Chowdhury, S., & Garg, A. (2025). How AI chatbot response style affects cognitive load and performance in educational tasks. *Proceedings of HCI International 2025*. https://doi.org/10.1007/978-3-032-13012-9_14`
- **Finding:** Web verification of the DOI (Springer Nature link confirmed) and the HCII 2025 conference program identifies the full author list as: Ashwini Srinivasaprasad, Kamelia Sepanloo, Saba Naderian Jahromi, Denny Yu, and Vincent G. Duffy. Neither "Chowdhury, S." nor "Garg, A." appear in the paper or the proceedings record. These are fabricated names, introduced when the R2 `et al.` placeholder was resolved by populating incorrect co-authors. The venue description also requires correction: the proceedings are HCI International 2025 – Late Breaking Papers, Lecture Notes in Computer Science vol. 16339, Springer, 2026 (not "Proceedings of HCI International 2025" generically, and the publication year is 2026).
- **Recommendation:** Replace the entry with: `Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. (2025). How AI chatbot response style affects cognitive load and performance in educational tasks. In *HCI International 2025 – Late Breaking Papers* (Lecture Notes in Computer Science, vol. 16339). Springer. https://doi.org/10.1007/978-3-032-13012-9_14`

---

**Issue P1-B: Aghajani et al. (2019) — "Marcus, A." is a fabricated author; "Linares-Vásquez, M." has been dropped**

- **Label:** New in R3 (introduced during R2 P2-C correction)
- **Location:** References section (line 128)
- **Claim:** The References entry reads: `Aghajani, E., Nagy, C., Vega-Márquez, O. L., Moreno, L., Bavota, G., Lanza, M., & Marcus, A. (2019). Software documentation issues unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE)*.`
- **Finding:** Web verification against the ACM Digital Library (doi: 10.1109/ICSE.2019.00122), the ICSE 2019 conference page, and dblp confirms the full published author list as: Emad Aghajani, Csaba Nagy, Olga Lucero Vega-Márquez, Mario Linares-Vásquez, Laura Moreno, Gabriele Bavota, and Michele Lanza — seven authors. "Marcus, A." does not appear in the paper and is a fabricated name, likely confused with Andrian Marcus, a different researcher in the same general field. "Linares-Vásquez, M." (Mario Linares-Vásquez, fourth author in the published list) has been dropped from the entry. The R2 audit's P2-C recommendation listed "Linares-Vásquez, M." as the fourth author; that recommendation was not followed, and an incorrect name was substituted in the seventh position instead.
- **Recommendation:** Replace the entry with: `Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G., & Lanza, M. (2019). Software documentation issues unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE 2019)* (pp. 1199–1210). doi: 10.1109/ICSE.2019.00122`

---

### P2 — Should Fix

---

**Issue P2-A: Rukmono et al. (2024) — Chaudron absent; author order non-canonical**

- **Label:** Persists from R2 N-B (partial resolution)
- **Location:** References section (line 170)
- **Claim:** The References entry reads: `Rukmono, S. A., Zamfirov, F., Pex, F., & Ochoa, L. (2024). An explanation of software architecture explanations. *arXiv*.`
- **Finding:** Web verification of arXiv 2503.08628 and the published EMSE version (doi: 10.1007/s10664-025-10782-3) confirms five authors in published order: Satrio A. Rukmono, Filip Zamfirov, Lina Ochoa, Floris Pex, Michel R. V. Chaudron. The entry omits Chaudron entirely (the fifth and senior corresponding author). The order of the middle three authors also diverges from the published order: the essay lists (Zamfirov, Pex, Ochoa) whereas the published order is (Zamfirov, Ochoa, Pex). The venue is also imprecise: the paper has been published in EMSE (doi: 10.1007/s10664-025-10782-3) and should not be cited as "*arXiv*" alone.
- **Recommendation:** Replace the entry with: `Rukmono, S. A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M. R. V. (2024). An explanation of software architecture explanations. *Empirical Software Engineering*. arXiv:2503.08628. doi: 10.1007/s10664-025-10782-3`

---

### P3 — Consider

---

**Issue R3-C: Decker (2025) — year is likely incorrect; post appears to have been published in 2026**

- **Label:** Persists from R2 N-D (title corrected; year not resolved)
- **Location:** References section (line 140); body section 1
- **Claim:** The entry reads `Decker, K. (2025). *Do I belong in tech anymore?* ky.fyi/posts/ai-burnout.`
- **Finding:** Web search (conducted 2026-04-24) returns the post at ky.fyi/posts/ai-burnout as published "3 days ago," placing the publication date at approximately 2026-04-21. This is consistent with the essay's own date (2026-04-27) citing a post that was recent at time of writing. If the post was published in late April 2026, the citation year of "2025" is incorrect. The R2 audit flagged this as a known open question ("If the post was published in 2025, the current year is correct; if published in 2026, the year must be corrected"). The publication-date evidence from the current search resolves the question: the year should be 2026.
- **Recommendation:** Update the References entry to: `Decker, K. (2026). *Do I belong in tech anymore?* https://ky.fyi/posts/ai-burnout` (adding the full URL for reproducibility; the domain-only form `ky.fyi/posts/ai-burnout` is technically sufficient but the https:// prefix is standard for web citations).

---

## Content Revision Check (§4.5 and abstract)

The essay's §4.5 and abstract were revised to refine the no-net-add constraint into an asymmetric formulation: minimize human reading load even if agent-facing context grows. No new citations were introduced by this revision. The affected passages draw on previously cited sources (Ernst & Robillard 2023 for the prior-familiarity empirical anchor; IFT/Pirolli & Card 1999 for the schema-building rationale; companion-file pattern from §4.1). No citation-level issues arise from the content revision.

---

## Verified Claims — No Issues

The following references and factual claims were verified against the evidence trail and external sources and require no correction in R3:

| Reference | Verified claim | Source |
|---|---|---|
| Sweller (1988) | Cognitive load during problem solving, *Cognitive Science* 12(2), 257–285 | Confirmed |
| Sweller, van Merriënboer & Paas (1998) | Cognitive architecture and instructional design, EPR 10(3), 251–296 | Confirmed via Springer |
| Sweller, van Merriënboer & Paas (2019) | 20 years later retrospective, EPR 31, 261–292 | Confirmed via Springer doi: 10.1007/s10648-019-09465-5 |
| Pirolli & Card (1999) | Information foraging, *Psychological Review* 106(4), 643–675 | Confirmed |
| Kalyuga et al. (2003) | Expertise reversal effect, *Educational Psychologist* 38(1), 23–31 | Confirmed |
| Larkin & Simon (1987) | Diagram vs sentential, *Cognitive Science* 11(1), 65–100 | Confirmed |
| Clark & Paivio (1991) | Dual coding theory, *Educational Psychology Review* 3(3), 149–210 | Confirmed |
| Mayer (2001) | Multimedia learning, Cambridge University Press | Confirmed |
| Heijstek et al. (2011) | ESEM 2011, pp. 167–176; text ≥ diagrams finding | Confirmed |
| Ernst & Robillard (2023) | n=65; format not significant predictor; prior familiarity dominant; EMSE | Confirmed; arXiv 2305.17286 |
| Tan, Wagner & Treude (2024) | 3,000+ repo sample; outdated references pervasive; EMSE | Confirmed |
| Hata et al. (2019) | ~10% of source code comment links dead, ICSE | Confirmed |
| Xiao et al. (2023) body claim | 70% of distinct links in commit messages decay | Confirmed; all 7 authors now present |
| Coble & Karlin (2023) | DHQ 2007–2019, DOI 99.1% resolution; *Digital Humanities Quarterly* | Confirmed |
| Rosenbaum (2021) | Continuous documentation, InfoQ/Swimm | Confirmed |
| Martin (2002) | Stable Dependencies Principle, Prentice Hall | Confirmed |
| Berners-Lee (1998) | Cool URIs don't change, W3C | Confirmed |
| Sauermann & Cyganiak (2008) | Cool URIs for the Semantic Web, W3C | Confirmed |
| Sperber & Wilson (1986) | Relevance: communication and cognition, Blackwell | Confirmed |
| Howard (2024) | llms.txt, llmstxt.org | Confirmed |
| Morkes & Nielsen (1997) | Concise, scannable, objective; SunSoft attribution | Confirmed |
| Cowan (2001) | Magical number 4, *Behavioral and Brain Sciences* 24(1), 87–114 | Confirmed (page convention noted in R1 P2-B, remains defensible) |
| Nielsen (2006) | F-pattern; broader NN/g eyetracking program | Confirmed; reframing applied in R2 holds |
| Decker (2025/2026) | Post exists; correct title; URL resolves | Confirmed; year correction flagged as R3-C |
| Brown C4 | c4model.com; access date 2026-04-27 | Confirmed; access date resolves N-F |
| CMU SEI "40% miscommunications" claim | Correctly absent from essay | Confirmed; §4.4 correctly drops and explains the omission |

---

## Internal Evidence-Trail Consistency

The essay remains internally consistent with all five lit-reviews on substantive findings. The two P1 errors (fabricated Srinivasaprasad co-authors; fabricated Aghajani "Marcus, A." / dropped Linares-Vásquez) are bibliographic errors introduced during the R2 revision process and do not affect the accuracy of any claim in the essay body. The body-text assertions for both papers — Srinivasaprasad's finding that unstructured chatbot responses elevate physiological arousal and perceived effort, and Aghajani's finding that up-to-dateness failures account for roughly one in four documentation content issues — are substantively correct and supported by the actual papers.

The pattern across R1, R2, and R3 is that each revision cycle has introduced new author-list errors while correcting other errors, suggesting that author-list population is being done without direct consultation of primary sources. The three remaining author-list issues (P1-A, P1-B, P2-A) all follow this pattern. Direct verification against the primary source record for each paper is the recommended process for the next revision.
