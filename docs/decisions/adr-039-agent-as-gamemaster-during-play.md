# ADR-039: Agent as Gamemaster During Play

**Status:** Proposed

## Context

The Play phase (ADR-038) introduces Epistemic Distance as a structural tension: can the person who built the system genuinely inhabit unfamiliar stakeholder roles and encounter their own design with fresh eyes? Deterding (2015) raises this as the central challenge for any play-based methodology applied to the builder's own work.

The play phase needs active facilitation — someone to propose Points of Concentration, introduce complications, surface what the practitioner might not notice. In performance traditions, this role exists: Spolin's side-coaching focuses attention without directing outcomes; tabletop RPG gamemasters create conditions for genuine encounter; Boal's joker facilitates Forum Theatre.

This role sits on the Invariant 3 boundary. Invariant 3 states that pragmatic actions may be automated while epistemic actions may not. The Gamemaster shapes *attention* — which stakeholder to inhabit, which complications to consider, which assumptions to challenge — but the practitioner retains authority over *conclusions*: what counts as a discovery, what matters, and what to do about it. This is the boundary principle: **epistemic facilitation is permitted when the agent shapes attention but the practitioner generates understanding.** The distinction is structural, not a matter of degree: a gamemaster who proposes "try inhabiting the emergency operator under time pressure" has shaped the encounter, but the practitioner's discovery — what they notice, what surprises them, what they conclude — is their own generative work. Over-facilitation collapses this distinction: if the gamemaster also tells the practitioner what to notice or what conclusions to draw, it has crossed from facilitation to generation, violating Invariant 3.

The product discovery update (2026-03-25) confirms the Gamemaster concept emerged from the user's theater background — Stanislavski objectives structure provides the inhabitation framework, and the Gamemaster proposes roles and obstacles within that framework.

## Decision

The Orchestrating Agent takes on a Gamemaster role during the Play phase. The Gamemaster:

1. **Proposes stakeholder roles and Points of Concentration** — drawn from Product Discovery's stakeholder map, Interaction Specifications, and assumption inversions. Selects roles that maximize Epistemic Distance from the builder's perspective.
2. **Introduces complications and inversions** — "what happens if this stakeholder ignores the instructions?" "what if they're under time pressure?" Extends the Inversion Principle into the play phase (a design extension — de Certeau's "tactics" concept in Essay 008 §3 provides the theoretical warrant for subverting designed systems, but applying it as a gamemaster technique is new to this ADR).
3. **Reacts to player discoveries** — surfaces what the practitioner might not notice, connects observations to prior artifacts, asks follow-up questions that deepen exploration.
4. **Creates conditions for genuine encounter without directing the outcome** — the Gamemaster facilitates; the practitioner discovers. The Gamemaster does not evaluate, score, or test.

**The Gamemaster is epistemic in character.** Practical byproducts emerge (bugs surfaced, new questions for RESEARCH, missing scenarios for DECIDE), but the role serves understanding first. The Gamemaster shapes what the practitioner *attends to*, not what they *conclude*.

**A human gamemaster is equally valid for RDD the method.** A colleague, UX researcher, or domain expert brings genuine outside perspective — potentially eliminating rather than just mitigating Epistemic Distance. RDD the plugin implements the agent in this role because the plugin is the agent's instruction set. The method is broader than the implementation.

**The Gamemaster uses the Stanislavski inhabitation structure** when proposing roles:
- Super-Objective (from discover) — the stakeholder's overarching need
- Objective (from interaction specs) — what they want in a given interaction
- Obstacles — introduced by the Gamemaster or discovered through play

## Consequences

**Positive:**
- Mitigates Epistemic Distance — the Gamemaster introduces complications and inversions the builder would not self-generate
- Extends the Inversion Principle into play — assumptions about interaction mechanics get actively challenged
- Provides the play phase with structure without constraining it — Points of Concentration are a focusing mechanism, not a checklist
- Makes the agent's play-phase role explicit and distinct from other modes (skill execution, artifact production)

**Negative:**
- The boundary principle (shapes attention, not conclusions) is clear in theory but the line is contextual in practice. A gamemaster who says "notice how the button placement forces the operator to look away from the status display" has crossed from attention to conclusion. Operational experience will refine where the line falls
- Over-facilitation risk — too much side-coaching collapses play into guided testing. The Gamemaster must resist directing. "Creates conditions for encounter" is the operative principle
- The quality of gamemastering depends on the agent's ability to read the play situation and respond appropriately — a capability that varies across models and contexts

**Neutral:**
- The Gamemaster role is a mode of the Orchestrating Agent, not a new Specialist Subagent — it requires conversation context and user interaction, which subagents do not have
- Gamemaster skill design is a downstream concern for the `/rdd-play` skill file, not this ADR
