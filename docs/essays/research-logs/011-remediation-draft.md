# Detecting and Remediating AI-Specific Code Quality Problems
*2026-04-02*

## Abstract

This essay investigates the emerging tooling, techniques, and practices for detecting and remediating code quality problems that arise specifically from AI-assisted development at scale. Research combined web searches, targeted page fetches of primary sources, and empirical data from longitudinal studies (GitClear's 211M-line analysis, OX Security's 300-repository audit, arxiv empirical studies on LLM-generated code smells). The findings identify five distinct problem classes with distinct causal mechanisms: architectural drift from stateless generation, AI-specific code smells absent from traditional catalogues, the DRY collapse documented longitudinally in production data, misleading test coverage metrics from AI-generated test suites, and a category called "comprehension debt" — the gap between code that exists and code any human understands. Crucially, most existing quality tools are designed for human-authored code and do not address the structural failure modes unique to AI generation. Emerging countermeasures include constraint files embedded in source that travel with code and are read by LLMs during generation, mutation testing feedback loops that correct AI test suites iteratively, and characterization testing as the entry point for cleanup of AI-generated codebases before their intent can be determined.

---

## The Problem Is Not What Traditional Tools See

Traditional linters and static analyzers catch violations of rules. The assumption is that a human author made a mistake — a style deviation, a known vulnerability pattern, a complexity ceiling exceeded. The rules were designed to surface errors in code authored by people who understand what they are building.

AI-generated code fails differently. It is syntactically correct. It passes style checks. It often passes casual review. The failures emerge in production, from edge cases the model did not anticipate, from existing patterns the model did not know to consult, from architectural decisions made in a prior session the current session has no memory of. The mechanism is not a rule violation — it is a structural incapacity.

This distinction is not semantic. It determines what kind of tooling, what kind of process, and what kind of measurement regime is appropriate. Understanding why AI code fails is prerequisite to building effective countermeasures.

---

## 1. The Empirical Baseline: What Longitudinal Data Shows

GitClear's 2025 analysis of 211 million changed lines of code (January 2020 through December 2024, drawn from repositories owned by Google, Microsoft, Meta, and enterprise C-corporations) provides the strongest longitudinal signal:

- Refactoring as a percentage of changed lines dropped from 25% in 2021 to less than 10% in 2024 — a 60% relative decline
- Copy/pasted (cloned) lines rose from 8.3% in 2020 to 12.3% in 2024, representing approximately 4x growth in duplicated code blocks in 2024 alone
- 2024 was the first year copy-pasted lines exceeded moved (refactored) lines — a structural inversion that had not occurred in any prior year of the dataset
- Code revised within 2 weeks of writing rose from 5.5% to 7.9% — rapid churn consistent with correcting AI-generated code shortly after generation

A separate arxiv study (2603.28592, "Debt Behind the AI Boom", March 2026) analysed 304,362 verified AI-authored commits across 6,275 GitHub repositories and five AI coding tools. It found 484,606 distinct issues, of which 89.1% are code smells. More than 15% of commits from every AI tool introduce at least one issue. 24.2% of AI-introduced issues survive to the repository's latest revision — meaning roughly one in four AI-introduced problems is never cleaned up.

The Sonar organization projects maintenance costs reaching 4x traditional levels by year two in unmanaged AI-generated codebases. The velocity gain from AI generation is real; the maintenance liability that accrues from unmanaged AI generation is also real, and appears on a different timeline.

---

## 2. AI-Specific Code Smells: A New Catalogue

Martin Fowler's code smell catalogue, derived from human development patterns, identifies 22 smells organized into Bloaters, Object-Orientation Abusers, Change Preventers, Dispensables, and Couplers. The assumption throughout is that a human author made a design error. Several AI-specific smells do not fit this taxonomy — they are structurally impossible for human developers to produce.

**From arxiv 2510.03029 ("Investigating The Smells of LLM Generated Code", October 2025):** All four LLMs tested produce more code smells than human-written baselines. Smell increase rates ranged from Falcon (+42.28%) to Codex (+84.97%), with an average increase of 63.34% across all models. Implementation smells dominate over design smells (73.35% vs. 21.42%). Smell rates increase with task complexity.

**From arxiv 2509.20491 ("AI-Specific Code Smells: From Specification to Detection", September 2025):** 22 AI-specific smells are identified that existing tools do not catch, including unreproducibility patterns, silent failure patterns, and poor model generalization patterns. The paper introduces SpecDetect4AI, achieving 88.66% precision and 88.89% recall across 826 AI-based systems (20 million lines of code).

**From OX Security's "Army of Juniors" report (October 2025)**, auditing 300 open-source repositories:

- **Refactoring avoidance** (90–100% prevalence): AI implements prompts additively without recognizing architectural improvement opportunities. A human developer who spends time in a codebase accumulates a sense of where things belong; AI has no such accumulation. It adds without ever asking whether restructuring would serve better.
- **Edge case over-specification** (90–100%): AI adds defensive code for scenarios that were never explicitly tested or required. Functions become bloated with handling for non-existent conditions. TDD is the natural corrective — if no test exists for a scenario, AI should not implement it.
- **Bugs déjà-vu** (80–90%): Identical errors recur in subsequent sessions because models have no persistent learning across sessions. A bug fixed in session 3 reappears in session 7 because the model's starting point is identical.
- **The lie of unit test coverage** (40–70%): Tests pass at 90%+ coverage while production bugs persist. Root cause: AI generates tests by analysing the implementation, not by specifying intended behavior. The tests validate the implementation; when the implementation has a bug, the tests validate the buggy implementation.
- **Return of the monoliths** (40–70%): Context window constraints force AI to reimplement functionality within single files rather than decompose into modules. This is not a style preference — it is a structural consequence of limited context. Beyond context window boundaries, the model behaves as if prior code does not exist.

Two of these smells — refactoring avoidance and bugs déjà-vu — are structurally impossible for human developers living in a codebase. They exist specifically because AI generation is stateless across sessions.

---

## 3. The "Two Implementations" Problem

The mechanism that produces parallel implementations is the context window limit. Claude Code maintains 200K tokens; Cursor may reduce this dynamically; GitHub Copilot operates file-specifically (the smallest context window). When the existing implementation of a function, service, or business rule lies outside the active context window during a new generation session, the model produces a new implementation rather than finding the old one.

GitClear's 4x growth in code duplication is the longitudinal signature of this mechanism operating at scale across many sessions and engineers.

The Augment Code analysis of context gap failures identifies this as the primary differentiator between high- and low-quality AI coding tools: context-aware tools that can inspect the full codebase before generating find and reuse existing implementations; tools operating with narrow context generate new ones. The same analysis documents a real team adding 23 new npm packages in one month of heavy AI use — 7 unmaintained, 2 with known CVEs, 4 duplicating existing functionality — as a manifestation of the same mechanism at the dependency layer.

**Remediation approaches with evidence:**

*Prevention layer:* Provide AI with codebase context before generation begins. "Ranked Recursive Summarization" (nmn.gl) provides hierarchical codebase summaries that allow AI to know existing implementations exist before generating. Architectural constraint files (described below) can explicitly declare canonical implementations and prohibit reimplementation.

*Detection layer:* Track code duplication percentage as a leading indicator of context blindness, not as a trailing consequence of poor practice. Automated pre-commit checks for near-duplicate implementations — beyond exact string matching, structural similarity detection — catch parallel implementations before they are merged.

*Review gate approach:* When parallelizing AI agents across git worktrees (the current industry-standard pattern for parallel AI coding), assign clear domain boundaries to prevent the same problem appearing in multiple worktrees. The explorer/orchestrator/worker pattern attempts to address this at the workflow level.

---

## 4. Architectural Drift and Its Prevention

Architectural drift — the gradual divergence of a codebase from its intended structure — is not new. What is new is the velocity at which it accumulates under AI-assisted development and the mechanism by which it operates.

The root mechanism is stateless generation. Each new agent session has no memory of prior architectural decisions. Without explicit architectural constraints injected into context, the model defaults to locally reasonable solutions that may be globally inconsistent. Tim Sylvester's January 2026 analysis ("The Architecture Is The Plan: Fixing Agent Context Drift") makes this precise: the architecture document must be treated as the agent's persistent memory, not as a human-readable artifact. It must be machine-readable and actively consulted.

**Two enforcement approaches are emerging, at different points in the pipeline:**

*Embedded constraints (prevention during generation):* ArchCodex (open source, Stefan van Egmond) embeds architectural constraints directly in source files via `@arch` tags that expand into full architectural guidance when LLMs read the files. The mechanism is just-in-time contextual surfacing — constraints appear at the moment the model reads the file, rather than existing in a separate document it may not consult. The system enforces 20+ constraint types covering import boundaries, naming conventions, structural requirements, design pattern adherence, and security-critical operations. Violations produce error messages with actionable alternatives and reference implementations.

Benchmark results across 30 runs and five models: 36% reduction in production risk, 70% decrease in architectural drift for top-tier models, 55 percentage-point increase in working code rates for lower-tier models. When applied to a 2,300-file codebase, each round of constraint refinement discovered categories of drift invisible to prior constraint sets — the system improves its own detection as it learns what the project's canonical patterns are.

*External enforcement (detection post-generation):* SonarQube's "Architecture as Code" feature (generally available in SonarQube Server 2025 Release 2, SonarQube Cloud) defines architecture declaratively in versioned YAML/JSON files. CI/CD integration raises issues when AI-generated code violates architectural constraints, surfacing violations before merge. Java and JavaScript/TypeScript are currently supported.

These two approaches are complementary. CI checks catch violations after generation; embedded constraints attempt to prevent them during generation. Neither alone is sufficient. A violation caught in CI requires a fix; a violation prevented during generation does not.

**The small-steps constraint** is a process-level control that does not require tooling: AI stays architecturally aligned when task scope is small enough that surrounding code provides anchoring context — visible naming patterns, imports, function signatures. Large underspecified tasks produce drift; small tasks with rich surrounding context do not. This is a prompting discipline, not a technical guardrail, but the evidence for it is consistent across multiple practitioner sources.

---

## 5. Testing Gaps: Why Coverage Lies

The most empirically documented finding in this research is the disconnect between coverage metrics and actual bug-catching ability in AI-generated test suites.

The mechanism: AI generates tests by analysing the implementation and predicting what tests should look like. It does not specify intended behavior independently and then verify the implementation against it. The result is that tests validate the implementation. When the implementation has a bug, the AI-generated tests validate the buggy implementation as correct. Coverage is high; the test suite catches nothing.

The numbers are specific. A study of AI-generated test suites found an average of 87% line coverage with only 38% of injected mutations caught — meaning over 60% of potential bugs survive despite the high coverage metric. The theoretically extreme scenario (100% coverage / 4% mutation score) has been observed in production audits, not just constructed as a thought experiment.

OX Security's "Lie of Unit Test Coverage" anti-pattern is present in 40–70% of audited repositories. The specific failure modes documented include:

- **Happy path dominance:** AI generates primary flow tests without edge cases (None vs. empty string, missing dictionary key vs. empty dictionary)
- **Double-submission blindness:** AI rarely guards against double-submissions in generated code or tests
- **Input validation gaps:** AI-generated code introduces 2.74x more XSS vulnerabilities than human-written code; AI-generated tests rarely probe for injection
- **Implementation-circular tests:** Tests pass because they verify what the code does, not what it should do

**Mutation testing as the honest proxy:**

Mutation testing automatically introduces small changes to code (changing `>` to `>=`, `+` to `-`, deleting a return statement) and checks whether the test suite fails. If a mutation survives — if the tests continue to pass despite the introduced error — the test suite has a gap.

The AI feedback loop: generate tests with AI → run mutation testing → feed surviving mutants back to AI → repeat. Measured improvement: test mutation score increased from 70% to 78% after one feedback cycle in the OutSight AI experiment. The technique is documented but not widely practiced; mutation testing has historically been slow and expensive. Modern tools (Stryker for JavaScript/TypeScript, PIT for Java, mutmut for Python) have reduced the overhead substantially.

Meta's January 2026 deployment of its Automated Compliance Hardening system for privacy testing used LLM-generated tests guided by mutation testing. Out of thousands of mutants and hundreds of generated tests, privacy engineers accepted 73%, with 36% judged privacy-relevant. This is the largest-scale production deployment of the AI-mutation feedback loop found in the research.

Recommended thresholds (OutSight AI): critical paths require 70% minimum mutation score; standard features 50%; experimental code 30%.

**TDD as prevention:** OX Security and multiple independent sources converge on test-driven development as the primary prevention mechanism for AI test quality problems. Tests written before implementation specify intended behavior before AI generates an implementation to validate against. This breaks the circularity. It also controls edge case over-specification — if no test exists for a scenario, the AI should not implement it.

**Characterization testing for cleanup:** When cleaning up existing AI-generated code whose intent is unclear, characterization tests (the Golden Master pattern) capture actual outputs before restructuring, establishing a safety net without requiring comprehension of the algorithm being tested. This is a distinct technique from normal unit testing — it is used specifically when you cannot determine intended behavior from reading the code, which is a condition that arises more frequently with AI-generated code than human-written code.

---

## 6. Comprehension Debt: The Invisible Liability

A fifth failure mode does not map cleanly onto the categories above. Addy Osmani, in "Comprehension Debt — the hidden cost of AI generated code" (March 2026), names a structural problem distinct from technical debt: the gap between code that exists in the system and code any human genuinely understands.

Unlike technical debt, comprehension debt breeds false confidence. The code looks healthy. Tests pass. CI is green. But the understanding required to safely modify the code does not exist. When a modification is required, the team either generates more AI code on top of code no one understood — deepening the gap — or spends disproportionate time reconstructing intent.

Data points: an Anthropic study of 52 engineers learning a new library found those using AI assistance scored 17% lower on comprehension, with the largest declines in debugging and code reading. CodeRabbit's 2026 analysis found 61% of developers reporting AI produces code that "looks correct but is unreliable." Osmani observes that AI generates at 5–7x the rate developers absorb — velocity asymmetry that produces comprehension debt even in attentive teams.

The arxiv study 2512.22387 ("AI-Generated Code Is Not Reproducible", December 2025) identifies a hidden dimension: a "runtime multiplier of 10" in which for every package an LLM claims is needed, 10+ packages actually get installed. The surface API is legible; the dependency graph is not visible to tests or to the engineer reading the dependency declarations.

Comprehension debt differs from technical debt in one consequential way: you cannot plan to pay off a debt you cannot enumerate. You do not know what you do not understand. The remediation is not a cleanup pass — it is a sustained practice of requiring engineers to be able to explain code before it is committed, the Willison standard: "I won't commit any code I couldn't explain exactly to somebody else."

---

## 7. Emerging Countermeasures: A Taxonomy

The responses to AI-specific quality problems cluster into four approaches:

**Constraint files that travel with code.** ArchCodex's `@arch` tags and SonarQube's Architecture as Code YAML files both attempt to make architectural constraints machine-readable and active at generation time or review time. The insight is that constraints stored in separate documents that the LLM may not read are not enforced; constraints embedded in files the LLM reads during generation are. This is architecturally sound because it exploits the mechanism of how LLMs consume context rather than trying to override it.

**Mutation testing feedback loops.** The AI-generation → mutation test → AI-correction loop is the concrete response to misleading coverage metrics. It does not require abandoning AI-generated tests — it requires grading them honestly and using failing grades as prompts for improvement. Meta's production deployment at scale provides the strongest evidence that this is viable.

**Characterization tests as the entry point to cleanup.** When cleaning AI-generated code, the standard refactoring sequence (understand behavior, write tests, refactor) breaks down because understanding AI-generated behavior is difficult. Characterization tests invert the sequence: capture existing behavior as a safety net, then refactor, then investigate whether the captured behavior is correct. This is the approach best suited to the situation rather than adapted from a prior context.

**Agentic remediation.** Multi-agent pipelines where one agent proposes fixes, another validates, and a third audits for duplication represent an emerging fourth approach. The Substack analysis reports pilot programs achieving 90%+ patch success rates with 50% fewer false positives and approximately 20 engineering hours saved weekly. The key structural shift: humans validate AI rationale rather than reverse-engineering intent from AI-generated code they did not write. The human role moves from author to approver.

---

## 8. What Traditional Tools Miss

The gap is not that traditional linters and code review tools are wrong — they catch what they were designed to catch. The gap is that several AI-specific failure modes are invisible to them:

- **Session-boundary drift** is not visible in any single session's code
- **Context blindness duplication** looks like normal code at the file level; its novelty is apparent only when the codebase is queried for existing implementations of the same logic
- **Circular test suites** pass all coverage thresholds; their inadequacy is visible only when mutants are introduced
- **Comprehension debt** has no metric — no linter reports it

The tooling gap that remains largest: automated detection of parallel implementations at the semantic level (not just string similarity), and continuous monitoring of architectural drift as a codebase metric analogous to coverage.

---

## Conclusions

The quality problems specific to AI-generated code are not random — they are structurally predictable from the mechanisms of AI code generation: stateless sessions, context window limits, implementation-circular test generation, and additive rather than restructuring behavior. Each failure mode has a causal mechanism, which means each has interventions that address the cause rather than the symptom.

The most actionable findings are:

1. **Coverage metrics are actively misleading for AI-generated test suites.** Mutation score is the honest proxy. Establish mutation score minimums as quality gates.

2. **Architectural constraints must be machine-readable and embedded where LLMs read them.** Constraints in documents LLMs do not consult are not enforced during generation.

3. **Code duplication percentage is a leading indicator of context blindness.** Track it as a metric, not as a trailing consequence.

4. **Characterization tests before cleanup.** When AI-generated code cannot be understood before refactoring, capture existing behavior as a safety net first.

5. **TDD is the prevention mechanism most consistently supported by the evidence.** Specification before generation breaks the circular test problem, controls over-specification, and preserves the human understanding that AI-only generation erodes.

The 2025–2026 tooling landscape is responding to these problems, but the tooling is still nascent. The constraint-file and mutation-feedback approaches have the strongest empirical support. The comprehension debt problem — the hardest, most invisible failure mode — has no tooling solution yet. It requires a practice: the commitment to understand before committing.

---

## Sources

- GitClear. "AI Copilot Code Quality: 2025 Data Suggests 4x Growth in Code Clones." gitclear.com/ai_assistant_code_quality_2025_research, 2025.
- arxiv 2603.28592. "Debt Behind the AI Boom." March 2026.
- arxiv 2510.03029. "Investigating The Smells of LLM Generated Code." October 2025.
- arxiv 2509.20491. "AI-Specific Code Smells: From Specification to Detection." September 2025.
- OX Security. "Army of Juniors." October 2025. Referenced via SoftwareSeni.
- StefanVe. "I Built a 2300-File Codebase with AI. Here's the Jig I Built to Prevent Architectural Drift." dev.to, 2025.
- SonarSource. "Introducing Architecture as Code in SonarQube." securityboulevard.com, April 2025.
- SonarSource. "Code Architecture Management General Availability in SonarQube." sonarsource.com, 2025.
- Sylvester, T. "The Architecture Is The Plan: Fixing Agent Context Drift." Medium, January 2026.
- OutSight AI. "The Truth About AI-Generated Unit Tests: Why Coverage Lies and Mutations Don't." Medium.
- techdebt.guru. "AI Testing Gaps: Why High Coverage Doesn't Mean Quality Tests."
- Meta / InfoQ. "Meta Applies Mutation Testing with LLM to Improve Compliance Coverage." InfoQ, January 2026.
- 42 Coffee Cups. "A Developer's Guide to Vibe Code Cleanup." 42coffeecups.com.
- Fenton, S. "What's Missing With AI-Generated Code? Refactoring." Medium, April 2025.
- Softwareanalyst. "Agentic Remediation: The New Control Layer for AI-Generated Code." Substack.
- nmn.gl. "The day I taught AI to understand code like a Senior Developer."
- Augment Code. "The Context Gap: Why Some AI Coding Tools Break." augmentcode.com.
- Osmani, A. "Comprehension Debt — the hidden cost of AI generated code." addyosmani.com, March 2026.
- arxiv 2512.22387. "AI-Generated Code Is Not Reproducible." December 2025.
- arxiv 2603.09701. "Interaction smells in multi-turn LLM code generation." 2026.
- Willison, S. "Not all AI-assisted programming is vibe coding." simonwillison.net, May 2025.
- Faros.ai. "How the DRY Principle in Programming Prevents Duplications in AI-Generated Code."
- SoftwareSeni. "Understanding Anti-Patterns and Quality Degradation in AI-Generated Code."
