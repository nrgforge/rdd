# Citation Audit: Essay 011 — The Structural Pathology of AI-Generated Codebases
*Audit date: 2026-04-02*
*Essay: `/docs/essays/011-ai-generated-codebase-anti-patterns.md`*
*Research log: `/docs/essays/research-logs/research-log.md`*

---

## Citation Verification Results

| # | Reference | Title | Venue | Year | Status |
|---|-----------|-------|-------|------|--------|
| 1 | GitClear 2025 report | "AI Copilot Code Quality: 2025 Data Suggests 4x Growth in Code Clones" | gitclear.com | 2025 | VERIFIED |
| 2 | Osmani, A. | "Comprehension Debt — the hidden cost of AI generated code" | addyosmani.com / Medium | March 2026 | VERIFIED |
| 3 | Ox Security | "The Army of Juniors: The AI Code Security Crisis" | ox.security | October 2025 | VERIFIED |
| 4 | arxiv 2510.03029 | "Investigating The Smells of LLM Generated Code" | arXiv (preprint) | October 2025 | VERIFIED |
| 5 | arxiv 2509.20491 | "AI-Specific Code Smells: From Specification to Detection" | arXiv (preprint) | September 2025 | VERIFIED |
| 6 | arxiv 2603.28592 | "Debt Behind the AI Boom: A Large-Scale Empirical Study of AI-Generated Code in the Wild" | arXiv (preprint) | March 2026 | VERIFIED |
| 7 | arxiv 2512.22387 | "AI-Generated Code Is Not Reproducible (Yet): An Empirical Study of Dependency Gaps in LLM-Based Coding Agents" | arXiv (preprint) | December 2025 | VERIFIED |
| 8 | arxiv 2503.06911 | "Beyond Code Generation: LLM-supported Exploration of the Program Design Space" | arXiv / CHI 2025 | March 2025 | VERIFIED — but wrong paper for the specific claim (see Section 3) |
| 9 | arxiv 2603.09701 | "An Empirical Study of Interaction Smells in Multi-Turn Human-LLM Collaborative Code Generation" | arXiv (preprint) | March 2026 | VERIFIED |
| 10 | Kognitos | "Why Vibe Coding Breaks in Production" | kognitos.com/blog | 2025 | VERIFIED |
| 11 | Zencoder | "Spec-Driven Development: Why Vibe Coding Will Fail the Next Generation of AI Engineers" | zencoder.ai/blog | 2025 | VERIFIED |
| 12 | CodeRabbit | "State of AI vs. Human Code Generation Report" | coderabbit.ai | December 2025 / 2026 | VERIFIED |
| 13 | InfoQ | "AI-Generated Code Creates New Wave of Technical Debt" | infoq.com | November 2025 | VERIFIED |
| 14 | Sonar | "The inevitable rise of poor code quality in AI-accelerated codebases" | sonarsource.com/blog | 2025 | VERIFIED |
| 15 | Anthropic | "How AI assistance impacts the formation of coding skills" (cited inline as "Anthropic study of 52 engineers") | anthropic.com/research | 2026 | VERIFIED — not in sources list, cited inline only |

**Summary:** 15/15 sources exist and are retrievable. 14/15 verified to exact title match. 0 fabricated. 1 citation correctly identifies a real paper but applies it to a claim that belongs to a different paper (see P1 issue below).

---

## Claim-Source Alignment

| # | Claim in Essay | What Source Actually Says | Alignment |
|---|----------------|--------------------------|-----------|
| 1 | Kognitos documents the "Frankenstein codebase" pattern at team scale with specific examples of database table / service duplication | Kognitos blog documents logic drift and five failure modes including logic drift; "Frankenstein codebase" phrasing is Zencoder's, not Kognitos's | ACCURATE but INCOMPLETE — attribution is slightly conflated. The database/service examples are Kognitos-adjacent; "Frankenstein" language belongs to Zencoder. |
| 2 | arxiv 2510.03029: smell increase rates Falcon 42.28%, Gemini Pro 62.07%, ChatGPT 65.05%, Codex 84.97%; avg 63.34%; implementation 73.35%, design 21.42% | Confirmed exactly in paper abstract and search results | ACCURATE |
| 3 | arxiv 2509.20491: 22 AI-specific smells, 826 systems, 20M LOC, 88.66%/88.89% precision/recall | Confirmed exactly | ACCURATE |
| 4 | Ox Security: 300 projects / 50 AI-generated; 10 anti-patterns at 80–100% prevalence | Confirmed. Numbers match (300+ repos, 50 AI-generated, 10 anti-patterns, release October 23, 2025) | ACCURATE |
| 5 | arxiv 2603.28592: 304,362 commits, 6,275 repos, 5 AI tools, 484,606 issues, 89.1% code smells, >15% commits introduce issue, 24.2% persistence | All figures confirmed | ACCURATE |
| 6 | GitClear: refactoring 25% → <10%; copy/paste 8.3% → 12.3% (48% increase); 7.9% revised within 2 weeks vs 5.5% in 2020; >1-month revisions 30% → 20% | All figures confirmed against GitClear 2025 PDF and summary reports | ACCURATE |
| 7 | Sonar: "maintenance costs reaching 4x traditional levels by year two" | The 4x figure appears in secondary analysis of Sonar's data (buildmvpfast.com synthesis), not in Sonar's own article. Sonar's blog focuses on code smell prevalence (90%+ issues are smells) but does not state "4x maintenance costs by year two" directly. This appears to be a downstream synthesis claim attributed as if it were Sonar's own finding. | OVERSTATED — claim attributed to Sonar but sourced from a secondary synthesis |
| 8 | arxiv 2503.06911: LLMs "tend to produce code that is shorter yet more complicated" — higher cyclomatic complexity than canonical solutions | **This finding belongs to arxiv 2407.06153 ("What's Wrong with Your Code Generated by Large Language Models? An Extensive Study"), not to 2503.06911.** Paper 2503.06911 is a CHI 2025 HCI paper about an IDE (Pail) for design space exploration. It does not measure cyclomatic complexity or compare against canonical solutions. The "shorter yet more complicated" finding is confirmed but in the wrong paper. | MISREPRESENTED — real finding, wrong citation |
| 9 | arxiv 2512.22387: "runtime multiplier of 10" for dependencies | Paper states 13.5x average expansion (not 10x) from declared to actual runtime dependencies | OVERSTATED — essay uses "10 or more" which is directionally accurate but understates the actual finding of 13.5x average |
| 10 | Osmani 2026: "AI generates 5–7x faster than developers absorb" | Confirmed: Tyler Folkman's note quoting Osmani: "AI generates 5-7x faster than developers absorb" | ACCURATE |
| 11 | Anthropic study: "52 engineers...scored 17% lower on comprehension...largest declines in debugging and code reading" | Confirmed: Anthropic.com/research, 52 engineers, 50% vs 67% quiz score (≈17% lower), largest differences in debugging questions | ACCURATE |
| 12 | CodeRabbit: "61% of developers report AI produces code that 'looks correct but is unreliable'" | Confirmed: "Three in five developers (61%) agree that AI-generated code often looks correct, but isn't" | ACCURATE |
| 13 | Osmani 2026: "comprehension debt" named in March 2026 | Confirmed; addyosmani.com/blog/comprehension-debt/ | ACCURATE |
| 14 | arxiv 2603.09701: "interaction smells...invisible to static analysis, visible only in behavioral trajectory" | Paper confirmed to exist and define interaction smells as latent obstacles. Claim is a reasonable characterization of the paper's scope. The specific phrase "visible only in the behavioral trajectory" is the essay's interpretation, not a direct quote. | ACCURATE but interpretive |
| 15 | GitClear: "8-fold increase in code blocks with five or more lines duplicating adjacent code during 2024, duplication prevalence 10x higher than two years prior" | Confirmed exactly from GitClear 2025 report | ACCURATE |

---

## Citation Pattern Analysis

### Temporal Distribution

| Period | Count | Percentage |
|--------|-------|------------|
| 2026 | 5 | 33% |
| 2025 | 9 | 60% |
| 2024 | 1 | 7% |
| Pre-2024 | 0 | 0% |

**Assessment:** The bibliography is current — entirely 2024–2026, appropriate for a fast-moving topic. However, there are no foundational older works cited: Fowler's refactoring catalog is mentioned in the essay body but not cited in the sources list. Given that the essay makes direct comparisons to Fowler's work, the omission is notable. No pre-AI-era software quality literature is cited as baseline, which weakens the comparative claims.

### Geographic/Institutional Diversity

Sources span: US tech companies and practitioners (Osmani/Google, Anthropic, GitClear, CodeRabbit, Kognitos), Israeli security company (Ox Security), academic arxiv preprints (two Montreal-area researchers for 2509.20491; Chinese institution researchers for 2407.06153 — though this paper is not cited), CHI conference paper, and vendor blogs. Reasonable diversity for an applied topic. No European academic software engineering venues (e.g., EMSE, ICSE, FSE, MSR) are represented despite active publication in this area.

### Self-Citation Rate

0% — no self-citations. Not applicable for this type of essay.

### Source Concentration

- Ox Security cited for multiple claims across Sections 2 and 4 (3 distinct claims). Given it's a vendor report, this concentration warrants noting.
- GitClear cited across Sections 2 and 3 (multiple quantitative claims). Also a vendor with product interests in highlighting AI code quality issues.
- No single source dominates inappropriately, but vendor bias from GitClear and Ox Security should be acknowledged.

### Citation Type Distribution

| Type | Count |
|------|-------|
| Empirical peer-reviewed / preprints | 5 (arxiv papers) |
| Vendor research reports | 3 (GitClear, Ox Security, CodeRabbit) |
| Practitioner blog posts | 4 (Osmani, Kognitos, Zencoder, Sonar) |
| News/aggregation | 1 (InfoQ) |
| Academic conference (CHI) | 1 (2503.06911) |

**Assessment:** Heavy weighting toward vendor reports and practitioner blogs. Appropriate for a practitioner-facing essay on an emerging topic, but the vendor conflict-of-interest is worth noting: GitClear, CodeRabbit, and Sonar all sell products that benefit from concern about AI code quality.

### String Citations

No string citations (multiple sources bundled in a single parenthetical). Each claim is individually attributed.

---

## Missing Citations

### Seminal Works Missing

- **Fowler, M. (1999/2018). "Refactoring: Improving the Design of Existing Code"** — The essay explicitly compares AI smells to Fowler's catalog but does not cite the source. This is an unusual omission; any reader who wants to verify the comparison has no reference point.

- **Cunningham, W. (1992). "The WyCash Portfolio Management System"** (original technical debt framing) — The essay argues AI debt is "different in kind" from classical technical debt without citing the original technical debt concept. A reader unfamiliar with the concept has no anchor.

### Recent Important Works Missing

- **arxiv 2407.06153, "What's Wrong with Your Code Generated by Large Language Models? An Extensive Study"** — This is the actual source of the "shorter yet more complicated / higher cyclomatic complexity" finding attributed in the essay to 2503.06911. This paper should replace 2503.06911 in the Complexity Without Concision claim. Published July 2024, peer-reviewed in Science China Information Sciences 2025.

- **arxiv 2508.21634, "Human-Written vs. AI-Generated Code: A Large-Scale Study"** (August 2025) — Directly relevant comparative study at 500k+ samples that was surfaced in the original research but not cited in the final essay.

### Missing Counterarguments

- No sources presenting evidence that AI code quality is improving, or that current measurements are confounded by developer skill level rather than AI generation per se. The GitHub/Microsoft productivity studies (e.g., Peng et al. 2023 on GitHub Copilot productivity) which show productivity gains are absent — their omission means the essay presents a one-sided picture without acknowledging the productivity tradeoffs.

### Over-cited Works

None identified. Each source is cited once or twice in distinct contexts.

---

## Citation Audit Summary

**Total citations:** 15 (14 in sources list + 1 inline-only Anthropic study)
**Verified:** 15 (100%)
**Problematic:** 2 (13%)
- Unverifiable: 0
- Title/detail mismatches: 0
- Wrong paper for the claim: 1 (2503.06911 used for finding that belongs to 2407.06153)
- Unverified attribution of secondary synthesis: 1 (Sonar 4x claim)

**Claim-source alignment issues:** 3
- Overstated: 2 (Sonar 4x claim; 2512.22387 runtime multiplier stated as "10x" when paper reports 13.5x average)
- Misrepresented: 1 (2503.06911 cited for a finding it does not contain)
- Opposite: 0

---

## Critical Issues (P1 — must fix)

### P1-A: Wrong paper cited for "shorter yet more complicated" finding (Section 4)

**Location:** Section 4, "Complexity Without Concision" paragraph.

**Current text:** `The arxiv paper "Beyond Code Generation" (2503.06911) notes that LLMs face challenges with complex problems and tend to produce code that is "shorter yet more complicated"`

**Problem:** Paper 2503.06911 is a CHI HCI paper about a design exploration IDE (Pail). It does not contain the "shorter yet more complicated" finding or any cyclomatic complexity measurements. That finding belongs to arxiv 2407.06153, "What's Wrong with Your Code Generated by Large Language Models? An Extensive Study" (July 2024 / updated October 2025).

**Fix:** Replace the citation to 2503.06911 in this specific claim with arxiv 2407.06153. Add 2407.06153 to the sources list. Either remove 2503.06911 entirely (it is not cited elsewhere) or retain it only for the general point about LLMs defaulting to "point solutions" (which 2503.06911 does actually discuss).

---

## Recommendations (P2 — should fix)

### P2-A: Sonar "4x maintenance costs" claim needs qualification

**Location:** Section 3, final paragraph: `"Sonar's analysis projects maintenance costs reaching 4x traditional levels by year two in unmanaged AI-generated codebases."`

**Problem:** The 4x figure appears in third-party synthesis articles drawing from Sonar and CodeRabbit data, not in Sonar's own blog post. Sonar's blog discusses code smell prevalence (>90% of issues are smells) but does not publish a 4x maintenance cost projection directly.

**Fix:** Either trace the 4x figure to its actual source (appears to come from buildmvpfast.com synthesis) and cite that instead, or soften the attribution to "analyses drawing on Sonar's data" rather than "Sonar's analysis."

### P2-B: Runtime multiplier understated for 2512.22387

**Location:** Section 4: `"a 'runtime multiplier of 10': for every package the LLM nominally requires, 10 or more packages actually get installed"`

**Problem:** The paper reports a 13.5x average expansion, not 10x. "10 or more" is directionally accurate but systematically understates the finding.

**Fix:** Change to "a runtime multiplier of 13.5x on average."

### P2-C: Anthropic study not in sources list

**Location:** Section 5: the Anthropic 52-engineer study is cited in the body but does not appear in the Sources section at the bottom of the essay.

**Fix:** Add to sources list: `Anthropic, "How AI assistance impacts the formation of coding skills" (2026) — https://www.anthropic.com/research/AI-assistance-coding-skills`

### P2-D: Fowler's catalog cited but not referenced

**Location:** Section 2: essay makes explicit comparisons to Fowler's code smell catalog without citing it.

**Fix:** Add Fowler, M. (1999/2018). *Refactoring: Improving the Design of Existing Code*. Addison-Wesley. to sources, and add inline attribution in Section 2.

---

## Notes (P3 — informational)

### P3-A: Vendor conflict of interest not disclosed

GitClear, CodeRabbit, and Sonar all sell code quality products and have product-aligned incentives to find AI code quality concerning. The essay would be strengthened by a brief acknowledgment that several quantitative sources are vendor-produced reports.

### P3-B: Kognitos/Zencoder "Frankenstein" attribution slightly conflated

The essay attributes the "Frankenstein codebase" characterization to Kognitos. Search results indicate this specific language is from Zencoder. Kognitos uses "logic drift" language. The factual claims are accurate; only the specific phrase is slightly misattributed.

### P3-C: Missing counterargument sources

The essay would benefit from acknowledging at least one source showing AI productivity gains (e.g., Peng et al. GitHub Copilot study) to avoid appearing one-sided. The goal is not to undermine the essay's thesis but to demonstrate that the author has considered the tradeoffs.

---

## Overall Assessment

The bibliography is largely credible. All 15 sources exist and are retrievable. The quantitative figures are accurately reported in 12 of 15 cases. Two figures are directionally accurate but imprecise (Sonar 4x, runtime multiplier). One citation (2503.06911 for the "shorter yet more complicated" claim) is a P1 misattribution — the finding is real but belongs to a different paper (2407.06153). This must be corrected before the essay can be considered citation-clean.

The bibliography's primary weakness is temporal and source-type concentration: exclusively 2024–2026, no academic software engineering venues, no foundational works cited despite explicit comparison to them. For a practitioner-facing essay this is acceptable; for academic use it would require remediation.
