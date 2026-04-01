# Argument Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/010-code-review-as-epistemic-practice.md
**Evidence trail:** /Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md
**Date:** 2026-03-31

---

## Summary

- **Argument chains mapped:** 9
- **Issues found:** 9 (0 P1, 5 P2, 4 P3)

### Argument chains mapped

1. Defect finding is the minority outcome of review (Bacchelli & Bird data → expectations/outcomes gap claim)
2. Comprehension, not judgment, is the bottleneck in review (Bacchelli & Bird → orientation section of CRDM)
3. CRDM phases (orientation 27%, analysis 73%) imply current tooling is structurally wrong (CRDM study → tooling critique)
4. Senior reviewer behaviors cannot be reduced to checklists (practitioner accounts → judgment-over-checklist claim)
5. Quantitative constraints limit effective review (SmartBear/Cisco → cognitive limits claim)
6. AI-assisted review creates structural conditions for human disengagement (research log synthesis → deskilling risk section)
7. The review bottleneck is diagnostic, not pathological (opacity bottleneck argument)
8. Success criterion: reviewer can discuss code without AI assistance afterward (practitioner litmus test → Feynman analogy)
9. Two operating modes are sufficient and necessary for an RDD-aware review skill (corpus-grounded vs. context-reconstructive)

---

## Issues

### P1 — Must Fix

No P1 issues found. Every major conclusion is traceable to named evidence in the research log, internal sections are consistent with one another, and no section directly contradicts another.

---

### P2 — Should Fix

**Issue P2-1: The ~12.5% figure is applied as a universal claim without stating its scope**

- **Location:** Abstract; "The Expectations/Outcomes Gap" section (paragraph 1); Conclusion (paragraph 1); research log Q1 and Q2
- **Claim:** "Defect-related comments comprise roughly one-eighth of all review discussion." Used to anchor the entire thesis that defect-finding is a minority outcome.
- **Evidence gap:** The 12.5% figure derives from a single study (Bacchelli & Bird, ICSE 2013) conducted at one company (Microsoft) in one era (2013). The essay presents it as the representative finding without noting its organizational, temporal, or methodological scope. A safety-critical codebase, a startup, or a mature open-source project likely has a different comment distribution. The research log itself does not interrogate generalizability.
- **Recommendation:** Qualify the claim: "In Bacchelli and Bird's Microsoft study, defect-related comments comprised roughly one-eighth of all review discussion. The finding has been widely cited and is consistent with practitioner experience, but it reflects a specific organizational context." One sentence of softening preserves the rhetorical force while accurately representing what the data shows.

---

**Issue P2-2: The CRDM percentage split (27% / 73%) is presented as a fixed empirical quantity without uncertainty**

- **Location:** "The Cognitive Structure of Review" section (paragraphs 2 and 3)
- **Claim:** "Orientation accounts for approximately 27% of cognitive effort. Analysis accounts for approximately 73%."
- **Evidence gap:** These figures come from a 2025 think-aloud study. Think-aloud methodologies produce data about verbalized cognition, not total cognitive effort — silent cognitive work is invisible to the recorder. The percentages are presented as stable empirical quantities ("accounts for approximately X%"), but their derivation from a single think-aloud protocol means they are illustrative, not precisely measured. The research log summarizes the study without noting this methodological caveat.
- **Recommendation:** Add a brief qualifier: "A 2025 think-aloud study estimated orientation at roughly 27% of verbalized cognitive effort and analysis at roughly 73%." The "verbalized" qualifier is accurate and does not undermine the argument's substance — the point about orientation being underserved by tooling stands regardless of the exact split.

---

**Issue P2-3: The deskilling mechanism is supported by analogy to medical literature, not direct software engineering evidence**

- **Location:** "AI-Assisted Review and the Deskilling Risk" section, "The deskilling spiral" paragraph
- **Claim:** "Over-reliance on AI review erodes the human judgment it ostensibly supports. Medical literature on AI-induced deskilling documents the parallel."
- **Evidence gap:** The essay invokes a cross-domain analogy rather than direct evidence that code review skill atrophies under AI-assisted review workflows. The analogy is plausible, but the mechanism of deskilling in medical diagnosis (reduced exposure to raw diagnostic signals) may not transfer cleanly to code review (where exposure to raw code continues even when AI tools are used). No software-engineering-specific deskilling data is cited, and the research log acknowledges the medical parallel without citing specific software evidence either.
- **Recommendation:** The claim can be preserved, but the epistemic status should be made explicit: "By analogy to AI-induced deskilling documented in medical literature, a similar erosion of judgment may occur in code review — though direct longitudinal evidence in software engineering contexts is not yet available." This is more precise and actually strengthens the essay by showing the author understands the limits of the analogy.

---

**Issue P2-4: The "Ego Effect" finding is included but its connection to the essay's central argument is unstated**

- **Location:** "The Quantitative Constraints" section, bullet list
- **Claim:** "The Ego Effect. Developers write better code when they know it will be reviewed. Even spot-checking 20-33% of code triggered this improvement."
- **Evidence gap:** The Ego Effect is mentioned but its role in the argument is not drawn out. The essay's thesis concerns epistemic value for the reviewer. The Ego Effect concerns code quality for the author before review happens. These are consistent but distinct mechanisms, and the essay does not explain why the Ego Effect is relevant to the claim being built. As listed, it reads as an interesting data point without argumentative function.
- **Recommendation:** Either remove it or add a connecting sentence: "The Ego Effect extends the epistemic function of review backward in time — the discipline of knowing one's code will be read produces better code than would otherwise be written, independent of any specific feedback." This makes the finding load-bearing rather than decorative.

---

**Issue P2-5: The success criterion is presented as the practitioner's articulation but not evaluated against counterarguments**

- **Location:** "The Success Criterion" section
- **Claim:** "After completing a review, the reviewer should be able to discuss the code changes without AI assistance."
- **Evidence gap:** This criterion is attributed to "the practitioner" (identified in the research log as the project author). It is treated as a well-grounded conclusion rather than a design choice that has tradeoffs. The criterion is demanding — it may exclude legitimate, productive review activities where a reviewer flags a valid concern without being able to fully articulate the surrounding context. The criterion also assumes one-person ownership of understanding, which may not fit distributed review on large teams. No competing success criteria are considered.
- **Recommendation:** Acknowledge the criterion's demands explicitly: "This criterion is deliberately high. A reviewer might flag a genuine security concern by pattern recognition without being able to fully articulate its context — and that flag still has value. The criterion does not require exhaustive understanding; it requires that the reviewer has a genuine mental model of the changes, sufficient to reason about them without AI mediation." This defends the criterion while accurately scoping it.

---

### P3 — Consider

**Issue P3-1: Terminology — "epistemic" is used as a technical term but defined only implicitly**

- **Location:** Title; Abstract; Conclusion; throughout
- **Claim:** Code review is "primarily an epistemic activity" and an "epistemic practice."
- **Issue:** The word "epistemic" carries philosophical freight (relating to knowledge and justified belief) that the essay never explicitly unpacks. The essay's usage is consistent — it means "knowledge-producing" — but a reader who encounters the term without a philosophy background may conflate "epistemic" with "subjective" or "theoretical," weakening the persuasive impact. The research log does not use the term at all; it appears to be introduced at the synthesis stage.
- **Recommendation:** Add a one-sentence gloss on first use: "Code review is primarily an epistemic activity — a mechanism for producing and transferring knowledge within a team." The gloss is already implicit in the surrounding text; making it explicit costs one sentence and clarifies the argument's central concept for all readers.

---

**Issue P3-2: "Reviewer-as-passthrough" anti-pattern is named but the naming is not consistent**

- **Location:** "AI-Assisted Review and the Deskilling Risk" (final paragraph); "The Agent's Role" (opening sentence)
- **Claim:** The named anti-pattern is the "reviewer-as-passthrough."
- **Issue:** The essay introduces this term at the end of the deskilling section ("The pattern that emerges is the reviewer-as-passthrough"), then references it in the next section ("If the reviewer-as-passthrough is the anti-pattern..."). This is the essay's only explicit named anti-pattern, and it is effective — but it arrives late. The "broken pipeline" described in the research log (Q3) uses different language ("Developer → AI generates code → AI reviews code → Developer skims AI summary → Merge"). The essay's final paragraph of the deskilling section names the anti-pattern correctly; consider whether it should be introduced earlier and used as a throughline.
- **Recommendation:** Consider naming the anti-pattern when the broken pipeline is first described (opening of the deskilling section), then returning to it by name at the end of that section and in "The Agent's Role." This is a structural tightening, not a logical fix, but it would make the argument easier to follow.

---

**Issue P3-3: The "One strategic focus per review" finding from Google is present in the research log but absent from the essay**

- **Location:** Research log Q2 (Google practices), "What Senior Reviewers Actually Do" section
- **Issue:** The research log documents: "One strategic focus per review: Scale, failure modes, maintainability, or architecture — not all at once." This finding — that senior reviewers scope their analytical attention — is directly relevant to both the cognitive limits argument (respecting attention budgets) and the two-operating-modes design. It does not appear in the essay. Its absence is not a logical error, but it is a gap between the evidence trail and the synthesis.
- **Recommendation:** Either incorporate it as a fifth bullet in "What Senior Reviewers Actually Do" or integrate it into the quantitative constraints section as a behavioral corollary of the attention limit finding.

---

**Issue P3-4: The "Self-Auditing Fallacy" is present in the research log but not surfaced in the essay**

- **Location:** Research log Q3 ("The Self-Auditing Fallacy"); "AI-Assisted Review and the Deskilling Risk" section
- **Issue:** The research log identifies a specific named failure mode — having the same AI system write and review code, described as "an auditor preparing the books." This is a distinct and vivid argument that supports the essay's deskilling section. The essay describes the dysfunctional pipeline (AI generates, AI reviews) but does not name this as a structural audit failure or use the auditor analogy.
- **Recommendation:** The auditor analogy from the research log is stronger than the current framing. Consider adding it to the deskilling section: "Having the same system generate and review code is structurally equivalent to having an auditor prepare the books — the independence that makes the review meaningful is absent by design." This is not a logical repair but a missed rhetorical opportunity grounded in the evidence trail.
