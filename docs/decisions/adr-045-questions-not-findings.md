# ADR-045: Questions as Primary Review Output

**Status:** Accepted

## Context

Essay 010 establishes that the reviewer-as-passthrough anti-pattern — forwarding AI-generated findings without engaging with them — eliminates the cognitive engagement that produces review's actual value (knowledge transfer, shared understanding). The reflections from Essay 010 identify a key design mechanism: "findings tell you what to think; questions tell you what to think *about*."

The superpowers code-reviewer agent produces findings categorized as Critical/Important/Minor with a merge verdict. This is a verdict machine — it optimizes for the reviewer's verdict, not the reviewer's understanding. The reviewer who receives findings may merge or reject without having built a mental model of the code.

The domain model defines Review Question as "the primary output of the review skill: questions that guide the reviewer's thinking rather than findings that tell them what to think." The product discovery value tension "questions vs. findings" notes that pure question-mode risks making the reviewer work to rediscover something the agent already knows (e.g., a missing null check).

## Decision

The `/rdd-review` skill produces two distinct output types:

**Review questions (primary output):** Questions grounded in the orientation context that guide the reviewer's analysis. These are the questions a thoughtful senior reviewer would ask if they had unlimited orientation time. Examples: "This change touches a module the ADR marked as hard-to-reverse — was that intentional?" or "The ticket describes goal X, but this implementation approaches it via Y — what's the reasoning?" The reviewer engages with these questions, forming their own judgment.

**Mechanical findings (secondary output):** Clear, objective issues that do not require judgment — missing type checks, circular dependencies, obvious bugs, style violations. These are surfaced separately and explicitly labeled as mechanical. They do not carry severity ratings (Critical/Important/Minor) because the reviewer should evaluate severity themselves based on context.

The skill does NOT produce:
- A merge verdict (approve/reject)
- Severity-categorized issue lists
- AI-authored review comments for the reviewer to post as their own

The number of questions adapts to the reviewer's available time (zone of proximal development): when time is short, surface the single most important question; when time is ample, surface a fuller set. The skill asks the reviewer about their time budget at the start.

**Rejected alternative:** Findings-only output (the superpowers pattern). Rejected because findings tell the reviewer what to think, producing verdicts without understanding. The reviewer who receives findings may act on them without building a mental model — the reviewer-as-passthrough anti-pattern with extra steps.

**Rejected alternative:** Questions-only output (no mechanical findings). Rejected because forcing the reviewer to discover an obvious null check through questions is wasteful — it consumes the reviewer's cognitive budget on work that requires no judgment, leaving less capacity for the analysis that does. As the essay notes, the agent's role is to free the reviewer's cognitive budget "for the judgment-heavy work that only humans can do." Mechanical issues are not judgment calls.

**Classification heuristic:** A finding is mechanical if it can be determined without knowledge of intent, context, or system history — the agent can verify it against objective criteria alone (missing type check, circular dependency, syntax error). A question is warranted when the issue could be correct given an intent or context the agent does not have — when evaluation requires the reviewer's recognition-primed judgment.

## Consequences

**Positive:**
- Questions build understanding in the reviewer — they must think about the answers
- Mechanical findings free the reviewer's cognitive budget for judgment-heavy work
- No merge verdict prevents the skill from becoming an auto-approval pipeline
- Adaptive depth respects the reviewer's available time

**Negative:**
- Questions require more reviewer effort than receiving a findings list — this is a feature (desirable difficulty) but may feel slower
- The boundary between "question-worthy" and "mechanical finding" requires judgment — the skill must make this classification

**Neutral:**
- The output format is conversational, not structured as a formal report
- The reviewer's responses to questions are not captured as artifacts — they exist in conversation
