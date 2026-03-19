# ADR-006: Add Product Discovery Phase Between RESEARCH and MODEL

**Status:** Proposed

## Context

Essay 002 identifies a structural blind spot in the RDD pipeline: no phase explicitly addresses product thinking — who the system serves, how users think about the domain, and whether product assumptions have been validated. The pipeline produces technically sound systems that may carry significant Product Debt (domain model). The healthcare enrollment case demonstrated this concretely: a well-architected system whose abstraction layer served system modularity rather than user mental models.

The strengthened Invariant 0 requires the user to speak with authority about "what was built, who it was built for, and why." The current pipeline has no phase that builds understanding of the "who" and "why" dimensions.

## Decision

Add a Product Discovery phase to the RDD pipeline, positioned between RESEARCH and MODEL. The phase is implemented as a new skill (`/rdd-product`) that produces a product discovery artifact. The pipeline becomes:

```
RESEARCH → PRODUCT DISCOVERY → MODEL → DECIDE → ARCHITECT → BUILD
```

Product Discovery runs after RESEARCH because it needs the essay's domain context. It runs before MODEL because Product Vocabulary should inform Domain Model vocabulary extraction, not the other way around.

## Consequences

**Positive:**
- Surfaces User Mental Models, Stakeholder Maps, Value Tensions, and Assumption Inversions before they harden into architecture
- Prevents Product Maintenance Cliff by interrupting product assumption compounding early
- Produces an artifact with high Artifact Legibility — written in user language, comprehensible to product stakeholders
- Extends the feed-forward chain: user needs → product concepts → domain terms → ADRs → modules

**Negative:**
- Adds a phase to the pipeline, increasing cycle time. Mitigated by Invariant 4 (epistemic cost must remain lightweight)
- Requires updates to the orchestrator's workflow mode descriptions and state tracking table

**Neutral:**
- Existing epistemic gate infrastructure (ADRs 001-005) applies to the new phase without modification — the new skill owns its gate per ADR-002
