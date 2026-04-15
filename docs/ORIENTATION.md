# Orientation: Research-Driven Development (RDD)

*Updated 2026-04-11 — Cycle 10 (Specification-Execution Gap) BUILD complete; v0.7.2 ships Invariant 8 operational*

## What This System Is

RDD is a methodology for building software you understand. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it. AI changed what is easy (generation) and what is hard (understanding); RDD uses AI for what it is good at while structuring the practices that produce the understanding AI cannot give you. The pipeline runs: RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. At Cycle 7, RDD extended beyond the pipeline into everyday work: a composable skill family (build, debug, refactor, review) shares a Context Gathering protocol and can be used standalone or composed within a build cycle — serving both the practitioner running a full pipeline and the developer with no RDD background who simply wants to understand what they build. At Cycle 9, RDD added a two-tier sycophancy resistance architecture: Tier 1 unconditional structural mechanisms (subagent audits, susceptibility snapshots, research methods review) that fire regardless of context; Tier 2 context-responsive conversational mechanisms (question form selection, constraint intensity, assertion-aware observation) calibrated by a multidimensional rubric. At Cycle 10, RDD added **Invariant 8** (mechanism execution must be structurally anchored) and the three-substrate enforcement architecture — Skill-Structure Layer (per-phase dispatch sites), Harness Layer (manifest + compound check hooks), and User-Tooling Layer (gate reflection notes graduated to artifacts) — that makes Tier 1 mechanisms reliably fire under task load without ceremonial attention. The feature that makes the agent useful — filtering for relevance — is exactly where sycophantic content selection hides; structure constrains what can be omitted, not just what gets said, and the enforcement layer catches when the structure itself fails to fire.

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
6. **Mechanism execution must be structurally anchored.** A specified mechanism is not a working mechanism. Any unconditional structural mechanism whose dispatch depends on orchestrator contextual judgment will fail under task load. Unconditional status requires anchoring to one of three substrates: Skill-Structure Layer (step-anchored in skill text), Harness Layer (hook-verifiable at tool-call or phase boundary), or User-Tooling Layer (canonical-path artifact requirement). Mechanisms that cannot be anchored may not be specified as unconditional — they may be specified as best-effort with honest transparency about their non-structural character. (Invariant 8, ADRs 063–070)

## How the Artifacts Fit Together

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective. Cycle 10 additions: sycophancy propagation patterns, scope transparency framing, and the methodology's own visible limitations as a product quality.
- `system-design.md` — module decomposition, responsibility allocation, dependency graph, provenance chains. v12.0 Amendment #13: Harness Layer modules (manifest, PostToolUse logger, Stop hook compound check, GitHub issue template), Structural Enforcement Concepts responsibility matrix, Appendix A with per-phase susceptibility snapshot briefs. The technical perspective.
- `roadmap.md` — Completed Work Log through Cycle 10 (WP-A through WP-F across v0.7.0, v0.7.1, and v0.7.2). The sequencing perspective.

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. Amendment 17: Invariant 8 (mechanism execution must be structurally anchored), Three-Tier Enforcement Classification, Layered Enforcement Adoption, compound defense, reframe-derailed gate limitation. The vocabulary authority.
- `essays/` — research findings (14 essays: 001-011 as before; 012 — Trading Fours — Pair-RDD research; 013 — Sycophancy and RDD Reflexivity; 014 — The Specification-Execution Gap in Prompt-Based Methodology — diagnoses why anchored mechanisms execute while judgment-dispatched mechanisms fail, and proposes the three-substrate enforcement architecture that Cycle 10 built and shipped)
- `decisions/` — ADRs (70 decisions: 001-054 as settled; 055-062 sycophancy resistance architecture; 063-070 structural enforcement for Invariant 8 — per-phase manifest format, compound check hooks, anchor dispatch skill-structure fix, user-tooling layer AID gate reflection, three-tier enforcement classification, grounding reframe extension, methodology scope-of-claim, housekeeping migration)
- `scenarios.md` — refutable behavior specifications (407 scenarios total; 2341-2739 cover Cycle 10's Invariant 8 enforcement)
- `interaction-specs.md` — workflow-level specification of how each stakeholder works with the system. Creates the playable surface.
- `housekeeping/` — infrastructure artifacts (centered-vs-infrastructure framing per ADR-064): audit reports, dispatch log, cycle-status, gate reflection notes, migration marker and rollback manifest. Users can read directly if they choose; the workflow does not center them.
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference. Pairs with field notes: the guide is the map, the notes are the journal.
- `essays/reflections/field-notes.md` — observational discovery records from play, categorized by feedback destination
- `essays/reflections/` — meta-observations from epistemic gate conversations
- `essays/research-logs/` — process records from research phases; `session/` directory (gitignored) — reconstructed facsimiles produced during context-reconstructive mode builds

## Current State

**Plugin:** RDD is packaged as a Claude Code plugin (`nrgforge/rdd`) at v0.7.2 (with Cycle 15 additions pending release) with a four-layer architecture: 15 skills (orchestration + composable skill family + utility skills), 8 specialist subagents, 7 cross-cutting hooks (1 PreToolUse, 1 UserPromptSubmit, 2 Stop, 3 PostToolUse), and the self-referential artifact corpus. All skills implemented. Harness Layer infrastructure (per-phase manifest, PostToolUse dispatch logger, Stop hook compound check) is operational in enforcement mode on migrated corpora, and now honors cycle-shape declaration (Skipped phases, Paused) per ADR-072.

**Pipeline:** RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. A conformance audit utility (`/rdd-conform`) operates outside the pipeline and includes a `migrate` subcommand (ADR-070) for the one-shot housekeeping migration that enables enforcement mode.

**Completed cycles:**

- **Cycle 10 — Specification-Execution Gap in Prompt-Based Methodology.** Six work packages across three releases: WP-A (Harness Layer hooks + manifest), WP-B (Skill-Structure Layer per-phase dispatch), WP-C (User-Tooling Layer gate reflection note), WP-D (orchestrator documentation of Three-Tier Classification, Grounding Reframe Extension, Methodology Scope-of-Claim, Centered-vs-Infrastructure framing) shipped in v0.7.0. WP-E (`/rdd-conform migrate` subcommand + post-migration paths) shipped in v0.7.1. WP-F (behavioral verification + migration dogfood + remediation of nine defects surfaced during live runtime testing) shipped in v0.7.2. ADRs 063-070. Essay 014. Invariant 8 added at MODEL. Domain model Amendment 17. System Design v12.0 Amendment #13.
- **Cycle 15 — Lifecycle Composition in Build Stewardship** (pending BUILD gate close; release pending). Mini-cycle (DECIDE + BUILD only) amending the build skill with a third integration-risk category, plus (mid-cycle scope creep) adding cycle-shape declaration to cycle-status.md to close a Stop-hook loop the methodology surfaced on itself. ADR-071 (three-sided catch for Lifecycle Composition at design-time, verification-time, and review-time anchors) + ADR-072 (Skipped phases and Paused fields in cycle-status.md honored by the Stop hook). Five WPs. Three glossary entries added (Lifecycle Composition, Shared Mutable State, Lifecycle Boundary). Known gap documented: ADR-072's two-field design does not cover the in-progress-gate mini-cycle case — candidate for a follow-up cycle.

**What's settled (through ADR-072):**
- Full pipeline ADRs 001-042 — gate protocol, product discovery, synthesis, orientation, roadmap, field guide, plugin architecture, play, gamemaster, adaptive gates (AID cycle), reflection time naming, self-explanation utility
- Code review utility (ADRs 043-047) — two operating modes, questions-not-findings, collaborative context-gathering, build stewardship integration
- Composable skill family (ADRs 048-054) — four skills sharing Context Gathering; Build as outer loop with seamless mode-shift composition; Debug and Refactor as standalone skills with mode-shift entry; session artifacts to `session/` directory; AI Smell Taxonomy; time budget as continuous spectrum; skill boundaries invisible inside build flow
- Sycophancy resistance architecture (ADRs 055-062) — belief-mapping as Inversion Principle form; six-question AID toolkit (non-formulaic requirement is hard constraint); inline AID susceptibility observation + isolated Susceptibility Snapshot evaluation; unconditional Tier 1 architectural floor; Grounding Reframe as named behavioral pattern; Research Methods Subagent (8th specialist) before each research loop after substantial revision; framing audit as argument auditor extension; assertion-aware observation in AID (semantic detection, Tier 2)
- Structural enforcement for Invariant 8 (ADRs 063-070) — per-phase manifest format with `{cycle}`/`{phase}` token substitution and `mechanism_type` field; compound check hooks (PostToolUse dispatch logger + Stop hook manifest verification) with advisory/enforcement mode split and Fails-Safe-to-Allow; anchor dispatch skill-structure fix placing per-phase dispatches at bottom-third position in all 8 phase skills; user-tooling layer graduated from AID conversation to gate reflection note artifact; three-tier enforcement classification with four-step decision procedure; Grounding Reframe extension with three significance properties; methodology scope-of-claim with positive and negative scope items; housekeeping migration via `/rdd-conform migrate` subcommand
- Lifecycle composition in build stewardship (ADRs 071-072) — *Lifecycle Composition* named as a third category in `/rdd-build` (alongside test-suite composition and structural-boundary verification), anchored at COMPOSABLE TESTS (design-time prompt), Step 5 Integration Verification (verification-time anchor), and Stewardship Tier 1 Test quality sub-item 6e (review-time detector); Stop hook honors `**Skipped phases:**` and `**Paused:**` fields in cycle-status.md with session-scoped one-time pause-notice; Pause Log section records pause/resume history

**Paused cycle:** Cycle 8 — Pair-RDD. RESEARCH and DISCOVER complete; paused at MODEL boundary to let a key distinction marinate (corpus intersection vs. live pairing session — two design problems, not one). Full state in `housekeeping/cycle-status.md` (post-migration path). Essay 012 (trading-fours.md) is audited. Product discovery updated.

**Open questions (selected):**
- ~~Does the per-phase susceptibility snapshot dispatch actually fire under task load?~~ **Answered empirically during Cycle 10 WP-F (2026-04-11)** — yes, the Skill-Structure Layer anchor fires reliably. The build phase susceptibility snapshot dispatched without ceremonial attention via the ADR-065 anchor, produced a substantive artifact, and was logged by the PostToolUse hook. First live operational Tier 1 dispatch in project history
- **Test-runtime protocol divergence (Cycle 11 candidate research question)** — what categories of behavior are structurally unreachable by specification-conformant synthetic tests, and which warrant runtime-level testing infrastructure? Cycle 10 WP-F caught nine defects the synthetic test suite missed, including `$INPUT`-vs-stdin hook delivery (Finding #9) and plugin-namespace prefix matching (Finding #7). A runtime smoke test that fires an actual subagent dispatch would have caught both. The question is scoped
- Should external review be formalized as a pipeline operation?
- Cross-project synthesis (portfolio mode) is described but not operationalized
- Fading implementation (Invariant 6) is deferred — tracked as design debt (ADR-005)
- What is the systematic derivation method from stakeholder model to interaction specification? (ADR-037 open problem)
- Does play change across RDD cycles? Fading suggests early cycles involve deep play. (Essay 008 §6)
- Susceptibility signal thresholds — what constitutes "increasing" assertion density is unspecified; calibration should emerge from practice across real cycles (Cycle 9 Roadmap open decision point)
- Retrospective sycophancy audit on prior artifact corpuses — measurable proxies identified (framing coverage, alternative engagement depth, vocabulary provenance) but not yet applied (Essay 013 §6)
