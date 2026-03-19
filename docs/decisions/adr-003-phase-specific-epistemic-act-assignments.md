# ADR-003: Phase-Specific Epistemic Act Assignments

**Status:** Proposed

## Context

The essay (§6) maps six pedagogical frameworks to five RDD gates, selecting frameworks based on what each phase's artifact demands cognitively. Not all epistemic acts are equally effective at every gate — retrieval practice works best after knowledge-dense phases (MODEL, ARCHITECT), while reflection-in-action applies specifically to the BUILD phase where predictions can be tested against immediate outcomes.

Invariant 4 constrains epistemic cost to 5-10 minutes per gate. This means each gate should offer 2-3 focused prompts, not an exhaustive battery.

## Decision

Assign primary epistemic act types to each gate as follows. Each gate presents 2-3 prompts; the user performs at least one.

**Prompt framing principle:** Prompts must feel like an invitation to think aloud, not a quiz. The user is the domain expert and project owner — the tone should be "before we move on, let me hear your take," not "prove you understood." Open-ended, exploratory framing activates the same epistemic mechanisms (generation effect, retrieval, articulation) while also producing richer signal for the AI in subsequent phases. A quiz answer is a closed loop; an exploration response opens new ground.

Prompts must reference the specific artifact content and domain vocabulary from the current phase. The skill dynamically fills in concepts, decisions, and relationships from whatever it just produced.

**RESEARCH gate (after essay):**
- Self-explanation: "What stands out to you as the most important finding here? How would you explain it to a colleague?"
- Reflection-on-action: "How has your thinking about [domain topic] shifted from where you started?"
- Articulation: "Which finding most challenged your initial assumptions, and why?"

**MODEL gate (after domain model):**
- Retrieval practice: "What feels like the heart of this model to you? What would you explain first to a colleague?"
- Self-explanation: "Does the relationship between [concept X] and [concept Y] match your intuition, or does something feel off?"

**DECIDE gate (after ADRs + scenarios):**
- Elaborative interrogation: "Any of these rejected alternatives you're not fully comfortable letting go of?"
- Reflection: "Which decision feels least certain? What about it makes you uneasy?"

**ARCHITECT gate (after system design):**
- Retrieval practice: "Where in this architecture would you expect to find [concept X]? Does the design match your instinct?"
- Articulation: "Which module boundary was hardest to draw? What about the domain made it difficult?"
- Reflection: "Compare your intuitive sense of the architecture to the formal design. Where do they diverge?"

**BUILD gates (per scenario group):**
- Reflection-in-action: "What's your gut sense of what's going to happen when we run this?"
- Self-explanation: "What do you think is going on here?" (when a test fails)

These assignments follow the essay's analysis (§6, "Framework Integration: Epistemic Acts at Each Gate") and are not arbitrary. The bracketed references are placeholders — each skill fills them with specific content from the artifact it just produced.

## Consequences

**Positive:**
- Each gate's prompts are matched to the cognitive demands of the artifact
- The total epistemic cost across a full pipeline is approximately 30-45 minutes — within Invariant 4's constraint
- Prompts are concrete enough that the AI can present them verbatim

**Negative:**
- The assignments are based on pedagogical theory, not empirical testing of this specific methodology — they may need adjustment after real use
- Fixed assignments may not be optimal for all domains or all users

**Neutral:**
- These are defaults, not mandates. The skill files can be updated as experience accumulates.
