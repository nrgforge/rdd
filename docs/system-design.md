# System Design: Pedagogical RDD

**Version:** 6.0
**Status:** Current
**Last amended:** 2026-03-19

## Architectural Drivers

| Driver | Type | Provenance |
|--------|------|------------|
| Every gate must require user generation, not just approval | Quality Attribute | Invariant 1, 2; ADR-001 |
| Epistemic cost stays under 5-10 min per gate | Constraint | Invariant 4; ADR-003 |
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

## Module Decomposition

### Module: Orchestrator (`skills/rdd/SKILL.md`)
**Purpose:** Defines the pipeline sequence, epistemic gate protocol, three-tier artifact hierarchy, cross-cutting principles, scoped cycle workflow pattern, agent dispatch protocol, and ensures no phase transition consists solely of approval.
**Provenance:** ADR-001 (gate pattern); ADR-002 (orchestrator defines protocol); ADR-004 (feed-forward instruction); ADR-006 (pipeline includes PRODUCT DISCOVERY); ADR-010 (inversion principle cross-cutting); ADR-019 (three-tier artifact hierarchy); ADR-022 (roadmap at Tier 2); ADR-023 (field guide at Tier 3); ADR-024 (document sizing heuristics); ADR-026 (scoped cycles, deep work tool framing); ADR-031 (artifact-mediated communication as cross-cutting principle); ADR-032 (agent dispatch protocol); ADR-034 (plugin packaging); Invariant 0, 2
**Owns:** Gate protocol definition, pipeline sequence (including PRODUCT DISCOVERY phase), state tracking, feed-forward instruction, cross-cutting principles (inversion principle, document sizing heuristics, artifact-mediated communication), Available Skills table, Artifacts Summary, three-tier artifact hierarchy principle (with roadmap at Tier 2 and field guide at Tier 3), orientation document regeneration instruction (dispatches orientation-writer agent), scoped cycle workflow pattern, deep work tool framing, agent dispatch protocol (how phase skills delegate specialist work to subagents)
**Depends on:** None (top-level coordinator)
**Depended on by:** All phase skills (they follow its protocol); all hooks (they supplement its cross-cutting principles)
**Note:** In the plugin architecture, the orchestrator's cross-cutting principles are additionally enforced by hooks — the hooks supplement skill-level instructions with passive event-driven reminders. The orchestrator dispatches the orientation-writer agent at milestones rather than generating ORIENTATION.md inline.

### Module: Research Skill (`skills/rdd-research/SKILL.md`)
**Purpose:** Runs an iterative research loop and produces a citation-audited and argument-audited essay, with an epistemic gate tailored to essay artifacts.
**Provenance:** ADR-002 (skill owns gate); ADR-003 (research gate assignments); ADR-032 (agent dispatch for audits and research helpers); ADR-036 (research log archival at cycle end); Essay 001 §6
**Owns:** Research-phase process, epistemic gate prompts, essay presentation step, research log archival at cycle end (ADR-036)
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (dispatched during essay finalization); Argument Auditor Agent (dispatched after citation audit); Lit Reviewer Agent (dispatched as user-selected research method); Spike Runner Agent (dispatched as user-selected research method)
**Depended on by:** None directly (produces essay artifact consumed by Product Discovery Skill and Model Skill via file)

### Module: Product Discovery Skill (`rdd-product/SKILL.md`) — NEW
**Purpose:** Surfaces user needs, stakeholder maps, value tensions, and assumption inversions, producing a product discovery artifact in user language that feeds forward into MODEL, DECIDE, and ARCHITECT.
**Provenance:** ADR-006 (phase placement); ADR-007 (artifact structure); ADR-008 (forward/backward modes); ADR-010 (inversion principle procedural home); ADR-011 (epistemic gate); Invariant 0 (product dimension of authority)
**Owns:** Product discovery process (forward and backward modes), five-section artifact template, assumption inversion procedural step, product debt table (backward mode), epistemic gate prompts
**Depends on:** Orchestrator (protocol)
**Depended on by:** None directly (produces product discovery artifact consumed by Model Skill, Decide Skill, and Architect Skill via file)

### Module: Model Skill (`rdd-model/SKILL.md`)
**Purpose:** Extracts domain vocabulary from essay and product discovery artifact, with Product Origin provenance column and an epistemic gate tailored to domain model artifacts.
**Provenance:** ADR-002; ADR-003 (model gate assignments); ADR-009 (product vocabulary provenance); Essay 001 §6
**Owns:** Model-phase process, Product Origin column, epistemic gate prompts, domain model presentation step
**Depends on:** Orchestrator (protocol)
**Depended on by:** None directly (produces domain model artifact consumed by Decide Skill via file)

### Module: Decide Skill (`skills/rdd-decide/SKILL.md`)
**Purpose:** Produces ADRs and behavior scenarios with product context alongside technical context, including inversion principle check on ADR assumptions, with an epistemic gate tailored to ADR artifacts.
**Provenance:** ADR-002; ADR-003 (decide gate assignments); ADR-010 (inversion principle at DECIDE); ADR-032 (agent dispatch for argument audit and conformance scan); Essay 001 §6; Essay 002 §7.2
**Owns:** Decide-phase process, inversion principle check (at DECIDE), epistemic gate prompts, ADR/scenario presentation step
**Depends on:** Orchestrator (protocol); Argument Auditor Agent (dispatched after ADRs written); Conformance Scanner Agent (dispatched at Step 3.5)
**Depended on by:** None directly (produces ADR + scenario artifacts consumed by Architect Skill via file)

### Module: Architect Skill (`rdd-architect/SKILL.md`)
**Purpose:** Decomposes the system into modules with provenance chains extending to user needs, including inversion principle check on module boundaries, with an epistemic gate tailored to system design artifacts; generates roadmap as separate artifact.
**Provenance:** ADR-002; ADR-003 (architect gate assignments); ADR-010 (inversion principle at ARCHITECT); ADR-022 (roadmap generation); Essay 001 §6; Essay 002 §7.3; Essay 005 §1
**Owns:** Architect-phase process, inversion principle check (at ARCHITECT), extended provenance chains, epistemic gate prompts, system design presentation step, roadmap generation (work packages, dependency classification, transition states)
**Depends on:** Orchestrator (protocol)
**Depended on by:** None directly (produces system design and roadmap artifacts consumed by Build Skill via file)

### Module: Build Skill (`rdd-build/SKILL.md`)
**Purpose:** Turns scenarios into working software through BDD/TDD, with epistemic prompts at scenario group boundaries; generates field guide when implementation exists.
**Provenance:** ADR-002; ADR-003 (build gate assignments); ADR-023 (field guide generation); Essay 001 §6; Essay 005 §3
**Owns:** Build-phase process, epistemic gate prompts, scenario completion presentation step, field guide generation (module-to-implementation mapping, design rationale, settled vs. in-flux marking)
**Depends on:** Orchestrator (protocol)
**Depended on by:** None

### Module: Synthesis Skill (`skills/rdd-synthesis/SKILL.md`)
**Purpose:** Mines the artifact trail for novelty signals, conducts a structured conversation (journey review, novelty surfacing, framing with four-dimension navigation via structural experiments) to help the writer find their story, and produces a two-register (argumentative backbone + curatorial arrangement) outline as springboard for the synthesis essay.
**Provenance:** ADR-012 (phase placement); ADR-013 (conversation structure + outline); ADR-014 (quality gate); ADR-015 (narrative context rollup); ADR-016 (subsumes gate); ADR-017 (narrative inversions); ADR-018 (cross-project Level 1); ADR-027 (four-dimension framing); ADR-028 (structural experiments); ADR-029 (re-entry); ADR-030 (two-register outline); ADR-032 (agent dispatch for audits); Essay 003; Essay 006; Invariant 0 (public authority dimension)
**Owns:** Synthesis-phase process, artifact trail mining, novelty signal detection (five signals), three-phase conversation, four-dimension framing model (discovery type, narrative form, audience constraint, epistemic posture), structural experiment mechanism (agent proposes, writer executes externalized trials), worth-the-calories quality tests (Davis/ABT/inversion), two-register outline production (argumentative backbone verified by argument audit + curatorial arrangement with selection/juxtaposition/scale shifts/shimmer/negative space/personal voice), pre-populated references, cross-project conversational prompting (Level 1), narrative inversion lenses, re-entry decision logic (writer-initiated, scoped narrowly)
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (dispatched during outline finalization); Argument Auditor Agent (dispatched during outline finalization, after citation audit)
**Depended on by:** None directly (usually terminal; can re-enter Research when structural experimentation surfaces new questions — re-entry is writer's decision)

### Module: Conformance Audit Skill (`skills/rdd-conform/SKILL.md`)
**Purpose:** Scans artifact corpus against current skill version, producing gap analysis with prioritized remediation, drift detection against implementation, and graduation into native project docs.
**Provenance:** ADR-025 (four operations: audit, remediation, drift detection, graduation); ADR-026 (graduation as scoped cycle endpoint); ADR-032 (agent dispatch for conformance scanning); Essay 005 §5
**Owns:** Audit template conformance process, remediation (structural and format gaps), graduation process (knowledge migration plan, archival), conformance report production
**Depends on:** Orchestrator (available skill listing); Conformance Scanner Agent (dispatched during drift detection operation)
**Depended on by:** None directly (invoked by user or orchestrator as needed; produces conformance report consumed by user)

### Specialist Subagent Modules

All specialist subagents follow the artifact-mediated communication pattern (ADR-031): they receive file paths as input, run in isolated context with no conversation history, and write structured output to artifact files. Phase skills dispatch them and read the output artifacts.

### Module: Citation Auditor Agent (`agents/citation-auditor.md`)
**Purpose:** Verifies every reference and factual claim in an essay or outline against verifiable sources, producing a structured audit artifact.
**Provenance:** ADR-031 (artifact-mediated communication); ADR-032 (specialist extraction); Essay 007 §3
**Owns:** Citation verification process, audit artifact production (P1/P2/P3 issues with locations, evidence, recommendations)
**Depends on:** None (receives input via file paths in dispatch)
**Depended on by:** Research Skill (dispatches after essay), Synthesis Skill (dispatches before outline finalization)
**Model:** Sonnet

### Module: Argument Auditor Agent (`agents/argument-auditor.md`)
**Purpose:** Maps inferential chains from evidence to conclusions in an essay, ADR set, or outline, producing a structured audit artifact.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** Argument mapping process, logical gap detection, hidden assumption identification, audit artifact production
**Depends on:** None (receives input via file paths in dispatch)
**Depended on by:** Research Skill (dispatches after citation audit), Decide Skill (dispatches after ADRs), Synthesis Skill (dispatches after citation audit)
**Model:** Sonnet

### Module: Lit Reviewer Agent (`agents/lit-reviewer.md`)
**Purpose:** Performs systematic literature search and synthesis for a research question, producing a research log entry as artifact.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** Literature search process, source quality evaluation, synthesis narrative production
**Depends on:** None (receives research question via dispatch)
**Depended on by:** Research Skill (user-selected research method)
**Model:** Sonnet

### Module: Conformance Scanner Agent (`agents/conformance-scanner.md`)
**Purpose:** Scans codebase against ADR declarations, producing a conformance debt table with file:line references for violations.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** ADR-to-code comparison, violation detection, conformance debt table production
**Depends on:** None (receives ADR file paths and codebase path via dispatch)
**Depended on by:** Decide Skill (dispatches at Step 3.5), Conform Skill (dispatches during drift detection)
**Model:** Sonnet

### Module: Orientation Writer Agent (`agents/orientation-writer.md`)
**Purpose:** Reads the current artifact corpus and produces or refreshes ORIENTATION.md in the five-section structure (ADR-020).
**Provenance:** ADR-031; ADR-032; ADR-019 (orientation document); ADR-020 (five-section structure); ADR-021 (agent-generated, user-validated)
**Owns:** Orientation document generation, artifact corpus reading, five-section distillation
**Depends on:** None (reads artifact files directly)
**Depended on by:** Orchestrator (dispatches at milestones via orientation trigger hook)
**Model:** Sonnet

### Module: Spike Runner Agent (`agents/spike-runner.md`)
**Purpose:** Runs a focused code spike in a scratch directory, answering a single research question and writing findings to the research log.
**Provenance:** ADR-031; ADR-032; Essay 007 §3
**Owns:** Spike execution, scratch directory management (`./scratch/spike-*/`), prose findings production
**Depends on:** None (receives spike question via dispatch)
**Depended on by:** Research Skill (user-selected research method)
**Model:** Inherit (parent model — spikes may require exploratory reasoning)

### Cross-Cutting Hook Modules

All hooks are configured in `hooks/hooks.json` at the plugin root, with scripts in `hooks/scripts/`. They fire passively on system events and inject context or reminders. No hook blocks operations (all use exit code 0 for context injection).

### Module: Invariant Reminder Hook (`hooks/scripts/invariant-reminder`)
**Purpose:** Reminds the agent to check domain-model.md invariants before modifying any artifact in `docs/`.
**Provenance:** ADR-033; Essay 007 §3
**Event:** PreToolUse (matcher: Write|Edit on `docs/`)
**Owns:** Invariant reminder text injection
**Depends on:** Domain model artifact (references invariants section path)

### Module: Epistemic Gate Enforcer Hook (`hooks/scripts/epistemic-gate`)
**Purpose:** Reminds the agent about the epistemic gate if an RDD phase is completing without gate conversation.
**Provenance:** ADR-033; Invariant 2 (epistemic acts mandatory at every gate); Essay 007 §3
**Event:** Stop (no matcher — fires on all Stop events; script checks if in RDD phase)
**Owns:** Gate reminder text injection

### Module: Skill Activator Hook (`hooks/scripts/skill-activator`)
**Purpose:** Detects RDD-related prompts, suggests the appropriate phase skill, and prevents brainstorming override on explicit RDD requests.
**Provenance:** ADR-033; ADR-035; Essay 007 §7
**Event:** UserPromptSubmit (no matcher — script performs intent matching)
**Owns:** RDD intent detection, skill suggestion, brainstorming override prevention context

### Module: Orientation Trigger Hook (`hooks/scripts/orientation-trigger`)
**Purpose:** Signals that ORIENTATION.md should be regenerated after changes to key artifacts.
**Provenance:** ADR-033; ADR-021 (milestone-based regeneration); Essay 007 §3
**Event:** PostToolUse (matcher: Write on system-design.md, domain-model.md, or scenarios.md)
**Owns:** Regeneration reminder text injection

### Module: Document Sizing Check Hook (`hooks/scripts/sizing-check`)
**Purpose:** Flags documents exceeding sizing heuristics after any write to `docs/`.
**Provenance:** ADR-033; ADR-024 (document sizing heuristics); Essay 007 §3
**Event:** PostToolUse (matcher: Write on `docs/`)
**Owns:** Sizing heuristic evaluation, threshold flagging

### Plugin Infrastructure

### Module: Plugin Manifest (`.claude-plugin/plugin.json`)
**Purpose:** Declares the plugin identity and enables auto-discovery of skills, agents, and hooks by the Claude Code runtime.
**Provenance:** ADR-034; Essay 007 §5
**Owns:** Plugin name (`rdd`), version, description
**Depends on:** None
**Depended on by:** All skills (namespace prefix `/rdd-`), all agents (discovery), all hooks (registration)

## Responsibility Matrix

### Epistemic Gate Concepts (from Essay 001 / ADRs 001-005)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Gate (protocol definition) | Orchestrator | ADR-001, ADR-002 |
| Epistemic Gate (protocol) | Orchestrator | ADR-001, Invariant 2 |
| Approval Gate (removal) | Orchestrator + all skills | ADR-001 |
| Epistemic Act (framework) | ADR-003 (reference); each skill (implementation) | ADR-002, ADR-003 |
| Self-Explanation (prompts) | Research Skill, Model Skill, Product Discovery Skill, Build Skill | ADR-003, ADR-011 |
| Elaborative Interrogation (prompts) | Decide Skill, Product Discovery Skill | ADR-003, ADR-011 |
| Retrieval Practice (prompts) | Model Skill, Architect Skill, Product Discovery Skill | ADR-003, ADR-011 |
| Articulation (prompts) | Research Skill, Decide Skill, Architect Skill, Product Discovery Skill | ADR-003, ADR-011 |
| Reflection (prompts) | Research Skill, Decide Skill, Architect Skill, Build Skill | ADR-003 |
| Metacognitive Prompt | Each skill (in its gate section) | ADR-003, Invariant 2 |
| Grounding Move | Each skill (epistemic acts function as) | Invariant 5, ADR-001 |
| Common Ground (enrichment) | Orchestrator (feed-forward instruction) | ADR-004, Invariant 7 |
| Tacit Knowledge (surfacing) | Each skill (side effect of epistemic acts); Product Discovery Skill (primary for product knowledge) | Essay 001 §7; ADR-011 |
| Fading (deferred) | None — tracked as design debt | ADR-005 |
| Scaffolding | Each skill (fixed-level prompts) | ADR-005 |
| Authority (building) | Pipeline-wide (cumulative effect) | Invariant 0 |
| Pipeline (sequence) | Orchestrator | Existing design; ADR-006 |
| Phase (definition) | Each skill + Orchestrator (PRODUCT DISCOVERY phase) | Existing design; ADR-006 |
| Artifact (production) | Each skill | Existing design |
| Epistemic Artifact (dual role) | Each skill (gate transforms artifact into learning instrument) | Essay 001 §6 |

### Product Discovery Concepts (from Essay 002 / ADRs 006-011)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Product Discovery (phase + process) | Product Discovery Skill (process); Orchestrator (phase in pipeline) | ADR-006 |
| Stakeholder Map (artifact section) | Product Discovery Skill | ADR-007 |
| User Mental Model (artifact section) | Product Discovery Skill | ADR-007; Essay 002 §5.1 |
| Value Tension (artifact section) | Product Discovery Skill | ADR-007; Essay 002 §5.2 |
| Assumption Inversion (artifact section) | Product Discovery Skill | ADR-007; ADR-010 |
| Product Vocabulary (artifact section) | Product Discovery Skill | ADR-007; ADR-009 |
| Product Conformance (backward mode audit) | Product Discovery Skill | ADR-008; Essay 002 §8 |
| Artifact Legibility (design principle) | Product Discovery Skill (artifact written in user language) | ADR-007; Essay 002 §11 |
| Inversion Principle (cross-cutting) | Orchestrator (cross-cutting principle); Product Discovery Skill (procedural step) | ADR-010 |
| Invert (action — procedural step) | Product Discovery Skill (primary); Orchestrator (cross-cutting instruction) | ADR-010 |
| Map Stakeholders (action) | Product Discovery Skill | ADR-007; Essay 002 §6.1 |
| Audit Product Conformance (action) | Product Discovery Skill (backward mode) | ADR-008; Essay 002 §8 |
| Product Vocabulary provenance (Product Origin column) | Model Skill | ADR-009 |

### Actions

| Action | Owning Module | Provenance |
|--------|---------------|------------|
| Generate | Each skill (unchanged — AI still generates) | ADR-001 |
| Approve (being replaced) | Orchestrator + all skills | ADR-001 |
| Self-Explain | Research, Model, Product Discovery, Build skills | ADR-003, ADR-011 |
| Interrogate | Decide, Product Discovery skills | ADR-003, ADR-011 |
| Retrieve | Model, Architect, Product Discovery skills | ADR-003, ADR-011 |
| Articulate | Research, Decide, Architect, Product Discovery skills | ADR-003, ADR-011 |
| Reflect | Research, Decide, Architect, Build skills | ADR-003 |
| Ground | Orchestrator (protocol); each skill (execution) | ADR-001, ADR-004 |
| Surface | Each skill (side effect of epistemic acts) | Essay 001 §7 |
| Fade (deferred) | None | ADR-005 |
| Invert | Product Discovery Skill (primary); Orchestrator (cross-cutting) | ADR-010 |
| Map Stakeholders | Product Discovery Skill | ADR-007 |
| Audit Product Conformance | Product Discovery Skill | ADR-008 |
| Orient | Orchestrator (instruction to generate at milestones) | ADR-021 |
| Validate Orientation | Orchestrator (instruction to present for validation) | ADR-021 |

### Synthesis Concepts (from Essay 003 / ADRs 012-018)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Synthesis (phase + process) | Synthesis Skill (process); Orchestrator (phase in pipeline) | ADR-012 |
| Synthesis Essay (outline) | Synthesis Skill (produces outline); User (writes essay outside pipeline) | ADR-012; ADR-013 |
| Artifact Trail (mining) | Synthesis Skill | ADR-013; Essay 003 §3 |
| Dead Discovery (detection) | Synthesis Skill (via novelty signals) | ADR-013; Essay 003 §1 |
| Novelty Signal (detection procedure) | Synthesis Skill | ADR-013; Essay 003 §3 |
| Volta (surfacing candidates) | Synthesis Skill (surfaces); User (selects and owns) | ADR-013; Essay 003 §6 |
| Narrative Context Rollup (dual purpose) | Orchestrator (context loading); Synthesis Skill (produces outline that becomes essay) | ADR-015; Reflection 003 §1 |
| Public Authority (testing) | Synthesis Skill (tests via conversation); Synthesis Essay (demonstrates) | ADR-012; Invariant 0 |
| Cross-Project Synthesis Level 1 (conversational) | Synthesis Skill (prompting during framing) | ADR-018 |
| Writing as Inquiry (grounding principle) | Synthesis Skill (grounds phase architecture) | ADR-013; Essay 003 §2 |
| Worth-the-Calories quality tests (Davis/ABT/inversion) | Synthesis Skill | ADR-014; Essay 003 §5 |
| Mine Artifact Trail (action) | Synthesis Skill | ADR-013 |
| Review Journey (action) | Synthesis Skill | ADR-013 |
| Surface Novelty (action) | Synthesis Skill | ADR-013 |
| Frame Narrative (action — four-dimension navigation via structural experiments) | Synthesis Skill | ADR-013; ADR-017; ADR-027; ADR-028 |
| Write Synthesis Essay (action) | User (outside pipeline) | ADR-012; ADR-013 |
| Inversion Principle (narrative framing level) | Synthesis Skill; Orchestrator (cross-cutting) | ADR-017 |

### Synthesis Enrichment Concepts (from Essay 006 / ADRs 027-030)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Narrative Form (vocabulary — three tiers: established patterns, hermit crab forms, meta-forms) | Synthesis Skill | ADR-027; Essay 006 §2 |
| Hermit Crab Form (vocabulary — essay inhabiting non-essay shell) | Synthesis Skill | ADR-027; Essay 006 §2 |
| Epistemic Posture (dimension — determined/exploratory/indeterminate) | Synthesis Skill | ADR-027; Essay 006 §5 |
| Structural Experiment (mechanism — externalized trials in candidate forms) | Synthesis Skill | ADR-028; Essay 006 §§2, 7 |
| Curatorial Arrangement (outline register — selection, juxtaposition, scale shifts, shimmer, negative space, personal voice) | Synthesis Skill | ADR-030; Essay 006 §6 |
| Argumentative Backbone (outline register — logical structure verified by argument audit) | Synthesis Skill | ADR-030; Essay 006 §§6, 8 |
| Form-Content Generation (principle — formal constraint generates content, not merely contains it) | Synthesis Skill | ADR-028; Essay 006 §2 |
| Audience Constraint (dimension — medium as creative catalyst) | Synthesis Skill | ADR-027; Essay 006 §4 |
| Try On Form (action — create structural experiment to see what form reveals) | Synthesis Skill | ADR-028; Essay 006 §7 |

### Orientation Document Concepts (from Essay 004 / ADRs 019-021)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Orientation Document (artifact) | Orchestrator (defines artifact hierarchy and regeneration instruction); all skills (read as context when bootstrapping) | ADR-019; ADR-020; ADR-021 |
| Artifact Hierarchy (three-tier principle) | Orchestrator (defines and owns the principle) | ADR-019 |
| Orient (action — generate/refresh) | Orchestrator (instruction to generate at milestones) | ADR-021 |
| Validate Orientation (action — user review) | Orchestrator (instruction to present for validation) | ADR-021 |
| Artifact Legibility (orientation as maximal legibility) | Orchestrator (design principle) | ADR-019; Essay 004 §4 |

### Motivating Context (not implemented in skill text — referenced for provenance only)

| Domain Concept | Source | Provenance |
|---------------|--------|------------|
| Opacity Problem | Essay 001 §1 | Motivating context for epistemic gates |
| Metacognitive Illusion | Essay 001 §1 | Motivating context |
| Maintenance Cliff | Essay 001 §8 | Motivating context |
| Context Window Ceiling | Essay 001 §8 | Motivating context |
| Desirable Difficulty | Essay 001 §2 | Theoretical basis |
| Cognitive Level | Essay 001 §2 | Theoretical basis |
| Dreyfus Stage | Essay 001 §2 | Theoretical basis (informs future fading) |
| Product Debt | Essay 002 §1, §9 | Motivating context for product discovery |
| Product Maintenance Cliff | Essay 002 §9 | Motivating context |

### Roadmap/Field Guide/Sizing Concepts (from Essay 005 / ADRs 022-024)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Roadmap (artifact) | Architect Skill (generation); Orchestrator (artifact hierarchy placement, Tier 2) | ADR-022 |
| Work Package (roadmap unit) | Architect Skill (derives from module decomposition) | ADR-022 |
| Transition State (roadmap) | Architect Skill (describes coherent intermediate architectures) | ADR-022 |
| Dependency Classification (roadmap edges) | Architect Skill (classifies as hard/implied/open) | ADR-022 |
| Generate Roadmap (action) | Architect Skill | ADR-022 |
| Field Guide (artifact) | Build Skill (first generation when implementation exists) | ADR-023 |
| Generate Field Guide (action) | Build Skill | ADR-023 |
| Document Sizing Heuristics (design principle) | Orchestrator (cross-cutting principle governing artifact structure) | ADR-024 |

### Conformance/Graduation/Scoping Concepts (from Essay 005 / ADRs 025-026)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Conformance Audit (process + four operations) | Conformance Audit Skill (process); Orchestrator (available skill listing) | ADR-025 |
| Audit Template Conformance (action) | Conformance Audit Skill | ADR-025 |
| Documentation Drift (detection) | Conformance Audit Skill (detects during drift detection operation) | ADR-025; Essay 005 §5 |
| Graduation (process) | Conformance Audit Skill (proposes migration plan); User (decides what to integrate) | ADR-025; ADR-026 |
| Graduate (action) | Conformance Audit Skill (proposes); User (executes) | ADR-025 |
| Documentation Fatigue (signal) | User (experiences); referenced by Conformance Audit Skill | ADR-025; ADR-026 |
| Scoped Cycle (workflow pattern) | Orchestrator (recognizes and supports) | ADR-026 |
| Scope Cycle (action) | User (initiates); Orchestrator (configures) | ADR-026 |
| Deep Work Tool (framing) | Orchestrator (describes RDD's role) | ADR-026 |

### Plugin Architecture Concepts (from Essay 007 / ADRs 031-036)

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Plugin (distribution unit) | Plugin Manifest | ADR-034 |
| Specialist Subagent (isolated execution pattern) | Each agent module (citation-auditor, argument-auditor, lit-reviewer, conformance-scanner, orientation-writer, spike-runner) | ADR-032 |
| Orchestrating Agent (main conversation AI role) | Orchestrator | ADR-032; Essay 007 §3 |
| Hook (passive event handler) | Each hook module (invariant-reminder, epistemic-gate-enforcer, skill-activator, orientation-trigger, sizing-check) | ADR-033 |
| Audit Artifact (structured report from auditor agents) | Citation Auditor Agent, Argument Auditor Agent, Conformance Scanner Agent | ADR-031; ADR-032 |
| Artifact-Mediated Communication (design principle) | Orchestrator (cross-cutting principle) | ADR-031; Essay 007 §4 |
| Skill Activator (brainstorming override prevention) | Skill Activator Hook | ADR-035 |
| Dispatch (send work to specialist subagent) | Orchestrator (protocol definition); Research, Decide, Synthesis, Conform Skills (execution) | ADR-032 |
| Write Audit Artifact (produce structured report as file) | Citation Auditor Agent, Argument Auditor Agent, Conformance Scanner Agent | ADR-031; ADR-032 |

## Dependency Graph

```
Plugin Manifest (.claude-plugin/plugin.json)
│
├── Skills Layer ─────────────────────────────────────────────────
│   Orchestrator
│   ├── Research Skill ──dispatches──→ citation-auditor, argument-auditor, lit-reviewer, spike-runner
│   ├── Product Discovery Skill
│   ├── Model Skill
│   ├── Decide Skill ──dispatches──→ argument-auditor, conformance-scanner
│   ├── Architect Skill (also generates roadmap.md)
│   ├── Build Skill (also generates field-guide.md)
│   ├── Synthesis Skill (usually terminal; conditional re-entry to Research)
│   │       └──dispatches──→ citation-auditor, argument-auditor
│   │       └──→ Research Skill (re-entry when structural experimentation surfaces new questions)
│   └── Conformance Audit Skill (utility) ──dispatches──→ conformance-scanner
│
├── Agents Layer ─────────────────────────────────────────────────
│   citation-auditor (Sonnet) ──reads──→ essay/outline, research log ──writes──→ audit artifact
│   argument-auditor (Sonnet) ──reads──→ essay/ADRs/outline, evidence trail ──writes──→ audit artifact
│   lit-reviewer (Sonnet) ──reads──→ research question ──writes──→ research log entry
│   conformance-scanner (Sonnet) ──reads──→ ADRs, codebase ──writes──→ conformance debt table
│   orientation-writer (Sonnet) ──reads──→ artifact corpus ──writes──→ ORIENTATION.md
│   spike-runner (inherit) ──reads──→ spike question ──writes──→ research log entry
│
└── Hooks Layer ──────────────────────────────────────────────────
    invariant-reminder (PreToolUse: Write|Edit on docs/) → context injection
    epistemic-gate-enforcer (Stop during RDD phase) → reminder injection
    skill-activator (UserPromptSubmit) → skill suggestion + override prevention
    orientation-trigger (PostToolUse: Write on key artifacts) → regeneration reminder
    sizing-check (PostToolUse: Write on docs/) → sizing flag
```

**Skill-level edges (unchanged from v5.0):**
- Orchestrator → all phase skills (invokes, defines protocol)
- Synthesis Skill → Research Skill (conditional re-entry — writer-initiated)
- Orchestrator → Conformance Audit Skill (lists in Available Skills)

**Skill-to-agent dispatch edges (NEW in v6.0):**
- Research Skill → citation-auditor (after essay writing)
- Research Skill → argument-auditor (after citation audit passes)
- Research Skill → lit-reviewer (user-selected research method)
- Research Skill → spike-runner (user-selected research method)
- Decide Skill → argument-auditor (after ADRs written)
- Decide Skill → conformance-scanner (Step 3.5, codebase scan)
- Synthesis Skill → citation-auditor (before outline finalization)
- Synthesis Skill → argument-auditor (after citation audit on outline)
- Conform Skill → conformance-scanner (drift detection operation)
- Orchestrator → orientation-writer (at milestones, triggered by orientation-trigger hook)

**Hook event edges (NEW in v6.0):**
- invariant-reminder → fires on PreToolUse (Write|Edit on `docs/`)
- epistemic-gate-enforcer → fires on Stop (during RDD phases)
- skill-activator → fires on UserPromptSubmit (RDD intent detection)
- orientation-trigger → fires on PostToolUse (Write on system-design.md, domain-model.md, scenarios.md)
- sizing-check → fires on PostToolUse (Write on `docs/`)

**Inter-skill communication:** Skills do not depend on each other directly. They communicate through artifact files:

```
essay → product-discovery.md → domain-model.md → ADRs + scenarios → system-design.md + roadmap.md → code + field-guide.md
                                                                                                       ↓
                                        [full artifact trail] → synthesis outline → synthesis essay (user)
                                                   ↓
                                        ORIENTATION.md (derived from full artifact trail at milestones)
```

The synthesis skill reads the full artifact trail (all prior artifacts), not just the immediately preceding one. The synthesis essay, when it exists, feeds back into the orchestrator as a context source for future sessions.

**Layering rules:**
- Orchestrator is the outer layer (coordination)
- Skills are the inner layer (phase execution)
- Skills never reference the orchestrator's content — they follow its protocol implicitly
- No cycles exist

## Integration Contracts

### Orchestrator → Each Phase Skill
**Protocol:** The orchestrator invokes each skill via `/skill-name`. The skill runs its phase, produces an artifact, and presents it at its epistemic gate. The orchestrator resumes after the gate completes.
**Shared types:** The epistemic gate protocol is the contract:
1. Skill presents artifact
2. Skill presents 2-3 exploratory epistemic act prompts referencing specific artifact content
3. User responds to at least one prompt
4. Skill notes obvious factual discrepancies
5. Skill asks whether to proceed
**Error handling:** If the user provides only non-generative approval ("looks good"), the skill re-presents the prompts with a gentle redirect.
**Owned by:** Orchestrator defines the protocol; each skill implements it.

### Phase Skill → Next Phase Skill (via artifacts)
**Protocol:** File-based. Each skill writes its artifact to the docs directory. The next skill reads it.
**Shared types:** Markdown files at known paths:
- Essay: `./docs/essays/NNN-descriptive-name.md`
- Product discovery: `./docs/product-discovery.md`
- Domain model: `./docs/domain-model.md`
- ADRs: `./docs/decisions/adr-NNN-*.md`
- Scenarios: `./docs/scenarios.md`
- System design: `./docs/system-design.md`
- Roadmap: `./docs/roadmap.md`
- Field guide: `./docs/references/field-guide.md`
**Error handling:** If an artifact is missing, the next skill prompts the user (existing behavior).
**Owned by:** Each skill owns its output artifact format.

### Product Discovery Skill → Model Skill (via product-discovery.md) — NEW
**Protocol:** File-based. Product Discovery Skill writes `./docs/product-discovery.md`. Model Skill reads it alongside the essay.
**Shared types:** The Product Vocabulary Table (ADR-007, section 5) is the primary input for the Model Skill's Product Origin column (ADR-009). Value Tensions propagate as Open Questions.
**Error handling:** If the product discovery artifact is missing (e.g., user skipped the phase), Model Skill proceeds without Product Origin column and notes the gap.
**Owned by:** Product Discovery Skill owns the artifact format; Model Skill owns the interpretation.

### Product Discovery Skill → Decide Skill (via product-discovery.md) — NEW
**Protocol:** File-based. Decide Skill reads `./docs/product-discovery.md` for stakeholder context and assumption inversions.
**Shared types:** Stakeholder Map and Jobs/Mental Models inform ADR context sections. Assumption Inversions are candidates for behavior scenarios.
**Error handling:** If product discovery artifact is missing, Decide Skill proceeds with essay context only.
**Owned by:** Product Discovery Skill owns the artifact; Decide Skill owns interpretation.

### Product Discovery Skill → Architect Skill (via product-discovery.md) — NEW
**Protocol:** File-based. Architect Skill reads `./docs/product-discovery.md` for extended provenance chains.
**Shared types:** Stakeholder/job references used in responsibility matrix provenance column (Module → Domain Concept → ADR → Product Discovery origin).
**Error handling:** If product discovery artifact is missing, provenance chains terminate at ADRs (existing behavior).
**Owned by:** Product Discovery Skill owns the artifact; Architect Skill owns provenance interpretation.

### External Review Re-entry (both primary documents) — NEW
**Protocol:** Stakeholder or technical reviewer reads one of the two primary documents and provides feedback. The feedback triggers re-entry at the owning phase:
- `product-discovery.md` feedback → re-enter at PRODUCT DISCOVERY, then forward-propagate through MODEL → DECIDE → ARCHITECT
- `system-design.md` feedback → re-enter at ARCHITECT (Design Amendment), then propagate to BUILD if in progress

**Shared types:** Reviewer feedback in natural language. The skill at the re-entry phase interprets and incorporates.
**Error handling:** Feedback may arrive asynchronously between sessions. The orchestrator's state table should note pending external feedback when resuming. If downstream phases have already completed, the scope of re-propagation must be assessed — a minor vocabulary correction propagates differently than "your stakeholder map is wrong."
**Owned by:** Orchestrator (defines re-entry as a valid pipeline operation); the receiving skill (interprets and incorporates feedback).

### Orchestrator → Synthesis Skill — NEW
**Protocol:** The orchestrator invokes `/rdd-synthesis` as an optional terminal phase. Unlike other phase skills, the synthesis skill does NOT follow the standard 5-step epistemic gate protocol — the three-phase conversation (journey review, novelty surfacing, framing) subsumes the gate function (ADR-016).
**Shared types:** The synthesis skill reads the FULL artifact trail:
- Essays: `./docs/essays/NNN-*.md`
- Research logs: `./docs/essays/research-logs/*.md`
- Reflections: `./docs/essays/reflections/*.md`
- Product discovery: `./docs/product-discovery.md`
- Domain model: `./docs/domain-model.md`
- ADRs: `./docs/decisions/adr-NNN-*.md`
- Scenarios: `./docs/scenarios.md`
- System design: `./docs/system-design.md`
**Error handling:** If the artifact trail is too thin (e.g., only essay + domain model), the skill notes this and asks whether to proceed or defer.
**Owned by:** Orchestrator defines SYNTHESIS as optional phase; Synthesis Skill owns the conversation structure.

### Phase Skill → Specialist Subagent (dispatch protocol) — NEW in v6.0
**Protocol:** The phase skill dispatches a specialist subagent by spawning it with: (1) file paths to input artifacts, (2) output file path for the result artifact. The agent runs in isolation (no conversation history), reads input files, performs analysis, and writes the output artifact. The phase skill resumes by reading the output artifact. Agent dispatch replaces the prior pattern of invoking external skills (`/citation-audit`, `/argument-audit`, `/lit-review`) inline.
**Shared types:** Input: file paths to essays, research logs, ADRs, outlines, or codebase. Output: structured audit artifact (summary counts, P1/P2/P3 issues with locations, evidence, recommendations) or research log entry.
**Error handling:** If the agent fails to produce an output artifact, the phase skill falls back to inline execution (graceful degradation). P1 issues get fixed immediately. P2 issues surface at the epistemic gate for user judgment. P3 issues are noted or deferred.
**Owned by:** Each phase skill owns the dispatch decision; each agent owns its output format.

### Hook → Agent/Skill (context injection protocol) — NEW in v6.0
**Protocol:** Hooks fire on system events and inject context into the agent's conversation via stdout. Hook scripts receive structured JSON on stdin (event type, tool name, file path). Scripts inspect the event and either: (a) output reminder/context text (injected), or (b) output nothing (no injection). Exit code 0 = success with injection, exit code 2 = block the operation (reserved for exceptional cases).
**Shared types:** Input: JSON event payload per Claude Code hook spec. Output: plain text reminder (or empty for no injection).
**Error handling:** Hook script failure (non-zero exit, crash) is non-fatal — the operation proceeds without the hook's context. Hooks are advisory.
**Owned by:** Plugin-level `hooks/hooks.json` defines all hooks; individual scripts implement logic.

### Plugin Manifest → Claude Code Runtime (discovery protocol) — NEW in v6.0
**Protocol:** The `.claude-plugin/plugin.json` file declares the plugin name (`rdd`). The Claude Code runtime auto-discovers skills (from `skills/*/SKILL.md`), agents (from `agents/*.md`), and hooks (from `hooks/hooks.json`). The runtime applies namespace prefix (`/rdd-`) to all skills.
**Shared types:** `plugin.json` with `name` field. Skills, agents, hooks at conventional directory paths.
**Error handling:** Missing manifest → plugin does not load. Missing individual files → those components unavailable but others function.
**Owned by:** Claude Code runtime owns the discovery protocol; the plugin owns the manifest.

### Synthesis Skill → Research Skill (re-entry) — NEW
**Protocol:** When a structural experiment during the framing conversation reveals an incoherence that the writer articulates as a research question, the synthesis conversation pauses and the pipeline re-enters RESEARCH at the relevant scope. The writer must articulate the question — if they cannot, the incoherence is treated as a framing problem solvable within synthesis. Re-entry is scoped narrowly (a specific question, not a repeat of the entire cycle). The synthesis conversation may resume after the research question is addressed, avoiding redoing journey review and novelty surfacing.
**Shared types:** The research question is recorded in the research log (`./docs/essays/research-logs/research-log.md`) as a new entry. The synthesis conversation state is preserved in conversation context (single-session) or noted for manual resumption (multi-session).
**Error handling:** If the research question leads to a domain model change, the synthesis conversation must account for the new vocabulary when it resumes. If the writer chooses not to re-enter despite the incoherence, synthesis proceeds normally — re-entry is never forced.
**Owned by:** Synthesis Skill initiates the pause; Research Skill handles the re-entry question; writer decides whether to re-enter.

### Synthesis Skill → Argument Audit Skill (external) — NEW
**Protocol:** After citation audit passes, Synthesis Skill invokes `/argument-audit` on the outline itself — treating the narrative structure (central question, turns, threads) as the argument and the pre-populated references as the evidence base. Same `/argument-audit` that Decide Skill invokes on ADRs, applied to the narrative genre.
**Shared types:** The outline (narrative structure + pre-populated references) is the input. Argument Audit returns logical integrity results.
**Error handling:** If argument audit finds overreaching claims, unsupported framing, or hidden assumptions, the synthesis skill revises the outline's framing before presenting it to the writer.
**Owned by:** Synthesis Skill initiates; Argument Audit Skill owns the audit methodology.

### Orchestrator → ORIENTATION.md (cross-phase artifact) — NEW
**Protocol:** The orchestrator instructs the agent to generate or refresh ORIENTATION.md at natural milestones (after RESEARCH for partial orientation, after DECIDE for mid-cycle orientation, after ARCHITECT for scoping handoff, after BUILD for full orientation) and whenever the user requests. The generation reads the full artifact trail and distills it into the five-section structure (ADR-020). The user validates the result. No epistemic gate — this is a pragmatic action, but the validation step should encourage genuine review: the agent presents the document and asks whether it accurately describes the system as the user understands it, surfacing any claims that feel wrong or oversimplified.
**Shared types:** ORIENTATION.md at `./docs/ORIENTATION.md`. The document reads from all other artifacts (product-discovery.md, system-design.md, domain-model.md, ADRs, scenarios) but is derived, not authoritative. If the orientation document contradicts a source artifact, the orientation document is regenerated.
**Error handling:** If artifacts are insufficient for full orientation (e.g., only RESEARCH complete), a partial document is generated with sections 1 and 5 only. Missing sections are either omitted or marked as pending.
**Owned by:** Orchestrator (defines regeneration timing); the generated artifact is validated by the user.

### Architect Skill → roadmap.md (new output) — NEW
**Protocol:** After system design is produced, Architect Skill generates `./docs/roadmap.md`. Derives work packages from the module decomposition, classifies each dependency edge as hard/implied/open, describes transition states.
**Shared types:** `./docs/roadmap.md`. The roadmap reads system design modules and ADRs to derive work packages. System design links to it for sequencing context.
**Error handling:** If the system is small enough that no sequencing context is needed (e.g., a single-module system), the roadmap may be trivially simple or omitted.
**Owned by:** Architect Skill owns roadmap generation; system-design.md links to it.

### Build Skill → field-guide.md (new output) — NEW
**Protocol:** During or after BUILD, when implementation exists, Build Skill generates `./docs/references/field-guide.md`. Maps each system design module to its current implementation state.
**Shared types:** `./docs/references/field-guide.md`. The field guide reads system-design.md and the actual codebase.
**Error handling:** If no implementation exists (e.g., still in ARCHITECT phase), field guide is not generated. Only produced when there is code to map against.
**Owned by:** Build Skill owns field guide generation.

### Orchestrator → Conformance Audit Skill — NEW
**Protocol:** The orchestrator lists the conformance audit skill in Available Skills. The user invokes it when needed — not part of the standard pipeline sequence. The skill reads current skill files and the project's artifact corpus, produces a conformance report.
**Shared types:** Input: RDD skill files (`rdd*/SKILL.md`) + project artifact corpus (`docs/`). Output: conformance report (gap analysis, remediation recommendations, drift findings, graduation plan).
**Error handling:** If no artifacts exist, audit reports "no artifacts to audit." If skill files cannot be read, reports the access limitation.
**Owned by:** Orchestrator (available skill listing); Conformance Audit Skill (audit methodology and four operations).

### Synthesis Skill → Orchestrator (context loading feedback) — NEW
**Protocol:** When a synthesis essay exists for a project (written by the user outside the pipeline), the orchestrator treats it as a primary context source when bootstrapping new sessions.
**Shared types:** The synthesis essay at its essay path (`./docs/essays/NNN-*.md`), distinguished from research essays by the outline that preceded it.
**Error handling:** If the synthesis essay does not exist (user hasn't written it yet), the orchestrator proceeds without it (existing behavior).
**Owned by:** Orchestrator owns context loading logic; the synthesis essay's existence is the trigger.

### Feed-Forward Contract (ADR-004)
**Protocol:** Conversational. In single-session cycles, the user's epistemic responses are in conversation history. In multi-session cycles, the orchestrator's status table summarizes key responses.
**Shared types:** Natural language in conversation context.
**Error handling:** Multi-session persistence is lossy — acknowledged as known limitation (ADR-004).
**Owned by:** Orchestrator (defines the instruction to attend to prior responses).

## Fitness Criteria

| Criterion | Measure | Threshold | Derived From |
|-----------|---------|-----------|-------------|
| Every skill has an epistemic gate | Presence of EPISTEMIC GATE section in SKILL.md | All 6 phase skills + orchestrator protocol | ADR-001, ADR-002, ADR-011 |
| No gate is approval-only | Gate text requires user to produce something | Zero approval-only gates | Invariant 2 |
| Prompts reference specific content | Gate prompts contain artifact-specific references, not generic questions | All prompts reference specific concepts/decisions from the artifact | ADR-003 |
| Prompts use exploratory framing | Gate prompts use open-ended, collaborative tone | Zero quiz-style prompts | ADR-003 |
| Epistemic cost is lightweight | Number of prompts per gate | 2-3 prompts per gate, user performs at least 1 | Invariant 4 |
| Non-generative approval is handled | Gate includes redirect for approval-only responses | All gates include redirect language | Scenarios |
| Factual discrepancy noting exists | Gate includes instruction to note discrepancies without assessing understanding | All gates include discrepancy language | ADR-001 |
| No module owns more than 10 glossary entries | Count of responsibility matrix rows per module | ≤ 10 | Design balance |
| Product discovery artifact has all 5 sections | Read product-discovery.md template in SKILL.md | Stakeholder Map, Jobs/Mental Models, Value Tensions, Assumption Inversions, Product Vocabulary Table | ADR-007 |
| Forward and backward modes are both defined | Product Discovery Skill contains process for both modes | Both modes present | ADR-008 |
| Inversion principle appears in 4 locations | Orchestrator (cross-cutting), Product Discovery (procedural), Decide (check), Architect (check) | All 4 present | ADR-010 |
| Pipeline includes PRODUCT DISCOVERY | Orchestrator workflow modes and state table include the phase | Phase present between UNDERSTAND and MODEL | ADR-006 |
| Product Origin column in domain model template | Model Skill references Product Origin column | Column defined | ADR-009 |
| Downstream skills read product discovery artifact | Model, Decide, Architect skills include instruction to read `./docs/product-discovery.md` | All 3 include read instruction | ADR-006, ADR-009 |
| Synthesis skill has three-phase conversation structure | Skill contains journey review, novelty surfacing, and framing conversation steps | All 3 phases present | ADR-013 |
| Synthesis skill includes novelty signal detection | Skill describes five novelty signals and artifact trail mining procedure | All 5 signals documented | ADR-013; Essay 003 §3 |
| Synthesis skill includes worth-the-calories quality tests | Skill contains Davis, ABT, and inversion tests during framing | All 3 tests present | ADR-014 |
| Synthesis skill does NOT have separate EPISTEMIC GATE section | Conversation subsumes gate; no bolted-on gate after outline | No EPISTEMIC GATE header | ADR-016 |
| Synthesis skill includes citation audit invocation | Skill invokes `/citation-audit` before outline finalization | Invocation present | ADR-013 |
| Synthesis skill includes argument audit invocation | Skill invokes `/argument-audit` after citation audit passes | Invocation present | ADR-013 (extended) |
| Synthesis skill includes cross-project conversational prompting | Skill asks about resonance with other work during framing | Prompting present in Phase 3 | ADR-018 |
| Synthesis skill includes narrative inversion lenses | Skill offers three narrative inversions during framing | All 3 inversions present | ADR-017 |
| Outline includes pre-populated references | Outline production step extracts citations with full quotes | Reference extraction step present | ADR-013 |
| Pipeline includes SYNTHESIS as optional terminal | Orchestrator lists SYNTHESIS after BUILD, marked optional | Phase present and marked optional | ADR-012 |
| Orchestrator includes synthesis essay in context loading | When bootstrapping, orchestrator reads synthesis essay if it exists | Context loading instruction present | ADR-015 |
| Inversion principle appears in 5 locations | Orchestrator (cross-cutting), Product Discovery (procedural), Decide (check), Architect (check), Synthesis (narrative) | All 5 present | ADR-010; ADR-017 |
| Orchestrator references three-tier artifact hierarchy | "Two documents that matter" principle amended to three tiers | Three-tier language present; two-tier language removed | ADR-019 |
| Orchestrator Artifacts Summary includes ORIENTATION.md | Artifacts Summary table has cross-phase row for ORIENTATION.md | Row present | ADR-019 |
| Orientation document has five-section structure | Orchestrator or generation instruction specifies: what, who, constraints, artifact map, current state | All 5 sections specified | ADR-020 |
| Orientation document is agent-generated, user-validated | Generation instruction specifies agent produces, user reviews | Both roles present; no epistemic gate section for orientation | ADR-021; Invariant 3 |
| Orientation document regeneration at milestones | Orchestrator specifies regeneration after RESEARCH (partial), ARCHITECT (scoping), BUILD (full) | Milestone-based regeneration specified | ADR-021 §3 |
| Source artifacts authoritative over orientation | Orchestrator or generation instruction states source artifacts win contradictions | Authority hierarchy stated | ADR-021 |
| Architect Skill generates roadmap as output | Presence of roadmap generation step in rdd-architect SKILL.md | Step present with work packages, dependency classification, transition states | ADR-022 |
| Roadmap contains classified dependencies | Roadmap template includes hard/implied/open classification | Classification scheme present | ADR-022 |
| System design links to roadmap (not inline Build Sequence) | system-design.md contains link to roadmap.md instead of prescriptive Build Sequence | Link present; no inline Build Sequence | ADR-022 |
| Build Skill generates field guide when implementation exists | Presence of field guide generation step in rdd-build SKILL.md | Step present; conditional on implementation existence | ADR-023 |
| Document sizing heuristics in orchestrator cross-cutting principles | rdd/SKILL.md lists five cascading heuristics | All 5 heuristics listed in priority order | ADR-024 |
| Conformance audit skill exists with four operations | rdd-conform SKILL.md contains audit, remediation, drift detection, graduation | All 4 operations present | ADR-025 |
| Conformance audit uses two-level severity | rdd-conform SKILL.md classifies gaps as structural vs. format | Classification present | ADR-025 |
| Orchestrator supports scoped cycles | rdd/SKILL.md describes scoped cycle workflow pattern | Pattern described with subfolder convention and graduation endpoint | ADR-026 |
| Orchestrator describes RDD as deep work tool | rdd/SKILL.md includes deep work tool framing | Framing present | ADR-026 |
| Orchestrator Artifacts Summary includes roadmap and field guide | rdd/SKILL.md Artifacts Summary table has rows for both | Both rows present | ADR-022; ADR-023 |
| Orchestrator Available Skills includes conformance audit | rdd/SKILL.md Available Skills table has row for conformance audit | Row present | ADR-025 |
| Artifact hierarchy includes roadmap (Tier 2) and field guide (Tier 3) | rdd/SKILL.md three-tier hierarchy references both new artifacts | Both present in hierarchy description | ADR-019 amendment; ADR-022; ADR-023 |
| Synthesis skill uses four-dimension framing model | Skill navigates discovery type, narrative form, audience constraint, epistemic posture during framing conversation | All 4 dimensions present in Phase 3 | ADR-027; Essay 006 §7 |
| Synthesis skill includes structural experiment mechanism | Skill proposes externalized trials in candidate forms; agent proposes, writer executes; failures are diagnostic | Mechanism present with agent/writer roles specified | ADR-028; Essay 006 §§2, 7 |
| Synthesis skill produces two-register outline | Outline contains argumentative backbone (verified by argument audit) and curatorial arrangement (selection, juxtaposition, scale shifts, shimmer, negative space, personal voice) | Both registers present in outline production step | ADR-030; Essay 006 §§6, 8 |
| Synthesis skill includes re-entry logic | Skill describes conditions for re-entering RESEARCH; re-entry is writer's decision; writer must articulate the question; re-entry is scoped narrowly | Re-entry section present with writer-decision constraint | ADR-029; Essay 006 §9 |
| Synthesis skill includes narrative form vocabulary | Skill provides three tiers of narrative forms (established patterns, hermit crab forms, meta-forms) as starting repertoire | Form vocabulary present | ADR-027; Essay 006 §2 |
| Synthesis skill includes epistemic posture dimension | Skill navigates determined/exploratory/indeterminate epistemic postures | Posture dimension present | ADR-027; Essay 006 §5 |
| Every specialist invocation dispatches an agent | Skill files contain agent dispatch instructions, not inline `/citation-audit` or `/argument-audit` invocations | All specialist work dispatched via agents | ADR-032 |
| Every agent produces a durable artifact file | Agent system prompts specify file output path; no agent communicates findings only through conversation | All 6 agents write output files | ADR-031 |
| No cross-cutting concern duplicated across skills | Invariant reading, gate enforcement, orientation triggering, and sizing checks are in hooks | All 5 concerns in hooks; not repeated in skill text | ADR-033 |
| Plugin installs with all components discovered | `claude --plugin-dir ./rdd` loads 9 skills, 6 agents, 5 hooks | All components registered | ADR-034 |
| Skill namespace uses hyphen separator | Skills invoked as `/rdd-research`, `/rdd-decide`, etc. | All skill references use hyphen syntax | ADR-034 |
| Skill activator prevents brainstorming override | UserPromptSubmit hook fires on RDD-related prompts and injects priority context | Hook registered and functional | ADR-035 |
| Research log archived at cycle end | Research skill archives log after reflections, not at start of next cycle | Archival step at cycle end in skill file | ADR-036 |
| Agents run at model-appropriate level | Auditors, lit-reviewer, conformance-scanner, orientation-writer on Sonnet; spike-runner inherits parent | Model selection in each agent's frontmatter | ADR-032 |
| Hooks are advisory, not blocking | All hooks use exit code 0 (context injection); none use exit code 2 | Hook scripts return 0 | ADR-033 |

## Test Architecture

### Boundary Integration Tests

| Dependency Edge | Integration Test | What It Verifies |
|----------------|-----------------|------------------|
| Orchestrator → Research Skill | Read Research SKILL.md; verify EPISTEMIC GATE section exists and follows protocol | Gate protocol contract satisfied |
| Research Skill → Citation Audit | Read Research SKILL.md; verify `/citation-audit` invocation after essay writing, before epistemic gate | Citation audit contract |
| Research Skill → Argument Audit | Read Research SKILL.md; verify `/argument-audit` invocation after citation audit, before epistemic gate | Argument audit contract |
| Orchestrator → Product Discovery Skill | Read Product Discovery SKILL.md; verify EPISTEMIC GATE section exists, follows protocol, references stakeholders/tensions/inversions | Gate protocol contract satisfied; ADR-011 prompts present |
| Orchestrator → Model Skill | Read Model SKILL.md; verify EPISTEMIC GATE section exists and follows protocol | Gate protocol contract satisfied |
| Orchestrator → Decide Skill | Read Decide SKILL.md; verify EPISTEMIC GATE section exists and follows protocol | Gate protocol contract satisfied |
| Orchestrator → Architect Skill | Read Architect SKILL.md; verify EPISTEMIC GATE section exists and follows protocol | Gate protocol contract satisfied |
| Orchestrator → Build Skill | Read Build SKILL.md; verify epistemic prompts in scenario completion step | Gate protocol contract satisfied |
| Orchestrator protocol → Workflow modes | Read Orchestrator SKILL.md; verify workflow mode descriptions include PRODUCT DISCOVERY phase and use epistemic gate language | Pipeline includes new phase; approval-only language removed |
| Product Discovery → Model Skill | Read Model SKILL.md; verify Step 1 reads `./docs/product-discovery.md`; verify Product Origin column in Concepts table template | ADR-009 feed-forward contract |
| Product Discovery → Decide Skill | Read Decide SKILL.md; verify Step 1 reads `./docs/product-discovery.md`; verify inversion principle check present | ADR-010 cross-cutting contract |
| Product Discovery → Architect Skill | Read Architect SKILL.md; verify it reads `./docs/product-discovery.md`; verify inversion principle check present; verify provenance chain extends to product discovery | ADR-010 + extended provenance contract |
| Orchestrator → Synthesis Skill | Read Synthesis SKILL.md; verify three-phase conversation structure; verify NO separate EPISTEMIC GATE section; verify novelty signal detection; verify quality tests; verify citation audit invocation; verify argument audit invocation | ADR-012, ADR-013, ADR-014, ADR-016 contract |
| Synthesis Skill → Citation Audit | Read Synthesis SKILL.md; verify `/citation-audit` invocation during outline finalization | ADR-013 citation audit contract |
| Synthesis Skill → Argument Audit | Read Synthesis SKILL.md; verify `/argument-audit` invocation after citation audit during outline finalization | Argument audit contract |
| Synthesis Skill → Artifact Trail | Read Synthesis SKILL.md; verify Step 1 reads full artifact trail (essays, logs, reflections, product discovery, domain model, ADRs, scenarios, system design) | ADR-013 artifact trail contract |
| Orchestrator context loading → Synthesis Essay | Read Orchestrator SKILL.md; verify synthesis essay listed as context source when bootstrapping | ADR-015 narrative context rollup contract |
| Orchestrator → ORIENTATION.md | Read Orchestrator SKILL.md; verify three-tier artifact hierarchy principle present; verify "two documents that matter" amended; verify Artifacts Summary includes ORIENTATION.md row; verify regeneration instruction at milestones | ADR-019, ADR-020, ADR-021 contract |
| Orchestrator → ORIENTATION.md structure | Read Orchestrator SKILL.md; verify five-section structure specified (what, who, constraints, artifact map, current state); verify under-five-minutes constraint | ADR-020 structure contract |
| Orchestrator → ORIENTATION.md authority | Read Orchestrator SKILL.md; verify source artifacts authoritative over orientation document | ADR-021 truth hierarchy contract |
| Architect Skill → roadmap.md | Read rdd-architect SKILL.md; verify roadmap generation step derives work packages from module decomposition with classified dependencies (hard/implied/open) and transition states | ADR-022 roadmap contract |
| Build Skill → field-guide.md | Read rdd-build SKILL.md; verify field guide generation maps modules to implementation state; verify conditional on implementation existence | ADR-023 field guide contract |
| Orchestrator → Conformance Audit Skill | Read rdd/SKILL.md; verify Available Skills includes conformance audit; read rdd-conform SKILL.md; verify four operations (audit, remediation, drift detection, graduation) | ADR-025 conformance contract |
| Orchestrator → scoped cycles | Read rdd/SKILL.md; verify scoped cycle workflow pattern described with subfolder convention, graduation endpoint, deep work tool framing | ADR-026 scoped cycle contract |
| Orchestrator → document sizing | Read rdd/SKILL.md; verify document sizing heuristics present as cross-cutting principle with five heuristics in priority order | ADR-024 sizing contract |
| Synthesis Skill → four-dimension framing | Read Synthesis SKILL.md; verify framing conversation navigates discovery type, narrative form, audience constraint, epistemic posture; verify structural experiments as mechanism; verify agent proposes / writer executes roles | ADR-027, ADR-028 four-dimension framing + structural experiments contract |
| Synthesis Skill → two-register outline | Read Synthesis SKILL.md; verify outline production produces argumentative backbone (verified by argument audit) and curatorial arrangement (selection, juxtaposition, scale shifts, shimmer, negative space, personal voice) | ADR-030 two-register outline contract |
| Synthesis Skill → re-entry | Read Synthesis SKILL.md; verify re-entry conditions documented; verify re-entry is writer's decision; verify writer must articulate research question; verify re-entry scoped narrowly; verify synthesis conversation can resume | ADR-029 re-entry contract |
| Research Skill → Citation Auditor Agent | Verify research skill dispatches citation-auditor with essay + research log paths; verify audit artifact file is produced with P1/P2/P3 structure | ADR-031, ADR-032 dispatch + artifact contract |
| Research Skill → Argument Auditor Agent | Verify research skill dispatches argument-auditor after citation audit; verify audit artifact file produced | ADR-031, ADR-032 dispatch contract |
| Research Skill → Lit Reviewer Agent | Verify research skill dispatches lit-reviewer with research question; verify research log entry file produced | ADR-032 dispatch contract |
| Research Skill → Spike Runner Agent | Verify research skill dispatches spike-runner; verify research log entry produced; verify scratch directory scoping | ADR-032 dispatch contract |
| Decide Skill → Argument Auditor Agent | Verify decide skill dispatches argument-auditor with ADR paths; verify audit artifact produced | ADR-032 cross-phase agent reuse |
| Decide Skill → Conformance Scanner Agent | Verify decide skill dispatches conformance-scanner with ADRs + codebase; verify debt table produced | ADR-032 dispatch contract |
| Synthesis Skill → Citation Auditor Agent | Verify synthesis skill dispatches citation-auditor with outline references; verify audit artifact | ADR-032 cross-phase agent reuse |
| Synthesis Skill → Argument Auditor Agent | Verify synthesis skill dispatches argument-auditor with outline; verify audit artifact | ADR-032 cross-phase agent reuse |
| Orchestrator → Orientation Writer Agent | Verify orchestrator dispatches orientation-writer at milestones; verify ORIENTATION.md updated | ADR-032 agent dispatch at milestones |
| Invariant Reminder Hook → PreToolUse | Write to `docs/`; verify hook injects invariant reminder text | ADR-033 hook fires on correct event |
| Epistemic Gate Enforcer → Stop | Agent stops during RDD phase; verify hook injects gate reminder | ADR-033 hook fires on correct event |
| Skill Activator → UserPromptSubmit | Submit "use RDD"; verify hook injects priority context; submit non-RDD prompt; verify no injection | ADR-035 hook intent matching |
| Plugin Manifest → Runtime | Install via `--plugin-dir`; verify 9 skills, 6 agents, 5 hooks discovered | ADR-034 plugin discovery |

### Invariant Enforcement Tests

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| 0: User can speak with authority about what was built, who it was built for, and why | Pipeline-wide (cumulative); Product Discovery Skill (product dimension) | Cannot be tested structurally — this is an outcome. Product discovery phase existence + epistemic gate serve the "who" and "why" dimensions |
| 1: Understanding requires generation | Each skill's gate section | Verify every gate (including Product Discovery) requires user to produce something |
| 2: Epistemic acts mandatory at every gate | Each skill's gate section + orchestrator protocol | Verify no gate consists solely of approval; verify redirect for non-generative responses |
| 3: Pragmatic automated, epistemic preserved | Each skill (AI generates, gate requires user engagement) | Verify skills still have AI generation steps AND have epistemic gate sections |
| 4: Epistemic cost lightweight | Each skill's gate section | Verify 2-3 prompts per gate |
| 5: Approval is not grounding | Orchestrator protocol | Verify protocol includes epistemic acts, not just approval |
| 6: Scaffolding must fade | Not enforced in v1 — tracked as debt | ADR-005 revisit trigger |
| 7: Epistemic acts bidirectional | Orchestrator feed-forward instruction; Product Discovery gate (user → AI direction especially strong) | Verify orchestrator instructs AI to reference prior gate responses; Product Discovery gate surfaces tacit product knowledge |

### Test Layers

- **Unit:** Read each SKILL.md individually. Verify: EPISTEMIC GATE section exists, contains 2-3 prompts, prompts use exploratory framing, redirect for non-generative approval is present, discrepancy noting instruction is present. For Product Discovery Skill: verify forward mode, backward mode, update mode, all 5 artifact sections, assumption inversion step. For Conformance Audit Skill: verify four operations present. For each agent `.md` file: verify YAML frontmatter specifies model, verify system prompt specifies file I/O, verify no conversation history access. For each hook script: verify it reads JSON stdin, verify correct event matching, verify advisory exit code 0.
- **Integration:** Verify orchestrator protocol matches what skills implement. Verify workflow mode descriptions include PRODUCT DISCOVERY. Verify feed-forward instruction exists. Verify Model/Decide/Architect skills read product discovery artifact. Verify inversion principle appears in Orchestrator, Product Discovery, Decide, Architect, Synthesis. Verify three-tier artifact hierarchy includes roadmap (Tier 2) and field guide (Tier 3). Verify architect skill generates roadmap. Verify build skill generates field guide. Verify orchestrator supports scoped cycles and document sizing heuristics. Verify skill-to-agent dispatch: each phase skill that previously invoked an external skill now dispatches the corresponding agent. Verify hook registration: all 5 hooks present in `hooks/hooks.json` with correct events and matchers. Verify plugin discovery: `--plugin-dir` loads all components.
- **Acceptance:** The behavior scenarios in `scenarios.md` (164 existing + 28 plugin architecture from ADRs 031-036 = 192 total). Verified by reading the modified files and confirming the described behavior is present in the prompt text.

## Roadmap

See [`./docs/roadmap.md`](./docs/roadmap.md) for the current roadmap — work packages, classified dependencies, transition states, and open decision points.

Prior build phases (Phase 0: Epistemic Gates, Phase 1: Product Discovery, Phase 2: Synthesis, Phase 3: Orientation Document) are completed. Prior work packages addressed ADRs 022-026 (roadmap, field guide, document sizing, conformance audit, scoped cycles) and ADRs 027-030 (synthesis enrichment). Current work packages address ADRs 031-036 (plugin architecture: agent extraction, hook implementation, plugin packaging, skill activation, research log archival).

## Design Amendment Log

| # | Date | What Changed | Trigger | Provenance | Status |
|---|------|-------------|---------|------------|--------|
| 1 | 2026-03-06 | Added Product Discovery Skill module; updated Orchestrator, Model, Decide, Architect module purposes; extended responsibility matrix with product discovery concepts; added new integration contracts; updated fitness criteria and test architecture; added build sequence Phase 1 | ADRs 006-011 (product discovery RDD cycle) | Essay 002; Invariant 0 (strengthened); ADRs 006-011 | Proposed |
| 2 | 2026-03-09 | Added Synthesis Skill module (optional terminal phase); extended responsibility matrix with 17 synthesis concepts/actions; added 3 new integration contracts (Orchestrator→Synthesis, Synthesis→Citation Audit, Synthesis→Orchestrator context loading); updated dependency graph; added 12 fitness criteria; added 4 boundary integration tests; updated test layers; added build sequence Phase 2. Unique architectural property: synthesis conversation subsumes epistemic gate (no separate EPISTEMIC GATE section). External dependency on Citation Audit skill. | ADRs 012-018 (synthesis RDD cycle) | Essay 003; Reflection 003; ADRs 012-018 | Proposed |
| 3 | 2026-03-09 | Amended "two primary readable documents" design principle to three-tier artifact hierarchy (ORIENTATION.md at Tier 1). Extended responsibility matrix with 5 orientation document concepts/actions (Orient, Validate Orientation, Orientation Document, Artifact Hierarchy, Artifact Legibility maximal). Added 1 new integration contract (Orchestrator→ORIENTATION.md). Added 7 fitness criteria. Added 3 boundary integration tests. Updated test layers and acceptance scenario count (95). Added build sequence Phase 3. Updated Orchestrator module purpose and ownership. Added ORIENTATION.md to artifact flow diagram. No new module — all orientation document responsibility owned by Orchestrator. Key architectural property: orientation document is a pragmatic artifact (Invariant 3), not an epistemic one — no gate, agent-generates, user-validates. | ADRs 019-021 (orientation document RDD cycle) | Essay 004; Product discovery update; ADRs 019-021 | Proposed |
| 4 | 2026-03-10 | Added `/argument-audit` invocation to synthesis outline finalization (after citation audit). Extended Synthesis Skill module ownership and dependencies. Added new integration contract (Synthesis Skill→Argument Audit Skill). Added 1 fitness criterion and 1 boundary integration test. Updated architectural driver, build sequence, and orchestrator cross-phase integration rules. Same external invocation pattern as `/rdd-decide` using `/argument-audit` on ADRs, applied to narrative genre. | User request (logical integrity of synthesis outline) | ADR-013 (extended); ADR-014 (quality gate) | Accepted |
| 5 | 2026-03-12 | Added `/citation-audit` and `/argument-audit` invocations to Research Skill (after essay writing, before epistemic gate). Extended Research Skill module purpose, ownership, and dependencies. Added 2 new integration contracts (Research Skill→Citation Audit, Research Skill→Argument Audit). Added 2 boundary integration tests. Updated dependency graph. The essay that enters downstream phases is now audited — catching citation and argument problems at the source rather than discovering them in DECIDE or BUILD. | User request (audit quality at pipeline source) | ADR-002 (research skill); ADR-003 (gate protocol) | Accepted |
| 6 | 2026-03-12 | Added: Conformance Audit Skill module, roadmap generation to Architect Skill, field guide generation to Build Skill. Updated: Orchestrator (scoped cycles, document sizing heuristics, artifact hierarchy with roadmap Tier 2 and field guide Tier 3, deep work tool framing). Added: 7 architectural drivers, 17 responsibility matrix rows (2 new sections), 3 integration contracts, 12 fitness criteria, 5 boundary integration tests. Replaced: Build Sequence with link to roadmap. | ADRs 022-026 (essay 005 cycle) | ADR-022 (roadmap), ADR-023 (field guide), ADR-024 (document sizing), ADR-025 (conformance audit + graduation), ADR-026 (scoped cycles + deep work tool) | Approved |
| 7 | 2026-03-12 | Updated Synthesis Skill module (purpose, provenance, ownership) to incorporate four-dimension framing, structural experiments, two-register outline, and re-entry logic. Updated 2 architectural drivers (synthesis terminal → usually terminal; four-dimension framing + structural experiments). Added 9-row responsibility matrix section (Synthesis Enrichment Concepts from Essay 006 / ADRs 027-030). Updated Frame Narrative action row. Updated dependency graph (synthesis conditional re-entry to Research). Added 1 integration contract (Synthesis Skill → Research Skill re-entry). Added 7 fitness criteria. Added 3 boundary integration tests. Updated acceptance scenario count (133 → 164). | ADRs 027-030 (essay 006 cycle) | ADR-027 (four-dimension framing), ADR-028 (structural experiments), ADR-029 (synthesis re-entry), ADR-030 (two-register outline) | Accepted |
| 8 | 2026-03-19 | Four-layer plugin architecture. Added 12 new modules: 6 specialist subagent modules (citation-auditor, argument-auditor, lit-reviewer, conformance-scanner, orientation-writer, spike-runner), 5 cross-cutting hook modules (invariant-reminder, epistemic-gate-enforcer, skill-activator, orientation-trigger, sizing-check), 1 plugin manifest. Updated 5 existing modules: Orchestrator (agent dispatch protocol, plugin packaging), Research Skill (dispatches agents instead of invoking external skills; log archival at cycle end), Decide Skill (dispatches argument-auditor and conformance-scanner), Synthesis Skill (dispatches auditor agents), Conform Skill (dispatches conformance-scanner). Added 10 architectural drivers. Added 9-row responsibility matrix section (Plugin Architecture Concepts). Replaced dependency graph with four-layer structure (skills → agents → hooks). Replaced 4 external skill integration contracts with 3 new contracts (skill→agent dispatch, hook→agent context injection, plugin→runtime discovery). Added 9 fitness criteria. Added 14 boundary integration tests. Updated test layers and acceptance scenario count (164 → 192). | ADRs 031-036 (essay 007 plugin architecture cycle) | ADR-031 (artifact-mediated communication), ADR-032 (specialist subagent extraction), ADR-033 (cross-cutting hooks), ADR-034 (plugin packaging), ADR-035 (skill activator), ADR-036 (research log archival) | Proposed |
