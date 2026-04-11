# Citation Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/011-building-with-understanding.md
**Evidence trail:** /Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md
**Date:** 2026-04-02

---

## Summary

- **Total references checked:** 32
- **Verified:** 29
- **Issues found:** 6 (1 P1, 3 P2, 2 P3)

---

## Issues

### P1 — Must Fix

**Issue 1**

- **Location:** Sources list, line 208
- **Claim:** `Willison, S. "Not all AI-assisted programming is vibe coding." simonwillison.net, May 2025.`
- **Finding:** The article was published on **19 March 2025**, not May 2025. Confirmed directly from simonwillison.net/2025/Mar/19/vibe-coding/. The article also has a Substack cross-post dated 2025-03-16.
- **Recommendation:** Correct the date: `Willison, S. "Not all AI-assisted programming is vibe coding (but vibe coding rocks)." simonwillison.net, March 2025.`

---

### P2 — Should Fix

**Issue 2**

- **Location:** Section 5 (Red, Green, Refactor — Reclaimed), paragraph 1; Section 6 (The Composable Skill Architecture > Refactor), paragraph 1; Sources list, line 232
- **Claim:** `Fowler's catalog (22 smells, 66 techniques, organized problem-first on refactoring.guru)`
- **Finding:** The smell count of 22 is correct (verified by fetching refactoring.guru/refactoring/smells). The technique count of **66 is not confirmed**. Direct fetches of refactoring.guru return counts of 61 (techniques page) and 71 (catalog page), depending on which page is read and how sub-items are counted. The number 66 appears in neither the live site nor any third-party summary found. The research log (Question 4) does not cite this figure; it appears to have been introduced during essay drafting without a verified source.
- **Recommendation:** Either verify the exact count against the live catalog and update accordingly, or soften to "over 60 techniques" to avoid a specific unverifiable number. The "22 smells" figure is accurate and can remain.

**Issue 3**

- **Location:** Section 3 (Productive Resistance), paragraph on Epistemic Actions
- **Claim:** `Counterintuitively, Neth & Payne (2002) found that epistemic action use *increases with expertise*. Experts externalize more, not less.`
- **Finding:** The Neth & Payne (2002) paper — "Thinking by Doing? Epistemic Actions in the Tower of Hanoi," published in the Proceedings of the 24th Annual Conference of the Cognitive Science Society — does not study expertise levels. Its findings are about within-task performance: participants benefited from epistemic actions for **acting-to-plan** (reducing per-trial moves), but the paper found no evidence for **acting-to-learn** (improving across trials). The paper does not compare novice vs. expert use of epistemic actions and does not conclude that expertise increases epistemic action use. This claim is not supported by the cited source. The "experts externalize more" finding is a real phenomenon in the literature (found in other works on distributed cognition and expert-novice comparisons) but is not the finding of Neth & Payne (2002).
- **Recommendation:** Either remove the Neth & Payne citation from this specific claim and replace it with a source that actually studies expertise and epistemic action use, or replace the claim with an accurate summary of what Neth & Payne did find: "Neth & Payne (2002) found that epistemic actions improve within-task performance — participants who could try move sequences without committing reduced their overall move count."

**Issue 4**

- **Location:** Section 3 (Productive Resistance), paragraph on Productive Resistance > Debugging as Learning
- **Claim:** `Weimer et al. (IEEE TSE 2024) provide the first neurally-grounded model showing debugging stages are distinct cognitive modes, each forcing knowledge acquisition.`
- **Finding:** The paper exists and is correctly cited (published in IEEE Transactions on Software Engineering, 2024, authors include Hu, Santiesteban, Endres, and Weimer). The paper's full title is "Towards a Cognitive Model of Dynamic Debugging: Does Identifier Construction Matter?" It does propose the first neurally-justified cognitive model of debugging and shows that debugging stages are neurally and behaviorally distinct. However, the characterization "each forcing knowledge acquisition" is not a finding of the paper. The paper studies how identifier construction (variable naming quality) affects neural activity during debugging using fNIRS. It does not conclude that distinct cognitive modes individually force knowledge acquisition — that is an interpretive extension added by the essay. The core finding (distinct cognitive stages, neurally justified) is accurate; "each forcing knowledge acquisition" is not.
- **Recommendation:** Remove "each forcing knowledge acquisition" from the description. Replace with: `Weimer et al. (IEEE TSE 2024) provide the first neurally-grounded model showing debugging stages (Task Comprehension, Fault Localization, Code Editing, Compiling, Output Comprehension) are neurally and behaviorally distinct.`

---

### P3 — Consider

**Issue 5**

- **Location:** Section 3 (Productive Resistance), paragraph on Constructionism
- **Claim:** `Papert's students called it "hard fun" — fun because it was hard, not in spite of being hard.`
- **Finding:** "Hard fun" was coined not by Papert's students collectively but originates from a single first-grader in a San Jose school in the mid-1980s, who said "It's fun. It's hard. It's Logo." Papert then adopted and popularized the term. The essay's attribution to "Papert's students" is functionally accurate (a student said it) but implies a broader collective origin than the documented source suggests. Papert's own article titled "Hard Fun" (papert.org/articles/HardFun.html) describes this specific origin.
- **Recommendation:** Minor adjustment for precision: `A student called it "hard fun" — Papert adopted the phrase because it named something real: the fun was because it was hard, not in spite of it.` This is low priority but worth correcting if precision matters for the essay's audience.

**Issue 6**

- **Location:** Sources list, line 209
- **Claim:** `Osmani, A. "Vibe Coding is not the Same as AI-Assisted Engineering." medium.com/@addyosmani.`
- **Finding:** The article exists and is correctly attributed. The Osmani quote used in the essay body ("produce code without understanding it, ship features without learning why certain patterns exist") is presented as a direct attributed quote but is a slight paraphrase of the article's actual sentences: "You can produce code without understanding it. You can ship features without learning why certain patterns exist." The meaning is identical and the attribution is correct; the essay frames these as reported speech (Osmani identifies the structural risk) rather than a quotation block, so this is a very minor rendering issue. No date is given in the sources list for this article; it was published November 2025.
- **Recommendation:** Add the publication date for completeness: `Osmani, A. "Vibe Coding is not the Same as AI-Assisted Engineering." medium.com/@addyosmani, November 2025.`

---

## Verified References (no issues)

The following were verified as existing, correctly attributed, and accurately described:

| Reference | Verification Status |
|-----------|-------------------|
| Willison golden rule quote (body text) | Verified — exact quote confirmed at simonwillison.net/2025/Mar/19/vibe-coding/ |
| Osmani, "Agentic Engineering" — "disproportionately benefit senior engineers" | Verified — exact phrasing confirmed at addyosmani.com/blog/agentic-engineering/ |
| Osmani, "Comprehension Debt" — March 2026 | Verified — addyosmani.com/blog/comprehension-debt/ exists and is dated March 2026 |
| TDAD arxiv 2603.17973 — 9.94% regressions, 6.08% baseline | Verified — paper exists, figures confirmed |
| GitClear 2025 — 211M lines, 2020-2024, Google/Microsoft/Meta repos, refactoring 25%→<10%, copy/paste 8.3%→12.3%, 2024 first year copy/paste exceeded refactoring | Verified — gitclear.com/ai_assistant_code_quality_2025_research |
| arxiv 2603.28592 — 304,362 commits, 6,275 repos, 484,606 issues, 89.1% code smells, 24.2% survived | Verified — all figures confirmed by fetching arxiv.org/html/2603.28592v1 |
| Ox Security "Army of Juniors" — 300+ projects, Avoidance of Refactors 80-90%, Over-Specification 80-90%, Bugs Déjà-Vu 70-80%, October 2025 | Verified — ox.security report exists with these figures |
| Anthropic study — AI group 50% vs manual coders 67% on comprehension quiz, largest gap on debugging questions | Verified — confirmed at anthropic.com/research/AI-assistance-coding-skills and InfoQ Feb 2026 |
| arxiv 2510.03029 — "Investigating The Smells of LLM Generated Code" — +63.34% average smell increase, implementation smells 73.35% | Verified — paper exists, figures confirmed |
| Papert, Mindstorms, Basic Books, 1980 | Verified |
| Papert, "Situating Constructionism," in Harel & Papert (eds.), Constructionism, Ablex, 1991 | Verified |
| Papert fractions example — children who wrote educational software about fractions learned more deeply than those who used it | Verified — documented in multiple Papert sources |
| Schön, The Reflective Practitioner, Basic Books, 1983 — reflection-in-action | Verified |
| Hazzan, "The reflective practitioner perspective in software engineering education," Journal of Systems and Software, 63(3), 2002 | Verified |
| Ericsson, Krampe & Tesch-Römer, "The role of deliberate practice," Psychological Review, 100(3), 1993 | Verified |
| Kirsh & Maglio, "On distinguishing epistemic from pragmatic action," Cognitive Science, 18(4), 1994 | Verified |
| Neth & Payne, "Thinking by Doing? Epistemic Actions in the Tower of Hanoi," 2002 | Source verified as existing (see Issue 3 for characterization problem) |
| Goedecke, "Debugging, Emotional Resilience, and Mental Models," seangoedecke.com | Verified — article exists with matching content |
| Weimer et al., IEEE TSE 2024 | Source verified as existing (see Issue 4 for characterization note) |
| Beck, Tidy First?, O'Reilly, 2023 — "In this tidying, you are taking your hard-won understanding and putting it back into the code" | Quote verified |
| Fowler, Refactoring, 2nd ed., Addison-Wesley | Verified |
| Bacchelli & Bird, ICSE 2013 | Verified |
| Dan North, BDD, dannorth.net — "most problems that teams face are about communication" | Verified |
| arxiv 2509.20491 | Verified as existing |
| arxiv 2512.22387 | Verified as existing |
| arxiv 2407.06153 | Verified as existing |
| CodeRabbit "State of AI vs. Human Code Generation Report" 2026 | Listed in sources only; not cited inline. Existence not independently verified but consistent with the research log |
| Codemanship, January 2026 | Source cited in research log; claim about TDD focus consistent with Codemanship content |
| Latent Space / Kirkovska, "TDD for AI Agents" | Source cited in research log; not cited inline in essay body |
| Agentic Coding Handbook, tweag.github.io | Source cited in research log; not cited inline in essay body |
