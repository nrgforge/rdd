# Orientation: Research-Driven Development (RDD)

*Updated 2026-04-06 — Cycle 9 (Sycophancy Resistance Architecture) BUILD complete*

## What This System Is

RDD is a methodology for building software you understand. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it. AI changed what is easy (generation) and what is hard (understanding); RDD uses AI for what it is good at while structuring the practices that produce the understanding AI cannot give you. The pipeline runs: RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. At Cycle 7, RDD extended beyond the pipeline into everyday work: a composable skill family (build, debug, refactor, review) shares a Context Gathering protocol and can be used standalone or composed within a build cycle — serving both the practitioner running a full pipeline and the developer with no RDD background who simply wants to understand what they build. At Cycle 9, RDD added a two-tier sycophancy resistance architecture: Tier 1 unconditional structural mechanisms (subagent audits, susceptibility snapshots, research methods review) that fire regardless of context; Tier 2 context-responsive conversational mechanisms (question form selection, constraint intensity, assertion-aware observation) calibrated by a multidimensional rubric. The feature that makes the agent useful — filtering for relevance — is exactly where sycophantic content selection hides; structure constrains what can be omitted, not just what gets said.

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

- **AI Agent** — executes the skill files. The pipeline's instructions are literally written for this stakeholder. Eight specialist subagents handle focused work (citation auditing, argument auditing, literature review, conformance scanning, orientation writing, code spikes, research methods review, susceptibility snapshot evaluation). During play, the orchestrating agent takes on the gamemaster role — active facilitation rather than skill execution or artifact production.
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
5. **Structural constraints determine sycophancy resistance; conversational discipline alone cannot.** The same mechanism that makes the agent useful — filtering for relevance — is where sycophantic content selection operates. Tier 1 architectural mechanisms (subagent isolation, susceptibility snapshots, framing audits) are unconditional; Tier 2 conversational mechanisms adapt to context. The agent cannot self-exempt from Tier 1. (ADRs 058, 059)

## How the Artifacts Fit Together

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective. Updated at Cycle 9 to include sycophancy findings: deep engagement and trust in the methodology correlate with higher susceptibility to sycophantic content selection.
- `system-design.md` — module decomposition, responsibility allocation, dependency graph, provenance chains. v11.0: two-tier sycophancy resistance architecture; 8 specialist subagents; Research Skill amended with essay-as-checkpoint and research methods dispatch; Argument Auditor extended with framing audit. The technical perspective.
- `roadmap.md` — Cycle 9 work packages (WP-A through WP-E) with classified dependencies, transition states, and open decision points. The sequencing perspective.

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. Amendment 16: Sycophancy Gradient, Content Selection, Susceptibility Snapshot, Earned Confidence, Two-Tier Resistance, Grounding Reframe, and related terms. The vocabulary authority.
- `essays/` — research findings (13 essays: 001-011 as before; 012 — Trading Fours — Pair-RDD research; 013 — Sycophancy and RDD Reflexivity — investigates performative vs. genuine anti-sycophancy mechanisms, spike evidence that belief-mapping achieves near-zero divergence vs. adversarial framing's 2-6× overcorrection)
- `decisions/` — ADRs (62 decisions: 001-054 as settled; 055-062 sycophancy resistance architecture — belief-mapping Inversion Principle, six-question AID toolkit, AID susceptibility extension, two-tier resistance, Grounding Reframe, Research Methods Subagent, framing audit, assertion-aware observation)
- `scenarios.md` — refutable behavior specifications
- `interaction-specs.md` — workflow-level specification of how each stakeholder works with the system. Creates the playable surface.
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference. Pairs with field notes: the guide is the map, the notes are the journal.
- `essays/reflections/field-notes.md` — observational discovery records from play, categorized by feedback destination
- `essays/reflections/` — meta-observations from epistemic gate conversations
- `essays/research-logs/` — process records from research phases; `session/` directory (gitignored) — reconstructed facsimiles produced during context-reconstructive mode builds

## Current State

**Plugin:** RDD is packaged as a Claude Code plugin (`nrgforge/rdd`) with a four-layer architecture: 15 skills (orchestration + composable skill family + utility skills), 8 specialist subagents, 5 cross-cutting hooks, and the self-referential artifact corpus. All skills implemented.

**Pipeline:** RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. A conformance audit utility (`/rdd-conform`) operates outside the pipeline.

**Completed cycle:** Cycle 9 — Sycophancy Resistance Architecture. All five work packages delivered: new specialist subagents (WP-A), argument auditor framing extension (WP-B), AID cycle extension across all phase skills (WP-C), orchestrator integration (WP-D), and verification pass (WP-E). ADRs 055-062. Essay 013 (Sycophancy and RDD Reflexivity). Domain model Amendment 16. System Design v11.0.

**What's settled (through ADR-062):**
- Full pipeline ADRs 001-042 — gate protocol, product discovery, synthesis, orientation, roadmap, field guide, plugin architecture, play, gamemaster, adaptive gates (AID cycle), reflection time naming, self-explanation utility
- Code review utility (ADRs 043-047) — two operating modes, questions-not-findings, collaborative context-gathering, build stewardship integration
- Composable skill family (ADRs 048-054) — four skills sharing Context Gathering; Build as outer loop with seamless mode-shift composition; Debug and Refactor as standalone skills with mode-shift entry; session artifacts to `session/` directory; AI Smell Taxonomy; time budget as continuous spectrum; skill boundaries invisible inside build flow
- Sycophancy resistance architecture (ADRs 055-062) — belief-mapping as Inversion Principle form; six-question AID toolkit (non-formulaic requirement is hard constraint); inline AID susceptibility observation + isolated Susceptibility Snapshot evaluation; unconditional Tier 1 architectural floor; Grounding Reframe as named behavioral pattern; Research Methods Subagent (8th specialist) before each research loop after substantial revision; framing audit as argument auditor extension; assertion-aware observation in AID (semantic detection, Tier 2)

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
- Susceptibility signal thresholds — what constitutes "increasing" assertion density is unspecified; calibration should emerge from practice across real cycles (Cycle 9 Roadmap open decision point)
- Retrospective sycophancy audit on prior artifact corpuses — measurable proxies identified (framing coverage, alternative engagement depth, vocabulary provenance) but not yet applied (Essay 013 §6)
