# ADR-049: Context Gathering as Embedded Protocol

**Status:** Proposed

## Context

All four skills in the Composable Skill Family (ADR-048) need to answer the same Orientation Questions before doing their specialized work: Who is this for and why? What are we building? What's the scope and integration points? What's ambiguous? How do we verify? (Domain model: Orientation Questions.)

The domain model defines Context Gathering as "the shared protocol used by all skills in the Composable Skill Family." The MODEL phase feed-forward confirmed: "Context Gathering generalizes Collaborative Context-Gathering — same orientation protocol, different direction." The question is whether this shared protocol is implemented as a separate invocable skill or embedded in each skill.

## Decision

Context Gathering is an **embedded protocol**, not a separate skill. The five-step protocol is specified once in a shared reference section within the plugin and each skill's SKILL.md implements it:

1. **Detect mode** — check whether RDD artifacts exist; offer pipeline or context-reconstructive
2. **Prompt for breadcrumbs** — if context-reconstructive: ask what sources are available
3. **Fetch and read** — gather from heterogeneous sources, graceful degradation
4. **Synthesize orientation** — answer the five Orientation Questions from available evidence
5. **Validate with the user** — "Does this capture the context? What would you adjust?"

Each skill adapts step 4 to its downstream needs: build emphasizes work decomposition and testable behaviors; debug emphasizes the expected-vs-actual divergence; refactor emphasizes structural health and architectural intent; review emphasizes design rationale and decision context.

User validation (step 5) is load-bearing — it is the epistemic boundary (Invariant 3). The protocol automates fetching and synthesis (pragmatic); the user validates and corrects (epistemic).

**Rejected alternative:** A separate `/rdd-context` skill dispatched before each specialized skill. Rejected because: (1) no standalone use case exists — Context Gathering is always a precursor to specialized work, never the end goal; (2) an extra invocation step adds friction without adding value; (3) in Claude Code's plugin architecture, skills are user-invocable — a skill the user never directly invokes breaks the mental model.

**Rejected alternative:** Each skill implements its own context-gathering from scratch. Rejected because: (1) four independent implementations would inevitably drift; (2) the protocol is the same — only the synthesis emphasis differs.

## Consequences

**Positive:**
- No extra invocation step — each skill handles its own orientation
- Each skill can adapt the synthesis step to its specialized needs
- Consistent with the review skill's existing implementation for steps 1-3 and 5 (mode detection, breadcrumb gathering, fetching, and validation). Step 4 diverges by direction: review synthesizes backward toward a completed change; build, debug, and refactor synthesize forward toward work that does not yet exist. The forward-looking synthesis is qualitatively different and must be specified independently
- The shared specification prevents drift while allowing specialization

**Negative:**
- Protocol changes must be propagated to four skill files — a maintenance concern addressed by keeping the protocol definition in a single reference section
- Testing the protocol in isolation is harder than testing a standalone skill

**Neutral:**
- The protocol reference section serves as the shared specification; each SKILL.md includes or references it rather than duplicating the full protocol text
