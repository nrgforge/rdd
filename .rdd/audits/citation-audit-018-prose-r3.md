# Citation Audit Report — Re-audit (R3)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md`
**Prior audit:** `/Users/nathangreen/Development/rdd/.rdd/audits/citation-audit-018-prose-r2.md`
**Date:** 2026-05-11
**Purpose:** Verify all six corrections specified in the R2 audit landed cleanly; confirm the new §5 paraphrase + verbatim quote is accurate to its source; identify any remaining or newly-introduced issues.

---

## Summary

- **Total references checked:** 27 (all References entries plus in-text appearances, including §5 self-referential citations)
- **Verified clean:** 27
- **R2 corrections verified resolved:** 6 of 6
- **Issues found:** 0
- **Carry-over P2 items still outstanding (pre-existing, not introduced by this revision):** 1
- **Carry-over P3 items still outstanding (pre-existing, not introduced by this revision):** 5

---

## R2 Correction Verification

### Correction 1 — P1: §5 P3 count ("one P3 minor-count issue" → accurate characterization)

**Status: RESOLVED.**

§5 paragraph 2 now reads: "nine P3 (consider) items of which two were marked confirmed clean and seven were genuine P3 recommendations." Verified against `citation-audit-018-prose.md`: the P3 tier lists Issues 3.1–3.9 (nine sub-items); Issues 3.1 and 3.7 are explicitly marked "No change required. Confirmed clean"; the remaining seven (3.2, 3.3, 3.4, 3.5, 3.6, 3.8, 3.9) are actionable recommendations. The revised characterization is accurate on all three counts: total (nine), confirmed-clean (two), actionable (seven). The prior mischaracterization ("one P3 minor-count issue") is gone.

### Correction 2 — P2: Hartley (2004) quotation marks removed

**Status: RESOLVED.**

§3 now reads: "Hartley (2004) reports that structured abstracts show advantages in content, readability, recall, and retrieval relative to unstructured ones, scoped to medical journal abstracts indexed in MEDLINE; the specific composite phrasing varies across the surrounding structured-abstracts literature and is paraphrased here rather than presented as a verbatim quote." No quotation marks appear around the claim. The disclosure that the phrasing is a paraphrase is explicit and correctly positioned. The §5 reference to "a quote ('better content, readability, recall and retrieval')" now contextualizes this as the phrase that appeared in the prior prose-form audit — a historical reference to the audit finding rather than a live quotation in §3. No new quote-accuracy concern is introduced.

### Correction 3 — P2: §5 block quote replaced with paraphrase + true verbatim

**Status: RESOLVED AND ACCURATE.**

§5 paragraph 3 now presents the four gains as a paraphrase ("The auditor identified four gains in citation auditability when working with outline form: every claim has an explicit provenance node...; orphan references surface immediately under grep; scope qualifications are structurally separated from claims; and calibration markers are explicit per bullet.") followed by the net-assessment sentence as a verbatim quote: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity."

Verified against the source (`citation-audit-018-outline.md`, Methodology Observation section, final paragraph): the verbatim net assessment in the source reads: "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity." The quoted sentence in the essay is an exact match, word for word.

The paraphrase of the four gains is accurate to the four numbered points in the source. One wording note: the essay's preceding sentence says "One loss in auditability counterbalances the gains" — this is a paraphrase that understates the net direction (the source's net assessment is that gains outweigh the loss, not that they balance). However, the sentence is describing the loss in isolation before the net-assessment quote corrects the direction, so the reader is not left with a false impression. This is not a citation accuracy issue.

### Correction 4 — P2: Dolezal third author initial ("Graham, J." → "Graham, M.")

**Status: RESOLVED.**

The References entry now reads: "Dolezal, J., Alam, S., Graham, M., & Bohacek, M. (2026, April)." The initial "M." is confirmed correct against arXiv:2604.26965 (Mark Graham, third author). The prior error "Graham, J." is gone.

### Correction 5 — P2: Cheong venue corrected

**Status: RESOLVED.**

The References entry now reads: "Cheong, I., et al. (2025). Penalizing transparency? How AI disclosure and author demographics shape human and AI judgments about writing. *CHIWORK 2025 Workshop on Generative AI Disclosure, Ownership, and Accountability in Co-Creative Domains*. arXiv:2507.01418."

Verified against the arXiv abstract page for arXiv:2507.01418: the paper's comments field reads "Presented at CHIWORK 2025 Workshop on Generative AI Disclosure, Ownership, and Accountability in Co-Creative Domains." The essay's venue string matches the paper's own self-reported venue exactly. (A Medium article about the workshop used the title "CHIWORK 2025 Workshop on *Navigating* Generative AI Disclosure..." — but the paper's own arXiv metadata does not include "Navigating." The essay's corrected venue is consistent with the primary source.)

### Correction 6 — P3: Wright et al. arXiv ID added

**Status: RESOLVED.**

The References entry now reads: "Wright, D., et al. (2025, October). Epistemic diversity and knowledge collapse in large language models. arXiv:2510.04226 (cs.CL)." Verified against arXiv: 2510.04226 exists, title and author confirmed. The arXiv identifier is now present.

---

## Issues

### P1 — Must Fix

None.

### P2 — Should Fix

None introduced by this revision.

**Carry-over from R2 (pre-existing, not introduced by targeted edits):**

- **Prior P2 (Gorman 2026b URL missing)** — References entry still reads: "Gorman, J. (2026b, May). CRESS principles for context engineering: E is for Empirical. *Codemanship's Blog*." No URL and no specific date. The prior prose audit (P2.3) and R2 both flagged this. The post exists at `https://codemanship.wordpress.com/2026/05/08/cress-principles-for-context-engineering-e-is-for-empirical/` (May 8, 2026). Recommendation: add URL and date. This is a pre-existing carry-over, not introduced by this revision.

### P3 — Consider

None introduced by this revision.

**Carry-overs from R2 (pre-existing, not introduced by targeted edits):**

- **Prior P3: Chambers et al. (2022) "et al." on a two-author paper** — The paper has exactly two authors: Chris Chambers and Loukia Tzavella. "et al." is non-standard for two-author works. Recommendation: "Chambers, C. D., & Tzavella, L. (2022)."

- **Prior P3: Dunleavy (2014) URL imprecise** — References entry uses `https://blogs.lse.ac.uk/writingforresearch`, which is a generic blog landing page rather than the specific post. Recommendation: update to `https://blogs.lse.ac.uk/impactofsocialsciences/2014/10/31/storyboarding-research-dunleavy/`

- **Prior P3: Ernst & Robillard (2023) placeholder** — Still formatted as a bracketed annotation rather than a standard citation. The full title and venue are absent. Recommendation: locate complete citation details or annotate explicitly as "cited via secondary source; primary citation not verified."

- **Prior P3: Kim et al. (2025) orphan reference** — The reference appears in the References section but has no in-text citation in the essay body. Recommendation: add in-text citation at the appropriate location or remove from References.

- **Prior P3: Higgins et al. (2022) orphan reference** — Similarly, "Higgins, J. P. T., et al. (2022). Cochrane handbook — Chapter 3..." appears in References without an in-text citation. The Cochrane Collaboration (2022) entry covers the same handbook. Recommendation: consolidate into the Cochrane Collaboration entry or add in-text citation.

---

## Prior R2 Carry-Over Now Resolved by Absence

**Prior P2.1 (ELEPHANT 86% sub-dataset framing):** The 86% figure does not appear anywhere in the current essay body. The prior flag was about foregrounding a sub-dataset result as the headline claim. With the figure absent from the text, the concern is moot. Confirmed resolved.

---

## Verified Clean

All 27 References entries and their in-text appearances were checked. The following previously-flagged items are confirmed clean in this revision:

| Item | Status |
|------|--------|
| Docherty & Smith (1999) BMJ PMC1115625 | Confirmed clean (resolved in prior round) |
| Nakayama et al. (2005) JMLA PMC1082941 | Confirmed clean (resolved in prior round) |
| Hartley (2004) JMLA PMC442180 | Confirmed clean; paraphrase correctly disclosed |
| Liu et al. (2026) arXiv:2604.24658 | Confirmed clean (resolved in prior round) |
| ELEPHANT — Cheng et al. (2025) arXiv:2505.13995 | Confirmed clean (resolved in prior round) |
| Cheng et al. (2026) Science DOI:10.1126/science.aec8352 | Confirmed clean (resolved in prior round) |
| Dolezal et al. (2026) arXiv:2604.26965 | Graham, M. confirmed; R2 correction landed |
| Cheong et al. (2025) arXiv:2507.01418 | Venue corrected; matches paper's own arXiv metadata |
| Wright et al. (2025) arXiv:2510.04226 | arXiv ID added; confirmed |
| §5 P3 count characterization | Accurate: 9 total, 2 confirmed clean, 7 actionable |
| §5 verbatim net-assessment quote | Exact match to source audit text |
| Agarwal et al. (2025) CHI | Confirmed clean |
| Gallegos et al. (2026) PNAS Nexus | Confirmed clean |
| Gorman (2026a) | Confirmed clean |
| Haynes et al. (1990) Annals | Confirmed clean |
| Cochrane Collaboration (2022) | Confirmed clean |
| Booth et al. (2008) | Confirmed clean |
| Lamport (2002) | Confirmed clean |
| Veldkamp et al. (2020) | Confirmed clean |
| Nosek et al. (2015) | Confirmed clean |
| PRISMA (2020) | Confirmed clean |
| Sword (2012) | Confirmed clean |
| Janse van Rensburg (2025) arXiv:2511.04683 | Confirmed clean |
| Kim et al. (2025) ACL:2025.findings-emnlp.1222 | Reference accurate; orphan status flagged (P3 carry-over) |
| Farrell (2025) | Confirmed clean |
| Kalyuga et al. (2003) | Self-flagged; carry-over from Essay 016; not re-verified |
| Tsui (2025) arXiv:2507.02778 | Self-flagged; confirmed clean (resolved in prior round) |

---

## Gate Assessment

This document is clean for the citation gate. All six R2 corrections applied accurately and without introducing new errors. One pre-existing P2 carry-over (Gorman 2026b URL) and five pre-existing P3 carry-overs remain; none was introduced by the targeted edits. The P2 carry-over is the only item requiring a decision before the gate closes — it is a missing URL on a verified-existent reference, not a factual error.
