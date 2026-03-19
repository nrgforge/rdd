# ADR-032: Extract Specialist Subagents from Phase Skills

**Status:** Proposed

## Context

Each RDD phase skill currently carries four responsibilities: orchestration, specialist work, artifact production, and cross-cutting enforcement. The specialist work — citation auditing, argument auditing, literature review, conformance scanning, orientation writing, spike running — operates on well-defined input artifacts and produces output that should be durable and inspectable (ADR-031).

Claude Code's subagent architecture provides isolated context windows with custom system prompts, restricted tool access, and independent model selection. Subagents cannot spawn other subagents. They communicate through files (they have no conversation history), making artifact-mediated communication not just preferable but structurally necessary.

The boundary principle: if the work requires back-and-forth with the user or benefits from seeing the full conversation history, it stays in a skill. If the work reads input artifacts, produces output artifacts, and communicates results through files, it becomes a specialist subagent.

## Decision

Extract six specialist subagents from existing phase skills:

| Subagent | Extracted from | Input artifacts | Output artifact | Model |
|----------|---------------|-----------------|-----------------|-------|
| citation-auditor | `/rdd-research` Step 4a, `/rdd-synthesize` Step 6 | Essay, research log | Citation audit report | sonnet |
| argument-auditor | `/rdd-research` Step 4b, `/rdd-decide` Step 3 | Essay, research log, ADRs | Argument audit report | sonnet |
| lit-reviewer | `/rdd-research` Step 2 (academic topics) | Research question | Research log entry | sonnet |
| conformance-scanner | `/rdd-decide` Step 3.5, `/rdd-conform` | ADRs, codebase | Conformance debt table | sonnet |
| orientation-writer | Multiple phases | Artifact corpus inventory | ORIENTATION.md | sonnet |
| spike-runner | `/rdd-research` Step 2 (spikes) | Spike question | Research log entry | inherit |

Phase skills retain: orchestration, epistemic gate conversations, ADR writing, scenario authoring, system design composition, and user interaction.

Specialist subagent system prompts specify the structured return format (per ADR-031) and the input files to read.

## Consequences

**Positive:**
- Specialist work runs at a model appropriate to its complexity rather than inheriting the orchestrator's model (mechanical analysis on Sonnet; exploratory spikes at the parent model)
- Audit artifacts become part of the provenance chain
- Orchestrating agent's context freed for epistemic gate conversations
- Agent dispatch creates space for parallel dialog with the user while specialist work runs

**Negative:**
- Agent dispatch adds latency
- Phase skills must be updated to dispatch agents instead of invoking skills inline
- Subagent system prompts must be maintained alongside skill files

**Neutral:**
- Existing skill invocations (`/citation-audit`, `/argument-audit`, `/lit-review`) are replaced by agent dispatch — the skills themselves may be retired or kept as thin wrappers
- This ADR's scope assumes ADR-031's open question resolves toward "always artifact" (the hard rule). If operational testing favors context-dependent rules, some extractions may be deferred
