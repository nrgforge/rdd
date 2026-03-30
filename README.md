# RDD — Research-Driven Development

A methodology for building software you understand.

**[Read the manifesto](https://nrgforge.github.io/rdd/)**

## Why

Building with AI is fast. Understanding what to build and why — and understanding what you built — is the hard part.

AI is a powerful tool for understanding code. But when generation is trivial, the practices that produce understanding need deliberate structure — or they get optimized away. Code is cheap. Software is becoming a commodity. What's scarce is knowing what to build and why, and that comes from figuring out how to ask the right questions.

RDD exists because of this shift. It uses AI for what AI is good at while structuring the practices that produce the understanding. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it.

At the end of an RDD cycle, you should be able to explain the system's design rationale, key decisions, domain vocabulary, and the user needs those decisions serve — without assistance. Not because you memorized the output, but because you shaped the process and the result. That's the test.

## The Pipeline

- RESEARCH
- DISCOVER
- MODEL
- DECIDE
- ARCHITECT
- BUILD
- PLAY *(optional)*
- SYNTHESIZE *(optional)*
- GRADUATE

- **Research** — Investigate the problem space. Produce a citation-audited essay. The research often reframes the problem in ways that change what you'd build.
- **Discover** — Surface who this is for and what you're assuming. Invert every major assumption before it becomes architecture.
- **Model** — Name things precisely. Extract the vocabulary of concepts, actions, relationships, and invariants.
- **Decide** — Make architectural decisions, write refutable behavior scenarios, and produce interaction specifications — the workflow-level mechanics of how each stakeholder works with the system. Each decision traces to research.
- **Architect** — Decompose the system into modules with provenance chains linking design to research to user needs.
- **Build** — Scenarios become tests. Tests become software. BDD and TDD. Pause at natural boundaries for stewardship checks.
- **Play** — Step into your users' shoes and use what you built. The agent gamemasters — proposing stakeholder roles, throwing curveballs, keeping things interesting. You discover what the specs couldn't tell you. Field notes feed back into the pipeline.
- **Synthesize** — Write about what you built — not a summary, but an act of inquiry. New research questions may loop back into a new cycle.
- **Graduate** — Fold the durable knowledge into native docs. Archive the RDD artifacts. The scaffolding comes down.

Each phase ends with a challenge: can you articulate what you learned? A full cycle is a mindful process of making — depending on the problem, it can take several hours across multiple sessions.

## When to Use RDD

Use it when the problem rewards depth: unfamiliar domains, ambiguous requirements, expensive-to-reverse decisions, conflicting stakeholder needs, or when you just want to think carefully about something interesting. For problems where user feedback teaches you more than research would, ship and iterate.

RDD is for the 20% where understanding determines whether the other 80% goes in the right direction.

## Install

Requires [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

```
/plugin marketplace add nrgforge/rdd
/plugin install rdd@nrgforge
```

Or for local development:

```
git clone https://github.com/nrgforge/rdd.git
claude --plugin-dir ./rdd
```

## Usage

Start an RDD cycle with the orchestrator:

```
/rdd
```

The orchestrator scans for existing artifacts, asks where to store new ones, and guides you through the pipeline — invoking each phase skill in order with epistemic gates between them.

You can also invoke phases directly:

| Skill | What you do |
|-------|-------------|
| `/rdd-research` | Investigate a problem space, produce an audited essay |
| `/rdd-discover` | Surface stakeholder needs, value tensions, assumption inversions |
| `/rdd-model` | Extract domain vocabulary from research |
| `/rdd-decide` | Make architectural decisions, write behavior scenarios, produce interaction specs |
| `/rdd-architect` | Decompose the system with provenance chains |
| `/rdd-build` | Implement scenarios through BDD/TDD |
| `/rdd-play` | Play with what you built as different users, discover what specs missed |
| `/rdd-synthesize` | Write about what you built and what you discovered |
| `/rdd-conform` | Audit artifact corpus, detect drift, graduate knowledge |

## Architecture

RDD is a four-layer Claude Code plugin:

- **Skills** (10) — orchestrate phases, manage user interaction, run epistemic gates
- **Agents** (6) — specialist subagents for citation auditing, argument auditing, literature review, conformance scanning, orientation writing, and code spikes
- **Hooks** (5) — passive enforcement of invariants, epistemic gates, document sizing, and orientation regeneration

Agents follow an artifact-mediated communication pattern: they read input files, perform analysis in isolation, and write structured output files. Every finding is durable and inspectable.

## Built With RDD

This plugin was built using RDD. The full artifact trail — eight research essays, 39 architectural decisions, 228 behavior scenarios, a domain model, system design, and product discovery document — lives in the `docs/` directory.

## License

MIT
