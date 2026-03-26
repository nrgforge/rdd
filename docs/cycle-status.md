# Active RDD Cycle: Play and Interaction Specification

**Started:** 2026-03-25
**Current phase:** PRODUCT DISCOVERY (next)
**Artifact base:** ./docs/
**Essay:** 008-play-and-interaction-specification.md

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | Essay 008, 2 lit reviews, 2 audit reports | Agent-as-gamemaster; "a game you've never played" reframes epistemic distance; Stanislavski objectives structure |
| DISCOVER | ☐ Next | — | — |
| MODEL | ☐ Pending | — | — |
| DECIDE | ☐ Pending | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
| SYNTHESIS | ☐ Optional | — | — |

## Feed-Forward Signals

1. **Agent-as-gamemaster** — the agent's role in play is active facilitation (like Spolin's side-coaching or a tabletop RPG gamemaster), not just stage-setting. Candidate domain concept.
2. **Stanislavski objectives structure** — inhabitation has internal structure: super-objective (stakeholder's overarching need from discover), objective (what they want in a given interaction), obstacles (discovered through play).
3. **Persona-to-actor derivation method** — the pipeline from stakeholder model to interaction spec task decomposition is an open design problem. RDD provides the precondition (discover's stakeholder models) but not the method.
4. **Interaction spec placement** — DECIDE (alongside scenarios, derived from stakeholder models) vs. ARCHITECT (alongside system design, Screenplay Pattern's SOLID architecture). Needs a decision.
5. **Play bounding** — Invariant 4 tension. Time-boxed sessions? Stakeholder-count limits? Felt saturation? Needs a design decision.
6. **Epistemic distance working hypothesis** — the play frame itself does the distancing work (Bateson), combined with discover's stakeholder profiles as anchoring material. Not fully solved but has a working position.

## Context for Resumption

- The essay treats interaction specs and play as two manifestations of the same gap (specification vs. experience), connected through discover's stakeholder models
- Discover-play symmetry: epistemic bookends around the pragmatic center of the pipeline
- Play is structurally parallel to synthesis (three-movement: inhabit → explore → reflect)
- The play log categorizes discoveries by feedback destination (DECIDE, DISCOVER, RESEARCH, SYNTHESIS, interaction specs)
- Plugin settings.json updated with Write/Bash permissions for subagents (ship with next release)
- The reflection (008) captures the gamemaster concept and Stanislavski framing in detail

## Related Issues

- nrgforge/rdd#4 — New phase: 'play'
- nrgforge/rdd#7 — Add interaction specification layer
