# Citation Audit Report

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md`
**Date:** 2026-05-11

**Note:** This audit was produced via the `rdd:citation-auditor` specialist subagent dispatched as part of Cycle 018 Step 4a. The subagent returned its output as an inline response rather than writing the file directly; the orchestrator wrote the content to this path after the fact. The audit content is verbatim from the subagent's response.

---

## Summary

- **Total references checked:** 27 (all 27 entries in the References section, plus their in-text appearances)
- **Verified:** 24
- **Unverified / not independently checked:** 2 (Tsui et al. 2025; Ernst & Robillard 2023 — both self-flagged in the document)
- **Issues found:** 12

---

## Issues

### P1 — Must Fix

**Issue 1.1 — Nakayama et al. (2004): wrong year, wrong authors, wrong journal**

- **Location:** References section; body §3 ("Nakayama et al. (2004)"); §6
- **Finding:** PMC1115625 resolves to a 2004 article in *BMJ*, but the actual authors of that article are **Michael Docherty and Richard Smith** — not Nakayama. The "prevent polemic" argument quoted in the essay comes from Docherty & Smith. Nakayama et al. 2005 is a descriptive study of abstract-format adoption (a different paper).
- **Recommendation:** Split into two correctly attributed entries. The "prevent polemic" quote belongs to Docherty & Smith (1999/2004), not Nakayama et al.

**Issue 1.2 — Ripple et al. (2005): wrong first author, wrong paper**

- **Location:** References section; body §3
- **Finding:** PMC1082941 is the 2005 JMLA paper, but its first author is Takeo Nakayama, not Ripple. The "better content, readability, recall and retrieval" quote does not appear in that paper. The language appears in Hartley, J. (2004). Current findings from research on structured abstracts. *Journal of the Medical Library Association*, 92(3), 368–371 — which is not in the References section at all.
- **Recommendation:** Correct the reference entry. If the quality-improvement claim is load-bearing, cite Hartley (2004) JMLA 92(3):368–371 (PMC442180), which is the actual source.

**Issue 1.3 — ELEPHANT author initials incorrect**

- **Location:** References section; body §1 and §6
- **Finding:** The second author is Sunny Yu (initial S., not T.); the third author is Cinoo Lee (initial C., not J.).
- **Recommendation:** Correct to: Cheng, M., Yu, S., Lee, C., Khadpe, P., Ibrahim, L., & Jurafsky, D.

**Issue 1.4 — Cheng et al. Science (2025/2026): year discrepancy and author-list truncation**

- **Location:** References section; body §1 and body §6
- **Finding:** The Science publication date is March/April 2026, not 2025. The arXiv preprint (arXiv:2510.01395) was submitted October 1, 2025, but the journal publication year is 2026. The second author "Lee, J." should be "Lee, C." (Cinoo Lee). The author order "Cheng, M., Lee, J., Khadpe, P." skips Sunny Yu.
- **Recommendation:** Correct to: Cheng, M., Lee, C., Khadpe, P., et al. (2026). Update all in-text citations from "(Cheng et al. 2025)" to "(Cheng et al. 2026)" where this Science paper is intended.

---

### P2 — Should Fix

**Issue 2.1 — ELEPHANT 86% figure framing**

- **Location:** Body §1
- **Finding:** The 86% figure is confirmed in ELEPHANT but comes from a specific sub-dataset (r/Advice, assumption-laden statements). The paper's primary headline statistics are "45 percentage points more face-preserving than humans" and "48% of cases affirm both sides of moral conflicts." The essay foregrounds a sub-result as the headline claim.
- **Recommendation:** Qualify: "ELEPHANT (Cheng et al. 2025) finds that models fail to challenge potentially ungrounded assumptions in 86% of cases on an advice-question sub-dataset, and preserve users' face 45 percentage points more than humans overall."

**Issue 2.2 — Nakayama "prevent polemic" quote misattribution (cascades from P1.1)**

- **Location:** Body §3
- **Finding:** The "prevent polemic" framing is from Docherty & Smith (PMC1115625), not from Nakayama et al. The exact phrase "prevent polemic by separating each analytical function" appears to be a paraphrase synthesis, not a direct quote.
- **Recommendation:** Change to paraphrase with correct attribution. Remove quotation marks unless the exact phrasing is verified verbatim.

**Issue 2.3 — Gorman (2026b) reference is underspecified and URL is missing**

- **Location:** References section; body §1
- **Finding:** The post exists at https://codemanship.wordpress.com/2026/05/08/cress-principles-for-context-engineering-e-is-for-empirical/ (dated May 8, 2026). The reference entry omits the URL and the specific date.
- **Recommendation:** Add URL and date.

**Issue 2.4 — Dolezal et al.: middle initial of third author is wrong**

- **Location:** References section
- **Finding:** The paper arXiv:2604.26965 lists the third author as Mark Graham (initial M., not J.).
- **Recommendation:** Correct to: Dolezal, J., Alam, S., Graham, M., & Bohacek, M.

**Issue 2.5 — Dolezal et al. 107% figure missing from essay body**

- **Location:** Body §1
- **Finding:** The paper reports 33% higher semantic similarity AND 107% higher positive sentiment. The essay cites only the 33% figure.
- **Recommendation:** Consider adding the positive-sentiment figure for completeness.

**Issue 2.6 — Cheong et al.: venue description imprecise**

- **Location:** References section; body §1
- **Finding:** The paper (arXiv:2507.01418) was presented at the CHIWORK 2025 Workshop on Generative AI Disclosure, Ownership, and Accountability in Co-Creative Domains — a workshop, not the main CHIWORK symposium.
- **Recommendation:** Qualify the venue.

**Issue 2.7 — Rahimi et al. (2026): may not be first author**

- **Location:** References section; body §3
- **Finding:** arXiv:2604.24658 is confirmed to exist with the correct title and figures. However, "Rahimi" does not appear in the retrieved author list. (See outline audit P1.1 — first author is Jiachen Liu.)
- **Recommendation:** Correct to Liu et al. (2026) and update all in-text citations.

---

### P3 — Consider

**Issue 3.1 — Gallegos et al.:** No change required. Confirmed clean.

**Issue 3.2 — Chambers et al.:** Two-author paper; "et al." not appropriate. Correct to: Chambers, C. D., & Tzavella, L. (2022).

**Issue 3.3 — Dunleavy (2014) URL:** Update URL to: https://blogs.lse.ac.uk/impactofsocialsciences/2014/10/31/storyboarding-research-dunleavy/

**Issue 3.4 — Ernst & Robillard (2023):** Non-standard placeholder citation format. Locate full title, venue, and year or replace with "cited in [source]" notation.

**Issue 3.5 — Tsui et al. (2025):** Self-flagged as unverified. The outline citation audit verified: paper is arXiv:2507.02778, sole author Ken Tsui. Correct to "Tsui (2025)" — not "et al."

**Issue 3.6 — Agarwal et al. (2025) 90.6%→83.5% figures:** Plausible given study design and direction confirmed by secondary sources. Verify against primary paper if possible.

**Issue 3.7 — Gorman (2026a):** No change required. Confirmed clean.

**Issue 3.8 — Kim et al. (2025) orphan reference:** Add in-text citation OR remove from References.

**Issue 3.9 — Higgins et al. (2022) orphan reference:** Consolidate with the Cochrane Collaboration (2022) entry.

---

## Citation Pattern Observations

- Bias toward recent material is appropriate given the cycle's focus.
- Orphan references: Kim et al. and Higgins et al. (References entries without body cites).
- Self-flagging practice is sound (Kalyuga et al. 2003, Tsui et al. 2025, Ernst & Robillard 2023 marked as needing verification).
- The Rahimi → Liu first-author error (P2.7 here / P1.1 in outline) is the most consequential unresolved verification; the outline audit confirmed Jiachen Liu as the first author.
