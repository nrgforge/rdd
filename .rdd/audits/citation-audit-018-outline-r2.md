# Citation Audit Report — Outline Form R2

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-outline.md`
**Prior audit:** `/Users/nathangreen/Development/rdd/.rdd/audits/citation-audit-018-outline.md`
**Date:** 2026-05-11

**Note:** This audit was produced via the `rdd:citation-auditor` specialist subagent dispatched as part of Cycle 018 Step 4a re-audit. The subagent returned its output as an inline response rather than writing the file directly; the orchestrator wrote the content to this path during phase-exit tidying. The audit content is reconstructed from the subagent's response.

---

## Summary

- **Total references rechecked:** 28 (full corpus, plus new §7 citations)
- **Prior P1 issues resolved:** 2 of 2
- **Prior P2 issues resolved:** 2 of 2 (Cheng et al. 2026 removed; Tsui corrected to single author)
- **New issues found this re-audit:** 4 (1 P1, 2 P2, 1 P3)
- **Cross-reference renumbering:** Clean — no dangling §-references detected
- **Carry-over P3 items from prior audit not in scope of corrections:** 5 unchanged (Kim & Khashabi formatting, Newcombe title inconsistency, Aghajani orphan, ELEPHANT venue understated, Janse van Rensburg title truncated)

---

## P1 Corrections: Verified as Resolved

**Correction 1 — "Rahimi et al. (2026)" → "Liu et al. (2026)" for arXiv:2604.24658**

Verified clean. Every occurrence of "Rahimi et al." has been replaced. The References entry now reads: `Liu, J., Pei, J., Huang, J., et al. (2026). The Last Human-Written Paper: Agent-Native Research Artifacts. arXiv:2604.24658 (preprint, April 2026).` All in-text references correctly use "Liu et al. (2026)." Confirmed against arXiv:2604.24658.

**Correction 2 — "Nakayama et al. (2004)" → "Docherty & Smith (1999)"**

Verified clean. All four former locations (§5.5 ANCHOR, §5.5 EVIDENCE, §5.7 ANCHOR, vocabulary candidates now in §10.2, References entry) now use "Docherty & Smith (1999)" with the correct BMJ citation. Confirmed at PMC1115625 as authored by Michael Docherty and Richard Smith.

---

## P2 Corrections: Verified as Resolved

**Correction — Cheng et al. (2026) "content-selection mechanism" removed**

Verified clean. The citation has been removed from §2 Dimension (a), from §11.1 DIMENSION (a) GROUNDING, and from the References section. The susceptibility-surface argument is now anchored by ELEPHANT (Cheng et al. 2025) and Tsui (2025) only. The historical reference to the removed citation at §7.3 ("The outline honestly self-flagged the only two uncertain citations it carried") is appropriate as a historical description, not a live citation.

**Correction — "Tsui et al. (2025)" → "Tsui (2025)" single author; full title added**

Verified clean. The References entry now reads: `Tsui, K. (2025). Self-Correction Bench: Uncovering and Addressing the Self-Correction Blind Spot in Large Language Models. arXiv:2507.02778.` All in-text references use "Tsui (2025)" without "et al." Confirmed against arXiv:2507.02778: Ken Tsui is the sole author.

---

## Issues

### P1 — Must Fix

**Issue 1.1 — §7.6 presents a paraphrase as a verbatim direct quote, with an internal factual error**

- **Location:** §7.6 "Auditor's direct testimony," the block-quoted passage attributed to `citation-audit-018-outline.md` "Methodology Observation" section.
- **Finding:** The outline presents a block-quoted passage as verbatim from the prior audit, but the actual "Methodology Observation" section lists **four** numbered gains (not three), uses different phrasing, and closes with: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity." The condensed passage in §7.6 introduces a factual error ("three respects" vs. the source's four gains), omits gain #3 (scope qualifications structurally separated from claims), and paraphrases the net assessment with different wording.
- **Recommendation:** Either replace the block-quoted passage with the actual verbatim text from the prior audit's Net Assessment paragraph, or remove the quotation marks and label it as a paraphrase with a note that the source lists four gains.

---

### P2 — Should Fix

**Issue 2.1 — ELEPHANT References entry retains incorrect author initials ("Yu, X., Lee, J." should be "Yu, S., Lee, C.")**

- **Location:** References section, line: `Cheng, M., Yu, X., Lee, J., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. arXiv:2505.13995.`
- **Finding:** Confirmed against arXiv:2505.13995 and the ICLR 2026 poster listing: the second author is Sunny Yu (initial S.) and the third author is Cinoo Lee (initial C.). Section §7.4 of the outline correctly identifies this as a unique-to-prose error but the outline's own References entry carries yet another variant of the same error.
- **Recommendation:** Correct to: `Cheng, M., Yu, S., Lee, C., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. arXiv:2505.13995.`

**Issue 2.2 — §7.2 table reports prose audit P3 count as "1 (minor count)" when actual is 9**

- **Location:** §7.2 audit-issue-count comparison table row for Prose form: `| Prose | 12 | 4 | 7 | 1 (minor count) |`
- **Finding:** The prose audit contains 9 items under P3 (Issues 3.1–3.9), of which two are marked confirmed clean and seven are actionable. The outline's characterization of P3 as "1 (minor count)" misrepresents the prose audit significantly.
- **Recommendation:** Replace with "9" (the actual count) or "9 (2 confirmed clean)" if non-actionable items are to be distinguished.

---

### P3 — Consider

**Issue 3.1 — Cheng et al. (2025) Science References entry retains incorrect author initial ("Lee, J." should be "Lee, C.")**

- **Location:** References section, Science paper entry
- **Finding:** Confirmed via Science publication and arXiv:2510.01395: the author is Cinoo Lee (initial C.), not Lee J. Publication year should be 2026, not 2025.
- **Recommendation:** Correct to: `Cheng, M., Lee, C., Khadpe, P., et al. (2026). Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence. *Science*. DOI: 10.1126/science.aec8352.`

---

## Cross-Reference Renumbering: Verified Clean

All §-references within the outline body were checked. The renumbering (§7→§8, §8→§9, §9→§10, §10→§11) is consistent throughout. No dangling cross-references to former §7, §8, §9, or §10 numbers were found in the body text.

---

## Carry-Over P3 Items (from prior audit, not in scope of this revision)

- Kim & Khashabi (2025) — "et al." non-standard for two-author paper
- Newcombe et al. (2015) — title/venue inconsistency
- Aghajani et al. (2019) — orphan reference with no in-text citation
- ELEPHANT References entry understates peer-review status (ICLR 2026 not noted) — now additionally carries wrong author initials (Issue 2.1)
- Janse van Rensburg (2025) title truncated
