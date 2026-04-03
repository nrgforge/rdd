# Research Log: Context-Reconstructive Building

## Question 1: How do existing AI-assisted build tools approach "understanding what you're building"?

**Method:** Web search (landscape survey) + code reading (superpowers plugin, rdd-review skill)

### Findings

#### The Ecosystem Gap

The AI-assisted coding ecosystem has converged on a shared assumption: **context injection solves the understanding problem.** Cursor rules, AGENTS.md, Claude skills, TDAD's test maps — all variations on "give the agent more information." None scaffold the *developer's* understanding of what they're building before generation starts.

Key voices on the understanding gap:

- **Simon Willison's golden rule:** "I won't commit any code to my repository if I couldn't explain exactly what it does to somebody else." His ongoing concern is semantic diffusion — "vibe coding" applied to all AI-assisted dev, obscuring the distinction between abdication and discipline.
- **Addy Osmani's structural warning:** Agentic workflows "disproportionately benefit senior engineers" — junior devs can "produce code without understanding it, ship features without learning why certain patterns exist." The understanding gap is a **skill formation** issue, not just code quality.
- **Production consequences:** An August 2025 CTO survey found 16 of 18 reporting production disasters directly caused by AI-generated code shipped without comprehension.

#### TDD with AI — Procedure vs. Context

The TDAD paper (Test-Driven Agentic Development, arxiv 2603.17973) produced the sharpest finding: adding procedural TDD instructions *without* graph context **increased regressions to 9.94%** — worse than the vanilla baseline (6.08%). Context (which tests to check) outperforms procedure (how to do TDD). The implication: telling agents *what* to verify beats telling them *how* to develop. With proper test-map context: 70% regression reduction.

Codemanship (January 2026) identifies the mechanism: "The more things we ask models to pay attention to, the less able they are to pay attention to any of them." TDD's one-problem-at-a-time cadence keeps context focused. The Agentic Coding Handbook frames tests as structured prompts: "The more precise the prompt (in this case, the test), the more accurate the generation."

#### Superpowers Plugin — Discipline Enforcement Pattern

Superpowers (v5.0.7, 14 skills) takes an adversarial-toward-rationalization approach:

- **TDD skill:** Iron Law — "NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST." Includes a rationalization table pre-empting every known excuse. Companion anti-patterns document.
- **Brainstorming skill:** HARD-GATE preventing implementation until design is presented and approved. Context gathering (files, docs, recent commits) comes first. But context is gathered for the *agent* to design with — the user approves or rejects, they don't co-construct understanding.
- **Debugging skill:** Iron Law — "NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST." Four phases: root cause investigation → pattern analysis → hypothesis testing → implementation.
- **Verification skill:** "Claiming work is complete without verification is dishonesty, not efficiency."

**Key distinction:** Superpowers enforces *discipline* (do this, don't skip that). RDD scaffolds *understanding* (do you know why you're doing this?). Discipline ensures the process happens; understanding ensures the person can speak to what happened.

#### Marketplace Skills — Generation Over Comprehension

Community skills (awesome-claude-code, skillsmp.com) are overwhelmingly generation-accelerating:
- Context Engineering Kit — closest to systematic understanding, but optimizes agent result quality, not developer comprehension
- Common Ground Command — surfaces Claude's hidden assumptions about a project (epistemic intent, but agent-facing)
- AgentSys, Fullstack Dev Skills — automation, PR management, Jira integration

No existing skill scaffolds the builder's understanding of what they're building and why.

### Implications

1. **White space confirmed.** No tool in the ecosystem does what a context-reconstructive build skill would do — scaffold the developer's understanding before and during building.
2. **Context > procedure for AI agents.** The TDAD finding means the build skill should prioritize *what context the agent needs* (test maps, integration points, scope) over *procedural TDD instructions*.
3. **Discipline is necessary but insufficient.** Superpowers proves that Iron Laws and rationalization tables enforce process compliance. But compliance without comprehension is the reviewer-as-passthrough problem applied to building.
4. **The skill formation angle matters.** Osmani's point about junior developers losing the learning pathway is the strongest argument for epistemic building. The differentiator isn't code quality — it's whether the developer walks away more capable.

---

## Question 2: How does rdd-review reconstruct context, and what's shared with build?

**Method:** Code reading (rdd-review SKILL.md, rdd-build SKILL.md)

### Findings

#### Review's Context-Reconstructive Mode

The rdd-review skill's context-reconstructive mode follows this pattern:

1. **Prompt for breadcrumbs** — "Share ticket URLs, MR links, relevant docs, or paste discussion threads"
2. **Fetch and read** — Ticket URLs, MR/PR links, existing MR comments, doc links, pasted content. Graceful degradation if tools unavailable.
3. **Synthesize orientation** — Changeset structure (tree view), what the change is, why it exists, what constraints shaped it, what assumptions are in play
4. **Validate with reviewer** — "Does this capture the context? What would you adjust or add?"

Success criterion: the reviewer can discuss the changes with informed judgment without AI assistance.

#### Build's Current Mode (Pipeline-Only)

The current rdd-build skill assumes the full artifact corpus:
1. Read domain model invariants (constitutional authority)
2. Read system design (compiled rollup)
3. Read behavior scenarios (acceptance criteria)
4. Read existing code

It cannot function without these. There's no equivalent of "prompt for breadcrumbs."

#### The Shared Pattern

Both skills need to answer the same fundamental questions before doing their real work:

| Question | Review calls it... | Build would call it... |
|----------|-------------------|----------------------|
| What are we working with? | Changeset structure | Scope definition |
| Why does this exist? | Ticket goal / initiative | User need / business driver |
| What constraints apply? | Technical constraints, deadlines | Integration points, existing patterns |
| What assumptions are in play? | Implicit decisions to question | Ambiguities to surface |
| What should we verify? | Test quality, behavior coverage | Testable scenarios, acceptance criteria |

The *questions* are identical. The *downstream use* differs:
- Review orientation → questions for the reviewer to think about
- Build orientation → decisions and tests for the builder to make and write

#### Is This a Shared Skill?

The context-reconstruction step could be extracted as a shared protocol or skill. Both review and build (and potentially other skills) need:
1. Source gathering (heterogeneous: tickets, code, threads, docs)
2. Orientation synthesis (what, why, constraints, assumptions)
3. User validation of the synthesis

The divergence happens *after* orientation — review goes to questions, build goes to scenarios and tests. The pre-orientation work is genuinely shared.

### Implications

1. **Shared context-reconstruction is real.** The pattern isn't just similar — it's the same step serving different downstream purposes.
2. **User validation is load-bearing.** In both review and build, the user correcting the orientation is where understanding gets built. The synthesis is a hypothesis; the user confirms or corrects it.
3. **Breadcrumb prompting is the key UX.** The review skill's "share ticket URLs, MR links, docs, or paste threads" is the right interaction pattern. The build skill needs an equivalent.
4. **Graceful degradation matters.** Not every project has Jira. Not every team uses GitHub. The skill must work with whatever the user can provide — even just a verbal description.

---

## Question 3: What are the pedagogical foundations of building-as-understanding?

**Method:** Web search (pedagogical theory, cognitive science, practitioner literature)

### Findings

#### Constructionism — Building as Epistemic Act

Papert's constructionism (1980, *Mindstorms*; 1991, "Situating Constructionism") distinguishes itself from Piaget's constructivism: learning is especially potent when the learner is building a shareable artifact. The artifact externalizes the mental model — gaps in understanding become compilation errors or wrong outputs. Children who *wrote* educational software about fractions learned far more deeply than those who *used* the same software.

Papert's students called it "hard fun" — fun *because* it was hard. The resistance of the material is the mechanism, not a bug.

#### Reflective Practice — The Surprise Moment

Schön's *The Reflective Practitioner* (1983) introduces reflection-in-action: when something surprises you mid-coding (a test fails unexpectedly, a refactoring reveals an assumption), you pause and the tacit knowing becomes an object of scrutiny. This is the learning moment.

Hazzan (2002, "The reflective practitioner perspective in software engineering education") bridges this to software: development is a "design discipline" in Schön's sense, not engineering-science, because problems are ill-structured and solutions partly constitute the problem.

Production pressure kills reflection-in-action by incentivizing the patch over the pause. Pair programming's navigator role is institutionalized reflection-in-action — one person acts, one reflects on the act in real time.

#### Deliberate Practice — The Production Trap

Ericsson's deliberate practice framework (1993) identifies why production coding stops building skill: once performance becomes automatic, improvement stalls. The plateau is not a talent ceiling; it is where conscious effort stops. Production coding mostly runs on automaticity.

Deliberate practice requires operating at the edge of failure. Production needs reliability. The two are structurally opposed. A context-reconstructive build skill would need to create *productive resistance* within production work — not by adding friction for its own sake, but by requiring engagement at the points where understanding matters.

#### Epistemic Actions — Using the World as Cognitive Scratchpad

Kirsh & Maglio (1994, "On distinguishing epistemic from pragmatic action") define epistemic actions as actions taken to gain information, not advance toward a goal. In Tetris: rotating a piece to see if it fits before committing.

In programming, epistemic actions include:
- **TDD red phase** — the failing test makes the design problem concrete and perceptible
- **Print statements / breakpoints** — making hidden state visible
- **Exploratory refactoring** — restructuring to understand, not to ship
- **Spike code** — throwaway code to externalize and evaluate a mental model

Counterintuitively, Neth & Payne (2002) found that epistemic action use *increases with expertise*. Experts externalize more, not less — they have learned to use the environment as cognitive scaffolding.

#### Debugging Forces Mental Model Construction

Debugging is a hypothesis-test cycle. Goedecke: "A bug almost always represents a place where your mental model diverges from the state of the real world. What needs fixing is your mental model." Weimer et al. (IEEE TSE 2024) provide the first neurally-grounded model showing debugging stages are distinct cognitive modes, each forcing knowledge acquisition.

Anthropic's own study (InfoQ, Feb 2026): AI-assisted developers scored **50% on comprehension quizzes vs 67% for manual coders**, with the largest gap on debugging questions. Developers who delegated generation scored below 40%; those who used AI for explanations scored 65%+. The comprehension cost is empirically measurable and shows up hardest on the tasks that force the deepest model construction.

#### Refactoring as Design Discovery

Kent Beck (*Tidy First?*, 2023): "In this tidying, you are taking your hard-won understanding and putting it back into the code." Refactoring is bidirectional — reading builds understanding; tidying encodes understanding into structure others can read. Coupling and cohesion are cognitive properties, not just technical ones.

Refactoring.guru (Fowler-derived) organizes problem-first: 22 code smells across 5 categories (Bloaters, OO Abusers, Change Preventers, Dispensables, Couplers) leading to 66 techniques across 6 categories. "When to refactor" is always opportunistic — you refactor while doing other work, not as a separate sprint. The four triggers: rule of three, when adding a feature, when fixing a bug, during code review.

#### Tests as Executable Understanding

Dan North created BDD from the observation that "most problems that teams face are about communication." Tests are not verification bolted on — they are formalization of understanding. TDD forces specification before implementation; BDD extends this across role boundaries by making scenarios readable by non-developers. A passing test suite is a corpus of machine-checked sentences about system behavior.

### Implications

The unifying mechanism across all these sources is **productive resistance** — the artifact (Papert), the surprise (Schön), the edge of failure (Ericsson), the cognitive offload (Kirsh), and the bug (debugging research) all function as resistance that forces the learner to externalize and revise their model.

1. **The build skill must preserve productive resistance.** AI tools that remove debugging, refactoring, and test-writing remove the epistemic work that builds competence. The skill should use AI for generation and scaffolding, then shift the resistance back to the developer at the points where understanding matters.
2. **Epistemic actions are the mechanism, not an overhead.** The TDD red phase, exploratory refactoring, spike code — these are how developers think. The build skill should name and protect these as epistemic actions, not treat them as process steps to optimize away.
3. **Context-reconstructive building is constructionist.** When the developer validates the orientation, surfaces ambiguities, writes scenarios — they are constructing a shareable artifact (the understanding) that the code then expresses. This is Papert's mechanism applied to professional practice.
4. **Debugging and refactoring are first-class building activities.** The current build skill treats them as what happens when something goes wrong. The research says they are where the deepest learning happens. The revamped skill should elevate them.
5. **The production-learning tension is real.** The skill cannot pretend the developer has unlimited time. It needs to create productive resistance *within* production work — the right questions at the right moments, not a separate learning exercise.

---

## Question 4: How does refactoring catalog structure inform the build skill?

**Method:** Web fetch (refactoring.guru/refactoring/catalog, refactoring.guru/refactoring/when)

### Findings

Refactoring.guru presents the Fowler/Beck refactoring catalog with a pedagogically significant structure:

#### Problem-First Organization
The catalog leads with **code smells** (what's wrong), not techniques (how to fix). The developer is expected to identify the smell, then look up the technique. This inverts the typical reference approach and teaches diagnosis before prescription.

#### Opportunistic Timing
"When to refactor" names four triggers, all integrated with other work:
1. **Rule of three** — first instance is fine, second is a flag, third is the trigger
2. **When adding a feature** — refactor to understand the code you're about to change
3. **When fixing a bug** — cleaning surrounding code makes the bug visible
4. **During code review** — last chance before code goes public

None of these is "schedule a refactoring sprint." Refactoring is always in service of something else.

#### Inverse Refactorings
The catalog surfaces inverse techniques (Extract Method ↔ Inline Method), acknowledging that refactorings are context-dependent, not universally directional. This prevents cargo-culting — "always extract" is wrong; direction depends on what the code needs right now.

### Implications

1. **Smell-first diagnosis maps to the build skill's assumption-surfacing step.** Before deciding how to build, identify what's wrong or unclear. The build skill should teach this diagnostic stance.
2. **Opportunistic refactoring is natural stewardship.** The build skill already has tidying (Beck's "make the change easy, then make the easy change"). The refactoring catalog provides the vocabulary and pattern library for that tidying.
3. **The build skill should reference the catalog as a shared vocabulary** — not embed 66 techniques, but point to them and teach the diagnostic stance (smell → technique, not technique → application).

---

## Question 5: What structural pathologies are specific to AI-generated codebases?

**Method:** Web search (empirical studies, practitioner reports, longitudinal data)

### Findings

#### Vibe Drift — Architectural Divergence Across Sessions

The root mechanism is stateless generation: each AI session begins without memory of prior architectural decisions. Practitioners report "Frankenstein codebase" effects — parallel implementations of the same concept accumulate across sessions and engineers. Logic drift is a subtler variant: business rules mutate silently during fix sessions (discount thresholds shift, validation criteria change) without the mutation being intentional.

#### AI-Specific Code Smells — Beyond Fowler

arxiv 2510.03029 (Oct 2025): All four LLMs tested produce more code smells than human baselines. Average increase: +63.34%. Implementation smells dominate (73.35%).

The Ox Security "Army of Juniors" report (Oct 2025, 300 projects) identified smells genuinely novel relative to Fowler's catalog:
- **Avoidance of Refactors** (80-90% prevalence): AI never architecturally improves existing code. Structurally impossible for human developers who live in the codebase.
- **Over-Specification** (80-90%): Hyper-specific single-use solutions. The inversion of Speculative Generality — the AI over-specifies rather than over-abstracts.
- **Bugs Déjà-Vu** (70-80%): Identical bugs recur because the model has no persistent learning across sessions.
- **Circular Test Suites** (40-70%): Tests validate the implementation, not the intent. 87% line coverage with only 38% mutation kill rate.

#### Codebase Degradation — Longitudinal Evidence

GitClear 2025 (211M lines, 2020-2024): Refactoring dropped from 25% to <10% of changed lines. Copy/paste rose from 8.3% to 12.3%. **2024 was the first year copy/pasted lines exceeded refactored lines.** 7.9% of new code revised within 2 weeks (vs 5.5% in 2020) — the rapid-correction signature.

arxiv 2603.28592 (Mar 2026, 304K commits, 6,275 repos): 89.1% of AI-introduced issues are code smells. **24.2% of AI-introduced issues survive at latest revision** — the debt does not self-resolve.

#### Comprehension Debt

Osmani (Mar 2026) coins the term: the gap between code that exists and code any human understands. Unlike technical debt, comprehension debt breeds false confidence — CI is green, tests pass, but understanding has hollowed out. AI generates 5-7x faster than developers absorb. The asymmetry is the mechanism.

#### Distributed Incoherence

The primary architectural failure mode is not a god class but inconsistent decomposition: each session produces a reasonable local solution, globally inconsistent. Inconsistent layering, phantom logic for imaginary edge cases, complexity without concision (shorter but higher cyclomatic complexity).

### Implications

1. **Traditional smell catalogs are insufficient.** Avoidance of Refactors, Over-Specification, and Bugs Déjà-Vu are mechanistically impossible for human developers. The build skill needs to detect and remediate these specifically.
2. **The refactor step is where AI damage gets caught.** Red → Green → Refactor is already the TDD cycle, but the Refactor step needs to be upgraded: not just tidying, but actively scanning for AI-specific accumulation patterns.
3. **Mutation testing, not coverage, is the honest quality gate.** The circular test suite problem means coverage metrics lie. The build skill should use or recommend mutation testing.
4. **Comprehension debt is the meta-problem.** Every other finding feeds into it. The build skill's epistemic engagement (reflection time, assumption surfacing, context validation) is the direct countermeasure.
5. **Characterization tests are the entry point for cleanup.** When working on AI-generated code of unknown intent, capture existing behavior first (Golden Master), then refactor, then verify intent.

---

## Question 6: How does the codebase-audit skill relate to refactoring remediation?

**Method:** Code reading (codebase-audit SKILL.md)

### Findings

The codebase-audit skill provides comprehensive multi-lens *diagnosis* across ten analytical lenses (Pattern Recognition, Architectural Fitness, Decision Archaeology, Dependency & Coupling, Intent-Implementation Alignment, Invariant Analysis, Documentation Integrity, Structural Health, Dead Code, Test Quality). Its finding format (Observation, Pattern, Tradeoff, Question, Stewardship) is pedagogically structured.

Key characteristics:
- **Diagnosis only** — the skill explicitly does not generate or refactor code
- **Stewardship framing** — findings use "what a good steward would do," not judgment language
- **Mäntylä's taxonomy** for code smells, separate from architectural anti-patterns
- **Convergence-based prioritization** — findings from multiple independent lenses are higher confidence
- **Top-down narrative** — Macro context makes local findings meaningful

The gap: it stops at findings. There is no corresponding skill to *act on* findings — to drive the actual refactoring work with the same epistemic care.

### Implications

1. **The audit skill is the diagnostic half; rdd-refactor would be the remediation half.** The finding format could feed directly into refactoring decisions.
2. **The audit skill already detects many AI-specific patterns** — Structural Health lens uses Fowler's smell taxonomy and architectural anti-pattern detection. Extending it with AI-specific smells (Avoidance of Refactors, Over-Specification, Distributed Incoherence) would make it AI-aware.
3. **The audit could be comprehensive** — the user's frustration is that it isn't. The rdd-refactor skill, used iteratively within build, could apply the audit's lenses in a targeted way to code being written/changed, not just to the whole codebase.

---

## Sources

- Willison, S. "Not all AI-assisted programming is vibe coding." simonwillison.net, May 2025.
- Osmani, A. "Vibe Coding is not the Same as AI-Assisted Engineering." medium.com/@addyosmani.
- Osmani, A. "Agentic Engineering." addyosmani.com/blog/agentic-engineering.
- Osmani, A. "Comprehension Debt." addyosmani.com/blog/comprehension-debt, March 2026.
- Osmani, A. "Avoiding Skill Atrophy in the Age of AI." addyo.substack.com.
- Codemanship. "Why does TDD work so well in AI-assisted programming?" January 2026.
- TDAD. arxiv 2603.17973.
- Latent Space / Kirkovska. "TDD for AI Agents." latent.space/p/anita-tdd.
- Agentic Coding Handbook. tweag.github.io/agentic-coding-handbook/WORKFLOW_TDD.
- Bacchelli & Bird. "Expectations, Outcomes, and Challenges of Modern Code Review." ICSE 2013.
- Papert, S. "Situating Constructionism." 1991.
- Schön, D.A. *The Reflective Practitioner.* 1983.
- Hazzan, O. "The reflective practitioner perspective in SE education." JSS, 2002.
- Ericsson et al. "The role of deliberate practice." Psychological Review, 1993.
- Kirsh & Maglio. "On distinguishing epistemic from pragmatic action." Cognitive Science, 1994.
- Neth & Payne. "Thinking by Doing? Epistemic Actions in the Tower of Hanoi." 2002.
- Goedecke, S. "Debugging, Emotional Resilience, and Mental Models." seangoedecke.com.
- Weimer et al. "Towards a Cognitive Model of Dynamic Debugging." IEEE TSE, 2024.
- "AI Coding Assistance Reduces Developer Skill Mastery by 17%." InfoQ, Feb 2026.
- Anthropic. "How AI assistance impacts the formation of coding skills." 2026.
- Beck, K. *Tidy First?* O'Reilly, 2023.
- Fowler, M. *Refactoring.* 2nd ed.
- Refactoring.guru. refactoring.guru/refactoring/catalog.
- North, D. BDD writings. dannorth.net/tags/bdd.
- GitClear. "AI Copilot Code Quality 2025." gitclear.com.
- arxiv 2510.03029. "Investigating The Smells of LLM Generated Code." Oct 2025.
- arxiv 2509.20491. "AI-Specific Code Smells." Sep 2025.
- arxiv 2603.28592. "Debt Behind the AI Boom." Mar 2026.
- arxiv 2512.22387. "AI-Generated Code Is Not Reproducible." Dec 2025.
- arxiv 2407.06153. "What's Wrong with Your Code Generated by LLMs?" Jul 2024.
- Ox Security. "Army of Juniors." Oct 2025.
- CodeRabbit. "State of AI vs. Human Code Generation Report." 2026.
