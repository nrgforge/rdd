# Citation Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/010-code-review-as-epistemic-practice.md
**Date:** 2026-03-31

## Summary

- **Total references checked:** 8 (6 listed sources + 2 embedded claims with distinct attributions)
- **Verified:** 6
- **Issues found:** 4

---

## Verified Sources

The following sources were confirmed to exist with accurate attribution and publication details:

1. **Bacchelli & Bird (2013).** Title, authors, venue (ICSE 2013), and ACM DOI all confirmed. The paper classifies 570 review comments from Microsoft CodeFlow. The "one-eighth" / ~12.5% defect figure is accurate per the paper's category breakdown, where defects ranked fourth behind code improvements, knowledge transfer, and team awareness. Confirmed.

2. **CRDM Model (2025).** The paper "Code review as decision-making — building a cognitive model from the questions asked during code review" exists, is published in Empirical Software Engineering (Springer), and the DOI matches. Authors: Lo Gullstrand Heander, Emma Söderberg, and Christofer Rydenfält. The 27%/73% orientation/analysis split is confirmed verbatim in the paper. The ethnographic think-aloud framing is confirmed. The RPD connection is confirmed. Confirmed.

3. **SmartBear/Cisco case study.** The PDF at the cited URL exists. The 2,500-review, 3.2-million-LOC, 10-month study scope is confirmed. The 200–400 LOC optimal size, sub-500 LOC/hour speed, and 60–90 minute attention window are confirmed. The Ego Effect and 20–33% spot-check finding are confirmed. Confirmed.

4. **Google Engineering Practices — Code Review.** URL confirmed live and accurate. Confirmed.

5. **Greptile (2025). "There is an AI Code Review Bubble."** Post confirmed to exist at the cited URL. Confirmed as existing source.

6. **Klein, G. (1998). Sources of Power.** Book confirmed: MIT Press, 1998. RPD model confirmed as originating from fieldwork with firefighters, military commanders, and emergency first responders (not specifically "emergency physicians" as a primary group, but the characterisation is a reasonable shorthand). Confirmed with minor caveat noted below.

---

## Issues

### P1 — Must Fix

**Issue 1: Data misattributed to OX Security and Greptile; actual source is CodeRabbit**

- **Location:** "The AI-Assisted Review and the Deskilling Risk" section; source list entry "OX Security analysis of AI-authored pull requests (cited via Greptile and Builder.io)"
- **Claim:** "Data from one analysis of 300+ repositories found that AI-authored pull requests contained an average of 10.83 issues versus 6.45 for human-written code, with security vulnerabilities appearing 1.5 to 2 times more frequently."
- **Finding:** The 10.83 vs. 6.45 figures come from CodeRabbit's "State of AI vs. Human Code Generation" report (December 2025), which examined 470 open-source GitHub pull requests (320 AI-co-authored, 150 human-only) — not "300+ repositories." OX Security is not the source of these figures. Fetching the Greptile "AI Code Review Bubble" post confirmed it contains no mention of OX Security, Builder.io, or these specific statistics; it is an opinion essay about market positioning with no external citations. The "Builder.io" attribution cannot be verified as a source for this data at all. The CodeRabbit report is the traceable origin.
- **Additionally:** The security vulnerability multiplier in the essay ("1.5 to 2 times") does not match CodeRabbit's reported figure. CodeRabbit found security vulnerabilities "up to 2.74×" higher in AI-authored code, with specific vulnerability types ranging from 1.82× to 2.74×. The "1.5–2×" range is not the figure from the actual source.
- **Recommendation:** Replace the source attribution with CodeRabbit's report directly. Correct the repository/PR count to "470 pull requests (320 AI-co-authored, 150 human-only)." Correct the security vulnerability multiplier to match the report's finding (up to 2.74× for specific vulnerability types; ~1.7× overall issue rate). Remove the OX Security and Builder.io attributions unless a separate OX Security study with those figures can be independently located. The corrected source entry should read: CodeRabbit (2025). State of AI vs. Human Code Generation Report. https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report

---

### P2 — Should Fix

**Issue 2: CRDM paper publication date is ambiguous; the essay's "2025" label is potentially misleading**

- **Location:** "The Cognitive Structure of Review" section; source list entry "CRDM Model (2025). Code Review as Decision-Making. Empirical Software Engineering."
- **Claim:** "A 2025 ethnographic think-aloud study..."
- **Finding:** The paper was submitted to arXiv in July 2025. The Springer journal article at the cited DOI is dated 2025 in its URL slug, but the Zenodo replication package gives a formal publication date of January 3, 2026. The Springer page returns a redirect rather than a stable date. The arXiv preprint is definitively 2025. Whether the journal article of record falls in 2025 or 2026 could not be confirmed with certainty.
- **Recommendation:** Verify the Springer publication year directly. If the journal record is 2026, update the in-text reference and source entry accordingly. As a safe fallback, cite the arXiv preprint: arXiv:2507.09637 (submitted July 2025).

**Issue 3: The RPD model population description overstates the Klein source**

- **Location:** "The Cognitive Structure of Review" section: "the same framework used to describe decision-making by firefighters, military commanders, and emergency physicians."
- **Finding:** Klein's original RPD fieldwork (Sources of Power, 1998) was conducted primarily with fireground commanders and military commanders. Emergency medical technicians and paramedics appear in the extended literature. "Emergency physicians" as a distinct group is not a primary RPD population in Klein's book; the phrase conflates the paramedic/EMT setting with the physician role. The characterisation is a defensible shorthand but is imprecise.
- **Recommendation:** Change "emergency physicians" to "emergency medical technicians" or "paramedics" to match Klein's actual research populations, or broaden to "emergency responders."

---

### P3 — Consider

**Issue 4: The SmartBear/Cisco "85% individuals / 4% group meetings" finding is cited in the research log but omitted from the essay**

- **Location:** Research log (research-log.md, Question 2 findings); not present in the essay itself.
- **Claim:** The research log records "Individuals found up to 85% of defects; group meetings added only 4%." This finding does not appear in the essay's SmartBear/Cisco paragraph.
- **Finding:** The finding is verifiable and consistent with the SmartBear case study material. Its omission from the essay is a scoping choice, not an error.
- **Recommendation:** No action required. Noted for completeness in case a future revision of the essay incorporates this finding — it is a legitimate and verifiable claim from the same source.
