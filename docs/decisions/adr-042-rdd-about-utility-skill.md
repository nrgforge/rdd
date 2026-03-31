# ADR-042: Add /rdd-about Utility Skill for Self-Explanation and Version Awareness

**Status:** Proposed

## Context

RDD currently assumes the user knows what the methodology is and how it works. The orchestrator begins with workflow mode selection without orientation. New users encountering the plugin have no lightweight entry point — they must either read the manifesto, the README, or invoke a phase skill and learn by doing.

The Cycle 5 research (Essay 009) introduced the agent-as-teacher role at gates and proposed — but did not independently research — that the same principle extends to methodology self-explanation (Essay 009, §11). The inference is plausible: if the agent can teach about architectural choices during gates, it can teach about RDD itself. But this is speculative extrapolation from a grounded finding, not a directly supported conclusion.

Additionally, the current RDD skill files have no awareness of the plugin's version. The conformance audit (`/rdd-conform`) benefits from knowing which version produced existing artifacts, and users benefit from knowing whether they are running the latest version.

## Decision

Add a `/rdd-about` utility skill that:

1. **Reports the current RDD plugin version** by reading the plugin's package metadata (e.g., `package.json` version field or equivalent).

2. **Provides a brief methodology overview** — what RDD is, the phase sequence, the core philosophy (understand what you build), and what makes it different from standard AI-assisted development. Written in user language ("reflection time", not "epistemic gate"). Approximately one paragraph.

3. **Offers to go deeper** — if the user wants more, explain any specific phase, the philosophy behind adaptive gates, how RDD relates to their current project, or how to start a cycle. Calibrate depth to the user's apparent context (exploring vs. committed vs. mid-cycle).

The orchestrator optionally offers `/rdd-about` when it detects a fresh project (no existing RDD artifacts) or an explicit user request for orientation.

The skill is a utility — it sits outside the pipeline phases and does not produce artifacts. It is informational, not procedural.

## Alternatives Considered

**Embed orientation in the orchestrator skill itself.** Make the orchestrator preamble longer with methodology explanation before workflow mode selection. Rejected because this would slow down experienced users who already know RDD. A separate skill invoked on demand keeps the orchestrator lean.

**Rely on README and manifesto.** Users read the docs before starting. Rejected because the agent can explain interactively and adaptively — answering specific questions, calibrating depth — where static docs cannot.

**No self-explanation needed.** The methodology speaks for itself through usage. Rejected because the initial experience matters for adoption, and a cold start with `/rdd-research` on an unfamiliar methodology is a high barrier.

## Consequences

**Positive:**
- New users get a lightweight, interactive entry point
- Version awareness enables conformance audit to track which version produced artifacts
- The agent-as-teacher principle is applied reflexively — the methodology teaches about itself
- Orchestrator stays lean; orientation is available but not mandatory

**Negative:**
- One more skill to maintain
- Version detection depends on plugin packaging metadata being accessible at runtime
- Risk of the overview becoming stale if the methodology evolves faster than the skill text

**Neutral:**
- Does not affect the pipeline or any existing phase
- Does not produce artifacts (utility, not procedural)
