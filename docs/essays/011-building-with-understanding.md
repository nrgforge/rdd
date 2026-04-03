# Building with Understanding: Context-Reconstructive Development as Epistemic Practice
*2026-04-02*

## Abstract

This essay investigates what a pedagogical, epistemic approach to software building looks like outside a structured artifact pipeline — and why such an approach is needed. The research combined landscape surveys of AI-assisted coding tools, analysis of existing RDD and superpowers skills, literature review of constructionist learning theory and reflective practice, the refactoring.guru catalog structure, and empirical studies of AI-generated codebase pathologies (GitClear's 211M-line longitudinal analysis, Ox Security's 300-project audit, and multiple arxiv papers from 2024-2026). The central finding is that the AI-assisted coding ecosystem has optimized for giving the *agent* better context while neglecting the *developer's* understanding — and that this neglect produces measurable, distinctive structural pathologies in codebases. The proposed response is a family of composable skills (build, debug, refactor, review) that share a context-gathering foundation and preserve productive resistance at the points where understanding matters most.

---

## 1. The Understanding Gap

The AI-assisted coding ecosystem has converged on a shared assumption: context injection solves the understanding problem. Cursor rules, AGENTS.md, Claude Code skills, the TDAD paper's test maps — all variations on "give the agent more information." None scaffold the *developer's* understanding of what is being built before generation starts.

The distinction matters. Simon Willison's golden rule — "I won't commit any code to my repository if I couldn't explain exactly what it does to somebody else" — names one side: the developer who maintains comprehension. Addy Osmani identifies the structural risk on the other: agentic workflows "disproportionately benefit senior engineers" because junior developers can "produce code without understanding it, ship features without learning why certain patterns exist" (Osmani, "Agentic Engineering"). The gap is not merely about code quality. It is about skill formation. Whether the developer walks away more capable is the differentiator that no existing tool addresses. The production consequences are concrete: an August 2025 survey of 18 CTOs found 16 reporting production disasters directly caused by AI-generated code shipped without comprehension — a survey finding, not a controlled study, but consistent with the structural evidence presented in Section 4.

Superpowers, the most disciplined of the Claude Code plugin suites, enforces process compliance through Iron Laws and rationalization tables: "NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST." This is valuable. Discipline ensures the process happens. But compliance without comprehension is the reviewer-as-passthrough problem applied to building. The developer follows TDD because the skill demands it, not because the test illuminated a design problem. The ceremony is observed; the understanding is optional.

RDD's existing build skill sits at the other extreme. It requires the full artifact corpus — domain model invariants, system design, behavior scenarios, ADRs — before a line of code is written. When that corpus exists, the skill produces building-with-understanding. When it does not exist — which is most of the world's codebases — the skill cannot function at all. The pedagogical machinery is coupled to an artifact pipeline that most projects will never run.

The question this essay addresses: what does the essential knowledge that those artifacts carry look like when reconstructed from whatever sources are actually available?

---

## 2. What Artifacts Actually Carry

The RDD pipeline produces documents. But the documents are not the point. They are the externalized residue of understanding-building activities. The knowledge they carry can be oriented around five questions — a lossy compression that preserves the essential orientation at the cost of the depth and provenance the full artifacts carry:

1. **Who is this for and why?** (Product discovery's contribution: stakeholders, jobs, value tensions.)
2. **What are we building?** (Domain model's contribution: vocabulary, concepts, relationships, invariants.)
3. **What's the scope, and where are the integration points and interaction mechanics?** (System design and scenarios: boundaries, contracts, testable behaviors.)
4. **What's ambiguous, and does it need stakeholder input or just a decision?** (ADR triage: the difference between genuinely undecided territory and a judgment call the builder can make.)
5. **How do we demo what was built?** (Play's contribution: the ability to inhabit the system from a stakeholder's perspective and verify that it does what it should.)

These questions do not require a six-phase pipeline to answer. They require someone to ask them, and someone to answer them with whatever evidence is available — a Jira ticket, a codebase, a Slack thread, a verbal description. The pipeline is one way to produce the answers systematically. Context reconstruction is another: lighter, faster, adapted to the evidence at hand, but asking the same questions.

The RDD review skill already demonstrates this. Its context-reconstructive mode prompts for breadcrumbs (ticket URLs, MR links, docs, pasted threads), fetches and reads them, synthesizes an orientation (what the change is, why it exists, what constraints shaped it, what assumptions are in play), and validates with the user. The success criterion is that the reviewer can discuss the changes with informed judgment without AI assistance. Not expertise — informed judgment.

The same pattern serves building — though the asymmetry is worth naming. Review orientation is backward-looking: it validates an existing change. Build orientation is forward-looking: it must generate scenarios and decisions from context that is inherently less complete than a finished diff. The shared pre-work questions hold across both directions, but the forward-looking mode must tolerate more ambiguity and surface it explicitly rather than resolving it from the evidence.

The sources differ (a Jira ticket describing a feature, an existing codebase to extend, a bug report with reproduction steps, a Figma mockup, a conversation with a product owner). The downstream use differs (scenarios and tests, not review questions). But the orientation step — synthesize what is known, surface what is assumed, validate with the human — is the same. The two modes are named throughout this essay: **pipeline mode** (full RDD artifact corpus available) and **context-reconstructive mode** (orientation synthesized from heterogeneous sources).

---

## 3. Productive Resistance

Why does understanding require effort? Five bodies of research each identify a phenomenon that, this essay argues, shares a common mechanism. The label **productive resistance** is this essay's interpretive synthesis, not a term any of the cited sources use. The argument is that these five traditions are describing different facets of the same underlying dynamic: friction that forces the learner to externalize and revise their mental model.

**Constructionism** (Papert, 1980): learning is especially potent when the learner is building a shareable artifact. The artifact externalizes the mental model. Gaps in understanding become compilation errors or wrong outputs. Children who *wrote* educational software about fractions learned far more deeply than those who *used* the same software. Papert's students called it "hard fun" — fun because it was hard, not in spite of being hard. The resistance of the material is the mechanism.

**Reflective practice** (Schön, 1983): reflection-in-action is the learning moment — when something surprises a practitioner mid-work, the tacit knowing becomes an object of scrutiny. A failing test that was expected to pass. A refactoring that reveals an assumption. Production pressure kills reflection-in-action by incentivizing the patch over the pause.

**Deliberate practice** (Ericsson, 1993): production coding, once automatized, stops building skill. The plateau is not a talent ceiling; it is where conscious effort stops. Deliberate practice requires operating at the edge of failure. Production needs reliability. The two are structurally opposed.

**Epistemic actions** (Kirsh & Maglio, 1994): actions taken to gain information, not to advance toward a goal. The TDD red phase is an epistemic action — the failing test makes the design problem concrete and perceptible. Print statements, exploratory refactoring, spike code — all epistemic actions. Neth & Payne (2002) found that epistemic actions improve within-task performance — participants who could try moves without committing reduced their overall move count. The broader distributed cognition literature suggests that epistemic action use increases with expertise — experts externalize more, not less.

**Debugging as learning** (Goedecke; Weimer et al., IEEE TSE 2024): debugging forces construction of accurate mental models. Weimer et al. provide the first neurally-grounded model showing debugging stages are neurally and behaviorally distinct. A bug is where the developer's mental model diverges from reality. Anthropic's own study found AI-assisted developers scored 50% on comprehension quizzes versus 67% for manual coders, with the largest gap on debugging questions — the tasks that force the deepest model construction.

The implication is direct: AI tools that remove debugging, refactoring, and test-writing do not merely remove friction. They remove the epistemic work that makes a developer genuinely competent. A build skill that preserves productive resistance does not add overhead for its own sake. It protects the mechanism by which understanding gets built.

---

## 4. What AI-Generated Code Actually Does to Codebases

The understanding gap would be concerning even without empirical evidence. The empirical evidence makes it urgent — and it reveals that the patterns are not all the same kind of problem.

The patterns documented in AI-generated codebases fall into three categories: patterns that are **genuinely novel** (mechanistically require AI generation to exist), patterns that are **exacerbated** (existed in human codebases but AI makes measurably worse through a specific mechanism), and patterns that are merely **accelerated** (the same old problems, just more of them because code is generated faster). The distinction matters because each category requires a different intervention.

### The Longitudinal Signal

GitClear's 2025 analysis of 211 million changed lines (January 2020 through December 2024, from repositories owned by Google, Microsoft, Meta, and enterprise C-Corps) shows a structural inversion: refactoring dropped from 25% of changed lines in 2021 to less than 10% in 2024. Copy/pasted lines rose from 8.3% to 12.3%. **2024 was the first year in the dataset where copy/pasted lines exceeded refactored lines.** The refactoring counterforce — the thing that traditionally checks duplication, consolidates patterns, and maintains coherence — is declining at exactly the rate AI-assisted generation is increasing.

The "Debt Behind the AI Boom" study (arxiv 2603.28592, March 2026) analyzed 304,362 verified AI-authored commits across 6,275 GitHub repositories. Of 484,606 distinct issues found, 89.1% were code smells. **24.2% of AI-introduced issues survived at the latest revision.** The debt does not self-resolve.

### Genuinely Novel Patterns

These patterns could not exist without AI code generation. Their mechanisms require stateless generation, context-window limits, or training-data distribution properties.

**Constraint Decay** (arxiv 2603.09701, "Interaction Smells in Multi-Turn LLM Code Generation"): earlier instructions lose influence as conversation length grows. The model does not *forget* a constraint — it probabilistically de-weights it as positional distance increases. The result: requirements established in turn 3 are silently violated in turn 15. Five specific interaction smells emerge from this mechanism: Must-Do Omission (ignoring a positive constraint), Must-Not Violation (violating a negative constraint), Code Rollback (reverting to an earlier version, discarding progress), Cross-Turn Inconsistency (logic contradicting prior turns), and Partial Functionality Breakdown (previously working code silently broken by a later generation). A human colleague who ignores an explicit constraint either misunderstood or disagreed. The model de-weights it due to architectural limits — a failure mode with no human analog.

**Slopsquatting** (FOSSA, 2025; Snyk, 2025): LLMs generate package names from distributional priors, not by querying a live package registry. Roughly 20% of generated code samples contain at least one non-existent package (Snyk). The hallucinated names are deterministically reproducible — the same prompt produces the same phantom package name in 58%+ of runs (FOSSA). This creates a stable, exploitable attack surface: adversaries can enumerate commonly hallucinated names and register them on npm/PyPI with malicious payloads. Typosquatting requires a human to make a typo. Slopsquatting requires no user error — the "mistake" is baked into the generation process and repeatable.

**Intent Debt** (Storey et al., arxiv 2603.22106, "From Technical Debt to Cognitive and Intent Debt," March 2026): code generated without externalized rationale that future AI agents then reason about incorrectly. This is a second-order failure mode that requires both a generative AI (producing rationale-free code) and a downstream reasoning AI (interpreting that code without access to the intent behind it). The code works. No human holds the "why." A future agent asked to modify it will infer intent from structure — and the inference may be wrong in ways no test catches. Intent debt is the artifact-level manifestation of the opacity problem: it is comprehension debt that has metastasized beyond the human team to the tools themselves.

### Exacerbated Patterns

These patterns exist in human codebases but AI makes them measurably worse through specific mechanisms — usually stateless generation, bounded context, or training-data memorization. They are the patterns most amenable to intervention through the build, refactor, and review skills, because the intervention is the same as for the human version, just applied more deliberately.

**Avoidance of Refactors** (Ox Security, 80-90% prevalence; corroborated by GitClear's refactoring decline and arxiv 2511.04824): AI generates functional code but never architecturally improves what exists. Human developers refactor opportunistically — the friction of living in the codebase makes accumulation visible and costly. AI has no such friction. Each session adds; none restructure. arxiv 2511.04824 ("Agentic Refactoring") found that AI agents perform 43.0% high-level refactorings versus 54.9% for humans, dominated by low-level cosmetic operations (renaming, type adjustments). CodeScene found LLMs succeed at explicit refactoring tasks only 37% of the time. The smell is not that AI *cannot* refactor — it is that the default mode of generation is additive, and the refactoring counterforce must be externally imposed.

**Over-Specification** (Ox Security, 80-90% prevalence; corroborated by arxiv 2510.03029 and the Cursor study showing 41% complexity increase): hyper-specific single-use solutions rather than generalizable components. This is the inversion of Fowler's "Speculative Generality" — instead of abstractions that will not be needed, the AI builds implementations that cannot be reused. The mechanism is prompt optimization: the model solves the stated problem precisely and completely, with no incentive to consider adjacent problems the solution might serve. Phantom logic — defensive code for imaginary edge cases that cannot be triggered by any real input path — is a related manifestation, increasing the codebase's cognitive surface area without increasing its capability.

**Distributed Incoherence** (this essay's label for a pattern described across multiple practitioner reports): a significant architectural failure mode that is not the classical god class but something adjacent. Each session produces a reasonable local decomposition that is inconsistent with other sessions' decompositions of the same domain. Responsibilities are split inconsistently across modules that were each well-structured at generation time. Practitioners describe "Frankenstein codebase" effects (Kognitos, 2025); Ox Security documents inconsistent layering and return-to-monolith tendencies. The mechanism is stateless generation without architectural memory — the model defaults to locally reasonable solutions that are globally incoherent. The aggregate resembles a god class in scope but distributed across files and impossible to find by searching for any single large class.

**Bugs Déjà-Vu** (Ox Security, 70-80% prevalence; corroborated by arxiv 2503.11082): identical bugs recur throughout the codebase. Two independent mechanisms produce the same outcome. First, session amnesia: the model has no persistent learning across sessions, so a bug fixed in session 3 reappears in session 7 because the model's starting point is identical. Second, training-data memorization: arxiv 2503.11082 ("LLMs are Bug Replicators") found that 44-83% of bugs LLMs generate are identical to historical bugs in the training data. GPT-4o's identical-bug rate reaches 82.61%. The model has memorized problematic code patterns rather than learning corrective principles.

**Oracle Mirroring** (Ox Security, 40-70% prevalence; strongly corroborated by arxiv 2410.21136, arxiv 2412.14137, and arxiv 2603.23443): AI-generated tests validate the implementation, not the intent. The model generates tests by analyzing what the code *does*, not by specifying what it *should do*. When the implementation has a bug, the test validates the buggy behavior as correct. The result: 87% line coverage with only 38% mutation kill rate. arxiv 2412.14137 found that 68.1% of AI-generated test cases pass on buggy code but fail on correct implementations — the test suite is literally backwards. arxiv 2603.23443 found that over 99% of tests failing on semantically-altered code still pass on the original program. Coverage metrics lie. Mutation testing is the honest proxy. The remediation arm is mutation testing rather than refactoring, placing this smell in a different intervention category.

**Logic Drift**: business rules that mutate silently during fix sessions. A discount threshold shifts from 10% to 12%. A validation rule that rejected null values now accepts them. An approval workflow changes from requiring two signatures to one. The AI is not making errors in the classical sense — it produces code consistent with the local prompt, but the local prompt is not the canonical specification. Over sessions, the business logic encoded in code diverges from the business logic the team believes it encoded. This is the most insidious exacerbated pattern because it passes all automated checks — the code works, the tests (if updated) pass, the behavior changed intentionally from the model's perspective. Only a human who holds the canonical business rules can detect it.

**Comprehension Debt** (Osmani, March 2026): the growing gap between how much code exists and how much of it any human understands. The phenomenon predates AI — inherited systems, library internals, tribal knowledge that walked out the door have always produced code no one fully comprehends. What AI adds is a velocity-comprehension gap of unprecedented magnitude: AI generates at 5-7x the rate developers absorb (Osmani's practitioner estimate). Anthropic's study found a 17% comprehension reduction in a randomized controlled trial of 52 engineers.

Unlike technical debt, comprehension debt breeds false confidence. CI is green. Tests pass. The code is syntactically clean. Understanding has quietly hollowed out underneath. Technical debt is a known liability — it can be enumerated and scheduled for payoff. Comprehension debt is unknown: the developer does not know what they do not understand.

### Accelerated Patterns

The remaining patterns documented in AI-generated code — broad exception handling, unused variables, shadowed outer variables, security vulnerabilities, readability issues — are traditional code smells at higher volume. The "Debt Behind the AI Boom" study's top five most frequent issues are all classical. These do not require novel intervention; they require the traditional interventions (linting, review, refactoring) to be applied consistently despite the higher generation rate.

The honest bottom line: only three patterns (Constraint Decay, Slopsquatting, Intent Debt) have mechanisms that strictly require AI code generation to exist. Everything else is "happens more" or "happens via a new mechanism in a known category." That does not make the exacerbated patterns less important — the GitClear and Liu et al. data show the scale effects are real and the debt persists. But it means the intervention for most patterns is a more deliberate application of known practices (refactoring, TDD, stewardship, review), not an entirely new kind of practice.

---

## 5. Red, Green, Refactor — Reclaimed

The TDD cycle — red, green, refactor — is well-established. But in the age of AI-assisted development, each step serves a different epistemic function than it did in the purely human era.

**Red** is an epistemic action (in Kirsh & Maglio's sense). The failing test makes the design problem concrete and perceptible. It is not a verification step — it is a thinking tool. A separate but related finding from the TDAD paper (arxiv 2603.17973) shows that on the agent side, adding procedural TDD instructions *without* test-map context actually increased regressions to 9.94%, worse than the vanilla baseline of 6.08%. The TDAD finding is about agent regression rates, not developer cognition — but it reinforces the design implication: the red step must give the agent the right context (test maps, integration points), while giving the developer the right question (what behavior am I specifying, and why?).

**Green** is a pragmatic action. AI excels here. Generate the simplest code that makes the test pass. This is where AI-assisted development legitimately accelerates — the generation of code against a well-specified test.

**Refactor** is where the epistemic work intensifies. Kent Beck: "In this tidying, you are taking your hard-won understanding and putting it back into the code." But the refactor step in an AI-assisted codebase must do more than traditional tidying. It is the step where AI-specific damage gets caught — because "Avoidance of Refactors" is the defining AI smell. The model never refactors. The refactor step is the human counterforce.

The refactor step, reconceived for AI-assisted development, operates at three levels:

1. **Smells**: Identify what is wrong. Fowler's catalog (22 smells, over 60 techniques, organized problem-first on refactoring.guru) provides the classical vocabulary. AI-exacerbated smells (Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Déjà-Vu, Oracle Mirroring, Logic Drift) extend it. Novel AI smells (Constraint Decay, Slopsquatting, Intent Debt) require awareness of failure modes that have no human analog.
2. **Patterns**: Apply the appropriate technique. The refactoring catalog is organized by inverse pairs (Extract Method ↔ Inline Method) because direction depends on context. The codebase-audit skill's ten-lens analysis provides architectural diagnosis. What was missing is the remediation arm — the skill that takes findings and drives the actual refactoring with understanding.
3. **Methodology**: Check the change against architectural intent. Does the code land in the right module? Does it respect the dependency rules? Does it use the right vocabulary? Stewardship, in RDD terms. This is where traditional code smells are insufficient — the architectural anti-patterns of AI-generated code (distributed incoherence, inconsistent layering, return-to-monolith) require checking against an architectural vision, not just against local code quality.

This three-level refactor step integrates naturally into the build cycle. No separate refactoring sprint. No heavyweight pre-work. The refactoring happens at the moment of maximum understanding — right after the developer has made the test pass and holds the implementation in working memory.

---

## 6. The Composable Skill Architecture

The research points to a family of composable skills, not a single monolithic build skill. Each skill represents a distinct epistemic activity. Each can be used standalone or composed within a build cycle.

### The Shared Foundation: Context Gathering

Every skill in the family needs to answer the same pre-work questions: What am I working with? Why does it exist? What constraints apply? What assumptions are in play? What should I verify?

In pipeline mode (full RDD corpus), the answers come from the artifact trail. In context-reconstructive mode, the answers are synthesized from whatever sources are available: tickets, codebase, discussion threads, docs, git history, verbal description.

The review skill already implements both modes. The build skill currently implements only the pipeline mode. Debug and refactor skills do not yet exist as standalone utilities.

The shared context-gathering protocol:

1. **Detect mode** — check whether RDD artifacts exist. Offer corpus-grounded or context-reconstructive.
2. **Prompt for breadcrumbs** — if context-reconstructive: "What context do I need? Share ticket URLs, docs, paste threads, or describe the situation."
3. **Fetch and read** — heterogeneous source handling. Graceful degradation if tools are unavailable.
4. **Synthesize orientation** — answer the five questions (who/why, what, scope/integration/testability, ambiguities, demo-ability) from available evidence.
5. **Validate with the user** — "Does this capture the context? What would you adjust or add?" This validation is load-bearing. The user correcting the synthesis is where understanding begins.

### Build

The outer loop: one work item at a time, driven by scenarios derived from context (in pipeline mode, from `scenarios.md`; in context-reconstructive mode, from the orientation's testable behaviors). Red → Green → Refactor at three levels. Stewardship checkpoints at natural boundaries. Integration verification against real neighbors, not stubs. Epistemic engagement (reflection time) at scenario group boundaries.

Build composes the other skills: when a bug is encountered, it invokes the debug skill's hypothesis-trace-understand-fix cycle. When the refactor step identifies smells, it invokes the refactor skill's diagnostic-remediation cycle. When a stewardship checkpoint warrants deeper review, it invokes the review skill's orientation-questions cycle.

### Debug

Debugging is a first-class epistemic activity, not an error-handling mode. The research is clear: debugging forces mental model construction at the deepest level. The debug skill would follow the hypothesis-test cycle (Goedecke; ACM Queue's "debugging mindset"):

1. **Understand the system** — orient using the shared context protocol
2. **Hypothesize** — what is the mental model divergence? Where does expectation differ from reality?
3. **Trace** — follow data flow to the divergence point. Epistemic actions: print statements, breakpoints, exploratory reads
4. **Understand the bug** — the bug is where the mental model was wrong. Name the misunderstanding, not just the fix
5. **Fix with tests** — TDD the fix. The test encodes the corrected understanding

Time pressure is real. The debug skill must adapt to urgency — a production incident and a learning exercise have different time budgets. But even under pressure, "what was my mental model wrong about?" is a question that takes seconds, not minutes, and prevents the same class of bug from recurring.

### Refactor

Refactoring is design discovery — reading made structural. The refactor skill would follow the smell-first diagnostic approach from refactoring.guru, extended with AI-specific smells:

1. **Diagnose** — what smells are present? Classical (Fowler) and AI-specific (Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Déjà-Vu). The codebase-audit skill's lenses provide the diagnostic framework.
2. **Select technique** — from the catalog, with awareness of inverse pairs. Direction depends on what the code needs right now.
3. **Apply** — structure change only, committed as `refactor:`. Behavior stays constant.
4. **Verify** — tests still pass. The change was safe.
5. **Encode understanding** — the refactored code should be more legible than what it replaced. If naming changed, the domain vocabulary may need updating.

The refactor skill also handles the architectural anti-patterns specific to AI-generated codebases: consolidating parallel implementations (distributed incoherence), enforcing consistent layering, removing phantom logic for imaginary edge cases, and checking that dependency direction matches architectural intent.

Timing follows the four triggers from refactoring.guru: rule of three, when adding a feature, when fixing a bug, during review. All opportunistic — refactoring in service of other work, not as a separate sprint.

### Review

Already implemented as `rdd-review` with two modes. Produces questions for the reviewer's thinking, not comments for forwarding. Complements build stewardship (which checks architectural drift) by building the reviewer's understanding of design intent, assumption validity, and decision rationale.

---

## 7. The Codebase Audit Connection

The codebase-audit skill provides comprehensive multi-lens diagnosis across ten analytical lenses. Its finding format (Observation, Pattern, Tradeoff, Question, Stewardship) is pedagogically structured. It uses Mäntylä's taxonomy for code smells, architectural anti-pattern detection, and convergence-based prioritization.

The gap: it stops at findings. The audit diagnoses; nothing remediates.

The refactor skill is the action arm. But the relationship is not simply audit → refactor. Three integration points emerge:

1. **Full codebase audit → refactor plan.** The audit's prioritized stewardship guide feeds the refactor skill with diagnosed, evidence-based work items. This is the comprehensive mode the user wants — the audit that can "undertake an entire codebase from a refactoring perspective."
2. **Targeted lens checks during build.** The build skill's stewardship checkpoints already run architectural conformance checks. These could invoke specific audit lenses (Structural Health, Dependency & Coupling, Test Quality) in a targeted way — not a full codebase audit, but the relevant lenses applied to the code just written.
3. **AI-smell detection.** The audit's Structural Health lens uses Fowler's taxonomy. Extending it with AI-specific smells (Avoidance of Refactors, Over-Specification, Distributed Incoherence, circular test suites) would make it sensitive to the distinctive pathologies of AI-generated codebases.

---

## 8. Invariant Tensions

The research surfaces two tensions with existing domain model invariants that require attention:

**Invariant 3 (pragmatic/epistemic boundary) and context gathering.** The context-gathering protocol automates fetching and synthesis (pragmatic). The user validates and corrects (epistemic). This boundary is clean. But in time-pressured scenarios (production debugging), the temptation is to skip validation and act on the synthesis directly. The skill must make validation lightweight enough that skipping it feels like cutting a corner, not removing overhead. Even under pressure, "does this capture the situation?" is one sentence.

**Invariant 4 (productive, not merely brief) and time budgets.** The review skill already handles this with its time budget prompt: "How much time do you have?" The build, debug, and refactor skills need the same mechanism. Five minutes of genuinely oriented work beats thirty minutes of unfocused generation. The skill should scale engagement to available time, not impose a fixed ceremony.

No invariant appears to be contradicted, though the resolution of these tensions is a design question for the skill implementations, not a settled conclusion. The context-reconstructive approach extends Invariant 0 (speak with authority) to codebases that lack the full artifact pipeline — the same outcome, achieved through a different mechanism. Whether the mechanism is sufficient — whether lightweight validation under time pressure maintains the pragmatic/epistemic boundary, whether time-budget scaling works for the cognitive demands of building as it does for review — is an empirical question that the skill implementations will test.

---

## 9. The Differentiator

The ecosystem has no shortage of tools that help developers write code faster. Superpowers enforces discipline. Cursor injects context. Copilot suggests completions. All optimize for the agent's output quality or the process's compliance.

What none of them do is ensure the developer understands what was built. Not in the abstract sense of "read the code after it's generated." In the constructionist sense: the developer participated in building the understanding that the code expresses. The developer can explain to a colleague — without AI assistance — who the system serves, what it does, why it is structured this way, what assumptions it encodes, and what would break if those assumptions were wrong.

This is the RDD differentiator applied to everyday building. Not a six-phase pipeline. Not a heavy artifact corpus. A family of composable skills that share a context-gathering foundation, preserve productive resistance at the points where understanding matters, and actively counteract the structural pathologies that AI-assisted development introduces.

The mechanism is the full red-green-refactor cycle: the red step specifies understanding, the green step generates code, the refactor step catches AI-specific structural damage and encodes understanding back into the codebase. The refactor step, specifically, is reclaimed from its traditional role as code tidying and elevated to the primary site where AI structural pathologies get caught — because Avoidance of Refactors is the defining AI smell, and the refactor step is the human counterforce the model never provides. But the *cycle* is what produces both code quality and developer understanding. Red → Green → Refactor(smells → patterns → methodology). The discipline of TDD provides the rhythm. The epistemic engagement provides the understanding. Together, they produce software that the developer can speak to with authority.

---

## Sources

- Willison, S. "Not all AI-assisted programming is vibe coding (but vibe coding rocks)." simonwillison.net, March 2025.
- Osmani, A. "Vibe Coding is not the Same as AI-Assisted Engineering." medium.com/@addyosmani, November 2025.
- Osmani, A. "Agentic Engineering." addyosmani.com/blog/agentic-engineering.
- Osmani, A. "Comprehension Debt." addyosmani.com/blog/comprehension-debt, March 2026.
- Osmani, A. "Avoiding Skill Atrophy in the Age of AI." addyo.substack.com.
- Codemanship. "Why does TDD work so well in AI-assisted programming?" codemanship.wordpress.com, January 2026.
- TDAD (Test-Driven Agentic Development). arxiv 2603.17973.
- Latent Space / Kirkovska. "TDD for AI Agents." latent.space/p/anita-tdd.
- Agentic Coding Handbook, TDD section. tweag.github.io/agentic-coding-handbook/WORKFLOW_TDD.
- Bacchelli, A. & Bird, C. "Expectations, Outcomes, and Challenges of Modern Code Review." ICSE 2013.
- Papert, S. *Mindstorms: Children, Computers, and Powerful Ideas.* Basic Books, 1980.
- Papert, S. "Situating Constructionism." In Harel & Papert (eds.), *Constructionism*, Ablex, 1991.
- Schön, D.A. *The Reflective Practitioner: How Professionals Think in Action.* Basic Books, 1983.
- Hazzan, O. "The reflective practitioner perspective in software engineering education." *Journal of Systems and Software*, 63(3), 2002.
- Ericsson, K.A., Krampe, R.Th., & Tesch-Römer, C. "The role of deliberate practice in the acquisition of expert performance." *Psychological Review*, 100(3), 1993.
- Kirsh, D. & Maglio, P. "On distinguishing epistemic from pragmatic action." *Cognitive Science*, 18(4), 1994.
- Neth, H. & Payne, S. "Thinking by Doing? Epistemic Actions in the Tower of Hanoi." 2002.
- Goedecke, S. "Debugging, Emotional Resilience, and Mental Models." seangoedecke.com.
- Weimer, W. et al. "Towards a Cognitive Model of Dynamic Debugging." IEEE TSE, 2024.
- "The Debugging Mindset." ACM Queue / Communications of the ACM.
- Anthropic. "How AI assistance impacts the formation of coding skills." 2026.
- "AI Coding Assistance Reduces Developer Skill Mastery by 17%." InfoQ, February 2026.
- Beck, K. *Tidy First?* O'Reilly, 2023.
- Fowler, M. *Refactoring.* 2nd ed. Addison-Wesley.
- Refactoring.guru. refactoring.guru/refactoring/catalog.
- North, D. BDD writings. dannorth.net/tags/bdd.
- GitClear. "AI Copilot Code Quality: 2025 Data Suggests 4x Growth in Code Clones." gitclear.com/ai_assistant_code_quality_2025_research, 2025.
- arxiv 2510.03029. "Investigating The Smells of LLM Generated Code." October 2025.
- arxiv 2603.28592. "Debt Behind the AI Boom: A Large-Scale Empirical Study of AI-Generated Code in the Wild." March 2026.
- arxiv 2512.22387. "AI-Generated Code Is Not Reproducible (Yet)." December 2025.
- arxiv 2407.06153. "What's Wrong with Your Code Generated by Large Language Models?" July 2024.
- Ox Security. "The Army of Juniors: The AI Code Security Crisis." October 2025.
- CodeRabbit. "State of AI vs. Human Code Generation Report." 2026.
- arxiv 2603.09701. "An Empirical Study of Interaction Smells in Multi-Turn Human-LLM Collaborative Code Generation." 2026.
- arxiv 2503.11082. "LLMs are Bug Replicators." March 2025.
- arxiv 2410.21136. "Do LLMs generate test oracles that capture the actual or the expected program behaviour?" October 2024.
- arxiv 2412.14137. "Design choices made by LLM-based test generators prevent them from finding bugs." December 2024.
- arxiv 2603.23443. "Evaluating LLM-Based Test Generation Under Software Evolution." March 2026.
- arxiv 2511.04824. "Agentic Refactoring: An Empirical Study of AI Coding Agents." November 2025.
- Storey, M.-A. et al. arxiv 2603.22106. "From Technical Debt to Cognitive and Intent Debt." March 2026.
- FOSSA. "Slopsquatting: AI Hallucinations and the New Software Supply Chain Risk." 2025.
- Kognitos. "Why Vibe Coding Breaks in Production." 2025.
