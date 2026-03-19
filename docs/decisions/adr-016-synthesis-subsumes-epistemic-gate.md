# ADR-016: Synthesis Phase Subsumes Its Epistemic Gate

**Status:** Proposed

## Context

ADR-002 establishes that each skill owns its epistemic gate definition. ADR-003 assigns specific epistemic act types to each gate. However, the synthesis phase has a unique structure: the entire conversation (journey review, novelty surfacing, framing) is epistemic by nature. Every step requires the user to generate — recall experiences, react to candidate discoveries, articulate what matters, choose narrative direction.

The domain model's open questions include: "Should the synthesis phase have its own epistemic gate, or is the essay itself the epistemic act?" The answer is both — the conversation is epistemic throughout, and the essay is the terminal epistemic act.

## Decision

The synthesis phase does not bolt on a separate epistemic gate after its deliverable (the outline). Instead, the three-phase conversation (ADR-013) subsumes the gate function:

- **Journey Review** requires retrieval and articulation (the user recalls and explains what happened at key moments)
- **Novelty Surfacing** requires reflection and self-explanation (the user reacts to candidate discoveries and distinguishes genuine engagement from polite agreement)
- **Framing Conversation** requires articulation and generation (the user selects, modifies, or discards narrative framings to find their story)

The synthesis essay itself — written outside the pipeline on the user's own time — is the terminal epistemic act of the entire RDD cycle. It satisfies Invariant 1 (understanding requires generation) at the highest level: the user constructs communicable knowledge from their own experience.

**Invariant 2 is satisfied** because the user produces at every step of the conversation — no step consists solely of approval. The conversation is inherently generative.

**This resolves the open question** in the domain model about whether synthesis needs its own gate.

## Consequences

**Positive:**
- Avoids redundancy: bolting a gate onto an already-epistemic conversation would be artificial
- Preserves ADR-002's principle (skills own their gates) — the skill's gate is its conversation structure
- Resolves open question cleanly: the conversation is the gate, the essay is the terminal epistemic act

**Negative:**
- No discrete gate means no single "did the user engage?" checkpoint (mitigated: each conversation phase inherently requires generation)
- The essay happens outside the pipeline — its quality is not gateable within the methodology

**Neutral:**
- ADR-003's pattern of assigning specific epistemic acts to gates applies implicitly — the conversation phases map to retrieval, reflection, articulation, and self-explanation
