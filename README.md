# RDD — Research-Driven Development

A methodology for building software you understand.

**[Read the manifesto](https://nrgforge.github.io/rdd/)**

## Why

Building with AI is fast. Understanding what you built is the hard part.

RDD exists because understanding is valuable on its own — not just as a hedge against maintenance costs, but because deep engagement with a problem changes how you think about it. Research reshapes the problem statement. Synthesis surfaces connections you didn't expect. The act of explaining what you've learned reveals what you haven't. This process is slow, deliberate, and genuinely interesting. It's deep work.

It's also fundamentally user-centric. RDD's pipeline is grounded in what research finds, not what you assume going in. Product discovery happens before domain modeling. Assumptions get inverted before they harden into architecture. The system you build reflects investigated reality, not the first plausible story you told yourself.

At the end of an RDD cycle, you should be able to speak with authority about what you built, who it's for, and why — without AI assistance. Not because you memorized the output, but because you shaped the process and the result. That's the test.

## What RDD Does

RDD structures the collaboration between you and an AI agent through a phased pipeline. Each phase produces an artifact and ends at an epistemic gate — a transition point where you must produce something (an explanation, prediction, reconstruction) rather than merely approve something.

```
RESEARCH → PRODUCT → MODEL → DECIDE → ARCHITECT → BUILD → [SYNTHESIS]
```

- **Research** — investigate the problem space; produce a citation-audited essay. The research often reframes the problem in ways that change what you'd build.
- **Product Discovery** — surface who this is for, what they need, and what you're assuming. Invert every major assumption before it becomes architecture.
- **Domain Model** — extract the vocabulary. Name the concepts, actions, relationships, and invariants.
- **Decide** — make architectural decisions (ADRs) and write refutable behavior scenarios.
- **Architect** — decompose the system into modules with provenance chains linking every design choice back to research and user needs.
- **Build** — turn scenarios into working software through BDD/TDD.
- **Synthesis** — (optional) extract publishable insight from the artifact trail. The essay you write is the final act of discovery — writing toward a conclusion you can't yet state.

Each gate takes 5-10 minutes. The methodology is a deep work tool — you reach for it when a problem warrants structured thinking and put it away when the knowledge has been absorbed.

## The Key Insight

The AI generates, searches, formats, and drafts. You explain, predict, retrieve, and articulate. RDD calls this boundary the core design decision: **automate pragmatic actions, preserve epistemic ones.**

The epistemic acts aren't bureaucratic overhead. They're where learning happens — and learning is what makes the difference between software you own and software that owns you. Each gate builds on the last. Understanding compounds across the pipeline the same way ignorance compounds without it.

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

Start a research cycle:

```
/rdd-research
```

The orchestrator guides you through the pipeline. At each phase, the skill tells you what to do and presents the epistemic gate when it's time for your input. You can run the full pipeline or pick individual phases:

| Skill | Purpose |
|-------|---------|
| `/rdd-research` | Investigate a problem space, produce an audited essay |
| `/rdd-product` | Surface stakeholder needs, value tensions, assumption inversions |
| `/rdd-model` | Extract domain vocabulary from research |
| `/rdd-decide` | Architectural decisions and behavior scenarios |
| `/rdd-architect` | System decomposition with provenance chains |
| `/rdd-build` | BDD/TDD implementation from scenarios |
| `/rdd-synthesis` | Extract publishable insight from the artifact trail |
| `/rdd-conform` | Audit artifact corpus, detect drift, graduate knowledge |

## How RDD Differs

**From agile:** Agile optimizes for business delivery and discovers user value incidentally. RDD optimizes for understanding through research and discovers business value as a consequence of user alignment.

**From vibe coding:** Vibe coding treats AI output as the product. RDD treats AI output as starting material for human understanding. The gap between generation and explanation is where learning happens.

**From waterfall:** RDD's phases aren't sequential gates that block progress. They're epistemic checkpoints that build compounding understanding. You can run any subset, scope cycles to subsystems, and graduate the scaffolding when the knowledge has been absorbed.

## Architecture

RDD is a four-layer Claude Code plugin:

- **Skills** (9) — orchestrate phases, manage user interaction, run epistemic gates
- **Agents** (6) — specialist subagents for citation auditing, argument auditing, literature review, conformance scanning, orientation writing, and code spikes
- **Hooks** (5) — passive enforcement of invariants, epistemic gates, document sizing, and orientation regeneration

Agents follow an artifact-mediated communication pattern: they read input files, perform analysis in isolation, and write structured output files. Every finding is durable and inspectable — nothing exists only in conversation.

## Built With RDD

This plugin was built using RDD. The full artifact trail — seven research essays, 36 architectural decisions, 192 behavior scenarios, a domain model, system design, and product discovery document — lives in the `docs/` directory. It shows the complete record of its own development.

## License

MIT
