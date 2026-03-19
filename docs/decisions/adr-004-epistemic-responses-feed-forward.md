# ADR-004: User Epistemic Responses Feed Forward into Subsequent Phases

**Status:** Proposed

## Context

Invariant 7 states that epistemic acts are bidirectional — they simultaneously build user understanding and enrich AI context for subsequent phases. The essay (§7) argues this is a core mechanism, not a side effect: the user's self-explanation surfaces assumptions, the user's retrieval practice reveals weak concepts, the user's elaborative interrogation makes rationale explicit. These outputs have value beyond the learning moment — they enrich the common ground available to the AI in subsequent phases.

Grounding theory (Clark & Brennan, §7) establishes that shared understanding requires active verification. The user's epistemic act responses are the strongest grounding signal available — they reveal what the user actually understood, not just that the output looked correct.

## Decision

The user's epistemic act responses at each gate become available as context for the next phase. The mechanism is conversational — in a single-session RDD cycle, the responses are naturally in the conversation history. For multi-session cycles, the orchestrator instructs the AI to read prior gate responses when loading context for a new phase.

The orchestrator does not prescribe a storage format for gate responses. In practice:
- Single-session cycles: responses are in conversation context automatically
- Multi-session cycles: the AI should summarize the user's key epistemic responses when presenting the status table at session resumption

The key constraint: the AI in subsequent phases should reference the user's stated understanding, not just the formal artifacts. If the user's self-explanation at the RESEARCH gate revealed a particular emphasis or concern, the MODEL phase should attend to that emphasis.

## Consequences

**Positive:**
- Activates the bidirectional mechanism (Invariant 7) — epistemic acts improve both understanding and software quality
- Surfaces tacit knowledge that becomes explicit input to subsequent phases
- Creates a grounding signal that corrects misalignment between user intent and AI interpretation

**Negative:**
- Multi-session persistence is imperfect — conversation context is lost between sessions, and summaries are lossy. If most real RDD cycles span multiple sessions, the bidirectional mechanism degrades and a more durable persistence mechanism may be needed (e.g., appending gate response summaries to artifact files)
- Adds cognitive load for the AI in attending to both formal artifacts and user responses

**Neutral:**
- Does not require new files or storage infrastructure — the mechanism is conversational, not architectural
- The orchestrator's state table already exists; it can note key user responses without adding a new artifact type
