# Orientation: Research-Driven Development (RDD)

*Updated 2026-04-04 — Cycle 7 complete, Cycle 8 paused*

## What This System Is

RDD is a methodology for building software you understand. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it. AI changed what is easy (generation) and what is hard (understanding); RDD uses AI for what it is good at while structuring the practices that produce the understanding AI cannot give you. The pipeline runs: RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. At Cycle 7, RDD extends beyond the pipeline into everyday work: a composable skill family (build, debug, refactor, review) shares a Context Gathering protocol and can be used standalone or composed within a build cycle — serving both the practitioner running a full pipeline and the developer with no RDD background who simply wants to understand what they build.

Distributed as a Claude Code plugin at [nrgforge/rdd](https://github.com/nrgforge/rdd). Manifesto at [nrgforge.github.io/rdd](https://nrgforge.github.io/rdd/).

## Who It Serves

- **Solo Developer-Researcher** — runs the full pipeline to understand before building. The primary user.
  - Start: [orchestrator SKILL.md](../skills/rdd/SKILL.md) (workflow modes, phase sequence)
  - Then: [product-discovery.md](product-discovery.md) (who are you building for?)
  - Then: [system-design.md](system-design.md) (how is it structured?)
  - Then: [roadmap.md](roadmap.md) (what depends on what, where are choices?)
  - Background: [Essay 001](essays/001-pedagogical-epistemology-of-rdd.md) (why epistemic gates exist)

- **Everyday Developer** — uses build, debug, refactor, and review for everyday work outside the full pipeline. Two entry points to the same stakeholder: an RDD practitioner doing lighter-weight work; or a developer with no RDD background who wants to understand what they build. Both arrive at the same need: orient before acting, build with understanding, come away sharper.
  - Start: `/rdd-build`, `/rdd-debug`, `/rdd-refactor`, or `/rdd-review` directly
  - Bridge to philosophy: `/rdd-about` (methodology overview, depth-calibrated)

- **Research-Engineer-Writer** — uses research, discovery, and modeling phases as a structured investigation methodology, whether or not software gets built.
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
3. **Pragmatic actions may be automated; epistemic actions may not.** The boundary between what the AI does and what the human does is the core design decision. Generation, artifact production, and context gathering are pragmatic. Reflection, articulation, and the decision to proceed are epistemic. (Invariant 3)
4. **Epistemic cost must be productive, not merely brief.** The constraint is on waste, not duration. Five minutes of genuine understanding beats two minutes of surface approval; formulaic gate exchanges that build no understanding are the waste. (Invariant 4, amended)
5. **Skill composition inside build is seamless mode shifts, not dispatch.** When a bug surfaces during TDD, build shifts to debug; when smells appear after green, it shifts to refactor; at stewardship checkpoints, it shifts to review. The developer stays in the thread of understanding — skill boundaries are implementation details that disappear inside the flow. (ADR-054)

## How the Artifacts Fit Together

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective. Updated at Cycle 6 to include the Everyday Developer stakeholder.
- `system-design.md` — module decomposition, responsibility allocation, dependency graph, provenance chains. v10.0: Debug Skill and Refactor Skill added; Build Skill rewritten as outer loop with mode-shift composition. The technical perspective.
- `roadmap.md` — Cycle 7 work packages (WP-A through WP-F) with classified dependencies, transition states, and open decision points. The sequencing perspective.

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. Amendment 15: Composable Skill Family, Context Gathering, Reconstructed Facsimile, Three-Level Refactor, AI Smell Taxonomy, and related terms. The vocabulary authority.
- `essays/` — research findings (11 essays: 001-010 as before; 011 — Building with Understanding — grounds the composable skill family in five research traditions under the unifying concept of Productive Resistance)
- `decisions/` — ADRs (54 decisions: 001-042 as settled; 043-047 code review utility; 048-054 composable skill family — composable skill family design, Context Gathering protocol, session artifacts, work decomposition, AI Smell Taxonomy, time budget, mode-shift composition)
- `scenarios.md` — refutable behavior specifications
- `interaction-specs.md` — workflow-level specification of how each stakeholder works with the system. Creates the playable surface.
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference.
- `essays/reflections/field-notes.md` — observational discovery records from play, categorized by feedback destination. Pairs with the field guide: the guide is the map, the notes are the journal.
- `essays/reflections/` — meta-observations from epistemic gate conversations
- `essays/research-logs/` — process records from research phases; `session/` directory (gitignored) — reconstructed facsimiles produced during context-reconstructive mode builds

## Current State

**Plugin:** RDD is packaged as a Claude Code plugin (`nrgforge/rdd`) with a four-layer architecture: 12 skills (orchestration + composable skill family + `/rdd-about` utility), 6 specialist subagents, 5 cross-cutting hooks, and the self-referential artifact corpus. All skills implemented.

**Pipeline:** RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. A conformance audit utility (`/rdd-conform`) operates outside the pipeline.

**Completed cycle:** Cycle 7 — composable skill family. All six work packages delivered: Context Gathering protocol (WP-A), Debug Skill (WP-B), Refactor Skill (WP-C), Build Skill rewrite with mode-shift composition (WP-D), orchestrator integration (WP-E), and verification pass (WP-F). ADRs 048-054. Essay 011 (Building with Understanding). Domain model Amendment 15. System Design v10.0.

**What's settled (through ADR-054):**
- Full pipeline ADRs 001-042 — gate protocol, product discovery, synthesis, orientation, roadmap, field guide, plugin architecture, play, gamemaster, adaptive gates (AID cycle), reflection time naming, self-explanation utility
- Code review utility (ADRs 043-047) — two operating modes, questions-not-findings, collaborative context-gathering, build stewardship integration
- Composable skill family (ADRs 048-054) — four skills sharing Context Gathering; Build as outer loop with seamless mode-shift composition (supersedes callout model, ADR-046); Debug and Refactor as standalone skills with mode-shift entry; session artifacts to `session/` directory; AI Smell Taxonomy (novel/exacerbated/accelerated) embedded in refactor skill; time budget as continuous spectrum; skill boundaries invisible inside build flow

**Paused cycle:** Cycle 8 — Pair-RDD. RESEARCH and DISCOVER complete; paused at MODEL boundary to let a key distinction marinate (corpus intersection vs. live pairing session — two design problems, not one). Full state in `cycle-status.md`. Essay 012 (trading-fours.md) is audited. Product discovery updated.

**Open questions (selected):**
- ~~How would Pair-RDD work at epistemic gates?~~ **Researched (Cycle 8, Essay 012)** — two humans at a gate enriches the protocol; the pair log mechanic and phase-dependent coupling are proposed. Paused before DECIDE.
- Should external review be formalized as a pipeline operation?
- Cross-project synthesis (portfolio mode) is described but not operationalized
- Fading implementation (Invariant 6) is deferred — tracked as design debt (ADR-005)
- What is the systematic derivation method from stakeholder model to interaction specification? (ADR-037 open problem)
- Does play change across RDD cycles? Fading suggests early cycles involve deep play. (Essay 008 §6)
- Session artifact location (`./session/` vs `./docs/session/`) — builder decides based on gitignore conventions (Roadmap open decision point)
- Context Gathering protocol reference location — orchestrator section, standalone file, or inline per skill (Roadmap open decision point)
