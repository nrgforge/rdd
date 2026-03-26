# ADR-037: Add Interaction Specification Layer in DECIDE Phase

**Status:** Proposed

## Context

Essay 008 identifies a missing middle layer between business-rule scenarios and technical implementation — the mechanics of how each stakeholder works with the system. Multiple communities converge on this structural observation independently: Adzic's three-layer model (business rule → workflow → technical activity), the Screenplay Pattern (Goal → Task → Interaction), and Hierarchical Task Analysis (Goal → Plan → Operation). The isomorphism between HTA and Screenplay is structural, not genealogical — convergence from independent communities is evidence the decomposition tracks a real structural problem.

The sharpest finding is the persona-to-actor gap: the pipeline from stakeholder models to task decompositions is assumed everywhere and designed nowhere. RDD's Product Discovery phase provides the upstream input that no existing methodology supplies — stakeholders, jobs, mental models, value tensions. Interaction Specifications would derive task decompositions from those stakeholder models, encoding how each stakeholder works with the solution at the workflow level.

Interaction Specifications also create the Playable Surface that the proposed Play phase requires (ADR-038). Without specified interaction mechanics, play has nothing structured to encounter and discover deviations from — confirmed through real user frustration (nrgforge/rdd#7).

The placement question (domain model open question): DECIDE (alongside scenarios, derived from stakeholder models) vs. ARCHITECT (alongside system design, following the Screenplay Pattern's SOLID architecture). The Screenplay Pattern's architectural character is a genuine argument for ARCHITECT — the Goal → Task → Interaction → Ability hierarchy shapes how BUILD reads the specs. However, the derivation source is the stronger criterion: Interaction Specifications derive from Product Discovery's stakeholder models and complement scenarios as behavioral specifications. They answer "how does this stakeholder work with the system?" — a specification question — not "how are the system's modules decomposed?" — a design question. This places them in the specification family (DECIDE) rather than the design family (ARCHITECT).

## Decision

Add Interaction Specifications as a DECIDE-phase artifact, written after scenarios and derived from Product Discovery's stakeholder models. The artifact specifies how each stakeholder works with the system at the workflow level — more concrete than scenarios, more stable than implementation details.

**Artifact location:** `./docs/interaction-specs.md`

**Structure:** Organized by stakeholder, with task decompositions at the workflow level. Each entry specifies:
- **Stakeholder** (from Product Discovery's stakeholder map)
- **Super-Objective** (the stakeholder's overarching need — from discover)
- **Task** (what the stakeholder does at the workflow level — stable across UI changes)
- **Interaction mechanics** (how the task is performed — changeable with the UI)

The derivation method from stakeholder model to task decomposition is an open design problem. This ADR establishes the artifact and its pipeline position; the derivation method evolves through use.

**The `/rdd-decide` skill** writes Interaction Specifications after scenarios. The `/rdd-build` skill reads them alongside scenarios as behavioral requirements.

## Consequences

**Positive:**
- Fills the persona-to-actor gap — connects Product Discovery's stakeholder models to the specification layer
- Creates the Playable Surface that the Play phase requires
- Captures the workflow-level mechanics that scenarios miss (e.g., click vs. drag coexistence, activation thresholds, discoverable dialogs under pressure)
- Provides the Objective level of play's Stanislavski inhabitation structure (Super-Objective from discover, Objective from interaction specs, Obstacle discovered through play)
- Likely stabilizes tests — workflow-level specs change less often than UI details, though this remains practitioner consensus rather than measured outcome (Essay 008, §2)

**Negative:**
- Adds an artifact to the DECIDE phase, increasing cycle time. Mitigated by Invariant 4 (lightweight). The artifact should be thin — task decompositions, not exhaustive UI specifications
- The derivation method is unresolved. The artifact can be produced but the systematic method for going from stakeholder model → task decomposition remains an open design problem

**Neutral:**
- Existing scenario infrastructure in `/rdd-decide` applies without modification — Interaction Specifications complement scenarios, they do not replace them
- The Screenplay Pattern's downstream architecture (Task → Interaction → Ability) informs BUILD's implementation but is not prescribed at the DECIDE level
