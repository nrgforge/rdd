# Citation Audit Report

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-outline.md`
**Evidence trail:**
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md`
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-018-ai-prose-critique-landscape.md`
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-018-minimal-surface-artifact-design.md`
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-018-spike-s1.md`
**Date:** 2026-05-11
**Auditor:** Citation audit agent (claude-sonnet-4-6)

---

## Summary

- **Total references checked:** 28
- **Verified without issue:** 19
- **Issues found:** 9 (2 P1, 2 P2, 5 P3)
- **Flagged gaps confirmed:** 2 (Cheng et al. 2026, Tsui et al. 2025 — self-flagged by the outline; audit confirms the gap and provides next-step guidance)

---

## Issues

### P1 — Must Fix

**Issue 1.1 — Rahimi et al. (2026) authorship is incorrect; "Rahimi" is not among the paper's authors**

- **Location:** §5.8 section heading, §5.8 body, §9.2 vocabulary candidates, §10.3 Open Question 4, and the References entry: `Rahimi, S., et al. (2026). The Last Human-Written Paper: Agent-Native Research Artifacts. arXiv:2604.24658 (preprint, April 2026).`
- **Claim:** The outline attributes "The Last Human-Written Paper: Agent-Native Research Artifacts" to "Rahimi et al. (2026)."
- **Finding:** arXiv:2604.24658 exists and the title is correct. The empirical figures cited (72.4%→93.7% QA accuracy, 57.4%→64.4% reproduction success) are accurately reported. However, the lead author is **Jiachen Liu**, not "Rahimi." The paper has 37 authors; "Rahimi" does not appear anywhere in the author list. The authorship appears to have been hallucinated or confused with another paper.
- **Recommendation:** Replace all occurrences of "Rahimi et al. (2026)" with "Liu et al. (2026)" and update the References entry to: `Liu, J., Pei, J., Huang, J., et al. (2026). The Last Human-Written Paper: Agent-Native Research Artifacts. arXiv:2604.24658 (preprint, April 2026).`

---

**Issue 1.2 — Nakayama et al. (2004) BMJ PMC1115625 is a misattribution; the paper at that PMC ID has different authors and a 1999 date**

- **Location:** §5.5 ANCHOR line, §5.5 EVIDENCE bullet, §5.7 ANCHOR line (audit-extended prose), §9.2 vocabulary candidates, and the References entry: `Nakayama, T., et al. (2004). The case for structuring the discussion of scientific papers. *BMJ*. PMC1115625.`
- **Claim:** The outline cites "Nakayama et al. (2004)" for the claim that structure "prevents polemic by separating each analytical function into a designated section," attributing it to BMJ with PMC1115625.
- **Finding:** PMC1115625 is the identifier for "The case for structuring the discussion of scientific papers: Much the same as that for structuring abstracts" authored by **Michael Docherty and Richard Smith**, published in BMJ on **May 8, 1999** (vol. 318, pages 1224–1225). This paper does not have Nakayama as an author and was not published in 2004. The paper by Nakayama et al. on structured abstracts is a distinct 2005 paper published in the *Journal of the Medical Library Association* (PMC1082941) — which is separately and correctly cited in the outline as Ripple et al. (2005). Verification indicates the Nakayama et al. name, date, and journal have been incorrectly attached to the Docherty & Smith paper's PMC ID. The specific "prevents polemic" quote should be verified against the Docherty & Smith (1999) paper.
- **Recommendation:** Correct the References entry to: `Docherty, M., & Smith, R. (1999). The case for structuring the discussion of scientific papers: Much the same as that for structuring abstracts. *BMJ*, 318(7193), 1224–1225. PMC1115625.` Update all in-text citations from "Nakayama et al. (2004)" to "Docherty & Smith (1999)" in §5.5, §5.7, and §9.2. The "prevents polemic" quote in §5.5 should be verified against the Docherty & Smith (1999) primary text, since access to this paper was limited in the research log.

---

### P2 — Should Fix

**Issue 2.1 — Cheng et al. (2026) "content-selection mechanism" cannot be verified; the self-flagged gap is confirmed**

- **Location:** §2 CLAIM (Dimension a), §10.1 DIMENSION (a) GROUNDING, and the References entry: `Cheng, M., et al. (2026). Content-selection mechanism of sycophancy in LLMs [as cited in cycle research log; primary citation to be verified at DECIDE stage].`
- **Claim:** A 2026 paper by Cheng et al. on a "content-selection mechanism of sycophancy in LLMs" is cited as grounding for Dimension (a) of the operationalized susceptibility concept.
- **Finding:** No paper matching this description exists in any accessible database. The ELEPHANT paper (arXiv:2505.13995) is Cheng et al. 2025 and is confirmed at ICLR 2026, but it does not carry the "content-selection mechanism" framing as a distinct theoretical contribution. The Science paper (10.1126/science.aec8352) is also 2026 but covers behavioral consequences of sycophancy, not the content-selection mechanism specifically. Search across arXiv, Google Scholar, and Myra Cheng's publication list found no 2026 paper by Cheng et al. using this framing. The outline correctly flags this citation for DECIDE-stage verification. The gap is real.
- **Recommendation:** Remove "Cheng et al. (2026)" from §2 Dimension (a) and from the References placeholder entry until the citation can be identified. The susceptibility-surface argument does not lose its grounding — ELEPHANT (Cheng et al. 2025) and Tsui (2025) provide the existing empirical anchors. If the content-selection mechanism framing is needed, it should be either constructed from ELEPHANT's existing findings or left as an explicit open question pending DECIDE-stage research.

---

**Issue 2.2 — Tsui et al. (2025) "Self-Correction Blind Spot" is a single-author paper cited as multi-author; and the title is incomplete**

- **Location:** §2 CLAIM (Dimension a), §10.1 DIMENSION (a) GROUNDING, and the References entry: `Tsui, K., et al. (2025). Self-Correction Blind Spot in LLMs [as cited in cycle research log; primary citation to be verified at DECIDE stage].`
- **Claim:** "Tsui et al. (2025)" is cited for the "Self-Correction Blind Spot" concept.
- **Finding:** The paper exists: arXiv:2507.02778, "Self-Correction Bench: Uncovering and Addressing the Self-Correction Blind Spot in Large Language Models," submitted July 2025, revised October 2025. The author is **Ken Tsui — sole author, no et al.** The "et al." attribution is therefore incorrect. The short title "Self-Correction Blind Spot in LLMs" in the References is also incomplete relative to the actual title.
- **Recommendation:** Update the References entry to: `Tsui, K. (2025). Self-Correction Bench: Uncovering and Addressing the Self-Correction Blind Spot in Large Language Models. arXiv:2507.02778.` Update in-text citations from "Tsui et al. (2025)" to "Tsui (2025)." The "[as cited in cycle research log; primary citation to be verified at DECIDE stage]" qualifier can be removed since the paper is now verified.

---

### P3 — Consider

**Issue 3.1 — Kim et al. (2025) has exactly two authors; "et al." is non-standard for a two-author paper**

- **Location:** §4.3, §5.7, and the References entry: `Kim, S., et al. (2025). Challenging the Evaluator: LLM Sycophancy Under User Rebuttal. *Findings of EMNLP 2025*. ACL Anthology: 2025.findings-emnlp.1222.`
- **Claim:** The outline cites "Kim et al. (2025)" for the finding that citation-based rebuttals trigger the highest rate of regressive sycophancy.
- **Finding:** The paper is confirmed at ACL Anthology 2025.findings-emnlp.1222. It has **two authors only**: Sung Won Kim and Daniel Khashabi. Using "et al." for a two-author paper is non-standard in most citation styles and risks implying additional co-authors that do not exist.
- **Recommendation:** Update the in-text citations to "Kim & Khashabi (2025)" and update the References entry to: `Kim, S. W., & Khashabi, D. (2025). Challenging the Evaluator: LLM Sycophancy Under User Rebuttal. *Findings of EMNLP 2025*. ACL Anthology: 2025.findings-emnlp.1222.`

---

**Issue 3.2 — Newcombe et al. (2015) title discrepancy: References uses the preprint title, not the CACM published title**

- **Location:** References entry: `Newcombe, C., et al. (2015). Use of Formal Methods at Amazon Web Services. *Communications of the ACM*. https://lamport.azurewebsites.net/tla/formal-methods-amazon.pdf`
- **Claim:** The outline cites the paper as "Use of Formal Methods at Amazon Web Services."
- **Finding:** The published CACM title is "**How Amazon Web Services Uses Formal Methods**" (Communications of the ACM, Vol. 58, No. 4, 2015, pp. 66–73). The title "Use of Formal Methods at Amazon Web Services" is the title of the preprint/working paper hosted at lamport.azurewebsites.net. The URL in the References points to the preprint, not the CACM publication. The journal attribution (*Communications of the ACM*) is correct for the published version, creating an inconsistency: the title matches the preprint but the journal matches the published article.
- **Recommendation:** Either (a) update to the published title and add the CACM DOI: `Newcombe, C., Rath, T., Zhang, F., Munteanu, B., Brooker, M., & Deardeuff, M. (2015). How Amazon Web Services Uses Formal Methods. *Communications of the ACM*, 58(4), 66–73. DOI: 10.1145/2699417.` or (b) keep the preprint URL but use the preprint title consistently and do not cite as CACM.

---

**Issue 3.3 — Aghajani et al. (2019) is an orphan reference with no in-text citation**

- **Location:** References section only: `Aghajani, E., et al. (2019). Software documentation issues unveiled. *Proceedings of the International Conference on Software Engineering (ICSE 2019)*.`
- **Claim:** No in-text claim in the outline cites this source.
- **Finding:** A full-text grep of the outline finds Aghajani et al. (2019) appears only in the References section. It is not cited in-text in the abstract, method listing, any section body, or the limitations. The source exists (Aghajani et al. 2019 is a real ICSE paper on software documentation issues), but it does not appear to have been used in this outline.
- **Recommendation:** Either add an in-text citation at the point where this work was drawn on, or remove it from the References. The source may have been inherited from a research-log pass that did not survive into the outline's body. Do not carry forward uncited references.

---

**Issue 3.4 — ELEPHANT (Cheng et al. 2025) References entry omits ICLR 2026 venue; lists only arXiv**

- **Location:** References entry: `Cheng, M., Yu, X., Lee, J., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. arXiv:2505.13995.`
- **Claim:** The entry lists arXiv as the venue.
- **Finding:** ELEPHANT was published as a conference paper at ICLR 2026 (confirmed via OpenReview and the ICLR 2026 poster listing). The arXiv preprint arXiv:2505.13995 is the correct preprint identifier, but the paper has a peer-reviewed venue. Citing the arXiv version alone understates the paper's epistemic status.
- **Recommendation:** Update to: `Cheng, M., Yu, X., Lee, J., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025/2026). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. *Proceedings of ICLR 2026*. arXiv:2505.13995.`

---

**Issue 3.5 — Janse van Rensburg (2025) References entry has a slightly truncated title**

- **Location:** References entry: `Janse van Rensburg, L. J. (2025). AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification. arXiv:2511.04683.`
- **Claim:** The title as cited is "AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification."
- **Finding:** The full title of arXiv:2511.04683 is "AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification **in Academic Research**." The subtitle is truncated by two words. This is minor but present.
- **Recommendation:** Update to: `Janse van Rensburg, L. J. (2025). AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification in Academic Research. arXiv:2511.04683.`

---

## Verified References

The following references were verified as existing, correctly attributed, and accurately described:

| Ref | Verified claim(s) |
|-----|------------------|
| Gorman (2026a) — CRESS post | URL live; title, author, date, and all five CRESS principles confirmed verbatim |
| Gorman (2026b, 2026c) — E is for Empirical, R is for Refutable | Both posts exist at codemanship.wordpress.com with correct May 2026 dates; "waste water" metaphor confirmed in E-is-for-Empirical post |
| Liu et al. (2026) / arXiv:2604.24658 | Paper exists; title correct; 72.4%→93.7% QA and 57.4%→64.4% reproduction figures confirmed (authorship error noted as P1) |
| Cheng et al. (2025) ELEPHANT / arXiv:2505.13995 | Exists; 86% figure confirmed; author list matches |
| Cheng et al. (2025) Science / DOI:10.1126/science.aec8352 | Exists; published Science March 2026; behavioral consequences of sycophancy confirmed |
| Kim & Khashabi (2025) / ACL:2025.findings-emnlp.1222 | Exists; citation-rebuttal triggering highest regressive sycophancy confirmed (attribution issue noted as P3) |
| Agarwal et al. (2025) CHI | Exists at ACM DL; 90.6%→83.5% classifier accuracy figures confirmed from paper HTML |
| Wright et al. (2025) / arXiv:2510.04226 | Exists; 27 LLMs, 155 topics, 12 countries confirmed; knowledge-collapse framing confirmed |
| Dolezal et al. (2026) / arXiv:2604.26965 | Exists; 33% higher semantic similarity and 107% higher positive sentiment figures confirmed from paper HTML |
| Gallegos et al. (2026) PNAS Nexus 5(2):pgag008 | Exists; author list matches; P=0.91 persuasive-effect finding confirmed |
| Cheong et al. (2025) CHIWORK 2025 | Exists; transparency penalty finding confirmed; venue confirmed |
| Janse van Rensburg (2025) / arXiv:2511.04683 | Exists; 91.7% verification rate confirmed (title truncation noted as P3) |
| Adami (2025) Reuters Institute | Article exists at correct URL; December 2025 date confirmed |
| Chayka (2025) New Yorker | Article exists (paywalled, June 2025); MIT brain-activity claim confirmed via MIT Media Lab repost; outline correctly flags paywalled access |
| Farrell (2025) Programmable Mutter | Article exists at Substack; September 2025 date confirmed |
| Nosek et al. (2015) Science | Confirmed at Science DOI:10.1126/science.aab2374 |
| Veldkamp et al. (2020) PLOS Biology | Confirmed at DOI:10.1371/journal.pbio.3000937; 26-question OSF format finding confirmed |
| Chambers et al. (2022) Nature Human Behaviour | Confirmed; DOI:10.1038/s41562-021-01193-7 is correct; note: co-author Loukia Tzavella not named in outline et al. reference (acceptable for et al. citation) |
| Haynes et al. (1990) Annals of Internal Medicine | Confirmed at PubMed PMID:2190518; vol. 113(1):69–76; structured-abstract claims confirmed |
| Ripple et al. (2005) JMLA | Confirmed at PMC1082941; "better content, readability, recall and retrieval" claim confirmed |
| Lamport (2002) TLA+ book | Confirmed at ACM DL:10.5555/579617; Addison-Wesley; ISBN 9780321143068 |
| Booth et al. (2008) Craft of Research | Confirmed; University of Chicago Press; ISBN 978-0226065663 |
| Sword (2012) Stylish Academic Writing | Confirmed; Harvard University Press; ISBN 9780674064485 |
| ISDA (2002, 2005) | Real instruments; 2002 Master Agreement and 2005 Schedule Drafting Guide confirmed |
| Cochrane Collaboration (2022) + Higgins et al. (2022) | Cochrane Handbook confirmed at training.cochrane.org; PRISMA 2020 for Abstracts confirmed |
| Tsui (2025) / arXiv:2507.02778 | Paper exists with correct title base; single-author (attribution issue noted as P2) |

---

## Confirmed Gaps (Self-Flagged)

The outline honestly flagged two citations as needing DECIDE-stage verification. This audit confirms both gaps and provides direction:

**Gap 1 — Cheng et al. (2026) content-selection mechanism:**
No paper matching this description was found in any accessible database. The citation cannot be promoted to verified status. The closest candidates are ELEPHANT (Cheng et al. 2025, ICLR 2026) and the Science paper (10.1126/science.aec8352), neither of which specifically frames a "content-selection mechanism." Recommended action: remove from References and in-text citations; the susceptibility grounding is adequate without it.

**Gap 2 — Tsui et al. (2025) Self-Correction Blind Spot:**
The paper exists (arXiv:2507.02778, Ken Tsui, July 2025) and is now verified. This is no longer a gap — it is a P2 attribution error (single author, incomplete title). The "[primary citation to be verified at DECIDE stage]" qualifier can be resolved by correcting the citation as specified in Issue 2.2.

---

## Methodology Observation: Outline Form and Citation Auditability

*Per the audit brief's special instruction — an observation on outline form as an auditable artifact, for Cycle 018 dogfood comparison purposes.*

The outline form made citation auditing **more efficient and more precise** along several axes, and **less efficient** along one axis:

**Gains in auditability:**

1. **Every claim has an explicit provenance node.** In prose, a citation may appear once in a paragraph carrying multiple claims, creating ambiguity about which claim the source supports. In this outline, every EVIDENCE or ANCHOR bullet names the claim it supports and the source it draws on. The auditor never had to infer "which of the three assertions in this paragraph does Wright et al. (2025) actually establish?" — the answer was structurally explicit.

2. **Orphan references surface immediately.** The Aghajani et al. (2019) orphan (Issue 3.3) was detected in under a minute by grep. In prose, a reference may appear in a footnote or end-note while its in-text use is buried in a subordinate clause; the disconnect is harder to surface. In the outline, every reference is either in a named bullet or absent.

3. **Scope qualifications are structurally separated from claims.** The outline's SCOPE QUALIFICATION sub-bullets force the auditor to attend to whether the scope is stated before or after the claim (the P1 issue in the Spike S1 argument audit). In prose, a scope qualifier is prose-embedded and easier to overlook.

4. **Calibration markers are explicit.** CALIBRATION bullets flag when a source is a preprint vs. peer-reviewed, when access was limited to secondary descriptions, and when the auditor should treat figures as preliminary. This reduced the number of instances where the auditor had to reconstruct epistemic status from context.

**Loss in auditability:**

1. **Quote accuracy is harder to verify.** The outline cites several short characterizations (e.g., Nakayama et al.'s "prevents polemic") without quotation marks, presenting them as paraphrases rather than direct quotes. In prose, a block quote or quoted phrase is visually distinguished and invites direct textual comparison. In the outline's bullet format, the boundary between paraphrase and quotation is less clear, requiring the auditor to access the primary source regardless. The "prevents polemic" phrase, for instance, could not be verified as a direct quote vs. a paraphrase without accessing the primary paper — and the primary paper (correctly identified here as Docherty & Smith 1999) was itself incorrectly attributed, compounding the verification burden.

**Net assessment:** Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity. The structural form makes systematic auditing faster and surfaces structural errors (orphan references, scope-ordering issues, author attribution) that prose would bury in flow.

---

*This audit was conducted against the structured-outline form of the Cycle 018 research artifact. The parallel prose form is subject to a separate citation audit (citation-audit-018-prose.md) to enable the dogfooded form comparison.*
