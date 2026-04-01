# Reflections: Code Review as Epistemic Practice
*2026-03-31*

## The Zone of Proximal Development as Design Principle

The central tension in the essay — where the line falls between the agent scaffolding understanding and replacing it — resolved through Vygotsky's zone of proximal development. The skill does not need to make the reviewer an expert. It needs to help them reach *enough* genuine understanding to be useful, in the time available. The ZPD is the space between "I have no idea what this code does" and "I can discuss these changes with the author." The agent operates in that zone.

## Questions as the Primary Output

The mechanism that resolves the scaffolding/replacement tension: the agent produces *questions*, not verdicts. "Based on this context, what questions should I be asking?" The reviewer brings raw context (tickets, docs, discussion threads); the agent synthesizes it and surfaces the questions a thoughtful reviewer would ask if they had unlimited orientation time. The reviewer then exercises judgment on those questions. Understanding belongs to the human; the agent accelerated the path to it.

This is structurally different from the superpowers code-reviewer, which produces findings. Findings are verdicts — they tell the reviewer what to think. Questions tell the reviewer what to think *about*. The reviewer who engages with questions builds understanding; the reviewer who receives findings does not.

## The AI-All-The-Way-Down Problem

A new framing emerged: the risk of a fully synthetic pipeline — AI-generated tickets specifying AI-generated code undergoing AI review. In this scenario, no human has grounded understanding at any point. The review skill's job in this context is to be the place where a human re-enters the loop with genuine engagement. Someone has to ask "does this actually make sense?" — and mean it.

## "Help Me Be Helpful"

The success criterion shifted subtly from the essay's framing. The essay says "the reviewer can discuss the code without AI assistance." The practitioner reframed this as "help me be helpful" — acknowledging that capacity is finite, review volume is high, and the goal is not mastery but genuine usefulness. This is a more honest and sustainable criterion. It respects the reality that reviewers on delivery teams cannot become domain experts in every MR — but they can become genuinely informed enough to add value.

## The Guardrails Paradox

Industry response to rising AI code volume is more automated guardrails — CI/CD, test coverage, static analysis, linting. The assumption: mechanical safety nets let humans operate at speed. But the paradox is that guardrails designed to compensate for reduced human attention also signal that human attention is less necessary. The safety net becomes the excuse not to look down.

The reviewer is squeezed from both sides: expected to ship fast against rising volume, AND expected to be the last line of defense when guardrails miss something. RDD's contribution is a process harness that accepts both realities — volume and velocity are given constraints, not problems to solve — while making every minute of review count. Not "slow everything down" but "make review minutes more effective at building understanding." The reviewer gets better at reviewing, not just faster at approving.

## Open Questions for Domain Modeling

- How much context-reconstruction is "enough" in the RDD-lite mode? Is there a minimum viable orientation?
- When the agent surfaces questions, how does it avoid becoming a new form of signal degradation (too many questions, reviewer skims)?
- How does the skill handle the case where the reviewer discovers, through their questions, that the code author *also* doesn't fully understand what they shipped?
- When does a finding become appropriate alongside questions? Is there a threshold (e.g., clear bugs always surface as findings, design concerns always surface as questions)?
- What is the minimum viable understanding that produces genuine value in a high-volume review context?
- The skill must be adaptive to variable time budgets. Five minutes of genuinely oriented review beats thirty minutes of unfocused scanning. The ZPD shifts with available time: deep orientation when there's an hour, the single most important question when there are five minutes. Variable depth, consistent quality — the review always counts, even when it's fast.
- The boundary between reviewer-provided and agent-gathered context is collaborative, not fixed. The reviewer provides breadcrumbs (ticket URLs, MR links, doc pointers); the agent follows them (fetching via CLI/MCP, reading, synthesizing). The tooling landscape (glab, gh, Atlassian MCP, GDrive) enables agent fetching, but the reviewer's domain knowledge determines *what* to fetch. Within RDD, the work package scopes this naturally. The skill needs a collaborative context-gathering step as an explicit design element.
