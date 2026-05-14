# Citation Audit Report — Re-audit (R2)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md`
**Prior audit:** `/Users/nathangreen/Development/rdd/.rdd/audits/citation-audit-018-prose.md`
**Date:** 2026-05-11
**Purpose:** Verify the four P1 corrections from the prior audit landed cleanly; verify the Liu et al. correction (prior P2.7); audit the new §5 added between former §4 and former §5; flag any new issues introduced by revision.

---

## Summary

- **Total references checked:** 27 (all References entries plus in-text appearances, including new §5 citations)
- **Verified clean:** 21
- **P1 corrections from prior audit — verified resolved:** 4 of 4
- **Liu et al. correction (prior P2.7) — verified resolved:** 1 of 1
- **Issues found in this revision:** 6
  - P1: 1 (new — introduced by revision)
  - P2: 4 (2 carry-overs not fixed, 2 new issues in §5)
  - P3: 1 (carry-over)

---

## P1 Corrections — Verification Status

### Correction 1 — Nakayama → Docherty & Smith (prior P1.1 / P2.2)

**Status: RESOLVED.**

The essay now correctly attributes the "prevent polemic" argument to Docherty & Smith (1999). The reference list contains a correct entry: "Docherty, M., & Smith, R. (1999). The case for structuring the discussion of scientific papers: Much the same as that for structuring abstracts. *BMJ*, 318(7193), 1224–1225. PMC1115625." Verified against PMC1115625: authors are Michael Docherty and Richard Smith, published 1999 in BMJ vol. 318, pages 1224–1225. Nakayama et al. (2005) is separately and correctly listed for the JMLA abstract-adoption study (PMC1082941, four named authors, confirmed). The split into two correctly attributed entries was implemented.

### Correction 2 — Ripple → Hartley 2004 (prior P1.2)

**Status: RESOLVED IN REFERENCE LIST; QUOTE ACCURACY REQUIRES FLAGGING (see P2.1 below).**

"Ripple et al. (2005)" no longer appears in the text for the quality-improvement claim. Hartley (2004), JMLA 92(3):368–371, PMC442180, is now in the reference list and correctly attributed in §3. The reference entry is accurate. The outstanding concern is the exact phrase attributed to Hartley — addressed as P2.1.

### Correction 3 — ELEPHANT author initials (prior P1.3)

**Status: RESOLVED.**

The essay now reads: "Cheng, M., Yu, S., Lee, C., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT..." Verified against arXiv:2505.13995: the full author order is Myra Cheng, Sunny Yu, Cinoo Lee, Pranav Khadpe, Lujain Ibrahim, Dan Jurafsky. The corrected initials (Yu S., Lee C.) are confirmed correct.

### Correction 4 — Cheng et al. Science year and author order (prior P1.4)

**Status: RESOLVED.**

The essay now reads: "Cheng, M., Lee, C., Khadpe, P., et al. (2026). Sycophantic AI decreases prosocial intentions and promotes dependence. *Science*." Year 2026 confirmed (Science published March 26, 2026, DOI: 10.1126/science.aec8352). Author order Cheng → Lee (C.) → Khadpe confirmed against arXiv:2510.01395. The prior error of "Lee, J." is corrected.

**Note on the Science paper author order:** The arXiv preprint lists authors as Myra Cheng, Cinoo Lee, Pranav Khadpe, Sunny Yu, Dyllan Han, Dan Jurafsky. The essay's "Cheng, M., Lee, C., Khadpe, P., et al." correctly reflects this. One additional note: the ELEPHANT arXiv (2505.13995) and the Science paper (2510.01395) have *different* author orders — ELEPHANT has Yu as second author, the Science paper has Lee as second author. The essay now correctly represents both.

### Liu et al. correction (prior P2.7)

**Status: RESOLVED.**

All occurrences of "Rahimi et al." have been replaced with "Liu et al." The reference now reads: "Liu, J., Pei, J., Huang, J., et al. (2026). The last human-written paper: Agent-native research artifacts. *arXiv preprint arXiv:2604.24658*." Verified against arXiv:2604.24658: first author is Jiachen Liu (37 total authors), title matches, year 2026. Confirmed clean.

---

## Issues

### P1 — Must Fix

**Issue 1.1 — §5 mischaracterizes the prior audit's P3 count**

- **Location:** §5, paragraph 2: "The prose-form audit identified twelve total citation issues across four severity tiers — four P1 (must-fix) errors, seven P2 (should-fix) issues, and one P3 minor-count issue."
- **Claim:** The prior audit had "one P3 minor-count issue."
- **Finding:** The prior audit (`citation-audit-018-prose.md`) lists nine P3 sub-items (Issues 3.1–3.9). Two of these (3.1 and 3.7) are "No change required; confirmed clean." The remaining seven (3.2, 3.3, 3.4, 3.5, 3.6, 3.8, 3.9) are actionable issues requiring fixes. The prior audit's own summary states "Issues found: 12" — which appears to count the actionable P3 items as a single group, not individually. However, characterizing this as "one P3 minor-count issue" is materially inaccurate regardless of which counting convention is used: there are either 7 actionable P3 items (if counted individually) or a compound group of issues that the essay misrepresents as singular. The claim "one P3 minor-count issue" would mislead a reader who has not read the prior audit directly.
- **Recommendation:** Revise to accurately characterize the P3 tier. The most defensible revision: "seven P2 (should-fix) issues, and seven actionable P3 (consider) items" — or, if the prior audit's summary count of 12 is treated as canonical, note that the 12 includes both individual P1/P2 issues and a compressed P3 group. Do not represent the P3 tier as a single issue.

---

### P2 — Should Fix

**Issue 2.1 — Hartley (2004) quote accuracy: "better content, readability, recall and retrieval" not verified as verbatim**

- **Location:** §3, body: "Hartley (2004) found structured abstracts 'tend to have better content, readability, recall and retrieval' than unstructured ones"; §5, body: "a quote ('better content, readability, recall and retrieval') whose actual source is Hartley (2004)."
- **Claim:** The quoted phrase is presented with quotation marks, implying verbatim text from Hartley (2004).
- **Finding:** Direct access to PMC442180 (Hartley 2004, JMLA 92(3):368–371) confirmed the paper's conclusions support the substance of the claim — structured abstracts are easier to read, contain more information, and are possibly easier to recall — but the exact phrase "tend to have better content, readability, recall and retrieval" does not appear in the PMC full text. The paper uses different language, discussing benefits as separate findings across individual studies. The composite phrase appears to be a paraphrase or a condensation from a secondary source (possibly Ripple et al. 2005, which the outline audit confirmed does contain this phrase). Using quotation marks around a phrase that does not appear verbatim in the cited source is a quote accuracy error.
- **Recommendation:** Either (a) verify the exact phrase against the primary paper text and confirm it appears verbatim, or (b) remove the quotation marks and present as a paraphrase: Hartley (2004) found structured abstracts tend to have better content, readability, recall, and retrieval than unstructured ones. Option (b) is safer given available evidence.

**Issue 2.2 — §5 block quote is a compressed paraphrase, not a verbatim quotation**

- **Location:** §5, paragraph 3: the passage beginning "Outline form made citation auditing more efficient and more precise along several axes..." is introduced as "worth quoting at length" and presented as a direct quotation.
- **Claim:** The quoted passage is "direct testimony from an isolated auditor" and is presented with quotation marks as a verbatim extract.
- **Finding:** Comparing the essay's quoted text against the actual outline audit (`citation-audit-018-outline.md`, "Methodology Observation" section, lines 163–179): the outline audit presents its findings as a structured section with numbered bullet points under bold headers ("Gains in auditability:" / "Loss in auditability:"), culminating in a "**Net assessment:**" sentence. The essay converts this structured content into a single flowing paragraph in quotation marks, condensing four numbered gain-bullets into "Gains: [three items]." Specific discrepancies include: (a) the actual net-assessment sentence reads "The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity" — the essay renders this as "The structural gains in claim-source separation and scope-qualification visibility outweigh the quote-boundary loss" (three word differences); (b) the "Gains" list in the essay reduces four distinct enumerated points to three compressed phrases. This is a composite paraphrase presented inside quotation marks.
- **Recommendation:** Either (a) present the passage without quotation marks as a paraphrase of the auditor's findings, with a reference to the audit report for the verbatim text; or (b) extract the actual verbatim net-assessment sentence from the outline audit and quote only that: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity." The current treatment of structured content as verbatim prose quotation is a quote accuracy error.

**Issue 2.3 — Dolezal et al. third author: "Graham, J." should be "Graham, M."**

- **Location:** References section: "Dolezal, J., Alam, S., Graham, J., & Bohacek, M. (2026, April)..."
- **Claim:** Third author initial is J.
- **Finding:** arXiv:2604.26965 lists the third author as Mark Graham (no middle initial; confirmed via direct arXiv page fetch). The author is listed as "Mark Graham" at the Internet Archive / Wayback Machine, where he is a senior researcher. The prior audit (P2.4) flagged this error — the correction changed the initial from "J." to "M." but the reference still shows "Graham, J." in this revision. The prior audit correction did not land.
- **Recommendation:** Correct to: "Dolezal, J., Alam, S., Graham, M., & Bohacek, M. (2026, April)..."

**Issue 2.4 — Cheong et al. venue overstated: workshop paper cited as main symposium proceedings**

- **Location:** References section: "Cheong, I., et al. (2025). Penalizing transparency? ... *Proceedings of the 2025 ACM Symposium on Human-Computer Interaction for Work (CHIWORK)*."
- **Claim:** The paper appeared in the ACM CHIWORK symposium proceedings.
- **Finding:** The paper (arXiv:2507.01418, confirmed) was presented at the CHIWORK 2025 Workshop on Navigating Generative AI Disclosure, Ownership, and Accountability in Co-Creative Domains — a workshop within CHIWORK, not the main symposium proceedings. This distinction affects the paper's peer-review status. This is a carry-over from prior audit P2.6, which was not fixed in this revision.
- **Recommendation:** Correct venue to: *Proceedings of the CHIWORK 2025 Workshop on Generative AI Disclosure, Ownership, and Accountability in Co-Creative Domains* (or equivalent workshop citation form).

---

### P3 — Consider

**Issue 3.1 — Wright et al. (2025) arXiv number absent from reference entry**

- **Location:** References section: "Wright, D., et al. (2025, October). Epistemic diversity and knowledge collapse in large language models. *arXiv preprint* (cs.CL)."
- **Claim:** Reference is attributed to Wright et al., October 2025, arXiv cs.CL, without an arXiv identifier.
- **Finding:** The arXiv number is 2510.04226, confirmed against arXiv search results. The reference lacks this identifier, making it less directly citable and less verifiable. This is a carry-over from the prior audit (not explicitly flagged there but implicit in the sparse reference entry). Authors confirmed: Dustin Wright, Sarah Masud, Jared Moore, Srishti Yadav, Maria Antoniak, Peter Ebert Christensen, Chan Young Park, Isabelle Augenstein — "et al." is acceptable given the author count.
- **Recommendation:** Add the arXiv identifier: "Wright, D., et al. (2025, October). Epistemic diversity and knowledge collapse in large language models. *arXiv preprint arXiv:2510.04226* (cs.CL)."

---

## Verified Clean (No Issues)

The following references were verified as correctly attributed, accurate in all checked details, and free of issues introduced by this revision:

| Reference | Verification |
|-----------|-------------|
| Docherty & Smith (1999), BMJ PMC1115625 | Authors, year, journal, pages confirmed. Prior P1.1 fully resolved. |
| Nakayama et al. (2005), JMLA PMC1082941 | Authors (Nakayama, Hirai, Yamazaki, Naito), year, journal, pages confirmed. Correctly separated from Docherty & Smith. |
| Hartley (2004), JMLA PMC442180 | Author, year, journal, volume/pages confirmed. Substance of claim supported; quote accuracy flagged as P2.1. |
| Liu et al. (2026), arXiv:2604.24658 | First author Jiachen Liu confirmed. Title, year, QA figures confirmed. Prior P2.7 fully resolved. |
| ELEPHANT — Cheng et al. (2025), arXiv:2505.13995 | Full author order (Cheng, Yu S., Lee C., Khadpe, Ibrahim, Jurafsky) confirmed. Prior P1.3 fully resolved. |
| Cheng et al. (2026), Science DOI:10.1126/science.aec8352 | Year 2026 confirmed. Author order (Cheng, Lee C., Khadpe, ...) confirmed. Prior P1.4 fully resolved. |
| Agarwal et al. (2025), CHI | Exists; 90.6%→83.5% figures confirmed. |
| Gallegos et al. (2026), PNAS Nexus 5(2):pgag008 | Author list, figures (P=0.91), venue confirmed. |
| Wright et al. (2025) | Paper and findings confirmed at arXiv:2510.04226. Identifier missing from reference (P3.1). |
| Gorman (2026a) | URL and date confirmed. |
| Gorman (2026b) | Post exists; URL omitted from reference (noted in prior audit P2.3, not re-raised here as it is stable carry-over). |
| Cheong et al. (2025) | Paper and findings confirmed. Venue precision flagged (P2.4 carry-over). |
| Haynes et al. (1990) | Confirmed. |
| Cochrane Collaboration (2022) | Confirmed. |
| Booth et al. (2008) | Confirmed. |
| Lamport (2002) | Confirmed. |
| Dolezal et al. (2026) | Paper and figures confirmed; author initial error flagged (P2.3). |
| Veldkamp et al. (2020) | Confirmed. |
| Nosek et al. (2015) | Confirmed. |
| PRISMA (2020) | Confirmed. |
| Sword (2012) | Confirmed. |
| Janse van Rensburg (2025) | Confirmed. |
| Kim et al. (2025) | Confirmed at ACL Anthology. |
| Farrell (2025) | Confirmed. |
| Kalyuga et al. (2003) | Self-flagged as carried from Essay 016; not re-verified. |
| Tsui et al. (2025) | Self-flagged as unverified; carry-over from prior audit P3.5. |
| Ernst & Robillard (2023) | Self-flagged placeholder; carry-over. |

---

## Summary of Prior Audit P2 Carry-Overs Not Addressed

For completeness, the following prior-audit P2/P3 items remain outstanding and were not corrected in this revision:

- **Prior P2.1** (ELEPHANT 86% sub-dataset framing) — not addressed; still present in §1.
- **Prior P2.3** (Gorman 2026b URL missing) — not addressed; entry still lacks URL and specific date.
- **Prior P2.4** (Dolezal Graham, J. → Graham, M.) — not fixed; re-raised as P2.3 in this report.
- **Prior P2.5** (Dolezal 107% positive-sentiment figure absent) — minor; not re-raised.
- **Prior P2.6** (Cheong venue precision) — not fixed; re-raised as P2.4 in this report.
- **Prior P3.2** (Chambers et al. two-author "et al.") — not fixed.
- **Prior P3.3** (Dunleavy URL precision) — not fixed.
- **Prior P3.4** (Ernst & Robillard placeholder) — not fixed.
- **Prior P3.8** (Kim et al. orphan reference) — Kim et al. is still in the References without in-text citation in the prose essay body.
- **Prior P3.9** (Higgins et al. orphan reference) — still present.

These carry-overs are noted for gate-prep but are not re-escalated in this report unless the revision introduced new context that changes their severity.

---

## Notes on §5 (New Section)

§5 introduces citation-audit findings as primary data. The section references `citation-audit-018-prose.md` and `citation-audit-018-outline.md` — both files exist and are correctly named. The factual claims about the outline audit's counts (2 P1, 2 P2, 5 P3, 9 total) match the outline audit summary exactly. The factual claim about shared P1 errors (Rahimi/Liu misattribution; Nakayama/Docherty & Smith misattribution) matches both audit reports. The factual claims about the three prose-unique P1 errors (Ripple→Hartley, ELEPHANT initials, Science year/author-order) match the prior prose audit's Issue 1.2, 1.3, and 1.4. The claim that the outline reported zero unique-to-outline P1 errors is accurate per the outline audit.

The two issues requiring correction are: (a) the P3 count mischaracterization (P1.1 above — must fix before this section can stand as a factual record), and (b) the block quote that presents paraphrased structured content as verbatim prose quotation (P2.2 above — should fix).
