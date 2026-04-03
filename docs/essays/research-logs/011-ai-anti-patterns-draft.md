# The Structural Pathology of AI-Generated Codebases
*2026-04-02*

## Abstract

This essay investigates five categories of structural and architectural anti-patterns that accumulate in codebases where AI tools generate significant portions of code without sustained human architectural oversight. The research used web search and review of empirical studies from 2024–2026, including GitClear's longitudinal analysis of 211 million lines, the Ox Security "Army of Juniors" report, and several recent arxiv papers on code smell prevalence in LLM-generated code. The central finding is that AI-generated code creates a distinctive failure mode that is not captured by classical technical debt frameworks: the code appears correct, passes tests, and is syntactically clean, while the codebase simultaneously degrades along axes invisible to standard quality gates — structural duplication, architectural incoherence across sessions, and a growing gap between code that exists and code any human understands. These patterns require interventions at the process level, not merely the code review level.

---

## 1. Vibe Drift: Architectural Divergence Across Sessions

The most structurally damaging property of AI code generation is statelessness across sessions. Each invocation of an AI coding assistant begins without memory of prior architectural decisions: what abstractions were established, what naming conventions chosen, what layer boundaries drawn. The model defaults to locally reasonable solutions that are globally inconsistent with the codebase it is being asked to extend.

The observable result is what practitioners are calling "vibe drift" — the gradual divergence of parallel implementations of the same concept. One engineer's session produces a database accessor class; another's produces a repository with a different interface contract; a third's inlines the query directly. None are wrong in isolation. Together they represent three implementations of the same concept that now must be reconciled or maintained in parallel.

This pattern compounds at team scale. As documented by Kognitos (2025), when multiple engineers use AI tools in isolation on the same codebase, the architectural drift is additive: one engineer's AI creates a new database table where another's would extend an existing one; one spins up a new service where another would extend an existing service. The Zencoder analysis describes the resulting artifact as a "Frankenstein codebase" — architecturally inconsistent and increasingly unmaintainable, not because any individual change was wrong but because no session had visibility into the accumulated structure.

A subtler variant is logic drift: business rules that mutate silently during fix sessions. A discount threshold shifts from 10% to 12%. A validation rule that rejected null values now accepts them. An approval workflow changes from requiring two signatures to one. The AI is not making errors in the classical sense — it is producing code consistent with the local prompt, but the local prompt is not the canonical specification. Over sessions, this produces codebases where the business logic encoded in code has diverged from the business logic the team believes it encoded.

**The mechanism:** Stateless generation optimizes for local prompt coherence, not global codebase coherence. Without explicit architectural constraints injected into the generation context, the model cannot know what it does not see.

---

## 2. AI-Specific Code Smells: A Taxonomy Beyond Fowler

Martin Fowler's catalog of code smells was constructed by observing human developers in codebases with continuous ownership. Several of the smells that accumulate most prominently in AI-generated code do not appear in that catalog, because they are mechanistically impossible or rare for developers who maintain continuous context.

### The Empirical Baseline

The arxiv paper "Investigating The Smells of LLM Generated Code" (2510.03029, October 2025) evaluated four LLMs against a baseline of professionally written code and found smell increase rates of 42–85% across models: Falcon +42.28%, Gemini Pro +62.07%, ChatGPT +65.05%, Codex +84.97%. The average across all models was +63.34%. Implementation smells dominated (73.35%) over design smells (21.42%), and smell rates increased with task complexity — particularly for object-oriented concepts.

A separate paper, "AI-Specific Code Smells: From Specification to Detection" (arxiv 2509.20491, September 2025), identified 22 AI-specific smells not captured by existing detection tools, evaluated across 826 AI-based systems representing 20 million lines of code.

### The Smells That Are Genuinely Novel

The Ox Security "Army of Juniors" report (October 2025), which analyzed 300 open-source projects including 50 that were wholly or partially AI-generated, catalogued 10 anti-patterns present in 80–100% of AI-generated code. Several are structurally novel:

**Over-Specification** (80–90% prevalence): The AI generates hyper-specific, single-use solutions rather than generalizable components. This is the inversion of the classical "Speculative Generality" smell from Fowler's catalog — instead of building abstractions that won't be needed, the AI builds implementations that can't be reused. The mechanism is prompt-optimization: the model solves the stated problem precisely and completely, with no incentive to consider adjacent problems the solution might serve.

**Avoidance of Refactors** (80–90% prevalence): The AI generates functional code for the immediate prompt but never refactors or architecturally improves existing code. This smell is structurally impossible for developers with continuous codebase ownership — a developer who notices duplication while implementing a feature will typically resolve it, because the friction of living in the codebase makes accumulation visible and costly. An AI tool has no such friction. Each session produces fresh working code atop whatever structure exists.

**Bugs Déjà-Vu** (70–80% prevalence): Identical bugs recur throughout the codebase because the AI violates DRY by regenerating implementations rather than discovering and reusing existing ones. The same off-by-one error appears in three independently generated loops; the same null-check omission appears in four independently generated accessors.

**Vanilla Style**: The AI rebuilds common functionality from scratch rather than leveraging proven libraries. The mechanism here is training data distribution — the model has seen many implementations of common patterns and can generate them fluently, but the selection of which library to use requires project-specific knowledge the model may not have.

**Comments Everywhere** (90–100% prevalence): Excessive inline commentary that is often semantically redundant with the code. The mechanism is optimization for human approval: comment-heavy code reads as thorough and considered. The effect is that AI-generated code is frequently over-commented at the line level and under-documented at the system level — the inverse of what aids comprehension.

GitClear's longitudinal data corroborates the DRY-violation finding: they tracked an 8-fold increase in code blocks with five or more lines duplicating adjacent code during 2024, with duplication prevalence 10x higher than two years prior.

---

## 3. Codebase Degradation: The Longitudinal Evidence

The strongest empirical evidence for AI-specific codebase degradation comes from GitClear's 2025 report, which analyzed 211 million changed lines from January 2020 through December 2024, sourced from repositories owned by Google, Microsoft, Meta, and enterprise C-Corps.

The defining finding is a structural inversion: the proportion of changed lines classified as refactoring dropped from 25% in 2021 to less than 10% in 2024, while lines classified as copy/pasted rose from 8.3% to 12.3% — a 48% relative increase. More significantly, 2024 was the first year in GitClear's dataset where copy/pasted lines exceeded moved (refactored) lines. Refactoring activity dropped to historic lows concurrent with AI tool adoption.

The churn signal is also notable: 7.9% of newly added code was revised within two weeks in 2024, compared to 5.5% in 2020. This is the rapid-correction signature — developers frequently modifying or fixing code that was recently generated, not code that accumulated debt over months. The proportion of revisions targeting code written more than a month prior dropped from 30% to 20%, meaning engineers are spending more time fixing recent AI code and less time improving legacy systems.

The arxiv study "Debt Behind the AI Boom" (2603.28592, March 2026) provides the most comprehensive commit-level evidence. Analyzing 304,362 verified AI-authored commits from 6,275 GitHub repositories across five AI tools, the study found 484,606 distinct issues, of which 89.1% were code smells. More than 15% of commits from every AI tool introduced at least one issue. The critical finding on persistence: 24.2% of tracked AI-introduced issues survived at the latest revision of the repository. AI-introduced debt does not self-resolve — a significant fraction of what AI tools introduce is never cleaned up.

Analyses drawing on Sonar and CodeRabbit data project maintenance costs reaching 4x traditional levels by year two in unmanaged AI-generated codebases. GitClear's 2025 projections show 4x code cloning growth relative to pre-AI baselines.

---

## 4. Architectural Anti-Patterns: Distributed Incoherence

The architectural failure mode most characteristic of AI-assisted development is not the classical god class but what might be called distributed incoherence: the codebase contains no god class, but also no coherent decomposition. Responsibilities are split inconsistently across modules that were each locally well-structured at generation time but were generated without knowledge of each other.

Specific patterns observed in the literature:

**Inconsistent Layering**: AI generates solutions that intermix responsibilities across architectural layers — business logic appearing in database queries, presentation logic in service classes, validation scattered across multiple layers. The mechanism is prompt locality: the model optimizes for satisfying the stated requirement, and the layer into which the generated code is placed is determined by the human's decision about where to open their editor. The model has no layer-boundary enforcement unless explicitly given architectural rules in its context.

**Return to Monolith**: Ox Security's report documents a tendency for AI to generate monolithic architectures rather than decomposed services, even in codebases where the team has adopted microservices. The model defaults to the architecturally simpler solution; without explicit constraint, it does not maintain the decomposition discipline of the existing system.

**Complexity Without Concision**: The arxiv study "What's Wrong with Your Code Generated by Large Language Models?" (2407.06153) evaluated LLM-generated code against canonical solutions on cyclomatic complexity and found that LLMs tend to produce code that is "shorter yet more complicated" — fewer lines but measurably higher cyclomatic complexity than canonical solutions for equivalent problems. The mechanism is likely training data: the model has seen many workarounds and edge-case handlers and incorporates them fluently, producing dense logic that is difficult to reason about.

**Phantom Logic**: Ox Security documents AI adding conditional logic for imaginary edge cases — conditions that cannot be triggered by any real input path but which add to the cognitive surface area of the codebase. The model, trained to be thorough, generates guards against failure modes it has seen in training data even when those failure modes do not apply to the current context.

**Dependency Sprawl**: The arxiv study "AI-Generated Code Is Not Reproducible" (2512.22387) documents a runtime multiplier of 13.5x on average: for every package the LLM declares as a dependency, 13 or more packages actually get installed in the runtime environment via transitive dependencies. The declared interface is clean; the actual dependency graph is not visible to the developer or to test suites.

---

## 5. The "Works But Wrong" Phenomenon: Comprehension Debt

The most conceptually important problem documented in this research is not a code smell or an architectural anti-pattern in the classical sense — it is a failure mode that is structurally invisible to test suites, static analysis, and code review performed at normal velocity.

Addy Osmani named it in March 2026: **comprehension debt** — the growing gap between how much code exists in a system and how much of it any human being genuinely understands. The definition is precise: unlike technical debt, which announces itself through mounting friction (slow builds, tangled dependencies, dread about specific modules), comprehension debt breeds false confidence. The code is syntactically clean, well-formatted, superficially correct — precisely the signals that have historically triggered merge confidence. The codebase looks healthy. Understanding has quietly hollowed out underneath it.

The mechanism is velocity asymmetry. AI tools generate code at 5–7x the rate at which developers absorb it (Osmani, 2026). PR volume climbs. Review capacity remains flat. Most developers spend more time debugging AI-generated code than they spent writing comparable code manually — but the debugging happens after merge, invisibly, without correcting the underlying structural debt.

The empirical grounding is notable: an Anthropic study of 52 engineers learning a new library found those using AI assistance scored 17% lower on comprehension, with the largest declines in debugging and code reading — exactly the skills required when AI-generated code fails in production. CodeRabbit's 2026 analysis found that 61% of developers report AI produces code that "looks correct but is unreliable."

Simon Willison has described the phenomenology from the inside: losing confidence in architectural decisions about code he technically authored, in projects he built himself using AI assistance. The code worked. His understanding of why it worked did not survive the pace of production.

The structural consequence is a codebase that passes its test suite but has lost the human structural knowledge required for safe modification. The first time a critical path requires change, the team discovers that no one holds a coherent model of what the code is actually doing. The tests confirmed behavior; they did not confirm comprehension. Modification requires reconstructing understanding from scratch — under time pressure, in production, for code that looks complete.

Comprehension debt is not an edge case or a failure of discipline. It is the predictable consequence of applying a technology that generates faster than humans absorb, at scale, without process interventions designed to close the gap.

---

## 6. Synthesis: The Distinctive Failure Signature

Across these five categories, a coherent failure pattern emerges that is structurally distinct from classical technical debt accumulation in human-written codebases.

Classical technical debt is created by deliberate shortcuts — developers who know the correct solution and choose the expedient one under time pressure. It is generally visible to its creators, accrues interest through increasing friction, and is addressed by dedicated payoff effort. It is a problem of incentives and time.

AI-generated codebase degradation is different in kind. It is created not by shortcuts but by generation without memory, velocity without comprehension, and local coherence without global consistency. No individual change is wrong. The system-level pathology emerges from the aggregate. The debt accrues without friction signals — CI stays green, tests pass, code looks clean. The decay is invisible until it manifests as inability to safely modify the system.

The specific accumulation pattern: parallel implementations of the same concept multiply across sessions (vibe drift); DRY violations compound without refactoring to check them (Avoidance of Refactors, Bugs Déjà-Vu); complexity grows without concision (Complexity Without Concision, Phantom Logic); the gap between existing code and understood code widens at the rate of AI generation velocity (comprehension debt). GitClear's data shows that these patterns were already measurable by 2024 in real production repositories, with copy/paste exceeding refactoring for the first time in the tracked dataset.

The practical implication for any team using AI tools heavily: the risks are not primarily in individual generated functions (which are typically syntactically correct and locally coherent) but in the structural accumulation across sessions, the absence of refactoring as a counterforce, and the growing comprehension gap between code that exists and code that any team member could safely modify. These are process risks, not code risks — and they require process interventions, not better prompts.

---

## Sources

- GitClear, "AI Copilot Code Quality: 2025 Data Suggests 4x Growth in Code Clones" — https://www.gitclear.com/ai_assistant_code_quality_2025_research
- Osmani, A., "Comprehension Debt — the hidden cost of AI generated code" (March 2026) — https://addyosmani.com/blog/comprehension-debt/
- Ox Security, "The Army of Juniors: The AI Code Security Crisis" (October 2025) — https://www.ox.security/resource-category/whitepapers-and-reports/army-of-juniors/
- arxiv 2510.03029, "Investigating The Smells of LLM Generated Code" (October 2025) — https://arxiv.org/abs/2510.03029
- arxiv 2509.20491, "AI-Specific Code Smells: From Specification to Detection" (September 2025) — https://arxiv.org/abs/2509.20491
- arxiv 2603.28592, "Debt Behind the AI Boom: A Large-Scale Empirical Study of AI-Generated Code in the Wild" (March 2026) — https://arxiv.org/html/2603.28592v1
- arxiv 2512.22387, "AI-Generated Code Is Not Reproducible (Yet)" (December 2025) — https://arxiv.org/html/2512.22387v3
- arxiv 2407.06153, "What's Wrong with Your Code Generated by Large Language Models? An Extensive Study" (July 2024, updated October 2025) — https://arxiv.org/abs/2407.06153
- Anthropic, "How AI assistance impacts the formation of coding skills" (2026) — https://www.anthropic.com/research/AI-assistance-coding-skills
- arxiv 2603.09701, "An Empirical Study of Interaction Smells in Multi-Turn Human-LLM Collaborative Code Generation" — https://arxiv.org/abs/2603.09701
- Kognitos, "Why Vibe Coding Breaks in Production" — https://www.kognitos.com/blog/why-vibe-coding-breaks-in-production/
- Zencoder, "Spec-Driven Development: Why Vibe Coding Will Fail" — https://zencoder.ai/blog/spec-driven-development-why-vibe-coding-will-fail-the-next-generation-of-ai-engineers
- CodeRabbit, "State of AI vs. Human Code Generation Report" (2026) — https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report
- InfoQ, "AI-Generated Code Creates New Wave of Technical Debt" (November 2025) — https://www.infoq.com/news/2025/11/ai-code-technical-debt/
- Sonar, "The inevitable rise of poor code quality in AI-accelerated codebases" — https://www.sonarsource.com/blog/the-inevitable-rise-of-poor-code-quality-in-ai-accelerated-codebases/
