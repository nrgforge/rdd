# ADR-011: Product Discovery Epistemic Gate

**Status:** Proposed

## Context

Per ADR-002, each skill owns its epistemic gate — the specific epistemic acts it requires at its phase transition. Product Discovery needs a gate definition. However, essay 002 §10 notes a unique property: at this gate, the user likely knows *more* about their users and stakeholders than the AI does. This potentially inverts the typical gate dynamic, where the AI generates and the user reconstructs.

## Decision

The Product Discovery epistemic gate presents 2 prompts from this set, filled with specific stakeholders, jobs, tensions, and inversions from the artifact just produced:

- **Self-explanation:** "How would you describe [stakeholder X]'s experience with the current system to a colleague?"
- **Elaborative interrogation:** "Does the tension between [value tension Y] feel right? Is there a tension we missed that matters more?"
- **Retrieval practice:** "Without looking back — what are the key jobs [stakeholder X] needs the system to do?"
- **Articulation:** "Which assumption inversion surprised you? Which one did you already suspect?"

Gate behavior follows the standard protocol (ADR-001):
- Wait for the user to respond to at least one prompt
- If the user responds with non-generative approval only, gently re-present
- Note factual discrepancies between the user's response and the artifact without framing as error
- Ask whether to proceed, revise, or loop back to research

The inverted dynamic (user knows more than AI) means the gate serves a different primary function here: not building the user's understanding of AI output, but **making the user's tacit product knowledge explicit** so it can inform downstream phases. The AI learns from the gate; the user surfaces what they already know.

## Consequences

**Positive:**
- Surfaces Tacit Knowledge that the AI cannot generate — the user's direct experience with stakeholders, unarticulated product intuitions, and domain-specific user knowledge
- The gate enriches Common Ground in the direction most needed: user → AI, complementing the typical AI → user direction at other gates
- Maintains Invariant 2 (epistemic acts mandatory at every gate) while adapting the act's purpose to the phase's unique epistemology

**Negative:**
- The inverted dynamic means the gate's primary value is harder to assess — the AI cannot easily verify whether the user's product knowledge is accurate, only whether it is internally consistent. Mitigated: the gate's purpose is surfacing, not validating

**Neutral:**
- When the user is new to the domain (not just the system), the inverted dynamic may not hold — the user may not have more product knowledge than the AI. In this case, the gate still serves Invariant 1 (generation over review) even if the tacit-knowledge-surfacing function is weaker
- This gate is where the "Mr. Market" vs. "the research says" distinction becomes operational. If the user's gate responses reveal business-first thinking ("our sales team needs...") rather than user-first thinking ("admins experience..."), the AI can note the framing without judgment — making the orientation visible
