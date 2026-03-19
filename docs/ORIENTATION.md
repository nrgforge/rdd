# Orientation: Research-Driven Development (RDD)

*Generated 2026-03-12*

## What This System Is

RDD is a deep work tool for building software through structured understanding. It replaces the common pattern of AI-generates-everything with a phased pipeline — research, product discovery, domain modeling, decisions, architecture, build — where the AI generates artifacts and the human engages with them at epistemic gates before proceeding. The central bet: if the person who runs the pipeline can explain what was built, who it was built for, and why, the software will be better and more maintainable than if they simply approved AI output. RDD composes with existing workflows rather than replacing them — teams reach for it when a problem warrants structured thinking, and put it away when the knowledge has been absorbed.

## Who It Serves

- **Solo Developer-Researcher** — runs the full pipeline to understand before building. The primary user.
  - Start: [SKILL.md](../SKILL.md) (orchestrator — workflow modes, phase sequence)
  - Then: [product-discovery.md](product-discovery.md) (who are you building for?)
  - Then: [system-design.md](system-design.md) (how is it structured?)
  - Then: [roadmap.md](roadmap.md) (what depends on what, where are choices?)
  - Background: [Essay 001](essays/001-pedagogical-epistemology-of-rdd.md) (why epistemic gates exist)

- **Research-Engineer-Writer** — uses the research, product discovery, and modeling phases as a structured investigation methodology, whether or not software gets built.
  - Start: [rdd-research SKILL.md](../rdd-research/SKILL.md) (research loop mechanics)
  - Then: [rdd-product SKILL.md](../rdd-product/SKILL.md) (product discovery process)
  - Then: [domain-model.md](domain-model.md) (vocabulary authority)
  - Background: [Essay 003](essays/003-synthesis-as-final-epistemic-act.md) (synthesis methodology)

- **Team Lead (scoping)** — runs RESEARCH through ARCHITECT, then hands off artifacts to a team for building. Uses RDD as a leadership thinking tool.
  - Start: [product-discovery.md](product-discovery.md) (stakeholder needs, value tensions)
  - Then: [system-design.md](system-design.md) (module decomposition, responsibility matrix)
  - Then: [roadmap.md](roadmap.md) (work packages, dependency classification, transition states)
  - Then: [decisions/](decisions/) (ADRs — the "why" behind each choice)
  - Handoff artifact: [scenarios.md](scenarios.md) (what the team builds against)

- **AI Agent** — executes the skill files. The pipeline's instructions are literally written for this stakeholder.
  - Start: [SKILL.md](../SKILL.md) (orchestrator — phase sequence, gate protocol, cross-phase rules)
  - Reference: [domain-model.md](domain-model.md) § Invariants (constitutional authority)
  - Reference: [system-design.md](system-design.md) (module ownership, fitness criteria)
  - Reference: [field-guide.md](references/field-guide.md) (module-to-implementation mapping)

- **Teammates / Collaborators** — receive artifacts without having gone through the gates. Need this document to orient.
  - Start: this document
  - Product perspective: [product-discovery.md](product-discovery.md)
  - Technical perspective: [system-design.md](system-design.md)
  - Vocabulary: [domain-model.md](domain-model.md) (if terms are unfamiliar)

## Key Constraints

1. **The user must be able to speak with authority** about what was built, who it was built for, and why — without AI assistance. Every other design decision serves this outcome. (Invariant 0)
2. **Understanding requires generation, not review.** Every gate requires the user to produce something — an explanation, prediction, or articulation. Approval alone is not sufficient. (Invariants 1, 2)
3. **Pragmatic actions may be automated; epistemic actions may not.** The boundary between what the AI does and what the human does is the core design decision. (Invariant 3)
4. **Epistemic cost must remain lightweight.** 5-10 minutes per gate. If it becomes burdensome, users will circumvent it. (Invariant 4)

## How the Artifacts Fit Together

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective.
- `system-design.md` — module decomposition, responsibility allocation, dependency graph, provenance chains. The technical perspective.
- `roadmap.md` — work packages with classified dependencies (hard/implied/open), transition states, open decision points. The sequencing perspective.

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. The vocabulary authority.
- `essays/` — research findings (6 essays: pedagogical epistemology, product discovery, synthesis, orientation document, roadmap/field guide/sizing, outline as exhibition)
- `decisions/` — ADRs (30 decisions, from epistemic gates through synthesis enrichment)
- `scenarios.md` — refutable behavior specifications (164 scenarios)
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference.
- `essays/reflections/` — meta-observations from epistemic gate conversations
- `essays/research-logs/` — process records from research phases

## Current State

**Pipeline:** All phases have been designed and built. The pipeline runs: RESEARCH → PRODUCT DISCOVERY → MODEL → DECIDE → ARCHITECT → BUILD → SYNTHESIS (optional). A conformance audit utility (`/rdd-conform`) operates outside the pipeline for artifact template alignment, drift detection, remediation, and graduation.

**What's settled:**
- Epistemic gate protocol (ADRs 001-005) — implemented in all skill files
- Product discovery phase (ADRs 006-011) — implemented as `/rdd-product` with forward, backward, and update modes
- Synthesis phase (ADRs 012-018) — implemented as `/rdd-synthesis`
- Orientation document (ADRs 019-021) — integrated into orchestrator with three-tier hierarchy
- Roadmap generation (ADR-022) — architect skill generates roadmap alongside system design
- Field guide generation (ADR-023) — build skill generates field guide when implementation exists
- Document sizing heuristics (ADR-024) — five cascading heuristics as cross-cutting principle
- Conformance audit with graduation (ADR-025) — `/rdd-conform` with four operations
- Scoped cycles (ADR-026) — first-class workflow pattern: scope → cycle → graduate
- Deep work tool framing (ADR-026) — RDD composes with existing workflows

- Synthesis enrichment (ADRs 027-030) — four-dimension framing model, structural experiments, two-register outline, synthesis re-entry. Implemented in `/rdd-synthesis` SKILL.md.

**Open questions (selected):**
- How would Pair-RDD work at epistemic gates?
- Should external review be formalized as a pipeline operation?
- Cross-project synthesis (portfolio mode) is described but not operationalized
- Fading implementation (Invariant 6) is deferred — tracked as design debt (ADR-005)
- Conformance audit sizing heuristic check — not yet part of the audit operation
- Should graduation surface lingering open questions as a distinct category?
