# ADR-012: Add Synthesis as Optional Terminal Phase

**Status:** Proposed

## Context

Essay 003 identifies the dead discovery problem: genuine insights produced by RDD cycles remain entombed in artifacts optimized for the next pipeline phase, invisible to the user and the world. The artifact trail is technically rich but narratively inert — it answers "what was decided?" but not "what was discovered, and why does it matter?"

The research-engineer-writer stakeholder (product discovery artifact) uses RDD not just to build systems but to advance understanding and publish. The current pipeline has no terminal generative act — BUILD produces working software (pragmatic outcome), but no phase asks the user to synthesize across the entire journey.

Strengthened Invariant 0 requires the user to speak with authority about "what was built, who it was built for, and why." The synthesis phase tests the *public* dimension of this authority: can the user explain the project to the world?

## Decision

Add Synthesis as an optional terminal phase to the RDD pipeline. Implemented as a new skill (`/rdd-synthesis`). The pipeline becomes:

```
RESEARCH → PRODUCT DISCOVERY → MODEL → DECIDE → ARCHITECT → BUILD → [SYNTHESIS]
```

Synthesis runs after BUILD or after whatever phase terminates the current pipeline run (ARCHITECT in scoping mode). It is optional — the pipeline is complete without it.

**Prerequisites:**
- A substantial artifact trail. A cycle that produced only a research essay and domain model may not have enough material. The richer the trail (multiple research questions, product discovery, contested ADRs, build-phase surprises), the more likely synthesis surfaces something worth writing about.

**Cost structure:**
- The conversation with the agent (journey review, novelty surfacing, framing) is bounded at roughly 30-60 minutes
- The writing is the user's own work, done on their own time, outside the pipeline
- This is NOT a gate — it has a different cost structure from Invariant 4's 5-10 minute gates

**Deliverables:**
- Outline (co-produced by agent and user within the pipeline)
- Synthesis essay (written by the user outside the pipeline, in the user's own voice)

## Consequences

**Positive:**
- Extracts publishable insight from dead discoveries buried in artifacts
- Tests public dimension of Invariant 0 (authority that extends beyond the user and AI)
- Closes the epistemic loop opened by RESEARCH — the essay answers a question the writer did not know they had
- Satisfies Richardson's writing-as-inquiry: the essay is discovery, not reporting
- Each synthesis essay potentially contributes to the methodology's own evolution

**Negative:**
- Adds optional phase to an already-substantial pipeline
- Outline quality depends on richness of artifact trail — thin trails produce thin synthesis
- The essay itself is outside the pipeline's control — the user may never write it

**Neutral:**
- Does not modify existing phases or gates
- Does not change invariants (operates within existing framework; Invariant 4 tension resolved by different cost structure)
- Orchestrator needs minor updates to include SYNTHESIS in pipeline sequence and status tracking
