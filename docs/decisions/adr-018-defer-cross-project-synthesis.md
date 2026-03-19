# ADR-018: Defer Cross-Project Synthesis Operationalization

**Status:** Proposed

## Context

Essay 003 §9 describes cross-project synthesis — reviewing multiple RDD cycles across different projects simultaneously — as a recognized mode where the most interesting essays may be about what the projects collectively reveal rather than about any single project. The domain model defines Cross-Project Synthesis as a concept and lists its operationalization as an open question.

However, the mechanics are unresolved: how does the agent access artifact trails from multiple projects? What file conventions support this? Is this a different skill or a mode of the same skill? These questions depend on practical experience with single-project synthesis that does not yet exist.

## Decision

Distinguish two levels of cross-project synthesis and handle them differently:

**Level 1: Conversational cross-project prompting (available now).** During the framing conversation (ADR-013, Phase 3), the agent asks whether the volta or key discoveries resonate with the writer's other work or interests. The agent cannot read other project trails, but it does not need to — cross-project insight lives in the writer's mind. The agent creates conversational space for the writer to draw connections the local artifact trail cannot see. This is a conversation move, not an infrastructure feature.

**Level 2: Full portfolio mode — simultaneous review of multiple artifact trails (deferred).** The mechanics are unresolved: how does the agent access artifact trails from multiple projects? What file conventions support this? Is this a different skill or a mode of the same skill? These questions depend on practical experience with single-project synthesis that does not yet exist.

**Rationale for deferring Level 2 (parallels ADR-005: Defer Fading Implementation):**
1. Single-project synthesis has not been used yet — designing portfolio mode without single-project experience risks speculating past known facts
2. File access conventions across projects are an infrastructure question that depends on how projects are organized in practice
3. The conceptual framework (boundary objects, adjacent possible, strong concepts from essay 003 §4) provides the theoretical foundation; what is missing is operational experience

**Revisit trigger:** After 2-3 single-project synthesis cycles, ask: "Did cross-domain connections surface naturally through Level 1 prompting? Did the writer want the agent to read multiple trails? What file access patterns would have helped?" Initiate new RDD research cycle on portfolio mode mechanics.

**What is preserved now:**
- Level 1 prompting is part of ADR-013's framing conversation — available immediately
- The domain model captures Cross-Project Synthesis as a concept
- The synthesis skill should not preclude portfolio mode (no single-project assumptions baked into file paths or conversation structure)
- The open question in the domain model tracks Level 2 as known future work

## Consequences

**Positive:**
- Level 1 gives the writer cross-project awareness immediately, at zero infrastructure cost
- Level 2 deferral avoids designing without operational experience
- Keeps first synthesis implementation focused and buildable
- Preserves theoretical foundation for future Level 2 operationalization

**Negative:**
- Level 1 depends entirely on the writer's recall of other projects — the agent has no external memory to draw on
- Level 2 practitioners who want full portfolio mode cannot use it yet
- Design debt: must revisit Level 2 after single-project synthesis is proven

**Neutral:**
- Level 1 prompting may naturally reveal what Level 2 needs to do — the writer's cross-project connections during conversation become design data for portfolio mode
