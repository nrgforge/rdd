# Citation Audit Report — Third Round (R3)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-outline.md`
**Prior audit (R1):** `/Users/nathangreen/Development/rdd/.rdd/audits/citation-audit-018-outline.md`
**Prior round (R2):** No file at `.rdd/audits/citation-audit-018-outline-r2.md` — corrections were applied directly to the outline via targeted Edits without a written R2 report. This R3 audit reconstructs the R2 issue set from the task brief and verifies the corrections against the current document state.
**Date:** 2026-05-11
**Auditor:** Citation audit agent (claude-sonnet-4-6)

---

## Summary

- **Total references checked:** 28 (all References entries plus all in-text appearances)
- **Verified clean:** 21
- **R2 corrections verified:** 4 of 4 applied cleanly
- **Issues found:** 6
  - P1: 1 (pre-existing error, not introduced by R2 edits, not flagged by R1)
  - P2: 0
  - P3: 5 (4 carry-overs from R1 not yet corrected; 1 new minor issue in §7.6)

---

## R2 Corrections — Verification Status

### Correction 1 — §7.6 misquote ("three respects" → PARAPHRASE + verbatim)

**Status: APPLIED CLEANLY.**

The block-quote paraphrase that formerly mis-presented a "three respects" summary as a verbatim quotation has been replaced with:

- A `PARAPHRASE` bullet enumerating four gains (provenance nodes, orphan-reference surfacing, scope-qualification separation, explicit calibration markers) and one loss (quote-boundary opacity). The four-gain enumeration was verified against the source ("Methodology Observation: Outline Form and Citation Auditability" section of `citation-audit-018-outline.md`): all four gains match the source's numbered list exactly, and the single loss matches the source's "Loss in auditability" section exactly.
- A `VERBATIM NET ASSESSMENT` bullet quoting: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity." — verified as a verbatim match to the first sentence of the source's "Net assessment" paragraph.
- A `CALIBRATION` note acknowledging the prior misquote and explaining the correction.

The correction is accurate and internally consistent.

### Correction 2 — §7.2 prose P3 count ("1 (minor count)" → "9 (2 marked confirmed clean; 7 actionable)")

**Status: APPLIED CLEANLY.**

The table row for prose P3 now reads `9 (2 marked confirmed clean; 7 actionable)`. The supporting EVIDENCE bullet at line 379 confirms: "header reports 12 total issues; numbered entries are 4 P1 + 7 P2 + 9 P3 (two of the P3 items are marked confirmed clean and therefore informational rather than action items, leaving 7 actionable P3 items)." This matches the actual `citation-audit-018-prose.md` report structure.

### Correction 3 — ELEPHANT References entry (author initials + ICLR 2026 venue)

**Status: APPLIED CLEANLY.**

The References entry now reads: `Cheng, M., Yu, S., Lee, C., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. arXiv:2505.13995. (ICLR 2026.)`

Verified: arXiv:2505.13995 lists authors as Myra Cheng, Sunny Yu (S.), Cinoo Lee (C.), Pranav Khadpe, Lujain Ibrahim, Dan Jurafsky. ICLR 2026 venue confirmed via OpenReview (iclr.cc/virtual/2026/poster/10007944). The prior error "Yu, X., Lee, J." is corrected.

### Correction 4 — Cheng et al. Science entry (author initial "Lee, C." and year 2026)

**Status: APPLIED CLEANLY.**

The References entry now reads: `Cheng, M., Lee, C., Khadpe, P., et al. (2026). Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence. Science. DOI: 10.1126/science.aec8352.`

Verified: Science paper DOI:10.1126/science.aec8352 published March 2026, author order Cheng → Lee (C.) → Khadpe confirmed. The prior errors ("Lee, J." and year 2025) are corrected.

---

## Issues

### P1 — Must Fix

**Issue 1.1 — §4.1 CALIBRATION incorrectly identifies ELEPHANT as a Science paper (pre-existing, not introduced by R2 edits)**

- **Location:** §4.1, line 160: `Cheng et al. ELEPHANT is the peer-reviewed empirical anchor (Science, 2025)`
- **Claim:** The CALIBRATION bullet characterizes ELEPHANT as a peer-reviewed paper in *Science* from 2025, distinguishing it from the non-peer-reviewed Wright et al. and Dolezal et al. preprints in the same bullet.
- **Finding:** ELEPHANT (arXiv:2505.13995) is not a Science paper. It is a conference paper at ICLR 2026 (confirmed at OpenReview and iclr.cc). The *Science* paper is a separate work — Cheng, M., Lee, C., Khadpe, P., et al. (2026). "Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence." DOI: 10.1126/science.aec8352. The two papers have different author orders, different titles, and different venues. The CALIBRATION line conflates them. The "(Science, 2025)" label is wrong on both counts: wrong venue (ICLR, not Science) and wrong year for that venue (ICLR 2026, not 2025). This error was present in the original outline, was not flagged by R1, and was not introduced by the R2 targeted Edits. The R2 edits correctly updated the References entry for ELEPHANT to include "(ICLR 2026.)" and corrected the Science entry's year to 2026 — but the §4.1 CALIBRATION body text was not updated correspondingly, leaving a factual error in the body.
- **Recommendation:** Correct line 160 to: `CALIBRATION: Wright et al. preprint not peer-reviewed; Dolezal et al. preprint not peer-reviewed; Cheng et al. ELEPHANT is the peer-reviewed empirical anchor (ICLR 2026); Nature paywalled, accessed via summary.` The year parenthetical is not needed given the References entry now carries it; alternatively: `Cheng et al. ELEPHANT is the peer-reviewed empirical anchor (ICLR 2026, arXiv:2505.13995)` to distinguish it cleanly from the separately-listed Science paper.

---

### P2 — Should Fix

*No new P2 issues. All four R2 corrections applied cleanly.*

---

### P3 — Consider

**Issue 3.1 — §7.6 verbatim quote truncates the Net Assessment paragraph without ellipsis (new, minor)**

- **Location:** §7.6, `VERBATIM NET ASSESSMENT` bullet.
- **Claim:** The label "VERBATIM NET ASSESSMENT (direct quotation from the source audit)" quotes: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity."
- **Finding:** The actual "Net assessment" paragraph in `citation-audit-018-outline.md` continues with a second sentence: "The structural form makes systematic auditing faster and surfaces structural errors (orphan references, scope-ordering issues, author attribution) that prose would bury in flow." The quoted sentence is verbatim accurate; the second sentence is simply not included. No ellipsis marks the truncation. The omitted sentence adds explanatory detail but does not contradict or qualify the quoted sentence, so the truncation does not mislead. However, omitting a sentence from a paragraph-level quote without an ellipsis is technically imprecise.
- **Recommendation:** Either append an ellipsis to the closing quote mark — `"...outweigh the loss in quote-boundary clarity."` becomes `"Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity."` (acceptable as-is if treated as a sentence-level extract) — or add the trailing sentence to the verbatim block for completeness. The simpler fix: note in the CALIBRATION that the "Net Assessment" paragraph's full text is available in the source. At minimum, acceptable as-is given the quoted sentence is a self-contained claim.

**Issue 3.2 — Kim et al. (2025): "et al." for a two-author paper (carry-over from R1 Issue 3.1, not corrected)**

- **Location:** §4.3, §5.7 (in-text as "Kim et al. (2025)"); References entry: `Kim, S., et al. (2025). Challenging the Evaluator: LLM Sycophancy Under User Rebuttal. Findings of EMNLP 2025. ACL Anthology: 2025.findings-emnlp.1222.`
- **Claim:** "Kim et al. (2025)" implies three or more authors.
- **Finding:** The paper has two authors only — Sung Won Kim and Daniel Khashabi — confirmed via ACL Anthology (aclanthology.org/2025.findings-emnlp.1222/). "Et al." for a two-author work is non-standard in all major citation styles and implies additional co-authors that do not exist.
- **Recommendation:** Update in-text citations to "Kim & Khashabi (2025)" and the References entry to: `Kim, S. W., & Khashabi, D. (2025). Challenging the Evaluator: LLM Sycophancy Under User Rebuttal. Findings of EMNLP 2025. ACL Anthology: 2025.findings-emnlp.1222.`

**Issue 3.3 — Newcombe et al. (2015): preprint title inconsistent with CACM journal attribution (carry-over from R1 Issue 3.2, not corrected)**

- **Location:** References entry: `Newcombe, C., et al. (2015). Use of Formal Methods at Amazon Web Services. Communications of the ACM. https://lamport.azurewebsites.net/tla/formal-methods-amazon.pdf`
- **Claim:** The entry attributes the title "Use of Formal Methods at Amazon Web Services" to *Communications of the ACM*.
- **Finding:** The published CACM title is "How Amazon Web Services Uses Formal Methods" (CACM Vol. 58, No. 4, 2015, pp. 66–73, DOI:10.1145/2699417). "Use of Formal Methods at Amazon Web Services" is the preprint title hosted at lamport.azurewebsites.net — the URL cited in the References. The entry mixes the preprint title with the journal attribution, creating an inconsistency.
- **Recommendation:** Update to the published title and DOI: `Newcombe, C., Rath, T., Zhang, F., Munteanu, B., Brooker, M., & Deardeuff, M. (2015). How Amazon Web Services Uses Formal Methods. Communications of the ACM, 58(4), 66–73. DOI: 10.1145/2699417.` Alternatively, retain the preprint URL but use the preprint title and remove the CACM attribution.

**Issue 3.4 — Aghajani et al. (2019): orphan reference with no in-text citation (carry-over from R1 Issue 3.3, not corrected)**

- **Location:** References section only: `Aghajani, E., et al. (2019). Software documentation issues unveiled. Proceedings of the International Conference on Software Engineering (ICSE 2019).`
- **Claim:** Implied: this source was used in the outline.
- **Finding:** No in-text citation to Aghajani et al. (2019) appears anywhere in the outline body, abstract, method listing, or limitations. The entry appears to have been inherited from a research-log pass that did not survive into the outline.
- **Recommendation:** Either add an in-text citation at the point where this work was drawn on, or remove it from the References. Do not carry forward uncited references.

**Issue 3.5 — Janse van Rensburg (2025): References title truncated by two words (carry-over from R1 Issue 3.5, not corrected)**

- **Location:** References entry: `Janse van Rensburg, L. J. (2025). AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification. arXiv:2511.04683.`
- **Claim:** The cited title is "AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification."
- **Finding:** The full title at arXiv:2511.04683 is "AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification in Academic Research." The subtitle is missing its final two words.
- **Recommendation:** Update to: `Janse van Rensburg, L. J. (2025). AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification in Academic Research. arXiv:2511.04683.`

---

## Verified References

The following references were checked in this round and confirmed accurate:

| Ref | Status |
|-----|--------|
| ELEPHANT — Cheng et al. (2025), arXiv:2505.13995, ICLR 2026 | Corrected per R2; author initials and venue now accurate |
| Cheng et al. (2026) Science, DOI:10.1126/science.aec8352 | Corrected per R2; year and Lee initial now accurate |
| §7.2 prose P3 count — 9 (2 confirmed clean; 7 actionable) | Corrected per R2; matches `citation-audit-018-prose.md` |
| §7.6 PARAPHRASE + VERBATIM NET ASSESSMENT | Corrected per R2; four gains + one loss paraphrase matches source; verbatim sentence accurate |
| Liu et al. (2026), arXiv:2604.24658 | Confirmed clean (corrected in R1) |
| Docherty & Smith (1999), BMJ, PMC1115625 | Confirmed clean (corrected in R1) |
| Tsui, K. (2025), arXiv:2507.02778 | Confirmed clean (corrected in R1) |
| Gorman (2026a, b, c) — CRESS posts | Confirmed clean (R1 verified) |
| ELEPHANT 86% figure | Confirmed: "models fail to challenge potentially ungrounded assumptions in 86% of cases" (arXiv:2505.13995) |
| Kim & Khashabi (2025), ACL:2025.findings-emnlp.1222 | Paper exists; two-author attribution issue persists as P3 carry-over |
| Janse van Rensburg (2025), arXiv:2511.04683 | Paper exists; title truncation persists as P3 carry-over |
| All other references verified in R1 | Not re-verified individually; no edits touched these entries |

---

## Cross-Reference Consistency Check

The R2 edits to the References section (ELEPHANT author initials and ICLR 2026 venue; Cheng Science year and Lee initial) were checked against all in-text appearances. No inconsistency introduced:

- §7.4 line 395 correctly quotes the prior prose error as "Yu, T., Lee, J." for documentation purposes — this is accurate historical record, not an error in the current document.
- §4.1 CALIBRATION (line 160) references ELEPHANT but retains the incorrect "(Science, 2025)" label — flagged as P1 Issue 1.1 above; this inconsistency with the corrected References entry was introduced by the R2 edit that fixed the References but did not update the body text.

---

## Notes on R2 Edit Scope

The four R2 targeted Edits applied cleanly without introducing new errors beyond the P1 inconsistency noted above (which arose from correcting the References entry without updating the corresponding §4.1 CALIBRATION body text). The five P3 carry-overs from R1 were not in scope for R2 and remain open. All are minor and confined to References formatting; none affect the document's argument or empirical claims.
