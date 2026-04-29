# Citation Audit Report

**Audited document:** docs/essays/014-specification-execution-gap.md
**Evidence trail:** docs/essays/research-logs/research-log.md + 6 supporting files (lit-review-instruction-following-degradation.md, lit-review-telemetry-acceptance-criteria.md, spike-s1-hook-feasibility.md, spike-s2-acceptance-criteria.md, spike-s3-base-rate-audit.md, spike-s4-fail-loud-dispatch.md)
**Date:** 2026-04-06

---

## Summary

- **Total references checked:** 9
- **Verified:** 8 (fully confirmed); 1 (exists and correct title/authors/venue, with one unverifiable load-bearing claim)
- **Issues found:** 4 (0 P1, 2 P2, 2 P3)

---

## Issues

### P1 — Must Fix

None.

---

### P2 — Should Fix

**Issue 1:**
**Location:** References section; Section 8 ("methodology graduation" paragraph); Section 1 ("The triggering observation")
**Claim:** The essay cites Meyer (1992) throughout and the References entry reads: "Meyer, B. (1992). *Object-Oriented Software Construction*. Prentice Hall. (2nd ed., 1997.)"
**Finding:** The first edition of *Object-Oriented Software Construction* was published in **1988**, not 1992. The 1992 date appears in some catalogue entries as a reprint/later printing of the first edition, but there was no substantively new edition in 1992. The canonical citation for the first edition is 1988 (Prentice Hall International Series in Computer Science). The second edition is correctly dated 1997. Citing "1992" as the primary date is imprecise and will cause confusion for readers attempting to locate the first-edition text where Design by Contract was introduced.
**Recommendation:** Correct to "Meyer, B. (1988). *Object-Oriented Software Construction*. Prentice Hall. (2nd ed., 1997.)" This is the standard citation used in the ACM Digital Library and the published academic literature.

---

**Issue 2:**
**Location:** Section 3 ("Three supporting findings..."), paragraph on Geng et al.; References section
**Claim:** The essay attributes the quoted phrase *"pretraining-derived social priors function as latent behavioral overrides of post-training instruction hierarchies"* directly to Geng et al. (2025), presenting it as exact wording from the paper.
**Finding:** The abstract of arXiv:2502.15851 reads: *"societal hierarchy framings (e.g., authority, expertise, consensus) show stronger influence on model behavior than system/user roles, suggesting that pretraining-derived social structures function as latent behavioral priors with potentially greater impact than post-training guardrails."* The essay's phrasing ("overrides" vs. "with potentially greater impact than"; "social priors" vs. "social structures"; "instruction hierarchies" vs. "post-training guardrails") is a condensed paraphrase, not a verbatim quote. The lit-review file (lit-review-instruction-following-degradation.md) also presents it as a paraphrase: "pretraining-derived social priors (authority, expertise, consensus from user input) function as latent behavioral overrides of post-training instruction hierarchies." The semantic substance is accurate, but the essay's formatting — italic text, framed as "Their exact framing:" — represents a paraphrase as a direct quotation.
**Recommendation:** Either (a) change "Their exact framing:" to "In their framing:" or "Their finding, paraphrased:" and remove the italics, or (b) replace with the verbatim abstract language: *"pretraining-derived social structures function as latent behavioral priors with potentially greater impact than post-training guardrails"* (Geng et al., 2025). Option (b) preserves the direct-quote formatting. Option (a) is the lower-friction fix and is adequate.

---

### P3 — Consider

**Issue 3:**
**Location:** References section; inline references in Sections 3 and 9
**Claim:** "Tsui, K., et al. (2025). Self-Correction Bench..." — the "et al." implies multiple authors.
**Finding:** arXiv:2507.02778 lists a single author: Ken Tsui. There are no co-authors. The "et al." suffix is incorrect.
**Recommendation:** Change to "Tsui, K. (2025)." and update any "et al." inline references accordingly. This is a P3 (not P1) because the paper exists, the title is correct, the arXiv ID is correct, and the self-correction blind-spot framing is confirmed. The error is in the co-authorship implication only.

---

**Issue 4:**
**Location:** References section
**Claim:** "Jaroslawicz, D., et al. (2025). How many instructions can LLMs follow at once? arXiv:2507.11538."
**Finding:** The paper exists at arXiv:2507.11538. The full author list is Daniel Jaroslawicz, Brendan Whiting, Parth Shah, and Karime Maamari. The "et al." is technically correct for a four-author paper in many citation styles but is non-standard when the full author list is short enough to cite completely. This is a style note, not an error.
**Recommendation:** Consider expanding to the full author list: "Jaroslawicz, D., Whiting, B., Shah, P., & Maamari, K. (2025)." This is optional; "et al." for four authors is acceptable in most formats.

---

## Verified References

1. **Geng et al. (2025) — arXiv:2502.15851.** Confirmed. Title, authors (Yilin Geng, Haonan Li, Honglin Mu, Xudong Han, Timothy Baldwin, Omri Abend, Eduard Hovy, Lea Frermann), year, and AAAI-26 acceptance all verified. Core finding (societal hierarchy cues override structural role designations) accurately represented. See Issue 2 for the quotation precision flag.

2. **Guo & Vosoughi (2025) — arXiv:2406.15981.** Confirmed. Title, both authors, arXiv ID, and ACL 2025 Findings venue (pages 927–953) all verified. The essay's characterization — "primacy effects dominate in longer contexts, with the middle becoming progressively 'dead'" — is consistent with the paper's findings. The paper was submitted in June 2024 but published as part of ACL 2025; the year "2025" in the citation is correct for the publication venue.

3. **Jaroslawicz et al. (2025) — arXiv:2507.11538.** Confirmed. Paper exists, title and arXiv ID correct. The essay's claim that "top reasoning models maintain near-perfect compliance through 100–250 instructions before degradation begins" is supported: the HTML version of the paper states o3 achieves 98.2% at 100 instructions and 97.8% at 250 instructions before dropping sharply to 62.8% at 500 (threshold decay pattern for top reasoning models). The "100–250" characterization is accurate. See Issue 4 for the et al. style note.

4. **Kiczales et al. (1997).** Confirmed. Title, all seven authors, year, venue (ECOOP 1997), publisher (Springer), LNCS vol. 1241, and page range (pp. 220–242) all verified. The essay's characterization of AOP's motivation — preventing "compliance code scattered through application code, inconsistently applied, and skipped when module authors forget to include it" — accurately captures the cross-cutting concerns motivation from the paper.

5. **Liu et al. (2023) — arXiv:2307.03172.** Confirmed. Title, all seven authors, year, and venue (TACL vol. 12) all verified. The U-shaped performance curve finding is accurately characterized.

6. **Meyer, B. (1992 / 1988).** The work exists and the Design by Contract attribution is correct. See Issue 1 for the year discrepancy (1988 is the correct first-edition year; 1992 appears in some reprints).

7. **Parasuraman & Manzey (2010).** Confirmed. Title, both authors, journal (*Human Factors*), volume/issue (52(3)), pages (381–410), and DOI (10.1177/0018720810376055) all verified. The essay's claim — "automation complacency cannot be overcome by training or practice — it requires structural design responses" — is accurately supported. The paper states complacency "cannot be overcome with simple practice" and that automation bias "cannot be prevented by training or instructions," with the design response being structural. The characterization is a faithful summary.

8. **Sigelman et al. (2010) — Dapper.** Confirmed. Title, all eight authors, year, and Google Technical Report format all verified. The essay's "instrument the transport, not the callee's voluntary reporting" characterization is consistent with Dapper's documented transparency design goal (application-level transparency via instrumentation of shared infrastructure rather than per-component voluntary reporting).

9. **Tsui, K. (2025) — arXiv:2507.02778.** Confirmed. Title, arXiv ID, and "Self-Correction Blind Spot" framing all verified. The essay uses the framing correctly. See Issue 3 for the "et al." attribution error.

---

## Notes on Quoted Material

### Block quote in Section 4 (Spike S4 conclusion)

**Essay text:**
> "The proposed hardening will not work. The lit review predicts it will not work. This is the load-bearing finding of the spike."

**Verification:** This is verbatim from spike-s4-fail-loud-dispatch.md, Section "Honest Evaluation Against the Lit Review," first line. Confirmed exact match.

---

### Orchestrator self-observation in Section 9

**Essay text:**
> "I am the orchestrator. I have been deep in research-loop work for several thousand tokens. The susceptibility-snapshot dispatch is in skill text at line 202 of a 530-line file (the deepest middle of the longest file). When the research phase ends and we approach the gate, will I dispatch the snapshot? I don't know. The honest answer is: I'd like to think yes, but the entire cycle is evidence that 'I'd like to think yes' is precisely the failure mode under investigation."

**Verification:** This quote appears verbatim in the research log under Loop 6 (Spike S3 section), explicitly flagged as: "Verbatim self-observation, captured at user request as primary-source material for the essay." Confirmed exact match.

---

### "Know it when they see it" quote in Section 11

**Essay text:**
> "One that I don't think we can 100% prove has worked but hopefully enough that both the agent and user can 'know it when they see it' in context."

**Verification:** This appears in the research log Reflection Pass section (Refinement 4), explicitly labeled as "User's exact framing for the essay's closing epistemic stance." Confirmed. The attribution in the essay ("the reflection pass") is accurate — this is the user's framing, captured during the reflection pass, not a literature citation.

---

## Overall Assessment

The essay's nine references are broadly sound. Seven pass external verification without meaningful issues. Two require corrections before the essay advances.

The Meyer (1992) year in Issue 1 is a factual error with a clean fix: the canonical first-edition date is 1988. Any reader following the citation to ACM Digital Library or WorldCat will encounter the 1988 entry. The "(2nd ed., 1997)" notation in the reference already signals two-edition awareness; correcting 1992 to 1988 brings the citation into alignment with standard practice.

The Geng et al. quotation in Issue 2 is the more load-bearing correction. The essay frames a paraphrase as "Their exact framing:" with italic rendering. The semantic content is accurate — the paper's finding supports the essay's use of it — but presenting a condensed paraphrase as a direct quotation is a citation integrity issue. The fix is a one-word change ("their framing" or "paraphrased") or substitution of the actual abstract language. Neither correction alters the essay's argument.

The two P3 items (Tsui "et al." and Jaroslawicz "et al.") are housekeeping. The Tsui case is the more important of the two since using "et al." for a single-author paper is strictly incorrect, but it does not affect the essay's claims.

All three in-cycle quotes (Spike S4 conclusion, orchestrator self-observation, "know it when they see it") verify exactly against the evidence trail. No fabricated sources were found. No external verification failures occurred.

**The two P2 issues should be corrected before downstream phases proceed.** They do not undermine the essay's argument, but citation integrity at the P2 level is a conformance standard for an essay whose core argument is about the gap between specification and execution.
