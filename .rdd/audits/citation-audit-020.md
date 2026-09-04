# Citation Audit Report

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md`
**Date:** 2026-05-22
**Round:** R1

## Summary

- **Total references checked:** 31 (17 external academic references, 14 internal-corpus references)
- **Verified:** 29
- **Issues found:** 5 (1 P1, 3 P2, 1 P3)

---

## Issues

### P1 — Must Fix

#### P1-1: Rukmono et al. — wrong authors in the lit-review that the Essay-Outline delegates to

- **Location:** Essay-Outline References section, Rukmono entry: "*(per Cycle 020 Loop 3 lit-review; specific publication details per the lit-review document)*"; also `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md` §References and Sources table (rows 9 and the in-text citation throughout).
- **Claim:** The Loop 3 lit-review cites the Rukmono et al. paper as having five authors: "Rukmono, S.A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M.R.V." — i.e., it lists "Floris Pex" (as "Pex, F.") as a co-author.
- **Finding:** The actual paper (arXiv:2503.08628) has four authors: Satrio Adi Rukmono, Filip Zamfirov, Lina Ochoa, and Michel R.V. Chaudron. There is no "Floris Pex" on the paper. The "Pex, F." attribution in the lit-review is a fabricated author name. The paper is a preprint; the lit-review notes it is "forthcoming in *Empirical Software Engineering*" — this is unconfirmed (no accepted/published version was locatable at time of audit; arXiv listing does not confirm journal acceptance).
- **Recommendation:** Correct the author list in the lit-review to: Rukmono, S.A., Zamfirov, F., Ochoa, L., & Chaudron, M.R.V. Remove "Pex, F." The Essay-Outline's Rukmono entry should carry the corrected author list rather than deferring to the lit-review. The "forthcoming in *Empirical Software Engineering*" venue claim should be downgraded to "arXiv preprint" until journal acceptance is confirmed.

---

### P2 — Should Fix

#### P2-1: Gupta et al. (2026) — wrong first-author initial

- **Location:** Essay-Outline References section: "Gupta, S., Dhar, A., Feitosa, D., & Vaidhyanathan, K. (2026). Context strategies for automated ADR generation."
- **Claim:** The first author's given-name initial is listed as "S." (i.e., "S. Gupta").
- **Finding:** The actual first author is Aviral Gupta (initial: A.). The paper arXiv:2604.03826 lists the authors as: Aviral Gupta, Rudra Dhar, Daniel Feitosa, Karthik Vaidhyanathan. The correct citation is "Gupta, A., Dhar, R., Feitosa, D., & Vaidhyanathan, K." The lit-review (`lit-review-020-substrate-and-surface-separation.md` §Q6, Finding 6.5 and §References) correctly gives "Aviral Gupta" — the error is in the Essay-Outline's References section only. The substantive finding cited (recency window of 3–5 prior records) is accurately reported.
- **Recommendation:** Update the Essay-Outline References entry to: "Gupta, A., Dhar, R., Feitosa, D., & Vaidhyanathan, K. (2026). Context matters: evaluating context strategies for automated ADR generation using LLMs. *arXiv:2604.03826*."

#### P2-2: Volpini et al. (2026) — partial author attribution

- **Location:** Essay-Outline References section: "Volpini, L., et al. (2026). Navigation affordances in JSON-LD for retrieval-augmented generation. *arXiv:2603.10700*."
- **Claim:** The entry uses "et al." to abbreviate co-authors; it also characterizes the paper as being about "navigation affordances in JSON-LD."
- **Finding:** The paper exists at arXiv:2603.10700 and the +29.6% retrieval-accuracy finding is accurately cited. The full author list is: Andrea Volpini, Elie Raad, Beatrice Gamba, David Riccitelli — four authors, which is short enough that "et al." is a departure from standard practice (APA and most style guides use "et al." for 6+ authors on first citation, or 3+ after first citation; with four authors the convention is to name all four). The paper title in the References entry ("Navigation affordances in JSON-LD for retrieval-augmented generation") is a paraphrase, not the actual title. The actual title is "Structured Linked Data as a Memory Layer for Agent-Orchestrated Retrieval." The lit-review (`lit-review-020-substrate-and-surface-separation.md` §References) correctly gives the full author list and the accurate title.
- **Recommendation:** Update the Essay-Outline References entry to: "Volpini, A., Raad, E., Gamba, B., & Riccitelli, D. (2026). Structured linked data as a memory layer for agent-orchestrated retrieval. *arXiv:2603.10700*." Note also that the lead author's given name is "Andrea" not "L." — the "L." initial in the Essay-Outline entry does not match any author on the paper.

#### P2-3: ADR-072 — wrong filename and wrong content description

- **Location:** Essay-Outline body (Sections 5, 6, and 9; C5 chain; E5.1.1) and References section: "adr-072-centered-vs-infrastructure-distinction.md". Multiple in-body citations describe ADR-072 as the "Centered-vs-Infrastructure distinction" that "names two artifact categories."
- **Claim:** ADR-072 is described as committing a "Centered-vs-Infrastructure distinction" naming two artifact categories.
- **Finding:** The actual file is `docs/decisions/adr-072-cycle-shape-declaration.md`. Its title is "ADR-072: Cycle Shape Declaration — Skipped Phases and Paused State." It addresses the structural representation of skipped phases in mini-cycles and paused-state detection for the Stop hook — not an audience-bifurcation or centered-vs-infrastructure architectural distinction. The "centered-vs-infrastructure" framing mentioned in ADR-083's context and in ADR-085's context refers back to ADR-064 (the Stop hook compound check ADR), not to ADR-072. The lineage claim in C5 that "ADR-072 named the centered-vs-infrastructure distinction" cannot be verified against the actual ADR-072 file as it exists in the corpus.
- **Recommendation:** Identify the correct ADR that establishes the "centered-vs-infrastructure" distinction (appears to be referenced in ADR-083 context as "ADR-064's centered-vs-infrastructure framing" and in ADR-085 context). Update all Essay-Outline citations of "ADR-072 (Centered-vs-Infrastructure distinction)" to the correct ADR. If the intended ADR is ADR-064, update accordingly. This is a material error because C5's lineage argument depends on naming the correct prior ADRs in the audience-bifurcation chain.

---

### P3 — Consider

#### P3-1: Garousi citation collapses two papers with different author lists into one entry

- **Location:** Essay-Outline References section: "Garousi, G., Garousi-Yusifoğlu, V., Ruhe, G., Zhi, J., Moussavi, M., & Smith, B. (2013, 2014). Usage and usefulness of technical software documentation: An industrial case study. *Information and Software Technology* (combined references for the 2013 and 2014 paper series)."
- **Claim:** A combined entry is used for both the 2013 EASE conference paper and the 2014 Information and Software Technology journal paper.
- **Finding:** Both papers exist. The 2013 EASE paper ("Evaluating usage and quality of technical software documentation: an empirical study") has a shorter author list (Garousi, G., Garousi, V., Moussavi, M., Ruhe, G., Smith, B.) that does not include "Zhi, J." or "Garousi-Yusifoğlu." The 2014 IST journal paper ("Usage and usefulness of technical software documentation: an industrial case study") matches the longer combined author list. The combined entry's author string accurately reflects the IST 2014 paper; the 2013 EASE paper has a slightly different author set. The substantive findings cited from these papers are accurately represented. The (2013, 2014) dating convention is non-standard.
- **Recommendation:** Split into two separate entries or note more precisely which findings come from which paper. The combined entry is defensible as a shorthand for a two-paper series, but downstream readers cannot distinguish which findings come from which paper.

---

## Verified References

The following were checked and verified:

**External academic references — verified:**
- Sweller (1988): confirmed in *Cognitive Science*, 12(2), 257–285. Title, journal, volume, and pages correct.
- Sweller (2010): confirmed in *Educational Psychology Review*, 22(2), 123–138. Attribution and findings correct.
- Chandler & Sweller (1992): confirmed in *British Journal of Educational Psychology*, 62, 233–246. Attribution and split-attention finding correct. Experiment 2 (separated text segments) claim is consistent with the paper's scope.
- van Merriënboer & Kester (2008): confirmed in *Handbook of Research on Educational Communications and Technology*, 3rd ed. Attribution and pre-cached structural map claim verified.
- van Merriënboer & Sweller (2005): confirmed in *Educational Psychology Review*, 17(2), 147–177. Attribution correct.
- Shneiderman (1996): confirmed in *Proceedings of IEEE Symposium on Visual Languages 1996*, pp. 336–343. "Overview first, zoom and filter, details on demand" mantra accurately cited.
- Cockburn, Karlson, & Bederson (2008): confirmed in *ACM Computing Surveys*, 41(1), Article 2. Focus+context family and split-attention cost findings accurately cited.
- Tufte (1983) and Tufte (1990): both established works, publication details correct.
- Lethbridge, Singer, & Forward (2003): confirmed in *IEEE Software*, 20(6), 35–39. Task-triggered documentation usage finding accurately cited.
- Forward & Lethbridge (2002): confirmed in *Proceedings of the 2002 ACM Symposium on Document Engineering*, pp. 26–33. Historical-rationale value of outdated documentation finding accurately cited.
- Dagenais et al. (2010): confirmed in *ICSE 2010*, pp. 275–284. Author list (Dagenais, Ossher, Bellamy, Robillard, de Vries) and newcomer landscape-map finding correct.
- Steinmacher et al. (2015): The Essay-Outline cites the CSCW 2015 paper ("Social barriers faced by newcomers placing their first contribution in open source software projects," *Proceedings of CSCW 2015*, pp. 1379–1392) — paper exists with correct page numbers. The claim about newcomers needing overview-before-detail is consistent with the paper's barriers framework.
- GraphReader (EMNLP 2024): arXiv:2406.14550, confirmed as *Findings of EMNLP 2024*. The claim that graph-structured navigation outperforms GPT-4-128k on long-context tasks with a 4k window is accurately cited (the paper reports consistent outperformance across 16k–256k context lengths).
- Volpini et al. (2026): arXiv:2603.10700 exists; +29.6% retrieval accuracy over plain text is accurately cited (verified from abstract and search result). The "gain mechanism is navigational scaffolding more than schema richness" characterization is consistent with the paper's finding that the enhanced entity-page format (with breadcrumbs and navigation affordances) drives most of the gain, not JSON-LD alone.
- Gupta et al. (2026): arXiv:2604.03826 exists; recency window of 3–5 prior ADR records finding is accurately cited.
- Brooks (1995): *The Mythical Man-Month*, Anniversary edition, Addison-Wesley — established work, correctly cited.

**Internal corpus references — verified (files exist and content matches cited descriptions):**
- `docs/decisions/adr-067-three-tier-enforcement-classification.md`: exists; "Skill-Structure Layer / Harness Layer / User-Tooling Layer taxonomy" description matches file content.
- `docs/decisions/adr-082-question-isolation-protocol.md`: exists; "question-isolation discipline — recorded as research input, bracketed at entry" description matches.
- `docs/decisions/adr-083-cognitive-economy-criterion.md`: exists; "Cognitive Economy as Outcome Test for human-facing artifacts" description matches file content.
- `docs/decisions/adr-084-agent-context-content-placement.md`: exists; "Agent context content-placement patterns (Patterns A–C)" description matches.
- `docs/decisions/adr-085-rdd-infrastructure-relocation.md`: exists; "RDD infrastructure relocation to `.rdd/`" description matches.
- `docs/decisions/adr-087-validation-spikes-in-research.md`: exists; "spike-or-no-spike at Step 4c" description is consistent.
- `docs/decisions/adr-092-essay-outline-as-research-artifact.md`: exists; "Essay-Outline as RESEARCH artifact form" description matches.
- `docs/decisions/adr-093-argument-auditor-graph-traversal.md`: exists.
- `docs/decisions/adr-094-audit-round-count-convergence-saturation.md`: exists; "default 3 rounds" and Convergence-Saturation Signal description match.
- `docs/decisions/adr-095-agent-outcome-test.md`: exists; "Agent Outcome Test for agent-facing artifact admissibility (parallel to ADR-083)" description matches.
- `docs/decisions/adr-096-research-patch-switching-criterion.md`: exists.
- `docs/decisions/adr-097-empirical-grounding-filter-at-decide.md`: exists; "Empirical-Grounding Filter at DECIDE," "four grounding-mechanism paths," "Conditional Acceptance / adr-deferred-" description matches file content. ADR-097 Target 2 "Kitchen-Sink Mechanism vs. Outcome discriminating-criterion" claim is consistent with the file's Target 2 section.
- `docs/decisions/adr-098-methodology-audit-gap-deferrals.md`: exists; "FF1 + FF3 named-deferrals with two-direction (harm + reliance) graduation triggers" description matches.
- `docs/decisions/adr-008-forward-and-backward-operating-modes.md`: exists.
- `docs/essays/essay-outline-018-does-rdd-over-engineer.md`: exists (file is named correctly; the Essay-Outline's Prior-corpus reference path matches).
- `docs/essays/research-logs/research-log.md`: exists; all §Loop and §Step section references checked against actual document — Loop 1.1, 1.2, 1.3, 1.5, 1.7, 3.4, 5.2, 5.3 (Constraints 1–6) all present in file with content matching cited descriptions.
- `docs/essays/research-logs/lit-review-020-substrate-and-surface-separation.md`: exists; §Q4 and §Q5 sections present with content matching citations.
- `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md`: exists.
- `docs/essays/research-logs/spike-020-substrate-surface-prototype.md`: exists; 49% compression finding, "surrounding records" footer pattern, six constraints all present and match cited descriptions.

---

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** NOT TRIGGERED

- Round number: R1
- P1 count this round: 1 (P1-1: fabricated author "Pex, F." in Rukmono et al. attribution in the supporting lit-review)
- P2 count this round (new, non-carry-over): 3 (P2-1: wrong initial for Gupta lead author; P2-2: wrong title and partial attribution for Volpini et al.; P2-3: ADR-072 wrong filename and wrong content description)
- New framings or claim-scope expansions: none
- Recommendation: CONTINUE to R2

*The P1 finding (fabricated author name in supporting lit-review) prevents signal trigger per condition 1. The ADR-072 mismatch (P2-3) also warrants a round of verification once the correct ADR number is identified, since C5's lineage argument depends on the attribution chain being accurate.*

*Single-purpose re-audits (dispatched per the re-audit-after-revision rule) omit this section. Form-change events reset the round-count baseline — the first audit on a new form is its R1.*
