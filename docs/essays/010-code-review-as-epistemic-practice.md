# Code Review as Epistemic Practice
*2026-03-31*

## Abstract

This essay investigates what code review actually accomplishes, how AI-assisted workflows threaten its core value, and what a review process designed for genuine understanding would look like. Research drew on the Bacchelli & Bird empirical study of review at Microsoft (ICSE 2013), the CRDM cognitive model of reviewer decision-making (2025), Google's engineering practices, the SmartBear/Cisco quantitative study, and analysis of existing Claude code-review skills. The central finding is that code review is primarily an epistemic activity — a mechanism for knowledge transfer, shared understanding, and reviewer learning — not a defect-finding exercise, though defect-finding is a real but minority outcome (~12.5% of review discussion). The implication for skill design is that the review process should be optimized for producing understanding in the reviewer, with a concrete success criterion: the reviewer can discuss the code changes without AI assistance afterward.

## The Expectations/Outcomes Gap

The most consequential finding in code review research comes from Bacchelli and Bird's 2013 study at Microsoft, which classified 570 actual review comments by topic. Developers and managers both rank "finding defects" as the primary motivation for code review. In practice, defect-related comments comprise roughly one-eighth of all review discussion. The dominant category is code improvements — readability, consistency, dead code removal — followed by knowledge transfer, team awareness, and alternative solutions. Defect finding ranks fourth.

The study was conducted at a single company (Microsoft), and the specific ratio may vary across organizations and codebases. But the direction of the gap — that defect finding is a smaller portion of review activity than practitioners expect — has been conceptually replicated in subsequent work.

This gap matters because it means review processes and tools optimized for defect detection are optimizing for the minority use case. The actual primary outputs — knowledge transfer, shared mental models, code improvement, team awareness — receive no explicit support from most review workflows. They occur as side effects of the human cognitive engagement that review demands.

The Bacchelli and Bird study also identifies "code and change understanding" as the key challenge of reviewing. The bottleneck is not judgment but comprehension: reviewers struggle to understand what code does and why it exists. Most tooling fails to address this need. A diff viewer shows what changed; it does not explain why the change was made, what alternatives were considered, or what constraints shaped the approach.

## The Cognitive Structure of Review

A 2025 ethnographic think-aloud study mapped the cognitive process of code review onto Klein's Recognition-Primed Decision (RPD) model — the same framework used to describe decision-making by firefighters, military commanders, and emergency physicians. The resulting CRDM (Code Review as Decision-Making) model identifies two distinct phases.

**Orientation** accounts for approximately 27% of verbalized cognitive activity in think-aloud protocols (a measure of what reviewers articulate, which may not capture all cognitive effort). The reviewer establishes context: what repository, who authored, why the change was made, what it is intended to accomplish. This phase is linear and forward-moving — reviewers rarely revisit these questions once they advance to the analytical phase.

**Analysis** accounts for approximately 73% of cognitive effort. The reviewer iterates through cycles of understanding, assessing, and planning. Pattern recognition from experience drives the process: the reviewer reads code, recognizes familiar (or unfamiliar) patterns, mentally simulates outcomes, and decides on action — write a comment, seek more information, approve.

The critical implication is that effective review requires a pattern library built from experience. This explains why developers need substantial time to become proficient reviewers in unfamiliar codebases and why the orientation phase, though a minority of total effort, is essential — without adequate orientation, the analytical phase has no context against which to evaluate patterns.

Most review tooling and processes skip orientation entirely. The reviewer receives a diff, possibly a ticket title, and is expected to begin analysis immediately. The CRDM model suggests this is structurally wrong: without orientation, analysis lacks the context needed for recognition-primed judgment.

## What Senior Reviewers Actually Do

Experienced technical leads describe reviewing at a different level of abstraction than junior reviewers. Where junior reviewers focus on correctness ("does this work?"), senior reviewers focus on fitness ("should this exist? does it belong here? what does it cost in the future?").

Several patterns recur in practitioner accounts:

**Reversibility classification.** Senior reviewers mentally categorize decisions by their inertia. Hard-to-reverse decisions — data models, API contracts, partition strategies — receive rigorous scrutiny. Easy-to-reverse decisions — variable names, internal implementation details — receive pragmatic review. This triage is itself a form of expertise: knowing which decisions compound and which can be cheaply corrected later.

**Architectural coherence.** Experienced reviewers detect violations that passing tests cannot: low cohesion, unintended coupling, layer boundary leaks. This requires a mental model of the system that the diff alone cannot provide — it requires understanding the system's structure beyond the changed files.

**Future maintenance burden.** The question "who will maintain this, and what will they need to understand?" is a prediction about future cognitive load. It has no correct answer derivable from the current code; it requires judgment about how the codebase will evolve.

**Questions over dictates.** Multiple sources emphasize that senior reviewers ask "why did you choose this approach?" rather than prescribing alternatives. This serves both learning (the author must articulate reasoning) and epistemic humility (the reviewer might lack context the author has).

These activities share a common property: they cannot be reduced to checklists. They require situated judgment — the kind of judgment that the CRDM model identifies as recognition-primed, built from accumulated experience, and dependent on adequate orientation.

## The Quantitative Constraints

The SmartBear/Cisco study (2,500 reviews, 3.2 million lines of code, 10 months) established quantitative boundaries that constrain any review process:

- **Optimal review size: 200-400 lines of code.** Below 200, reviewers found the highest defect density. Above 400, comprehension degraded measurably.
- **Optimal speed: under 500 lines per hour.** Reviewers operating faster missed significantly more issues.
- **Attention limit: 60-90 minutes.** Performance degrades after approximately 60 minutes of continuous review.
- **The Ego Effect.** Developers write better code when they know it will be reviewed. Even spot-checking 20-33% of code triggered this improvement.
- **Author preparation matters.** Authors who annotated their code before review had significantly fewer defects — the act of explaining forces self-review.

These findings imply that review processes must respect cognitive limits. A review skill that encourages the reviewer to read and understand 200-400 lines deeply is more effective than one that attempts to process an entire large changeset at speed. The attention limit suggests that review sessions should be bounded, not open-ended.

The author preparation finding is particularly relevant: it suggests that the reviewer's understanding can be bootstrapped by the author's explanation. In an RDD context, this explanation already exists in the artifact trail. In a standalone context, the review process itself should elicit it.

## AI-Assisted Review and the Deskilling Risk

A dysfunctional workflow has emerged in teams using AI tools: developer generates code with AI assistance, AI tool reviews the code, developer skims the AI review summary, merge proceeds. The concern is not that AI reviews poorly in a mechanical sense — AI tools can be effective at surface-level checks (null handling, naming consistency, import ordering). The concern is structural: the workflow creates conditions for human disengagement.

**The Halo Effect.** AI-generated code looks cleaner than human-written code — better formatting, consistent naming, complete documentation strings. This surface quality reduces reviewer skepticism. CodeRabbit's 2025 analysis of 470 pull requests (320 AI-co-authored, 150 human-only) found that AI-authored pull requests contained an average of 10.83 issues versus 6.45 for human-written code, with security vulnerabilities appearing up to 2.74 times more frequently. The polish masks the problems.

**Signal degradation.** AI review tools generate high volumes of low-severity comments — style preferences, minor refactoring suggestions, pedantic observations. When a reviewer receives fifteen trivial comments, they are trained to skim. The sixteenth comment, which might identify a genuine architectural concern, receives the same inattention.

**The deskilling spiral.** Over-reliance on AI review risks eroding the human judgment it ostensibly supports. Medical literature on AI-induced deskilling documents an analogous pattern in a different domain: erosion of clinical judgment due to over-reliance on automated diagnostic systems. The analogy is suggestive rather than proven for software — direct evidence of AI-induced deskilling in code review has not yet been published. But the mechanism is plausible: developers who never practice critical evaluation may lose the ability to perform it, as the skill atrophies from disuse.

**Metric gaming.** Review velocity and comment categorization can be optimized as metrics while the actual function of review — producing understanding — is zeroed out. A bot that categorizes comments as important/unimportant and auto-approves when nothing is flagged "important" achieves perfect metrics and zero understanding. The review happened on paper; it did not happen in anyone's mind.

The pattern that emerges is the reviewer-as-passthrough: receiving AI-generated comments, forwarding them without evaluation, and claiming the review as their own work. This does a disservice to everyone involved — the author receives feedback from no one who understood their code, the reviewer learns nothing, and the team builds no shared understanding.

## The Opacity Bottleneck

When AI generates code at volume, a review bottleneck emerges naturally. This bottleneck is diagnostic, not pathological. It signals that the rate of code production has outpaced the rate of human understanding. The instinct to automate away the bottleneck — to have AI review AI-generated code — hides the understanding deficit without resolving it.

The bottleneck is the system saying: someone needs to understand this code before it enters the shared codebase. Removing the bottleneck by automating review means no one understands the code. It ships, it runs, it passes tests — and nobody on the team can explain what it does or why it works. The first time something goes wrong, the team discovers that their collective understanding of the system has gaps where automated code accumulated.

RDD's position would be that the bottleneck is a signal to be attended to, not a problem to be engineered away. The appropriate response is not faster review but smaller changes, better orientation, and review processes that build genuine understanding — even if this means the code pipeline moves more slowly.

## The Success Criterion

The practitioner articulated a concrete litmus test: after completing a review, the reviewer should be able to discuss the code changes without AI assistance. Not "the AI found three issues" but a genuine account of what changed, why, what the tradeoffs are, and what the reviewer's assessment is.

This criterion is isomorphic to RDD's essay-as-forcing-function: just as an essay exists because "if you cannot explain it in prose, you do not understand it well enough," a review exists because the reviewer should be able to explain what they reviewed. The Feynman test applied to code review.

This criterion also serves as a design constraint for any review process or tool. Every step should build toward the reviewer's ability to hold their own in a conversation about the code. The review is not complete when a verdict is rendered — it is complete when the reviewer can articulate the changes, the reasoning, and their assessment independently.

## Two Operating Modes

A code review skill designed around these principles needs two operating modes, distinguished by the availability of context.

**Corpus-grounded review** operates within an RDD artifact trail. Research essays answer "why does this problem matter?" and "what was considered?" Product discovery answers "who needs this and what are their needs?" The domain model provides the ubiquitous language — the reviewer can check whether code uses the agreed-upon concepts. ADRs record decisions and their rationale — the reviewer can verify whether code implements what was decided. Scenarios provide refutable behavior specifications. System design provides module decomposition and dependency rules. The reviewer inherits a provenance chain that grounds evaluation in context rather than guesswork.

**Context-reconstructive review** operates outside an RDD corpus — reviewing a colleague's merge request, evaluating an open-source contribution, assessing unfamiliar code. Here, the review process itself must perform a lightweight discovery: reading the ticket content, understanding the broader initiative, identifying stakeholders and constraints, surfacing assumptions, considering inversions. The reviewer reconstructs the orientation context that the CRDM model shows is essential for effective analytical review. This is RDD-lite: not the full phase sequence, but the same epistemic posture — understand before judging.

In both modes, the reviewer is building a mental model. In corpus-grounded mode, the artifacts scaffold that model. In context-reconstructive mode, the review process constructs the scaffold on the fly.

## The Agent's Role

If the reviewer-as-passthrough is the anti-pattern, what is the agent's proper role? The research suggests several legitimate functions:

**Orientation support.** The agent can gather and present context — related tickets, recent changes to affected files, relevant documentation, dependency graphs — that the reviewer would otherwise have to hunt for manually. This supports the orientation phase without replacing the reviewer's judgment.

**Mechanical checking.** The agent can handle surface-level verification — linting, type checking, test coverage analysis, dependency scanning — freeing the reviewer's cognitive budget for the judgment-heavy work that only humans can do.

**Question generation.** Rather than producing verdicts, the agent can surface questions the reviewer might want to investigate: "This function was last modified by three different authors in the past month — is the design stable?" or "This change touches a module the ADR marked as hard-to-reverse — was that intentional?"

**Comprehension scaffolding.** The agent can explain unfamiliar patterns, provide context on library usage, or summarize the history of a component — supporting the reviewer's understanding without replacing it.

In each case, the agent serves the reviewer's learning rather than substituting for it. The agent does not produce the review — it produces the conditions under which the reviewer can produce a better review. The verdict, the understanding, and the ability to discuss the code afterward remain with the human.

## Conclusion

Code review is not what most practitioners think it is. The research consistently shows that defect finding — the assumed primary function — is a minority outcome. The actual value lies in knowledge transfer, shared understanding, code improvement, and team awareness. These outcomes require genuine human cognitive engagement and cannot be preserved when that engagement is automated away.

A review skill designed for epistemic value would optimize for the reviewer's understanding rather than the reviewer's verdict. It would provide orientation before analysis, respect cognitive limits, leverage available context (whether from an RDD artifact trail or reconstructed in situ), and hold itself to a concrete success criterion: the reviewer can discuss the code changes without AI assistance afterward.

The agent's role in this process is to scaffold understanding, not to produce it. The agent gathers context, handles mechanical checks, generates questions, and explains unfamiliar patterns. The reviewer does the thinking, forms the judgment, and builds the mental model. The review belongs to the human — the agent makes the human's review better.

---

**Sources:**

- Bacchelli, A. & Bird, C. (2013). Expectations, Outcomes, and Challenges of Modern Code Review. *ICSE 2013*. https://dl.acm.org/doi/10.5555/2486788.2486882
- CRDM Model (2025). Code Review as Decision-Making. *Empirical Software Engineering*. https://link.springer.com/article/10.1007/s10664-025-10791-2
- SmartBear / Cisco Code Review Case Study. https://static0.smartbear.co/support/media/resources/cc/book/code-review-cisco-case-study.pdf
- Google Engineering Practices — Code Review. https://google.github.io/eng-practices/review/reviewer/
- Greptile (2025). There is an AI Code Review Bubble. https://www.greptile.com/blog/ai-code-review-bubble
- OX Security analysis of AI-authored pull requests (cited via Greptile and Builder.io)
- Klein, G. (1998). Sources of Power: How People Make Decisions. MIT Press. (RPD model referenced by CRDM study; original fieldwork with fireground and military commanders)
- CodeRabbit (2025). State of AI vs. Human Code Generation Report. https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report
