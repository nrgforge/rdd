# ADR-026: Formalize Scoped Cycles as First-Class Workflow Pattern

**Status:** Proposed

## Context

*Note: This ADR is motivated by empirical user experience and the product discovery update (2026-03-12), not by Essay 005's research. The essay addresses the conformance and graduation problems; the scoped cycle lifecycle emerged from the user's practice during the product discovery epistemic gate conversation.*

The user's experience running RDD on team deliverables reveals a natural lifecycle pattern:

1. **Whole-project RDD** — early stage, the system is being defined. Full pipeline runs establish architecture, vocabulary, and product understanding.
2. **Project stabilizes** — the architecture is settled, the system design is the source of truth.
3. **Subsystem RDD** — new features or subsystems get their own scoped cycles, with their own `docs/` subfolder and artifact corpus.
4. **Graduation** — when the feature is built and stable, knowledge folds into project-level docs. RDD artifacts are archived.

This extends the existing Scoping concept (ADR-006, product discovery) — scoping described a partial pipeline run for team handoff. Scoped cycles describe a full lifecycle: scope → cycle → graduate. The user frames RDD as a "deep work tool" — something you reach for when a problem warrants structured thinking, and put away when the knowledge has been absorbed.

The graduation trigger is a felt phase transition: the work shifts from identity-forming ("we're building and understanding what this is") to feature-extending ("we know what this is, now we're working on features"). When you stop needing to discover the system and start extending it, the RDD scaffolding at that scope has done its job.

## Decision

Formalize **Scoped Cycles** as a first-class workflow pattern in the orchestrator:

- A scoped cycle constrains the RDD pipeline to a subsystem or feature, with artifacts in a subfolder (e.g., `docs/features/auth/`)
- The scoped cycle operates within the broader project's architectural context — the subsystem's domain model and system design respect project-level constraints
- Scoped cycles follow the same pipeline phases and gate protocols as full-project cycles
- Scoped cycles typically end with graduation (ADR-025) — folding knowledge into project-level docs

The orchestrator recognizes this pattern alongside existing workflow modes. RDD is framed as a **deep work tool** — composable with existing workflows, not a replacement for them.

## Consequences

**Positive:**
- RDD scales with project maturity — whole-project early, subsystem later
- Documentation fatigue is addressed by graduating knowledge when it's absorbed
- Teams can use RDD for complex features without committing to RDD as a permanent methodology
- Native project docs are the permanent home; RDD docs are the working space

**Negative:**
- Coherence between subsystem and project-level architecture requires attention — subsystem findings may challenge project-level assumptions
- Multiple scoped cycles running in parallel could produce vocabulary conflicts
- Graduation requires judgment about what to keep vs. archive

**Neutral:**
- Does not change the pipeline phases, gate protocols, or invariants — applies existing machinery at a different scope
- The "deep work tool" framing is a mental model, not a mechanism — it influences how the orchestrator describes RDD, not how it executes
