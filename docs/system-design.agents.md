# System Design (Agent Context): Pedagogical RDD

*This is the agent-context companion to [system-design.md](./system-design.md). Human-facing system overview lives in `system-design.md`; this file carries the dense reference material — architectural drivers, full module decomposition, responsibility matrix, dependency graph, integration contracts, fitness criteria, test architecture, design amendment log, and per-phase susceptibility snapshot briefs — in the form best suited to agents constructing context for code-construction work. Companion-file pattern (ADR-084 Pattern B). The split was made at Cycle 017 ARCHITECT.*

**Version:** 17.0
**Status:** Current
**Last amended:** 2026-09-04 (Amendment #19, BUILD)

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
| **Substrate-and-Surface Separation is a methodology-wide architectural commitment**: audit-substance and provenance live in typed records (Substrate); humans read Surface Views derived from them single-source; the derivation tool is a maintained toolchain artifact, not a discipline | Design Principle | ADR-099 §The architecture; Essay-Outline 020 C2, C3; spike-020; DISCOVER stakeholder demand (2026-09-03) |
| **Six binding design constraints** on the Substrate: extensible link schema; Note Discipline (validation rejects an unnoted non-trivial link); per-type record schemas; sub-argument structure preserved or its loss declared; authority resolved explicitly; authoring overhead is a toolchain concern | Constraint | ADR-099 constraints 1–6; spike-020 §1–§7 |
| **Authority option C**: records canonical for units authored after ADR-099; legacy units (ADRs 001–098, prior essays, domain-model prose) canonical in their files and represented by index records marked compressed | Design Principle | ADR-099 §Authority (practitioner ruling 2026-09-03); ADR-074 as updated |
| **Plugin-native toolchain**: no external service, database, or package dependency; Node.js is the only runtime, already required by `hooks.json` | Constraint | ADR-099 rejected alternative C; ARCHITECT retrofit finding 3 |
| **Tier-2 now, Skill-Structure at graduation** for ADR-099: no skill step is forced until the toolchain runs on this corpus; the DECIDE and MODEL steps ship in BUILD conditional on the toolchain and are confirmed by the graduation trigger | Design Principle | ADR-099 §Scope and tier, §Graduation trigger |
| **Pre-triage at every practitioner-facing moment**: resolve / carry forward / pivot; pivot = changes what gets built, for whom, or why; route choices as overridable defaults; engine detail resolved and logged; the agent runs the question form on itself first; framing-class findings never silently resolved; the triage record is written | Functional Requirement | ADR-100 rules 1–5; ADR-056 and ADR-066 updates; DISCOVER gate ruling 2026-09-03 |
| **Plain-language presentation**: referenced content inlined at the point of use; one screen, one ruling | Quality Attribute | ADR-100 rules 6–7; Chandler and Sweller 1992 via Essay-Outline 020 C3 |
| **The isolated snapshot reads the triage record** at the next boundary; hook enforcement of the record is the ADR-100 graduation target, not this cycle's | Design Principle | ADR-100 §Where the isolation lives, graduation trigger; ADR-065 |
| **Driving is the design target**: mechanisms are specified for a practitioner who decides destination and, when they care, route, and never reads the engine; a reflexive cycle may opt into engine-level presentation | Design Principle | ADR-100 §Posture; ADR-099 §Scope and tier; DECIDE gate ("driving a rigorous process under the hood") |
| **Corpus Overwhelm decomposes**: reading load (per-item cost) is addressed by Surface Views and rules 6–7; Adjudication Load (item count) only by pre-triage | Design Principle | domain model Amendment #29; ADR-099 §Complement, not substitute; ADR-100 §Decision |
| **Zero new hooks, zero manifest changes** this cycle; the Stop hook manifest check is unaffected by the Substrate; one pre-existing dispatch-hook defect is fixed | Constraint | scenarios *Preservation: The Stop hook manifest check is unaffected*; conformance-scan-decide-020 |
| **Both ADRs are Conditional Acceptance**: ADR-099 pending corpus-scale BUILD (ADR-097 path 4); ADR-100 pending two to four cycles of snapshot triage evaluation | Constraint | ADR-099 §Status; ADR-100 §Status |

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

### Cycle 019 Amendments — v16.0 (Empirical-Grounding Filter and related methodology amendments)

Cycle 019 (ADRs 094, 095, 096, 097, 098 — *"Does RDD Over-Engineer?"*) produces five methodology amendments addressing the C7 failure mode (research-surveyed possibilities surviving into ADRs without empirical filter). Three modules amended (Argument Auditor Agent, Citation Auditor Agent, Research Skill); two cross-cutting documentation amendments (Orchestrator vocabulary additions; this system-design pair). **Zero new code modules; zero new specialist subagents; zero invariant changes.** The cycle's reflexive logic — heavy structural amendment from thin evidence would itself instantiate the C7 pattern — drove three of five ADRs to Tier-2 scope with multi-cycle graduation triggers.

The cycle's DECIDE phase made three structural shifts (5 ADRs → 1 consolidated ADR → 5 ADRs + reading-path artifact) per Amendment #28's restoration of the briefly-consolidated form. The reading-path artifact at `docs/decisions/cycle-019-adr-index.md` addresses the working-memory-budget concern as a navigation layer (~120 lines indexing five ADRs at ~1,500 total lines) rather than via structural deletion. The pattern's generalization to other multi-ADR cycles is held as future-cycle scope under the knowledge-graph corpus-collapse research topic.

Per ADR-076, each amendment with a qualitative claim carries decomposed `**Fitness:**` properties.

**Alternatives considered and rejected at the architecture layer.** Two module-decomposition alternatives were available beyond the ADR-specified amendment sites; both rejected:

- **A new auditor-coordination layer / agent for the Convergence-Saturation Signal.** Rejected because ADR-094 explicitly names two-file amendment scope (per the conformance-scan §Cluster 1 clarification) — `agents/argument-auditor.md` (combined dispatch covering both Section 1 argument-audit and Section 2 framing-audit per ADR-061) and `agents/citation-auditor.md`. Creating a new coordination layer would (a) introduce a new module against the architect's "zero new modules" inheritance from the ADR specifications; (b) move the verdict-line emission farther from the round-end position where the signal is computed; (c) create an additional dispatch hop (orchestrator → coordination layer → auditor) that the existing direct-dispatch pattern (orchestrator → auditor) does not require. The verdict-line-in-the-audit-artifact pattern preserves Architectural Isolation (per ADR-058) at each round — each auditor still runs in its own isolated agent context, with the orchestrator reading the verdict line as the next round-count decision input.

- **A new `/rdd-patch-switch` callable skill for the Patch-Switching Criterion.** Rejected because ADR-096 explicitly names a skill-text amendment to `skills/research/SKILL.md` line 147 area (~10–15 lines) at the existing loop-again decision point. Creating a callable skill would (a) introduce a new dispatch boundary the practitioner-and-agent dyad would need to cross at every research loop boundary; (b) separate the criterion from its application context (the research loop where marginal yield is being judged); (c) violate ADR-095's Agent Outcome Test by creating an agent-facing artifact whose intended consumer (the Research Skill at loop-end) is the same skill that would dispatch to it. The skill-text amendment respects the user's mental model — the practitioner experiences the criterion as part of the research loop, not as a separate dispatchable step.

#### Module: Argument Auditor Agent (`agents/argument-auditor.md`) — AMENDED in v16.0

**v16.0 additions (ADR-094):**
- **Convergence-Saturation Signal verdict-line step** at round-end position (covering both Section 1 argument-audit and Section 2 framing-audit of the combined dispatch per ADR-061). At the end of each audit round, the agent appends a structured verdict line naming the round's P1 count, P2-new (non-carry-over) count, new framings or claim-scope expansions, and a recommendation: STOP / CONTINUE / ESCALATE. Format specified in ADR-094 §"Signal-evaluation step (skill-text amendment)."
- **Threshold values** (drafting-time synthesis subject to multi-cycle calibration per ADR-094 §"Calibration trigger for threshold values"): TRIGGERED when P1 = 0 AND P2-new ≤ 1 AND no new framings or claim-scope expansions.
- **Form-change baseline-reset rule** (per ADR-094 R3 P2-R3-3 2026-05-22): form-change events (restructuring, consolidation, or replacement rather than in-place revision) reset the round-count baseline — the first audit on the new form is its R1 for saturation-signal purposes, not a continuation of the prior document's round count. Operationally demonstrated by Cycle 019's own R3 audit catching three P2-new findings that the R2 verdict on the prior five-ADR set would have suppressed if erroneously carried over.
- **"No new framings" criterion is practitioner-judgment-anchored** per ADR-094 P2-R5-2. The agent reports new warrants or claim-scope expansions in the verdict line; where uncertain, the verdict reads "ESCALATE for practitioner judgment" and the practitioner reviews findings before deciding the next-round action.
- **Standard-sequence vs. re-audit-after-revision distinction:** the signal applies to the cycle's primary audit sequence (R1, R2, R3, ...); single-purpose re-audits dispatched per the orchestrator's re-audit-after-revision rule run unconditionally and do not append a Convergence-Saturation Signal verdict line. Dogfooding exception per ADR-094 P2-R2-1 — when a re-audit is also the first operational application of the verdict-line mechanism itself, the verdict line may be appended as a calibration artifact with a distinguishing note.

**Provenance:** ADR-094 §1–§"Calibration trigger" (Convergence-Saturation Signal; skill-text amendment specification; form-change baseline-reset rule); essay-outline-018 §10 ADR-CANDIDATE-019.1; Cycle 018 RESEARCH cross-cutting observation (Iterative-Audit Pattern, domain model Amendment 23); conformance-scan-decide-019.md §Cluster 1 (naming clarification — two-file enumeration covering argument-auditor's combined dispatch + citation-auditor; per ADR-061 framing audit is Section 2 of argument-auditor, not a separate file).

**Fitness:** (1) The verdict-line step is documented at the round-end position in `agents/argument-auditor.md` for both Section 1 (argument-audit) and Section 2 (framing-audit) of the combined dispatch; verified by grep on the agent file for "Convergence-Saturation Signal" plus the verdict-line format string (P1 count, P2-new count, new framings, Recommendation). (2) Threshold values are encoded as specified (P1 = 0; P2-new ≤ 1; no new framings); verified by skill-text inspection. (3) The form-change baseline-reset rule is documented as the rule that form-change events reset the round-count baseline; verified by grep for "form-change baseline-reset" or equivalent language. (4) The standard-sequence vs. re-audit distinction is encoded; verified by grep for "re-audit-after-revision" plus the distinction language. (5) The "ESCALATE for practitioner judgment" branch is named as the escape valve when the agent is uncertain about new-framings classification; verified by skill-text inspection.

#### Module: Citation Auditor Agent (`agents/citation-auditor.md`) — AMENDED in v16.0

**v16.0 additions (ADR-094):**
- **Convergence-Saturation Signal verdict-line step** at round-end position. Same verdict-line format as the argument-auditor amendment: P1 count, P2-new count, new framings or claim-scope expansions, recommendation (STOP / CONTINUE / ESCALATE).
- **Threshold values** match the argument-auditor amendment per the cross-skill consistency requirement (P1 = 0; P2-new ≤ 1; no new framings).
- **Form-change baseline-reset rule** applies symmetrically — citation-audit on a form-changed artifact treats its first run as R1, not a continuation.
- **Standard-sequence vs. re-audit distinction** matches the argument-auditor amendment.

**Provenance:** ADR-094 §1 + §"Signal-evaluation step (skill-text amendment)" + conformance-scan-decide-019.md §Cluster 1 (the two-file enumeration; citation-auditor is the second file in the corrected scope per ADR-061).

**Fitness:** (1) The verdict-line step is documented at the round-end position in `agents/citation-auditor.md`; verified by grep for "Convergence-Saturation Signal" plus the verdict-line format string. (2) Threshold values match the argument-auditor's; verified by skill-text inspection. (3) The form-change baseline-reset rule is documented; verified by grep. (4) The standard-sequence vs. re-audit distinction is encoded; verified by skill-text inspection.

#### Module: Research Skill (`skills/research/SKILL.md`) — AMENDED in v16.0

**v16.0 additions (ADR-096):**
- **Patch-Switching Criterion** at the research-loop-end boundary (the orchestrator-readable boundary at `skills/research/SKILL.md` line 147 area where the agent currently asks "loop again with a new question, or proceed to the Essay-Outline?"). The bare prompt is replaced or augmented with the Pirolli & Card (1999)-anchored question: *"Does the current research patch's marginal information value exceed the opportunity cost of staying in it? If no, switch — either to a new patch (a different research thread the prior loop surfaced) or to synthesis."*
- **Three-way verdict** (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis) recorded as a structured verdict line in the research log per ADR-096 §"Verdict-line format." Fields: marginal yield this loop (P1/P2/P3 findings; new framings; questions answered); specific question for next loop; practitioner expected observation; recommendation.
- **Practitioner-elicited "expected observation" field** per ADR-096 R2 audit P3-2 2026-05-22: the agent prompts the practitioner before appending the verdict line — *"What specific observation in the next loop would change your reading of the problem space — not deepen it, but change it?"* The response populates the field. Absence of substantive engagement reads as "none (practitioner did not specify)" and triggers the switch condition.
- **Reflexive-vs-genuine pre-mortem discrimination** per ADR-096 R2 audit P2-3: a reflexive answer ("more evidence for the claims already established") triggers the switch condition, not the stay condition. The agent's role at loop-end is to ask whether the expected observation is distinct from confirming what the loop already found. The Einstellung effect makes reflexive answers more likely after several iterations.
- **Late patch-additions accommodated explicitly** (the Cycle 019 Loop 6 pattern): if synthesis surfaces a question the prior loops did not address, the criterion can be re-invoked; the new patch's marginal-yield rationale or scope-of-claim-encoding alternative is recorded in the research log.

**Provenance:** ADR-096 §"The criterion" + §"Skill-text amendment site" + §"Verdict-line format"; Pirolli & Card (1999) information-foraging patch-switching (cited in essay-outline-018 §10 ADR-CANDIDATE-019.3 and in `lit-review-019-methodology-overhead.md`); Cycle 018 reflections (RESEARCH had no termination criterion; loop ran longer than the practitioner reflectively endorsed); Cycle 019 Loop 6 evidence for late patch-additions (cycle-status.md §From RESEARCH).

**Fitness:** (1) The Patch-Switching Criterion question is documented at the research-loop-end boundary in `skills/research/SKILL.md` (line 147 area); verified by grep for "Patch-Switching" + "marginal" + the Pirolli & Card reference. (2) The verdict-line format is encoded with the three-way recommendation (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis); verified by grep for the three verdict-token strings. (3) The practitioner-elicited "expected observation" field is named as practitioner-elicited (not agent-inferred); verified by skill-text inspection of the prompting language. (4) The reflexive-vs-genuine discrimination is encoded — a reflexive answer triggers the switch condition; verified by grep for "reflexive" + "change (not deepen)" or equivalent language. (5) Late patch-additions are accommodated explicitly with a re-invocation pathway; verified by skill-text inspection. (6) The amendment is ~10–15 lines (per ADR-096 scope) and localized to the line-147 area; verified by skill-text inspection.

#### Module: Orchestrator (`skills/rdd/SKILL.md`) — AMENDED in v16.0 (vocabulary additions)

**v16.0 additions (ADR-095, ADR-097, ADR-098 — Tier-2 vocabulary):**
- **Empirical-Grounding Filter at DECIDE** named in the "Important Principles" section as a felt-trigger-anchored methodology principle; the four grounding-mechanism paths (PLAY evidence; stakeholder-articulated demand; spike validation; structural operationalization) named for cross-reference from DECIDE-phase skill text.
- **Agent Outcome Test** named in the "Important Principles" section as the agent-facing parallel to ADR-083's Outcome Test; the consumer-naming-actionability requirement named (necessary but not sufficient — trivially-passing answers do not satisfy the test).
- **Practitioner-Originated Framing Absorption** and **FF1 / FF3 named-deferrals** named with their graduation triggers (two-direction — harm evidence OR reliance evidence; 2–4 cycle threshold).
- **Three-Application F-P2 Pattern** named as a held question at the cross-cutting level; multi-cycle graduation triggers (ADR-094, ADR-095, ADR-097, ADR-098) are the conditions under which the coherent-application-vs-content-selection reading becomes assessable.
- **Form-change baseline-reset rule** referenced as a methodology-level insight from ADR-094 R3 — when an artifact's form changes, the saturation-signal baseline resets; the rule's operational demonstration in Cycle 019's R3 audit is the evidence anchor.

**Provenance:** ADR-094 (form-change baseline-reset rule); ADR-095 (Agent Outcome Test); ADR-097 (Empirical-Grounding Filter; four grounding-mechanism paths); ADR-098 (FF1 + FF3 named-deferrals; two-direction graduation triggers); domain-model Amendments #25/#26/#28.

**Fitness:** (1) The Empirical-Grounding Filter is named in the orchestrator's "Important Principles" or equivalent cross-cutting section; verified by grep for "Empirical-Grounding Filter" in `skills/rdd/SKILL.md`. (2) The Agent Outcome Test is named alongside ADR-083's Outcome Test as the agent-facing parallel; verified by grep for "Agent Outcome Test." (3) FF1 / FF3 named-deferrals are recorded with their graduation triggers; verified by grep for "FF1" + "FF3" + "graduation trigger" or equivalent vocabulary. (4) The Three-Application F-P2 Pattern is named as a held question; verified by grep. (5) The form-change baseline-reset rule is referenced with the ADR-094 R3 operational-demonstration evidence anchor; verified by grep for "form-change baseline-reset."

#### Reading-path artifact: `docs/decisions/cycle-019-adr-index.md` — NEW in v16.0

**Purpose:** Navigation-layer artifact for the five Cycle 019 ADRs. Itself an instance of ADR-095's Agent Outcome Test passing: intended consumer named (future practitioners or readers consulting Cycle 019's methodology amendments); layer-match holds (orientation/navigation layer; not duplicative of the ADRs themselves which carry the rationale chains, or of cycle-status which tracks active-cycle progress); the consumer-naming produces an actionable distinction (read this first; skip to ADR-097 if that's all you need).

**Provenance:** Cycle 019 DECIDE gate restoration (Amendment #28); ADR-095 Agent Outcome Test applied at the artifact's own creation moment; conformance-scan-decide-019.md (BUILD-debt enumeration referenced by the index).

**Fitness:** (1) The reading-path artifact exists at `docs/decisions/cycle-019-adr-index.md`; verified by file existence. (2) The artifact names its intended consumer in the frontmatter or opening section; verified by grep for "Audience:" or equivalent. (3) The artifact ranks the five ADRs with ADR-097 named as central; verified by inspection. (4) The artifact passes its own Agent Outcome Test — the consumer-naming produces an actionable distinction; verified by inspection (the index ranks reading order; reading ADR-097 alone is named as the time-constrained path).

#### Cycle 019 deferred sweep — unified pre-BUILD checklist (consolidated)

The conformance scan (`.rdd/audits/conformance-scan-decide-019.md`) enumerates the BUILD-debt items and the one ADR-094 naming clarification. The unified pre-BUILD sweep checklist consolidates them:

| Sweep target | Purpose |
|---|---|
| `agents/argument-auditor.md` | Convergence-Saturation Signal verdict-line step at round-end position (Section 1 argument-audit + Section 2 framing-audit per ADR-061); threshold values; form-change baseline-reset rule; ESCALATE branch; standard-sequence vs. re-audit distinction |
| `agents/citation-auditor.md` | Convergence-Saturation Signal verdict-line step at round-end position; threshold values matching argument-auditor; form-change baseline-reset rule; standard-sequence vs. re-audit distinction |
| `skills/research/SKILL.md` | Patch-Switching Criterion at line 147 area — Pirolli-Card-anchored question; verdict-line format with three-way recommendation; practitioner-elicited "expected observation" field; reflexive-vs-genuine pre-mortem discrimination; late patch-additions accommodation |
| `skills/rdd/SKILL.md` (orchestrator) | Important Principles vocabulary additions — Empirical-Grounding Filter with four paths; Agent Outcome Test; FF1 / FF3 named-deferrals with two-direction graduation triggers; Three-Application F-P2 Pattern held question; form-change baseline-reset rule reference |
| `docs/decisions/adr-094-audit-round-count-convergence-saturation.md` | Naming clarification per conformance-scan §Cluster 1 — replace three-file enumeration (including non-existent `framing-auditor.md`) with two-file enumeration covering `argument-auditor.md` (combined dispatch) + `citation-auditor.md` |
| `docs/system-design.md` | Cycle 019 amendments summary; version bump to v16.0; Design Amendment Log entry #17 |
| `docs/system-design.agents.md` | This Cycle 019 Amendments section; responsibility matrix Cycle 019 entries; Cycle 019 fitness criteria + boundary tests; provenance chain updates citing ADRs 094–098 |
| `docs/ORIENTATION.md` | Section 5 (Current state) — Cycle 019 named as active cycle entering BUILD; key constraints if amended; Cycle 018 moved to completed-cycles list |
| `docs/roadmap.md` | Cycle 018 WPs migrate to Completed Work Log (already done in v0.8.6 release); Cycle 019 WPs become active |
| `docs/domain-model.md` | Open Questions entry for knowledge-graph corpus collapse (if not already present); confirm Amendments #25/#26/#28 are current |
| `hooks/tests/` (no new fixture tests required this cycle) | The two Cycle 019 skill-text amendments are inspection-level verifiable through skill-text grep; the cycle does not introduce new fixture tests. If future practice produces fixture tests for the verdict-line format presence, they would be added at that time |

**No ship-together constraint between Cycle 019's ADRs.** Each of the five ADRs is independently scoped — ADR-094 and ADR-096 are Skill-Structure Layer skill-text amendments at distinct workflow boundaries; ADR-095, ADR-097, ADR-098 are Tier-2 vocabulary with no Skill-Structure Layer hooks. The reading-path artifact at `docs/decisions/cycle-019-adr-index.md` ships with the five ADRs but is the navigation layer rather than a code module; the five ADRs would still be addressable individually if the reading-path artifact were absent.

### Cycle 020 Amendments — v17.0 (Substrate-and-Surface Separation; Pre-Triage and Plain-Language Presentation)

Cycle 020 (ADRs 099 and 100 — *Corpus Topology and Agent-Navigable Compaction*) is the first cycle since Cycle 10 to add code modules. ADR-099 commits the methodology to a Substrate of typed records with Surface Views derived from it single-source; ADR-100 commits the orchestrator to pre-triaging findings and presenting what survives in plain language, with the triage recorded and read by the isolated snapshot at the next boundary. **Three new code modules (Substrate, Record Validator, Surface Deriver), one new generated artifact module (Surface Views), zero new specialist subagents, zero new hooks, zero invariant changes, one hook defect fix.** Twelve existing modules are amended (Orchestrator, Decide Skill, Model Skill, Conformance Audit Skill, the six other phase skills' snapshot briefs, the Susceptibility Snapshot Evaluator Agent, the Tier 1 Verify Dispatch Hook).

**Retrofit reconnaissance (Step 3).** The DECIDE conformance scan (`.rdd/audits/conformance-scan-decide-020.md`) found no unplanned drift: every gap is one the two ADRs schedule for BUILD. ARCHITECT's own scan adds three findings. (1) `skills/decide/SKILL.md:195` and `skills/conform/SKILL.md:173` still give `./docs/essays/audits/` as the example conformance-report path — a pre-ADR-070 path that the ADR-070 and ADR-085 sweeps did not catch; the Cycle 020 DECIDE scan landed there and was relocated to `.rdd/audits/` at ARCHITECT entry. Classified **bug**, fixed at BUILD WP-A. (2) `hooks/scripts/tier1-verify-dispatch.sh:82-93` never strips a trailing `**` from a fully bold-wrapped `Output path:` line; ten dispatch-log entries from session f1575b68 carry corrupted paths. Classified **bug**, fixed at BUILD WP-A with a fixture in `hooks/tests/test_output_path_regex.sh`. (3) Node.js is already a runtime requirement of the plugin (`hooks.json` runs `skill-activator.js` under `node`); the toolchain therefore adds no new runtime. Classified **constraint**, honored in the runtime choice below.

**The ARCHITECT decisions ADR-099 and ADR-100 delegated here**, each with the alternative set aside:

| Decision | Chosen | Set aside | Why |
|---|---|---|---|
| Record format | One plain-JSON file per record; typed links with note text; the spike's validated form (lit-review Q4 rank 3) | YAML frontmatter (rank 2): no typed edges, so `supersedes` vs `references` vs `parallel-to` is lost. JSON-LD (rank 1): a context ontology to maintain for a single-corpus tool; lower raw readability, and the human never reads the raw record under ADR-099 | Typed edges are the provenance payload; plain JSON carries them with zero parsing dependencies |
| Runtime | Node.js, zero dependencies (`node` ≥ 18; v22 present) | Python (the spike's runtime): adds a second runtime requirement the plugin does not have today. bash + jq: adequate for validation, painful for templated derivation | The plugin already requires Node for a hook; one runtime, not two |
| Record types with schemas this cycle | `adr` (full and index forms), `pattern`, `term` | `invariant` and `scenario`: no Cycle 020 scenario requires them; adding them now is the arc42 comprehensiveness trap ADR-099 constraint 3 names | ADR-099 constraint 3 says at least these three differ materially; the first corpus (Cycle 019 sample; ADR-099/100; nine Cycle 020 terms) needs exactly these three |
| Substrate location | `docs/substrate/<type>/<id>.json` — centered, Tier 3 | `.rdd/substrate/`: the ADR-085 axis is process vs product; records are the canonical *body* of new governance units, which is product, not framework operation | Preservation scenario (ADR-085 categories not split) holds: records and views are both centered |
| Surface View location | `docs/views/overview.md` + `docs/views/<id>.md` — centered, Tier 2; derived ADR markdown stays at `docs/decisions/adr-NNN-<slug>.md` | Drill-ins only at `docs/decisions/` (collides with legacy canonical files for index records); a fourth artifact tier (adds a layer without removing one, the objection ADR-099 §Authority raised against option D) | The overview is what the practitioner reads on re-entry, which is the Tier 2 job; no fourth tier |
| Toolchain location | `tools/substrate/` in the plugin (sibling of `hooks/`, `agents/`, `skills/`): `validate.js`, `derive.js`, `schema/*.schema.json`, `tests/` | Under `hooks/scripts/` (not a hook); under `docs/` (toolchain is plugin code, not corpus) | The schemas define methodology record types and travel with the plugin; records travel with the project |
| Term records and `domain-model.md` | Term records are canonical for terms authored after ADR-099; the deriver rewrites one marker-delimited region of `domain-model.md` (`<!-- substrate:terms:begin -->` … `end`) | Hand-maintained rows plus term records (the dual-maintenance drift ADR-099 exists to prevent); term records as schema fixture only, no domain-model derivation (leaves MODEL with no Author Substrate Record step) | Single-source into an existing hand-maintained file is a known pattern; the region is the only text the tool touches |
| ADR-099 and ADR-100 form | Authored as full `adr` records at BUILD; markdown regenerated at the existing paths; one narrow argument-audit round on the derived files (form change: R1 on the new form per ADR-094) | Treat them as the last legacy units: contradicts ADR-099 §Authority, which names the legacy set as 001–098 | They are the first post-ADR-099 units and the test of constraint 4 (ADR-099 nests §Authority) |
| Hook enforcement of derivation | None this cycle; `derive --check` in `/rdd-conform` drift detection is the only mechanical check | A PostToolUse reminder hook on writes under `docs/substrate/` | ADR-099 sets Skill-Structure anchoring as the graduation target; preservation scenario keeps the Stop hook untouched |

**Inversion Principle check.** The practitioner's phrase is "a graph behind a human-friendly format." The boundary that encodes it is Substrate (behind: Tier 3, `docs/substrate/`, JSON the practitioner never opens) versus Surface Views (in front: Tier 2, `docs/views/`, the first thing read on re-entry). The developer's convenience would have put records and views side by side under one directory; the user's mental model puts the view in front and the records behind, and the tier assignment follows the user's model. The derived ADR markdown staying at `docs/decisions/` serves the practitioner's existing habit (ADR-099 Neutral consequence) and the hooks' path expectations.

#### Module: Substrate (`docs/substrate/`) — NEW in v17.0 (artifact module)

**Purpose:** Holds the canonical structured record for every governance unit authored after ADR-099 and an index record for every legacy unit.

**Provenance:** ADR-099 §The architecture, constraints 1–5, §Authority option C (practitioner ruling 2026-09-03); domain model Amendment #29 (Substrate, Typed Link, Note Discipline); spike-020 §2, §5, §7; Essay-Outline 020 C3, C4.

**Owns:** Substrate; Typed Link; Note Discipline (as the data rule the records must satisfy); record identity (`id` is the filename stem: `adr-099`, `pattern-calibration-with-graduation-trigger`, `term-substrate`); record form (`full` or `index`) and the `compressed` marker on index records; the canonical-source field on index records (path of the legacy file).

**Layout:** `docs/substrate/adr/adr-NNN.json`; `docs/substrate/pattern/<slug>.json`; `docs/substrate/term/<slug>.json`. One file per record so that git history is per unit and ADR-074 immutability applies to one file.

**Depends on:** nothing (data). **Depended on by:** Record Validator (reads), Surface Deriver (reads), Decide Skill and Model Skill (write via Author Substrate Record), Conformance Audit Skill (reads via `derive --check`).

**Fitness:**
- **Fitness:** "Canonical for new units" — for every `adr` record with `form: full`, the markdown at `docs/decisions/adr-NNN-<slug>.md` begins with a header naming the record path; a hand edit to that markdown does not survive `derive`; verified by the scenario *A new governance unit is authored as a record and its markdown is derived*.
- **Fitness:** "Legacy units untouched" — after any `derive` run, `git diff --stat docs/decisions/adr-0{01..98}-*.md` is empty; verified by the preservation scenario *Legacy ADR files are unchanged by derivation* run in the toolchain test suite against a fixture copy and at BUILD Step 5.5 against the real corpus.
- **Fitness:** "Extensible link schema" — a record carrying a link type absent from `schema/link.schema.json`'s starting list validates when its note is present; verified by the scenario *Link types are extensible*.

#### Module: Record Validator (`tools/substrate/validate.js` + `tools/substrate/schema/`) — NEW in v17.0

**Purpose:** Rejects any Substrate record that violates its per-type schema or Note Discipline, naming the record and the offending field or link.

**Provenance:** ADR-099 constraints 1, 2, 3, 4; spike-020 §2 (schema inadequacy), §5 (note discipline), §6 (comprehensiveness trap); scenarios *Note Discipline validation rejects an unnoted non-trivial link*, *Per-type schemas permit absent fields*, *Link types are extensible*, *ADR record with sub-decisions nests them*.

**Owns:** Per-type record schema (`adr.schema.json`, `pattern.schema.json`, `term.schema.json`); the shared link sub-schema (`link.schema.json`: `type` any non-empty string; `target` a record id; `note` required unless `type` is `references`); schema validation; Note Discipline enforcement; the `references`-is-trivial rule; nested sub-decision validation for `adr` records (a `sub_decisions` array whose items carry their own `commitment`, `rationale`, and optional `status` history); required-field asymmetry (`rejected_alternatives` required for `adr` form `full`, absent from `pattern`; `summary` and `compressed: true` and `canonical_source` required for `adr` form `index`).

**Minimal field sets (ARCHITECT specifies; BUILD may add optional fields, never required ones, without a design amendment):**

| Type | Required | Optional |
|---|---|---|
| `adr` (full) | `id`, `type`, `form`, `title`, `status`, `cycle`, `context`, `commitment`, `warrants[]` (each tagged `warrants_for`), `rejected_alternatives[]` (each with `reason`), `links[]` | `sub_decisions[]`, `graduation_trigger`, `consequences{positive,negative,neutral}`, `provenance`, `supersession` |
| `adr` (index) | `id`, `type`, `form`, `title`, `status`, `canonical_source`, `summary`, `compressed: true`, `links[]` | `cycle`, `supersession` |
| `pattern` | `id`, `type`, `title`, `statement`, `applications[]` (record ids), `links[]` | `provenance`, `caveats[]` |
| `term` | `id`, `type`, `title`, `definition`, `cycle`, `links[]` | `product_origin`, `aliases[]`, `related[]` |

**Depends on:** Substrate (reads). **Depended on by:** Surface Deriver (calls before deriving), Decide Skill, Model Skill (invoke after authoring).

**Fitness:**
- **Fitness:** "Note Discipline is enforced, not recommended" — a record with one link of type other than `references` and an empty or absent `note` exits 1 with the record id and link index on stderr; verified by the scenario *Note Discipline validation rejects an unnoted non-trivial link* as a `node --test` case.
- **Fitness:** "Per-type, not universal" — the three schemas share no single required-field set; a `pattern` record without `rejected_alternatives` validates and an `adr` full record without it fails; verified by the scenario *Per-type schemas permit absent fields*.
- **Fitness:** "Zero dependencies" — `tools/substrate/` contains no `package.json` `dependencies` entry and `validate.js` requires only `node:` built-ins; verified by `grep -L "require('node:\|from 'node:" tools/substrate/*.js` returning nothing and no `node_modules` under `tools/`.

#### Module: Surface Deriver (`tools/substrate/derive.js`) — NEW in v17.0

**Purpose:** Generates every Surface View from a validated Substrate in one deterministic pass and refuses to run on an invalid Substrate.

**Provenance:** ADR-099 §The architecture (single-source derivation; Surface View), constraint 4 (compressed marker), constraint 6 (maintained toolchain); domain model Amendment #29 (Surface View; Derive Surface View); spike-020 §3, §4; Cockburn et al. 2008 (focus+context) via Essay-Outline 020 C3; scenarios *Records with Typed Links derive to an overview and drill-in views*, *Drill-in view preserves focus+context*, *Surface View signals its own incompleteness*, *Regeneration is deterministic and single-source*.

**Owns:** Derive Surface View; overview composition (patterns first, then `adr` records by number, then terms; each with a one-line summary and its typed cross-references co-located, note text inline); drill-in composition (full record rendered; "Surrounding records" footer naming every record linked to or from this one with one-line summary; link back to the overview); the compressed-index marker ("This view is a compressed index of `<canonical_source>`; the source is canonical"); the derived-ADR header ("Derived from `docs/substrate/adr/adr-NNN.json`. Do not edit; correct the record and re-run derive."); the `domain-model.md` marked-region rewrite for term records; the `--check` mode (exit 1 and list paths if any output would differ from what is on disk); output ordering and whitespace determinism (sorted keys, LF line endings, no timestamps).

**Depends on:** Record Validator (function call, in-process), Substrate (reads). **Writes:** Surface Views (`docs/views/`), derived ADR markdown (`docs/decisions/`, only for records with `form: full`), the `domain-model.md` marked region. **Depended on by:** Decide Skill and Model Skill (phase-exit step), Conformance Audit Skill (`--check`), BUILD Step 5.5.

**Fitness:**
- **Fitness:** "Deterministic" — two consecutive `derive` runs with no record change produce byte-identical files (`diff -r` empty) and `derive --check` exits 0; verified by a `node --test` case and by BUILD Step 5.5 on the real corpus.
- **Fitness:** "Single-source" — editing one record and re-running changes only the overview, that record's drill-in, drill-ins of records linked to or from it, and (for `adr` full) its derived markdown; no other file changes; verified by the scenario *Regeneration is deterministic and single-source*.
- **Fitness:** "Focus+context, not replace-context" — every drill-in ends with a "Surrounding records" section listing each linked record's id, title, and one-line summary, and contains a link to `overview.md`; verified by the scenario *Drill-in view preserves focus+context*.
- **Fitness:** "Incompleteness is visible" — every drill-in for an `index` record carries the compressed marker naming the canonical source in its first ten lines; verified by the scenario *Surface View signals its own incompleteness*.
- **Fitness:** "Refuses invalid input" — `derive` on a Substrate containing one invalid record writes nothing and exits 1 with the validator's message; verified by a `node --test` case (the Surface Deriver → Record Validator boundary test).

#### Module: Surface Views (`docs/views/`) — NEW in v17.0 (generated artifact module)

**Purpose:** The human-facing read of the corpus at the resolution the moment calls for: `overview.md` first, `<id>.md` on demand.

**Provenance:** ADR-099 §The architecture; domain model Amendment #29 (Surface View: "never hand-maintained"); product-discovery Solo Developer task *Read the corpus at the resolution the moment needs*; Cycle 020 Acceptance Criteria Table row 1 (corpus-scale read at BUILD Step 5.5 and PLAY).

**Owns:** nothing beyond its files; the module exists because it has a location, a tier (Tier 2), and a fitness property distinct from the tool that writes it.

**Depends on:** Surface Deriver (written by). **Depended on by:** ORIENTATION.md §4 (lists it), the practitioner at gates and on re-entry, the orchestrator at gate presentation (ADR-100 rule 6 may quote a drill-in's summary line inline).

**Fitness:**
- **Fitness:** "Never hand-maintained" — `derive --check` run by `/rdd-conform` drift detection exits 0 on a clean corpus; a hand edit to any file under `docs/views/` makes it exit 1 naming the file; verified by a `node --test` case and by the conform skill step.
- **Fitness:** "The read the practitioner uses" (ADR-099 graduation-trigger observable; direction, not constraint this cycle) — gate notes and cycle-status entries from the next two to four cycles cite `docs/views/` paths rather than raw artifact paths; observed at each cycle's gate notes. Recorded here as the direction the architecture is optimizing toward; the constraint form is the graduation trigger in ADR-099, not a property this cycle can test.

#### Module: Orchestrator (`skills/rdd/SKILL.md`) — AMENDED in v17.0

**v17.0 amendments (ADR-100 rules 1–7; ADR-056 and ADR-066 updates; ADR-099 artifact locations):**
- **Stage Gates — Reflection Time Protocol** gains a **Pre-triage** step between Attend and Interpret: every finding from the phase's loops, audit rounds, framing audit, and snapshot is sorted into resolve / carry forward / pivot by the Pivot Point criterion (a finding is a pivot when it changes what gets built, for whom, or why; route-level choices are presented as overridable defaults with the agent's choice stated; engine-level detail is resolved and logged). For each pivot the agent runs the phase's question form on itself first, develops both sides, and states a recommendation. Framing-class findings are never dispositioned resolve without appearing in the presentation.
- **Presentation rule** added to the Decide step: one screen (what changed; route defaults taken; the pivot), with every cited invariant, ADR section, scenario, or term quoted or glossed inline at the point of use; no bare identifiers.
- **Gate Reflection Note required structure** gains the section `## Susceptibility snapshot findings and orchestrator triage` with a table (finding | disposition | what was done), and a second table `## Argument-audit findings and orchestrator triage` when an audit ran in the phase. The manifest is **not** amended this cycle (ADR-100 graduation target).
- **Question Toolkit** preamble states that the first pass of each form at a gate is performed by the agent on itself; the practitioner-facing question is the surviving pivot (ADR-056 update).
- **Reflexive opt-in**: a cycle may declare at open, or at any gate, that engine-level dispositions are to be listed in the presentation, not only logged.
- **Artifacts Summary** gains rows for `docs/substrate/<type>/<id>.json` (DECIDE, MODEL: Substrate record) and `docs/views/` (cross-phase: Surface Views, generated). **Orientation Document** three-tier list: Tier 2 gains `views/`; Tier 3 gains `substrate/`.

**Provenance:** ADR-100 §Decision rules 1–7, §Posture; ADR-056 and ADR-066 `Updated by ADR-100` headers; ADR-099 Neutral consequence (hierarchy); `.rdd/gates/020-discover-gate.md` (practitioner's instruction to bring pivots).

**Fitness:**
- **Fitness:** "One screen, one ruling" — the gate presentation text the orchestrator emits contains at most one question requiring a practitioner ruling and states each route default with its alternative named; verified by inspection of the gate note's *Belief-mapping question* section (which records the presented pivot) at each of the next two to four cycles' gates, and by the snapshot's triage evaluation.
- **Fitness:** "Referenced content inlined" — the presented pivot contains no citation of the form `Invariant N` or `ADR-NNN §X` without the cited text or a one-line gloss adjacent; verified by the scenario *A pivot is presented with referenced content inline* (grep the gate note's question section for bare identifiers).
- **Fitness:** "Triage record is written, not implied" — every gate note from the first BUILD-phase gate onward contains the triage section with at least one row; verified by grep across `.rdd/gates/` (the future manifest check is the graduation target, not this cycle's).

#### Module: Decide Skill (`skills/decide/SKILL.md`) — AMENDED in v17.0

**v17.0 amendments (ADR-099 §Authority option C; ADR-074 as updated; ADR-100; retrofit finding 1):**
- **Step 2 Write ADRs**: for a new decision, the agent performs **Author Substrate Record**: drafts `docs/substrate/adr/adr-NNN.json` (form `full`; rejected alternatives with reasons as a required field; sub-decisions nested where they exist; typed links with note text), runs `node tools/substrate/validate.js`, then `node tools/substrate/derive.js` to produce the markdown at the existing path. The ADR template in the skill is retained as the *rendered* form the derived markdown follows. The prose template remains the form for a project that has not adopted the toolchain (the skill checks for `tools/substrate/`).
- **Step 2.5** states that for units authored after ADR-099 the immutable body is the record; supersession headers are written by the deriver from the record's `supersession` field for derived files and by hand for legacy files (ADR-074 unchanged for them).
- **Step 3.5** example path corrected to `.rdd/audits/conformance-scan-decide-NNN.md`.
- **Phase exit** (before the gate): **Derive Surface View** runs; the orchestrator confirms `derive --check` exits 0.
- **EPISTEMIC GATE, Decide step**: one sentence pointing to the orchestrator's Pre-triage step and presentation rule.
- **Snapshot brief**: names the gate note's triage record as input with the three triage questions.

**Provenance:** ADR-099 §Authority C, constraint 6 (Author Substrate Record as an artifact-creation step); ADR-074 header; interaction-specs Cycle 020 *Author a decision as a record*; ADR-100 §Where the isolation lives; ARCHITECT retrofit finding 1.

**Fitness:**
- **Fitness:** "Record-first authoring is a step, not a habit" — `skills/decide/SKILL.md` Step 2 names `validate.js` and `derive.js` in that order with the record path template; verified by grep.
- **Fitness:** "Projects without the toolchain are unaffected" — the Step 2 text branches on the presence of `tools/substrate/` and falls back to the prose template; verified by skill-text inspection (the preservation scenario *The Stop hook manifest check is unaffected* covers the harness side).

#### Module: Model Skill (`skills/model/SKILL.md`) — AMENDED in v17.0

**v17.0 amendments (ADR-099 §Authority option C; ADR-100):**
- **Step 2 Draft the Domain Model**: for each new concept or action, the agent performs **Author Substrate Record** for a `term` record; the Concepts table row for a post-ADR-099 term is produced by `derive` into the marker-delimited region of `domain-model.md`. Legacy rows stay hand-maintained and canonical.
- **Phase exit**: Derive Surface View runs before the gate.
- **EPISTEMIC GATE, Decide step** pointer; **snapshot brief** amendment.

**Provenance:** ADR-099 §Authority C; ADR-099 constraint 3 (term schema differs materially); domain model Amendment #29 (Author Substrate Record actor: AI drafts, user rules).

**Fitness:**
- **Fitness:** "The region is the only text the tool touches in `domain-model.md`" — a `derive` run changes bytes only between `<!-- substrate:terms:begin -->` and `<!-- substrate:terms:end -->`; verified by a `node --test` case diffing the file outside the markers.

#### Module: Conformance Audit Skill (`skills/conform/SKILL.md`) — AMENDED in v17.0

**v17.0 amendments:** drift detection runs `node tools/substrate/validate.js docs/substrate` and `node tools/substrate/derive.js --check` when `tools/substrate/` and `docs/substrate/` both exist; a non-zero exit is reported as documentation drift (hand-edited view or stale derivation). Example path at line 173 corrected to `.rdd/audits/`.

**Provenance:** ADR-099 §The architecture ("corrections go to the Substrate; the view is regenerated"); ARCHITECT decision (hook enforcement set aside; conform is the mechanical check); retrofit finding 1.

**Fitness:**
- **Fitness:** "Drift is detected, not prevented" — `/rdd-conform` on a corpus with one hand-edited view reports the file path under drift; verified by skill-text grep for `derive.js --check` and by the Surface Views module's fitness test.

#### Modules: Research, Discover, Architect, Build, Play, Synthesize Skills — AMENDED in v17.0 (snapshot brief and gate pointer only)

**v17.0 amendments (ADR-100 §Where the isolation lives):** each skill's *Phase Boundary: Susceptibility Snapshot Dispatch* brief gains, before the `Output path:` line, the input line `Triage record: .rdd/gates/{cycle}-{phase}-gate.md §Susceptibility snapshot findings and orchestrator triage` (Play and Synthesize, which subsume their gates, point at the producing artifact's "Findings and orchestrator triage" section instead) and the three questions: were pivots correctly identified; were framing-class findings surfaced; did any resolve disposition hide a destination change. The Research Skill additionally gains the non-gate triage record heading `## Findings and orchestrator triage` in the research-log loop-end template (line 127–146 area) and in the argument-audit handling step (line 330–371 area). Each skill with an EPISTEMIC GATE gains the one-sentence pointer in its Decide step. The `Output path:` line and its position are unchanged (dispatch-prompt discipline).

**Provenance:** ADR-100 rule 5 (non-gate record placement by ADR-067's decision procedure), §Where the isolation lives; conformance-scan-decide-020 rows for the eight brief sites.

**Fitness:**
- **Fitness:** "Every brief names the record" — `grep -l "Triage record:" skills/*/SKILL.md` returns the eight phase skills; verified by grep.
- **Fitness:** "Dispatch extraction is unaffected" — `hooks/tests/test_output_path_regex.sh` passes on each amended brief's `Output path:` line; verified by running the hook test suite.

#### Module: Susceptibility Snapshot Evaluator Agent (`agents/susceptibility-snapshot-evaluator.md`) — AMENDED in v17.0

**v17.0 amendments (ADR-100 §Where the isolation lives):** **Input** gains "the triage record" (path supplied by the brief). **Process** gains step 4, *Triage-record evaluation*: for each row, was the disposition warranted; was any pivot dispositioned resolve; did every framing-class finding reach the presentation; does the pivot criterion as applied match Invariant 0's list. **Output** template gains `## Triage evaluation` with a per-row verdict table and a one-line answer to each of the three questions. The section is placed before `## Recommendation` so that the recommendation can cite it. The manifest's `required_headers` for the snapshot are unchanged this cycle.

**Provenance:** ADR-100 §Where the isolation lives, graduation trigger (the snapshot is the reliance/harm evidence source); `.rdd/audits/susceptibility-snapshot-020-decide.md` (the first snapshot to evaluate a triage record, done ad hoc).

**Fitness:**
- **Fitness:** "The isolated reader reads the record" — the agent file's Input section names the triage record and its Process has a numbered triage-evaluation step; verified by grep for "Triage evaluation" and "triage record".
- **Fitness:** "Absence is reported, not silently tolerated" — when the brief names a triage record that does not exist or has no rows, the snapshot's Triage evaluation section says so; verified by inspection of the agent text's instruction for the missing-record case.

#### Module: Tier 1 Verify Dispatch Hook (`hooks/scripts/tier1-verify-dispatch.sh`) — AMENDED in v17.0 (defect fix)

**v17.0 amendment:** the `EXPECTED_PATH` sed pipeline gains `s/\*\*$//` after the backtick-stripping rules so that a fully bold-wrapped line (`**Output path: X**`) extracts `X`. `hooks/tests/test_output_path_regex.sh` gains the fixture and its extractor copy is updated in lockstep (the test states it is a copy).

**Provenance:** conformance-scan-decide-020 (pre-existing defect row); `.rdd/audits/susceptibility-snapshot-020-discover.md` "Observed defect"; `.rdd/dispatch-log.jsonl` session f1575b68 entries.

**Fitness:**
- **Fitness:** "Bold-wrapped lines extract cleanly" — `extract_output_path '**Output path: .rdd/audits/x.md**'` returns `.rdd/audits/x.md`; verified by the new fixture in `test_output_path_regex.sh`.
- **Fitness:** "Existing variants still extract" — all seven prior fixtures pass unchanged; verified by the same test.

#### Cycle 020 deferred sweep — where the ADR-056 / ADR-066 / ADR-074 update content lands

ADR-099 and ADR-100 deferred the downstream sweep to BUILD. ARCHITECT states the landing sites:

| Artifact | Content that lands | When |
|---|---|---|
| `docs/system-design.agents.md` (this file) | Orchestrator module (pre-triage; gate-note triage section; toolkit first pass); Decide Skill module (record-as-body); new modules; integration contracts; fitness; tests | Now (v17.0) and final pass at BUILD WP-J |
| `docs/system-design.md` | "How the Cycle 020 amendments fit"; diagram gains Toolchain Layer; Amendment Log #18 | Now; final at WP-J |
| `docs/ORIENTATION.md` | §4: ADR-074 paragraph gains the record-as-body sentence; Tier 2 gains `views/`; Tier 3 gains `substrate/`; §5 current state | Regenerated post-ARCHITECT and post-BUILD |
| `docs/references/field-guide.md` | New "Module: Substrate Toolchain" (validate, derive, schemas, tests); Orchestrator module gains pre-triage; Decide/Model modules gain Author Substrate Record | BUILD Step 6 (field guide is generated when implementation exists) |
| `skills/rdd/SKILL.md` Gate Reflection Note template | Triage section (ADR-066 update) | BUILD WP-G |
| `skills/rdd/SKILL.md` Question Toolkit | First-pass-by-agent sentence (ADR-056 update) | BUILD WP-G |
| `skills/decide/SKILL.md` Step 2.5 | Record-as-body for post-ADR-099 units (ADR-074 update) | BUILD WP-F |

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

### Cycle 019 Empirical-Grounding Filter and Related Methodology Amendments Concepts (from ADRs 094–098 / Domain Model Amendments #25 / #26 / #28) — NEW in v16.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Convergence-Saturation Signal (Skill-Structure Layer mechanism at audit-round-end; TRIGGERED when P1=0 ∧ P2-new≤1 ∧ no new framings; STOP/CONTINUE/ESCALATE recommendation) | Argument Auditor Agent (Section 1 argument-audit + Section 2 framing-audit per ADR-061); Citation Auditor Agent; Orchestrator (reads verdict line for round-count decisions) | ADR-094 §"Signal-evaluation step"; Amendment #25 |
| Audit-Round-Count Calibration (default 3 rounds; rounds 4–5 conditional; rounds beyond 5 with explicit practitioner authorization) | Argument Auditor Agent; Citation Auditor Agent; Orchestrator (dispatcher) | ADR-094 §1; Amendment #25 |
| Verdict-Line Format (structured signal output: P1 count, P2-new count, new framings or claim-scope expansions, Recommendation) | Argument Auditor Agent; Citation Auditor Agent | ADR-094 §"Signal-evaluation step (skill-text amendment)"; Amendment #25 |
| Form-Change Baseline-Reset Rule (form-change events reset round-count baseline; new form's first audit is its R1; operationally demonstrated by Cycle 019 R3 audit) | Argument Auditor Agent; Citation Auditor Agent; Orchestrator (applies rule when dispatching post-form-change audits) | ADR-094 §"Form-change baseline-reset rule" (added at R3 P2-R3-3); Amendment #28 |
| Standard-Sequence vs. Re-Audit-After-Revision Distinction (signal applies to standard R1/R2/R3 sequence; single-purpose re-audits run unconditionally without verdict-line) | Argument Auditor Agent; Citation Auditor Agent; Orchestrator | ADR-094 §"Standard sequence vs. re-audit-after-revision" |
| Dogfooding Exception (first operational application of verdict-line mechanism may append verdict line as calibration artifact with distinguishing note) | Argument Auditor Agent | ADR-094 P2-R2-1 |
| Calibration Move (methodology pattern — naming-pattern-as-vocabulary at thin evidence; multi-cycle empirical evidence as graduation trigger) | Orchestrator (carries the concept across ADR-094 / ADR-095 / ADR-096 / ADR-097 / ADR-098) | Amendment #25; essay-outline-018 §10 |
| Agent Outcome Test (Tier-2 admissibility criterion for agent-facing artifacts; consumer-naming necessary but not sufficient) | Orchestrator (cross-cutting principle); all phase skills (apply at agent-facing artifact creation moments) | ADR-095 §"The test"; Amendment #25 |
| Consumer-Naming Actionability Requirement (test fails when consumer description covers every artifact — trivially-passing answers do not satisfy the test) | Orchestrator (carries the requirement); all phase skills (apply at artifact creation) | ADR-095 §"The test" P1-A clarification (R2 2026-05-22) |
| Apply Agent Outcome Test (action — practitioner-and-agent dyad invokes felt-trigger at agent-facing artifact creation) | All phase skills (deploy at agent-facing artifact creation moments) | ADR-095; Amendment #25 |
| Bolt-On / Felt Additional Signal at Agent-Facing Layer (failure-mode signal extension — applies the same Cycle 017 vocabulary to the agent-facing admissibility test) | Orchestrator (operating principle); practitioner (felt detection) | ADR-095 §"The test" (test fails clause) |
| Patch-Switching Criterion (Skill-Structure Layer; Pirolli & Card 1999 information-foraging at research-loop-end; CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis verdict) | Research Skill (encoded in skill text at loop-end boundary); practitioner-and-agent dyad (applies) | ADR-096 §"The criterion"; Amendment #25 |
| Practitioner-Elicited Expected Observation (verdict-line field populated by practitioner response to "what would change — not deepen — your reading?"; absence reads as reflexive engagement) | Research Skill (prompts practitioner); practitioner (responds) | ADR-096 R2 audit P3-2 (2026-05-22) |
| Reflexive-vs-Genuine Pre-Mortem Discrimination (reflexive answer triggers switch condition; Einstellung effect increases reflexive-answer likelihood after iterations) | Research Skill (agent operates discrimination at loop-end); practitioner (provides response) | ADR-096 R2 audit P2-3 (2026-05-22) |
| Late Patch-Addition (Cycle 019 Loop 6 pattern — synthesis surfaces question prior loops did not address; criterion can be re-invoked) | Research Skill (re-invokes criterion); practitioner-and-agent dyad (applies) | ADR-096 §"Late patch-additions"; Cycle 019 cycle-status §From RESEARCH |
| Apply Patch-Switching Criterion (action — dyad evaluates marginal yield at research-loop-end) | Research Skill | ADR-096 |
| Empirical-Grounding Filter (Tier-2 felt-trigger at DECIDE ADR-drafting; central commitment of Cycle 019) | Decide Skill (felt-trigger reference); Orchestrator (Important Principles); practitioner-and-agent dyad (applies) | ADR-097 §"The filter"; Amendment #25 |
| Four Grounding-Mechanism Paths (PLAY evidence; stakeholder-articulated demand; spike validation; structural operationalization) | Decide Skill (references); Orchestrator (carries the four paths) | ADR-097 §"Four grounding-mechanism paths"; Amendment #25 |
| Conditional Acceptance (institutional pattern from llm-orc — ADR status annotation "conditional acceptance — first-deployment evidence pending") | Decide Skill (deploys at non-grounded ADR drafting when commitment expected to land); Orchestrator (carries the pattern) | ADR-097 §"The filter" + llm-orc ADR-016 (R5 audit P2-R5-3); Amendment #25 |
| `adr-deferred-` Filename Pattern (institutional pattern from llm-orc — ADR filed with `adr-deferred-NNN-<slug>.md` prefix when commitment requires further deliberation) | Decide Skill (deploys at non-grounded ADR drafting when commitment requires further deliberation); Orchestrator (carries the pattern); Conform Skill (audit scope) | ADR-097 §"The filter" + llm-orc / plexus ADR-024; Amendment #25 |
| Commitment-Time Standalone vs. Grounding-Completion Standalone (two senses of "standalone" for ADR-097 — commitment-time means ADR can be drafted without PLAY; grounding-completion means empirical grounding closes at DECIDE-time) | Orchestrator (carries the distinction); Decide Skill (applies at ADR drafting) | ADR-097 §"Target 3" R2 audit P1-B (2026-05-22) |
| Structural Operationalization (fourth grounding-mechanism path — commitment grounded via DECIDE-phase spikes + BUILD-phase validation transitioning Conditional Acceptance to full Acceptance) | Decide Skill (orchestrates); Build Skill (executes validation) | ADR-097 R5 audit P2-R5-3; llm-orc ADR-016 institutional reference; Amendment #25 |
| Apply Empirical-Grounding Filter (action — dyad invokes felt-trigger at ADR-drafting) | Decide Skill | ADR-097; Amendment #25 |
| Kitchen-Sink Mechanism vs. Outcome Distinction (Target 2 discriminating-criterion gap — mechanism firing vs. outcome judgment; both inherit Tier-2 structural limit) | Orchestrator (carries the distinction as Tier-2 vocabulary); Decide Skill (applies at ADR drafting) | ADR-097 §"Target 2"; Amendment #25 + #26 (R5 narrowing) |
| Kitchen-Sink Mechanism (structural mechanism firing — research → ADR without empirical filter) | None (named concept); Orchestrator (carries the concept in Tier-2 vocabulary) | Amendment #25 + #26 |
| Kitchen-Sink Outcome (outcome judgment — unneeded elaboration vs. practitioner-PLAY-validated need) | None (named concept; qualified by Amendment #26); Orchestrator (carries the concept in Tier-2 vocabulary) | Amendment #25 + #26 (R5 narrowing) |
| PLAY-as-Filter (candidate framing — PLAY phase as empirical filter against kitchen-sink outcome; one observed case at llm-orc Cycle 5) | None (candidate framing for future-cycle development per R5 narrowing); Orchestrator (carries the framing as Tier-2 vocabulary) | Amendment #25 + #26 (R5 narrowing) |
| Distributed Remedy Architecture (candidate framing — remedy distributed across DECIDE-Filter + BUILD-Design-for-Learnability + PLAY-as-Filter + Loop-Back; R5-narrowed to candidate for future-cycle development) | None (candidate framing); Orchestrator (carries the framing as Tier-2 vocabulary) | Amendment #26 (R5 narrowing) |
| Validated Elaboration (large-and-needed elaboration outcome — YAGNI ≠ Minimalism distinction; need-tested elaboration is YAGNI-compliant regardless of size) | None (named concept); Orchestrator (carries the concept in Tier-2 vocabulary) | Amendment #25 |
| Nuance Calibration (sliding-scale framing — RESEARCH opens space; subsequent phases steer; remedies must not compress RESEARCH's nuance-surfacing function but neither preserve nuance against goal-served narrowing) | None (cross-cutting framing); Orchestrator (carries the calibration) | Amendment #25 + MODEL gate addendum |
| Practitioner Agency (load-bearing) (concept naming the methodology's reliance on practitioner judgment at Tier-2 felt-triggers; named as load-bearing for DISCOVER gate endorsement of ADR-097 Tier-2 scope) | None (cross-cutting concept); Orchestrator (carries the concept) | Amendment #25 |
| Practitioner-Originated Framing Absorption (FF1 — methodology's specialist subagents cover agent-produced claims but not practitioner-introduced framings at gate responses; the gate is the only check) | Orchestrator (carries the recognition); Susceptibility Snapshot Evaluator (surfaces at phase boundaries as advisory) | ADR-098 §"FF1"; Amendment #25 |
| FF1 Named-Deferral with Two-Direction Graduation Trigger (harm evidence: 2–4 cycles of framing absorption with non-pursued grounding action AND downstream demonstration of failure; reliance evidence: 2–4 cycles running grounding action that consistently catches material findings) | Orchestrator (records evidence accrual); cycle-status (carries instance records) | ADR-098 §"FF1 — Practitioner-originated framing audit gap" + R2 audit P2-6 |
| FF3 Named-Deferral with Two-Direction Graduation Trigger (harm evidence: 2–4 cycles of in-place RESEARCH amendments without re-audit; reliance evidence: 2–4 cycles running narrow re-audit that consistently catches material findings) | Orchestrator (records evidence accrual); cycle-status (carries instance records) | ADR-098 §"FF3 — Essay-Outline amendment re-audit protocol" + R2 audit P2-6 |
| R5 Audit Pattern (post-gate narrow re-audit on susceptibility-snapshot recommendation; named as cycle's current compound defense for backward-propagation events; reliability depends on orchestrator applying snapshot recommendation) | Orchestrator (dispatches per snapshot recommendation); Susceptibility Snapshot Evaluator (produces recommendation); Argument Auditor Agent (runs narrow re-audit) | ADR-098 §"FF3" + Cycle 019 MODEL R5 audit operational evidence + R2 audit P2-5 |
| Three-Application F-P2 Pattern (cross-ADR pattern — scope-limiting reasoning at consequential junctures in a cycle investigating whether RDD over-engineers; held as question, not resolved finding) | Orchestrator (carries the cross-cutting pattern as Tier-2 vocabulary); cycle-status (carries the count) | ADR-097 §"Three-Application F-P2 Pattern" + ADR-098 §"Three-Application F-P2 Pattern (continued)"; Amendment #25 |
| Record FF1/FF3 Graduation-Trigger Evidence (action — practitioner records cycle instance contributing to multi-cycle graduation count) | Orchestrator (records in cycle-status); practitioner (judges) | ADR-098 §"FF1" + §"FF3" |
| Cycle 019 Reading-Path Artifact (Cycle 019-scoped — navigation-layer artifact at `docs/decisions/cycle-019-adr-index.md` indexing the five Cycle 019 ADRs; respects working-memory bound without structural deletion; produced as the cycle's specific architectural response to the DECIDE-gate working-memory exchange — NOT a generalized methodology pattern. Whether the corpus-level granularity question is methodology-amendable is the knowledge-graph corpus collapse Open Question, not a settled answer.) | Cycle 019 DECIDE close (produced once); future-cycle decisions about parallel artifacts are case-by-case judgments, not pattern instantiations | `docs/decisions/cycle-019-adr-index.md`; Amendment #28 (consolidation reversal record); ARCHITECT-gate clarification 2026-05-22 |
| Knowledge-Graph Corpus Collapse (practitioner-named future-cycle research topic — can methodology corpus information be collapsed into knowledge-graph format respecting working-memory bounds while preserving audit-trail integrity?) | None (held as Open Questions entry); future-cycle research scope | Amendment #28 (Open Questions reference); cycle-status §From DECIDE feed-forward |
| C7-at-Corpus-Level Question (open question — whether ~100-ADR corpus accretion rate is itself an over-engineering signal the methodology's current criteria don't catch; corpus-level extension of C7 mechanism) | None (held as Open Questions entry); future-cycle research scope | Amendment #28; cycle-status §From DECIDE feed-forward |
| Consolidation-as-F-P2-Instance Question (open question — whether the Cycle 019 DECIDE-gate consolidation-then-restoration is the cycle's reflexive correction OR another instance of the same pattern; multi-cycle graduation trigger for ADR-097 is the test) | None (held as Open Questions entry); future-cycle research scope | Amendment #28; ADR-097 graduation trigger; cycle-status §From DECIDE feed-forward |

### Cycle 020 Substrate-and-Surface Separation and Pre-Triage Concepts (from ADRs 099–100 / Domain Model Amendments #29 / #30) — NEW in v17.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Substrate (the layer of structured records, one per governance unit, carrying audit-substance and provenance) | Substrate (`docs/substrate/`) | ADR-099 §The architecture; Amendment #29 |
| Typed Link (directed relationship between records with a type and note text; type set extensible) | Substrate (data); Record Validator (schema `link.schema.json`) | ADR-099 constraint 1; Amendment #29 |
| Note Discipline (every non-trivial link carries note text; `references` is the sole trivial type) | Record Validator (enforces); Substrate (satisfies) | ADR-099 constraint 2; scenario *Note Discipline validation rejects an unnoted non-trivial link* |
| Per-type record schema (`adr`, `pattern`, `term`; minimal required fields; optional fields permitted) | Record Validator (`schema/`) | ADR-099 constraint 3; ARCHITECT decision (three types this cycle) |
| Record form: full vs index; compressed marker; canonical-source field | Substrate (data); Record Validator (required-field asymmetry); Surface Deriver (renders the marker) | ADR-099 constraint 4, §Authority C |
| Nested sub-decision (an ADR record's `sub_decisions[]`, each with commitment and rationale; status only while in DECIDE) | Record Validator (schema); Surface Deriver (renders as sub-sections) | ADR-099 constraint 4, §Authority (nested sub-decision status pattern); scenario *ADR record with sub-decisions nests them* |
| Surface View (view computed from the Substrate at a chosen resolution; overview first, drill-in on demand; focus+context; incompleteness signaled; never hand-maintained) | Surface Views (`docs/views/`) as artifact; Surface Deriver (produces) | ADR-099 §The architecture; Amendment #29 |
| Substrate-and-Surface Separation (the architectural commitment) | Orchestrator (names the commitment in Artifacts Summary and the three-tier hierarchy); Surface Deriver (realizes single-source derivation) | ADR-099; Amendment #29 |
| Single-source derivation (corrections go to the Substrate; views regenerated; `--check` detects drift) | Surface Deriver; Conformance Audit Skill (runs `--check`) | ADR-099 §The architecture; ARCHITECT decision (no hook) |
| Derived ADR markdown at `docs/decisions/adr-NNN-<slug>.md` with canonical-record header | Surface Deriver (writes); Decide Skill (triggers) | ADR-099 §Authority C; scenario *A new governance unit is authored as a record and its markdown is derived* |
| `domain-model.md` marked region for post-ADR-099 terms | Surface Deriver (writes); Model Skill (triggers) | ARCHITECT decision; ADR-099 §Authority C applied to terms |
| Legacy index record (identifier, title, status, typed links with notes, compressed summary) for ADRs 001–098 | Substrate (data); BUILD WP-E (authors; cost measured) | ADR-099 §Authority C, constraint 6; scenario *A legacy unit is indexed, not migrated* |
| Promotion of a legacy unit to a full record on substantive touch (supersession; Pattern compression) | Decide Skill (performs when a cycle supersedes a legacy ADR) | ADR-099 §Authority C; scenario *A legacy unit is promoted on supersession* |
| Author Substrate Record (action: AI drafts the record with per-type fields and noted links; user rules on its pivots at the gate) | Decide Skill (ADR records); Model Skill (term records); Record Validator (validates the result) | ADR-099 constraint 6; Amendment #29, #30 (actor correction) |
| Derive Surface View (action: generate every view from the Substrate in one pass) | Surface Deriver (implements); Decide Skill and Model Skill (invoke at phase exit); BUILD Step 5.5 (invokes on the real corpus) | ADR-099 §The architecture; Amendment #29 |
| Substrate authoring overhead at corpus scale (~98 legacy index records; untested) | BUILD WP-E (measures and records in cycle-status) | ADR-099 constraint 6, Negative consequence; product-discovery value tension *Substrate authoring overhead vs. corpus overwhelm* |
| Calibration-with-Graduation-Trigger Pattern (the single decision structure ADRs 083, 091, 094–098 instantiate) | Substrate (`pattern/calibration-with-graduation-trigger.json`, the first Pattern record); Orchestrator (vocabulary, unchanged from v16.0) | Essay-Outline 020 C1; Amendment #29; scenario *Records with Typed Links derive to an overview and drill-in views* |
| Corpus Overwhelm (felt experience at holistic-synthesis moments; decomposes into reading load and Adjudication Load) | Orchestrator (names the decomposition in Important Principles) | Amendment #29; ADR-099 §Complement, not substitute |
| Adjudication Load (decisions handed back per loop or audit round) | Orchestrator (Pre-triage step reduces it) | Amendment #29; ADR-100 rules 1–5 |
| Pivot Point (a finding that changes what gets built, for whom, or why; the unit that reaches the practitioner) | Orchestrator (Pre-triage step applies the criterion); Susceptibility Snapshot Evaluator Agent (checks the criterion's application as its first triage check) | ADR-100 rule 2; Amendment #29 |
| Pre-Triage (action: sort findings into resolve / carry forward / pivot; run the question form on the agent's own side; record the triage) | Orchestrator (Stage Gates Pre-triage step); Research Skill (non-gate record at loop-end and audit-round-end) | ADR-100 rules 1–5; Amendment #29 |
| Triage record (gate-note section `## Susceptibility snapshot findings and orchestrator triage`; non-gate section `## Findings and orchestrator triage`; table of finding, disposition, what was done) | Orchestrator (gate-note template); Research Skill (non-gate template sites); Susceptibility Snapshot Evaluator Agent (reads) | ADR-100 rule 5; ADR-066 update |
| Route default with override (a route-level choice presented with the agent's choice and the alternative named) | Orchestrator (presentation rule) | ADR-100 rule 2; scenario *A route-level choice is presented as an overridable default* |
| Engine-level disposition (resolved by the agent and logged; listed in the presentation only under reflexive opt-in) | Orchestrator (Pre-triage step; reflexive opt-in clause) | ADR-100 rule 2, §Posture |
| Agent-first question pass (the agent runs belief-mapping / rebuttal / warrant elicitation on itself before asking) | Orchestrator (Question Toolkit preamble; Pre-triage step) | ADR-100 rule 3; ADR-056 update |
| Framing-class finding never silently resolved (surfaced with analysis and a pivot extracted) | Orchestrator (Pre-triage step); Susceptibility Snapshot Evaluator Agent (verifies) | ADR-100 rule 4; ADR-061 |
| Inline citation at point of use (cited invariant, ADR section, scenario, or term quoted or glossed adjacent) | Orchestrator (presentation rule) | ADR-100 rule 6; scenario *A pivot is presented with referenced content inline* |
| One screen, one ruling | Orchestrator (presentation rule) | ADR-100 rule 7 |
| Triage evaluation by the isolated reader (were pivots identified; were framing-class findings surfaced; did any resolve hide a destination change) | Susceptibility Snapshot Evaluator Agent (Process step 4; Output section); all eight phase skills (brief names the record) | ADR-100 §Where the isolation lives; scenario *The snapshot brief evaluates the triage record* |
| ADR-100 named grounding action (targeted lit-review: management by exception; escalation and hand-off policy in human-automation teaming; triage in human-AI decision systems) | Research Skill (lit-reviewer dispatch, BUILD WP-I) | ADR-100 §Scope, tier, and grounding |
| Convergent vs. new-problem reading of the audience-bifurcation lineage (held caveat) | Orchestrator (carried in cycle-status; no module change) | ADR-099 §Context, §Held caveat; Essay-Outline 020 C5 |
| Dispatch-path extraction of bold-wrapped `Output path:` lines | Tier 1 Verify Dispatch Hook | conformance-scan-decide-020 (defect row) |

## Dependency Graph

```
Plugin Manifest (.claude-plugin/plugin.json)
│
├── Skills Layer ─────────────────────────────────────────────────
│   Orchestrator
│   ├── Research Skill ──dispatches──→ citation-auditor, argument-auditor, lit-reviewer, spike-runner
│   │      └── (v14.0 / ADR-087) validation-spike decision at research → discover gate
│   │      └── (v16.0 / ADR-096) Patch-Switching Criterion at research-loop-end with structured verdict line
│   ├── Product Discovery Skill
│   ├── Model Skill
│   ├── Decide Skill ──dispatches──→ argument-auditor, conformance-scanner
│   │      └── (v14.0 / ADR-074 ext.) downstream sweep includes system-design.agents.md
│   │      └── (v16.0 / ADR-097) Empirical-Grounding Filter felt-trigger at ADR-drafting (Tier-2)
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
│   citation-auditor (Sonnet) ──reads──→ essay/outline ──writes──→ audit at canonical path + Convergence-Saturation Signal verdict line (v16.0 / ADR-094)
│   argument-auditor (Sonnet) ──reads──→ artifact + source material ──writes──→ two-section audit (argument + framing) + Convergence-Saturation Signal verdict line per section at round-end (v16.0 / ADR-094)
│   lit-reviewer (Sonnet) ──reads──→ research question ──writes──→ research log entry
│   conformance-scanner (Sonnet) ──reads──→ ADRs, codebase ──writes──→ conformance debt table
│   orientation-writer (Sonnet) ──reads──→ artifact corpus ──writes──→ ORIENTATION.md
│   spike-runner (inherit) ──reads──→ spike question ──writes──→ research log entry [v14.0: also validation spikes]
│   research-methods-reviewer (Sonnet) ──reads──→ research question set ──writes──→ research design review
│   susceptibility-snapshot-evaluator (Sonnet) ──reads──→ AID susceptibility signals ──writes──→ Susceptibility Snapshot
│
├── Toolchain Layer ──────────────────────────────────────────── NEW in v17.0 (ADR-099)
│   tools/substrate/validate.js ──reads──→ docs/substrate/<type>/<id>.json  (Record Validator)
│   tools/substrate/derive.js   ──calls──→ validate.js; ──reads──→ docs/substrate/
│                               ──writes──→ docs/views/overview.md, docs/views/<id>.md
│                               ──writes──→ docs/decisions/adr-NNN-<slug>.md (form: full records only)
│                               ──writes──→ docs/domain-model.md  (marked region only)
│   tools/substrate/schema/{adr,pattern,term,link}.schema.json
│   tools/substrate/tests/  (node --test; fixture corpus = Cycle 019 sample)
│   Invoked by: Decide Skill (Step 2; phase exit), Model Skill (Step 2; phase exit),
│               Conformance Audit Skill (--check), BUILD Step 5.5
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

**Toolchain edges (v17.0):** Decide Skill → Record Validator (CLI, after Author Substrate Record); Decide Skill → Surface Deriver (CLI, at phase exit); Model Skill → Record Validator; Model Skill → Surface Deriver; Conformance Audit Skill → Surface Deriver (`--check`); Surface Deriver → Record Validator (in-process call; refuses invalid input); Record Validator → Substrate (read); Surface Deriver → Substrate (read); Surface Deriver → Surface Views, derived ADR markdown, `domain-model.md` marked region (write). **Layering:** Substrate (data) is innermost; Validator depends only on Substrate and its schemas; Deriver depends on Validator; skills depend on the tools by CLI and never the reverse; tools never read skill or agent files. No cycles.

**Pre-triage edges (v17.0):** Orchestrator → Gate Reflection Note (writes the triage section; existing ADR-066 edge amended); Research Skill → research log and audit report (writes the non-gate triage section); Phase Skill → Susceptibility Snapshot Evaluator (brief carries the triage-record path; existing ADR-065 edge amended); Susceptibility Snapshot Evaluator → Gate Reflection Note or producing artifact (reads the triage record; new read edge). No hook edges change.

**Skill-level edges:** Orchestrator → all phase skills + Conformance Audit Skill; Build → Debug, Refactor, Review (mode-shift, not dispatch); Synthesis → Research (conditional re-entry); Play and Debug/Refactor dispatch no specialist subagents.

**Skill-to-agent dispatch edges:** All Tier 1 dispatches use the canonical prompt skeleton per ADR-065 with literal `Output path:` line at structurally privileged position. Phase skills dispatch susceptibility-snapshot-evaluator at phase-end (per ADR-065 Fix 1, NOT orchestrator-centralized). Research dispatches research-methods-reviewer before each loop after substantial revision (per ADR-060). Argument-auditor dispatches include framing audit per ADR-061. **Argument-auditor and citation-auditor dispatches produce a Convergence-Saturation Signal verdict line at round-end (v16.0 / ADR-094)** — orchestrator reads the verdict line to decide round-count action. Form-change events reset the round-count baseline; the new form's first audit is its R1, not a continuation of the prior form's round count.

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

### Cycle 019 (v16.0) Integration Contracts

#### Argument Auditor / Citation Auditor → Convergence-Saturation Signal Verdict Line (ADR-094)

**Protocol:** At the end of each audit round, the auditor agent appends a structured verdict line to the audit artifact. Format per ADR-094 §"Signal-evaluation step":
```
**Convergence-Saturation Signal:** [TRIGGERED | NOT TRIGGERED]
- P1 count this round: N
- P2 count this round (new, non-carry-over): N
- New framings or claim-scope expansions: [list, or "none"]
- Recommendation: [STOP at this round | CONTINUE to next round | ESCALATE for practitioner judgment]
```
For argument-auditor's combined dispatch (per ADR-061), the verdict line appears for both Section 1 (argument-audit) and Section 2 (framing-audit) at the dispatch's end. For citation-auditor, the verdict line appears once at the round-end.

**Shared types:** Verdict-line section in audit-artifact markdown; orchestrator reads the verdict to decide round-count action (STOP, CONTINUE, ESCALATE).

**Error handling:** Verdict-line malformation or absence → orchestrator falls back to practitioner judgment per status quo; the signal scaffolds, does not replace, practitioner authority over the audit cycle.

**Form-change baseline-reset rule:** When an artifact undergoes form-change (restructuring, consolidation, replacement), the orchestrator treats the new form's first audit as R1 for saturation-signal purposes — the prior form's verdict line does not carry forward.

**Owned by:** Argument Auditor Agent and Citation Auditor Agent own the verdict-line format and threshold evaluation; orchestrator owns the round-count decision; ADR-094 §"Signal-evaluation step" owns the specification.

#### Research Skill → Patch-Switching Criterion Verdict Line (ADR-096)

**Protocol:** At the end of each research loop in `/rdd-research`, the practitioner-and-agent dyad applies the Patch-Switching Criterion. The agent first elicits the practitioner's expected observation ("What specific observation in the next loop would change your reading of the problem space — not deepen it, but change it?"). The dyad's decision is recorded as a structured verdict line in the research log per ADR-096 §"Verdict-line format":
```
**Patch-Switching Criterion (loop N → loop N+1 decision):**
- Marginal yield this loop: [P1 / P2 / P3 findings; new framings; questions answered]
- Specific question for next loop: [name it, or "none"]
- Practitioner expected observation: [practitioner's response, or "none (practitioner did not specify)"]
- Recommendation: [CONTINUE-this-patch | SWITCH-patch | SWITCH-to-synthesis]
```

**Shared types:** Verdict-line section in research-log markdown; the orchestrator and subsequent research-skill invocations read the verdict for next-loop decisions.

**Error handling:** Reflexive-vs-genuine pre-mortem discrimination — a reflexive answer triggers the switch condition, not the stay condition. Absence of substantive practitioner engagement reads as "none (practitioner did not specify)." Practitioner override of the recommendation is recorded with rationale in the research log.

**Late patch-addition handling:** If a synthesis pass surfaces a question prior loops did not address, the criterion can be re-invoked. The decision (new patch vs. scope-of-claim-encoding) is recorded with rationale.

**Owned by:** Research Skill owns the criterion prompt and verdict-line format; practitioner owns the response to the expected-observation question; ADR-096 §"The criterion" + §"Verdict-line format" own the specification.

#### Decide Skill → Empirical-Grounding Filter felt-trigger (ADR-097 — Tier-2)

**Protocol:** When DECIDE drafts an ADR that commits to a feature based on research-surfaced possibility, the practitioner-and-agent dyad applies the felt-trigger question: *"Is this commitment empirically grounded — by PLAY evidence, stakeholder-articulated demand, spike validation, or structural operationalization — or is it surviving from research without empirical filter?"*

**Shared types:** Practitioner judgment at ADR-drafting time; the dyad's evaluation is recorded in the ADR's Provenance check or Rationale section. When the ADR is not grounded, two forms are available: (a) Conditional Acceptance annotation in the ADR's Status field; (b) `adr-deferred-NNN-<slug>.md` filename pattern.

**Error handling:** Tier-2 felt-trigger — the methodology scaffolds judgment but does not enforce it. Where the practitioner cannot invoke one of the four grounding paths, the outcome judgment is recognized as practitioner-judgment-alone (the discriminating-criterion gap, Target 2).

**Owned by:** Decide Skill carries the felt-trigger reference; practitioner-and-agent dyad applies the test; orchestrator's "Important Principles" section names the filter as cross-cutting; ADR-097 §"The filter" + §"Four grounding-mechanism paths" own the specification.

#### Cross-Phase → Agent Outcome Test (ADR-095 — Tier-2)

**Protocol:** When any phase proposes a new agent-facing artifact (an ADR, scenario block, domain-model entry, system-design section, audit-report template, skill text addition), the practitioner-and-agent dyad applies the felt-trigger: *"Does this artifact produce direct agent consumption without re-orientation cost, or does it feel additional to the agent-facing corpus the methodology already provides?"*

**Shared types:** Practitioner judgment at agent-facing artifact creation; the consumer-naming requirement applies — the artifact's intended consumer must be named with sufficient specificity to produce an actionable distinction.

**Error handling:** Tier-2 felt-trigger — the methodology scaffolds judgment but does not enforce it. The consumer-naming requirement is necessary but not sufficient; trivially-passing answers (e.g., "future practitioners re-reading this cycle") do not satisfy the test when the consumer description covers every artifact.

**Owned by:** All phase skills apply the test at agent-facing artifact creation moments; orchestrator's "Important Principles" section names the test as cross-cutting; ADR-095 §"The test" owns the specification.

#### Cross-Phase → FF1 / FF3 Graduation-Trigger Evidence Recording (ADR-098)

**Protocol:** When a future cycle exhibits a Practitioner-Originated Framing Absorption pattern (per ADR-098 §"FF1") or an in-place amendment to RESEARCH artifacts during a downstream phase (per ADR-098 §"FF3"), the practitioner records the instance in the cycle-status as contributing to the multi-cycle graduation trigger evidence. The trigger is **two-direction** — harm evidence (snapshot identifies framing absorption, practitioner does not pursue grounding action, downstream phase demonstrates the failure) OR reliance evidence (snapshot recommends grounding action, action consistently catches material findings).

**Shared types:** cycle-status entries record graduation-trigger instances; future-cycle methodology amendment review reads cycle-status entries when proposing structural amendment.

**Error handling:** Tier-2 named-deferral — the methodology recognizes the gaps at the vocabulary level without claiming structural enforcement. If future cycles do not produce graduation-trigger evidence, the gaps remain recognized-but-deferred indefinitely.

**Owned by:** Orchestrator records evidence in cycle-status; practitioner judges the instance classification; ADR-098 §"FF1" + §"FF3" own the graduation-trigger specifications.

### Cycle 020 (v17.0) Integration Contracts

#### Decide Skill / Model Skill → Record Validator (ADR-099)

**Protocol:** CLI. `node tools/substrate/validate.js [<path>...]`; with no arguments, validates every record under `docs/substrate/`. Exit 0 on success. Exit 1 on any failure, with one line per failure on stderr: `<record path>: <field or links[i]>: <message>`.
**Shared types:** the record JSON shapes in `tools/substrate/schema/`; the link sub-schema (`type`, `target`, `note`).
**Error handling:** the skill reports the validator's stderr to the agent verbatim; the agent corrects the record and re-runs. A record that cannot be made to validate is a schema question for a design amendment, not a reason to skip validation.
**Owned by:** Record Validator owns the schemas and messages; the skills own when they invoke it.

#### Surface Deriver → Record Validator (ADR-099)

**Protocol:** in-process function call (`require('./validate.js').validateAll(dir)`). The deriver calls it first and exits 1 with the validator's messages, writing nothing, if any record fails.
**Shared types:** the parsed record objects the validator returns on success (the deriver renders from these, not from re-reading files).
**Error handling:** as above; no partial output on failure.
**Owned by:** Record Validator owns the return shape; Surface Deriver owns the refusal behavior.

#### Decide Skill / Model Skill / Conformance Audit Skill / BUILD Step 5.5 → Surface Deriver (ADR-099)

**Protocol:** CLI. `node tools/substrate/derive.js` regenerates all outputs; `--check` writes nothing and exits 1 listing every output path whose regenerated content differs from disk. Options `--substrate <dir>`, `--views <dir>`, `--decisions <dir>`, `--domain-model <file>` default to the corpus paths.
**Shared types:** output file set: `docs/views/overview.md`; `docs/views/<id>.md` per record; `docs/decisions/adr-NNN-<slug>.md` per `adr` record with `form: full` (the slug comes from the record's `slug` field); the marked region in `docs/domain-model.md`.
**Error handling:** exit 1 on validation failure (nothing written); exit 1 on `--check` drift (paths listed); exit 2 on missing input directory.
**Owned by:** Surface Deriver owns the output shapes and the header/marker text; the invoking skills own the timing.

#### Surface Deriver → derived ADR markdown (ADR-099 §Authority C; ADR-074 as updated)

**Protocol:** file write, whole-file overwrite. The first lines of every derived ADR file are a blockquote header: `> **Derived from `docs/substrate/adr/adr-NNN.json` (Substrate record; canonical). Do not edit this file; correct the record and re-run `node tools/substrate/derive.js`.**` followed by the ADR-074 supersession header if the record's `supersession` field is set, then the rendered sections in the DECIDE skill's ADR template order (Status, Context, Decision with nested sub-decisions as sub-sections, Rejected alternatives, Consequences, Provenance check).
**Shared types:** the `adr` full record; the ADR template section order.
**Error handling:** the deriver never writes a file at a path whose first line is not its own header unless no file exists there (the first derivation of ADR-099 and ADR-100 replaces the prose files; this is done once at BUILD WP-D with `--replace` and a narrow audit round, and `--replace` is refused otherwise). Legacy files (index records) are never written.
**Owned by:** Surface Deriver owns the header and section order; ADR-074 owns the supersession header format.

#### Surface Deriver → `docs/domain-model.md` marked region (ADR-099 applied to terms)

**Protocol:** file write limited to the text between `<!-- substrate:terms:begin -->` and `<!-- substrate:terms:end -->` inside the Concepts table. The region holds one table row per `term` record in id order, in the Concepts table's four-column form (Term, Definition, Product Origin, Related). If the markers are absent, the deriver exits 1 naming the file; it never inserts markers itself (MODEL places them once at BUILD WP-D).
**Shared types:** the `term` record; the Concepts table row format.
**Error handling:** exit 1 on missing markers; the file is unchanged.
**Owned by:** Surface Deriver owns the row rendering; Model Skill owns marker placement.

#### Orchestrator → Gate Reflection Note (ADR-066 as updated by ADR-100)

**Protocol:** the required structure gains `## Susceptibility snapshot findings and orchestrator triage` (a table: Finding | Disposition | What was done; dispositions are `Resolved`, `Carried forward`, `Pivot`, or `Surfaced` for framing-class findings presented whole) and, when an audit ran during the phase, `## Argument-audit findings and orchestrator triage` in the same form. The four ADR-066 sections are unchanged and precede the triage sections.
**Shared types:** the disposition vocabulary; the finding identifiers used by the audit or snapshot.
**Error handling:** the manifest does not check the new sections this cycle; absence is caught by the next boundary's snapshot (Triage evaluation reports "no record"), which is the ADR-100 harm-evidence channel.
**Owned by:** Orchestrator owns the template; ADR-100 rule 5 owns the requirement.

#### Phase Skill → Susceptibility Snapshot Evaluator Agent (ADR-065 as amended by ADR-100)

**Protocol:** the dispatch brief gains, immediately before the `Output path:` line, `Triage record: <path> §<section>` and the three triage questions. The `Output path:` literal line is unchanged in form and position.
**Shared types:** the triage record table; the snapshot's `## Triage evaluation` section (per-row verdict: Warranted | Should have been a pivot | Should have been surfaced | Not found in presentation; plus one-line answers to the three questions).
**Error handling:** a missing or empty triage record is reported in `## Triage evaluation`, never treated as clean. The manifest's `required_headers` for the snapshot are unchanged this cycle.
**Owned by:** the phase skill owns the brief; the evaluator agent owns the output section.

#### Tier 1 Verify Dispatch Hook → Dispatch Log (ADR-064; defect fix)

**Protocol:** unchanged JSONL entry; the `expected_path` extraction now strips a trailing `**`.
**Shared types:** unchanged.
**Error handling:** unchanged (fails safe to allow).
**Owned by:** the hook script; the fixture test asserts the extraction.

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

### Cycle 019 (v16.0) Fitness Criteria

| Criterion | Measure | Threshold | Derived From |
|-----------|---------|-----------|--------------|
| Convergence-Saturation Signal verdict line is documented at round-end position in argument-auditor | `agents/argument-auditor.md` contains the verdict-line format string at the round-end position for both Section 1 (argument-audit) and Section 2 (framing-audit) of the combined dispatch | Verdict-line format present at both section round-ends | ADR-094 §"Signal-evaluation step (skill-text amendment)"; ADR-061 (single-file combined dispatch) |
| Convergence-Saturation Signal verdict line is documented at round-end position in citation-auditor | `agents/citation-auditor.md` contains the verdict-line format string at the round-end position | Verdict-line format present | ADR-094 §"Signal-evaluation step (skill-text amendment)" |
| Convergence-Saturation Signal threshold values are encoded consistently | Both `argument-auditor.md` and `citation-auditor.md` specify TRIGGERED conditions as P1 = 0 AND P2-new ≤ 1 AND no new framings | Threshold values present and consistent across both agent files | ADR-094 §1 |
| Form-change baseline-reset rule is documented | `agents/argument-auditor.md` and `agents/citation-auditor.md` document the rule that form-change events reset the round-count baseline (new form's first audit is its R1) | Rule documented in both agent files | ADR-094 §"Form-change baseline-reset rule" (R3 P2-R3-3) |
| Standard-sequence vs. re-audit-after-revision distinction is encoded | Both agent files document that the signal applies to standard-sequence rounds (R1, R2, R3, ...) and not to single-purpose re-audits dispatched per the re-audit-after-revision rule | Distinction documented in both agent files | ADR-094 §"Standard sequence vs. re-audit-after-revision" |
| ESCALATE-for-practitioner-judgment branch is documented as escape valve | `agents/argument-auditor.md` documents the ESCALATE branch as the agent's response when uncertain about new-framings classification | ESCALATE branch present | ADR-094 P2-R5-2 |
| Default audit round count is documented as 3 | Both agent files (or orchestrator) document the default round count as 3 with rounds 4–5 conditional on the signal | Default round count = 3 documented | ADR-094 §1 |
| Rounds beyond 5 require explicit practitioner authorization | Both agent files (or orchestrator) document that R6+ rounds require practitioner-authorized rationale recorded in dispatch | R6+ practitioner-authorization documented | ADR-094 §1 |
| ADR-094 naming clarification applied (two-file enumeration covering combined dispatch + citation-auditor) | `docs/decisions/adr-094-audit-round-count-convergence-saturation.md` §"Signal-evaluation step" states the amendment scope as two files (`argument-auditor.md` covering both sections per ADR-061 + `citation-auditor.md`); no reference to a non-existent `framing-auditor.md` as a separate file | Two-file enumeration present; non-existent file reference removed | conformance-scan-decide-019.md §Cluster 1 (structural clarification) |
| Patch-Switching Criterion is documented at research-loop-end boundary | `skills/research/SKILL.md` line 147 area (loop-again decision point) contains the Pirolli-Card-anchored question | Criterion question present at loop-again decision point | ADR-096 §"Skill-text amendment site" |
| Patch-Switching Criterion verdict-line format is documented | `skills/research/SKILL.md` contains the verdict-line format with three-way recommendation (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis) | All three verdict-token strings present | ADR-096 §"Verdict-line format" |
| Practitioner-elicited "expected observation" field is documented as practitioner-elicited | `skills/research/SKILL.md` specifies that the agent prompts the practitioner with the expected-observation question before appending the verdict line | Prompting language present | ADR-096 R2 audit P3-2 (2026-05-22) |
| Reflexive-vs-genuine pre-mortem discrimination is encoded | `skills/research/SKILL.md` documents that a reflexive answer triggers the switch condition, with the "change (not deepen) the reading" diagnostic | Reflexive/genuine distinction present | ADR-096 R2 audit P2-3 (2026-05-22) |
| Late patch-additions accommodation is encoded | `skills/research/SKILL.md` documents that the criterion can be re-invoked during synthesis if a new patch surfaces; new patch's marginal-yield rationale or scope-of-claim-encoding alternative recorded in research log | Late-patch-addition language present | ADR-096 §"Late patch-additions" |
| Patch-Switching Criterion amendment size is bounded | `skills/research/SKILL.md` Patch-Switching Criterion amendment is ~10–15 lines, localized to the line-147 area | Amendment size within bounds; localized to single skill-text section | ADR-096 §"Skill-text amendment site" + §"Verdict-line format" |
| Empirical-Grounding Filter is named in orchestrator's "Important Principles" | `skills/rdd/SKILL.md` "Important Principles" section names the filter with the four grounding-mechanism paths | Filter named with four paths | ADR-097; ADR-098 cross-reference |
| Agent Outcome Test is named in orchestrator's "Important Principles" | `skills/rdd/SKILL.md` "Important Principles" section names the test as the agent-facing parallel to ADR-083 with consumer-naming-actionability requirement | Test named with consumer-naming requirement | ADR-095 P1-A R2 (2026-05-22) |
| FF1 / FF3 named-deferrals are documented with two-direction graduation triggers | `skills/rdd/SKILL.md` or `docs/system-design.agents.md` documents FF1 and FF3 with both harm-evidence and reliance-evidence trigger conditions | Two-direction trigger language present for both FF1 and FF3 | ADR-098 R2 audit P2-6 (2026-05-22) |
| R5 Audit Pattern is documented as cycle's current compound defense for backward-propagation events | `skills/rdd/SKILL.md` or `docs/system-design.agents.md` documents the R5 audit pattern (post-gate narrow re-audit on susceptibility-snapshot recommendation) with explicit Skill-Structure-Layer-in-spirit-but-not-enforced caveat | R5 audit pattern documented with reliability caveat | ADR-098 §"Recognition" + R2 audit P2-5 (2026-05-22) |
| Three-Application F-P2 Pattern is named as held question | `docs/system-design.agents.md` or `skills/rdd/SKILL.md` names the pattern as a held question with multi-cycle graduation triggers (ADRs 094, 095, 097, 098) as the assessability test | Pattern named as held question | ADR-097 §"Three-Application F-P2 Pattern" + ADR-098 §"Three-Application F-P2 Pattern (continued)" |
| Reading-path artifact exists at canonical path | `docs/decisions/cycle-019-adr-index.md` exists | File present | Amendment #28 (consolidation reversal record) |
| Reading-path artifact names its intended consumer with actionable distinction | `docs/decisions/cycle-019-adr-index.md` opening section names the intended consumer (future practitioners or readers consulting Cycle 019's methodology amendments) and produces an actionable distinction (read this first; skip to ADR-097 if that's all you need) | Consumer named; actionable distinction present | ADR-095 §"The test" — applied to the reading-path artifact itself |
| Reading-path artifact ranks the five ADRs with ADR-097 named as central commitment | `docs/decisions/cycle-019-adr-index.md` ranks ADRs with ADR-097 named first as central commitment; supporting mechanisms (094, 095, 096, 098) named in any order | ADR-097 named as central; four supporting ADRs listed | Amendment #28; cycle-status §From DECIDE |
| Cycle 019 modules: zero new code modules introduced | Module count in dependency graph after Cycle 019 BUILD == module count before Cycle 019 BUILD | Module count unchanged | Cycle 019 ARCHITECT design judgment |
| Cycle 019 amended modules: max responsibility growth per module ≤ 12 | Argument Auditor Agent and Research Skill each gain ≤ 12 new responsibility-matrix entries from Cycle 019 concepts | Largest amendment (Argument Auditor Agent) ≤ 12 entries | ADR-076 prevention principle |
| Cycle 019 dependency graph has no new cycles | Walk each new edge introduced by Cycle 019 amendments (verdict-line communication edges from auditor agents to orchestrator are pre-existing; practitioner-elicited expected-observation edge in Research Skill is pre-existing); verify no return path within v16.0 additions | Zero new edges; zero cycles detected | Architecture invariant |
| No ship-together constraint between Cycle 019 ADRs | The five ADRs are independently scoped — ADR-094 + ADR-096 are skill-text amendments at distinct workflow boundaries; ADRs 095 / 097 / 098 are Tier-2 vocabulary with no Skill-Structure Layer hooks. BUILD pass landing one of the five does not require landing any other in the same pass | No ship-together constraint asserted | Cycle 019 ARCHITECT design judgment; conformance-scan-decide-019.md |
| Domain Model Amendments #25 / #26 / #28 are landed in domain-model.md | `docs/domain-model.md` Amendment Log contains entries #25 (24 concepts; 5 actions; ~25 relationships; 6 open questions; 24 synonym aliases), #26 (R5 narrowing — PLAY-as-Filter / Distributed Remedy Architecture / Kitchen-Sink Outcome qualified), #28 (consolidation reversal supersedes #27) | All three amendments present in Amendment Log | Cycle 019 MODEL + DECIDE phase records |
| Three Open Questions documented in domain-model.md | `docs/domain-model.md` Open Questions section contains the corpus-level granularity question, knowledge-graph corpus collapse question, and consolidation-as-F-P2-instance question (referenced under Cycle 019 entry) | All three Open Questions documented | cycle-status §From DECIDE feed-forward |
| Cycle 019 evidence-base scope-of-claim caveat encoded | `docs/system-design.md` or `docs/system-design.agents.md` carries the caveat that Cycle 019's findings are research-not-validation; cross-project evidence is agent-conducted with agent-reading uncertainty; MODEL+DECIDE intra-cycle instances count as one cycle's worth of FF1 graduation evidence | Caveat encoded | cycle-status §From MODEL feed-forward item #11 |

### Cycle 020 (v17.0) Fitness Criteria

| Criterion | Measure | Threshold | Derived From |
|-----------|---------|-----------|--------------|
| Toolchain has zero dependencies and one runtime | No `node_modules` under `tools/`; no `dependencies` in any `package.json` under `tools/`; every `require`/`import` in `tools/substrate/*.js` targets a `node:` built-in or a sibling file | Zero external requires | ADR-099 rejected alternative C; retrofit finding 3 |
| Derivation is deterministic | Two consecutive `derive` runs with no record change; `diff -r docs/views docs/views` across runs and `git diff --stat` on all outputs | Byte-identical; `--check` exits 0 | ADR-099 §The architecture; scenario *Regeneration is deterministic and single-source* |
| Legacy files are never written | `git diff --stat docs/decisions/adr-0{01..98}-*.md` after `derive` | Empty | ADR-099 §Authority C; preservation scenario *Legacy ADR files are unchanged by derivation* |
| Only the marked region of `domain-model.md` changes | Diff of the file with the region excised, before and after `derive` | Empty | ARCHITECT decision (marked region) |
| Note Discipline is enforced | Validator exit code on a record with one unnoted non-`references` link | Exit 1 naming record and link | ADR-099 constraint 2; scenario *Note Discipline validation rejects an unnoted non-trivial link* |
| Schemas are per-type | Count of required fields shared by all three schemas | `id`, `type`, `title`, `links` only; `rejected_alternatives` required by `adr` full and by no other | ADR-099 constraint 3 |
| Sub-decisions nest | An `adr` record with two `sub_decisions` validates and its drill-in renders them as `###` sub-sections under Decision | Both true | ADR-099 constraint 4; scenario *ADR record with sub-decisions nests them* |
| Index records are marked | Every `docs/views/<id>.md` for a `form: index` record contains the compressed marker with the canonical path in its first ten lines | 100% | ADR-099 constraint 4; scenario *Surface View signals its own incompleteness* |
| Focus+context at drill-in | Every drill-in has a "Surrounding records" section listing each linked record with id, title, and one-line summary, and a link to `overview.md` | 100% | ADR-099 §The architecture; scenario *Drill-in view preserves focus+context* |
| Zero hook changes beyond the defect fix | `git diff --stat hooks/` at BUILD end | Only `tier1-verify-dispatch.sh` and `test_output_path_regex.sh` | preservation scenario *The Stop hook manifest check is unaffected*; ARCHITECT decision (no derivation hook) |
| Manifest unchanged | `git diff hooks/manifests/tier1-phase-manifest.yaml` at BUILD end | Empty | ADR-100 graduation trigger (manifest check is the graduation target) |
| Centered/infrastructure categories not split | Every path under `docs/substrate/` and `docs/views/` is under `docs/`; no Substrate or view file under `.rdd/` | 100% | preservation scenario *Centered and infrastructure categories per ADR-085 hold* |
| Every phase-skill brief names the triage record | `grep -l "Triage record:" skills/*/SKILL.md` | 8 files | ADR-100 §Where the isolation lives |
| Dispatch-prompt discipline preserved | `hooks/tests/run_tests.sh` after brief amendments | All pass | ADR-065; Orchestrator dispatch-prompt discipline |
| Gate note carries the triage section | Every `.rdd/gates/020-*.md` from architect onward and every gate note in the next two to four cycles contains `## Susceptibility snapshot findings and orchestrator triage` with at least one row | 100% | ADR-100 rule 5 |
| Pivot count per gate | Rulings requested in the gate presentation, as recorded in the gate note's question section | ≤ 1 pivot (route defaults unbounded but named) | ADR-100 rule 7 |
| No bare identifiers in a presented pivot | Grep of the gate note's question section for `Invariant [0-9]` or `ADR-[0-9]{3}` not followed within the same sentence by a quotation or gloss | 0 | ADR-100 rule 6 |
| Legacy index authoring cost is measured | cycle-status §From BUILD records records-per-hour and the note-authoring share for WP-E | Recorded (no threshold; ADR-099 constraint 6 says BUILD measures) | ADR-099 constraint 6 |
| ADR-099/100 form change preserves audit-substance | Set of `##`/`###` headings and the count of rejected alternatives in the derived markdown vs. the prose file at WP-D | Identical sets; one narrow argument-audit round finds P1 = 0 on the derived form | ADR-099 constraint 4; ADR-094 (form-change baseline reset) |
| Ownership concentration is stated, not hidden | Rows per owning module in the Cycle 020 matrix, counted at the ARCHITECT gate | Orchestrator 14 of 32 (ADR-100's seven rules and their record live in one skill file, following the existing pattern that phase skills defer to the orchestrator for the Question Toolkit); Record Validator 5; Surface Deriver 8; no threshold is set because none has provenance; the count is re-stated at each design amendment | Step 5 rule; architect snapshot 2026-09-04 (recount) |

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

### Cycle 019 (v16.0) Boundary Integration Tests

| Dependency Edge | Integration Test | What It Verifies |
|----------------|-----------------|------------------|
| Argument Auditor Agent → Convergence-Saturation Signal verdict-line emission | Skill-text inspection (no new fixture test required this cycle) — `agents/argument-auditor.md` contains the verdict-line format string at the round-end position for both Section 1 (argument-audit) and Section 2 (framing-audit); verifiable via `grep -E "Convergence-Saturation Signal" agents/argument-auditor.md` returning matches at both round-end positions | Verdict-line format present at both section round-ends with correct threshold values (P1 = 0, P2-new ≤ 1, no new framings) |
| Citation Auditor Agent → Convergence-Saturation Signal verdict-line emission | Skill-text inspection — `agents/citation-auditor.md` contains the verdict-line format string at the round-end position; verifiable via grep | Verdict-line format present with consistent threshold values matching the argument-auditor's |
| Argument Auditor / Citation Auditor → form-change baseline-reset rule documented | Skill-text inspection — both files document the rule that form-change events reset the round-count baseline; verifiable via grep for "form-change baseline-reset" or equivalent language | Rule documented in both agent files with consistent semantics |
| Research Skill → Patch-Switching Criterion at research-loop-end | Skill-text inspection — `skills/research/SKILL.md` line 147 area contains the Pirolli-Card-anchored criterion question + verdict-line format with three-way recommendation (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis) + practitioner-elicited expected-observation prompt | Criterion present at loop-end boundary; all three verdict tokens present; practitioner-elicited prompt encoded |
| Research Skill → practitioner-elicited expected observation field | Skill-text inspection — the agent's prompting language ("what specific observation in the next loop would change your reading of the problem space — not deepen it, but change it?") is encoded with reflexive-vs-genuine discrimination diagnostic | Prompting language present; absence of substantive engagement reads as "none (practitioner did not specify)" |
| Orchestrator → Important Principles vocabulary additions | Skill-text inspection — `skills/rdd/SKILL.md` "Important Principles" section names the Empirical-Grounding Filter (with four grounding-mechanism paths), Agent Outcome Test (with consumer-naming-actionability requirement), FF1 / FF3 named-deferrals (with two-direction graduation triggers), and Three-Application F-P2 Pattern as held question; verifiable via grep for each named concept | All five Tier-2 vocabulary additions present in orchestrator skill text |
| ADR-094 → naming clarification applied | `docs/decisions/adr-094-audit-round-count-convergence-saturation.md` §"Signal-evaluation step" specifies a two-file enumeration (argument-auditor.md covering both sections per ADR-061 + citation-auditor.md); no reference to a non-existent `framing-auditor.md` as a separate file | Naming clarification applied; no broken file references |
| Reading-path artifact → existence and Agent Outcome Test passing | File existence check at `docs/decisions/cycle-019-adr-index.md`; inspection of the artifact's opening section for consumer-naming-with-actionable-distinction (read this first; skip to ADR-097 if time-constrained) | File exists; consumer named; actionable distinction present (the index ranks reading order) |

### Invariant Enforcement Tests (Cycle 019 additions)

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| Invariant 8 anchoring — Convergence-Saturation Signal is Skill-Structure Layer-anchored at the verdict-line position (ADR-094 §"Signal-evaluation step") | Argument Auditor Agent and Citation Auditor Agent (skill-text encoding at round-end position) | Skill-text inspection — verifiable via grep for the verdict-line format string at the round-end position in both agent files |
| Invariant 8 anchoring — Patch-Switching Criterion is Skill-Structure Layer-anchored at the research-loop-end position (ADR-096 §"Skill-text amendment site") | Research Skill (`skills/research/SKILL.md` line 147 area) | Skill-text inspection — verifiable via grep for the Pirolli-Card-anchored question + the three verdict-token strings + the practitioner-elicited prompt |
| Empirical-Grounding Filter as Tier-2 felt-trigger — anchored in vocabulary, not structurally enforced (ADR-097 §"Encoding") | Decide Skill (felt-trigger reference); Orchestrator "Important Principles" (carries the filter as cross-cutting) | Skill-text inspection — verifiable via grep for "Empirical-Grounding Filter" + the four grounding-mechanism paths |
| Agent Outcome Test as Tier-2 felt-trigger — anchored in vocabulary, not structurally enforced (ADR-095 §"Encoding") | All phase skills (apply at agent-facing artifact creation moments); Orchestrator "Important Principles" (carries the test) | Skill-text inspection — verifiable via grep for "Agent Outcome Test" + the consumer-naming-actionability requirement |
| FF1 / FF3 Named-Deferral with two-direction graduation triggers (ADR-098) | Orchestrator (records evidence in cycle-status); cycle-status entries (carry instance records) | Skill-text inspection of orchestrator; cycle-status inspection for FF1/FF3 graduation-trigger evidence accumulation across future cycles |
| Form-change baseline-reset rule as load-bearing methodology insight (ADR-094 R3 — operationally demonstrated) | Argument Auditor Agent and Citation Auditor Agent (skill-text encoding) | Skill-text inspection — verifiable via grep for "form-change baseline-reset" or equivalent language; operational evidence anchor: Cycle 019 R3 audit caught three P2-new findings on the consolidated form that the R2 verdict on the five-ADR set would have suppressed if erroneously carried over |
| Reading-path artifact pattern passes its own Agent Outcome Test (self-referential application of ADR-095) | `docs/decisions/cycle-019-adr-index.md` opening section | File inspection — intended consumer named, layer-match holds, the consumer-naming produces an actionable distinction |

### Cycle 020 (v17.0) Boundary Integration Tests

| Dependency Edge | Integration Test | What It Verifies |
|----------------|-----------------|------------------|
| Surface Deriver → Record Validator | `tools/substrate/tests/derive-refuses-invalid.test.js` — a fixture Substrate with one unnoted link; `derive` returns exit 1, writes nothing, stderr matches the validator's message | Real record objects cross the in-process boundary; the deriver's refusal is the validator's verdict, not a re-implementation |
| Record Validator → Substrate | `tools/substrate/tests/validate-fixture-corpus.test.js` — the Cycle 019 fixture (Pattern + five index records) and the ADR-099 full record fixture validate; each negative fixture (missing required field per type; unnoted link; unknown-type-with-note) produces the expected exit and message | Per-type schemas, Note Discipline, extensibility, nesting against real files |
| Surface Deriver → Surface Views | `tools/substrate/tests/derive-overview-and-drillin.test.js` — derive the Cycle 019 fixture; assert overview order (pattern first), co-located cross-refs with note text, one drill-in per record, surrounding-records footer, back-link, compressed marker on index records | Scenarios *Records with Typed Links derive…*, *Drill-in view preserves focus+context*, *Surface View signals its own incompleteness* |
| Surface Deriver → derived ADR markdown | `tools/substrate/tests/derive-adr-markdown.test.js` — derive a `form: full` fixture into a temp decisions dir; assert header line, section order, nested sub-decision sub-sections; edit the markdown, re-derive, assert the edit is gone; assert no file written for an index record | Scenarios *A new governance unit is authored as a record…*, *ADR record with sub-decisions nests them*; preservation *Legacy ADR files are unchanged* |
| Surface Deriver → `domain-model.md` region | `tools/substrate/tests/derive-term-region.test.js` — a fixture domain-model file with markers and surrounding text; derive; assert only the region changed; remove markers; assert exit 1 and file unchanged | The marked-region contract |
| Surface Deriver (determinism) | `tools/substrate/tests/derive-deterministic.test.js` — derive twice; byte-compare; `--check` exits 0; hand-edit a view; `--check` exits 1 naming it | Scenario *Regeneration is deterministic and single-source*; Surface Views fitness |
| Decide Skill → toolchain (skill text) | Skill-text inspection — `skills/decide/SKILL.md` Step 2 names `validate.js` then `derive.js` with the record path template and the `tools/substrate/` presence check | Author Substrate Record is step-anchored (Invariant 8) |
| Conformance Audit Skill → Surface Deriver | Skill-text inspection — `skills/conform/SKILL.md` drift detection names `derive.js --check` | Drift detection is the mechanical check in place of a hook |
| Orchestrator → Gate Reflection Note | Inspection of `.rdd/gates/020-architect-gate.md` and `020-build-gate.md` — triage sections present with rows; the Stop hook manifest check passes on them (preservation) | ADR-100 rule 5; preservation *The gate reflection note keeps every ADR-066 section* |
| Phase Skill → Susceptibility Snapshot Evaluator | `hooks/tests/run_tests.sh` (dispatch extraction on the amended briefs) plus inspection that the Cycle 020 build snapshot contains `## Triage evaluation` | The brief amendment did not break `Output path:` extraction; the evaluator produced the section |
| Tier 1 Verify Dispatch Hook → Dispatch Log | `hooks/tests/test_output_path_regex.sh` new fixture (`**Output path: X**` → `X`) | Defect fix; existing fixtures unchanged |
| BUILD Step 5.5 → real corpus | `node tools/substrate/validate.js && node tools/substrate/derive.js && node tools/substrate/derive.js --check` on this repository; `git diff --stat docs/decisions/adr-0{01..98}-*.md` empty; the practitioner reads `docs/views/overview.md` at the BUILD gate | Acceptance Criteria Table row 1 (corpus-scale read); ADR-099 Conditional Acceptance evidence |

### Invariant Enforcement Tests (Cycle 020 additions)

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| Invariant 0 (authority over what was built, for whom, why) | Orchestrator Pre-triage step (pivot criterion is Invariant 0's list); Susceptibility Snapshot Evaluator Process step 4 (first check: does the criterion as applied match the list) | Snapshot `## Triage evaluation` at each Cycle 020 and later boundary answers the criterion question; a pivot dispositioned resolve is harm evidence for ADR-100 |
| Invariant 1, 2 (generation, epistemic act at every gate) | Gate Reflection Note keeps the four ADR-066 sections; the presentation asks for one ruling | Preservation scenario *The gate reflection note keeps every ADR-066 section*; manifest check passes |
| Invariant 3 (pragmatic automated; epistemic not) | Author Substrate Record actor split (AI drafts; user rules at the gate); Derive Surface View is toolchain | Amendment #30 actor correction; the Decide Skill Step 2 text names the split |
| Invariant 8 (mechanism execution structurally anchored) | Pre-triage and presentation rules are steps in the Orchestrator's Stage Gates protocol; the snapshot brief amendment is step-anchored in each phase skill; Author Substrate Record is a Decide/Model skill step conditional on the toolchain; the triage-record manifest check is explicitly Tier 2 until the ADR-100 graduation trigger | Skill-text grep for each step; conformance scan at BUILD exit lists no unanchored unconditional claim |
| Invariant 4 (productive, not brief) | One screen, one ruling reduces waste (adjudication that resolves nothing), not duration | Direction, not constraint: observed through the ADR-100 graduation trigger across two to four cycles |

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
| 19 | 2026-09-04 | **BUILD-time refinements to v17.0 (Cycle 020 BUILD; no version bump).** Within ARCHITECT's stated latitude (optional fields may be added; required ones need an amendment) BUILD made these choices, each a route default presented at the BUILD gate for non-objection: (1) **In-corpus link targets must resolve** — the Record Validator rejects a link whose target starts with `adr-`, `pattern-`, or `term-` and names no record; other targets (`invariant-N`, `external:…`) pass unresolved and render as plain text. Chosen because dangling provenance is spike-020's named link-rot risk; the cost was twelve index records at WP-D instead of six. (2) **`slug` required on `adr` full records** — the integration contract names it as the source of the derived path; the minimal-field table had omitted it. (3) **Optional `additional_sections[]`** on full records so a derived file keeps a non-template `##` heading (ADR-100's *Supersession notes (Step 2.5)*). (4) **Optional `title` on sub-decisions** and **optional `title` on sub-decision options**; the deriver falls back to *Sub-decision*. (5) **Term rows in the marked region are emitted in id order** (per the contract), which differs from MODEL's conceptual order; content unchanged. (6) **`derive` removes stale views** for records that no longer exist and `--check` reports them as `stale:`. (7) **`tools/substrate/index-legacy.js`** — the roadmap's optional scaffold, written because the mechanical fields were worth automating for 86 records; never overwrites; interpretive fields stay the agent's. (8) **Play and Synthesize skills gain a one-paragraph non-gate triage instruction** (ADR-100 rule 5) so the snapshot briefs' `Triage record:` pointer names a section a skill step writes (beyond the roadmap's WP-G scope, which named Research only). (9) The derived ADR-100 gains `### Graduation trigger` (field promoted to a sub-section); recorded as the one heading-set difference in the narrow audit. (10) Toolchain tests are invoked as `node --test 'tools/substrate/tests/*.test.js'` (Node 22 does not recurse a bare directory). No responsibility moved between modules; the Record Validator and Surface Deriver entries above read with these notes. | Cycle 020 BUILD WP-B, WP-C, WP-D, WP-E, WP-H; `.rdd/audits/argument-audit-decide-020-derived-r1.md` (P3-1 lineage links); `.rdd/gates/020-build-gate.md` engine-disposition table | ADR-099 constraints 1, 2, 3, 6; ADR-100 rule 5; system-design v17.0 §Record Validator minimal field sets ("BUILD may add optional fields, never required ones, without a design amendment"); §Integration Contracts (derived ADR markdown: `slug`) | Proposed (route default; BUILD gate non-objection) |
| 18 | 2026-09-04 | **System design v17.0 — Cycle 020 Substrate-and-Surface Separation (ADR-099) and Pre-Triage with Plain-Language Presentation (ADR-100).** First cycle since Cycle 10 to add code modules. **ADR-099** (Conditional Acceptance; Tier-2 architectural commitment, Skill-Structure anchoring at graduation; §Authority option C ruled by the practitioner 2026-09-03): three new modules under `tools/substrate/` and `docs/substrate/` — **Substrate** (one plain-JSON record per governance unit; `adr` full/index, `pattern`, `term`; typed links with note text), **Record Validator** (`validate.js` + per-type schemas; Note Discipline enforced; `references` the sole trivial link type; nested sub-decisions), **Surface Deriver** (`derive.js`; overview + drill-in views at `docs/views/`; derived ADR markdown at `docs/decisions/` for full records; marked region in `domain-model.md` for terms; compressed marker on index views; `--check` drift mode; deterministic) — plus **Surface Views** as a generated Tier 2 artifact module. ARCHITECT decisions recorded with alternatives: plain JSON over YAML frontmatter and JSON-LD; Node.js zero-dependency runtime (already required by `hooks.json`); three record types this cycle, invariant and scenario types deferred; Substrate centered under `docs/` (product, not process, on the ADR-085 axis); no fourth artifact tier (records join Tier 3, the overview joins Tier 2); ADR-099 and ADR-100 authored as the first full records at BUILD with a narrow audit round on the derived form; no derivation hook (conform's `--check` is the mechanical check). **ADR-100** (Conditional Acceptance; Skill-Structure Layer specified, anchoring ships in BUILD): Orchestrator Stage Gates gains a Pre-triage step (resolve / carry forward / pivot; pivot = changes what gets built, for whom, or why; agent runs the question form on itself first; framing-class findings never silently resolved) and a presentation rule (one screen, one ruling; cited content inlined); Gate Reflection Note template gains the triage section (ADR-066 update); Question Toolkit gains the first-pass-by-agent sentence (ADR-056 update); all eight phase-skill snapshot briefs name the triage record with three questions; the Susceptibility Snapshot Evaluator gains Input, Process step 4, and `## Triage evaluation` output; Research Skill gains the non-gate triage heading at loop-end and audit-round-end. Manifest unchanged (hook enforcement is ADR-100's graduation target). **Retrofit findings:** stale `docs/essays/audits/` example paths in Decide and Conform skills (bug; WP-A); `tier1-verify-dispatch.sh` trailing-`**` extraction defect (bug; WP-A with fixture); Node already a runtime requirement (constraint honored). Twelve modules amended; zero new subagents; zero new hooks; zero invariant changes. Deferred ADR-056/066/074 sweep landing sites stated (system-design pair now; ORIENTATION post-ARCHITECT and post-BUILD; field-guide at BUILD Step 6; skill text at WP-F/WP-G). Per ADR-076 every qualitative claim (deterministic, single-source, never hand-maintained, focus+context, incompleteness visible, extensible, zero-dependency, one screen, inlined, inspectable) carries an adjacent `**Fitness:**` line; "the read the practitioner uses" is recorded as direction-not-constraint pending the ADR-099 graduation trigger. BUILD mode auto per the DECIDE-gate default (driving continues). Target release v0.9.0 (new toolchain and artifact directories). | Cycle 020 *Corpus Topology and Agent-Navigable Compaction*; ADRs 099, 100; domain-model Amendments #29, #30; conformance-scan-decide-020 (24 rows, no unplanned drift) | essay-outline-020 (C1–C7); spike-020; lit-review-020 §Q4 and Candidate Ranking; `.rdd/gates/020-decide-gate.md` (authority ruling; two non-objected defaults); `.rdd/audits/susceptibility-snapshot-020-decide.md` (carried engagement-trend question); product-discovery Cycle 020 (Solo Developer tasks; value tensions); interaction-specs §Cycle 020; scenarios §Cycle 020 (18 scenarios + Acceptance Criteria Table) | Accepted (ARCHITECT gate 2026-09-04; BUILD shipped in v0.9.0) |
| 17 | 2026-05-22 | **System design v16.0 — Cycle 019 Empirical-Grounding Filter and related methodology amendments.** Five ADRs (094, 095, 096, 097, 098) at standalone scope with reading-path artifact at `docs/decisions/cycle-019-adr-index.md` as navigation layer (per Amendment #28's restoration of the briefly-consolidated form; the DECIDE phase made three structural shifts — 5 ADRs → 1 ADR → 5 ADRs + reading-path — and the restoration is the cycle's most considered response to the working-memory-budget concern). **ADR-094** (Skill-Structure Layer): Convergence-Saturation Signal at audit-round-end with structured verdict line (TRIGGERED when P1 = 0 ∧ P2-new ≤ 1 ∧ no new framings); default 3 rounds; rounds 4–5 conditional; rounds beyond 5 with explicit practitioner authorization; **form-change baseline-reset rule** added at R3 — operationally demonstrated by Cycle 019's own R3 audit catching three P2-new findings on the consolidated form. Skill-text amendments to `agents/argument-auditor.md` (covering both Section 1 argument-audit and Section 2 framing-audit per ADR-061) and `agents/citation-auditor.md`. ADR-094 naming clarification per conformance-scan §Cluster 1: replace three-file enumeration (including non-existent `framing-auditor.md`) with two-file enumeration. **ADR-095** (Tier-2): Agent Outcome Test for agent-facing artifact admissibility — parallel to ADR-083's human-facing Outcome Test; consumer-naming requirement necessary but not sufficient (trivially-passing answers fail the test). Encoded in domain model (Amendment #25) and orchestrator "Important Principles." **ADR-096** (Skill-Structure Layer): Patch-Switching Criterion at research-loop-end — Pirolli & Card (1999) information-foraging applied with verdict-line format (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis); practitioner-elicited expected-observation field with reflexive-vs-genuine discrimination; late patch-additions accommodated (Cycle 019 Loop 6 pattern). Skill-text amendment to `skills/research/SKILL.md` line 147 area (~10–15 lines). **ADR-097** (Tier-2; central commitment): Empirical-Grounding Filter at DECIDE — felt-trigger at ADR-drafting against four grounding-mechanism paths (PLAY evidence; stakeholder-articulated demand; spike validation; structural operationalization); two non-grounded forms (Conditional Acceptance annotation; `adr-deferred-` filename pattern — institutional patterns from llm-orc); two senses of "standalone" (commitment-time vs. grounding-completion); discriminating-criterion gap (Target 2) acknowledged but not resolved; fifth-ADR scope carry-forward decision. **ADR-098**: FF1 + FF3 named-deferrals with two-direction graduation triggers (harm evidence OR reliance evidence; 2–4 cycle thresholds). The R5 audit pattern (post-gate narrow re-audit on susceptibility-snapshot recommendation) named as cycle's current compound defense — Skill-Structure-Layer-in-spirit but not enforced; reliability depends on orchestrator applying snapshot recommendation. Three-Application F-P2 Pattern held as question (not resolved finding) across ADR-097 + ADR-098 — multi-cycle graduation triggers are the assessability test. Domain-model Amendments #25 (24 new concepts; 5 actions; ~25 relationships; 6 open questions; 24 synonym aliases), #26 (R5 narrowing — PLAY-as-Filter / Distributed Remedy Architecture / Kitchen-Sink Outcome qualified to candidate framings for future-cycle development), #28 (consolidation reversal supersedes #27, recording the three structural shifts and the load-bearing methodology insight: future practitioners facing similar structural-form decisions should surface the full option set including navigation-artifact alternatives before structural deletion). Five new ADRs (094–098). Zero new code modules; zero new specialist subagents; zero invariant changes (Invariant 8 governs the Skill-Structure Layer anchoring of ADRs 094 and 096; ADRs 095, 097, 098 are Tier-2 with explicit Tier-2 structural limits acknowledged). Three modules amended (Argument Auditor Agent, Citation Auditor Agent, Research Skill) plus two cross-cutting amendments (Orchestrator vocabulary additions, this system-design pair). Per ADR-076 each amendment with a qualitative claim carries decomposed `**Fitness:**` properties. Per ADR-074 this v16.0 amendment introduces ADRs — no supersession of prior ADRs of v16.0 itself. The downstream-artifact sweep is **deferred to BUILD**; the unified pre-BUILD sweep checklist consolidates conformance-scan-decide-019.md BUILD-debt items + ADR-094 naming clarification. **No ship-together constraint** between Cycle 019 ADRs — each is independently scoped (ADR-094 + ADR-096 are Skill-Structure Layer skill-text amendments at distinct workflow boundaries; ADRs 095, 097, 098 are Tier-2 vocabulary with no Skill-Structure Layer hooks). Three Open Questions held into future cycles: corpus-level granularity (whether the ~100-ADR corpus accretion rate is itself an over-engineering signal the methodology's current criteria don't catch); knowledge-graph corpus collapse (practitioner-named future-cycle research topic — can methodology corpus information be collapsed into a knowledge-graph format respecting working-memory bounds while preserving audit-trail integrity?); consolidation-as-F-P2-instance (whether the DECIDE-gate consolidation-then-restoration is the cycle's reflexive correction OR another instance of the same pattern — the multi-cycle graduation trigger for ADR-097 is the assessability test). Scope-of-claim caveat: Cycle 019's findings are research-not-validation; cross-project evidence (zani, llm-orc, plexus; ~26 sampled ADRs in depth) is agent-conducted and carries agent-reading uncertainty; MODEL + DECIDE intra-cycle Practitioner-Originated Framing Absorption instances count as one cycle's worth of FF1 graduation evidence regardless of intra-cycle frequency. BUILD mode anticipated as auto per ADR-091 (mechanical work; moderate stakes; catching-dominant stewardship); confirmed at BUILD entry. **Cycle 019's reflexive pattern recorded as observational evidence for its own central research question:** the cycle's DECIDE phase made three structural shifts in real time, each defensible at the moment, the aggregate being the methodology working through its own central research question. Future cycles applying ADRs 094–098 produce the validation evidence Cycle 019 cannot. | Cycle 019 *Does RDD Over-Engineer?* (driving question: does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs?); ADRs 094, 095, 096, 097, 098; Domain Model Amendments #25 / #26 / #28; conformance-scan-decide-019.md (3 BUILD-debt items + 1 structural clarification + 3 conforming ADRs) | essay-outline-018-does-rdd-over-engineer.md (seven Abstract Conclusions; C7 cross-project evidence load-bearing; Loop 6 sampled ~26/86 ADRs across zani + llm-orc + plexus); cycle-status §From RESEARCH / DISCOVER / MODEL / DECIDE feed-forward signals; argument-audit-decide-019{,-r2,-r3}.md (three rounds — R3 narrow audit on briefly-consolidated form caught FA-R3-P1 framing finding driving the restoration); conformance-scan-decide-019.md (clean — BUILD debt enumerated); susceptibility-snapshot-019-decide.md (recommended R3 dispatch — vindicated); gate reflection note `.rdd/gates/019-decide-gate.md` with R3 + restoration addendum | Proposed |
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

> This is the architect → build boundary. Architect phase composes modules from the domain model, ADRs, and scenarios. The specific risk is that module boundaries and responsibility allocations encode unexamined assumptions — particularly the assumption that a boundary serves the developer's mental model when it should serve the user's. The Inversion Principle check at architecture is the designed counterweight but can be performed pro forma. Evaluate the attached AID signals for solution-space narrowing on boundary choices and framing adoption from DECIDE-phase ADRs (the system design inherits ADR framings — was the inheritance examined or automatic?). Check whether the proposed module boundaries would survive a product-facing reading: do they track user mental models or only developer convenience? **Cycle 017 addition:** if ARCHITECT applied Pattern A or Pattern B per ADR-084, evaluate whether the per-artifact judgment was recorded with rationale or whether the ~50% threshold was treated as a mechanical rule rather than a felt indicator. **Cycle 020 addition:** read the triage record at `.rdd/gates/{cycle}-architect-gate.md` §Susceptibility snapshot findings and orchestrator triage, and answer: were pivots correctly identified; were framing-class findings surfaced; did any resolve disposition hide a destination change. For Cycle 020 specifically, take up the carried question from the decide → architect snapshot: is the three-gate engagement trend (metaphor → "reasonable terms" → "C") the design working (destination-level rulings only, as the practitioner asked) or fatigue, and does the ARCHITECT gate's record move that reading either way.
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
