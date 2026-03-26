# Active RDD Cycle: Play and Interaction Specification

**Started:** 2026-03-25
**Current phase:** MODEL (next)
**Artifact base:** ./docs/
**Essay:** 008-play-and-interaction-specification.md

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | Essay 008, 2 lit reviews, 2 audit reports | Agent-as-gamemaster; "a game you've never played" reframes epistemic distance; Stanislavski objectives structure |
| DISCOVER | ✅ Complete | product-discovery.md updated | "Discovery from research" vs. "discovery from play" — novel framing; field notes as play's artifact (map/journal pairing with field guide); play needs meta-framing conversation like synthesis; play bounded by felt understanding not timebox |
| MODEL | ☐ Next | — | — |
| DECIDE | ☐ Pending | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
| SYNTHESIS | ☐ Optional | — | — |

## Feed-Forward Signals

### From RESEARCH
1. **Agent-as-gamemaster** — the agent's role in play is active facilitation (like Spolin's side-coaching or a tabletop RPG gamemaster), not just stage-setting. Candidate domain concept.
2. **Stanislavski objectives structure** — inhabitation has internal structure: super-objective (stakeholder's overarching need from discover), objective (what they want in a given interaction), obstacles (discovered through play).
3. **Persona-to-actor derivation method** — the pipeline from stakeholder model to interaction spec task decomposition is an open design problem. RDD provides the precondition (discover's stakeholder models) but not the method.
4. **Interaction spec placement** — DECIDE (alongside scenarios, derived from stakeholder models) vs. ARCHITECT (alongside system design, Screenplay Pattern's SOLID architecture). Needs a decision.
5. **Play bounding** — Invariant 4 tension. Time-boxed sessions? Stakeholder-count limits? Felt saturation? Needs a design decision.
6. **Epistemic distance working hypothesis** — the play frame itself does the distancing work (Bateson), combined with discover's stakeholder profiles as anchoring material. Not fully solved but has a working position.

### From DISCOVER
7. **"Discovery from research" / "discovery from play"** — the user's one-sentence framing of the discover-play symmetry. Novel in software context. Epistemic bookends around the pragmatic center.
8. **Field notes, not play log** — play's artifact is field notes (observational, naturalistic, in-the-moment), not a structured log with categories. Pairs with the field guide: the guide is the map, the notes are the journal.
9. **Play's meta-framing conversation** — like synthesis but more structured. Q&A around stakeholder roles, artifacts, where the cycle began, the journey of discovery, what got built. The field guide serves as reference during this setup.
10. **Play bounded by felt understanding** — no timebox, no stakeholder-count limit. Play is praxis toward Invariant 0 — it continues until understanding plateaus. Aligns with how synthesis bounds itself.
11. **Interaction specs create the "playable surface"** — confirmed from real frustration (GH issue #7). Without interaction specs, play is frustrating because there's nothing structured to encounter. Ordering confirmed: discover → interaction specs → build → play.
12. **Gamemaster is epistemic** — sits on the epistemic side of Invariant 3 boundary. Practical byproducts (bugs, new questions) emerge, but the role serves understanding first.
13. **Play is relevant once build has taken place** — play's impact is gated on BUILD having happened. Team Lead scoping use case (RESEARCH → ARCHITECT) doesn't reach play.
14. **Playing as yourself is equally valid** — if the practitioner is the primary stakeholder, self-play is natural. The play frame does the distancing regardless. Role selection is contextual.
15. **Spike-play is distinct from post-build play** — both valid, different purposes. Spike-play explores feasibility; post-build play discovers what specs missed.
16. **Method vs. plugin distinction for gamemaster** — RDD the method could support a human gamemaster; RDD the plugin implements the agent in this role.

## Context for Resumption

- The essay treats interaction specs and play as two manifestations of the same gap (specification vs. experience), connected through discover's stakeholder models
- Discover-play symmetry: "discovery from research" vs. "discovery from play" — epistemic bookends
- Play is structurally parallel to synthesis (three-movement: inhabit → explore → reflect) but with a preparatory meta-framing conversation
- Play's artifact is field notes (observational, naturalistic) — not the essay's "play log" with structured categories. Field guide / field notes pairing: map / journal
- Play bounded by felt understanding (Invariant 0), not timebox (Invariant 4 resolved differently than essay proposed)
- Interaction specs are a precondition for productive play — they create the "playable surface"
- Gamemaster is epistemic in character with practical byproducts
- Plugin settings.json updated with Write/Bash permissions for subagents (ship with next release)
- The reflection (008) captures the gamemaster concept and Stanislavski framing in detail
- Product debt table now includes 3 new items: missing interaction spec layer, missing play phase, passive agent role gap

## Related Issues

- nrgforge/rdd#4 — New phase: 'play'
- nrgforge/rdd#7 — Add interaction specification layer
