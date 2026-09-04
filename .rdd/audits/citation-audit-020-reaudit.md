# Citation Audit Report — Re-audit after Revision

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md`
**Prior audit:** `.rdd/audits/citation-audit-020.md`
**Date:** 2026-05-22
**Re-audit scope:** Verification of corrections for P1-1, P2-1, P2-2, P2-3. P3-1 out of scope per dispatch.

---

## Summary

| Finding | Verdict |
|---------|---------|
| P1-1 — Rukmono attribution | NOT CORRECTED (correction based on false premise; introduced new errors) |
| P2-1 — Gupta first-author initial | CORRECTED |
| P2-2 — Volpini title and author initial | CORRECTED |
| P2-3 — ADR-072 → ADR-064 | CORRECTED |

---

## P1-1 — Rukmono et al. — NOT CORRECTED

### What the correction did

The corrected essay-outline References entry reads:

> Rukmono, S. A., Zamfirov, T., Ochoa, L., & Chaudron, M. R. V. (2025). Architectural-explanation contexts in software engineering practice. *arXiv:2503.08628*. *(per Cycle 020 Loop 3 lit-review; arXiv preprint — no confirmed peer-reviewed venue as of Cycle 020 close)*

The correction removed "Pex, F." and listed four authors; it downgraded the venue to "arXiv preprint" with the arXiv ID noted.

### What verification reveals

The prior audit R1 finding that "Floris Pex" was a fabricated author was itself wrong. Verification against arXiv:2503.08628 confirms the paper has **five authors**:

1. Satrio Adi Rukmono
2. Filip Zamfirov
3. Lina Ochoa
4. Floris Pex
5. Michel Chaudron

Floris Pex is a real co-author on this paper (listed as an independent researcher, separate from the Eindhoven University of Technology affiliation of the other authors). Removing "Pex, F." from the author list omits a genuine co-author.

The correction also introduced a new error: the corrected entry gives "Zamfirov, T." — but the actual author is **Filip Zamfirov**, initial **F.**, not T.

The venue downgrade to "arXiv preprint" with arXiv ID 2503.08628 noted is correct and should be retained. The paper title used in the body of the essay-outline ("Architectural-explanation contexts in software engineering practice") is a paraphrase; the actual arXiv title is "An Explanation of Software Architecture Explanations." The title paraphrase is a carry-over from the original essay-outline and was not part of the P1-1 correction scope, but it is noted here.

### New correct entry

> Rukmono, S. A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M. R. V. (2025). An explanation of software architecture explanations. *arXiv:2503.08628*. *(arXiv preprint — no confirmed peer-reviewed venue as of Cycle 020 close)*

### In-body references

The Argument-Graph and Citation-Embedded Outline cite this paper as "(Rukmono et al. 2025)" throughout — the "et al." form is unaffected by the author-count correction and does not need to change.

---

## P2-1 — Gupta first-author initial — CORRECTED

The References entry now reads:

> Gupta, A., Dhar, A., Feitosa, D., & Vaidhyanathan, K. (2026). Context strategies for automated ADR generation. *arXiv:2604.03826*.

The first-author initial is "A." (Aviral Gupta), correcting the prior "S." The substantive finding cited (recency window of 3–5 prior ADR records) remains accurately reported.

One residual note: the R1 audit also identified the second author's initial as "R." (Rudra Dhar) vs. "A." in the earlier version. The corrected entry shows "Dhar, A." — the actual second author is Rudra Dhar, initial R. This was not explicitly flagged as a must-fix in P2-1 (the recommendation focused on the first-author initial), but the "Dhar, A." initial is also incorrect. This is a P3-level residual.

---

## P2-2 — Volpini title and author initial — CORRECTED

The References entry now reads:

> Volpini, A., et al. (2026). Structured Linked Data as a Memory Layer for Agent-Orchestrated Retrieval. *arXiv:2603.10700*. *(per Cycle 020 Loop 2 lit-review §Q3; +29.6% retrieval-accuracy finding)*

The title is the accurate title (not the prior paraphrase). The lead author initial is "A." (Andrea), correcting the prior "L." The "et al." abbreviation was noted in the original P2-2 as a style departure but was not the core finding; the core finding (wrong title, wrong initial) is corrected.

---

## P2-3 — ADR-072 → ADR-064 — CORRECTED

All five check points verified:

1. **C5 in Abstract conclusions (line 14):** "ADRs 064, 083, 084, 085, 092, 095" — ADR-064 present, no ADR-072.
2. **E5.1.1 in Argument-Graph (line 72):** "(ADR-064) Centered-vs-Infrastructure distinction names two artifact categories (per the framing introduced in ADR-064 §'Centered vs. infrastructure artifacts' 2026-04-09 DECIDE gate; subsequent ADRs 070, 085 build on the framing)." — Correct.
3. **Section 6 body EVIDENCE bullets (line 175):** "(ADR-064) Centered-vs-Infrastructure distinction named at DECIDE gate 2026-04-09." — Correct.
4. **Section 9 META PROVENANCE CORRECTION (line 215):** "ADR-064 (centered-vs-infrastructure framing introduced at DECIDE gate 2026-04-09) is the closest prior naming…" — Correct.
5. **References section "Prior audience-bifurcation ADRs" (line 270):** "`adr-064-compound-check-hooks.md` (introduces centered-vs-infrastructure framing at DECIDE gate 2026-04-09)…" — Correct.

The ADR-064 file (`docs/decisions/adr-064-compound-check-hooks.md`) was inspected directly and confirmed to contain the centered-vs-infrastructure framing at the DECIDE gate 2026-04-09, exactly as the corrected essay-outline describes. The correction is consistent across all five locations.

---

## Required action

**P1-1 remains open.** The essay-outline must be revised again with the correct five-author list and the corrected Zamfirov initial:

> Rukmono, S. A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M. R. V. (2025). An explanation of software architecture explanations. *arXiv:2503.08628*. *(arXiv preprint — no confirmed peer-reviewed venue as of Cycle 020 close)*

The prior audit's R1 P1-1 finding was itself erroneous (it claimed Pex was fabricated; Pex is a real co-author). The correction applied in response to that finding compounded the error by removing a genuine author and introducing a wrong initial for Zamfirov. A second revision pass is required before this finding can be closed.

**P3 residual (non-blocking):** "Dhar, A." in the Gupta entry should be "Dhar, R." (Rudra Dhar). This was not explicitly in the P2-1 correction scope but is present in the document.

*This is a re-audit dispatched per the re-audit-after-revision rule (ADR-094). No Convergence-Saturation Signal verdict line is appended.*
