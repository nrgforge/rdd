# Orientation: Research-Driven Development (RDD)

*Generated 2026-03-27*

## What This System Is

RDD is a methodology for building software you understand. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it. AI changed what's easy (generation) and what's hard (understanding); RDD uses AI for what it's good at while structuring the practices that produce the understanding AI can't give you. The pipeline runs: RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. RDD composes with existing workflows — you reach for it when a problem warrants structured thinking, and graduate the artifacts when the knowledge has been absorbed.

Distributed as a Claude Code plugin at [nrgforge/rdd](https://github.com/nrgforge/rdd). Manifesto at [nrgforge.github.io/rdd](https://nrgforge.github.io/rdd/).

## Who It Serves

- **Solo Developer-Researcher** — runs the full pipeline to understand before building. The primary user.
  - Start: [orchestrator SKILL.md](../skills/rdd/SKILL.md) (workflow modes, phase sequence)
  - Then: [product-discovery.md](product-discovery.md) (who are you building for?)
  - Then: [system-design.md](system-design.md) (how is it structured?)
  - Then: [roadmap.md](roadmap.md) (what depends on what, where are choices?)
  - Background: [Essay 001](essays/001-pedagogical-epistemology-of-rdd.md) (why epistemic gates exist)

- **Research-Engineer-Writer** — uses the research, discovery, and modeling phases as a structured investigation methodology, whether or not software gets built.
  - Start: [research SKILL.md](../skills/research/SKILL.md) (research loop mechanics)
  - Then: [discover SKILL.md](../skills/discover/SKILL.md) (product discovery process)
  - Then: [domain-model.md](domain-model.md) (vocabulary authority)
  - Background: [Essay 003](essays/003-synthesis-as-final-epistemic-act.md) (synthesis methodology)

- **Team Lead (scoping)** — runs RESEARCH through ARCHITECT, then hands off artifacts to a team for building. Uses RDD as a leadership thinking tool.
  - Start: [product-discovery.md](product-discovery.md) (stakeholder needs, value tensions)
  - Then: [system-design.md](system-design.md) (module decomposition, responsibility matrix)
  - Then: [roadmap.md](roadmap.md) (work packages, dependency classification, transition states)
  - Then: [decisions/](decisions/) (ADRs — the "why" behind each choice)
  - Handoff artifact: [scenarios.md](scenarios.md) (what the team builds against)

- **AI Agent** — executes the skill files. The pipeline's instructions are literally written for this stakeholder. Specialist subagents handle focused work (citation auditing, argument auditing, literature review, conformance scanning, orientation writing, code spikes). During play, the orchestrating agent takes on the gamemaster role — active facilitation rather than skill execution or artifact production.
  - Start: [orchestrator SKILL.md](../skills/rdd/SKILL.md) (phase sequence, gate protocol, cross-phase rules)
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
2. **Understanding requires generation, not review.** Every phase transition challenges the user to produce something — an explanation, prediction, or articulation. Approval alone is not sufficient. (Invariants 1, 2)
3. **Pragmatic actions may be automated; epistemic actions may not.** The boundary between what the AI does and what the human does is the core design decision. (Invariant 3)
4. **Epistemic cost must remain lightweight.** Minutes per reflection, not hours. If it becomes burdensome, users will circumvent it. (Invariant 4)

## How the Artifacts Fit Together

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective.
- `system-design.md` — module decomposition, responsibility allocation, dependency graph, provenance chains. The technical perspective.
- `roadmap.md` — work packages with classified dependencies (hard/implied/open), transition states, open decision points. The sequencing perspective.

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. The vocabulary authority.
- `essays/` — research findings (8 essays: pedagogical epistemology, product discovery, synthesis, orientation document, roadmap/field guide/sizing, outline as exhibition, plugin architecture, play and interaction specification)
- `decisions/` — ADRs (39 decisions, from epistemic gates through play/interaction specs)
- `scenarios.md` — refutable behavior specifications (228 scenarios)
- `interaction-specs.md` — workflow-level specification of how each stakeholder works with the system. Creates the playable surface.
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference.
- `essays/reflections/field-notes.md` — observational discovery records from play, categorized by feedback destination. Pairs with the field guide: the guide is the map, the notes are the journal.
- `essays/reflections/` — meta-observations from epistemic gate conversations
- `essays/research-logs/` — process records from research phases

## Current State

**Plugin:** RDD is packaged as a Claude Code plugin (`nrgforge/rdd`) with a four-layer architecture: 11 skills (orchestration + `/rdd-about` utility), 6 specialist subagents (focused work), 5 cross-cutting hooks (passive enforcement), and the self-referential artifact corpus.

**Pipeline:** RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. A conformance audit utility (`/rdd-conform`) operates outside the pipeline for artifact template alignment, drift detection, remediation, and graduation.

**What's settled:**
- Adaptive reflection time protocol (ADRs 001-005, 040-041) — Attend-Interpret-Decide cycle implemented in all skill files; "reflection time" in user-facing dialogue
- Product discovery phase (ADRs 006-011) — implemented as `/rdd-discover` with forward, backward, and update modes
- Synthesis phase (ADRs 012-018) — implemented as `/rdd-synthesize`
- Orientation document (ADRs 019-021) — integrated into orchestrator with three-tier hierarchy
- Roadmap generation (ADR-022) — architect skill generates roadmap alongside system design
- Field guide generation (ADR-023) — build skill generates field guide when implementation exists
- Document sizing heuristics (ADR-024) — five cascading heuristics as cross-cutting principle
- Conformance audit with graduation (ADR-025) — `/rdd-conform` with four operations
- Scoped cycles (ADR-026) — first-class workflow pattern: scope → cycle → graduate
- Synthesis enrichment (ADRs 027-030) — four-dimension framing, structural experiments, two-register outline, re-entry
- Plugin architecture (ADRs 031-036) — specialist subagent extraction, cross-cutting hooks, plugin packaging, skill activator, research log archival
- Interaction specification layer (ADR-037) — `/rdd-decide` produces workflow-level interaction specs after scenarios, creating the playable surface
- Play phase (ADR-038) — `/rdd-play` facilitates post-build experiential discovery through stakeholder inhabitation; three movements (inhabit → explore → reflect); bounded by felt understanding; produces field notes
- Gamemaster role (ADR-039) — orchestrating agent serves as active facilitator during play, shaping attention (not conclusions) within the Invariant 3 boundary
- Adaptive gates (ADR-040) — Attend-Interpret-Decide cycle replaces fixed-template prompts; five pedagogical moves (challenge, probe, teach, clarify, re-anchor); challenge is the response to deep engagement
- Reflection time naming (ADR-041) — user-facing gates are "reflection time"; "epistemic gate" stays in research/design vocabulary
- Self-explanation utility (ADR-042) — `/rdd-about` reports plugin version and provides adaptive methodology overview for new users

**Open questions (selected):**
- How would Pair-RDD work at epistemic gates?
- Should external review be formalized as a pipeline operation?
- Cross-project synthesis (portfolio mode) is described but not operationalized
- Fading implementation (Invariant 6) is deferred — tracked as design debt (ADR-005)
- Should graduation surface lingering open questions as a distinct category?
- What is the systematic derivation method from stakeholder model to interaction specification? (ADR-037 open problem)
- Does play change across RDD cycles? Fading (Invariant 6) suggests early cycles involve deep play. (Essay 008 §6)
- Spike-play vs. post-build play — should spike-play be formalized? (Essay 008 §7)
