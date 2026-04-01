# Research Log: Code Review as Epistemic Practice

## Question 1: What do existing Claude code-review skills do, and where are the gaps?

**Method:** Codebase exploration of superpowers plugin (v5.0.7)

**Findings:**

The superpowers plugin implements code review across three files:

1. **Code-reviewer agent** — A "Senior Code Reviewer" that checks plan alignment, code quality (SOLID, error handling, type safety), architecture, documentation, and categorizes issues as Critical/Important/Minor. It operates on git diffs between two SHAs.

2. **Requesting-code-review skill** — Defines when to request review (mandatory after tasks, before merge) and how to dispatch the reviewer with a structured template (what was implemented, plan reference, git range).

3. **Receiving-code-review skill** — Strong anti-sycophancy principles: verify before implementing, push back when wrong, no performative agreement. The READ → UNDERSTAND → VERIFY → EVALUATE → RESPOND → IMPLEMENT pattern is well-designed.

**Gaps identified:**

- **No orientation phase.** The reviewer receives a diff and a plan reference. It never asks "why does this change exist?" or "what was the problem being solved?" The CRDM research shows reviewers spend ~27% of cognitive effort on orientation — the superpowers approach skips this entirely.
- **No learning mechanism.** The review produces a verdict (merge/don't merge), not understanding. The reviewer (human or agent) learns nothing about the domain, the constraints, or the tradeoffs that shaped the code.
- **Checklist-driven, not judgment-driven.** The review template is a checklist (error handling? type safety? tests?). This captures surface quality but misses what senior reviewers actually evaluate: fitness of approach, reversibility of decisions, architectural coherence, future maintenance burden.
- **No artifact integration.** The reviewer has no access to ADRs, domain models, research essays, or scenarios. It cannot evaluate whether the code implements what was *decided* or whether decisions were *followed*.
- **No distinction between structure and behavior.** The reviewer treats all code uniformly. RDD and the user's CLAUDE.md both emphasize separating structural changes from behavioral ones — the review process should reflect this.
- **Agent-as-oracle pattern.** The review is dispatched to a subagent that produces findings. The human receives a report. This is exactly the anti-pattern the user described — passing along AI-generated comments without genuine engagement.

**Implications:** The superpowers approach is a competent automated checker, but it is not epistemically valuable. It optimizes for defect finding (which research shows is ~12.5% of review value) while ignoring knowledge transfer, shared understanding, and reviewer learning (the other ~87.5%).

---

## Question 2: What does the research literature say about what code review actually is and does?

**Method:** Web search across academic research, industry studies, and practitioner writing

**Findings:**

### The expectations/outcomes gap (Bacchelli & Bird, ICSE 2013)

The most-cited finding in code review research: developers and managers rank "finding defects" as the primary motivation for code review. But when researchers classified 570 actual review comments at Microsoft, defect-related comments comprised only ~12.5% of the total. The actual primary activities:

1. Code improvements (readability, consistency, dead code) — dominant category
2. Knowledge transfer
3. Team awareness
4. Defect finding (expected #1, actual #4)
5. Alternative solutions

The study also identified "code and change understanding" as the key challenge — the bottleneck in review is comprehension, not judgment.

### The cognitive science of review (CRDM model, 2025)

A 2025 ethnographic think-aloud study mapped code review onto Klein's Recognition-Primed Decision (RPD) model — the same framework describing how firefighters and ER physicians make decisions under uncertainty.

Two phases:
- **Orientation (~27%):** Establish context and rationale — what repo, who authored, why changed, what's intended
- **Analytical (~73%):** Iterative cycle of understanding, assessing, and planning — pattern recognition from experience, mental simulation of outcomes

Critical implication: effective review requires pattern recognition built from experience. This is why it takes time to become a proficient reviewer in a new codebase — and why AI review is fundamentally limited for the judgment-heavy portion.

### Cognitive limits (SmartBear/Cisco study)

From 2,500 reviews of 3.2M lines across 10 months:
- Optimal review size: 200-400 LOC
- Optimal speed: under 500 LOC/hour
- Attention degrades after 60 minutes
- Individuals found up to 85% of defects; group meetings added only 4%
- Author preparation (self-annotation) significantly reduced defects
- The "Ego Effect": knowing code will be reviewed improves code quality even before feedback

### Google's engineering practices

- Design is the top review priority, not correctness
- Complexity is an explicit target: "too complex" = can't be understood quickly or likely to introduce bugs when modified
- Mentoring is first-class: "sharing knowledge is part of improving code health"
- Technical facts over opinions: style guides govern style, engineering principles govern design, personal preference governs nothing
- Speed is a team concern: fast response times eliminate complaints about strict review

### What senior reviewers actually do

Experienced tech leads review at a different abstraction level:
- **Reversibility classification:** Hard-to-reverse decisions (data models, API contracts) get rigorous review; easy-to-reverse decisions get pragmatic review
- **Architectural fit:** Detecting violations that passing tests cannot — cohesion, coupling, layer boundary leaks
- **Future maintenance burden:** "Who will maintain this? What will they need to understand?"
- **Questions, not dictates:** "Why did you choose this approach?" serves both learning and humility
- **One strategic focus per review:** Scale, failure modes, maintainability, or architecture — not all at once

**Implications:** Code review is fundamentally an epistemic activity — it is how teams build shared understanding of their systems. The actual value (knowledge transfer, team awareness, code improvement) goes largely unrecognized because everyone thinks review is about finding bugs. Any review skill that optimizes primarily for defect-finding is optimizing for the minority use case.

---

## Question 3: What goes wrong with AI-assisted review?

**Method:** Web search of industry analysis and practitioner writing

**Findings:**

### The broken pipeline

A dysfunctional workflow has emerged: Developer → AI generates code → AI reviews code → Developer skims AI summary → Merge. The critique is not that AI reviews poorly but that it creates conditions for human disengagement.

### Specific anti-patterns

1. **The Halo Effect:** AI-generated code looks cleaner (better formatting, complete docstrings), reducing reviewer skepticism. But OX Security data from 300+ repos found AI-authored PRs contain 10.83 issues on average vs. 6.45 for human-written code, with 1.5-2x more security vulnerabilities. The polish hides problems.

2. **Selective Blindness:** AI excels at surface-level issues (null checks, naming, import ordering) but misses context: an AI-approved caching layer that duplicated existing infrastructure, created GDPR concerns, and solved the wrong problem.

3. **Signal Degradation:** High volumes of low-value comments train reviewers to stop reading carefully. Comment #16 (the critical one) gets skimmed because comments #1-15 were trivial.

4. **Deskilling:** Over-reliance on AI review erodes human judgment. The medical literature on AI-induced deskilling provides a parallel: erosion of clinical judgment due to over-reliance on automated systems.

5. **The Self-Auditing Fallacy:** Having the same AI system write and review code is architecturally unsound — "an auditor preparing the books."

### What AI review can legitimately do

- First-pass triage of routine checks
- Consistent rule application across all PRs
- Freeing senior engineers from mechanical checks so they can focus on architecture and mentoring

**Implications:** The anti-pattern the user described — pointing an agent at code and passing comments along — is not just lazy but structurally harmful. It eliminates the cognitive engagement that produces the actual value of review (knowledge transfer, shared models, mentoring) while maintaining a hollow performance of the nominal function (defect finding). A well-designed review skill must make human disengagement harder, not easier.

---

## Question 4: How do RDD artifacts change the review equation?

**Method:** Analysis of existing RDD artifact corpus structure

**Findings:**

Within an RDD corpus, a reviewer has access to a provenance chain that most review contexts lack:

- **Research essays** answer "why does this problem matter?" and "what was considered?"
- **Product discovery** answers "who needs this and what are their jobs/pains?"
- **Domain model** provides the ubiquitous language — the reviewer can check whether code uses the right concepts
- **ADRs** record decisions and their rationale — the reviewer can check whether code implements what was decided
- **Scenarios** provide refutable behavior specifications — the reviewer can check whether code satisfies what was specified
- **System design** provides module decomposition, responsibility allocation, dependency rules — the reviewer can check architectural conformance
- **Field guide** maps design to implementation — the reviewer can locate what exists and what's missing

This is a fundamentally different review context than "here's a diff and a ticket title." The provenance chain means the reviewer can evaluate not just "does this code work?" but "does this code implement what was decided, for the reasons that were researched, using the language that was agreed upon?"

**Outside an RDD corpus** (the standalone / RDD-lite mode), the reviewer must reconstruct this context in situ: reading the ticket, understanding the broader initiative, identifying stakeholders, surfacing assumptions, considering inversions. The review process itself becomes a mini-discovery.

**Implications:** The skill needs two operating modes:
1. **Corpus-grounded:** Leverage existing RDD artifacts as review context
2. **Context-reconstructive:** Perform lightweight discovery as part of the review process itself

---

## Question 5: What is the success criterion for a review skill?

**Method:** Conversation with practitioner (project author)

**Findings:**

The practitioner articulated a litmus test: after completing a review, the reviewer should be able to discuss the code changes without AI assistance. Not "the AI found three issues" but a genuine articulation of what changed, why, what the tradeoffs are, and what the reviewer's assessment is.

This maps directly to:
- The Feynman technique: if you can't explain it simply, you don't understand it
- RDD's essay-as-forcing-function: if you can't write it in prose, you don't understand it well enough
- The CRDM orientation phase: genuine understanding requires internalizing context, not just receiving a report
- The distinction between "I received a review report" and "I reviewed the code"

The practitioner also identified the opacity problem with AI-generated code at volume: the review bottleneck that emerges is not a problem to be automated away but a signal that understanding hasn't kept pace with output. Automating review to remove the bottleneck hides the understanding deficit rather than resolving it.

**Implications:** The skill's design constraint is that every step should build toward the reviewer being able to hold their own in a conversation about the code. The review process is not complete until the reviewer can articulate the changes, the reasoning, and their assessment independently. This is the ultimate anti-opacity measure — it tests whether understanding was actually produced, not just whether a verdict was rendered.
