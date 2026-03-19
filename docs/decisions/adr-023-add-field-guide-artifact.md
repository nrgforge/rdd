# ADR-023: Add Field Guide Artifact

**Status:** Proposed

## Context

The orientation document routes readers. The product discovery document captures stakeholder perspective. The system design specifies modules and contracts. The domain model defines vocabulary. None of these answer: "How does the designed system relate to what actually exists, and what do I need to understand to own it?"

Essay 005 identifies this gap using Diátaxis's documentation taxonomy: the field guide is explanation-type documentation — understanding-oriented, not information-oriented or task-oriented. Jennifer Moore's research on mental maps confirms that understanding cannot be documented directly but can be scaffolded. The field guide scaffolds the developer's mental model construction.

The team lead handoff use case (product discovery) confirms the need: teammates who receive artifacts need to build their own understanding of "the moving parts" to speak with authority about the system (Invariant 0).

## Decision

Add a **Field Guide** document as a Tier 3 reference artifact. The field guide:

- Maps each module in the system design to its current implementation state (what exists, what is partial, what is planned)
- Connects domain model concepts to their code-level manifestations
- Surfaces design rationale that code alone cannot carry
- Points to specific files, directories, and patterns for exploration
- Distinguishes settled areas from areas in flux

The field guide is a pragmatic artifact (Invariant 3): agent-generated, user-validated, updated reflexively when the system design or implementation changes. It lives in a references directory. No epistemic gate is introduced because the field guide is a reference artifact generated within existing phases, not at a new phase transition (Invariant 2 applies to phase transitions).

## Consequences

**Positive:**
- Developers receiving handoff can build understanding without the team lead explaining everything
- Maps the gap between designed state and current state — prevents developers from building against stale mental models
- Serves Invariant 0 from the implementation side: read the guide, explore the code, speak with authority

**Negative:**
- One more artifact to maintain (mitigation: reflexive maintenance, graduated when no longer needed)
- Risk of staleness if implementation changes without field guide updates (mitigation: conformance audit detects this)
- Only useful once implementation exists — irrelevant during early architecture phases

**Neutral:**
- Tier 3 placement means it is consulted as needed, not read end-to-end — longer length is acceptable per the Read Contract heuristic
- Distinct from orientation (routing) and system design (specification)
