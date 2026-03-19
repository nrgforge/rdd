# ADR-015: Synthesis Essay as Narrative Context Rollup

**Status:** Proposed

## Context

The user identified a dimension the essay missed (003 reflections §1): the dead discovery problem is also a context problem. When spinning up a new RDD session, the LLM faces an artifact corpus that is technically rich but narratively inert. The domain model, system design, and product discovery documents serve their pipeline function but do not tell a compelling story. The context window ceiling (the hard constraint where system complexity exceeds what AI can reason about holistically) makes this acute.

The synthesis essay, if it exists, is the artifact best positioned to address this: it explains "what was this project actually about?" in narrative form that both human readers and future AI sessions can follow.

## Decision

The synthesis essay serves a dual purpose:

1. **Publishable narrative** — for the world outside the project
2. **Narrative context rollup** — for the pipeline itself

When a synthesis essay exists for a project, it becomes part of the pipeline's context corpus for future sessions. Where structured artifacts answer "what was decided?" (ADRs), "what vocabulary applies?" (domain model), and "what was designed?" (system design), the narrative context rollup answers "what was discovered, and why does it matter?"

The orchestrator should treat the synthesis essay as a primary context source when bootstrapping a new session for a project that has one. The essay provides the narrative thread through the artifact corpus that structured fragments cannot.

**This dual purpose is not a compromise.** An essay good enough to publish is good enough to orient a new session. An essay too shallow to orient a new session is too shallow to publish. The quality bar is the same for both functions.

## Consequences

**Positive:**
- Addresses context window ceiling by providing narrative thread through artifact corpus
- Gives future sessions a "what was this about?" artifact that domain models and ADRs cannot provide
- No additional work required — the publishable essay naturally serves both functions
- Quality bar aligns: worth reading = worth using as context

**Negative:**
- Creates implicit dependency: sessions with a synthesis essay may bootstrap better than those without (this is feature, not bug, but creates uneven experience)
- The essay captures a moment in time — if the project evolves significantly, the narrative context rollup may become stale

**Neutral:**
- Does not change essay content or structure — the dual purpose is a consequence of writing well, not a separate requirement
- Orchestrator change is minor: add synthesis essay to context loading when it exists
