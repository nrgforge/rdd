# Citation Audit Report — R4

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Prior reports:** R1 (`citation-audit-017.md`), R2 (`citation-audit-017-r2.md`), R3 (`citation-audit-017-r3.md`)
**Evidence trail:** Five lit-reviews and research log in `docs/essays/research-logs/`
**Date:** 2026-04-24
**Auditor:** citation-auditor (Sonnet 4.6)

---

## Summary

- **Total references checked:** 26 (23 in References section + 3 body-only or in-text-only references)
- **R3 P1 corrections verified:** 2 of 2 — Resolved
- **R3 P2 corrections verified:** 1 of 1 — Resolved
- **R3 P3 corrections verified:** 1 of 1 — Partially resolved (body citation not updated)
- **New issues introduced by R4 revisions:** 0 (§4.5 cognitive-economy additions introduce no new citation problems)
- **Residual issues found:** 1
- **Total issues this round:** 1

---

## R3 Issue Status

### Resolved from R3

**P1-A — Srinivasaprasad co-authors corrected: Resolved.**

The References entry now reads:

> `Srinivasaprasad, A., Sepanloo, K., Jahromi, S. N., Yu, D., & Duffy, V. G. (2025). How AI chatbot response style affects cognitive load and performance in educational tasks. In *HCI International 2025 — Late Breaking Papers* (Lecture Notes in Computer Science, vol. 16339). Springer. https://doi.org/10.1007/978-3-032-13012-9_14`

This matches the R3 recommendation verbatim (modulo an em-dash vs. en-dash in the proceedings title, which is a typographic convention not a bibliographic error). The fabricated authors "Chowdhury, S." and "Garg, A." are gone; the correct co-authors Sepanloo, Jahromi, Yu, and Duffy are present in the correct order. Venue and DOI are correct.

**P1-B — Aghajani co-authors corrected: Resolved.**

The References entry now reads:

> `Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G., & Lanza, M. (2019). Software documentation issues unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE)*, 1199–1210. doi: 10.1109/ICSE.2019.00122`

Linares-Vásquez, M. is restored in the fourth-author position. The fabricated "Marcus, A." is absent. Pages 1199–1210 and DOI 10.1109/ICSE.2019.00122 are present. The R3 recommendation used the form `(ICSE 2019) (pp. 1199–1210)` whereas the essay uses `, 1199–1210` directly after the proceedings title — a minor formatting variant, not a substantive discrepancy. All author-list and bibliographic facts are correct.

**P2-A — Rukmono et al. canonical order, Chaudron added, venue corrected: Resolved.**

The References entry now reads:

> `Rukmono, S. A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M. R. V. (2024). An explanation of software architecture explanations. *Empirical Software Engineering*. arXiv:2503.08628. doi: 10.1007/s10664-025-10782-3`

This is an exact match for the R3 recommendation. The five-author list is present in published order. The venue is EMSE rather than arXiv alone. The arXiv identifier and DOI are both present and correct.

**P3-C — Decker year corrected in References: Resolved in References; residual in body — see issue below.**

The References entry now reads:

> `Decker, K. (2026). *Do I belong in tech anymore?* https://ky.fyi/posts/ai-burnout.`

The year has been corrected to 2026 and the full URL added. The References entry is correct. However, the body text in §1 has not been updated — see the single remaining issue below.

---

### New issues introduced by R4 revisions

**None.** The §4.5 cognitive-economy revision added a sixth sub-bullet that cites Procida (Diátaxis) and Rukmono et al. (2024) at line 98. Both citations were already present in the References section and have been verified in prior rounds. No new citation-level problems arise from the §4.5 additions.

---

## Issues

### P1 — Must Fix

None.

---

### P2 — Should Fix

---

**Issue P2-A: Body citation "Decker 2025" does not match References year "2026"**

- **Label:** Residual from R3 P3-C correction (applied to References but not to body)
- **Location:** Body, §1, second paragraph (line 12): `(Decker 2025)`
- **Claim:** The body text cites the Decker post as "(Decker 2025)."
- **Finding:** The References entry was corrected to "(2026)" per R3's P3-C recommendation, but the in-text citation in §1 was not updated. The References entry and the body citation are now inconsistent. The correct year, established across R3 and confirmed by the post's publication timestamp, is 2026.
- **Recommendation:** Update the body citation from `(Decker 2025)` to `(Decker 2026)`.

---

### P3 — Consider

---

**Issue P3-A: §4.5 section heading does not reflect revised framing**

- **Label:** New in R4 (minor internal inconsistency, not a citation error)
- **Location:** §4.5 heading (line 84): `### 4.5 Context-building that minimizes human reading load`
- **Claim:** The heading still uses "minimizes human reading load," the pre-revision framing.
- **Finding:** The R4 revision updated the body of §4.5 throughout to the "cognitive economy on the human side" framing — including the abstract (line 6), the opening constraint statement (line 88), and the sixth sub-bullet (line 98). The section heading was not updated to match. This is not a citation error but an internal consistency issue between the heading and the body it governs. The abstract already uses "cognitive-economy on the human side" as the authoritative phrase.
- **Recommendation:** Update the section heading to align with the revised framing, e.g., `### 4.5 Context-building and cognitive economy on the human side`.

---

## Verified Clean — No Issues

All other references checked in prior rounds and confirmed unchanged remain verified. No re-verification was required for entries that were not touched in the R4 revision. The entries verified clean this round that were the subject of R3 corrections are noted in the Resolved section above.

The following additional entries were spot-checked to confirm no drift during the R4 revision process:

| Reference | Status |
|---|---|
| Procida (Diátaxis) | Present, unchanged, correct |
| Rukmono et al. (2024) | Corrected per R3; verified correct in R4 |
| Srinivasaprasad et al. (2025) | Corrected per R3; verified correct in R4 |
| Aghajani et al. (2019) | Corrected per R3; verified correct in R4 |
| Decker (2026) — References entry | Corrected per R3; verified correct in R4 |
| Decker body citation — §1 | **Not corrected — see P2-A above** |

---

## Convergence Assessment

R4 is substantially clean. The three P1 and P2 corrections from R3 have been applied accurately and without introducing new errors — ending the pattern of revision-introduced author-list fabrications noted across R1–R3. One residual P2 issue (body/References year mismatch for Decker) and one P3 stylistic inconsistency (§4.5 heading) remain. Neither affects substantive claims or the integrity of the argument. A single targeted correction to the body citation at §1 is all that is required to bring the document to a fully clean citation state.
