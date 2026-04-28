# Orientation: Research-Driven Development (RDD)

*Updated 2026-04-28 — Cycle 017 (Readability & Comprehensibility) ARCHITECT complete; system design at v14.0; BUILD pending. Companion-file pattern (ADR-084 Pattern B) applied to system-design.md; process artifacts relocate to `.rdd/` at BUILD per ADR-085; Tier 1 Harness Layer demoted to advisory across all modes per ADR-088 (skill-text anchoring is the load-bearing enforcement layer; harness adds detection and visibility).*

## What This System Is

RDD is a methodology for building software you understand. It wraps BDD and TDD in a research layer that changes what you build — not just how you build it. AI changed what is easy (generation) and what is hard (understanding); RDD uses AI for what it is good at while structuring the practices that produce the understanding AI cannot give you. The pipeline runs: RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. At Cycle 7, RDD extended beyond the pipeline into everyday work: a composable skill family (build, debug, refactor, review) shares a Context Gathering protocol and can be used standalone or composed within a build cycle. At Cycle 9, RDD added a two-tier sycophancy resistance architecture: Tier 1 unconditional structural mechanisms (subagent audits, susceptibility snapshots, research methods review) and Tier 2 context-responsive conversational mechanisms (question form selection, constraint intensity, assertion-aware observation) calibrated by a multidimensional rubric. At Cycle 10, RDD added **Invariant 8** (mechanism execution must be structurally anchored) and the three-substrate enforcement architecture — Skill-Structure Layer (per-phase dispatch sites), Harness Layer (manifest + compound check hooks), and User-Tooling Layer (gate reflection notes graduated to artifacts) — to make Tier 1 mechanisms reliably fire under task load. At Cycle 016, RDD addressed **methodology seams** — the boundaries where the methodology specifies the shape on each side but not the relationship between them — through seven targeted interventions across DECIDE, ARCHITECT, BUILD, RESEARCH, hooks, and the cycle-status schema. **At Cycle 017, RDD addresses readability and comprehensibility**: the Cognitive-Economy Criterion / Outcome Test (ADR-083) as admissibility test for human-facing artifacts; the Companion-File Pattern catalog (ADR-084 Pattern A/B) for agent-context content placement; the `.rdd/` infrastructure relocation (ADR-085) for process-vs-product directory separation; the demotion of the Stop-hook manifest check to advisory across all modes (ADR-088 amending ADR-064 — skill-text anchoring is now the load-bearing enforcement layer; the harness adds detection rather than prevention); tightly-scoped prototyping as a research method (ADR-087 §3); and the explicit non-adoption of AI-as-orienter pending operational criterion (ADR-086).

Distributed as a Claude Code plugin at [nrgforge/rdd](https://github.com/nrgforge/rdd). Manifesto at [nrgforge.github.io/rdd](https://nrgforge.github.io/rdd/).

## Who It Serves

- **Solo Developer-Researcher** — runs the full pipeline to understand before building. The primary user.
  - Start: [orchestrator SKILL.md](../skills/rdd/SKILL.md) (workflow modes, phase sequence)
  - Then: [product-discovery.md](product-discovery.md) (who are you building for?)
  - Then: [system-design.md](system-design.md) (high-level shape, module summaries) → [system-design.agents.md](system-design.agents.md) for full reference detail
  - Then: [roadmap.md](roadmap.md) (what depends on what, where are choices?)
  - Background: [Essay 001](essays/001-pedagogical-epistemology-of-rdd.md) (why epistemic gates exist)

- **Everyday Developer** — uses build, debug, refactor, and review for everyday work outside the full pipeline. Two entry points to the same stakeholder: an RDD practitioner doing lighter-weight work; or a developer with no RDD background who wants to understand what they build.
  - Start: `/rdd-build`, `/rdd-debug`, `/rdd-refactor`, or `/rdd-review` directly
  - Bridge to philosophy: `/rdd-about` (methodology overview, depth-calibrated)

- **Research-Engineer-Writer** — uses research, discovery, and modeling phases as a structured investigation methodology, whether or not software gets built.
  - Start: [research SKILL.md](../skills/research/SKILL.md) (research loop mechanics)
  - Then: [discover SKILL.md](../skills/discover/SKILL.md) (product discovery process)
  - Then: [domain-model.md](domain-model.md) (vocabulary authority)
  - Background: [Essay 003](essays/003-synthesis-as-final-epistemic-act.md) (synthesis methodology)

- **Team Lead (scoping)** — runs RESEARCH through ARCHITECT, then hands off artifacts to a team for building. Uses RDD as a leadership thinking tool.
  - Start: [product-discovery.md](product-discovery.md) (stakeholder needs, value tensions)
  - Then: [system-design.md](system-design.md) (high-level shape) → [system-design.agents.md](system-design.agents.md) (full module decomposition, responsibility matrix, contracts)
  - Then: [roadmap.md](roadmap.md) (work packages, dependency classification, transition states)
  - Then: [decisions/](decisions/) (ADRs — the "why" behind each choice)
  - Handoff artifact: [scenarios.md](scenarios.md) (what the team builds against)

- **AI Agent** — executes the skill files. The pipeline's instructions are literally written for this stakeholder. Eight specialist subagents handle focused work (citation auditing, argument auditing, literature review, conformance scanning, orientation writing, code spikes, research methods review, susceptibility snapshot evaluation). During play, the orchestrating agent takes on the gamemaster role.
  - Start: [orchestrator SKILL.md](../skills/rdd/SKILL.md) (phase sequence, gate protocol, cross-phase rules)
  - Reference: [domain-model.md](domain-model.md) § Invariants (constitutional authority)
  - Reference: [system-design.agents.md](system-design.agents.md) (full architectural drivers, module ownership, fitness criteria, integration contracts — the agent-context companion to system-design.md per ADR-084 Pattern B)
  - Reference: [field-guide.md](references/field-guide.md) (module-to-implementation mapping)

- **Teammates / Collaborators** — receive artifacts without having gone through the gates. Need this document to orient.
  - Start: this document
  - Product perspective: [product-discovery.md](product-discovery.md)
  - Technical perspective: [system-design.md](system-design.md) (briefer, human-facing) — depth in [system-design.agents.md](system-design.agents.md)
  - Vocabulary: [domain-model.md](domain-model.md) (if terms are unfamiliar)

- **Zero-Prior-Familiarity Reader** *(NEW in Cycle 017 — characterized by zero schema, not by external/internal status; includes both external recipients receiving the corpus and the practitioner returning after time away)* — needs schema-building before navigating substantive Tier 2 documents.
  - Start: this document (read top to bottom; it is the entry point with pointers, not the depth)
  - Then: pick **one** substantive document based on your purpose: [product-discovery.md](product-discovery.md) for the human-facing problem; [system-design.md](system-design.md) for the technical shape; [domain-model.md § Invariants](domain-model.md) for the most concentrated load-bearing constraints
  - The corpus map below tells you which subdirectories serve what purpose; you can ignore artifacts whose audience and purpose do not match yours
  - Per ADR-083 (Outcome Test), this orientation document is structured to produce direct human understanding without AI as a workaround — if you find yourself feeding documents to an AI to summarize them, that is the methodology's failure mode signal, not its intended pattern; flag it back to the maintainer
  - Per ADR-086, AI-as-orienter is **not** a methodology pattern — interactive agent-mediated orientation is held out pending an operational criterion that distinguishes it from AI-as-prosthetic in observable behavior; the corpus is designed to be read directly

## Key Constraints

1. **The user must be able to speak with authority** about what was built, who it was built for, and why — without AI assistance. Every other design decision serves this outcome. (Invariant 0)
2. **Understanding requires generation, not review.** Every phase transition challenges the user to produce something — an explanation, prediction, or articulation. Approval alone is not sufficient. (Invariants 1, 2)
3. **Pragmatic actions may be automated; epistemic actions may not.** The boundary between what the AI does and what the human does is the core design decision. (Invariant 3)
4. **Epistemic cost must be productive, not merely brief.** The constraint is on waste, not duration. (Invariant 4, amended)
5. **Structural constraints determine sycophancy resistance; conversational discipline alone cannot.** Tier 1 architectural mechanisms are unconditional; Tier 2 conversational mechanisms adapt to context. The agent cannot self-exempt from Tier 1. (ADRs 058, 059)
6. **Mechanism execution must be structurally anchored.** A specified mechanism is not a working mechanism. Three substrates: Skill-Structure Layer (step-anchored in skill text), Harness Layer (hook-verifiable at tool-call or phase boundary), or User-Tooling Layer (canonical-path artifact requirement). Mechanisms that cannot be anchored may not be specified as unconditional. (Invariant 8, ADRs 063–070)
7. **Cognitive economy on the human side is the optimization target for human-facing artifacts.** The Outcome Test ("does this produce direct human understanding without AI as workaround?") is the methodology's admissibility criterion. In-place-first is the default intervention move; bolt-on / felt-additional reads as a failure-mode signal. Methodology-wide default with four named exception conditions. (ADR-083, NEW v0.8.4)

## How the Artifacts Fit Together

**Role separation between historical record and current state (ADR-074):**

ADRs serve the historical-record role: "what was decided, when, why, what alternatives were rejected." Their value is fidelity to the moment of decision; bodies are immutable after acceptance, only the status field and supersession headers may change. `system-design.md`, `system-design.agents.md`, `ORIENTATION.md`, `domain-model.md`, and `field-guide.md` serve the current-state role: "what is the architecture today, with provenance to the decisions that produced it." Their value is currency. Supersession events trigger a mandatory downstream sweep (ADR-074 Step 3) — extended in Cycle 017 to include `system-design.agents.md`.

**Process artifacts that underpin framework operation live in `.rdd/`; product artifacts that the methodology centers for human reading live in `docs/`** *(NEW in Cycle 017 per ADR-085; migrate via `/rdd-conform migrate-to-rdd` at BUILD)*. The dotfile prefix carries the established "tooling state" semantic from `.github/`, `.config/`, `.vscode/`. Process artifacts remain corpus-visible (not gitignored as a whole) — the placement signals "framework infrastructure," not "stay out."

**Tier 1 — Entry Point (this document)**
- `ORIENTATION.md` — system overview, routes readers to depth

**Tier 2 — Primary Readables (read end-to-end)**
- `product-discovery.md` — stakeholder maps, jobs, value tensions, assumption inversions. Written in user language. The product perspective. Cycle 017 update added Zero-Prior-Familiarity Reader as a primary-axis stakeholder type and five new Value Tensions (T1–T5: initial-handoff vs ongoing-reference, outcome test vs reading-cost test, cognitive vs non-cognitive admissibility, multi-item turn bundling vs upstream decomposition, AI-as-orienter vs AI-as-prosthetic).
- `system-design.md` — module decomposition summary, dependency graph, responsibility allocation pointers. The technical perspective for first-encounter readers. **v14.0 Amendment #15: Cycle 017 split this artifact into a slim human-facing document (this file) and a companion `system-design.agents.md` per ADR-084 Pattern B.** The diagram retains its load-bearing role for human orientation; agent-context-dominant material relocates.
- `system-design.agents.md` — *(NEW in Cycle 017)* full architectural drivers table, module decomposition with detail, responsibility matrix, integration contracts, fitness criteria, test architecture, design amendment log, susceptibility-snapshot briefs. Per ADR-084 Pattern B (companion file at predictable path `<artifact>.agents.md`); additive to the primary artifact, not substitutive. Read by agents constructing context for code-construction work.
- `roadmap.md` — work packages with classified dependencies, transition states. The sequencing perspective. Cycle 017 BUILD work: `/rdd-conform migrate-to-rdd`, `/rdd-research` skill-text edit at the research → discover gate (ADR-087 §3), hook script + test-fixture path substitution, field-guide regeneration, code→doc dangling-reference graduation-check (Issue #17).

**Tier 3 — Supporting Material (consulted for provenance and depth)**
- `domain-model.md` — concepts, actions, relationships, invariants. Amendment 21 (Cycle 017 MODEL): 18 new concepts encoding readability vocabulary (forager/recipient, F-pattern, expertise reversal effect, companion file pattern, continuous documentation, adjacency-pair recipient design failure, initial-handoff/ongoing-reference, context-mismatch, multi-item turn failure mechanisms, upstream decomposition, cognitive economy, outcome test/reading-cost test, bolt-on/felt additional, right fidelity, AI-as-prosthetic/AI-as-orienter, orientation-about-orientation), 2 new actions (Apply Outcome Test, Decompose Turn Upstream), 32 new relationships, plus Zero-Prior-Familiarity Reader as a stakeholder concept. Amendment 22 (Cycle 017 DECIDE): coordinated three-touch updating Compound Check (advisory disposition per ADR-088), Three-Tier Enforcement (Harness Layer technique revision per ADR-089), and the Amendment-Log entry recording ADR-085 supersession of ADR-070.
- `essays/` — research findings (16 essays: 001–015 as before; **016 — Initial-Handoff and the Audience at the Margin**: investigates external-stakeholder corpus comprehension failure through five literature reviews; recalibrates the diagnosis to context-mismatch as the structurally fundamental mechanism with density-ordering, audience-conflation, and artifact-form mismatch as separable co-mechanisms; produces five literature-supported responses including companion files, upstream decomposition for multi-item turns, continuous documentation patterns, audience-adaptive diagrams, and context-building under cognitive economy on the human side).
- `decisions/` — ADRs (90 decisions: 001-082 as before; **083-090 Cycle 017 readability and comprehensibility** — Outcome Test as admissibility criterion, Pattern A/B catalog for agent-context placement, `.rdd/` infrastructure relocation, AI-as-orienter non-adoption pending operational criterion, validation spikes as research method with Beck-port reframe, ADR-064 amendment for v0.8.3 advisory demotion, ADR-067 Harness Layer technique revision, In-Progress Phase field role-shift). ADR-064, ADR-067, and ADR-070 carry `Updated by ADR-088 / ADR-089 / ADR-085` headers per the v13.0 supersession workflow.
- `scenarios.md` — refutable behavior specifications + preservation scenarios + Cycle Acceptance Criteria Tables (Cycle 017 additions appended: Outcome Test admissibility, Pattern A/B placement, `.rdd/` migration mechanics, AI-as-orienter non-adoption disposition, validation-spike research method, advisory-disposition compound check, Harness Layer revision, In-Progress Phase field role).
- `interaction-specs.md` — workflow-level specification of how each stakeholder works with the system. Cycle 017 additions: Zero-Prior-Familiarity Reader (new stakeholder type per ADR-083 §4 named exception condition); Solo Developer-Researcher operating Cycle 017 extensions (Outcome Test admissibility application, Pattern A/B per-artifact judgment, advisory-disposition compound check); Methodology-Maintaining AI Agent (v0.8.3 advisory-disposition operation).
- `references/field-guide.md` — maps system design modules to implementation state. Developer reference. Pairs with field notes: the guide is the map, the notes are the journal. Path-and-disposition updates from Cycle 017 deferred to BUILD regeneration.
- `essays/reflections/field-notes.md` — observational discovery records from play, categorized by feedback destination
- `essays/reflections/` — meta-observations from epistemic gate conversations (essay 016 reflections include the Beck framing as methodology counter-position and the cycle-as-instance reflection)
- `essays/research-logs/` — process records from research phases (research log 016 includes five lit-reviews plus methods review).
- `.rdd/` — *(post-Cycle-017 placement per ADR-085; migrate via `/rdd-conform migrate-to-rdd`)* infrastructure artifacts: `audits/` (susceptibility snapshots, conformance scans, argument and citation audits), `gates/` (gate reflection notes per ADR-066), `cycle-status.md` (active cycle status), `dispatch-log.jsonl` (gitignored session-scoped Tier 1 dispatch record), `.migration-version` (mode marker), `session/` (BUILD context-reconstructive mode session artifacts; `session-artifact: true` frontmatter; gitignored). Pre-migration corpora retain `docs/housekeeping/` and root-level `session/` placement; the v0.8.3 advisory disposition handles both placements during the transition window.

## Current State

**Plugin:** RDD is packaged as a Claude Code plugin (`nrgforge/rdd`) at v0.8.3 with a four-layer architecture: 15 skills (orchestration + composable family + utility), 8 specialist subagents, 7 cross-cutting hooks, and the self-referential artifact corpus. **All hooks are advisory in v0.8.3** per ADR-088 — the Stop-hook manifest check emits model-visible advisories rather than blocks across all modes. The compound check (PostToolUse dispatch log + Stop-hook cross-reference) continues to fire and surfaces missing artifacts and fabrication signals as advisories. **Skill-text anchoring (ADR-065) is the load-bearing enforcement layer**; the Harness Layer adds detection and visibility. State C is **structurally detectable** (not impossible) — the agent cannot inject hook events, so the dispatch log is reliable as a detection substrate; the practitioner is responsible for the response.

**Pipeline:** RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIZE] → GRADUATE. A conformance audit utility (`/rdd-conform`) operates outside the pipeline. **Cycle 017 adds a `/rdd-conform migrate-to-rdd` subcommand** for the `.rdd/` infrastructure relocation per ADR-085 — the methodology's existing `/rdd-conform migrate` (ADR-070) handled the pre-housekeeping → housekeeping transition; the new subcommand handles the housekeeping → `.rdd/` transition. Both migrations are opt-in; pre-migration corpora continue to operate under advisory disposition without functional degradation beyond verification mode.

**Active cycle:** Cycle 017 — Readability & Comprehensibility (Issue #17 + methodology debt from v0.8.2 / v0.8.3 hotfixes). RESEARCH ✅ (Essay 016 — Initial-Handoff and the Audience at the Margin) → DISCOVER ✅ (product-discovery update with Zero-Prior-Familiarity Reader added; five Value Tensions T1–T5) → MODEL ✅ (domain-model Amendment 21 — 18 concepts, 2 actions, 32 relationships; no invariant changes) → DECIDE ✅ (8 ADRs 083–090 accepted; supersession headers on ADR-064/067/070; domain-model Amendment 22; scenarios + Cycle Acceptance Criteria Table appended; interaction specs appended; gate reflection note written; susceptibility snapshot returned no Grounding Reframe with five feed-forward signals) → **ARCHITECT ✅** (system-design v14.0 Amendment #15 — split into slim human-facing system-design.md and companion system-design.agents.md per ADR-084 Pattern B; deferred sweeps for ADR-085 path migration and ADR-088/089 advisory-language updates discharged in both system-design files and this orientation; one new artifact module; zero new code modules) → BUILD pending.

**Completed cycles:**

- **Cycle 10 — Specification-Execution Gap in Prompt-Based Methodology.** Six work packages across three releases shipped in v0.7.0 / v0.7.1 / v0.7.2. ADRs 063-070. Essay 014. Invariant 8 added at MODEL. Domain model Amendment 17.
- **Cycle 15 — Lifecycle Composition in Build Stewardship.** Mini-cycle adding Lifecycle Composition as a third integration-risk category in build, plus cycle-shape declaration in cycle-status.md (Skipped phases, Paused fields). ADRs 071-072. Five WPs. Shipped in v0.7.3.
- **Cycle 016 — Methodology Seams.** Multi-issue batch cycle (Issues #10–#16) addressing seven open issues in a single cycle. ADRs 073-082; ten WPs (A–H) in roadmap. Domain model Amendment 19. Question-isolation entry protocol; Cycle Stack schema; non-interrupting Stop predicate; scope-adaptive enforcement; grandfathered enforcement; ADR body-immutability + supersession workflow; preservation scenarios; fitness criteria decomposition; applicability check at BUILD pattern reuse. Shipped in v0.8.x series.

**What's settled (through ADR-090):**
- Full pipeline ADRs 001-042 — gate protocol, product discovery, synthesis, orientation, roadmap, field guide, plugin architecture, play, gamemaster, adaptive gates (AID cycle), reflection time naming, self-explanation utility
- Code review utility (ADRs 043-047)
- Composable skill family (ADRs 048-054)
- Sycophancy resistance architecture (ADRs 055-062)
- Structural enforcement for Invariant 8 (ADRs 063-070, with ADR-064 / ADR-067 / ADR-070 amended by ADR-088 / ADR-089 / ADR-085 in Cycle 017)
- Lifecycle composition in build stewardship (ADRs 071-072)
- Methodology seams (ADRs 073-082)
- **Readability and comprehensibility (ADRs 083-090, NEW Cycle 017):** Outcome Test as admissibility criterion with in-place-first default and four named exception conditions; Pattern A/B catalog with directory-level audience separation rejected; `.rdd/` infrastructure relocation (partially supersedes ADR-070); AI-as-orienter non-adoption pending operational criterion; tightly-scoped prototyping as research method with Beck-port reframe and cycle-as-instance standing caveat; Stop-hook advisory across all modes (partially supersedes ADR-064 — State C structurally detectable); Three-Tier Classification's Harness Layer technique revised to advisory disposition (partially supersedes ADR-067); In-Progress Phase field role-shift to advisory-noise suppressor (post-v0.8.3)

**Paused cycle:** Cycle 8 — Pair-RDD. RESEARCH and DISCOVER complete; paused at MODEL boundary to let a key distinction marinate (corpus intersection vs. live pairing session — two design problems, not one). Full state in `docs/housekeeping/cycle-status.md` (post-migration: `.rdd/cycle-status.md`).

**Open questions (selected):**
- Five Value Tensions T1–T5 from Cycle 017 product discovery remain open as the methodology continues to operate (initial-handoff vs ongoing-reference; outcome test vs reading-cost test; cognitive vs non-cognitive admissibility; multi-item turn bundling vs upstream decomposition; AI-as-orienter vs AI-as-prosthetic).
- Outcome Test invariant-placement question (ADR-083 §6) — encoded at methodology-principle level for v1; invariant placement waits for either a structural anchor or a Harness-Layer mechanism. Future cycle scope.
- "Does RDD over-engineer?" future-cycle critique (MODEL Amendment 21 + ADR-087 §3a) — partly addressable in-cycle via tightly-scoped prototyping; broader structural-posture critique remains worth a dedicated cycle.
- Whether the cycle-as-instance reflection (ADR-087 §4) should be elevated above standing-caveat status into more formal scope-of-claim language.
- Should external review be formalized as a pipeline operation?
- Cross-project synthesis (portfolio mode) is described but not operationalized.
- Fading implementation (Invariant 6) is deferred — tracked as design debt.
- What is the systematic derivation method from stakeholder model to interaction specification? (ADR-037 open problem)
- Susceptibility signal thresholds — what constitutes "increasing" assertion density is unspecified; calibration emerges from practice across real cycles.
- The ~50% Pattern A/B threshold (ADR-084) is agent-proposed and not empirically calibrated — refinement waits for cross-corpus practice.
