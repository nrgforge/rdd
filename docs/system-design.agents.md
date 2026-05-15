# System Design (Agent Context): Pedagogical RDD

*This is the agent-context companion to [system-design.md](./system-design.md). Human-facing system overview lives in `system-design.md`; this file carries the dense reference material — architectural drivers, full module decomposition, responsibility matrix, dependency graph, integration contracts, fitness criteria, test architecture, design amendment log, and per-phase susceptibility snapshot briefs — in the form best suited to agents constructing context for code-construction work. Companion-file pattern (ADR-084 Pattern B). The split was made at Cycle 017 ARCHITECT.*

**Version:** 15.0
**Status:** Current
**Last amended:** 2026-05-14

---

## Architectural Drivers

| Driver | Type | Provenance |
|--------|------|------------|
| Every gate must require user generation, not just approval | Quality Attribute | Invariant 1, 2; ADR-001 |
| Epistemic cost must be productive, not merely brief — constraint is on waste, not duration | Constraint | Invariant 4 (Amendment 13); ADR-040 |
| Gates use Attend-Interpret-Decide cycle: read engagement signals, form hypothesis, select pedagogical move (challenge/probe/teach/clarify/re-anchor) | Quality Attribute | ADR-040; Essay 009 §§3-5 |
| User-facing gate language is "reflection time"; "epistemic gate" reserved for research/design vocabulary | Quality Attribute | ADR-041; Essay 009 §9 |
| Inversion Principle operates at gates via reframing (seventh cross-cutting location) | Quality Attribute | ADR-040; Essay 009 §7; Domain model Amendment 13 |
| Agent resists sycophantic praise at gates — builds on responses, does not evaluate with "Great insight!" | Quality Attribute | ADR-040; Essay 009 §7; Rowe (1974) |
| Each skill is self-contained (owns its gate definition) | Quality Attribute | ADR-002 |
| User responses enrich subsequent phases | Quality Attribute | Invariant 7; ADR-004 |
| Prompts reference specific artifact content, not generic questions | Quality Attribute | ADR-003 |
| Prompts use exploratory framing, not quiz framing | Quality Attribute | ADR-003 |
| Structural generation requirement never fades | Constraint | Invariant 2; ADR-005 |
| System is prompt text in markdown files | Platform Constraint | Context |
| Product discovery feeds forward into MODEL, DECIDE, ARCHITECT via artifact files | Quality Attribute | ADR-006; Essay 002 §7 |
| Forward mode (greenfield) and backward mode (existing system audit) | Functional Requirement | ADR-008 |
| Inversion principle operates as cross-cutting principle + procedural step | Quality Attribute | ADR-010 |
| Product vocabulary traces into domain model via provenance column | Quality Attribute | ADR-009 |
| Product discovery artifact written in user language (Artifact Legibility) | Quality Attribute | ADR-007; Invariant 0 |
| Three-tier artifact hierarchy: ORIENTATION.md (Tier 1 — entry point, routes readers) → product-discovery.md and system-design.md (Tier 2 — primary readables for product and technical stakeholders respectively) → domain-model.md, essays, ADRs, scenarios (Tier 3 — supporting material for provenance and depth). Amends the prior two-tier principle. | Design Principle | ADR-019; Epistemic gate conversation, ARCHITECT phase |
| Orientation document is agent-generated, user-validated (pragmatic action, not epistemic) | Quality Attribute | ADR-021; Invariant 3 |
| Orientation document contains exactly five sections, readable in under five minutes | Constraint | ADR-020; Essay 004 §3 |
| Orientation document regenerated at natural milestones: after RESEARCH (partial — sections 1, 5), after DECIDE (sections 1-3, 5), after ARCHITECT (full — scoping handoff), after BUILD (full). Partial orientation valid at any point. | Constraint | ADR-021 §3; Epistemic gate conversation |
| Synthesis phase is usually terminal, with different cost structure from gates; can re-enter RESEARCH when structural experimentation surfaces new questions | Constraint | ADR-012; ADR-029; Invariant 4 (resolved — synthesis is not a gate) |
| Synthesis conversation subsumes its epistemic gate (no separate gate section) | Quality Attribute | ADR-016; Invariant 2 |
| Outline must be an exciting springboard: non-formulaic, two-register (argumentative backbone + curatorial arrangement), pre-populated references, citation-audited, argument-audited | Quality Attribute | ADR-013; ADR-030; Essay 003 §6; Essay 006 §§6, 8 |
| Framing conversation navigates four dimensions (discovery type, narrative form, audience constraint, epistemic posture) through structural experiments, not purely discursive selection | Quality Attribute | ADR-027; ADR-028; Essay 006 §§1-7 |
| Inversion principle operates at three levels (product, cross-cutting, narrative framing) | Quality Attribute | ADR-010; ADR-017 |
| Synthesis essay serves as narrative context rollup for future sessions | Quality Attribute | ADR-015; Reflection 003 §1 |
| Roadmap as separate Tier 2 artifact linked from system-design.md, not inline Build Sequence | Design Principle | ADR-022; Essay 005 §1 |
| Field guide maps system design to implementation state as Tier 3 reference artifact | Design Principle | ADR-023; Essay 005 §3 |
| Five cascading document sizing heuristics govern artifact structure (Purpose Test → Concept Rule → Word Guideline → Read Contract → Position-Sensitive Placement) | Design Principle | ADR-024; Essay 005 §4 |
| Conformance audit detects documentation drift with two-level severity (structural blocks downstream; format is cosmetic) | Functional Requirement | ADR-025; Essay 005 §5 |
| Graduation folds RDD knowledge into native docs and archives RDD artifacts; recurring at subsystem level | Functional Requirement | ADR-025; ADR-026; Essay 005 §5 |
| Scoped cycles as first-class workflow pattern: scope → cycle → graduate | Functional Requirement | ADR-026; Product discovery update 2026-03-12 |
| RDD framed as deep work tool composable with existing workflows, not a replacement | Design Principle | ADR-026; Reflection 005 |
| Specialist work communicates through artifact files, not conversation context (artifact-mediated communication) | Design Principle | ADR-031; Essay 007 §4 |
| Specialist subagents run in isolated context with no conversation history; files are the only interface | Platform Constraint | ADR-032; Claude Code subagent spec |
| Plugin-provided agents cannot define hooks in frontmatter | Platform Constraint | ADR-033; Essay 007 §6 |
| Cross-cutting concerns enforced passively via hooks, not duplicated across skills | Quality Attribute | ADR-033; Essay 007 §3 |
| Plugin packages skills, agents, hooks, and artifact corpus as distribution unit | Platform Constraint | ADR-034; Essay 007 §5 |
| Skill namespace uses hyphen separator (`/rdd-research`, `/rdd-decide`, etc.) | Constraint | ADR-034 |
| Explicit user requests for RDD override brainstorming mandate | Quality Attribute | ADR-035; Essay 007 §7 |
| Research log archived at cycle end, not next cycle start | Quality Attribute | ADR-036 |
| Model selection per specialist task: mechanical analysis on Sonnet, exploratory spikes at parent model | Quality Attribute | ADR-032; Essay 007 §3 |
| Interaction specs derive from Product Discovery stakeholder models and complement scenarios as workflow-level specifications | Quality Attribute | ADR-037; Essay 008 §2 |
| Play itself is the epistemic act — no separate gate section (ADR-016 pattern extends) | Quality Attribute | ADR-038; ADR-016 |
| Gamemaster shapes attention, not conclusions (Invariant 3 boundary principle) | Constraint | ADR-039; Invariant 3 |
| Play bounded by felt understanding, not timebox | Constraint | ADR-038; Invariant 0, 4 |
| Field notes categorized by feedback destination, do not prescribe fixes | Quality Attribute | ADR-038 |
| Inversion Principle operates at play level (gamemaster introduces inversions to challenge interaction assumptions) | Quality Attribute | ADR-039; ADR-010 |
| Code review produces questions not findings — guides reviewer thinking without verdicts | Quality Attribute | ADR-045; Essay 010 §Agent's Role |
| Two review modes: corpus-grounded (RDD artifacts) and context-reconstructive (collaborative breadcrumb gathering) | Functional Requirement | ADR-044; Essay 010 §Two Operating Modes |
| Review integrates with build stewardship as expected per-work-package rhythm | Quality Attribute | ADR-046 |
| Question depth adapts to reviewer's available time (zone of proximal development) | Quality Attribute | ADR-045; Reflection 010 §ZPD |
| Review does not produce merge verdicts, severity ratings, or AI-authored MR comments | Constraint | ADR-045; Essay 010 §Success Criterion |
| Three-tier output: pure mechanical, observation→question, pure question | Quality Attribute | ADR-045; Reflection gate conversation |
| Success criterion: reviewer discusses changes with informed judgment without AI | Quality Attribute | ADR-043; Invariant 0 (adapted) |
| Four composable skills (build, debug, refactor, review) share Context Gathering protocol; each operates standalone or composed within build | Design Principle | ADR-048; Essay 011 §6 |
| Inversion Principle operationalized through belief-mapping questions ("what would I need to believe for the alternative to be right?"); adversarial framing deprecated as default | Quality Attribute | ADR-055; Essay 013 §7 (spike: near-zero divergence vs. 2-6× overcorrection) |
| AID cycle equipped with six research-grounded question forms as toolkit; non-formulaic requirement — forms are types composed with context, not scripts | Quality Attribute | ADR-056; Essay 013; DISCOVER feed-forward |
| AID susceptibility extension: inline observation of sycophancy signals + isolated evaluation at phase boundaries producing Susceptibility Snapshot | Quality Attribute | ADR-057; Essay 013 §5; Sayin & Khasawneh 2025 |
| Two-tier sycophancy resistance: Tier 1 unconditional architectural mechanisms (subagent audits, susceptibility snapshots, research methods review) that always fire; Tier 2 context-responsive conversational mechanisms (question form selection, constraint intensity, assertion-aware observation) calibrated by rubric | Design Principle | ADR-058; MODEL gate conversation |
| Grounding Reframe: when sycophancy risk is unassessable, agent names uncertainty and offers concrete grounding actions — not disclaim and proceed | Quality Attribute | ADR-059; MODEL gate conversation |
| Research Methods Subagent reviews research design before execution; fires before each loop after substantial revision | Quality Attribute | ADR-060; Essay 013 §6 |
| Argument Auditor extended with framing audit: surfaces alternative framings the evidence supported but the artifact didn't choose | Quality Attribute | ADR-061; Essay 013 §5 |
| Assertion-aware observation in AID: semantic detection of embedded conclusions at artifact-production moments; Tier 2 (agent exercises judgment); accepted limitation — no Architectural Isolation | Quality Attribute | ADR-062; Dubois et al. 2026 |
| Essay as checkpoint: every substantial change circles back to essay revision before pipeline advances past RESEARCH | Constraint | DECIDE gate conversation; Essay 013 §6 (sycophancy gradient) |
| Context Gathering is an embedded protocol (5 steps: detect mode, prompt, fetch, synthesize, validate); not a separate skill | Design Principle | ADR-049; Essay 011 §6 |
| Reconstructed facsimiles written as session artifacts in `session/` directory, gitignored | Quality Attribute | ADR-050; Essay 011 §2 |
| Work decomposition from available sources uses roadmap dependency classification (heuristic at ticket level) | Functional Requirement | ADR-051; Essay 011 §6 |
| AI Smell Taxonomy (novel/exacerbated/accelerated) embedded in refactor skill; novel smells as hygiene prompts, not diagnostic detection | Quality Attribute | ADR-052; Essay 011 §4 |
| Time budget mechanism: continuous spectrum, orientation validation never skipped | Quality Attribute | ADR-053; Essay 011 §8 |
| Build composes debug/refactor/review as seamless mode shifts, not dispatch; skill boundaries invisible inside build | Design Principle | ADR-054; DECIDE gate conversation |
| ADR-054 supersedes ADR-046 callout model for build→review integration | Constraint | ADR-054 |
| Mechanism execution must be structurally anchored: unconditional structural mechanisms must anchor to Skill-Structure, Harness, or User-Tooling Layer; mechanisms that cannot be anchored may not be specified as unconditional | Invariant | Invariant 8 (Cycle 10); ADR-067 (as updated by ADR-089) |
| Per-Phase Manifest (YAML) as canonical Harness Layer specification format — declares required Tier 1 mechanisms per phase with canonical paths, size floors, required headers, required fields, and audited_documents | Design Principle | ADR-063; Essay 014 §6; Spike S2 |
| Compound check (PostToolUse dispatch log + Stop manifest cross-reference) makes State C **structurally detectable** (not impossible) — fabrication requires inducing a fake PostToolUse event, which the agent cannot do; detection surfaces as model-visible advisory; practitioner is responsible for the response | Quality Attribute | ADR-064 (as updated by ADR-088); Essay 014 §6; Spike S1 |
| Skill-Structure Layer is primary for step-anchorable mechanisms (cheaper than hooks, available immediately via skill text edit); load-bearing enforcement layer in v0.8.3; Harness Layer adds visibility and detection | Design Principle | ADR-065; ADR-088; Essay 014 §5 |
| Canonical dispatch prompt skeleton with literal `Output path:` line is the skill-hook contract; PostToolUse hook extracts the path via regex | Constraint | ADR-065; Spike S1 |
| Every Tier 1 dispatch site must be at a structurally privileged position (top third or bottom third of skill file), not in the "lost in the middle" zone | Constraint | ADR-065; Spike S4; Liu et al. 2023; Guo & Vosoughi 2025 |
| User-Tooling Layer graduates conversational mechanisms by requiring canonical-path artifacts — first migration: AID gate reflection note | Design Principle | ADR-066; Essay 014 §7 |
| Compound defense at phase boundaries is the set of mechanisms that fire at the phase-boundary interstitial moment where course correction is structurally possible; currently three components (manifest check, susceptibility snapshot, belief-mapping) covering non-overlapping failure modes (structural floor, content ceiling, pre-artifact zone) | Design Principle | ADR-066; MODEL gate 2026-04-08; ARCHITECT gate 2026-04-09 |
| Reframe-derailed gate limitation is load-bearing: User-Tooling Layer manifest check provides floor enforcement, not ceiling verification | Constraint | ADR-066; MODEL pre-mortem 2026-04-08 |
| Three-Tier Enforcement Classification is the methodology-level taxonomy for unconditional structural mechanisms; four-step decision procedure routes proposals to substrate; Harness Layer's enforcement technique is two hooks operating in advisory disposition (PostToolUse dispatch log + Stop-hook cross-reference surfacing missing artifacts and fabrication signals as model-visible advisories) | Design Principle | ADR-067 (as updated by ADR-089); Invariant 8 |
| Substrates are not a priority hierarchy — each substrate is primary in its domain; mechanisms may legitimately use more than one substrate simultaneously | Design Principle | ADR-067; MODEL settled premise 4 |
| Grounding Reframe fires on two triggers: unassessable sycophancy risk (ADR-059) AND significant susceptibility snapshot finding with in-cycle course-correction implications (three significance properties: specificity, actionability, in-cycle applicability) | Quality Attribute | ADR-068; DISCOVER Commitment 5 |
| Snapshot findings drive in-cycle course correction at their own boundary, not feed-forward to subsequent phases (when findings meet significance properties) | Design Principle | ADR-068; DISCOVER settled premise 4 |
| Methodology scope-of-claim: competence without independent second-order critique — agent does not independently generate second-order critique; guarantee rests on Tier 1 mechanisms firing, not on agent's independent judgment; **compound check's structural guarantee applies in advisory mode after v0.8.3 — finding surfaces as model-visible advisory rather than block; pre-migration corpora operate without harness-layer compound verification** | Design Principle | ADR-069; ADR-088; Essay 014; cross-phase observation |
| Centered-vs-infrastructure framing distinguishes what the methodology centers for user reading (essays, ADRs, domain model, product discovery, system design, roadmap, field guide, ORIENTATION) from what underpins framework operation (dispatch log, audit reports, cycle-status, gate reflection notes) | Design Principle | ADR-064; DECIDE gate 2026-04-08/09 |
| Process artifacts live in `.rdd/` (post-ADR-085 migration); product artifacts live in `docs/`. The dotfile prefix signals "tooling state" / "framework infrastructure" structurally, distinct from content-axis audience separation (ADR-084 rejects directory-level audience separation) | Design Principle | ADR-085 (partially supersedes ADR-070); DISCOVER gate 2026-04-27 |
| Advisory mode is the disposition across all modes for the Stop-hook manifest check; advisory mode in pre-migration corpora additionally lacks the dispatch-log compound check; advisory mode respects user choice to defer migration | Quality Attribute | ADR-064 (as updated by ADR-088); ADR-070; ADR-085 |
| Fails-Safe-to-Allow on hook internal errors, with stderr GitHub issue surfacing that respects user-as-non-maintainer position (non-blocking, ignorable, actionable) | Quality Attribute | ADR-064; research-phase Commitment 1 |
| Revision-aware re-audit reminder (non-blocking mtime comparison; substantiality judgment is human, not mechanical) | Quality Attribute | ADR-064; Invariant 4 Amendment |
| Provenance via architectural drivers is the primary attribution mechanism; provenance check subsections are used selectively when ADRs carry non-driver content | Design Principle | ADR-069; FC-C refinement at DECIDE gate 2026-04-09 |
| Plugin updates degrade gracefully for pre-migration corpora — `/rdd-conform migrate` and `/rdd-conform migrate-to-rdd` are opt-in, not required; cycles complete normally in advisory mode without harness-layer verification | UX Commitment | ADR-064; ADR-070; ADR-085; DECIDE gate 2026-04-08 |
| `/rdd-conform` scope extended with new audits: housekeeping directory organization (legacy scope), gate reflection note template alignment, dispatch prompt format, `.rdd/` directory organization (Cycle 017 scope) | Functional Requirement | ADR-070; ADR-085; ADR-064; ADR-066; ADR-065 |
| Layered Enforcement Adoption (renamed from "methodology graduation (small-d)") is the move: replace prose-only specifications with structurally anchored mechanisms where the substrate fits | Design Principle | Essay 014; MODEL domain model Amendment #17 |
| Acceptance criteria specify the layer at which they are satisfied; scenario-level coverage does not imply criterion-level coverage | Quality Attribute | ADR-073; Issue #11; Essay 015 §2 (DO-178C HLR/LLR distinction) |
| ADR bodies are immutable after acceptance; status field is mutable; supersession follows IETF-style Updates/Obsoletes split with mandatory downstream-artifact sweep | Design Principle | ADR-074; Issue #12; Essay 015 §3 |
| Behavior scenarios specify what features should do; preservation scenarios specify what they should not change. Both are produced at DECIDE | Functional Requirement | ADR-075; Issue #13; Essay 015 §4 (Einstellung effect) |
| Qualitative claims about modules ("transparent", "backward-compatible") must be decomposed into testable fitness properties before the ARCHITECT gate passes | Functional Requirement | ADR-076; Issue #13; Essay 015 §4 |
| Pattern reuse at BUILD triggers a stewardship checkpoint with four prompts including consultation of system-design.md fitness properties (integrated structural defense per ADR-076 + ADR-077 prompt 4) | Functional Requirement | ADR-077; Issue #13; Essay 015 §4 (Einstellung + Gentner schema-comparison) |
| cycle-status.md represents a stack of cycle entries (Cycle Stack), with the active entry at the top; coupling semantics declared per-entry as pause-parent (default) or continue-parent (explicit, with required rationale field) | Functional Requirement | ADR-078; Issue #14; Essay 015 §5 (Temporal Parent Close Policy, Harel statecharts); Cycle 015 BUILD-gate framing |
| Stop hook is non-interrupting during in-progress AID gate conversations; the in-progress gate field on the top entry relaxes only the gate-reflection-note check, not other source-phase checks | Functional Requirement | ADR-079; Issue #14; Essay 015 §5 (BPMN non-interrupting boundary events) |
| Manifest entries gain optional applicable_when blocks evaluated against the active cycle's per-entry fields; precondition composition replaces a separate enforcement tier for scope-adaptive enforcement | Design Principle | ADR-080; Issue #14; Essay 015 §5 (Liquibase preconditions, OPA/Rego); design-judgment caveat preserved |
| Pre-ADR-072 cycles continue under grandfathered advisory mode until explicitly migrated via /rdd-conform cycle-shape audit; archive-to-active transitions get the same treatment | Design Principle | ADR-081; Issue #14; Essay 015 §5 (Microsoft Dynamics 365, Atlassian Connect grandfathered-rule pattern) |
| Research-entry follows a 5-step question-isolation protocol (articulate questions → constraint-removal response → research-methods-reviewer dispatch → revise/accept → research loop); classified as first-line structural with cognitive component (Skill-Structure Layer per ADR-067) | Functional Requirement | ADR-082; Issue #16; Essay 015 §6 (selective accessibility, anchoring-and-adjustment, pre-registration); reclassification at DECIDE gate |
| Question Toolkit gains a seventh form (constraint-removal) primary at research entry; the existing six forms remain available unchanged | Functional Requirement | ADR-082; ADR-055 (toolkit substrate) |
| **Cognitive-Economy Criterion (Outcome Test) is the methodology's admissibility criterion for human-facing artifacts**: outcome-coded ("does this produce direct human understanding without AI as workaround?"), not reading-cost-coded; in-place-first as default intervention move; bolt-on / felt-additional as failure-mode signal; methodology-wide default with four named exception conditions (audience asymmetry, content-divergence threshold, post-graduation lifecycle position, zero-prior-familiarity reader cohort); felt by practitioner, not mechanically computable; encoded at methodology-principle level with invariant placement held open | Design Principle | ADR-083; Issue #17; Essay 016 §4.5; DISCOVER gate 2026-04-27 |
| **Agent-Context Content Placement uses two patterns**: Pattern A (audience-tagged sections within existing artifact) below ~50% audience-tagged volume; Pattern B (companion file at predictable path `<artifact>.agents.md`) above; directory-level audience separation rejected; ~50% threshold is agent-proposed and not empirically calibrated, treat as starting point not precision rule; companion files are additive not substitutive | Design Principle | ADR-084; Issue #17; Essay 016 §4.1; literature on Diátaxis, DITA, Information Mapping, llms.txt, AGENTS.md |
| **`.rdd/` directory holds process artifacts** (audits, gates, cycle-status, dispatch log, migration marker, session/) — process-vs-product separation via dotfile convention; corpus-visible, not hidden; ADR-085 partially supersedes ADR-070 (`.rdd/` placement); migration via `/rdd-conform migrate-to-rdd` subcommand at BUILD; dotfile prefix carries established "tooling state" semantic from `.github/`, `.config/`, `.vscode/` precedents | Design Principle | ADR-085; Issue #17; DISCOVER gate 2026-04-27 |
| **AI-as-orienter is non-adopted pending operational criterion** distinguishing it from AI-as-prosthetic in observable behavior (not only stated intent); usage drift is gradual and self-reinforcing; conceptual distinction genuine but operationally fragile; default position holds — corpus directly readable, agent assists pragmatic work; AID-gate bounded agent-mediated dialogue exempt from non-adoption | Design Principle | ADR-086; Issue #17; Essay 016 §4.5 |
| **Tightly-scoped prototyping is a research method** alongside lit-review, literature search, and research-methods review — used to ground research in actual interaction and as counterforce against possibility-space explosion; trigger question is felt (interaction-grounding rationale OR possibility-space-pruning rationale); decision moment at research → discover gate; rejection-with-rationale or run-with-documentation; skill-text edit at gate ships at BUILD; Beck-port framing calibrated as useful conceptual frame but not load-bearing structural evidence; cycle-as-instance reflection encoded as standing caveat on research-phase outputs | Functional Requirement | ADR-087; Issue #17; Reflection 016; RESEARCH-phase Grounding Reframe Target 2 |
| **Stop-hook manifest check is advisory across all modes** (post-v0.8.3): emits model-visible advisory naming each failing mechanism; does not block; advisory repeats on every Stop event until artifact appears or `**In-progress phase:**` field is set; State-C claim shifted from "structurally impossible" to "structurally detectable"; skill-text discipline (ADR-065) is the load-bearing enforcement layer | Design Principle | ADR-088 (partially supersedes ADR-064); Pause 2 diagnosis |
| **Three-Tier Enforcement Classification's Harness Layer technique amended to advisory disposition**: two hooks operating in advisory disposition (PostToolUse dispatch log as structural-detection substrate; Stop-hook cross-reference surfacing missing artifacts and fabrication signals as model-visible advisories); substrate primacy preserved; "structural defense" framing preserved (the structural argument unchanged: fake hook events cannot be injected); detection-vs-prevention distinction is the load-bearing change | Design Principle | ADR-089 (partially supersedes ADR-067); v0.8.3 implementation |
| **In-Progress Phase field is advisory-noise suppressor**, not load-bearing predicate (post-v0.8.3): when present and matching the current phase, Stop hook suppresses per-phase manifest advisory; field's absence produces noisier but functionally-correct cycle progression; field is optional, not correctness-critical; orchestrator sets at phase entry, removes at phase-exit readiness; conformance-audit posture is soft note for missing field | Quality Attribute | ADR-090; Pause 2 diagnosis |

## Module Decomposition

### Module: Orchestrator (`skills/rdd/SKILL.md`) — AMENDED in v12.0, v13.0, v14.0
**Purpose:** Defines the pipeline sequence, adaptive gate protocol (Attend-Interpret-Decide cycle), three-tier artifact hierarchy, cross-cutting principles including Invariant 8's anchoring requirement and Three-Tier Enforcement Classification, methodology scope-of-claim, scoped cycle workflow pattern, Cognitive-Economy Criterion, Companion-File Pattern catalog, and ensures no phase transition consists solely of approval.
**Provenance:** ADR-001 through ADR-005 (gate pattern); ADR-006 (PRODUCT DISCOVERY); ADR-010 (inversion principle); ADR-019 (three-tier hierarchy); ADR-022, ADR-023 (roadmap, field guide); ADR-024 (sizing heuristics); ADR-026 (scoped cycles); ADR-031, ADR-032 (artifact-mediated communication, agent dispatch); ADR-034 (plugin packaging); ADR-037 (interaction specs); ADR-038 (PLAY in pipeline); ADR-040, ADR-041 (AID cycle, reflection time); ADR-066 (gate reflection note production); ADR-067 (Three-Tier Enforcement Classification — Harness Layer technique amended per ADR-089); ADR-068 (Grounding Reframe Extension); ADR-069 (Methodology Scope-of-Claim); ADR-074 (supersession workflow); ADR-078 (Cycle Stack); ADR-079 (in-progress-gate field); ADR-082 (constraint-removal at research entry); ADR-083 (Cognitive-Economy Criterion as cross-cutting principle); ADR-084 (Pattern A/B catalog as cross-cutting); ADR-085 (`.rdd/` placement); ADR-090 (in-progress-phase field role-shift)
**Owns:** Adaptive gate protocol (AID with five pedagogical moves; cross-gate engagement awareness; susceptibility signals + question toolkit + assertion-aware observation; gate reflection note artifact production at canonical path), pipeline sequence (including PRODUCT DISCOVERY and optional PLAY), state tracking, feed-forward instruction, cross-cutting principles (inversion principle + belief-mapping; two-tier sycophancy resistance; Grounding Reframe extended with three significance properties; document sizing heuristics; artifact-mediated communication; anti-sycophancy at gates; essay-as-checkpoint; **Invariant 8 + Three-Tier Enforcement Classification with four-step decision procedure (Harness Layer in advisory disposition per ADR-089); centered-vs-infrastructure framing per ADR-064; methodology scope-of-claim per ADR-069 (negative-scope items: no independent second-order critique; advisory-mode disposition for compound check); Cognitive-Economy Criterion (Outcome Test) per ADR-083 with in-place-first default and four named exception conditions; Companion-File Pattern catalog per ADR-084 (Pattern A/B) with directory-level audience separation rejected; `.rdd/` infrastructure placement per ADR-085**), Available Skills table, Artifacts Summary, three-tier artifact hierarchy principle, orientation document regeneration instruction, scoped cycle workflow pattern, agent dispatch protocol (eight specialist subagents; canonical skeleton with `Output path:` line), in-progress-gate field set/clear lifecycle, in-progress-phase field set/clear lifecycle (per ADR-090, advisory-noise suppression role), constraint-removal as Question Toolkit form #7 primary at research entry
**Depends on:** None (top-level coordinator)
**Depended on by:** All phase skills; all hooks (supplement cross-cutting principles via passive event-driven reminders + advisory verification)
**Note:** Orchestrator's cross-cutting principles are additionally enforced by hooks. The orchestrator dispatches the orientation-writer agent at milestones rather than generating ORIENTATION.md inline. **Cycle 10 amendment:** orchestrator no longer inlines the susceptibility-snapshot dispatch in Stage Gates protocol; dispatch anchored at each phase skill's phase-end position (ADR-065 Fix 1). **Cycle 017 amendment:** the Cognitive-Economy Criterion and Companion-File Pattern catalog become cross-cutting principles the orchestrator carries; the in-progress-phase field's role is advisory-noise suppression (per ADR-090), not load-bearing predicate.

### Module: Research Skill (`skills/research/SKILL.md`) — AMENDED in v12.0, v13.0, v14.0, v15.0
**Purpose:** Runs an iterative research loop and produces a citation-audited, argument-audited, and framing-audited research artifact, with the artifact as checkpoint — every substantial change circles back to artifact revision before the pipeline advances. v14.0 adds optional validation-spike step at the research → discover gate (ADR-087 §3). **v15.0 (ADR-092):** the research artifact form is **Essay-Outline** — four sections (Abstract Section / Argument-Graph / Citation-Embedded Outline / References) under Pyramid Refinement compliance; produced under Outline-Production Discipline (Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves). Legacy prose essays produced before ADR-092 remain at their existing paths under their existing names; the form change applies to artifacts produced after ADR-092 ships.
**Provenance:** ADR-002, ADR-003 (gate); ADR-032 (agent dispatch); ADR-036 (research log archival); ADR-060 (Research Methods Subagent); ADR-061 (framing audit); ADR-065 (canonical prompt skeleton + position audit + per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); ADR-082 (5-step question-isolation entry protocol; constraint-removal Question Toolkit form); ADR-087 (validation spike as research method); ADR-092 (Essay-Outline form; Pyramid Refinement structural property; Outline-Coherence Signal stewardship); Essay 001 §6; Essay 013 §6; Essay 014 §5; Essay 017 (Outlines as Research Artifacts)
**Owns:** Research-phase process, epistemic gate prompts, research-artifact presentation step, research log archival at cycle end, **artifact-as-checkpoint enforcement**, **5-step question-isolation entry protocol** (ADR-082): (1) user articulates research questions as research log's first content; (2) constraint-removal prompt against most consequential existing artifact, user responds; (3) research-methods-reviewer dispatch; (4) revise or accept reviewer findings; (5) research loop begins. **Per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: .rdd/audits/susceptibility-snapshot-{cycle}-research.md`), **gate reflection note production** at phase-end per ADR-066 (`.rdd/gates/{cycle}-research-to-discover.md`). **Validation-spike decision step at research → discover gate** (ADR-087 §3 — v14.0): trigger question (felt, not mechanical) — is the cycle at risk of producing speculative claims downstream phases will over-elaborate, where a tangible answer from a focused prototype would prune the possibility space directly? would interaction-grounding surface real additional questions or directions that lit-review and methods alone cannot reach? — practitioner decides prototype-or-no-prototype with rationale recorded in research log; rejection rationale visible (not silent); prototype design + findings + artifact updates documented if run. **v15.0 — Essay-Outline production (ADR-092):** writes Essay-Outline to `./docs/essays/essay-outline-NNN-<slug>.md` in four sections per ADR-092 §1; Argument-Graph in structured-bullet hierarchy with named identifiers (`C1`, `W1.1`, `E1.1.1`, ...) per §4; Citation-Embedded Outline body subsections MUST anchor to one or more Argument-Graph node identifiers via parenthetical at end of section heading (or to reserved `META` identifier for deliberately non-developmental content); Outline-Production Discipline encoded as production requirements (§5). **v15.0 — Outline-Coherence Signal stewardship (ADR-092 §6):** when the argument-audit reports P1 expansion-fidelity violations on an Essay-Outline, the skill applies the discrimination test — Boundary 1 (Abstract → Argument-Graph) failure routes to scope-suspect (consider splitting the cycle); Boundary 2 (Argument-Graph → Citation-Embedded Outline) failure routes to discipline-suspect (re-run production with discipline tightening). The signal is a stewardship trigger; the practitioner decides.
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (post-artifact dispatch via canonical skeleton); Argument Auditor Agent (post-citation-audit, includes framing audit; v15.0: dispatched on Essay-Outline genre per ADR-093); Lit Reviewer Agent (user-selected method); Spike Runner Agent (user-selected method, also used for validation spikes per ADR-087); Research Methods Subagent (pre-loop dispatch — extended 4-criterion scope per ADR-082); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (produces research artifact — Essay-Outline post-ADR-092; legacy prose essays pre-ADR-092 — consumed by Product Discovery Skill and Model Skill via file)
**Cycle 17 note:** The validation-spike step is text-anchored at the research → discover gate per ADR-087 §3. Optional, not unconditional (Invariant 8 anchoring rationale: trigger question is felt, judgment-applied; mandating spikes would convert optional-step encoding into ceremonial-compliance ritual). Output path for any spike artifacts: `./scratch/spike-*/` (existing pattern from spike-runner) plus research log entry.
**Cycle 18 note (v15.0):** The Essay-Outline form change is RESEARCH-scoped. SYNTHESIZE's existing outline-then-user-writes-prose pattern is unchanged. Reflections and synthesis essays retain narrative prose form per ADR-092 §8. The four-section Essay-Outline filename pattern (`essay-outline-NNN-*.md`) distinguishes the new form from legacy prose essays (`NNN-*.md`).

### Module: Product Discovery Skill (`skills/discover/SKILL.md`) — AMENDED in v12.0, v14.0
**Purpose:** Surfaces user needs, stakeholder maps, value tensions, and assumption inversions, producing a product discovery artifact in user language that feeds forward into MODEL, DECIDE, ARCHITECT, and PLAY.
**Provenance:** ADR-006 through ADR-011 (phase, structure, modes, inversion); ADR-038 (play feedback re-enters in update mode); ADR-065 (per-phase susceptibility snapshot); ADR-066 (gate reflection note); Invariant 0, Invariant 8
**Owns:** Product discovery process (forward, backward, update modes), five-section artifact template (Stakeholder Map, Jobs/Mental Models, Value Tensions, Assumption Inversions, Product Vocabulary Table), assumption inversion procedural step, product debt table, epistemic gate prompts, **per-phase susceptibility snapshot dispatch** at phase-end (canonical skeleton with `Output path: .rdd/audits/susceptibility-snapshot-{cycle}-discover.md`), **gate reflection note production** at phase-end (`.rdd/gates/{cycle}-discover-to-model.md`)
**Depends on:** Orchestrator (protocol); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (artifact consumed by Model, Decide, Architect, Play Skills via file)

### Module: Model Skill (`skills/model/SKILL.md`) — AMENDED in v12.0, v14.0
**Purpose:** Extracts domain vocabulary from essay and product discovery artifact, with Product Origin provenance column and an epistemic gate tailored to domain model artifacts.
**Provenance:** ADR-002, ADR-003 (gate); ADR-009 (Product Origin); ADR-065 (per-phase susceptibility snapshot); ADR-066 (gate reflection note); Essay 001 §6; Invariant 8
**Owns:** Model-phase process, Product Origin column, epistemic gate prompts, domain model presentation step, **per-phase susceptibility snapshot dispatch** at phase-end (`Output path: .rdd/audits/susceptibility-snapshot-{cycle}-model.md`), **gate reflection note production** (`.rdd/gates/{cycle}-model-to-decide.md`), invariant amendment + backward propagation sweep
**Depends on:** Orchestrator (protocol); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (artifact consumed by Decide Skill via file)

### Module: Decide Skill (`skills/decide/SKILL.md`) — AMENDED in v12.0, v13.0, v14.0
**Purpose:** Produces ADRs, behavior + preservation scenarios, Cycle Acceptance Criteria Table, and interaction specifications with product context alongside technical context, including inversion principle check on ADR assumptions, ADR supersession workflow with downstream sweep, with an epistemic gate tailored to ADR artifacts.
**Provenance:** ADR-002, ADR-003 (gate); ADR-010 (inversion); ADR-032 (agent dispatch); ADR-037 (interaction specs); ADR-065 (canonical skeleton; per-phase susceptibility snapshot); ADR-066 (gate reflection note); ADR-067 (Three-Tier Classification — applies decision procedure when ADRs propose new Tier 1 mechanisms); ADR-073 (Cycle Acceptance Criteria Table); ADR-074 (supersession workflow); ADR-075 (preservation scenarios); ADR-083 (cognitive-economy criterion application — when an ADR proposes a candidate human-facing artifact, the Outcome Test applies); Essay 001 §6; Essay 008 §2; Invariant 8
**Owns:** Decide-phase process, inversion principle check, epistemic gate prompts, ADR/scenario presentation step, **Cycle Acceptance Criteria Table production** at Step 4 (four-column table for emergent/aggregate criteria; one-line judgment-note for atomic-only cycles), **Preservation Scenarios** alongside behavior scenarios at Step 4 (`### Preservation:` blocks for features touching existing call paths; null-coverage judgment-note when wholly isolated), **ADR Supersession Workflow** (body-immutable / status-mutable rules; supersession-header / update-header writers; mandatory downstream-artifact sweep across system-design.md, system-design.agents.md, ORIENTATION.md, domain-model.md, field-guide.md; drift decision tree), interaction specification production, **per-phase susceptibility snapshot dispatch** at phase-end (`Output path: .rdd/audits/susceptibility-snapshot-{cycle}-decide.md`), **gate reflection note production** (`.rdd/gates/{cycle}-decide-to-architect.md`), **Three-Tier Classification application** when ADRs propose new unconditional structural mechanisms
**Depends on:** Orchestrator (protocol); Argument Auditor Agent (post-ADRs, includes framing audit); Conformance Scanner Agent (Step 3.5); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (ADR + scenario + interaction spec artifacts consumed by Architect Skill and Play Skill via file)
**Cycle 17 note:** v14.0's downstream sweep targets now include `system-design.agents.md` (the new companion file). When an ADR is superseded, citations in both `system-design.md` and `system-design.agents.md` are updated.

### Module: Architect Skill (`skills/architect/SKILL.md`) — AMENDED in v12.0, v13.0, v14.0
**Purpose:** Decomposes the system into modules with provenance chains extending to user needs, including inversion principle check on module boundaries and per-artifact Pattern A/B judgment for agent-context placement, with an epistemic gate tailored to system design artifacts; generates roadmap as separate artifact; gates qualitative-claim decomposition into testable fitness properties.
**Provenance:** ADR-002, ADR-003 (gate); ADR-010 (inversion); ADR-022 (roadmap); ADR-065 (per-phase susceptibility snapshot); ADR-066 (gate reflection note); ADR-076 (fitness criteria decomposition gate check); ADR-084 (per-artifact Pattern A/B judgment when restructuring agent-context placement); Essay 001 §6; Essay 002 §7.3; Essay 005 §1; Essay 016 §6 (Cycle 017 ARCHITECT inputs); Invariant 8
**Owns:** Architect-phase process, inversion principle check, extended provenance chains (Module → Domain Concept → ADR → Product Discovery), epistemic gate prompts, system design presentation step, **system-design / system-design.agents companion-file structure decision** (per-artifact Pattern A/B judgment per ADR-084 — applied at restructuring decision point), roadmap generation, **Fitness Criteria Decomposition gate check** (refuses advance when qualitative claims in `system-design.md` or `system-design.agents.md` lack adjacent `**Fitness:**` properties), **per-phase susceptibility snapshot dispatch** at phase-end (`Output path: .rdd/audits/susceptibility-snapshot-{cycle}-architect.md`), **gate reflection note production** (`.rdd/gates/{cycle}-architect-to-build.md`)
**Depends on:** Orchestrator (protocol); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (system design and roadmap artifacts consumed by Build Skill via file)
**Cycle 17 note:** Per ADR-084, when ARCHITECT restructures `system-design.md`, the per-artifact judgment criterion is applied: estimate audience-tagged volume relative to human-facing baseline; below ~50% indicator → Pattern A; above → Pattern B. The judgment is recorded in the restructuring decision (this design's Cycle 017 amendment is the canonical exemplar — Pattern B applied because the agent-context volume substantially exceeded the threshold).

### Module: Build Skill (`skills/build/SKILL.md`) — AMENDED in v10.0, v12.0, v13.0
**Purpose:** Outer loop of the composable skill family: work decomposition, TDD (red → green → refactor), stewardship checkpoints, integration verification, with seamless mode shifts to debug/refactor/review; operates in pipeline mode or context-reconstructive mode.
**Provenance:** ADR-002 (gate); ADR-048 (composable family); ADR-049 (Context Gathering); ADR-050 (session artifacts); ADR-051 (work decomposition); ADR-053 (time budget); ADR-054 (mode-shift composition); ADR-023 (field guide); ADR-073 (Cycle Acceptance Criteria Table verification at Step 5.5); ADR-077 (applicability check at pattern reuse); Essay 011 §§5-6
**Owns:** Context Gathering protocol (build adaptation), mode detection, time budget prompt, work decomposition from available sources, session artifact writing (to `.rdd/session/` per ADR-085), TDD outer loop, stewardship checkpoints, integration verification (real types, not stubs), mode-shift triggers, field guide generation, epistemic gate prompts, **Step 5.5 Cycle Criterion Verification** (verifies each Acceptance Criteria Table entry at specified layer), **Applicability Check stewardship-checkpoint** (operative trigger: developer's or agent's explicit reference to existing pattern as template; four-prompt form including prompt 4 consulting `system-design.md` / `system-design.agents.md` fitness properties; Grounding Reframe when prompts cannot be answered substantively)
**Depends on:** Orchestrator (protocol); Debug Skill, Refactor Skill, Review Skill (mode-shift targets — context inheritance, not dispatch)
**Depended on by:** None
**Cycle 17 note:** Build's session artifacts now write to `.rdd/session/` post-ADR-085 migration (was `session/` at repo root). Field guide regeneration at BUILD completion includes any path/disposition updates from Cycle 017 deferred sweeps (ADR-085, ADR-088, ADR-089).

### Module: Debug Skill (`skills/debug/SKILL.md`) — NEW in v10.0
**Purpose:** Guides hypothesis-trace-understand-fix debugging cycle, naming what the mental model was wrong about before fixing, with a test encoding the corrected understanding.
**Provenance:** ADR-048; ADR-049; ADR-053; Essay 011 §§3, 6
**Owns:** Context Gathering protocol (debug adaptation), hypothesis-trace-understand-fix cycle, time budget adaptation
**Depends on:** Orchestrator (available skill listing)
**Depended on by:** Build Skill (mode-shift target for unexpected failures)

### Module: Refactor Skill (`skills/refactor/SKILL.md`) — NEW in v10.0
**Purpose:** Drives the Three-Level Refactor diagnostic-remediation cycle (smells → patterns → methodology) with embedded AI Smell Taxonomy awareness and AI hygiene prompts, producing structure-only changes committed as `refactor:`.
**Provenance:** ADR-048; ADR-049; ADR-052; ADR-053; Essay 011 §§4-5
**Owns:** Context Gathering protocol (refactor adaptation), Three-Level Refactor cycle: level 1 Smells (classical Fowler + AI-exacerbated catalog), level 2 Patterns (technique selection with inverse-pair awareness), level 3 Methodology (architectural intent check), AI hygiene prompts (Constraint Decay, Slopsquatting, Intent Debt), time budget adaptation, audit finding consumption
**Depends on:** Orchestrator (available skill listing)
**Depended on by:** Build Skill (mode-shift target after green and at stewardship)

### Module: Play Skill (`skills/play/SKILL.md`) — NEW in v7.0, AMENDED in v12.0
**Purpose:** Facilitates post-build experiential discovery through stakeholder inhabitation, with the orchestrating agent serving as gamemaster, producing field notes categorized by feedback destination.
**Provenance:** ADR-038; ADR-039; ADR-016 principle; ADR-010; Invariant 0; Essay 008
**Owns:** Play-phase process (three movements: inhabit → explore → reflect), gamemaster behavior, Stanislavski inhabitation structure, field notes production (six categories: missing scenario, usability friction, new question, challenged assumption, delight, interaction gap), cross-cutting reflection, felt-understanding bounding, epistemic distance mitigation, **per-phase susceptibility snapshot dispatch** at phase-end (`Output path: .rdd/audits/susceptibility-snapshot-{cycle}-play.md`), **gate reflection note production** (`.rdd/gates/{cycle}-play-to-synthesize.md`)
**Depends on:** Orchestrator (protocol); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (field notes artifact consumed by Discover, Synthesis Skills, and subsequent cycles via file)
**Note:** Gamemaster is a mode of the Orchestrating Agent (ADR-039), not a separate Specialist Subagent. Play subsumes its epistemic gate (ADR-016 pattern) but still produces a snapshot and reflection note (ADR-065 Fix 1; ADR-066 with reflection-note adapted to inhabit-explore-reflect structure).

### Module: Synthesis Skill (`skills/synthesize/SKILL.md`) — AMENDED in v12.0
**Purpose:** Mines the artifact trail (including field notes from play when available) for novelty signals, conducts a structured conversation (journey review, novelty surfacing, framing with four-dimension navigation via structural experiments) to help the writer find their story, and produces a two-register outline as springboard for the synthesis essay.
**Provenance:** ADR-012 through ADR-018, ADR-027 through ADR-030 (synthesis structure); ADR-032 (agent dispatch); ADR-065 (canonical skeleton; per-phase susceptibility snapshot); ADR-066 (gate reflection note); Essay 003; Essay 006; Invariant 0
**Owns:** Synthesis-phase process, artifact trail mining, novelty signal detection, three-phase conversation, four-dimension framing model, structural experiment mechanism, worth-the-calories quality tests, two-register outline production, pre-populated references, cross-project conversational prompting (Level 1), narrative inversion lenses, re-entry decision logic, **per-phase susceptibility snapshot dispatch** at phase-end (`Output path: .rdd/audits/susceptibility-snapshot-{cycle}-synthesize.md`), **gate reflection note production** (`.rdd/gates/{cycle}-synthesize-to-end.md`)
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (outline finalization); Argument Auditor Agent (post-citation-audit, includes framing audit); Susceptibility Snapshot Evaluator Agent (phase-end)
**Depended on by:** None directly (usually terminal; conditional re-entry to Research)

### Module: Conformance Audit Skill (`skills/conform/SKILL.md`) — AMENDED in v12.0, v13.0, v14.0
**Purpose:** Scans artifact corpus against current skill version, producing gap analysis with prioritized remediation, drift detection against implementation, graduation into native project docs, housekeeping migration (`migrate`), `.rdd/` migration (v14.0: `migrate-to-rdd`), cycle-shape audit, and audits with new scopes.
**Provenance:** ADR-025 (four operations); ADR-026 (graduation); ADR-032 (agent dispatch); ADR-070 (`/rdd-conform migrate` subcommand + three audit scopes — partially superseded by ADR-085 path migration); ADR-081 (cycle-shape audit); ADR-085 (`/rdd-conform migrate-to-rdd` subcommand for `.rdd/` migration); Essay 005 §5; Essay 014 (centered-vs-infrastructure framing)
**Owns:** Audit template conformance process, remediation, graduation process, conformance report production, **`/rdd-conform migrate` subcommand** (legacy housekeeping migration; idempotent via marker; uncommitted-changes refusal; mechanical reference substitution; rollback manifest), **`/rdd-conform migrate-to-rdd` subcommand** (Cycle 017 / v14.0 — relocates `.rdd/` → `.rdd/` per ADR-085 §4: idempotency check via `.rdd/.migration-version` matching plugin version; create `.rdd/` + subdirs; move `audits/`, `gates/`, `cycle-status.md`, `dispatch-log.jsonl`, `.migration-version`; move `session/` → `.rdd/session/` if present; mechanical reference substitution across `docs/decisions/*.md`, `docs/essays/*.md`, `skills/**/SKILL.md`, `hooks/manifests/tier1-phase-manifest.yaml`, `hooks/scripts/*.sh`, `hooks/tests/**/*.sh`, `docs/domain-model.md`, `docs/ORIENTATION.md`, `docs/system-design.md`, `docs/system-design.agents.md`; **hook test fixtures explicitly included** — `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh`; `.gitignore` updates; write `.rdd/.migration-version` with plugin version; summary report), **cycle-shape audit operation** (legacy single-entry detection + Cycle Stack migration), **audit scopes**: housekeeping organization (legacy), gate reflection note template alignment, dispatch prompt format, **`.rdd/` directory organization** (v14.0 — verifies `.rdd/` exists with `audits/`, `gates/`, `cycle-status.md`, `.migration-version`; flags orphaned `.rdd/` content)
**Depends on:** Orchestrator (skill listing); Conformance Scanner Agent (drift detection); File system for migration operations
**Depended on by:** User (invoked via `/rdd-conform`); Orchestrator (suggests when artifacts exist + plugin version changed); Stop hook (advisory-mode notice directs user to migration)
**Note:** Both migration subcommands are idempotent. Rollback is git-based. **Cycle 17 note:** `migrate-to-rdd` depends on `migrate` having run previously (i.e., the corpus is in `.rdd/` placement). A future cycle may consolidate the two operations into a single `/rdd-conform migrate` that targets the current canonical placement; out of scope for v14.0.

### Module: About Skill (`skills/about/SKILL.md`) — NEW in v8.0
**Purpose:** Reports current plugin version, provides a brief adaptive methodology overview, and offers depth-calibrated elaboration for users unfamiliar with RDD.
**Provenance:** ADR-042; Essay 009 §11
**Owns:** Version detection, methodology overview (user language), depth calibration based on in-session signals
**Depends on:** Plugin Manifest (version metadata)
**Depended on by:** Orchestrator (optionally offers `/rdd-about` when no existing RDD artifacts)

### Module: Review Skill (`skills/review/SKILL.md`) — NEW in v9.0
**Purpose:** Scaffolds the reviewer's understanding of code changes through question-driven orientation, operating in corpus-grounded or context-reconstructive mode.
**Provenance:** ADR-043 through ADR-047; Essay 010; Invariant 0 (adapted)
**Owns:** Mode detection, collaborative context-gathering protocol, corpus-grounded orientation, review question generation (three-tier: pure mechanical, observation→question, pure question), test quality evaluation (mutation testing lens), time-budget adaptation (zone of proximal development), mechanical finding separation, classification heuristic, reviewer autonomy safeguards
**Depends on:** Orchestrator (skill listing); Build Skill (mode-shift target at stewardship — ADR-054 supersedes ADR-046 callout model)
**Depended on by:** None directly (no durable artifact)

### Specialist Subagent Modules

All specialist subagents follow the artifact-mediated communication pattern (ADR-031): they receive file paths as input, run in isolated context with no conversation history, and write structured output to artifact files at canonical paths.

### Module: Citation Auditor Agent (`agents/citation-auditor.md`)
**Purpose:** Verifies every reference and factual claim in an essay or outline against verifiable sources, producing a structured audit artifact at canonical path.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** Citation verification process, audit artifact production (P1/P2/P3 issues with locations, evidence, recommendations)
**Depends on:** None (receives input via file paths in dispatch)
**Depended on by:** Research Skill (after essay), Synthesis Skill (before outline finalization)
**Model:** Sonnet

### Module: Argument Auditor Agent (`agents/argument-auditor.md`) — AMENDED in v11.0, v15.0
**Purpose:** Maps inferential chains from evidence to conclusions in a research artifact (prose essay or Essay-Outline), ADR set, or synthesis outline, producing a two-section audit artifact: argument audit + framing audit. **v15.0 (ADR-093):** for Essay-Outline genre, the auditor additionally performs pyramid graph-traversal and expansion-fidelity verification per ADR-092's Pyramid Refinement compliance test.
**Provenance:** ADR-031; ADR-032; ADR-061 (framing audit extension); ADR-093 (Essay-Outline genre handling; pyramid graph-traversal; expansion-fidelity verification; Skill-Structure Layer anchoring); Essay 007 §3; Essay 013 §5; Essay 017
**Owns:** Argument mapping, logical gap detection, hidden assumption identification, **framing audit** (three structural questions: alternative framings the evidence supported, absent truths, dominant framing inversion), audit artifact production. **v15.0 — Essay-Outline genre handling (ADR-093):** four named genres (research essays, ADRs, synthesis outlines, **Essay-Outline**); for Essay-Outline genre, consumes Argument-Graph section as **structured input** (parses identifiers `C1`, `W1.1`, `E1.1.1`, ... as first-class references); performs **pyramid graph-traversal** across four tiers (Abstract → Argument-Graph → Citation-Embedded Outline → References); verifies **expansion fidelity** at three boundaries plus reverse-direction (Boundary 1: Abstract → Argument-Graph; Boundary 2: Argument-Graph → Citation-Embedded Outline; Boundary 3: Citation-Embedded Outline → References with severity coordination — P2 when citation-auditor already ran on same artifact, P1 escalated otherwise); applies **META audit-time review** (P2 misclassification finding when META-anchored section contains developmental claim/warrant/evidence bullets); produces **pyramid coverage map** + **expansion-fidelity findings** subsections in Section 1 of the audit report when genre is Essay-Outline. Each Boundary 1 or Boundary 2 P1 finding in the expansion-fidelity-findings subsection includes an inline **Discrimination Test routing** field naming the diagnosis per ADR-092 §6 (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect) — the routing surfaces alongside the pyramid coordinate so the user receives the stewardship signal without cross-referencing `/rdd-research` skill text. For the three pre-ADR-093 genres (research essays, ADRs, synthesis outlines), behavior is unchanged.
**Depends on:** None (receives artifact + source material via dispatch)
**Depended on by:** Research Skill (after citation audit; v15.0 dispatches on Essay-Outline genre per ADR-093), Decide Skill (after ADRs), Synthesis Skill (after citation audit)
**Model:** Sonnet
**Note:** Tier 1 unconditional mechanism. Known limitation (P3-B): the framing auditor is itself subject to content selection. **v15.0:** Essay-Outline genre handling is Skill-Structure Layer-anchored per ADR-093 §5 (the auditor's `agents/argument-auditor.md` file specifies the four genres, the pyramid graph-traversal Process step, and the output template extensions). Per Invariant 8, mechanism execution depends on the skill text being read; the dispatch instruction is read by every argument-auditor invocation, so the auditor's Essay-Outline behavior is anchored to a concrete, mechanically-unavoidable workflow step.

### Module: Lit Reviewer Agent (`agents/lit-reviewer.md`)
**Purpose:** Performs systematic literature search and synthesis for a research question, producing a research log entry as artifact.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** Literature search, source quality evaluation, synthesis narrative production
**Depends on:** None (receives research question via dispatch)
**Depended on by:** Research Skill (user-selected research method)
**Model:** Sonnet

### Module: Conformance Scanner Agent (`agents/conformance-scanner.md`)
**Purpose:** Scans codebase against ADR declarations, producing a conformance debt table with file:line references for violations.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** ADR-to-code comparison, violation detection, conformance debt table production
**Depends on:** None (receives ADR file paths and codebase path via dispatch)
**Depended on by:** Decide Skill (Step 3.5), Conform Skill (drift detection)
**Model:** Sonnet

### Module: Orientation Writer Agent (`agents/orientation-writer.md`)
**Purpose:** Reads the current artifact corpus and produces or refreshes ORIENTATION.md in the five-section structure (ADR-020).
**Provenance:** ADR-031; ADR-032; ADR-019; ADR-020; ADR-021
**Owns:** Orientation document generation, artifact corpus reading, five-section distillation
**Depends on:** None (reads artifact files directly)
**Depended on by:** Orchestrator (dispatched at milestones via orientation-trigger hook)
**Model:** Sonnet

### Module: Spike Runner Agent (`agents/spike-runner.md`)
**Purpose:** Runs a focused code spike in a scratch directory, answering a single research question and writing findings to the research log. v14.0: also used for validation spikes per ADR-087.
**Provenance:** ADR-031; ADR-032; ADR-087 (validation spike pattern); Essay 007 §3
**Owns:** Spike execution, scratch directory management (`./scratch/spike-*/`), prose findings production, validation-spike findings (when used per ADR-087)
**Depends on:** None (receives spike question via dispatch)
**Depended on by:** Research Skill (user-selected method; validation-spike at research → discover gate per ADR-087)
**Model:** Inherit (parent model — spikes may require exploratory reasoning)

### Module: Research Methods Reviewer Agent (`agents/research-methods-reviewer.md`) — NEW in v11.0, AMENDED in v13.0
**Purpose:** Reviews research design before execution — evaluates question framing, source selection bias, scope mismatches, premature hypothesis-space narrowing, and (v13.0) incongruity surfacing, applying belief-mapping to each question.
**Provenance:** ADR-060; ADR-082 (extension to 4-criterion scope); Essay 013 §6; ADR-055 (belief-mapping form)
**Owns:** Research question review (belief-mapping), embedded conclusion detection in questions, premature narrowing flags, **incongruity surfacing** (v13.0 — when a simple solution in one area sits adjacent to a complex solution in an adjacent area, has it been surfaced for examination?), research design review artifact production at `.rdd/audits/research-methods-question-set-<NNN>.md`
**Depends on:** None (receives question set via dispatch)
**Depended on by:** Research Skill (before each research loop after substantial revision)
**Model:** Sonnet
**Note:** Tier 1 unconditional mechanism. Known limitation: belief-mapping surfaces questions adjacent to existing framing.

### Module: Susceptibility Snapshot Evaluator Agent (`agents/susceptibility-snapshot-evaluator.md`) — NEW in v11.0, AMENDED in v12.0
**Purpose:** Evaluates sycophancy susceptibility signals in an isolated context at phase boundaries, producing a Susceptibility Snapshot artifact at a phase-keyed canonical path.
**Provenance:** ADR-057; ADR-058 (Tier 1 unconditional); ADR-065 (Skill-Structure Layer — per-phase dispatch anchoring; canonical phase-keyed output paths); ADR-063 (manifest-verified output path); Essay 013 §5; Essay 014 §5
**Owns:** Susceptibility signal evaluation (assertion density, narrowing, framing adoption, confidence markers, declining alternative engagement), Susceptibility Snapshot artifact production at `.rdd/audits/susceptibility-snapshot-{cycle}-{phase}.md` (post-ADR-085 migration; pre-migration `.rdd/audits/...`)
**Depends on:** None (receives recorded signals via dispatch; canonical prompt skeleton)
**Depended on by:** Each phase skill (per-phase dispatch at phase-end per ADR-065 Fix 1); Stop hook (verifies artifact existence at canonical path per manifest, advisory in v0.8.3)
**Model:** Sonnet
**Note:** Tier 1 unconditional mechanism. Anchored at both Skill-Structure Layer (primary per ADR-065) and Harness Layer (defense-in-depth advisory per ADR-064 / ADR-088). Outputs acted on via Grounding Reframe (extended per ADR-068).

### Cross-Cutting Hook Modules

All hooks are configured in `hooks/hooks.json`. **All hooks are advisory in v0.8.3** — no hook blocks operations.

### Module: Invariant Reminder Hook (`hooks/scripts/invariant-reminder`)
**Purpose:** Reminds the agent to check domain-model.md invariants before modifying any artifact in `docs/`.
**Provenance:** ADR-033; Essay 007 §3
**Event:** PreToolUse (matcher: Write|Edit on `docs/`)
**Owns:** Invariant reminder text injection
**Depends on:** Domain model artifact

### Module: Epistemic Gate Enforcer Hook (`hooks/scripts/epistemic-gate`)
**Purpose:** Reminds the agent about reflection time if an RDD phase is completing without gate conversation. Recognizes AID adaptive prompts.
**Provenance:** ADR-033; ADR-040; Invariant 2; Essay 007 §3
**Event:** Stop
**Owns:** Gate reminder text injection

### Module: Skill Activator Hook (`hooks/scripts/skill-activator`)
**Purpose:** Detects RDD-related prompts, suggests the appropriate phase skill, and prevents brainstorming override on explicit RDD requests.
**Provenance:** ADR-033; ADR-035; Essay 007 §7
**Event:** UserPromptSubmit
**Owns:** RDD intent detection, skill suggestion, brainstorming override prevention

### Module: Orientation Trigger Hook (`hooks/scripts/orientation-trigger`)
**Purpose:** Signals that ORIENTATION.md should be regenerated after changes to key artifacts.
**Provenance:** ADR-033; ADR-021; Essay 007 §3
**Event:** PostToolUse (matcher: Write on system-design.md, system-design.agents.md, domain-model.md, scenarios.md)
**Owns:** Regeneration reminder text injection

### Module: Document Sizing Check Hook (`hooks/scripts/sizing-check`)
**Purpose:** Flags documents exceeding sizing heuristics after any write to `docs/`.
**Provenance:** ADR-033; ADR-024; Essay 007 §3
**Event:** PostToolUse (matcher: Write on `docs/`)
**Owns:** Sizing heuristic evaluation, threshold flagging

### Harness Layer Infrastructure — NEW in v12.0, AMENDED in v14.0

The Harness Layer is Invariant 8's second substrate. It observes tool-call events and phase-end events structurally, producing verification that the agent cannot self-exempt from. **Post-v0.8.3 (ADR-088), the Harness Layer operates in advisory disposition across all modes.** Three modules implement it: a declarative manifest, a PostToolUse dispatch-verify hook, and a Stop compound-check hook.

### Module: Tier 1 Phase Manifest (`hooks/manifests/tier1-phase-manifest.yaml`) — NEW in v12.0, AMENDED in v13.0, v14.0
**Purpose:** Declarative YAML specification of required Tier 1 mechanisms per phase, consumed by the Stop hook for the compound check and by `/rdd-conform` audits.
**Provenance:** ADR-063 (manifest format); ADR-064 (extended with `audited_documents`); ADR-066 (`aid-cycle-gate-reflection` mechanism); ADR-079 (`artifact_type` field); ADR-080 (`applicable_when` block); ADR-085 (path_template values updated to `.rdd/...`); Essay 014 §6; Spike S2
**Owns:** Phase-keyed dictionary of required mechanisms (research, discover, model, decide, architect, build, play, synthesize); per-mechanism entries with canonical name, **`path_template` values now pointing to `.rdd/audits/...` and `.rdd/gates/...`** (post-v14.0 migration), `min_bytes` size floor, `required_headers`, `required_fields`, optional `audited_documents` glob patterns, optional `applicable_when` block (ADR-080), optional `artifact_type` field (ADR-079); `format_version: 1` field for schema evolution
**Depends on:** None (declarative data)
**Depended on by:** Tier 1 Phase Manifest Check Hook; Conformance Audit Skill (consumed during dispatch prompt format audit and `.rdd/` directory organization audit); `/rdd-conform migrate-to-rdd` (updates `path_template` values)

### Module: Tier 1 Verify Dispatch Hook (`hooks/scripts/tier1-verify-dispatch.sh`) — NEW in v12.0, AMENDED in v14.0
**Purpose:** Logs every Tier 1 subagent dispatch to a session-scoped append-only dispatch log, enabling the Stop hook's compound cross-reference to distinguish genuine dispatches from fabricated artifacts.
**Provenance:** ADR-064 (compound check); ADR-033 (extends hook architecture); ADR-065 (depends on canonical prompt skeleton); ADR-085 (dispatch log path migrated to `.rdd/dispatch-log.jsonl`); Spike S1
**Event:** PostToolUse (matcher: `Agent`)
**Owns:** Tier 1 mechanism set membership check (research-methods-reviewer, citation-auditor, argument-auditor, susceptibility-snapshot-evaluator); `subagent_type` extraction; canonical `Output path:` line extraction via regex; **append-only JSONL dispatch log entry at `.rdd/dispatch-log.jsonl`** (post-v14.0 migration; pre-migration `.rdd/dispatch-log.jsonl`); silent exit for non-Tier-1 dispatches; `expected_path: null` logging when skill omits `Output path:` line; session-scoped log truncation
**Depends on:** `.rdd/` directory (writes to `dispatch-log.jsonl`); skill files' canonical prompt skeleton
**Depended on by:** Tier 1 Phase Manifest Check Hook (reads at Stop events)
**Note:** Always exits `allow`. Fails-Safe-to-Allow on internal error with stderr GitHub issue surfacing. Dispatch log is gitignored. **Cycle 17 note:** Path migration from `.rdd/dispatch-log.jsonl` to `.rdd/dispatch-log.jsonl` lands at BUILD via `/rdd-conform migrate-to-rdd`.

### Module: Tier 1 Phase Manifest Check Hook (`hooks/scripts/tier1-phase-manifest-check.sh`) — NEW in v12.0, AMENDED in v13.0, v14.0
**Purpose:** At phase-end, verifies that every Tier 1 mechanism required for the current phase has produced its canonical artifact AND that the artifact corresponds to a logged subagent dispatch (compound check). **Post-v0.8.3 (ADR-088): emits model-visible advisory rather than block.**
**Provenance:** ADR-064 as updated by ADR-088 (compound check; advisory across all modes); ADR-063 (consumes manifest); ADR-065 (canonical prompt skeleton lookup); ADR-066 (gate reflection note as Tier 1 mechanism); ADR-070 (migration-version marker for advisory-vs-enforcement detection — partially superseded by ADR-085 path); ADR-078 (Cycle Stack parser); ADR-079 (in-progress-gate predicate); ADR-080 (applicable_when evaluator); ADR-081 (legacy-format detection); ADR-085 (`.rdd/` paths); ADR-090 (in-progress-phase predicate as advisory-noise suppressor); Spike S2
**Event:** Stop
**Owns:** Phase detection (reads `**Current phase:**` from `.rdd/cycle-status.md` post-migration; pre-migration `.rdd/cycle-status.md`; fails safe to allow if unparseable); cycle detection; **mode detection via `.rdd/.migration-version` marker** (post-v14.0); manifest loading; per-mechanism structural assertions; **compound cross-reference against `.rdd/dispatch-log.jsonl`** (post-v14.0); **advisory output across all modes per ADR-088** — emits model-visible advisory naming each failing mechanism with the four-failure-mode classification, never blocks; **In-Progress Phase predicate** per ADR-090 (when `**In-progress phase:**` field present and matches current phase, suppress per-phase manifest advisory); **Multi-Cycle Stack parser** (ADR-078); **In-Progress Gate predicate** (ADR-079); **applicable_when evaluator** (ADR-080); **legacy-format detection + grandfathered enforcement** (ADR-081); revision-aware re-audit reminder (non-blocking); Fails-Safe-to-Allow with GitHub issue surfacing
**Depends on:** Tier 1 Phase Manifest; Dispatch Log; Cycle Status; Audit Artifacts at canonical paths; Gate Reflection Notes; `.rdd/.migration-version`
**Depended on by:** Orchestrator and phase skills (advisory output is model-visible — agent surfaces to user); Stop event protocol
**Note:** Extends ADR-033's cross-cutting hook architecture. Always fails safe to allow. **Cycle 17 amendment per ADR-088:** the hook NEVER blocks; advisory disposition across all modes; the previously-claimed structural-prevention guarantee is amended to structural-detection (the agent cannot inject hook events, so the dispatch log is reliable; detection surfaces; practitioner is responsible for response). The In-Progress Phase predicate per ADR-090 suppresses noise during phase work; absence of the field produces noisier but functionally-correct cycle progression.

### Module: Hook Failure Issue Template (`.github/ISSUE_TEMPLATE/hook-failure.md`) — NEW in v12.0
**Purpose:** Pre-populated GitHub issue template for users reporting hook-script internal errors.
**Provenance:** ADR-064 (Fails-Safe-to-Allow surfacing); research-phase Commitment 1 (user-as-non-maintainer)
**Owns:** Structured issue template requesting plugin version, hook name, stderr diagnostic line, OS/shell environment, sanitized hook input JSON
**Depends on:** None
**Depended on by:** Tier 1 Verify Dispatch Hook and Tier 1 Phase Manifest Check Hook (stderr notices link)

### Cycle 016 Module Amendments — v13.0 (Methodology Seams)

The Cycle 016 ADRs (073–082) amend nine existing modules. No new modules introduced. Per ADR-076 (applied to ARCHITECT itself), each amendment carries decomposed fitness properties for any qualitative claim. Full v13.0 amendment details in [Design Amendment Log entry #14](#design-amendment-log).

### Cycle 017 Amendments — v14.0 (Readability & Comprehensibility)

The Cycle 017 ADRs (083–090) amend modules listed below and introduce one new artifact module. Per ADR-076, each amendment with a qualitative claim carries decomposed `**Fitness:**` properties. No new code modules; `system-design.agents.md` is a new artifact module structurally.

#### New artifact module: `system-design.agents.md` (this file) — NEW in v14.0
**Purpose:** Companion file to `system-design.md` per ADR-084 Pattern B; carries the dense agent-context reference material (architectural drivers, full module decomposition, responsibility matrix, dependency graph, integration contracts, fitness criteria, test architecture, design amendment log, susceptibility-snapshot briefs) in the form best suited for agents constructing context for code-construction work.
**Provenance:** ADR-084 (Pattern B catalog); ADR-083 (Outcome Test admissibility — Pattern B is the structured exception condition for content-divergence threshold); Essay 016 §6 (ARCHITECT inputs)
**Owns:** Architectural drivers table (full); Module Decomposition (full detail); Responsibility Matrix (full); Dependency Graph; Integration Contracts (full); Fitness Criteria (full); Test Architecture (full); Design Amendment Log; Per-Phase Susceptibility Snapshot Briefs (Appendix A)
**Depends on:** `system-design.md` (cross-references for human-facing summary)
**Depended on by:** All phase skills + agents that read `system-design.md` for module ownership and fitness criteria; Build Skill via ADR-077 prompt 4 (consumes declared fitness properties for affected modules)
**Fitness:** (1) Cross-references to `system-design.md` are at convention path `./system-design.md` (relative); verified by file-existence check at the cross-reference. (2) The companion file's content does not duplicate the human-facing artifact's orientation summary — verified by inspection at architect gate. (3) Both files carry the same `Version:` field, updated atomically together; verified by `test_system_design_companion_version_sync.sh` (BUILD scope). (4) When ADR supersession sweeps run (per ADR-074), `system-design.agents.md` is included in the downstream-sweep target list per the v14.0 Decide Skill amendment; verified by sweep test inspection.

#### Module: Conformance Audit Skill (`skills/conform/SKILL.md`) — AMENDED in v14.0
**v14.0 additions:** `/rdd-conform migrate-to-rdd` subcommand per ADR-085 §4. New audit scope: `.rdd/` directory organization (verifies presence of `.rdd/` with required subdirectories, flags orphaned `.rdd/` content). Both migration subcommands coexist; future cycles may consolidate.
**Provenance:** ADR-085; Issue #17; cycle-status.md feed-forward to BUILD
**Fitness:** (1) `/rdd-conform migrate-to-rdd` is idempotent — no-ops on `.rdd/.migration-version` matching plugin version; verified by `test_conform_migrate_to_rdd_idempotent.sh`. (2) Migration writes `.rdd/.migration-version` with current plugin version; verified by file-existence-and-content check post-migration. (3) Hook test fixtures path-substitution sweep covers `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh`; verified by post-migration grep on these files for `.rdd/` (zero matches expected).

#### Module: Research Skill (`skills/research/SKILL.md`) — AMENDED in v14.0
**v14.0 additions:** Validation-spike decision step at research → discover gate per ADR-087 §3 (positioned in skill text immediately before the gate's reflection-time prompt). Trigger question composed from interaction-grounding rationale + possibility-space-pruning rationale; practitioner records prototype-or-no-prototype with rationale in research log.
**Provenance:** ADR-087 (validation spike as research method); RESEARCH-phase Grounding Reframe Target 2; Reflection 016
**Fitness:** (1) The validation-spike step is text-anchored at the research → discover gate position in `skills/research/SKILL.md` (verifiable by grep for "validation-spike" or equivalent at the gate-position section). (2) The skill text encodes prototype-or-no-prototype as a felt-judgment decision (not mandatory); the rationale-recording requirement is named (e.g., "the rejection is recorded in the research log with rationale"); verified by skill-text inspection. (3) When a spike runs, its findings are integrated into the essay before the essay-as-checkpoint advance — the skill text references the integration step explicitly; verified by skill-text inspection.

#### Module: Decide Skill (`skills/decide/SKILL.md`) — AMENDED in v14.0
**v14.0 additions:** (a) `system-design.agents.md` added to the downstream-sweep target list (alongside system-design.md, ORIENTATION.md, domain-model.md, field-guide.md) — when an ADR is superseded, citations in both system-design files update. (b) Cognitive-Economy Criterion application: when an ADR proposes a candidate human-facing artifact (e.g., orientation document, on-ramp, explainer), the Outcome Test (ADR-083) is applied as part of the rejected-alternatives or consequences analysis. (c) Pattern A/B catalog (ADR-084) is referenced as an architectural decision available when ADRs commit to a new artifact's placement strategy.
**Provenance:** ADR-074 (sweep extension); ADR-083 (Outcome Test); ADR-084 (Pattern A/B catalog)
**Fitness:** (1) The downstream-sweep target list in skill text includes `system-design.agents.md` explicitly; verified by skill-text inspection and `test_decide_supersession_sweep_includes_companion.sh`. (2) ADRs proposing new candidate human-facing artifacts include either (i) an Outcome Test application in their Consequences section, or (ii) a Rejected-alternatives entry naming the Outcome Test consideration; verified by ADR template inspection on Cycle 017 ADRs and on future cycle ADRs of this character.

#### Module: Architect Skill (`skills/architect/SKILL.md`) — AMENDED in v14.0
**v14.0 additions:** Per-artifact Pattern A/B judgment per ADR-084 — when ARCHITECT restructures any Tier 2 readable artifact, the per-artifact judgment criterion applies (estimate audience-tagged volume; below ~50% indicator → Pattern A; above → Pattern B); the judgment basis is recorded in the restructuring decision (e.g., as inline rationale in the system-design's amendment-log entry for that cycle). The fitness-criteria decomposition gate check (ADR-076) extends to system-design.agents.md.
**Provenance:** ADR-084 (Pattern A/B catalog applied at restructuring); ADR-076 (existing gate check extended)
**Fitness:** (1) When ARCHITECT applies Pattern A or Pattern B, the choice and the judgment basis are recorded in the system-design's amendment-log entry (or the architecture phase's gate reflection note) — verified by the inspection at Cycle 017 ARCHITECT (canonical exemplar) and any future restructuring cycles. (2) ADR-076's fitness-criteria gate check applies to qualitative claims in both `system-design.md` and `system-design.agents.md` after v14.0; verified by inspection of the gate check skill text.

#### Module: All phase skills — AMENDED in v14.0
**v14.0 additions:** Output paths for per-phase susceptibility snapshot dispatches updated from `.rdd/audits/...` to `.rdd/audits/...` per ADR-085. Output paths for gate reflection notes updated from `.rdd/gates/...` to `.rdd/gates/...` per ADR-085. (Phase skills' canonical prompt skeleton is otherwise unchanged.)
**Provenance:** ADR-085 §6 (skill text updates)
**Fitness:** (1) Per-phase susceptibility snapshot dispatch instructions in all 8 phase skills name `Output path: .rdd/audits/susceptibility-snapshot-{cycle}-{phase}.md` (post-migration); verified by grep across `skills/{research,discover,model,decide,architect,build,play,synthesize}/SKILL.md`. (2) Gate reflection note canonical paths in all 8 phase skills name `.rdd/gates/{cycle}-{phase-from}-to-{phase-to}.md`; verified similarly.

#### Module: Tier 1 Phase Manifest Check Hook (`hooks/scripts/tier1-phase-manifest-check.sh`) — AMENDED in v14.0
**v14.0 additions:** (a) Stop-hook manifest check is advisory across all modes per ADR-088 — never blocks; emits model-visible advisory naming each failing mechanism with four-failure-mode classification. (b) Cycle-status reads from `.rdd/cycle-status.md` (post-migration); falls back to `.rdd/cycle-status.md` (pre-migration) for backward-compat. (c) Migration-version marker reads from `.rdd/.migration-version` (post-migration); falls back to `.rdd/.migration-version` for backward-compat. (d) In-Progress Phase predicate per ADR-090 — when `**In-progress phase:**` field present on top stack entry and matches current phase, suppress per-phase manifest advisory.
**Provenance:** ADR-088 (advisory across all modes); ADR-090 (In-Progress Phase predicate role-shift); ADR-085 (path migration with backward-compat)
**Fitness:** (1) Hook never returns non-zero exit code on manifest-check failure (advisory disposition); verified by `test_hook_manifest_check_advisory.sh` simulating missing artifact and observing stderr advisory + exit 0. (2) In-Progress Phase predicate suppresses advisory when field present and matching; verified by `test_hook_in_progress_phase_suppresses_advisory.sh`. (3) Path-fallback works: hook reads `.rdd/cycle-status.md` first, falls back to legacy path; verified by `test_hook_reads_rdd_path_with_legacy_fallback.sh`.

#### Module: Tier 1 Phase Manifest (`hooks/manifests/tier1-phase-manifest.yaml`) — AMENDED in v14.0
**v14.0 additions:** All `path_template` values updated from `.rdd/{audits,gates}/...` to `.rdd/{audits,gates}/...` per ADR-085. Substitution-token semantics (`{cycle}`, `{phase}`, `{phase-to}`) unchanged.
**Provenance:** ADR-085 §10 (manifest path-template updates)
**Fitness:** (1) After `/rdd-conform migrate-to-rdd` runs on a corpus, every `path_template` value in the manifest names `.rdd/...` paths; verified by grep on `hooks/manifests/tier1-phase-manifest.yaml` for `.rdd/` (zero matches expected post-migration). (2) Backward-compat: pre-migration corpora retain `.rdd/` paths; the migration is the path-update event.

#### Module: Tier 1 Verify Dispatch Hook (`hooks/scripts/tier1-verify-dispatch.sh`) — AMENDED in v14.0
**v14.0 additions:** Dispatch log path updated from `.rdd/dispatch-log.jsonl` to `.rdd/dispatch-log.jsonl` per ADR-085. Hook logic unchanged.
**Provenance:** ADR-085 §10 (hook script path updates)
**Fitness:** (1) Hook writes dispatch entries to `.rdd/dispatch-log.jsonl` post-migration; verified by `test_hook_dispatch_log_writes_rdd_path.sh`. (2) `.gitignore` contains `.rdd/dispatch-log.jsonl` post-migration; verified by post-migration `.gitignore` inspection.

#### Cycle-Status Schema (`docs/cycle-status.md` → `.rdd/cycle-status.md`) — AMENDED in v14.0 (artifact, not module)
**v14.0 additions:** (a) File location migrates from `.rdd/cycle-status.md` to `.rdd/cycle-status.md` per ADR-085. (b) `**In-progress phase:**` field role amended per ADR-090 — advisory-noise suppressor, not load-bearing predicate; optional, not correctness-critical. The orchestrator sets at phase entry, removes at phase-exit readiness; absence produces noisier but functionally-correct cycle progression.
**Provenance:** ADR-085 (path migration); ADR-090 (field role-shift); existing per-entry fields per ADR-078 / ADR-079 unchanged
**Fitness:** (1) Post-migration, the active cycle-status.md lives at `.rdd/cycle-status.md`; verified by file-existence check + `.rdd/cycle-status.md` non-existence. (2) The `**In-progress phase:**` field's documentation in the schema names it as advisory-noise suppression with explicit "optional, not correctness-critical" language per ADR-090; verified by skill-text and ADR cross-reference inspection.

### Cycle 018 Amendments — v15.0 (Essay-Outline Form Change)

Cycle 018 (ADRs 092, 093) introduces the **Essay-Outline** as the RESEARCH artifact form and extends the argument-auditor's scope to consume Essay-Outline as a fourth named genre with pyramid graph-traversal and expansion-fidelity verification. Two modules amended (Research Skill, Argument Auditor Agent) plus four cross-cutting documentation/skill-text amendments (Orchestrator, ORIENTATION.md, this system-design pair, Domain Model follow-on). **Zero new code modules; zero new specialist subagents; zero invariant changes** (Invariant 8 governs the structural-vs-conventional anchoring; ADR-092 applies Invariant 8 to the form change by separating layers — structural verification at expansion-fidelity level; conventional discipline at per-bullet level). The dependency graph's structural shape is preserved.

Per ADR-076, each amendment with a qualitative claim carries decomposed `**Fitness:**` properties.

#### Module: Research Skill (`skills/research/SKILL.md`) — AMENDED in v15.0
**v15.0 additions:** Essay-Outline production replaces prose-essay production for new research artifacts per ADR-092. The skill text encodes:
- The **four-section template** (Abstract Section / Argument-Graph / Citation-Embedded Outline / References) per ADR-092 §1.
- The **Argument-Graph format** — structured-bullet hierarchy with named identifiers (`C1`, `W1.1`, `E1.1.1`, ...); MUST anchor convention (every developmental body subsection ends with a parenthetical anchor to one or more graph identifiers); `META` reserved identifier for deliberately non-developmental sections — per ADR-092 §4.
- **Outline-Production Discipline** (Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves PROVENANCE CORRECTION and SCOPE QUALIFICATION) as production requirements — per ADR-092 §5.
- **Outline-Coherence Signal** stewardship guidance — when the argument-audit reports P1 expansion-fidelity violations, apply the discrimination test (Boundary 1 → scope-suspect → consider splitting the cycle; Boundary 2 → discipline-suspect → re-run production with discipline tightening) per ADR-092 §6.
- **Filename pattern** changes from `./docs/essays/NNN-<slug>.md` to `./docs/essays/essay-outline-NNN-<slug>.md`. Legacy prose essays remain at their existing paths under their existing names — no retroactive migration.
- The line stating "If you can't explain it clearly in prose, you don't understand it well enough" is **revised** — it directly contradicts the form change.

**Provenance:** ADR-092 §1–§6 (Essay-Outline form; Pyramid Refinement structural property; compliance test; Argument-Graph format; Outline-Production Discipline; Outline-Coherence Signal); Essay 017 (Outlines as Research Artifacts); Cycle 018 DISCOVER feed-forward (four-section spec refinement at the DISCOVER gate, 2026-05-14)

**Fitness:** (1) The four-section template is documented in `skills/research/SKILL.md` with the format conventions from ADR-092 §4; verified by `test_essay_outline_form_documented.sh` (grep on the skill file for the four section names and a structured-bullet format example with `C1`/`W1.1`/`E1.1.1` labels). (2) Outline-Production Discipline is encoded as production requirements (Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves); verified by skill-text inspection (grep for "Synthesis Bullet", "CONFIDENCE-LEVEL", "PROVENANCE CORRECTION", "SCOPE QUALIFICATION"). (3) MUST anchor convention is encoded (every developmental body subsection ends with a parenthetical anchor; `META` reserved identifier named); verified by skill-text inspection. (4) Outline-Coherence Signal stewardship guidance encodes the discrimination test (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect); verified by skill-text inspection. (5) The filename pattern in the skill text reads `essay-outline-NNN-<slug>.md`; verified by grep on `skills/research/SKILL.md` for `essay-outline-` and absence of the prior `./docs/essays/NNN-<slug>.md` pattern at the artifact-output instruction site. (6) The "If you can't explain it clearly in prose, you don't understand it well enough" line is revised or removed since it contradicts the form change; verified by grep on the skill file (zero matches expected for the verbatim phrase).

#### Module: Argument Auditor Agent (`agents/argument-auditor.md`) — AMENDED in v15.0
**v15.0 additions (ADR-093):**
- **Genre list extended** — fourth named genre: **Essay-Outline** (alongside research essays, ADRs, synthesis outlines).
- **New Process step** between the five existing within-document verifications and the audit output: when the primary document is an Essay-Outline, perform pyramid graph-traversal across four tiers (Abstract → Argument-Graph → Citation-Embedded Outline → References) and expansion-fidelity verification at three boundaries plus reverse-direction (Reverse Boundary 1, Reverse Boundary 2) per ADR-093 §2–§3.
- **Severity assignment** per ADR-093 §3 — P1 (Must Fix) for any boundary violation that breaks the pyramid; P2 (Should Fix) for thin development; P3 (Consider) for minor coverage gaps. Boundary 3 (citation → References) coordinates with citation-auditor: P2 when citation-auditor ran on same artifact; P1 escalated otherwise.
- **META audit-time review** — META-anchored sections that contain developmental claim/warrant/evidence bullets are reported as P2 misclassification findings per ADR-092 §4 and ADR-093 §2 (guards against META being used as a judgment-anchored bypass for the MUST anchor convention under task load).
- **Output template extensions** — pyramid coverage map subsection + expansion-fidelity findings subsection in Section 1 of the audit report when genre is Essay-Outline. For the three pre-ADR-093 genres, the output template is unchanged.
- **Discrimination Test routing field on Boundary 1 / Boundary 2 P1 findings** — each Boundary 1 P1 finding includes an inline `**Routing per ADR-092 §6:** scope-suspect` field (with the stewardship-response language: "the cycle may be researching more than one cohesive argument can carry; stewardship response is to consider splitting the cycle into smaller scoped cycles"); each Boundary 2 P1 finding includes an inline `**Routing per ADR-092 §6:** discipline-suspect` field (with the stewardship-response language: "the production work was not completed at sufficient depth; stewardship response is to re-run production with discipline tightening, no scope change required"). The routing field surfaces the Outline-Coherence Signal's discrimination directly in the auditor's output so the user receives the stewardship signal without cross-referencing `/rdd-research` skill text — usability enhancement surfaced by the ARCHITECT-phase susceptibility snapshot (P3 Signal #1).

**Provenance:** ADR-093 §1–§5 (Essay-Outline genre detection; pyramid graph-traversal; expansion-fidelity verification; output format; Skill-Structure Layer anchoring per ADR-067-as-updated-by-ADR-089); ADR-092 §3 (Pyramid Refinement compliance test); Essay 017

**Fitness:** (1) The genre list in `agents/argument-auditor.md` names four genres (research essays, ADRs, synthesis outlines, Essay-Outline); verified by `test_argument_auditor_essay_outline_genre.sh` (grep on the agent file for the four genre names). (2) The Essay-Outline Process step references ADR-092 §3 and ADR-093 §2; verified by grep on the agent file for "ADR-092" and "ADR-093". (3) The pyramid coverage map and expansion-fidelity findings subsections are documented as Essay-Outline-only output template additions (do not appear for the three pre-ADR-093 genres); verified by skill-text inspection (grep for "pyramid coverage map" + "Essay-Outline" in the output template section). (4) META audit-time review is encoded as a P2 misclassification check; verified by skill-text inspection (grep for "META" + "misclassification"). (5) Boundary 3 severity coordination with citation-auditor (P2 when citation-auditor ran; P1 escalated otherwise) is encoded; verified by skill-text inspection. (6) **Discrimination Test routing field on Boundary 1 / Boundary 2 P1 findings** — `agents/argument-auditor.md` specifies that Boundary 1 P1 findings carry an inline `Routing per ADR-092 §6: scope-suspect` field (with stewardship-response language) and Boundary 2 P1 findings carry an inline `Routing per ADR-092 §6: discipline-suspect` field (with stewardship-response language); verified by grep on the agent file for "Routing per ADR-092" + "scope-suspect" + "discipline-suspect" in the output template section.

#### Module: Orchestrator (`skills/rdd/SKILL.md`) — AMENDED in v15.0
**v15.0 additions:** Prose descriptions of the RESEARCH artifact ("citation-audited, argument-audited, and framing-audited essay") in the orchestrator skill's RESEARCH-phase descriptions are updated to reference **Essay-Outline** alongside (or in place of) "essay." The Artifacts Summary table's RESEARCH essay row references the new filename pattern `essay-outline-NNN-<slug>.md` alongside the legacy `NNN-*.md`.

**Provenance:** ADR-092 §10 (skill-text amendments); cycle-status §From DECIDE signal 3 (unified pre-BUILD sweep checklist)

**Fitness:** (1) The orchestrator skill text references Essay-Outline as the RESEARCH artifact post-Cycle-018 in the RESEARCH-phase descriptions; verified by grep on `skills/rdd/SKILL.md` for "Essay-Outline" in the RESEARCH-phase descriptions. (2) The Artifacts Summary table lists `./docs/essays/essay-outline-NNN-<slug>.md` as the RESEARCH artifact path post-Cycle-018; verified by table inspection.

#### Module: ORIENTATION.md (Section 4 — artifact map) — AMENDED in v15.0
**v15.0 additions:** Section 4 (artifact map) names Essay-Outline as the RESEARCH artifact form; the existing prose-essay form is named as the prior pattern. The essays-listing reference is updated to reflect both forms.

**Provenance:** ADR-092 §10 (skill-text amendments); cycle-status §From DECIDE signal 3

**Fitness:** (1) ORIENTATION.md Section 4 names Essay-Outline as the RESEARCH artifact form; verified by `grep -n "Essay-Outline" docs/ORIENTATION.md` returning at least one match in the Section 4 region. (2) The artifact map distinguishes legacy prose-essay form (`NNN-*.md`) from new Essay-Outline form (`essay-outline-NNN-*.md`); verified by ORIENTATION inspection.

#### Module: Domain Model (`docs/domain-model.md`) — AMENDED-FOLLOW-ON in v15.0 (post-BUILD, landed in Cycle 018 BUILD)
**v15.0 follow-on (landed):** Cycle 018 BUILD shipped WP-B (the `agents/argument-auditor.md` Skill-Structure Layer amendment per ADR-093) together with WP-E (Domain Model Amendment 24). The Argument-Graph (as artifact section) concept entry's prior "auditor consumption is currently judgment-anchored" note (recorded at MODEL gate as the Target 2 grounding action) now reads "auditor consumption is anchored in `agents/argument-auditor.md` per ADR-093." Amendment 24 logged at `docs/domain-model.md` §Amendment Log.

**Provenance:** ADR-093 §5 (BUILD-phase auditor amendment, landed in Cycle 018 BUILD as WP-B); ADR-092 §2 (Pyramid Refinement structural property); Amendment 23 (the original concept entry whose note was updated); Amendment 24 (the follow-on landing entry).

**Fitness:** (1) The Argument-Graph (as artifact section) concept entry's judgment-anchored note is updated to reference ADR-093 anchoring; verified by `grep -n "auditor consumption is anchored" docs/domain-model.md` returning a match.

#### Cycle 018 deferred sweep — unified pre-BUILD checklist (consolidated)

The conformance scan (`.rdd/audits/conformance-scan-018-decide.md`) flagged that ADR-092 §10 and ADR-093 §5 enumerate disjoint sweep target lists. The unified pre-BUILD sweep checklist consolidates them — eight files plus two fixture tests:

| Sweep target | Purpose |
|---|---|
| `skills/research/SKILL.md` | Essay-Outline production instructions; four-section template; Outline-Production Discipline; Argument-Graph format (MUST anchor + META); Outline-Coherence Signal stewardship; filename pattern update; revise "If you can't explain it clearly in prose..." line |
| `agents/argument-auditor.md` | Four-genre list; pyramid graph-traversal Process step; expansion-fidelity verification; META audit-time review; output template extensions |
| `skills/rdd/SKILL.md` (orchestrator) | RESEARCH-phase prose-essay descriptions updated to Essay-Outline; Artifacts Summary table filename-pattern update (cycle-status names lines 21, 86, 123, 546–548 and table line 587–588 as the candidate edit sites) |
| `docs/ORIENTATION.md` (Section 4) | Essay-Outline named as RESEARCH artifact form; legacy prose-essay form named as prior pattern |
| `docs/system-design.md` | Cycle 018 amendments summary; version bump; Design Amendment Log entry |
| `docs/system-design.agents.md` | This Cycle 018 Amendments section; responsibility matrix Cycle 018 entries; Cycle 018 fitness criteria + boundary tests; provenance chain updates citing ADR-092 + ADR-093 |
| `docs/domain-model.md` | Amendment 24 follow-on (post-BUILD stewardship update; small change) — Argument-Graph (as artifact section) judgment-anchored note updates to ADR-093 anchoring |
| `docs/roadmap.md` | Cycle 017 WPs migrate to Completed Work Log; Cycle 018 WPs become active |
| `hooks/tests/test_essay_outline_form_documented.sh` | Fixture test (new) — verifies four-section template in research skill |
| `hooks/tests/test_argument_auditor_essay_outline_genre.sh` | Fixture test (new) — verifies four genres + Essay-Outline Process step in argument-auditor agent |

**Ship-together constraint (ADR-092 §5 + ADR-093 §6 + Cycle 018 cross-ADR integration scenario):** ADR-092 and ADR-093 ship together at BUILD. The layer separation guarantee in ADR-092 §5 (Pyramid Refinement audit catches discipline failures at the structural level) is operative because both ADRs ship together; a single-ADR BUILD would leave the layer separation degraded to discipline-alone — the Invariant 8 risk the form change is designed to mitigate. This is encoded as Cycle 018 scenario "Form-change ADR and auditor-amendment ADR ship together at BUILD" (scenarios.md §Cross-ADR Integration).

### Plugin Infrastructure

### Module: Plugin Manifest (`.claude-plugin/plugin.json`)
**Purpose:** Declares the plugin identity and enables auto-discovery of skills, agents, and hooks by the Claude Code runtime.
**Provenance:** ADR-034; Essay 007 §5
**Owns:** Plugin name (`rdd`), version, description
**Depends on:** None
**Depended on by:** All skills (namespace prefix `/rdd-`), all agents (discovery), all hooks (registration)

## Responsibility Matrix

The full Cycle 1–016 responsibility matrix entries are preserved per ADR-074 (body immutability for matrix entries linked to immutable ADRs). Cycle 017 additions are appended at the end of the matrix as a new section. See [system-design.md](./system-design.md) for the human-facing module summaries.

The complete matrix is structured by cycle, with sections covering: Epistemic Gate Concepts (Essay 001 / ADRs 001-005); Product Discovery Concepts (Essay 002 / ADRs 006-011); Actions; Synthesis Concepts (Essay 003 / ADRs 012-018); Synthesis Enrichment Concepts (Essay 006 / ADRs 027-030); Orientation Document Concepts (Essay 004 / ADRs 019-021); Roadmap/Field Guide/Sizing Concepts (Essay 005 / ADRs 022-024); Conformance/Graduation/Scoping Concepts (Essay 005 / ADRs 025-026); Play and Interaction Specification Concepts (Essay 008 / ADRs 037-039); Plugin Architecture Concepts (Essay 007 / ADRs 031-036); Composable Skill Family Concepts (Essay 011 / ADRs 048-054); Sycophancy Resistance Concepts (Essay 013 / ADRs 055-062); Structural Enforcement Concepts (Essay 014 / ADRs 063-070); Adaptive Gate Concepts (Essay 009 / ADRs 040-042); Methodology Seams Concepts (Essay 015 / ADRs 073-082); Cycle 017 Readability & Comprehensibility Concepts (Essay 016 / ADRs 083-090).

The detailed prior-cycle entries are preserved verbatim per ADR-074 body immutability — they remain the authoritative responsibility allocation for those domain concepts. The Cycle 017 additions follow.

### Cycle 017 Readability & Comprehensibility Concepts (from Essay 016 / ADRs 083-090) — NEW in v14.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Outcome Test (admissibility criterion for human-facing artifacts) | Orchestrator (cross-cutting principle); all phase skills (apply at candidate-artifact moments) | ADR-083; Essay 016 §4.5 |
| Reading-Cost Test (rejected for v1; recorded as alternative) | None (rejected; recorded in ADR-083 Rejected alternatives) | ADR-083 |
| In-Place-First Default (intervention move for human-reading failures) | Orchestrator (operating principle); all phase skills (apply at intervention moments) | ADR-083 §2 |
| Bolt-On / Felt-Additional Signal (failure-mode signal for candidate human-facing additions) | Orchestrator (operating principle); practitioner (felt detection) | ADR-083 §3 |
| Cognitive Economy (optimization target on the human side) | Orchestrator (operating principle) | ADR-083; Essay 016 §4.5 |
| Methodology-Wide Default with Named Exceptions (encoding form for ADR-083) | Orchestrator (operating principle); cycle-status.md (records exceptions when invoked) | ADR-083 §4 |
| Audience Asymmetry (Exception Condition #1 for in-place-first default) | Orchestrator (named exception) | ADR-083 §4 |
| Content-Divergence Threshold (Exception Condition #2 — supports Pattern B) | Orchestrator (named exception); Architect Skill (per-artifact judgment) | ADR-083 §4; ADR-084 |
| Post-Graduation Lifecycle Position (Exception Condition #3 — graduation-status-anchored) | Orchestrator (named exception); Conform Skill (graduation status detection) | ADR-083 §4 |
| Zero-Prior-Familiarity Reader Cohort (Exception Condition #4 — admits brief purpose-built on-ramps) | Orchestrator (named exception); Product Discovery Skill (stakeholder identification per Cycle 017 update) | ADR-083 §4; product-discovery.md Cycle 017 update |
| Apply Outcome Test (action — practitioner asks at candidate-artifact moment) | All phase skills (deploy at candidate-artifact moments); Architect Skill (deploy at restructuring) | ADR-083 |
| Pattern A — Audience-Tagged Sections (within existing artifact) | Architect Skill (deploys when below ~50% threshold); Decide Skill (references in artifact-decision ADRs) | ADR-084 |
| Pattern B — Companion File at Predictable Path (`<artifact>.agents.md`) | Architect Skill (deploys when above ~50% threshold); Decide Skill (references); system-design.agents.md (canonical exemplar) | ADR-084 |
| Per-Artifact Judgment Criterion (~50% audience-tagged volume threshold; agent-proposed, not empirically calibrated) | Architect Skill (applies at restructuring decision points) | ADR-084 |
| Companion-File Pattern (additive, not substitutive; predictable-path naming convention) | Architect Skill (applies); Decide Skill (references); Conform Skill (audits via `.rdd/` organization audit) | ADR-084 |
| Audience-Conflation Co-Mechanism (named-inside Context-Mismatch in domain model) | Architect Skill (resolves at structural level via Pattern A/B) | ADR-084; domain model Amendment 21 |
| Apply Pattern A (action — audience-tag sections within existing artifact) | Architect Skill | ADR-084 |
| Apply Pattern B (action — relocate agent-context material to companion file) | Architect Skill | ADR-084 |
| `.rdd/` Directory (process artifacts placement) | Conform Skill (`/rdd-conform migrate-to-rdd` creates and manages) | ADR-085 |
| Process-vs-Product Directory Separation (structurally visible via dotfile convention) | Orchestrator (cross-cutting principle); Conform Skill (audit scope) | ADR-085 |
| `/rdd-conform migrate-to-rdd` (one-shot relocation operation) | Conformance Audit Skill | ADR-085 §4 |
| Migrate to `.rdd/` (action — execute relocation) | Conformance Audit Skill | ADR-085 |
| Process Artifacts in `.rdd/` Audit Scope (new `/rdd-conform` audit operation) | Conformance Audit Skill | ADR-085 §6 |
| AI-as-Orienter (interactive schema-building modality — non-adopted) | None (non-adoption disposition); Orchestrator (carries the disposition) | ADR-086 |
| AI-as-Prosthetic (rejected pattern — humans needing AI to translate documents that should be human-readable) | None (rejected); Orchestrator (carries the rejection) | ADR-086; Essay 016 §4.5 |
| Operational-Criterion Problem (named limitation — distinguishes AI-as-orienter from AI-as-prosthetic in observable behavior) | Orchestrator (carries the limitation) | ADR-086 §1 |
| Usage Drift (failure mode — gradual self-reinforcing shade from AI-as-orienter to AI-as-prosthetic) | None (named failure mode) | ADR-086 §1 |
| Future-Cycle Conditions for Revisiting AI-as-Orienter (three named conditions) | None (named conditions held for future cycles) | ADR-086 §4 |
| Validation Spike (research method — tightly-scoped prototyping to ground research in actual interaction) | Research Skill (deploys at research → discover gate); Spike Runner Agent (executes when invoked) | ADR-087 §3 |
| Beck-Port Reframe (calibration of Beck framing — useful conceptual frame, not load-bearing structural evidence) | Orchestrator (carries the calibration as cross-cutting); ADR-069 scope-of-claim language | ADR-087 §1 |
| Cycle-as-Instance Reflection (standing caveat on research-phase outputs — research-not-validation until tested against the world) | Orchestrator (carries the caveat); ADR-069 scope-of-claim language | ADR-087 §4 |
| Tightly-Scoped Prototyping (research method positioning) | Research Skill | ADR-087 §3 |
| Anti-Elaboration Family (Tightly-Scoped Prototyping + Tidy First / YAGNI + ADR-077 Applicability Check, the latter at family-resemblance level with anti-Einstellung as primary disposition) | Orchestrator (carries the family framing) | ADR-087 §3a |
| Trigger Question for Validation Spike (felt — interaction-grounding rationale OR possibility-space-pruning rationale) | Research Skill (composes at research → discover gate) | ADR-087 §3 |
| Validation-Spike Decision Step (research → discover gate workflow position) | Research Skill | ADR-087 §3 |
| Run Validation Spike (action) | Research Skill (orchestrates); Spike Runner Agent (executes); user (decides) | ADR-087 |
| Reject Validation Spike with Rationale (action) | Research Skill (records in research log) | ADR-087 |
| Phase-Manifest Check Advisory Disposition (Stop hook never blocks; emits model-visible advisory) | Tier 1 Phase Manifest Check Hook | ADR-088 |
| Detection-vs-Prevention (load-bearing distinction in v0.8.3 Harness Layer; State C structurally detectable, not impossible) | Tier 1 Phase Manifest Check Hook (detection); Orchestrator (carries the distinction in scope-of-claim) | ADR-088 |
| Skill-Text Anchoring as Load-Bearing Enforcement (post-v0.8.3 — primary mechanism for Tier 1 dispatches) | Skill-Structure Layer (per ADR-065); all phase skills (apply at structurally privileged positions) | ADR-088 §3 |
| Harness Layer Advisory Across All Modes (post-v0.8.3) | Tier 1 Phase Manifest Check Hook | ADR-088; ADR-089 |
| Harness Layer Technique Revision (Three-Tier Classification row amended to advisory disposition) | Orchestrator (carries the revised classification); ADR-067 row | ADR-089 |
| In-Progress Phase Field — Advisory-Noise Suppressor (post-v0.8.3 role) | Orchestrator (set/clear lifecycle); Tier 1 Phase Manifest Check Hook (suppression evaluator); cycle-status.md (artifact) | ADR-090 |
| Set In-Progress Phase (action — orchestrator at phase entry) | Orchestrator | ADR-090 §3 |
| Remove In-Progress Phase (action — orchestrator at phase-exit readiness) | Orchestrator | ADR-090 §3 |
| Suppress Manifest Advisory (action — Stop hook when In-Progress Phase field present and matching) | Tier 1 Phase Manifest Check Hook | ADR-090 §1 |

### Cycle 018 Essay-Outline Form Change Concepts (from Essay 017 / ADRs 092-093 / Domain Model Amendment 23) — NEW in v15.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Essay-Outline (RESEARCH artifact form — four sections: Abstract / Argument-Graph / Citation-Embedded Outline / References) | Research Skill (produces); Argument Auditor Agent (consumes as Essay-Outline genre per ADR-093) | ADR-092 §1; Amendment 23 |
| Abstract Section (Tier 1 of Essay-Outline pyramid; conclusions with stable identifiers matching Argument-Graph claim labels) | Research Skill (produces); Argument Auditor Agent (parses for Boundary 1 verification) | ADR-092 §1; ADR-093 §2; Amendment 23 |
| Argument-Graph (as artifact section — Tier 2; structured-bullet hierarchy with named identifiers C1/W1.1/E1.1.1; claim-warrant-evidence dependency structure) | Research Skill (produces); Argument Auditor Agent (consumes as **structured input**, not narrative) | ADR-092 §1, §4; ADR-093 §2; Amendment 23 |
| Citation-Embedded Outline (Tier 3; body subsections with MUST anchor to Argument-Graph identifiers or META reserved identifier) | Research Skill (produces with MUST anchor convention); Argument Auditor Agent (verifies anchors and developmental content per Boundary 2 + Reverse Boundary 2) | ADR-092 §1, §4; ADR-093 §2–§3; Amendment 23 |
| Pyramid Refinement (structural property — four sections form a refinement hierarchy; each level expands cleanly into the next) | Research Skill (produces under compliance); Argument Auditor Agent (verifies expansion fidelity at three boundaries plus reverse-direction) | ADR-092 §2; ADR-093 §2–§3; Amendment 23 |
| Pyramid Refinement Compliance Test (a/b/c/d operational tests) | Argument Auditor Agent (operates as audit verification target) | ADR-092 §3; ADR-093 §3 |
| Outline-Coherence Signal (stewardship trigger when pyramid does not read cleanly within cycle scope) | Research Skill (carries stewardship guidance in skill text); practitioner (decides at gate); Argument Auditor Agent (fires via P1 expansion-fidelity findings) | ADR-092 §6; Amendment 23 |
| Outline-Coherence Signal Discrimination Test (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect; Abstract orphans → trace to determine route) | Research Skill (encoded in skill text per ADR-092 §6); practitioner (applies discrimination) | ADR-092 §6 |
| Outline-Production Discipline (per-bullet conventional anchoring — Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves PROVENANCE CORRECTION / SCOPE QUALIFICATION) | Research Skill (encoded as production requirements) | ADR-092 §5; Amendment 23 |
| Synthesis Bullet (per-section synthesis content within Citation-Embedded Outline body subsections) | Research Skill (production requirement under Outline-Production Discipline; not structurally enforced per-bullet — structural verification operates at pyramid-expansion level) | ADR-092 §5; Amendment 23 |
| META Reserved Identifier (deliberate non-developmental anchor for methodology preamble / scope-setting / appendix-style body sections) | Research Skill (uses convention); Argument Auditor Agent (applies META audit-time review — P2 misclassification when developmental content present despite META anchor) | ADR-092 §4; ADR-093 §2; Amendment 23 |
| Boundary 1 (Abstract → Argument-Graph expansion-fidelity verification) | Argument Auditor Agent | ADR-092 §3; ADR-093 §3 |
| Boundary 2 (Argument-Graph → Citation-Embedded Outline expansion-fidelity verification) | Argument Auditor Agent | ADR-092 §3; ADR-093 §3 |
| Boundary 3 (Citation-Embedded Outline → References expansion-fidelity verification; severity coordinated with citation-auditor) | Argument Auditor Agent (reports as part of pyramid coverage map; severity P2 when citation-auditor ran on same artifact, P1 escalated otherwise) | ADR-093 §3 |
| Reverse Boundary 1 (top-level claim in Argument-Graph with no matching Abstract conclusion) | Argument Auditor Agent | ADR-093 §3 |
| Reverse Boundary 2 (body subsection with no Argument-Graph anchor) | Argument Auditor Agent | ADR-093 §3 |
| Pyramid Coverage Map (audit output — compact table or list showing the four-tier trace) | Argument Auditor Agent (produces in Section 1 of audit report when genre is Essay-Outline) | ADR-093 §4 |
| Expansion-Fidelity Findings (audit output subsection — P1/P2/P3 issues with pyramid coordinates) | Argument Auditor Agent (produces in Section 1 of audit report when genre is Essay-Outline) | ADR-093 §4 |
| Essay-Outline Genre (fourth named genre in argument-auditor's genre-aware Process) | Argument Auditor Agent (recognizes by document structure or dispatch brief) | ADR-093 §1 |
| Susceptibility-Surface Area (conceptual framework — area where framing-adoption susceptibility can occur in a research artifact's prose connective tissue) | Orchestrator (cross-cutting concept; load-bearing in ADR-092 §C1 trio) | ADR-092 Context; Amendment 23 |
| Available Instantiation (framing — Essay-Outline is the available instantiation of the structured-abstract-plus-synthesis family at RDD's cycle-rhythm scale; not "uniquely best by criterion comparison") | Orchestrator (carries the framing; RESEARCH Grounding Reframe Target 1 outcome) | ADR-092 Context, Rejected Alternative #5; Amendment 23 |
| Audit-Attestation (concept — audit-infrastructure-attested research artifacts; the AI-Prose Critique applies categorically and audit-attestation does not resolve it) | Orchestrator (carries the concept; relevant to scope-of-claim language) | Amendment 23 |
| AI-Prose Critique (categorical critique applying across audit-attested and unattested AI prose; Loop B finding) | None (background concept named in the cycle's research); Orchestrator (carries the concept in scope-of-claim) | Essay 017 Loop B; Amendment 23 |
| Rhetorical-vs-Logical Conflation (load-bearing distinction in Loop C critical-flaw argument: audit-extended prose cannot reliably separate rhetorical from logical force) | Orchestrator (carries the cross-cutting concept; load-bearing in ADR-092 Rejected Alternative #4) | ADR-092 Rejected Alternative #4; Amendment 23 |
| Structured-Abstract-Plus-Synthesis (parent research-artifact family of which Essay-Outline is the Available Instantiation) | None (named family); Orchestrator (carries the framing) | ADR-092 Context, Rejected Alternative #5; Amendment 23 |
| Cochrane Hybrid (rejected alternative — structured-abstract-plus-synthesis at full Cochrane-review scale; scale-incompatible with RDD's cycle rhythm) | None (rejected alternative — recorded in ADR-092 Rejected Alternative #5) | ADR-092 Rejected Alternative #5; Amendment 23 |
| Audit-Extended Prose (rejected alternative — within-prose CALIBRATION-bullet discipline; rejected on Loop C critical-flaw evidence) | None (rejected alternative — recorded in ADR-092 Rejected Alternative #4) | ADR-092 Rejected Alternative #4; Amendment 23 |
| CRESS Principles (Codemanship 2026-05-04 framework for context engineering — Centred / Relevant / Empirical / Source-Anchored / Structurally-Explicit; convergence with form-change ground via analogy per Target 2 caveat) | Orchestrator (carries the framework reference and Target 2 scope-of-claim caveat) | ADR-092 Context CRESS bullet; Amendment 23 |
| Accidental S-Small Divergence (CRESS-context concept named in research; categorical-vs-incidental treatment of Structurally-Explicit principle) | None (background concept) | Amendment 23 |
| Co-Illumination (cycle-entry feed-forward principle — two threads treated as potentially co-illuminating rather than independent) | None (cycle-design principle named at Cycle 018 entry) | Cycle 018 entry feed-forward; Amendment 23 |
| Dogfooded Both-Form Production (production method — agent produces both prose and outline forms in parallel for empirical form-comparison; candidate standing methodology amendment) | Research Skill (orchestrates when cycle is form-question-scoped — candidate standardization held); Orchestrator (carries the production-method framing) | ADR-092 Context (Cycle 018 production design); Amendment 23 |
| First-Mover Advantage (Constraint-Removal) (named methodology observation — when constraint-removal's response settles on a specific replacement candidate, the candidate acquires first-mover advantage; ADR-082 candidate amendment held for future cycle) | None (named methodology observation; ADR-082 amendment held for future cycle) | Reflections 017; Amendment 23 |
| Self-Referential Meta-Observation (cycle-finding observation — the prose argument auditor identified that the prose form demonstrated the framing-adoption phenomenon the essay describes; outline form's R2 framing audit produced zero new framing findings of this type) | None (cycle-finding observation; recorded in ADR-092 Context downstream-consumption bullet) | ADR-092 Context; Amendment 23 |
| Iterative-Audit Pattern (methodology observation — each correction pass introduced 3–5 new issues subsequent audits caught; pattern converged across rounds) | Argument Auditor Agent (carries the iteration); Citation Auditor Agent (carries the iteration); Research Skill (orchestrates iteration during research phase) | Cycle 018 RESEARCH cross-cutting observation; Amendment 23 |
| Input-Side vs. Output-Side Susceptibility (Kim et al. 2025 distinction — output-side reduction during production may be offset by input-side regressive-sycophancy effects in downstream consumers; held as Open Question 7) | None (named distinction; held as Open Question 7 with future-cycle empirical test candidate) | ADR-092 Neutral consequences; Amendment 23 |
| Methodology Compromise (transparency concept — methodology compromise vs. methodology violation; e.g., R2 + targeted Edits accepted vs. full R3 re-audit) | None (transparency concept named at RESEARCH boundary); Orchestrator (carries the concept in scope-of-claim language) | RESEARCH feed-forward signal 5; Amendment 23 |
| Bracket Existing Artifact (action — constraint-removal at research entry, treating existing artifacts as prior art rather than as default artifact shape) | Research Skill (composes constraint-removal Question Toolkit form per ADR-082) | Amendment 23; ADR-082 |
| Produce Both Forms (action — dogfooded form-comparison production method orchestrating parallel form production for form-question-scoped cycles) | Research Skill (orchestrates when invoked); Spike Runner Agent (may execute the parallel production runs) | Amendment 23 |

## Dependency Graph

```
Plugin Manifest (.claude-plugin/plugin.json)
│
├── Skills Layer ─────────────────────────────────────────────────
│   Orchestrator
│   ├── Research Skill ──dispatches──→ citation-auditor, argument-auditor, lit-reviewer, spike-runner
│   │      └── (v14.0 / ADR-087) validation-spike decision at research → discover gate
│   ├── Product Discovery Skill
│   ├── Model Skill
│   ├── Decide Skill ──dispatches──→ argument-auditor, conformance-scanner
│   │      └── (v14.0 / ADR-074 ext.) downstream sweep includes system-design.agents.md
│   ├── Architect Skill (also generates roadmap.md)
│   │      └── (v14.0 / ADR-084) per-artifact Pattern A/B judgment when restructuring
│   ├── Build Skill (outer loop; generates field-guide.md)
│   │       ├──mode-shift──→ Debug Skill (on unexpected failure)
│   │       ├──mode-shift──→ Refactor Skill (after green / stewardship)
│   │       └──mode-shift──→ Review Skill (at stewardship checkpoints)
│   │       └── session artifacts → .rdd/session/ (post-v14.0 migration)
│   ├── Debug Skill (standalone or via build mode-shift)
│   ├── Refactor Skill (standalone or via build mode-shift)
│   ├── Play Skill (optional; gamemaster mode of orchestrating agent)
│   ├── Synthesis Skill (usually terminal; conditional re-entry to Research)
│   │       └──dispatches──→ citation-auditor, argument-auditor
│   │       └──→ Research Skill (re-entry when structural experimentation surfaces new questions)
│   └── Conformance Audit Skill (utility) ──dispatches──→ conformance-scanner
│          └── (v14.0) /rdd-conform migrate-to-rdd subcommand
│
├── Agents Layer ───────────────────────────────────────────────── (8 agents)
│   citation-auditor (Sonnet) ──reads──→ essay/outline ──writes──→ audit at canonical path
│   argument-auditor (Sonnet) ──reads──→ artifact + source material ──writes──→ two-section audit (argument + framing)
│   lit-reviewer (Sonnet) ──reads──→ research question ──writes──→ research log entry
│   conformance-scanner (Sonnet) ──reads──→ ADRs, codebase ──writes──→ conformance debt table
│   orientation-writer (Sonnet) ──reads──→ artifact corpus ──writes──→ ORIENTATION.md
│   spike-runner (inherit) ──reads──→ spike question ──writes──→ research log entry [v14.0: also validation spikes]
│   research-methods-reviewer (Sonnet) ──reads──→ research question set ──writes──→ research design review
│   susceptibility-snapshot-evaluator (Sonnet) ──reads──→ AID susceptibility signals ──writes──→ Susceptibility Snapshot
│
└── Hooks Layer ────────────────────────────────────────────────── (7 hooks; all advisory in v0.8.3)
    invariant-reminder (PreToolUse: Write|Edit on docs/) → context injection
    epistemic-gate-enforcer (Stop during RDD phase) → reminder injection
    skill-activator (UserPromptSubmit) → skill suggestion + override prevention
    orientation-trigger (PostToolUse: Write on key artifacts) → regeneration reminder
    sizing-check (PostToolUse: Write on docs/) → sizing flag
    tier1-verify-dispatch (PostToolUse: Agent) → dispatch log append at .rdd/dispatch-log.jsonl
    tier1-phase-manifest-check (Stop) → ADVISORY compound check; never blocks (per ADR-088)

Harness Layer Configuration (post-v14.0 paths):
    hooks/manifests/tier1-phase-manifest.yaml → declarative per-phase Tier 1 mechanism specification
    .github/ISSUE_TEMPLATE/hook-failure.md → hook failure issue template
    .rdd/dispatch-log.jsonl → session-scoped dispatch log (gitignored)
    .rdd/.migration-version → mode marker
```

**Skill-level edges:** Orchestrator → all phase skills + Conformance Audit Skill; Build → Debug, Refactor, Review (mode-shift, not dispatch); Synthesis → Research (conditional re-entry); Play and Debug/Refactor dispatch no specialist subagents.

**Skill-to-agent dispatch edges:** All Tier 1 dispatches use the canonical prompt skeleton per ADR-065 with literal `Output path:` line at structurally privileged position. Phase skills dispatch susceptibility-snapshot-evaluator at phase-end (per ADR-065 Fix 1, NOT orchestrator-centralized). Research dispatches research-methods-reviewer before each loop after substantial revision (per ADR-060). Argument-auditor dispatches include framing audit per ADR-061.

**Harness Layer edges:** PostToolUse(Agent) → Dispatch Log; Stop → Compound Check (advisory in v0.8.3); Conformance Audit Skill → Manifest, `.rdd/` directory creation, reference substitution.

**Inter-skill communication:** Skills communicate through artifact files at known paths.

```
essay → product-discovery.md → domain-model.md → ADRs + scenarios + interaction-specs.md
                                                     ↓
                              system-design.md + system-design.agents.md + roadmap.md
                                                     ↓
                                       code + field-guide.md → field-notes.md
                                                     ↓
                              [full artifact trail] → synthesis outline → synthesis essay (user)
                                                     ↓
                                       ORIENTATION.md (derived at milestones)

field-notes.md feedback loop: → product-discovery.md (update mode), scenarios (missing),
                                interaction-specs.md (gaps), research (new questions)
```

**Layering rules:** Orchestrator outer (coordination); skills inner (phase execution); skills never reference orchestrator content (follow protocol implicitly); no cycles.

## Integration Contracts

The full set of integration contracts from v13.0 is preserved with v14.0 amendments. Key contracts:

### Orchestrator → Each Phase Skill
**Protocol:** Orchestrator invokes each skill via `/skill-name`. Skill runs phase, produces artifact, presents at epistemic gate. Orchestrator resumes after gate.
**Shared types:** Five-step gate protocol (artifact + 2-3 prompts + user response + discrepancy noting + proceed query).
**Error handling:** Non-generative approval triggers gentle redirect with prompts re-presented.
**Owned by:** Orchestrator defines protocol; each skill implements.

### Phase Skill → Next Phase Skill (via artifacts)
**Protocol:** File-based. Each skill writes artifact to known path; next skill reads.
**Shared types:** Markdown files at known paths: essay (`./docs/essays/NNN-*.md`), product-discovery (`./docs/product-discovery.md`), domain-model (`./docs/domain-model.md`), ADRs (`./docs/decisions/adr-NNN-*.md`), scenarios (`./docs/scenarios.md`), system-design (`./docs/system-design.md`), system-design.agents (`./docs/system-design.agents.md`), roadmap (`./docs/roadmap.md`), field guide (`./docs/references/field-guide.md`), interaction-specs (`./docs/interaction-specs.md`), field notes (`./docs/essays/reflections/field-notes.md`).
**Error handling:** Missing artifact → next skill prompts user.
**Owned by:** Each skill owns its output format.

### Product Discovery Skill → Model / Decide / Architect Skill (via product-discovery.md)
**Protocol:** File-based. Downstream skills read for stakeholder context, vocabulary, value tensions, assumption inversions.
**Shared types:** Stakeholder Map, Jobs/Mental Models, Value Tensions, Assumption Inversions, Product Vocabulary Table.
**Error handling:** Missing product discovery → downstream skill proceeds without that input, notes gap.
**Owned by:** Product Discovery Skill owns artifact; consuming skills own interpretation.

### External Review Re-entry (both primary documents)
**Protocol:** Reviewer feedback on `product-discovery.md` → re-enter at PRODUCT DISCOVERY → forward-propagate; feedback on `system-design.md` or `system-design.agents.md` → re-enter at ARCHITECT (Design Amendment) → propagate to BUILD if in progress.
**Shared types:** Reviewer feedback in natural language; receiving skill interprets.
**Error handling:** Async feedback → orchestrator state notes pending review.
**Owned by:** Orchestrator defines re-entry; receiving skill interprets.

### Decide Skill → Play Skill (via interaction-specs.md)
**Protocol:** File-based. Decide writes interaction-specs after scenarios; Play reads for playable surface.
**Shared types:** Interaction specs organized by stakeholder (super-objective + task + interaction mechanics).
**Error handling:** Missing interaction specs → Play notes gap, offers choice.
**Owned by:** Decide owns format; Play owns consumption.

### Play Skill → Discover/Decide/Research Skills (via field-notes.md)
**Protocol:** File-based feedback loop. Play writes field notes with six categories; subsequent cycles' Discover (update mode), Decide, Research read.
**Shared types:** Field notes categorized: missing scenario, usability friction, new question, challenged assumption, delight, interaction gap.
**Owned by:** Play owns format; receiving skills own interpretation.

### Phase Skill → Specialist Subagent (dispatch protocol)
**Protocol:** Phase skill dispatches via Task tool with file paths in + canonical `Output path:` line. Agent runs in isolation, writes output to canonical path. Skill resumes by reading output.
**Shared types:** Input: file paths; Output: structured audit at canonical path.
**Error handling:** Agent failure → graceful degradation. P1 fixed; P2 surfaced at gate; P3 noted/deferred.
**Owned by:** Each phase skill owns dispatch decision; each agent owns output format.

### Hook → Agent/Skill (context injection protocol)
**Protocol:** Hooks fire on system events; inject context via stdout. JSON in; text out. Exit 0 always (no blocking — all hooks advisory in v0.8.3).
**Shared types:** Hook input JSON per Claude Code spec; plain text output.
**Error handling:** Hook failure non-fatal; operation proceeds.
**Owned by:** `hooks/hooks.json` defines hooks; scripts implement.

### Phase Skill → Susceptibility Snapshot Evaluator Agent (per-phase dispatch — ADR-065 Fix 1)
**Protocol:** Each phase skill dispatches at phase-end via Task tool using canonical prompt skeleton. Dispatch instruction at structurally privileged position (bottom third). Skeleton: brief + literal `Output path:` line + phase-specific context. **Path post-v14.0:** `.rdd/audits/susceptibility-snapshot-{cycle}-{phase}.md` (pre-migration: `.rdd/audits/...`).
**Shared types:** Recorded signals + phase identifier + canonical output path.
**Error handling:** Agent failure → Stop hook's manifest check catches missing artifact (advisory in v0.8.3).
**Owned by:** Each phase skill owns dispatch instruction; agent owns evaluation methodology; manifest check hook owns verification.

### PostToolUse(Agent) → Dispatch Log (Harness Layer dispatch verification — ADR-064)
**Protocol:** On `PostToolUse` with `tool_name == "Agent"`, hook extracts `subagent_type` and `Output path:`. If Tier 1, appends JSONL entry to `.rdd/dispatch-log.jsonl` (post-v14.0 migration; pre-migration `.rdd/...`). Always exits allow.
**Shared types:** Hook input JSON; JSONL log entry schema `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`.
**Error handling:** Fails-Safe-to-Allow with stderr GitHub issue surfacing.
**Owned by:** Hook script owns extraction; skill files own canonical skeleton; manifest-check hook reads log.

### Stop → Compound Check (Harness Layer verification — ADR-064 as updated by ADR-088)
**Protocol:** On Stop, hook reads phase from `.rdd/cycle-status.md` (post-migration; pre-migration `.rdd/...`); reads cycle number; **checks `.rdd/.migration-version` for mode** (post-v14.0); loads manifest; runs structural assertions + dispatch log cross-reference for each required mechanism. **Per ADR-088 (v0.8.3): emits model-visible ADVISORY rather than block on failure**, naming the failing mechanism with four-failure-mode classification. Revision-aware reminder (mtime comparison) emitted as non-blocking notice. **Per ADR-090: In-Progress Phase predicate suppresses per-phase manifest advisory when field present and matching.**
**Shared types:** Hook input JSON; advisory output (allow + model-visible message); compound-check JSONL log; advisory message format with four-failure-mode classification.
**Error handling:** Fails-Safe-to-Allow on internal error.
**Owned by:** Hook script owns logic; manifest owns specifications; dispatch log owns session record; phase skills produce artifacts.

### Orchestrator → Gate Reflection Note (User-Tooling Layer — ADR-066)
**Protocol:** At each phase boundary after AID conversation, orchestrator composes gate reflection note at `.rdd/gates/{cycle}-{phase-from}-to-{phase-to}.md` (post-v14.0; pre-migration `.rdd/gates/...`) before declaring phase complete. Five required sections per ADR-066 template.
**Shared types:** Markdown file at canonical path; manifest entry per ADR-063 with `min_bytes: 800`.
**Error handling:** Missing note → Stop hook's manifest check emits advisory (v0.8.3).
**Owned by:** Orchestrator (pipeline); each phase skill (standalone invocation); manifest check hook (verification).
**Known limitation:** Reframe-derailed gate failure mode — manifest check verifies structural floor, not epistemic substance. Susceptibility Snapshot at the same boundary is the complementary defense.

### Orchestrator → Grounding Reframe Protocol (Extended — ADR-068)
**Protocol:** Two triggers — (1) unassessable sycophancy risk; (2) significant susceptibility snapshot finding meeting three significance properties (specificity, actionability, in-cycle applicability). For trigger 2, orchestrator reads each finding and applies the properties; meeting all three triggers the protocol; not meeting feeds forward as cycle-status signal.
**Shared types:** Snapshot finding + three significance properties + protocol body.
**Error handling:** Significance decision is judgment; misclassification recoverable via feed-forward.
**Owned by:** Orchestrator owns trigger decision; agent owns finding production.

### Conformance Audit Skill → `/rdd-conform migrate` and `/rdd-conform migrate-to-rdd` (ADR-070, ADR-085)
**Protocol:** Two one-shot operations; idempotent via marker files. `migrate` (legacy ADR-070): `docs/` → `.rdd/`. `migrate-to-rdd` (Cycle 017 / v14.0): `.rdd/` → `.rdd/` per ADR-085 §4 ten-step sequence; **explicitly includes hook test fixtures**: `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh`. Both refuse on uncommitted changes; produce summary report; `.gitignore` updates.
**Shared types:** Filesystem operations + marker file.
**Error handling:** Idempotent; refuses uncommitted changes; partial migration recoverable.
**Owned by:** Conformance Audit Skill owns subcommands; git owns reversibility.

### Stop Hook → Advisory Notice (always — post-v0.8.3 per ADR-088)
**Protocol:** **Post-v0.8.3 (ADR-088): all mode operations emit advisory, never block.** Pre-migration corpora additionally lack the dispatch-log compound check (advisory-without-compound-check). Migrated corpora have advisory-with-compound-check. Notice format: model-visible advisory + stderr line.
**Shared types:** Stderr text; model-visible message; session suppression marker.
**Error handling:** Notice is ignorable.
**Owned by:** Tier 1 Phase Manifest Check Hook owns emission.

### Hook Script → GitHub Issue Template (Fails-Safe-to-Allow surfacing — ADR-064)
**Protocol:** On hook internal error, emit non-blocking stderr notice with hook name, diagnostic, and pre-populated GitHub issue URL `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md`.
**Shared types:** Stderr text + GitHub issue URL.
**Error handling:** Stderr notice converts silent-fail-to-allow into visible-and-ignorable.
**Owned by:** Both Tier 1 hooks; Hook Failure Issue Template; maintainer.

### Cycle 016 (v13.0) Integration Contracts

**Orchestrator → cycle-status.md (in-progress-gate field set/clear):** Set at AID-gate start ("Before we move on — reflection time."); clear at gate-reflection-note write. ADR-079 lifecycle.

**Tier 1 Phase Manifest Check Hook → cycle-status.md (Cycle Stack parser + preconditions):** Parse `## Cycle Stack` section; identify top entry; read per-entry fields including `**In-progress gate:**`, `**Skipped phases:**`, `**Paused:**`, `**Cycle type:**`, `**Pause-on-spawn policy:**`. ADR-078, ADR-079, ADR-080, ADR-081.

**Architect Skill → system-design.md (fitness property production):** ARCHITECT gate refuses advance unless qualitative claims have adjacent `**Fitness:**` properties. ADR-076.

**Build Skill → system-design.md / system-design.agents.md (fitness property consumption via ADR-077 prompt 4):** Applicability check enumerates declared fitness properties verbatim or records "no declared fitness properties for this module."

**Decide Skill → ADRs (supersession header writer):** New ADR supersedes earlier ADR → mechanical edit adds supersession-header blockquote. Body sections not edited. ADR-074.

**Decide Skill → downstream current-state artifacts (supersession sweep, Step 3):** Sweep `system-design.md`, `system-design.agents.md` (v14.0 addition), `ORIENTATION.md`, `domain-model.md`, `field-guide.md` — replace citations of superseded ADR.

**Research Skill → Research Methods Reviewer Agent (extended 4-criterion dispatch):** Agent receives question articulation + constraint-removal response as one "question set under review"; evaluates four criteria (need-vs-artifact framing, embedded conclusions, prior-art treatment, incongruity surfacing); writes report at canonical path `.rdd/audits/research-methods-question-set-<NNN>.md` (post-v14.0; pre-migration `.rdd/...`). ADR-082.

**Conform Skill → cycle-status.md (cycle-shape audit migration):** New audit operation; reads legacy single-entry cycle-status.md; prompts user for missing fields; writes migrated entry preserving prose body byte-identical. ADR-081.

### Cycle 017 (v14.0) Integration Contracts

#### Architect Skill → system-design.md / system-design.agents.md (companion-file structure decision)
**Protocol:** When restructuring an existing Tier 2 readable artifact, Architect Skill applies per-artifact judgment criterion (ADR-084): estimate audience-tagged volume relative to human-facing baseline; below ~50% indicator → Pattern A; above → Pattern B. The choice and judgment basis are recorded in the system-design's amendment-log entry (or in the architect-phase gate reflection note). For Pattern B, the companion file at `<artifact>.agents.md` is created alongside the human-facing artifact; cross-references between the two are maintained.
**Shared types:** Two markdown files (`<artifact>.md` and `<artifact>.agents.md`); cross-reference convention (relative paths within `docs/`); amendment-log entry naming the choice.
**Error handling:** When neither pattern is clearly preferable (~50% ± estimation uncertainty), the choice defaults to Pattern A (single document with audience-tagged sections); rationale is recorded.
**Owned by:** Architect Skill (judgment); ADR-084 (catalog and threshold); the artifact author at the cycle producing the restructuring (records).

#### Research Skill → Spike Runner Agent (validation spike at research → discover gate)
**Protocol:** When the practitioner decides to run a validation spike at the research → discover gate (per ADR-087 §3), Research Skill dispatches Spike Runner Agent with a focused research question composed against the essay's specific claim under test. Spike runs in `./scratch/spike-*/`; findings written as research log entry. Spike findings integrated into the essay before essay-as-checkpoint advance.
**Shared types:** Research question + scratch directory path; research log entry; updated essay sections.
**Error handling:** Spike fails to surface findings → recorded in research log as "spike attempted, results inconclusive"; cycle proceeds with documented uncertainty.
**Owned by:** Research Skill (orchestrates dispatch); Spike Runner Agent (executes); user (decides whether to run spike).

#### Conformance Audit Skill → `/rdd-conform migrate-to-rdd` (`.rdd/` migration)
**Protocol:** Per ADR-085 §4 ten-step operation. Hook test fixtures path-substitution explicitly enumerated. Idempotent via `.rdd/.migration-version` marker. Refuses uncommitted changes. Produces summary report.
**Shared types:** Filesystem operations + `.rdd/.migration-version` marker.
**Error handling:** Idempotent; partial migration recoverable; rollback git-based.
**Owned by:** Conformance Audit Skill owns subcommand; git owns reversibility.

#### Tier 1 Phase Manifest → manifest path-template values (ADR-085 path migration)
**Protocol:** All `path_template` values updated from `.rdd/{audits,gates}/...` to `.rdd/{audits,gates}/...` during `/rdd-conform migrate-to-rdd` execution. Substitution-token semantics unchanged.
**Shared types:** YAML manifest file with updated path values.
**Error handling:** Pre-migration corpora retain legacy paths; backward-compat in hook scripts handles both.
**Owned by:** ADR-085; Conformance Audit Skill performs the substitution.

## Fitness Criteria

The full v13.0 fitness criteria table (Cycle 1–016, 184 entries) is preserved per ADR-074 body immutability. Cycle 017 / v14.0 fitness criteria are appended below.

**Note on the Cycle 017 amendment to the structural-prevention claim:** Several v12.0 fitness criteria reference the compound check's State-C structural-impossibility claim. Per ADR-088, these claims are amended to **structural-detectability** in advisory disposition. Specifically: "Compound check catches sophisticated State C in enforcement mode" (v12.0) is updated to "Compound check makes sophisticated State C structurally detectable; advisory output naming fabrication signal surfaces on next Stop event"; the criterion measure changes from "Stop hook blocks on detection" to "Stop hook emits model-visible advisory on detection"; threshold changes from "block emitted" to "advisory emitted with four-failure-mode classification". The historical body of the v12.0 fitness criteria entries is preserved as historical record per ADR-074; the amended claim is encoded in the v14.0 entries below.

### Cycle 017 (v14.0) Fitness Criteria

| Criterion | Measure | Threshold | Derived From |
|-----------|---------|-----------|--------------|
| Outcome Test is named in orchestrator cross-cutting principles | rdd/SKILL.md contains the Outcome Test as a cross-cutting principle with the four named exception conditions | Outcome Test text + four exception conditions present | ADR-083 |
| In-place-first default is named as intervention move | Orchestrator skill text describes in-place-first as default for human-reading failures | Default-intervention-move language present | ADR-083 §2 |
| Bolt-on / felt-additional signal is named as failure-mode signal | Orchestrator skill text describes the felt-additional quality as a failure-mode signal | Signal description present | ADR-083 §3 |
| Pattern A / Pattern B catalog is documented in orchestrator | rdd/SKILL.md Three-Tier Classification or Cross-Cutting Principles section documents the two patterns + per-artifact judgment + ~50% indicator + directory-level rejection | Catalog present with all four elements | ADR-084 |
| `system-design.agents.md` exists at predictable path | File at `./docs/system-design.agents.md` per Pattern B convention | File exists with one-sentence orientation lead at top | ADR-084 (this design's canonical exemplar) |
| `system-design.md` is human-facing (slim, F-pattern lead, brief modules) | system-design.md word count < 30% of system-design.agents.md word count | Slim ratio satisfied (verifiable post-restructure) | ADR-084 + Cycle 017 ARCHITECT |
| Cross-references between system-design.md and system-design.agents.md are maintained | Both files reference each other at convention paths | Bidirectional cross-references present | Cycle 017 ARCHITECT design judgment |
| `.rdd/` directory placement is documented in orchestrator | rdd/SKILL.md describes process-vs-product separation via dotfile convention; `.rdd/` is corpus-visible (not hidden) | Process-vs-product framing present in orchestrator | ADR-085 |
| `/rdd-conform migrate-to-rdd` subcommand exists | rdd-conform SKILL.md describes migrate-to-rdd subcommand with ten-step operation | Subcommand documented | ADR-085 §4 |
| `/rdd-conform migrate-to-rdd` is idempotent | Re-running on migrated corpus no-ops via `.rdd/.migration-version` marker check | Idempotency verified by `test_conform_migrate_to_rdd_idempotent.sh` | ADR-085 |
| `/rdd-conform migrate-to-rdd` includes hook test fixtures in substitution sweep | Migration's reference-substitution sweep covers `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh` | All eight files post-migration grep on `.rdd/` returns zero matches | ADR-085 §10 |
| `.rdd/` directory organization audit scope present in `/rdd-conform` | rdd-conform SKILL.md includes the audit scope description | Audit scope documented | ADR-085 §6 |
| Stop-hook manifest check is advisory across all modes (never blocks) | Hook code returns exit 0 (or equivalent allow disposition) on every manifest-check failure | `test_hook_manifest_check_advisory.sh` confirms exit 0 + stderr advisory on simulated missing artifact | ADR-088 |
| Compound check fabrication signal surfaces as advisory | Stop hook emits model-visible advisory naming fabrication signal when artifact exists without matching dispatch log entry | Fabrication signal surfaced; agent surfaces to user; never blocks | ADR-088 |
| State-C claim language is amended to structural detectability | system-design.md, system-design.agents.md, ORIENTATION.md, and orchestrator skill reference the State-C claim as "structurally detectable" not "structurally impossible" where the v0.8.3 enforcement disposition applies | Updated language present in all four artifacts post-deferred-sweep discharge | ADR-088 §5 |
| Skill-text anchoring is named as load-bearing enforcement layer (post-v0.8.3) | system-design.md, system-design.agents.md, and orchestrator skill describe ADR-065's anchored dispatches as the primary mechanism with Harness Layer as visibility/detection | Updated language present | ADR-088 §3 |
| Three-Tier Classification's Harness Layer technique row reads "advisory disposition" | system-design.md / system-design.agents.md classification table or paragraph | Harness Layer technique described as advisory; substrate primacy preserved | ADR-089 |
| In-Progress Phase field role is documented as advisory-noise suppressor | system-design.md, system-design.agents.md, ORIENTATION.md, orchestrator skill, and cycle-status.md schema describe the field as advisory-noise suppression / optional / not correctness-critical | Updated language present in all five locations | ADR-090 |
| Conformance audit emits soft note for missing In-Progress Phase field | rdd-conform skill text describes the soft-note posture (informational, not finding) | Soft-note language present | ADR-090 §5 |
| Validation spike step is text-anchored at research → discover gate | skills/research/SKILL.md contains step in workflow position immediately before gate's reflection-time prompt | Step present and text-anchored at gate position | ADR-087 §3 |
| Validation-spike trigger question is felt (interaction-grounding + possibility-space-pruning) | skills/research/SKILL.md describes the trigger question with felt-judgment language | Trigger question + rationale-recording requirement present | ADR-087 §3 |
| Validation-spike rationale-recording is required | skills/research/SKILL.md specifies that prototype-or-no-prototype decision is recorded with rationale in research log | Rationale-recording requirement present | ADR-087 §3 |
| Tightly-scoped prototyping is named in anti-elaboration family | system-design.md or system-design.agents.md or orchestrator skill describes the family (Tidy First / YAGNI + ADR-077 + ADR-087 §3) | Family framing present | ADR-087 §3a |
| Cycle-as-instance reflection is encoded in scope-of-claim language | system-design.md or system-design.agents.md or ADR-069 references include the cycle-as-instance language | Standing caveat present | ADR-087 §4 |
| AI-as-orienter non-adoption is documented in orchestrator | rdd/SKILL.md or scope-of-claim section names AI-as-orienter as non-adopted with operational-criterion problem and three future-cycle conditions | Non-adoption documented | ADR-086 |
| Methodology scope-of-claim is documented with the v0.8.3 advisory amendment | system-design.md, system-design.agents.md, and orchestrator skill describe the positive scope (competent first-order analysis, Tier 1 mechanisms, conversational mechanisms, compound defense, architectural drivers) and negative scope including the v0.8.3 amendment ("compound check's structural guarantee surfaces as advisory rather than block; pre-migration corpora operate without harness-layer compound verification") | Updated scope-of-claim present | ADR-069 + ADR-088 |
| Cycle 017 modules: zero new code modules introduced | Module count in dependency graph after Cycle 017 BUILD == module count before Cycle 017 BUILD | Module count unchanged | Cycle 017 ARCHITECT design judgment |
| Cycle 017 amended modules: max responsibility growth ≤ 8 | Each amended module gains ≤ 8 new responsibility-matrix entries from Cycle 017 concepts | Decide Skill (largest amendment scope) gains ≤ 8 entries | ADR-076 prevention principle (applied to ARCHITECT) |
| Cycle 017 dependency graph has no cycles | Walk each new edge; verify no return path within v14.0 additions | Zero cycles detected | Architecture invariant |
| Cycle 017 deferred sweeps discharged | system-design.md and ORIENTATION.md reference `.rdd/` paths; ADR-064/067/070 references describe advisory disposition | Discharge verifiable post-restructure | ADR-074 §3; ADR-085 / ADR-088 / ADR-089 deferred-sweep status |

### Cycle 018 (v15.0) Fitness Criteria

| Criterion | Measure | Threshold | Derived From |
|-----------|---------|-----------|--------------|
| Essay-Outline form is documented in `/rdd-research` skill | `skills/research/SKILL.md` contains the four-section template (Abstract / Argument-Graph / Citation-Embedded Outline / References) with structured-bullet hierarchy + named identifier conventions | Four-section template + Argument-Graph format conventions present | ADR-092 §1, §4 |
| Outline-Production Discipline is encoded as production requirements | `skills/research/SKILL.md` specifies Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves (PROVENANCE CORRECTION, SCOPE QUALIFICATION) | Discipline requirements present in skill text | ADR-092 §5 |
| Outline-Coherence Signal stewardship guidance is encoded with discrimination test | `skills/research/SKILL.md` describes Boundary 1 → scope-suspect routing and Boundary 2 → discipline-suspect routing | Discrimination test present in skill text | ADR-092 §6 |
| MUST anchor convention is encoded | `skills/research/SKILL.md` specifies that every developmental Citation-Embedded Outline body subsection MUST end with a parenthetical anchor to one or more Argument-Graph node identifiers; `META` reserved identifier is named | MUST anchor + META language present | ADR-092 §4 |
| Filename pattern is `essay-outline-NNN-<slug>.md` | `skills/research/SKILL.md` artifact-output instruction specifies `./docs/essays/essay-outline-NNN-<slug>.md` | Filename pattern present in skill text | ADR-092 §1 |
| Prior "if you can't explain it clearly in prose..." line is revised | `skills/research/SKILL.md` no longer contains the verbatim phrase that contradicts the form change | Phrase absent (or revised) post-BUILD | ADR-092 §10; cycle-status §From DECIDE signal 3 |
| Argument-auditor recognizes Essay-Outline as fourth named genre | `agents/argument-auditor.md` Process section lists four genres: research essays, ADRs, synthesis outlines, Essay-Outline | Four-genre list present | ADR-093 §1 |
| Argument-auditor performs pyramid graph-traversal on Essay-Outline genre | `agents/argument-auditor.md` includes a new Process step (between the five within-document verifications and the audit output) specifying pyramid graph-traversal across four tiers; references ADR-092 §3 and ADR-093 §2 | New Process step present with required references | ADR-093 §2, §5 |
| Argument-auditor verifies expansion fidelity at three boundaries plus reverse-direction | `agents/argument-auditor.md` Process step specifies Boundary 1 (Abstract → Argument-Graph), Boundary 2 (Argument-Graph → Citation-Embedded Outline), Boundary 3 (Citation-Embedded Outline → References with citation-auditor severity coordination), Reverse Boundary 1, Reverse Boundary 2 | All five boundary verifications named | ADR-093 §3 |
| Argument-auditor applies META audit-time review | `agents/argument-auditor.md` Process step specifies P2 misclassification reporting when META-anchored sections contain developmental claim/warrant/evidence bullets | META audit-time review present | ADR-092 §4; ADR-093 §2 |
| Argument-auditor output template adds pyramid coverage map + expansion-fidelity findings for Essay-Outline genre | `agents/argument-auditor.md` output template specifies pyramid-coverage-map subsection and expansion-fidelity-findings subsection in Section 1; both present only when genre is Essay-Outline | Output template extensions present | ADR-093 §4 |
| Argument-auditor behavior on pre-ADR-093 genres is unchanged | `agents/argument-auditor.md` continues to specify the five within-document verifications + framing audit per the existing two-section output template for research essays, ADRs, synthesis outlines; Essay-Outline-specific Process step does NOT fire for these three genres | Backward compatibility preserved; verified by skill-text inspection | ADR-093 §6 |
| Boundary 3 severity coordination is encoded | `agents/argument-auditor.md` specifies P2 severity when citation-auditor has already run on same artifact; P1 escalated otherwise with note naming the citation-auditor as primary verifier | Severity coordination rule present | ADR-093 §3 |
| Cycle 018 modules: zero new code modules introduced | Module count in dependency graph after Cycle 018 BUILD == module count before Cycle 018 BUILD | Module count unchanged | Cycle 018 ARCHITECT design judgment |
| Cycle 018 amended modules: max responsibility growth per module ≤ 20 | Research Skill and Argument Auditor Agent each gain ≤ 20 new responsibility-matrix entries from Cycle 018 concepts | Largest amendment (Research Skill or Argument Auditor) ≤ 20 entries | ADR-076 prevention principle |
| Cycle 018 dependency graph has no new cycles | Walk each new edge introduced by Cycle 018 amendments (none expected — amendments do not introduce new dependency edges); verify no return path within v15.0 additions | Zero new edges; zero cycles detected | Architecture invariant |
| Susceptibility-Surface Area concept is named in orchestrator | `skills/rdd/SKILL.md` or `system-design.agents.md` references Susceptibility-Surface Area in a cross-cutting concept position | Concept named in skill text or design | ADR-092 Context; Amendment 23 |
| Available Instantiation framing is named in orchestrator or system-design | `skills/rdd/SKILL.md` or `system-design.agents.md` references Available Instantiation as the framing for Essay-Outline relative to the structured-abstract-plus-synthesis family | Framing named in skill text or design | ADR-092 Context; Amendment 23 |
| CRESS Principles framework reference and scope-of-claim caveat encoded | `skills/rdd/SKILL.md` or `system-design.agents.md` or ADR-092 carries the CRESS-Empirical bullet with the Target 2 scope-transfer-via-analogy caveat | CRESS reference + scope-of-claim caveat present | ADR-092 Context CRESS bullet; Cycle 018 RESEARCH Target 2 |
| Rhetorical-vs-Logical Conflation concept is named in orchestrator or ADR-092 | `skills/rdd/SKILL.md` or `system-design.agents.md` or ADR-092 Rejected Alternative #4 names the conflation as load-bearing in the Loop C critical-flaw argument | Concept named in skill text or ADR | ADR-092 Rejected Alternative #4; Amendment 23 |
| Citation-comparison scope-of-claim caveat encoded | ADR-092 Rejected Alternative #4 (or §7 scope-of-claim section) names the citation-comparison evidence as scoped to Cycle 018's prose-production method | Scope caveat present in ADR-092 | ADR-092 §7; Cycle 018 RESEARCH Target 3 |
| Kim et al. Open Question 7 (input-side susceptibility) encoded as Neutral consequence | ADR-092 Neutral consequences section names the input-side susceptibility question with future-cycle empirical test framing | Open question encoded in ADR-092 | ADR-092 Consequences §Neutral |
| ADR-092 + ADR-093 ship together at BUILD | The same BUILD pass that lands ADR-092's `/rdd-research` skill-text edit also lands ADR-093's `agents/argument-auditor.md` skill-text edit | Both skill-text edits landed in the same BUILD pass (verifiable by commit inspection at release) | Cycle 018 scenarios §Cross-ADR Integration |

## Test Architecture

The full v13.0 boundary integration tests, invariant enforcement tests, and test layers are preserved.

### Cycle 017 (v14.0) Boundary Integration Tests

| Dependency Edge | Integration Test | What It Verifies |
|----------------|-----------------|------------------|
| Conformance Audit Skill → `/rdd-conform migrate-to-rdd` | `test_conform_migrate_to_rdd_basic.sh` | The migrate-to-rdd subcommand creates `.rdd/` directory structure, moves artifacts, performs reference substitution, writes marker, produces summary report on a fresh migration |
| Conformance Audit Skill → migrate-to-rdd idempotency | `test_conform_migrate_to_rdd_idempotent.sh` | Re-running on migrated corpus no-ops via `.rdd/.migration-version` marker check |
| Conformance Audit Skill → migrate-to-rdd hook test fixture inclusion | `test_conform_migrate_to_rdd_hook_fixtures.sh` | Hook test fixtures path-substitution sweep covers all eight named files; post-migration grep returns zero matches for `.rdd/` |
| Tier 1 Phase Manifest Check Hook → advisory disposition | `test_hook_manifest_check_advisory.sh` | Simulated missing artifact produces stderr advisory + exit 0 (never blocks) |
| Tier 1 Phase Manifest Check Hook → In-Progress Phase predicate | `test_hook_in_progress_phase_suppresses_advisory.sh` | When `**In-progress phase:**` field present and matching, hook suppresses per-phase manifest advisory; other manifest checks continue to fire |
| Tier 1 Phase Manifest Check Hook → path fallback | `test_hook_reads_rdd_path_with_legacy_fallback.sh` | Hook reads `.rdd/cycle-status.md` first; falls back to `.rdd/cycle-status.md` if absent |
| Tier 1 Verify Dispatch Hook → `.rdd/dispatch-log.jsonl` writes | `test_hook_dispatch_log_writes_rdd_path.sh` | Post-migration, hook writes dispatch entries to `.rdd/dispatch-log.jsonl` |
| Architect Skill → companion file creation per Pattern B | `test_architect_companion_file_pattern_b.sh` | When ARCHITECT decides Pattern B, the companion file is created at `<artifact>.agents.md` with one-sentence orientation lead at top; bidirectional cross-references present |
| Decide Skill → supersession sweep includes companion file | `test_decide_supersession_sweep_includes_companion.sh` | Downstream-sweep target list includes `system-design.agents.md` alongside system-design.md, ORIENTATION.md, domain-model.md, field-guide.md |
| Research Skill → validation-spike step at gate | `test_research_validation_spike_step_anchored.sh` | skills/research/SKILL.md contains the validation-spike decision step at the research → discover gate position with felt-trigger question and rationale-recording requirement |
| `system-design.md` and `system-design.agents.md` version sync | `test_system_design_companion_version_sync.sh` | Both files carry the same `Version:` field, updated atomically |

### Cycle 018 (v15.0) Boundary Integration Tests

| Dependency Edge | Integration Test | What It Verifies |
|----------------|-----------------|------------------|
| Research Skill → Essay-Outline production | `test_essay_outline_form_documented.sh` | `skills/research/SKILL.md` contains the four-section Essay-Outline template (Abstract / Argument-Graph / Citation-Embedded Outline / References) with structured-bullet hierarchy + named identifier example (C1/W1.1/E1.1.1); Outline-Production Discipline encoded with Synthesis Bullets, CONFIDENCE-LEVEL tags, named meta-moves; MUST anchor convention + META reserved identifier named; Outline-Coherence Signal stewardship guidance + discrimination test present; filename pattern `essay-outline-NNN-<slug>.md`; the "if you can't explain it clearly in prose..." line is revised or removed |
| Argument Auditor Agent → Essay-Outline genre handling | `test_argument_auditor_essay_outline_genre.sh` | `agents/argument-auditor.md` Process section lists four named genres (research essays, ADRs, synthesis outlines, Essay-Outline); the Essay-Outline Process step references ADR-092 §3 and ADR-093 §2; pyramid graph-traversal + expansion-fidelity verification (Boundary 1/2/3 + Reverse Boundary 1/2) named; META audit-time review (P2 misclassification) encoded; output template specifies pyramid-coverage-map and expansion-fidelity-findings subsections in Section 1 for Essay-Outline genre only; behavior on the three pre-ADR-093 genres unchanged |
| Research Skill → Argument Auditor Agent (Essay-Outline genre dispatch) | `test_research_dispatches_argument_auditor_essay_outline_genre.sh` | When `/rdd-research` dispatches the argument-auditor on an Essay-Outline primary document, the dispatch brief names Essay-Outline as the genre (or the document structure is recognizable as four-section Essay-Outline); the canonical `Output path: .rdd/audits/argument-audit-{cycle}-research.md` line is present per ADR-065 anchored-dispatch pattern |
| Orchestrator → Essay-Outline naming in RESEARCH-phase descriptions | `test_orchestrator_research_artifact_naming.sh` | `skills/rdd/SKILL.md` references Essay-Outline as the RESEARCH artifact form post-Cycle-018; the Artifacts Summary table lists `./docs/essays/essay-outline-NNN-<slug>.md` as the RESEARCH artifact path (alongside or in place of the legacy `NNN-*.md` pattern) |
| ORIENTATION.md → Essay-Outline named in Section 4 (artifact map) | `test_orientation_section_4_essay_outline.sh` | `docs/ORIENTATION.md` Section 4 names Essay-Outline as the RESEARCH artifact form; the artifact map distinguishes legacy prose-essay form (`NNN-*.md`) from new Essay-Outline form (`essay-outline-NNN-*.md`) |
| ADR-092 + ADR-093 ship-together verification | `test_cycle_018_adrs_ship_together.sh` (or BUILD-pass commit inspection) | The same BUILD pass landing `skills/research/SKILL.md` Essay-Outline production instructions also lands `agents/argument-auditor.md` Essay-Outline genre handling — verifiable by commit-set inspection at release (both files modified in the same Cycle 018 BUILD pass) |
| Argument Auditor Agent → backward compatibility on pre-ADR-093 genres | `test_argument_auditor_legacy_genres_unchanged.sh` | When the argument-auditor is dispatched on a research essay (prose), an ADR set, or a synthesis outline, the audit performs the five within-document verifications + framing audit per the existing two-section output template; Essay-Outline-specific Process step does NOT fire; output template's pyramid-coverage-map and expansion-fidelity-findings subsections do NOT appear |

### Invariant Enforcement Tests (Cycle 017 additions)

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| Outcome Test admissibility (ADR-083 §1) — felt at candidate-artifact moments | All phase skills (deploy at candidate moments); orchestrator (cross-cutting principle) | `test_orchestrator_outcome_test_principle.sh` (skill-text inspection) |
| Pattern A/B per-artifact judgment (ADR-084 §3) — applied at restructuring | Architect Skill (deploys at restructuring) | `test_architect_pattern_judgment_records_basis.sh` (gate reflection or amendment-log inspection) |
| Skill-text anchoring as load-bearing enforcement (ADR-088 §3) | Skill-Structure Layer per ADR-065; all phase skills | Existing per-phase dispatch tests; v14.0 amendment is description, not new mechanism |

### Invariant Enforcement Tests (Cycle 018 additions)

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| Invariant 8 anchoring — Essay-Outline auditor scope is Skill-Structure Layer-anchored, not judgment-anchored (ADR-093 §5) | Argument Auditor Agent (`agents/argument-auditor.md` Process section) | `test_argument_auditor_essay_outline_genre.sh` (skill-text inspection — verifies the Essay-Outline Process step is present and references ADR-092 §3 + ADR-093 §2) |
| Pyramid Refinement compliance as structural verification target (ADR-092 §3 + ADR-093 §3) | Argument Auditor Agent (verifies Boundary 1/2/3 + Reverse Boundary 1/2 at expansion-fidelity level) | `test_argument_auditor_pyramid_traversal.sh` (end-to-end test: dispatch auditor on a fixture Essay-Outline with known orphan Argument-Graph node; verify the auditor reports a Boundary 2 P1 violation in the expansion-fidelity findings subsection with pyramid coordinates) |
| Outline-Production Discipline as conventional (per-bullet) — anchored in skill text, not structurally enforced (ADR-092 §5) | Research Skill (`skills/research/SKILL.md` production instructions); Argument Auditor Agent does NOT enforce per-section SYNTHESIS-bullet-presence — structural verification operates at the pyramid-expansion level only | `test_essay_outline_form_documented.sh` verifies skill-text encoding of discipline; `test_argument_auditor_pyramid_traversal.sh` verifies the auditor catches pyramid-expansion failures (not per-bullet absences) |
| META audit-time review as guard against judgment-anchored bypass (ADR-092 §4 + ADR-093 §2) | Argument Auditor Agent (reports P2 misclassification on developmental content within META-anchored sections) | `test_argument_auditor_meta_review.sh` (fixture with META section containing claim/warrant/evidence bullets; verify P2 misclassification finding emitted) |
| ADR-092 + ADR-093 ship-together constraint (cross-ADR integration scenario) | BUILD-pass commit set | Commit-set inspection at Cycle 018 release: both `skills/research/SKILL.md` and `agents/argument-auditor.md` are modified in the same Cycle 018 BUILD pass |

### Test Layers

- **Unit:** Logic within a single module; mocks acceptable for neighbors.
- **Integration:** Real data flow across module boundaries; no mocks at boundary under test.
- **Acceptance:** Scenarios end-to-end with full wiring.

The key rule: every module boundary in the dependency graph must have at least one integration test using real types on both sides. A boundary verified only with mocks is not verified.

## Roadmap

See [`./roadmap.md`](./roadmap.md) for the active roadmap. Cycle 017 BUILD work packages cover: `/rdd-conform migrate-to-rdd` subcommand implementation; `/rdd-research` skill-text edit at the research → discover gate (ADR-087 §3); hook script + test fixtures path substitution; field-guide.md regeneration; code→doc dangling-reference graduation-check tooling (Issue #17 per essay 016 §4.3).

Prior cycles completed: Cycle 1 (ADRs 022-026); Cycle 2 (ADRs 027-030); Cycle 3 (ADRs 031-036); Cycle 4 (ADRs 037-039); Cycle 5 (ADRs 040-042); Cycle 6a (ADRs 043-047); Cycle 6b (ADRs 048-054); Cycle 9 (ADRs 055-062); Cycle 10 (ADRs 063-070); Cycle 15 (ADRs 071-072); Cycle 016 (ADRs 073-082).

## Design Amendment Log

Full log preserved per ADR-074 body immutability. Most recent entries:

| # | Date | What Changed | Trigger | Provenance | Status |
|---|------|-------------|---------|------------|--------|
| 16 | 2026-05-14 | **System design v15.0 — Cycle 018 Essay-Outline Form Change.** Introduced **Essay-Outline** as the canonical RESEARCH artifact form per ADR-092: four sections (Abstract Section / Argument-Graph / Citation-Embedded Outline / References) under **Pyramid Refinement** as structural property (each level expands cleanly into the next); operational compliance test (a)/(b)/(c)/(d) per ADR-092 §3. Outline-Production Discipline (Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves) anchored conventionally in `/rdd-research` skill text; per-bullet discipline is NOT structurally enforced — structural verification operates at the pyramid-expansion level. **Outline-Coherence Signal** added as stewardship trigger with discrimination test (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect). **Argument-auditor scope extended** to Essay-Outline as fourth named genre per ADR-093: pyramid graph-traversal across four tiers; expansion-fidelity verification at three boundaries plus reverse-direction; META audit-time review (P2 misclassification when META anchor used for developmental content — guards against judgment-anchored bypass of MUST anchor convention under task load); pyramid coverage map + expansion-fidelity findings as output template additions for Essay-Outline genre only. Skill-Structure Layer anchoring per ADR-067-as-updated-by-ADR-089 in `agents/argument-auditor.md`. Filename pattern `essay-outline-NNN-<slug>.md` co-exists with legacy `NNN-*.md` (no retroactive migration). Form change is RESEARCH-scoped; SYNTHESIZE's existing outline-then-user-writes-prose pattern unchanged; reflections and synthesis essays retain narrative prose form (ADR-092 §8). Domain model Amendment 23 (24 new concepts + 2 actions; ~35 relationships; 12 open questions) landed at MODEL phase. Two new ADRs (092, 093). Zero new code modules; zero new specialist subagents; zero invariant changes (Invariant 8 governs the structural-vs-conventional anchoring; ADR-092 applies Invariant 8 by separating layers). Two modules amended (Research Skill, Argument Auditor Agent) plus four cross-cutting amendments (Orchestrator, ORIENTATION.md, this system-design pair, Domain Model follow-on Amendment 24 post-BUILD). Per ADR-076 each amendment with a qualitative claim carries decomposed `**Fitness:**` properties. Per ADR-074, this v15.0 amendment introduces ADRs — no supersession of prior ADRs. The downstream-artifact sweep is **deferred to the BUILD phase**; the unified pre-BUILD sweep checklist consolidates ADR-092 §10 + ADR-093 §5 + conformance-scan-018-decide.md targets into eight files plus two fixture tests; ADR-092 and ADR-093 ship together at BUILD (the layer separation in ADR-092 §5 degrades to discipline-alone if either ships without the other). Scope-of-claim caveats encoded: CRESS scope-transfer-via-analogy (Target 2); citation-comparison method-scope (Target 3); Kim et al. Open Question 7 (input-side susceptibility — held as Neutral consequence per F3 framing-audit resolution at the DECIDE gate). DECIDE-gate Context trio swap recorded: the post-research feed-forward synthesis's Loop C-third trio was reverted to the prose-essay §7 articulation (susceptibility + CRESS + downstream-AI-consumption) against the empirical anchor of the R2 corpus-consumption analysis; Loop C re-positioned as the comparative-case-against-prose mechanism in ADR-092 Rejected Alternative #4. The DECIDE susceptibility snapshot recommended no Grounding Reframe and named the audit-loop's Architectural-Isolation role as the canonical-pattern interruption. | Cycle 018 Essay-Outline form change (driving threads: outline-as-research-artifact + CRESS audit; user observation that AI-generated research essays are not human-read while RDD's audit infrastructure attaches to structure); ADRs 092, 093; Domain Model Amendment 23 | Essay 017 (Outlines as Research Artifacts — dogfooded both-form production: `017-outlines-as-research-artifacts-prose.md` + `017-outlines-as-research-artifacts-outline.md`); cycle-status §From DECIDE feed-forward signals; argument-audit-decide-018{,-r2,-r3,-r4}.md (four rounds, R3 silent-fallback observed and corrected at R4, R4 clean); conformance-scan-018-decide.md (6 expected deferred-sweep items + 4 P3 unexpected debt items recommending unified BUILD sweep checklist); susceptibility-snapshot-018-decide.md (no Grounding Reframe; audit-loop's Architectural-Isolation role named) | Proposed |
| 15 | 2026-04-28 | **System design v14.0 — Cycle 017 Readability & Comprehensibility.** Adopted companion-file pattern (ADR-084 Pattern B) — split this document from system-design.md per essay 016 §6. Encoded Outcome Test (ADR-083) as cross-cutting design principle with four named exception conditions and in-place-first default. Path migration `.rdd/` → `.rdd/` (ADR-085) — deferred sweep discharged for system-design.md and ORIENTATION.md; field-guide.md sweep deferred to BUILD. Tier 1 Harness Layer demoted to advisory across all modes (ADR-088 partially supersedes ADR-064 — State-C claim shifted from "structurally impossible" to "structurally detectable"; skill-text anchoring named as load-bearing enforcement layer; hook never blocks). Three-Tier Enforcement Classification's Harness Layer technique amended to advisory disposition (ADR-089 partially supersedes ADR-067 — substrate primacy preserved). In-Progress Phase field role-shift documented (ADR-090 — advisory-noise suppressor; optional; not correctness-critical). Tightly-scoped prototyping added as Research-phase method alongside lit-review/search/methods (ADR-087 §3 reframed at decide → architect gate; Beck-port calibration in §1; cycle-as-instance reflection encoded as standing caveat in §4). AI-as-orienter non-adopted pending operational criterion (ADR-086). One new artifact module (system-design.agents.md, this file). Eight new ADRs (083–090) accepted; supersession headers applied to ADR-064, ADR-067, ADR-070. Domain-model Amendment 22 (coordinated three-touch) landed at DECIDE phase. Behavior + preservation scenarios + Cycle 017 Acceptance Criteria Table appended to scenarios.md; interaction specifications for Zero-Prior-Familiarity Reader (new stakeholder type) and Cycle 017 extensions appended to interaction-specs.md. Per ADR-076, each Cycle 017 module amendment carries decomposed `**Fitness:**` properties. Per ADR-074, this v14.0 amendment will trigger downstream-artifact updates when superseded — none yet, since these are additions and amendments rather than supersessions. Zero new code modules introduced; the dependency graph's structural shape is preserved. | Cycle 017 Readability & Comprehensibility (Issue #17 + methodology debt from v0.8.2/v0.8.3 hotfixes); ADRs 083-090 | Essay 016 (Initial-Handoff and the Audience at the Margin); Domain model Amendment 21 + Amendment 22; ADRs 083-090; conformance-scan-decide-017.md (18 findings, three clusters); argument-audit-decide-017.md (4 passes, all CLEAN by pass 4 after gate-driven §3 reframe); susceptibility-snapshot-017-decide.md (no Grounding Reframe, five feed-forward signals to ARCHITECT) | Proposed |
| 14 | 2026-04-22 | **System design v13.0 — Cycle 016 Methodology Seams.** [Full Cycle 016 amendment text preserved per ADR-074 body immutability — see git history for the verbatim entry that recorded nine module amendments, 30+ new architectural drivers, 30 new responsibility-matrix entries, 8 new integration contracts, 24 new fitness criteria, 13 new boundary tests, with no new modules and no invariant changes; per ADR-076 each amendment carries decomposed Fitness properties; per ADR-074 this is the canonical example of a body-immutable amendment from a prior cycle.] | Cycle 016 Methodology Seams (Issues #10-#16); ADRs 073-082 | Essay 015; Domain model Amendment 19; ADRs 073-082 | Proposed |

(Entries #1–#13 preserved per ADR-074 body immutability covering Cycles 1 through 10. Full text in git history.)

## Provenance Model

Every design choice traces back to its origin. Provenance answers: "Why is the design this way, and what happens if I change it?"

Each module entry, responsibility allocation, and fitness criterion includes provenance references linking to invariants, ADRs, essay sections, and product discovery (stakeholder/job/value). The full provenance chain is: Module → Domain Concept → ADR → Product Discovery (stakeholder/job/value) → Essay. A product stakeholder should be able to follow this chain to understand why a module exists. Provenance via architectural drivers is the primary attribution mechanism (ADR-069); provenance check subsections are used selectively when ADRs carry non-driver content.

### "Can I change this?" Decision Tree

When someone wants to change a design element, trace its provenance:

1. **Traces to a researched invariant** → Load-bearing. Changing this means revisiting `/rdd-research` to re-examine the underlying finding. Do not change casually.
2. **Traces to an ADR judgment call** → Changeable with a Design Amendment via ADR-074 supersession workflow (file new ADR; add header to old; status update; downstream sweep across system-design.md, system-design.agents.md, ORIENTATION.md, domain-model.md, field-guide.md).
3. **Traces to design-phase allocation only** → Freely changeable. Amend the system design directly.
4. **No provenance** → Accidental. Change freely, and add provenance to whatever replaces it.

## Appendix A: Per-Phase Susceptibility Snapshot Briefs

This appendix holds the canonical brief content for each of the 8 phase skills' `Phase Boundary: Susceptibility Snapshot Dispatch` subsection. The briefs are phase-specific per ADR-056's non-formulaic requirement.

**Structural wrapping (applied identically to all 8 phase skills):**

```
## Phase Boundary: Susceptibility Snapshot Dispatch

Before completing this phase, dispatch the susceptibility-snapshot-evaluator subagent with the following brief:

<phase-specific brief content from Appendix A>

Output path: <canonical path from Appendix A — post-v14.0 paths use .rdd/audits/...>
```

The appendix records the **post-v14.0 canonical paths** at `.rdd/audits/...`. Pre-migration corpora use legacy `.rdd/audits/...` paths; the path swap happens during `/rdd-conform migrate-to-rdd`.

### A.1 Research phase (`skills/research/SKILL.md`)

> This is the research → discover boundary. Research carries the highest sycophancy gradient in the methodology (Essay 013; Cycle 9). The primary risk at this boundary is framing adoption at essay crystallization moments — the "softer than sycophancy but real" pattern documented four times in Cycle 10's own research phase. The AID cycle's recorded signals for this phase are attached. Evaluate whether the essay that is about to enter downstream phases has been shaped by framings absorbed at synthesis moments without competing frames being independently surfaced — particularly where the essay's argumentative backbone crystallized. Pay attention to moments where user-provided framings became load-bearing without belief-mapping against alternatives. **Cycle 017 addition:** if the cycle ran a validation spike per ADR-087 §3, evaluate whether the spike findings were integrated into the essay before the essay-as-checkpoint advance, or whether the spike was discharged ceremonially.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-research.md

### A.2 Discover phase (`skills/discover/SKILL.md`)

> This is the discover → model boundary. Product discovery crystallizes user-facing language (stakeholder maps, value tensions, assumption inversions, product vocabulary) into an artifact that model and decide both inherit. The canonical failure mode at this boundary was documented in Cycle 10's own discover phase: research-phase framings propagating into product vocabulary and value tensions without attribution. Evaluate the attached AID signals for two specific patterns: (a) research-essay framings inherited into product-facing language without being tested against user voice, and (b) value tensions that surfaced as spectra but collapsed into binary framings without the alternatives being examined. The product discovery artifact entering model phase should read in user voice, not methodology voice.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-discover.md

### A.3 Model phase (`skills/model/SKILL.md`)

> This is the model → decide boundary. Model phase extracts domain vocabulary and, when consequential, amends invariants — the highest-stakes commitment type in the methodology. The canonical failure mode at this boundary was documented in Cycle 10's own MODEL phase: an invariant commitment moved from flag to acceptance in two exchanges; user-stated preference preceded implications analysis; alternatives were not engaged at comparable depth. Evaluate the attached AID signals for warrant-elicitation failures and preference-accelerated commitments. For any invariant amendment or consequential concept addition in this phase, check whether belief-mapping was performed before adoption — not after. The test is whether the user could name what they would need to believe for a different commitment to be right.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-model.md

### A.4 Decide phase (`skills/decide/SKILL.md`)

> This is the decide → architect boundary. Decide phase produces ADRs, behavior + preservation scenarios, the Cycle Acceptance Criteria Table, and interaction specifications. The primary risk is that ADR framings originate from agent synthesis during drafting rather than from architectural drivers (research findings, domain model concepts, prior ADRs). Cycle 10's ADRs 063-070 introduced the provenance check subsection pattern specifically to make drafting-time synthesis visible as labeled content. Evaluate the attached AID signals for rebuttal-elicitation failures on rejected alternatives, and for cross-ADR compositions where one ADR's framing was adopted by another within the same cycle without being independently tested. Check whether each ADR's core framing traces to its driver chain or to drafting-time composition.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-decide.md

### A.5 Architect phase (`skills/architect/SKILL.md`)

> This is the architect → build boundary. Architect phase composes modules from the domain model, ADRs, and scenarios. The specific risk is that module boundaries and responsibility allocations encode unexamined assumptions — particularly the assumption that a boundary serves the developer's mental model when it should serve the user's. The Inversion Principle check at architecture is the designed counterweight but can be performed pro forma. Evaluate the attached AID signals for solution-space narrowing on boundary choices and framing adoption from DECIDE-phase ADRs (the system design inherits ADR framings — was the inheritance examined or automatic?). Check whether the proposed module boundaries would survive a product-facing reading: do they track user mental models or only developer convenience? **Cycle 017 addition:** if ARCHITECT applied Pattern A or Pattern B per ADR-084, evaluate whether the per-artifact judgment was recorded with rationale or whether the ~50% threshold was treated as a mechanical rule rather than a felt indicator.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-architect.md

### A.6 Build phase (`skills/build/SKILL.md`)

> This is the build phase boundary (typically build → play or build → [cycle end]). Build is the most empirically grounded phase per the sycophancy gradient — test execution grounds commitments in observable outcomes. The residual risks are in the spaces tests do not reach: stewardship-checkpoint commitments that adopt rejected-alternative framings without surfacing them, debug hypotheses that absorb a "this must be because X" framing without belief-mapping X, and mode-shift transitions where the user's mental model may drift without being tested. Evaluate the attached AID signals with build's empirical grounding as the baseline — concerning signals here are patterns the tests did not catch.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-build.md

### A.7 Play phase (`skills/play/SKILL.md`)

> This is the play → synthesize boundary (or play → [next cycle] if synthesize is deferred). Play produces field notes from stakeholder inhabitation. The specific risk at this boundary is that field notes flatten from observation into advocacy — discoveries that "confirm the design" crowd out discoveries that challenge it. Two signal patterns matter most: (a) selection bias in the six-category classification, and (b) gamemaster/player role blur under task load. Evaluate the attached AID signals for framing adoption in field note language (user voice vs. methodology voice) and for declining alternative engagement on discoveries that would challenge the design. The field notes entering synthesize should read as observation, not endorsement.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-play.md

### A.8 Synthesize phase (`skills/synthesize/SKILL.md`)

> This is the synthesize phase boundary (typically terminal for the cycle; or synthesize → research re-entry if structural experiments surface new questions). Synthesis is the canonical location where the "softer than sycophancy but real" framing-adoption pattern was first named in Cycle 10 — narrative framings composed at synthesis moments carry the highest risk because they shape what the cycle will be remembered as. The four-dimension framing navigation provides structural scaffolding, but the framings that emerge can still be shaped by synthesis-moment adoption. Evaluate the attached AID signals with particular emphasis on framing adoption and declining alternative engagement during the framing conversation. The outline about to become the writer's essay should carry framings the writer owns, not framings they inherited from agent composition or from the artifact trail without examining the alternatives.
>
> Output path: .rdd/audits/susceptibility-snapshot-{cycle}-synthesize.md

### Maintenance note for future cycles

Each brief references concrete prior-cycle findings where applicable (research: four framing-adoption moments; discover: Finding 1 of 014 discover snapshot; model: Finding 1 of 014 model snapshot; decide: provenance check pattern; architect: Cycle 017 Pattern A/B judgment recording; research: Cycle 017 validation-spike integration). These references are anchored in time. As future cycles accumulate evidence, briefs may need updating. The `/rdd-conform` dispatch prompt format audit scope verifies structural compliance with the canonical skeleton but does not audit brief content substance — brief refresh is a deliberate cycle operation, not automated.
