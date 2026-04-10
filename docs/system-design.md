# System Design: Pedagogical RDD

**Version:** 12.0
**Status:** Current
**Last amended:** 2026-04-09

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
| Mechanism execution must be structurally anchored: unconditional structural mechanisms must anchor to Skill-Structure, Harness, or User-Tooling Layer; mechanisms that cannot be anchored may not be specified as unconditional | Invariant | Invariant 8 (Cycle 10); ADR-067 |
| Per-Phase Manifest (YAML) as canonical Harness Layer specification format — declares required Tier 1 mechanisms per phase with canonical paths, size floors, required headers, required fields, and audited_documents | Design Principle | ADR-063; Essay 014 §6; Spike S2 |
| Compound check (PostToolUse dispatch log + Stop manifest cross-reference) is the only structural defense against sophisticated State C fabrication — and only in enforcement mode | Quality Attribute | ADR-064; Essay 014 §6; Spike S1 |
| Skill-Structure Layer is primary for step-anchorable mechanisms (cheaper than hooks, available immediately via skill text edit); hooks are defense-in-depth on top | Design Principle | ADR-065; Essay 014 §5 |
| Canonical dispatch prompt skeleton with literal `Output path:` line is the skill-hook contract; PostToolUse hook extracts the path via regex | Constraint | ADR-065; Spike S1 |
| Every Tier 1 dispatch site must be at a structurally privileged position (top third or bottom third of skill file), not in the "lost in the middle" zone | Constraint | ADR-065; Spike S4; Liu et al. 2023; Guo & Vosoughi 2025 |
| User-Tooling Layer graduates conversational mechanisms by requiring canonical-path artifacts — first migration: AID gate reflection note | Design Principle | ADR-066; Essay 014 §7 |
| Compound defense at phase boundaries is the set of mechanisms that fire at the phase-boundary interstitial moment where course correction is structurally possible; currently three components (manifest check, susceptibility snapshot, belief-mapping) that happen to cover non-overlapping failure modes (structural floor, content ceiling, pre-artifact zone) — coverage zones are descriptive of the current constellation, not a membership test for future additions; extensibility is empirical (grew from two components to three during Cycle 10's own development), not speculative | Design Principle | ADR-066; MODEL gate 2026-04-08; ARCHITECT gate 2026-04-09 (interstitial-moment framing) |
| Reframe-derailed gate limitation is load-bearing: User-Tooling Layer manifest check provides floor enforcement, not ceiling verification | Constraint | ADR-066; MODEL pre-mortem 2026-04-08 |
| Three-Tier Enforcement Classification is the methodology-level taxonomy for unconditional structural mechanisms; four-step decision procedure routes proposals to substrate | Design Principle | ADR-067; Invariant 8 |
| Substrates are not a priority hierarchy — each substrate is primary in its domain; mechanisms may legitimately use more than one substrate simultaneously | Design Principle | ADR-067; MODEL settled premise 4 |
| Grounding Reframe fires on two triggers: unassessable sycophancy risk (ADR-059) AND significant susceptibility snapshot finding with in-cycle course-correction implications (three significance properties: specificity, actionability, in-cycle applicability) | Quality Attribute | ADR-068; DISCOVER Commitment 5 |
| Snapshot findings drive in-cycle course correction at their own boundary, not feed-forward to subsequent phases (when findings meet significance properties) | Design Principle | ADR-068; DISCOVER settled premise 4 |
| Methodology scope-of-claim: competence without independent second-order critique — agent does not independently generate second-order critique; guarantee rests on Tier 1 mechanisms firing, not on agent's independent judgment | Design Principle | ADR-069; Essay 014; cross-phase observation |
| Centered-vs-infrastructure framing distinguishes what the methodology centers for user reading (essays, ADRs, domain model, product discovery, system design, roadmap, field guide, ORIENTATION) from what underpins framework operation (dispatch log, audit reports, cycle-status, gate reflection notes) | Design Principle | ADR-064; DECIDE gate 2026-04-08/09 |
| Housekeeping directory (`docs/housekeeping/`) groups infrastructure artifacts; corpus-visible, not a hidden dotfile sidecar | Design Principle | ADR-064; ADR-070 |
| Advisory mode vs. enforcement mode distinguished by `docs/housekeeping/.migration-version` marker; advisory mode respects user choice to defer migration | Quality Attribute | ADR-064; ADR-070 |
| Fails-Safe-to-Allow on hook internal errors, with stderr GitHub issue surfacing that respects user-as-non-maintainer position (non-blocking, ignorable, actionable) | Quality Attribute | ADR-064; research-phase Commitment 1 |
| Revision-aware re-audit reminder (non-blocking mtime comparison; substantiality judgment is human, not mechanical) | Quality Attribute | ADR-064; Invariant 4 Amendment |
| Provenance via architectural drivers is the primary attribution mechanism; provenance check subsections are used selectively when ADRs carry non-driver content | Design Principle | ADR-069; FC-C refinement at DECIDE gate 2026-04-09 |
| Plugin updates degrade gracefully for pre-migration corpora — `/rdd-conform migrate` is opt-in, not required; cycles complete normally in advisory mode without harness-layer verification | UX Commitment | ADR-064; ADR-070; DECIDE gate 2026-04-08 |
| `/rdd-conform` scope extended with three new audits: housekeeping directory organization, gate reflection note template alignment, dispatch prompt format | Functional Requirement | ADR-070; ADR-064; ADR-066; ADR-065 |
| Layered Enforcement Adoption (renamed from "methodology graduation (small-d)") is the move: replace prose-only specifications with structurally anchored mechanisms where the substrate fits | Design Principle | Essay 014; MODEL domain model Amendment #17 |

## Module Decomposition

### Module: Orchestrator (`skills/rdd/SKILL.md`) — AMENDED in v12.0
**Purpose:** Defines the pipeline sequence, adaptive gate protocol (Attend-Interpret-Decide cycle), three-tier artifact hierarchy, cross-cutting principles including Invariant 8's anchoring requirement and Three-Tier Enforcement Classification, methodology scope-of-claim, scoped cycle workflow pattern, and ensures no phase transition consists solely of approval.
**Provenance:** ADR-001 (gate pattern); ADR-002 (orchestrator defines protocol); ADR-004 (feed-forward instruction); ADR-006 (pipeline includes PRODUCT DISCOVERY); ADR-010 (inversion principle cross-cutting); ADR-019 (three-tier artifact hierarchy); ADR-022 (roadmap at Tier 2); ADR-023 (field guide at Tier 3); ADR-024 (document sizing heuristics); ADR-026 (scoped cycles, deep work tool framing); ADR-031 (artifact-mediated communication as cross-cutting principle); ADR-032 (agent dispatch protocol); ADR-034 (plugin packaging); ADR-037 (interaction specs in artifact summary); ADR-038 (PLAY in pipeline and state tracking); ADR-040 (AID cycle replaces fixed-template gates); ADR-041 (reflection time naming); ADR-067 (Three-Tier Enforcement Classification, decision procedure); ADR-068 (Grounding Reframe Extension); ADR-069 (Methodology Scope-of-Claim); ADR-066 (gate reflection note production at phase boundaries); Invariant 0, 2, 4 (amended), 8
**Owns:** Adaptive gate protocol definition (Attend-Interpret-Decide cycle with five pedagogical moves: challenge, probe, teach, clarify, re-anchor; includes cross-gate engagement pattern awareness — the Attend step reads the full cycle's conversation history, not just the current phase, enabling earned fatigue detection as a cross-cutting concern; **extended (Cycle 9):** AID Attend phase also reads sycophancy susceptibility signals — assertion density, narrowing, framing adoption, embedded conclusions at artifact-production moments — and records them for isolated Susceptibility Snapshot evaluation at phase boundaries; AID deploys six research-grounded question forms as toolkit: belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, open-question reframing — composed with phase content, not recited as templates; assertion-aware observation detects embedded conclusions semantically and deploys open-question reframing; **extended (Cycle 10):** AID cycle graduates to artifact-producing form via gate reflection note at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md` per ADR-066 — the note captures the composed belief-mapping question, the user's response, the selected pedagogical move, and commitment gating outputs, without narrating the engagement interpretation that drove move selection, respecting AID Interpret privacy across media), pipeline sequence (including PRODUCT DISCOVERY and optional PLAY phases), state tracking, feed-forward instruction, cross-cutting principles (inversion principle operationalized through belief-mapping questions per ADR-055 including gate-level reframing, two-tier sycophancy resistance principle per ADR-058, Grounding Reframe pattern per ADR-059 extended per ADR-068 to fire on significant snapshot findings with in-cycle course-correction implications — three significance properties: specificity, actionability, in-cycle applicability, document sizing heuristics, artifact-mediated communication, anti-sycophancy at gates, essay-as-checkpoint for RESEARCH phase, **Invariant 8 anchoring requirement and the Three-Tier Enforcement Classification per ADR-067 with its four-step decision procedure for classifying new mechanism proposals, centered-vs-infrastructure framing per ADR-064, methodology scope-of-claim per ADR-069 naming what the methodology guarantees and does not guarantee, including (i) the "competence without independent second-order critique" pattern — the agent does not independently generate second-order critique of its own output; guarantee rests on Tier 1 mechanisms firing — and (ii) the enforcement-mode qualification on the compound check's structural guarantee — the compound check's structural impossibility of sophisticated State C applies only in enforcement mode (post-migration corpora with `docs/housekeeping/.migration-version` present); users on pre-migration corpora operate with WP-B's skill-structure fix (which resolves Cycle 10's primary diagnostic) but without the Harness Layer's compound verification; this is an opt-in enhancement, not an unconditional methodology property. The orchestrator documents both negative-scope items visibly so users reading the orchestrator see the full honest picture without needing to cross-reference individual ADRs**), Available Skills table (including `/rdd-about`), Artifacts Summary (including interaction specs, field notes, and gate reflection notes), three-tier artifact hierarchy principle (with roadmap at Tier 2 and field guide at Tier 3), orientation document regeneration instruction (dispatches orientation-writer agent), scoped cycle workflow pattern, deep work tool and pace regulator framing, agent dispatch protocol (eight specialist subagents; dispatch prompts use canonical skeleton per ADR-065 with literal `Output path:` line for harness-layer extraction), cross-phase integration rules for play feedback (field notes → DISCOVER, DECIDE, RESEARCH, interaction specs, SYNTHESIS)
**Depends on:** None (top-level coordinator)
**Depended on by:** All phase skills (they follow its protocol; each phase skill owns its per-phase susceptibility snapshot dispatch at phase-end per ADR-065 Fix 1); all hooks (they supplement its cross-cutting principles and verify its Tier 1 commitments)
**Note:** In the plugin architecture, the orchestrator's cross-cutting principles are additionally enforced by hooks — the hooks supplement skill-level instructions with passive event-driven reminders and (Cycle 10) active structural verification via the compound check (ADR-064) in enforcement mode. The orchestrator dispatches the orientation-writer agent at milestones rather than generating ORIENTATION.md inline. **Cycle 10 amendment:** The orchestrator no longer inlines the susceptibility-snapshot-evaluator dispatch in its Stage Gates protocol. The dispatch is anchored at each phase skill's phase-end position (ADR-065 Fix 1, Skill-Structure Layer substrate). The orchestrator's Stage Gates text still describes the AID protocol but defers dispatch responsibility to the phase skill. This eliminates the mid-file position-effect risk and aligns the dispatch with Invariant 8's step-anchoring requirement.

### Module: Research Skill (`skills/research/SKILL.md`) — AMENDED in v12.0
**Purpose:** Runs an iterative research loop and produces a citation-audited, argument-audited, and framing-audited essay, with the essay as checkpoint — every substantial change circles back to essay revision before the pipeline advances.
**Provenance:** ADR-002 (skill owns gate); ADR-003 (research gate assignments); ADR-032 (agent dispatch for audits and research helpers); ADR-036 (research log archival at cycle end); ADR-060 (Research Methods Subagent before each loop); ADR-061 (framing audit as argument auditor extension); ADR-065 (canonical prompt skeleton + position audit + per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note at phase-end); Essay 001 §6; Essay 013 §6 (sycophancy gradient — RESEARCH is the most vulnerable phase); Essay 014 §5 (skill-structure layer as primary substrate)
**Owns:** Research-phase process, epistemic gate prompts, essay presentation step, research log archival at cycle end (ADR-036), **essay-as-checkpoint enforcement** (essay revised before pipeline advances when framing audit, discovery feedback, or reflection surfaces substantial reframing), **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1 — Skill-Structure Layer substrate — dispatch instruction placed at bottom-third position in skill file with canonical prompt skeleton naming `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-research.md` as the output path, and phase-specific brief content), **gate reflection note production** at phase-end per ADR-066 (writes gate reflection note at canonical path before the phase is declared complete)
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (dispatched during essay finalization via canonical prompt skeleton with `Output path:` line); Argument Auditor Agent (dispatched after citation audit — now includes framing audit section per ADR-061; canonical prompt skeleton); Lit Reviewer Agent (dispatched as user-selected research method); Spike Runner Agent (dispatched as user-selected research method); **Research Methods Subagent** (dispatched before first loop and before each loop after substantial revision per ADR-060; canonical prompt skeleton); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end per ADR-065 Fix 1; canonical prompt skeleton)
**Depended on by:** None directly (produces essay artifact consumed by Product Discovery Skill and Model Skill via file)
**Note:** The Research Methods Subagent fires before each research loop following substantial revision, not just the first. The essay is the checkpoint: understanding crystallizes here and becomes auditable. The framing audit (ADR-061) makes the negative space of content selection visible — what alternative framings the evidence supported but the essay didn't choose. The research phase's structural advantage is its iterability: the loop runs multiple times before the pipeline advances. **Cycle 10 amendment:** All existing Tier 1 dispatches audited against the canonical prompt skeleton from ADR-065 (Fix 2 — verify each dispatch contains the literal `Output path:` line); dispatch site positions audited against Spike S4's lost-in-the-middle finding (Fix 3 — relocate any middle-third dispatch to top or bottom third). The new per-phase susceptibility snapshot dispatch sits at the phase-end position (bottom-third, structurally privileged), replacing the orchestrator-centralized mid-file dispatch that produced the 0% historical coverage documented in Spike S3.

### Module: Product Discovery Skill (`skills/discover/SKILL.md`) — AMENDED in v12.0
**Purpose:** Surfaces user needs, stakeholder maps, value tensions, and assumption inversions, producing a product discovery artifact in user language that feeds forward into MODEL, DECIDE, ARCHITECT, and PLAY.
**Provenance:** ADR-006 (phase placement); ADR-007 (artifact structure); ADR-008 (forward/backward/update modes); ADR-010 (inversion principle procedural home); ADR-011 (epistemic gate); ADR-038 (play feedback re-enters discover in update mode); ADR-065 (per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); Invariant 0 (product dimension of authority), Invariant 8
**Owns:** Product discovery process (forward, backward, and update modes — update mode reads prior field notes from play as input alongside new research), five-section artifact template, assumption inversion procedural step, product debt table (backward mode), epistemic gate prompts, **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-discover.md`), **gate reflection note production** at phase-end (ADR-066)
**Depends on:** Orchestrator (protocol); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end)
**Depended on by:** None directly (produces product discovery artifact consumed by Model Skill, Decide Skill, Architect Skill, and Play Skill via file)
**Cycle 10 note:** Per-phase susceptibility snapshot dispatch at bottom-third position; canonical prompt skeleton per ADR-065. Existing Tier 1 dispatch sites (none in this skill) audited per Fix 2/3.

### Module: Model Skill (`skills/model/SKILL.md`) — AMENDED in v12.0
**Purpose:** Extracts domain vocabulary from essay and product discovery artifact, with Product Origin provenance column and an epistemic gate tailored to domain model artifacts.
**Provenance:** ADR-002; ADR-003 (model gate assignments); ADR-009 (product vocabulary provenance); ADR-065 (per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); Essay 001 §6; Invariant 8
**Owns:** Model-phase process, Product Origin column, epistemic gate prompts, domain model presentation step, **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-model.md`), **gate reflection note production** at phase-end (ADR-066)
**Depends on:** Orchestrator (protocol); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end)
**Depended on by:** None directly (produces domain model artifact consumed by Decide Skill via file)
**Cycle 10 note:** Per-phase susceptibility snapshot dispatch at bottom-third position per ADR-065 Fix 1. Model phase handles invariant amendments including backward propagation sweeps, which interact with the compound check when audit reports are affected.

### Module: Decide Skill (`skills/decide/SKILL.md`) — AMENDED in v12.0
**Purpose:** Produces ADRs, behavior scenarios, and interaction specifications with product context alongside technical context, including inversion principle check on ADR assumptions, with an epistemic gate tailored to ADR artifacts.
**Provenance:** ADR-002; ADR-003 (decide gate assignments); ADR-010 (inversion principle at DECIDE); ADR-032 (agent dispatch for argument audit and conformance scan); ADR-037 (interaction specification layer); ADR-065 (canonical prompt skeleton for argument-auditor dispatch; per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); ADR-067 (Three-Tier Classification — DECIDE applies decision procedure when ADRs propose new Tier 1 mechanisms); Essay 001 §6; Essay 002 §7.2; Essay 008 §2; Invariant 8
**Owns:** Decide-phase process, inversion principle check (at DECIDE), epistemic gate prompts, ADR/scenario presentation step, interaction specification production (stakeholder-organized task decompositions with super-objectives, tasks, and interaction mechanics — written after scenarios, derived from Product Discovery's stakeholder models), **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-decide.md`), **gate reflection note production** at phase-end (ADR-066), **Three-Tier Classification application** — when an ADR proposes a new unconditional structural mechanism, the DECIDE phase runs ADR-067's four-step decision procedure to assign the mechanism to a substrate (Skill-Structure, Harness, User-Tooling, or step 4 non-Tier-1)
**Depends on:** Orchestrator (protocol); Argument Auditor Agent (dispatched after ADRs written — canonical prompt skeleton per ADR-065; includes framing audit per ADR-061); Conformance Scanner Agent (dispatched at Step 3.5); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end)
**Depended on by:** None directly (produces ADR + scenario + interaction spec artifacts consumed by Architect Skill and Play Skill via file)
**Cycle 10 note:** Existing argument-auditor dispatch audited against canonical prompt skeleton (Fix 2). Dispatch site position audited against lost-in-the-middle zone (Fix 3). New per-phase susceptibility snapshot dispatch at bottom-third. ADRs produced in DECIDE must include provenance check subsections when they carry non-driver content (agent synthesis at drafting time, DECIDE-gate contributions, cross-ADR compositions) per ADR-069's selective-use policy.

### Module: Architect Skill (`skills/architect/SKILL.md`) — AMENDED in v12.0
**Purpose:** Decomposes the system into modules with provenance chains extending to user needs, including inversion principle check on module boundaries, with an epistemic gate tailored to system design artifacts; generates roadmap as separate artifact.
**Provenance:** ADR-002; ADR-003 (architect gate assignments); ADR-010 (inversion principle at ARCHITECT); ADR-022 (roadmap generation); ADR-065 (per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); Essay 001 §6; Essay 002 §7.3; Essay 005 §1; Invariant 8
**Owns:** Architect-phase process, inversion principle check (at ARCHITECT), extended provenance chains, epistemic gate prompts, system design presentation step, roadmap generation (work packages, dependency classification, transition states), **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-architect.md`), **gate reflection note production** at phase-end (ADR-066)
**Depends on:** Orchestrator (protocol); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end)
**Depended on by:** None directly (produces system design and roadmap artifacts consumed by Build Skill via file)
**Cycle 10 note:** Per-phase susceptibility snapshot dispatch at bottom-third. Architect phase is responsible for composing modules that satisfy Invariant 8's anchoring requirement — any new unconditional structural mechanism added during architecture must name its substrate per ADR-067's classification.

### Module: Build Skill (`skills/build/SKILL.md`) — AMENDED in v10.0, v12.0
**Purpose:** Outer loop of the composable skill family: work decomposition, TDD (red → green → refactor), stewardship checkpoints, integration verification, with seamless mode shifts to debug/refactor/review; operates in pipeline mode or context-reconstructive mode.
**Provenance:** ADR-002; ADR-048 (composable skill family); ADR-049 (Context Gathering protocol); ADR-050 (session artifacts); ADR-051 (work decomposition); ADR-053 (time budget); ADR-054 (mode-shift composition); ADR-023 (field guide generation); Essay 011 §§5-6
**Owns:** Context Gathering protocol (build adaptation — step 4 emphasizes work decomposition and testable behaviors), mode detection (pipeline vs context-reconstructive), time budget prompt and scope adaptation, work decomposition from available sources (derives work packages with dependency classification), session artifact writing (work decomposition and orientation summary to `session/` directory), TDD outer loop (red → green → refactor per work package), stewardship checkpoints (at scenario group boundaries — checks code against orientation/work package), integration verification (real types, not stubs), mode-shift triggers (unexpected failure → debug mode; smell after green → refactor mode; stewardship → review mode; all seamless with context continuity), field guide generation (module-to-implementation mapping when implementation exists), epistemic gate prompts at scenario group boundaries
**Depends on:** Orchestrator (protocol); Debug Skill (mode-shift target — context inheritance, not dispatch); Refactor Skill (mode-shift target); Review Skill (mode-shift target)
**Depended on by:** None
**Note:** Mode-shift composition means the build skill shares its orientation context with inner skills seamlessly — no re-orientation, no perceivable boundary. The developer stays in the thread of understanding. Skill boundaries are implementation details that disappear during the build flow. ADR-054 supersedes ADR-046's callout model for build→review. **Cycle 10 amendment:** Build skill gains per-phase susceptibility snapshot dispatch at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-build.md`) and gate reflection note production (ADR-066). In context-reconstructive mode where the build is the entry point, the dispatch anchors at the post-verification phase-end position. Stewardship checkpoints are NOT phase boundaries and do not dispatch the snapshot — the phase-end dispatch fires once per build cycle.

### Module: Debug Skill (`skills/debug/SKILL.md`) — NEW in v10.0
**Purpose:** Guides hypothesis-trace-understand-fix debugging cycle, naming what the mental model was wrong about before fixing, with a test encoding the corrected understanding.
**Provenance:** ADR-048 (composable skill family); ADR-049 (Context Gathering protocol); ADR-053 (time budget); Essay 011 §§3, 6 (debugging as first-class epistemic activity; Anthropic 17% comprehension gap on debugging questions)
**Owns:** Context Gathering protocol (debug adaptation — step 4 emphasizes expected-vs-actual divergence), hypothesis-trace-understand-fix cycle (orient → hypothesize the mental model divergence → trace data flow to divergence point → name the misunderstanding → TDD the fix), time budget adaptation
**Depends on:** Orchestrator (available skill listing)
**Depended on by:** Build Skill (mode-shift target for unexpected failures)
**Note:** Standalone invocation runs its own Context Gathering. When entered via mode shift from build, inherits the build session's orientation and current work package — no re-orientation. The debug skill's distinctive epistemic contribution: it names what the mental model was wrong about, not just what the fix is. This is what makes debugging a learning activity rather than a patching activity.

### Module: Refactor Skill (`skills/refactor/SKILL.md`) — NEW in v10.0
**Purpose:** Drives the Three-Level Refactor diagnostic-remediation cycle (smells → patterns → methodology) with embedded AI Smell Taxonomy awareness and AI hygiene prompts, producing structure-only changes committed as `refactor:`.
**Provenance:** ADR-048 (composable skill family); ADR-049 (Context Gathering protocol); ADR-052 (AI smell detection embedded); ADR-053 (time budget); Essay 011 §§4-5 (AI smell taxonomy; reclaimed refactor step)
**Owns:** Context Gathering protocol (refactor adaptation — step 4 emphasizes structural health and architectural intent), Three-Level Refactor cycle: level 1 Smells (classical catalog from Fowler + AI-exacerbated catalog: Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Deja-Vu, Oracle Mirroring, Logic Drift), level 2 Patterns (technique selection with inverse-pair awareness), level 3 Methodology (check against architectural intent — module boundaries, dependency rules, domain vocabulary consistency), AI hygiene prompts (separate from smell detection — Constraint Decay: check earlier constraints still hold; Slopsquatting: verify unfamiliar packages; Intent Debt: check rationale exists for generated code), time budget adaptation, audit finding consumption (when codebase-audit output available as optional input)
**Depends on:** Orchestrator (available skill listing)
**Depended on by:** Build Skill (mode-shift target after green phase and at stewardship)
**Note:** Standalone invocation runs its own Context Gathering. When entered via mode shift from build, inherits the build session's orientation. AI hygiene prompts are awareness reminders, not code-inspection smell detection — novel AI patterns have no code-level signature (Essay 011 §4). The refactor skill is the remediation arm the codebase-audit skill lacks.

### Module: Play Skill (`skills/play/SKILL.md`) — NEW in v7.0
**Purpose:** Facilitates post-build experiential discovery through stakeholder inhabitation, with the orchestrating agent serving as gamemaster, producing field notes categorized by feedback destination.
**Provenance:** ADR-038 (phase placement and three-movement structure); ADR-039 (gamemaster role and Invariant 3 boundary); ADR-016 principle (play itself is the epistemic act — no separate gate); ADR-010 (inversion principle extended to play via gamemaster); Invariant 0 (product dimension of authority — inhabiting stakeholders builds authority to speak about stakeholder experience); Essay 008
**Owns:** Play-phase process (three movements: inhabit → explore → reflect), gamemaster behavior (proposes stakeholder roles and points of concentration, introduces complications and inversions, reacts to player discoveries, creates conditions for encounter without directing outcomes), Stanislavski inhabitation structure (reads super-objectives from discover, objectives from interaction specs; obstacles discovered through play), field notes production and categorization (six categories: missing scenario → DECIDE, usability friction → DISCOVER, new question → RESEARCH, challenged assumption → DISCOVER, delight → SYNTHESIS, interaction gap → interaction specs), cross-cutting reflection, felt-understanding bounding, epistemic distance mitigation (play frame + stakeholder profiles + gamemaster complications)
**Depends on:** Orchestrator (protocol)
**Depended on by:** None directly (produces field notes artifact consumed by Discover Skill, Synthesis Skill, and subsequent pipeline cycles via file)
**Note:** The Gamemaster is a mode of the Orchestrating Agent within this skill, not a separate Specialist Subagent — it requires conversation context and user interaction (ADR-039). Play subsumes its epistemic gate (ADR-016 pattern, like Synthesis) — no separate EPISTEMIC GATE section. **Cycle 10 amendment:** Despite subsuming its gate, Play phase still produces a per-phase susceptibility snapshot at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-play.md`) and a gate reflection note capturing the three-movement reflection (ADR-066, with the reflection-note content adapted to play's inhabit-explore-reflect structure). Invariant 8 applies to play's phase-end transition even though play does not use the AID cycle's question toolkit internally.

### Module: Synthesis Skill (`skills/synthesize/SKILL.md`) — AMENDED in v12.0
**Purpose:** Mines the artifact trail (including field notes from play when available) for novelty signals, conducts a structured conversation (journey review, novelty surfacing, framing with four-dimension navigation via structural experiments) to help the writer find their story, and produces a two-register (argumentative backbone + curatorial arrangement) outline as springboard for the synthesis essay.
**Provenance:** ADR-012 (phase placement); ADR-013 (conversation structure + outline); ADR-014 (quality gate); ADR-015 (narrative context rollup); ADR-016 (subsumes gate); ADR-017 (narrative inversions); ADR-018 (cross-project Level 1); ADR-027 (four-dimension framing); ADR-028 (structural experiments); ADR-029 (re-entry); ADR-030 (two-register outline); ADR-032 (agent dispatch for audits); ADR-065 (canonical prompt skeleton for auditor dispatches; per-phase susceptibility snapshot dispatch); ADR-066 (gate reflection note); Essay 003; Essay 006; Invariant 0 (public authority dimension); Invariant 8
**Owns:** Synthesis-phase process, artifact trail mining, novelty signal detection (five signals), three-phase conversation, four-dimension framing model (discovery type, narrative form, audience constraint, epistemic posture), structural experiment mechanism (agent proposes, writer executes externalized trials), worth-the-calories quality tests (Davis/ABT/inversion), two-register outline production (argumentative backbone verified by argument audit + curatorial arrangement with selection/juxtaposition/scale shifts/shimmer/negative space/personal voice), pre-populated references, cross-project conversational prompting (Level 1), narrative inversion lenses, re-entry decision logic (writer-initiated, scoped narrowly), **per-phase susceptibility snapshot dispatch** at phase-end (ADR-065 Fix 1; canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-synthesize.md`), **gate reflection note production** at phase-end (ADR-066)
**Depends on:** Orchestrator (protocol); Citation Auditor Agent (dispatched during outline finalization — canonical prompt skeleton); Argument Auditor Agent (dispatched during outline finalization, after citation audit — canonical prompt skeleton); **Susceptibility Snapshot Evaluator Agent** (dispatched at phase-end)
**Depended on by:** None directly (usually terminal; can re-enter Research when structural experimentation surfaces new questions — re-entry is writer's decision)
**Cycle 10 note:** Existing citation-auditor and argument-auditor dispatches audited for canonical prompt skeleton (Fix 2) and dispatch site position (Fix 3). Synthesis subsumes its conversational gate per ADR-016 but still produces a gate reflection note capturing the framing resolution and commitment-gating outputs per ADR-066.

### Module: Conformance Audit Skill (`skills/conform/SKILL.md`) — AMENDED in v12.0
**Purpose:** Scans artifact corpus against current skill version, producing gap analysis with prioritized remediation, drift detection against implementation, graduation into native project docs, and (Cycle 10) housekeeping-directory migration and three new audit scopes.
**Provenance:** ADR-025 (four operations: audit, remediation, drift detection, graduation); ADR-026 (graduation as scoped cycle endpoint); ADR-032 (agent dispatch for conformance scanning); ADR-070 (`/rdd-conform migrate` subcommand + three new audit scopes); Essay 005 §5; Essay 014 (centered-vs-infrastructure framing)
**Owns:** Audit template conformance process, remediation (structural and format gaps), graduation process (knowledge migration plan, archival), conformance report production, **`/rdd-conform migrate` subcommand** (one-shot migration operation triggered by the user — idempotency check via `docs/housekeeping/.migration-version` marker; uncommitted-changes refusal via `git status` check; create `docs/housekeeping/` + `audits/` + `gates/` subdirectories; move `docs/essays/audits/*` → `docs/housekeeping/audits/*` preserving subdirectory structure; move `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`; mechanical reference substitution across `docs/decisions/*.md`, `docs/essays/*.md`, `docs/essays/research-logs/*.md`, `skills/**/SKILL.md`, `hooks/manifests/tier1-phase-manifest.yaml`, `docs/domain-model.md`, `docs/ORIENTATION.md`; write marker file with current plugin version; append `docs/housekeeping/dispatch-log.jsonl` to `.gitignore`; produce summary report; produce rollback manifest at `docs/housekeeping/.migration-rollback.json`; refuse to touch `docs/cycle-archive/`, `docs/essays/reflections/`, `docs/essays/research-logs/` content files), **three new audit scopes per ADR-070**: (1) **housekeeping directory organization audit** (verifies `docs/housekeeping/` exists with `audits/`, `gates/`, `cycle-status.md`, `.migration-version`; flags orphaned audit files at pre-migration locations), (2) **gate reflection note template alignment audit** (verifies files in `docs/housekeeping/gates/` match canonical naming `{cycle}-{phase-from}-to-{phase-to}.md`, required headers per ADR-066, required fields, size floor — does not audit content substance), (3) **dispatch prompt format audit** (verifies every Tier 1 dispatch instruction in `skills/**/SKILL.md` contains the canonical prompt skeleton from ADR-065 with `Output path:` line; verifies dispatch instruction is at structurally privileged position per Fix 3 — flags middle-third placements — does not audit brief content)
**Depends on:** Orchestrator (available skill listing); Conformance Scanner Agent (dispatched during drift detection operation); File system for migration operations
**Depended on by:** User (invoked directly via `/rdd-conform` or `/rdd-conform migrate`); Orchestrator (optionally suggests when artifacts exist and plugin version has changed); Stop hook (advisory-mode notice directs user to run migration)
**Note:** The migration is idempotent (re-running on a migrated corpus no-ops via marker file check). Rollback is git-based — the rollback manifest is forensic rather than operational. Partial migration (interrupted run) is recoverable by re-running. The cycle-in-progress edge case: migration should be run at phase boundary or between cycles, not mid-phase. Audit scopes do not auto-correct; they produce structured finding reports for the user to act on. **Cycle 10 note:** Per-phase susceptibility snapshot dispatch and gate reflection note production do NOT apply to this utility skill (not a pipeline phase). Dispatch sites audited per Fix 2/3.

### Module: About Skill (`skills/about/SKILL.md`) — NEW in v8.0
**Purpose:** Reports current plugin version, provides a brief adaptive methodology overview, and offers depth-calibrated elaboration for users unfamiliar with RDD.
**Provenance:** ADR-042 (self-explanation utility); Essay 009 §11 (design proposal — agent-as-teacher extends to meta-teaching)
**Owns:** Version detection (reads plugin manifest), methodology overview (user language — "reflection time" not "epistemic gate"), depth calibration based on in-session signals
**Depends on:** Plugin Manifest (version metadata)
**Depended on by:** Orchestrator (optionally offers `/rdd-about` when no existing RDD artifacts detected)
**Note:** Utility skill, not a pipeline phase. Does not produce artifacts. Depth calibration relies on in-session signals (stated purpose, questions asked), which are weaker than the full-cycle conversation history the AID cycle uses at phase gates. This limitation is acknowledged by design (ADR-042).

### Module: Review Skill (`skills/review/SKILL.md`) — NEW in v9.0
**Purpose:** Scaffolds the reviewer's understanding of code changes through question-driven orientation, operating in corpus-grounded or context-reconstructive mode.
**Provenance:** ADR-043 (utility skill positioning); ADR-044 (two operating modes); ADR-045 (questions as primary output); ADR-046 (build stewardship integration); ADR-047 (collaborative context-gathering); Essay 010; Invariant 0 (adapted — informed judgment, not full authority)
**Owns:** Mode detection (check for RDD artifacts, offer corpus-grounded or context-reconstructive), collaborative context-gathering protocol (prompt for breadcrumbs, fetch, synthesize, validate, re-synthesize on substantial correction), corpus-grounded orientation (read relevant artifact slice for work package), review question generation (three-tier: pure mechanical, observation→question, pure question), test quality evaluation (mutation testing lens: not "are there tests?" but "do the tests catch anything?" — surface questions about assertion effectiveness, boundary coverage, and whether tests would detect operator changes or logic inversions), time-budget adaptation (zone of proximal development — scale depth to available time), mechanical finding separation (objective issues labeled distinctly; static analysis concerns belong here — the agent is not a linter but can flag what a linter would catch), classification heuristic (mechanical if determinable without intent/context; question if contextual judgment required), reviewer autonomy safeguards (no merge verdict, no pre-written comments, no auto-approval)
**Depends on:** Orchestrator (available skill listing); Build Skill (mode-shift target at stewardship checkpoints — ADR-054 supersedes ADR-046 callout model)
**Depended on by:** None directly (invoked by user or during build; produces no durable artifact)
**Note:** Utility skill, not a pipeline phase. Does not produce artifacts — the review's value lives in the reviewer's mental model, not in a record of the questions. Has no epistemic gate section — the review conversation itself is the epistemic activity. No new agents needed. Success criterion is Invariant 0 adapted to the review context: the reviewer can discuss changes with *informed judgment* (the reviewer's bar) rather than *authority* (the builder's bar). Within the build flow, review is entered as a seamless mode shift (ADR-054) — context inheritance replaces the prior callout model (ADR-046). Standalone invocation is unchanged.

### Specialist Subagent Modules

All specialist subagents follow the artifact-mediated communication pattern (ADR-031): they receive file paths as input, run in isolated context with no conversation history, and write structured output to artifact files. Phase skills dispatch them and read the output artifacts.

### Module: Citation Auditor Agent (`agents/citation-auditor.md`)
**Purpose:** Verifies every reference and factual claim in an essay or outline against verifiable sources, producing a structured audit artifact.
**Provenance:** ADR-031 (artifact-mediated communication); ADR-032 (specialist extraction); Essay 007 §3
**Owns:** Citation verification process, audit artifact production (P1/P2/P3 issues with locations, evidence, recommendations)
**Depends on:** None (receives input via file paths in dispatch)
**Depended on by:** Research Skill (dispatches after essay), Synthesis Skill (dispatches before outline finalization)
**Model:** Sonnet

### Module: Argument Auditor Agent (`agents/argument-auditor.md`) — AMENDED in v11.0
**Purpose:** Maps inferential chains from evidence to conclusions in an essay, ADR set, or outline, producing a two-section audit artifact: argument audit (logical consistency) and framing audit (content selection visibility).
**Provenance:** ADR-031; ADR-032; ADR-061 (framing audit extension); Essay 007 §3; Essay 013 §5
**Owns:** Argument mapping process, logical gap detection, hidden assumption identification, **framing audit** (three questions: what alternative framings did the evidence support? what truths were available but not featured? what would change if the dominant framing were inverted?), audit artifact production (two sections per dispatch)
**Depends on:** None (receives input via file paths in dispatch — reads artifact AND its source material for framing audit)
**Depended on by:** Research Skill (dispatches after citation audit), Decide Skill (dispatches after ADRs), Synthesis Skill (dispatches after citation audit)
**Model:** Sonnet
**Note:** The framing audit is a Tier 1 unconditional mechanism (ADR-058) — it runs on every essay and ADR set. The framing audit makes the negative space of Content Selection visible as an inspectable artifact. Known limitation (P3-B): the framing auditor is itself subject to content selection in what it surfaces; architectural isolation reduces but does not eliminate this. The three framing audit questions provide structural constraints on what must be addressed.

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

### Module: Research Methods Reviewer Agent (`agents/research-methods-reviewer.md`) — NEW in v11.0
**Purpose:** Reviews research design before execution — evaluates question framing, source selection bias, scope mismatches, and premature hypothesis-space narrowing, applying belief-mapping to each question.
**Provenance:** ADR-060; Essay 013 §6 (sycophancy gradient — RESEARCH most vulnerable); ADR-055 (belief-mapping form)
**Owns:** Research question review (belief-mapping each question: "what would the researcher need to believe for a different question to be more productive?"), embedded conclusion detection in questions, premature narrowing flags, research design review artifact production. Cross-cycle methodological pattern detection deferred to v2.
**Depends on:** None (receives research question set via dispatch)
**Depended on by:** Research Skill (dispatched before each research loop after substantial revision, not just the first)
**Model:** Sonnet
**Note:** Tier 1 unconditional mechanism (ADR-058) — fires before every research phase regardless of context. Known limitation: belief-mapping surfaces questions adjacent to the existing framing but does not address questions requiring a fundamentally different framing (second-order framing capture — an open problem per Essay 013 §10).

### Module: Susceptibility Snapshot Evaluator Agent (`agents/susceptibility-snapshot-evaluator.md`) — NEW in v11.0, AMENDED in v12.0
**Purpose:** Evaluates sycophancy susceptibility signals in an isolated context at phase boundaries, producing a Susceptibility Snapshot artifact at a phase-keyed canonical path.
**Provenance:** ADR-057; ADR-058 (Tier 1 unconditional); ADR-065 (Skill-Structure Layer — per-phase dispatch anchoring; canonical phase-keyed output paths); ADR-063 (manifest-verified output path); Essay 013 §5 (self-correction blind spot — isolated evaluation treats conversation as external input); Essay 014 §5 (skill-structure fix as primary move for this mechanism)
**Owns:** Susceptibility signal evaluation (reads signals recorded by AID inline observation: assertion density, solution-space narrowing, framing adoption, confidence markers, declining alternative engagement), Susceptibility Snapshot artifact production (observed signals, interpretation, Grounding Reframe recommendation if warranted) **at canonical phase-keyed path** `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md` where `{phase}` is the phase boundary being crossed (research, discover, model, decide, architect, build, play, synthesize)
**Depends on:** None (receives recorded susceptibility signals via dispatch; canonical prompt skeleton from ADR-065 provides phase, output path, and brief content)
**Depended on by:** Each phase skill (dispatched at phase-end per ADR-065 Fix 1 — dispatch instruction at bottom-third position in each phase skill file, not orchestrator-centralized); Stop hook (verifies artifact existence at canonical path per ADR-063/064 manifest)
**Model:** Sonnet
**Note:** Tier 1 unconditional mechanism (ADR-058) — fires at every phase boundary. Anchored at **both Skill-Structure Layer (primary per ADR-065)** and **Harness Layer (defense-in-depth per ADR-064)** — the phase skill's dispatch instruction causes the dispatch to happen; the Stop hook's manifest check verifies the artifact was produced by an isolated subagent (via dispatch log cross-reference) rather than fabricated in-context. Outputs are acted on via Grounding Reframe (ADR-059), now extended per ADR-068 to fire on significant snapshot findings with in-cycle course-correction implications (three significance properties: specificity, actionability, in-cycle applicability). The architectural isolation exploits the Self-Correction Blind Spot: a fresh context treats the conversation's signals as external input. Known limitation (P3-C): susceptibility signal thresholds are unspecified; calibration deferred to practice. **Cycle 10 amendment:** Output path is now phase-keyed (includes `{phase}` token in addition to `{cycle}`), enabling per-boundary verification. Pre-migration path: `docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md`. Post-migration path: `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`. The skill-file edits in ADR-065 and path updates in ADR-070 ship as an atomic unit to avoid transitional mismatch.

### Cross-Cutting Hook Modules

All hooks are configured in `hooks/hooks.json` at the plugin root, with scripts in `hooks/scripts/`. They fire passively on system events and inject context or reminders. No hook blocks operations (all use exit code 0 for context injection).

### Module: Invariant Reminder Hook (`hooks/scripts/invariant-reminder`)
**Purpose:** Reminds the agent to check domain-model.md invariants before modifying any artifact in `docs/`.
**Provenance:** ADR-033; Essay 007 §3
**Event:** PreToolUse (matcher: Write|Edit on `docs/`)
**Owns:** Invariant reminder text injection
**Depends on:** Domain model artifact (references invariants section path)

### Module: Epistemic Gate Enforcer Hook (`hooks/scripts/epistemic-gate`)
**Purpose:** Reminds the agent about the epistemic gate (reflection time) if an RDD phase is completing without gate conversation. Recognizes AID cycle adaptive prompts as valid gate behavior.
**Provenance:** ADR-033; ADR-040 (AID cycle); Invariant 2 (epistemic acts mandatory at every gate); Essay 007 §3
**Event:** Stop (no matcher — fires on all Stop events; script checks if in RDD phase)
**Owns:** Gate reminder text injection (updated to recognize adaptive AID prompts, not just fixed-template prompts)

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

### Harness Layer Infrastructure — NEW in v12.0

The Harness Layer is Invariant 8's second substrate. It observes tool-call events and phase-end events structurally, producing verification that the agent cannot self-exempt from. Three new modules implement it: a declarative manifest (configuration data), a PostToolUse dispatch-verify hook, and a Stop compound-check hook. All three are introduced by Cycle 10 (ADRs 063, 064, 070) and cooperate via shared identifiers (`subagent_type`, canonical output paths).

### Module: Tier 1 Phase Manifest (`hooks/manifests/tier1-phase-manifest.yaml`) — NEW in v12.0
**Purpose:** Declarative YAML specification of required Tier 1 mechanisms per phase, consumed by the Stop hook for the compound check and by `/rdd-conform` audits. The manifest is the canonical Harness-Layer specification format.
**Provenance:** ADR-063 (manifest format, schema, `{cycle}` and `{phase}` substitution); ADR-064 (manifest extended with optional `audited_documents` field for revision-aware reminder); ADR-066 (manifest entry for `aid-cycle-gate-reflection` mechanism); Essay 014 §6; Spike S2 (reference implementation and validation against six synthetic test scenarios)
**Owns:** Phase-keyed dictionary of required mechanisms (research, discover, model, decide, architect, build, play, synthesize); per-mechanism entries with canonical name (matching `subagent_type` identifier), `path_template` (with `{cycle}` and optionally `{phase}` substitution tokens), `min_bytes` size floor, `required_headers` literal prefix list, `required_fields` literal label list, optional `audited_documents` glob patterns for revision-aware reminder; `format_version: 1` field for future schema evolution
**Schema illustration:**
```yaml
format_version: 1
phases:
  research:
    description: >
      Research phase Tier 1 obligations: ...
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-research.md
        min_bytes: 1500
        required_headers:
          - "# Susceptibility Snapshot:"
        required_fields:
          - "**Observed signals:**"
      - mechanism: argument-auditor
        path_template: docs/housekeeping/audits/argument-audit-{cycle}.md
        audited_documents:
          - "docs/essays/{cycle}-*.md"
        min_bytes: 2000
        ...
      - mechanism: aid-cycle-gate-reflection
        path_template: docs/housekeeping/gates/{cycle}-research-to-{phase-to}.md
        min_bytes: 800
        required_headers:
          - "# Gate Reflection:"
          - "## Belief-mapping question composed for this gate"
          - "## User's response"
          - "## Pedagogical move selected"
          - "## Commitment gating outputs"
```
**Depends on:** None (declarative data)
**Depended on by:** Tier 1 Phase Manifest Check Hook (reads at Stop events); Conformance Audit Skill (reads during dispatch prompt format audit and housekeeping organization audit); `/rdd-conform migrate` (updates `path_template` values during migration from pre-migration to housekeeping paths)
**Note:** The manifest colocates all Tier 1 mechanism obligations in one reviewable, diffable, format-versioned file. Size floors and required-headers/fields are calibration parameters derived from real Cycle 10 audit outputs (Spike S2); they require retuning as subagent output patterns change. The manifest is extensible per ADR-063: adding a new Tier 1 mechanism is a single new entry under the relevant phase(s); adding a new phase is a new top-level key.

### Module: Tier 1 Verify Dispatch Hook (`hooks/scripts/tier1-verify-dispatch.sh`) — NEW in v12.0
**Purpose:** Logs every Tier 1 subagent dispatch to a session-scoped append-only dispatch log, enabling the Stop hook's compound cross-reference to distinguish genuine dispatches from fabricated artifacts.
**Provenance:** ADR-064 (compound check — PostToolUse dispatch log half); ADR-033 (extends the cross-cutting hook architecture from 5 to 7 hooks); ADR-065 (depends on canonical prompt skeleton for output path extraction); Spike S1 (feasibility — `PostToolUse` on `Agent` fires with full access to `tool_input.subagent_type` and `tool_input.prompt`)
**Event:** PostToolUse (matcher: `Agent`)
**Owns:** Tier 1 mechanism set membership check (research-methods-reviewer, citation-auditor, argument-auditor, susceptibility-snapshot-evaluator); `subagent_type` extraction from hook input JSON; canonical `Output path:` line extraction from `tool_input.prompt` via regex matching `^Output path: (.+)$`; append-only JSONL dispatch log entry at `docs/housekeeping/dispatch-log.jsonl` with schema `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`; silent exit for non-Tier-1 dispatches; `expected_path: null` logging when skill file omits the `Output path:` line (degraded mode, pre-ADR-065 compatibility); session-scoped log truncation at first PostToolUse dispatch of a new session detected via `session_id` change
**Depends on:** `docs/housekeeping/` directory (writes to `dispatch-log.jsonl`); skill files' canonical prompt skeleton (reads `Output path:` line from `tool_input.prompt`)
**Depended on by:** Tier 1 Phase Manifest Check Hook (reads the dispatch log at Stop events for compound cross-reference)
**Note:** Always exits `allow` — never blocks the tool call, because verification is append-only and the dispatch has already run. Fails-Safe-to-Allow on internal error with stderr GitHub issue surfacing (same pattern as Stop hook). Dispatch log is gitignored (session-scoped state, not durable across cycles). When the skill file omits the canonical `Output path:` line, the hook logs `expected_path: null`; the Stop hook's compound cross-reference degrades to "dispatch happened, path unknown" — still better than no log. In advisory mode (pre-migration corpus without `docs/housekeeping/`), the hook still runs but the dispatch log may not persist if the directory does not exist; this is acceptable because the Stop hook's compound check is disabled in advisory mode anyway.

### Module: Tier 1 Phase Manifest Check Hook (`hooks/scripts/tier1-phase-manifest-check.sh`) — NEW in v12.0
**Purpose:** At phase-end, verifies that every Tier 1 mechanism required for the current phase has produced its canonical artifact AND that the artifact corresponds to a logged subagent dispatch (compound check). Emits `block` on failure to prevent phase completion without Tier 1 verification. In advisory mode, degrades to non-blocking stderr notice.
**Provenance:** ADR-064 (compound check — Stop hook manifest check half; advisory mode; Fails-Safe-to-Allow with GitHub issue surfacing; revision-aware reminder); ADR-063 (consumes manifest); ADR-065 (depends on canonical prompt skeleton for dispatch log lookup); ADR-066 (verifies gate reflection note as Tier 1 mechanism); ADR-070 (migration-version marker check distinguishes advisory vs. enforcement mode); Spike S2 (reference implementation)
**Event:** Stop (no matcher — fires on every Stop event; script performs phase detection and no-op if not in an RDD phase)
**Owns:** Phase detection (reads `**Phase:**` field from `docs/housekeeping/cycle-status.md` post-migration, or `docs/cycle-status.md` pre-migration; fails safe to allow if unparseable); cycle detection (reads `**Cycle number:** NNN` field from cycle-status as canonical mechanism per ADR-063; falls back to highest `NNN-` prefix in `docs/essays/` if field absent; fails safe to allow if neither available); manifest loading from `hooks/manifests/tier1-phase-manifest.yaml` (fails safe to allow with GitHub issue surfacing if missing or unparseable); enforcement mode detection via `docs/housekeeping/.migration-version` marker file (enforcement if present, advisory if absent); per-mechanism structural assertions (file existence, size floor, required headers, required fields); compound cross-reference against `docs/housekeeping/dispatch-log.jsonl` matching mechanism and resolved expected_path; four-failure-mode distinguishing block reasons (never-dispatched, failed-to-write, fabricated, malformed); revision-aware re-audit reminder (non-blocking mtime comparison between audited_documents and most recent matching dispatch log entry); Fails-Safe-to-Allow on internal error with stderr notice and GitHub issue URL `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md`; session-scoped suppression marker for advisory-mode notices (one notice per session)
**Depends on:** Tier 1 Phase Manifest (reads YAML); Dispatch Log (reads JSONL); Cycle Status (reads current phase and cycle number); Audit Artifacts at canonical paths (reads for structural assertions); Gate Reflection Notes at canonical paths (reads for structural assertions); `docs/housekeeping/.migration-version` marker file (existence check for enforcement vs. advisory mode)
**Depended on by:** Orchestrator and phase skills (Stop events injected with `block` reasons are model-visible — the agent sees the failure reason on its next turn and is obligated to surface it to the user); Stop event protocol (phase transitions blocked on enforcement-mode compound check failures)
**Note:** Extends ADR-033's cross-cutting hook architecture — total plugin hook count is seven (was five). Always fails safe to allow on internal error — never wedges the agent. The `block` injection happens only in enforcement mode when the compound check detects a specific failure with a named mechanism. In advisory mode (pre-migration), the hook emits a one-per-session stderr advisory notice directing the user to `/rdd-conform migrate` but does not block. The revision-aware reminder is always non-blocking regardless of mode — the substantiality judgment is human, not mechanical, per ADR-064's principled deferral. Hook internal errors emit a non-blocking stderr notice with the hook name, the diagnostic, and a pre-populated GitHub issue URL; the methodology continues to function with verification unavailable for that turn. Users who ignore the notice experience the same degraded verification as the no-hook baseline; silent-and-indistinguishable has been converted to visible-and-ignorable.

### Module: Hook Failure Issue Template (`.github/ISSUE_TEMPLATE/hook-failure.md`) — NEW in v12.0
**Purpose:** Pre-populated GitHub issue template for users reporting hook-script internal errors, enabling the maintainer feedback loop without requiring users to debug plugin internals.
**Provenance:** ADR-064 (Fails-Safe-to-Allow surfacing design); research-phase Commitment 1 (user-as-non-maintainer product principle)
**Owns:** Structured issue template requesting: plugin version, hook name, stderr diagnostic line, OS/shell environment, sanitized copy of hook input JSON (if available)
**Depends on:** None
**Depended on by:** Tier 1 Verify Dispatch Hook and Tier 1 Phase Manifest Check Hook (stderr notices link to this template)
**Note:** The template's fields map to what the maintainer needs to reproduce and diagnose the failure. Users fill in what they can; the maintainer receives structured data. This is the product-facing half of the Fails-Safe-to-Allow mechanism — the stderr notice and the issue template together convert silent failures into an actionable maintainer feedback loop.

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

### Play and Interaction Specification Concepts (from Essay 008 / ADRs 037-039) — NEW in v7.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Play (phase + process) | Play Skill (process); Orchestrator (phase in pipeline) | ADR-038 |
| Interaction Specification (artifact) | Decide Skill (production); Play Skill (consumption as playable surface) | ADR-037 |
| Gamemaster (agent mode during play) | Play Skill (defines behavior); Orchestrating Agent concept (mode) | ADR-039 |
| Field Notes (artifact) | Play Skill | ADR-038 |
| Point of Concentration (focusing mechanism) | Play Skill (gamemaster proposes) | ADR-039; Essay 008 §3 |
| Epistemic Distance (design tension, mitigated) | Play Skill (mitigates via play frame, stakeholder profiles, gamemaster) | ADR-038; ADR-039; Essay 008 §5 |
| Playable Surface (precondition for play) | Decide Skill (creates via interaction specs); Play Skill (uses) | ADR-037; ADR-038 |
| Super-Objective (inhabitation anchor — read from discover) | Product Discovery Skill (produces in stakeholder map); Play Skill (reads) | ADR-038; ADR-039 |
| Objective (interaction-level — read from interaction specs) | Decide Skill (produces in interaction specs); Play Skill (reads) | ADR-037; ADR-038 |
| Obstacle (discovered through play) | Play Skill | ADR-038; ADR-039 |
| Inhabit (action — enter stakeholder perspective) | Play Skill | ADR-038 |
| Explore (action — play: attend to system disclosure) | Play Skill | ADR-038 |
| Reflect (action — play: articulate discoveries as field notes) | Play Skill | ADR-038 |
| Side-Coach (action — gamemaster facilitation) | Play Skill | ADR-039; Essay 008 §3 |
| Specify Interaction (action — produce interaction specs) | Decide Skill | ADR-037 |
| Inversion Principle (play level — gamemaster introduces inversions) | Play Skill (gamemaster behavior); Orchestrator (cross-cutting) | ADR-039; ADR-010 |

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

### Composable Skill Family Concepts (from Essay 011 / ADRs 048-054) — NEW in v10.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Composable Skill Family (architectural pattern) | Orchestrator (defines pattern); Build, Debug, Refactor, Review Skills (members) | ADR-048 |
| Context Gathering (embedded protocol — 5 steps) | Build Skill (build adaptation); Debug Skill (debug adaptation); Refactor Skill (refactor adaptation); Review Skill (review adaptation — existing Collaborative Context-Gathering) | ADR-049; ADR-047 |
| Context-Reconstructive Mode (operating mode) | Build, Debug, Refactor, Review Skills (all support both modes) | ADR-049; ADR-044 |
| Pipeline Mode (operating mode) | Build, Debug, Refactor, Review Skills | ADR-049 |
| Orientation Questions (five questions — lossy compression of pipeline knowledge) | Build, Debug, Refactor, Review Skills (synthesize answers in step 4 of Context Gathering) | ADR-049; Essay 011 §2 |
| Reconstructed Facsimile (lightweight session artifact) | Build Skill (writes during Context Gathering) | ADR-050 |
| Session Artifact lifecycle (write, reference, promote/discard) | Build Skill (manages `session/` directory) | ADR-050 |
| Decompose Work (action — derive work packages from ticket/codebase) | Build Skill (context-reconstructive mode) | ADR-051 |
| Dependency Classification at ticket level (heuristic application) | Build Skill (classifies as hard/implied/open; approximate, not architectural) | ADR-051; ADR-022 |
| Three-Level Refactor (smells → patterns → methodology) | Refactor Skill (owns the cycle) | ADR-052; Essay 011 §5 |
| AI Smell Taxonomy (novel/exacerbated/accelerated tiers) | Refactor Skill (level 1 diagnostic step — exacerbated; hygiene prompts — novel) | ADR-052; Essay 011 §4 |
| AI Hygiene Prompts (awareness for novel AI patterns) | Refactor Skill (runs separately from smell detection) | ADR-052 |
| Diagnose Smell (action — level 1 of Three-Level Refactor) | Refactor Skill | ADR-052 |
| Debug (Epistemic) (action — hypothesis-trace-understand-fix) | Debug Skill | ADR-048; Essay 011 §6 |
| Productive Resistance (interpretive synthesis — foundational + distributed) | Build Skill (orientation = foundational; TDD/stewardship = distributed) | Essay 011 §3 |
| Time Budget (continuous spectrum: deep/standard/focused) | Build, Debug, Refactor, Review Skills (prompt during or after Context Gathering) | ADR-053 |
| Everyday Developer (stakeholder served by context-reconstructive mode) | Build, Debug, Refactor, Review Skills (all serve via context-reconstructive mode) | ADR-048; Product discovery Cycle 6 |
| Comprehension Debt (motivating problem — Opacity Problem quantified) | None (motivating context) | Essay 011 §4; Osmani 2026 |
| Gather Context (General) (action — shared protocol across skill family) | Build, Debug, Refactor, Review Skills | ADR-049 |

### Sycophancy Resistance Concepts (from Essay 013 / ADRs 055-062) — NEW in v11.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Sycophancy (content selection bias mechanism) | None (motivating context — the problem being addressed) | Essay 013; Cheng et al. 2026 |
| Content Selection (operative mechanism of sycophancy) | None (motivating context) | Essay 013 §1 |
| Curated Truth (product of sycophantic content selection) | None (motivating context) | Essay 013 §1 |
| Performative Structural Resistance (satisfiable without addressing content selection; context-dependent classification) | Orchestrator (defines the classification framework and tier boundary) | ADR-058; Essay 013 §5; MODEL gate |
| Genuine Structural Resistance (makes absence visible; two tiers: unconditional architectural + context-responsive conversational) | Orchestrator (defines the two-tier principle) | ADR-058; Essay 013 §5; MODEL gate |
| Sycophancy Gradient (phase-by-phase vulnerability hierarchy; also a characterization gradient) | Orchestrator (front-loading principle); Research Skill (heaviest safeguards) | ADR-058; Essay 013 §6 |
| Belief-Mapping Question (primary Inversion Principle form) | All phase skills (deploy at gates via AID); Orchestrator (specifies as primary form) | ADR-055; ADR-056; Essay 013 §7 |
| Compliance Dynamics (why adversarial framing overcorrects) | None (motivating context — mechanism to avoid) | Essay 013 §7 |
| Earned Confidence (testable through belief-mapping response; has unassessable floor state) | All phase skills (assess at gates); Orchestrator (Grounding Reframe at floor state) | ADR-055; ADR-059; MODEL gate |
| Grounding Reframe (actionable fork when risk unassessable) | Orchestrator (defines pattern); all phase skills (execute when triggered) | ADR-059; MODEL gate |
| Susceptibility Snapshot (isolated evaluation artifact at phase boundaries) | Susceptibility Snapshot Evaluator Agent (produces); Orchestrator (dispatches) | ADR-057; ADR-058 |
| Framing Audit (negative space of content selection made visible) | Argument Auditor Agent (produces as second audit section) | ADR-061; Essay 013 §8 |
| Research Methods Subagent (pre-execution research design review) | Research Methods Reviewer Agent (executes); Research Skill (dispatches) | ADR-060; Essay 013 §6 |
| Assertion-Aware Observation (semantic detection of embedded conclusions at artifact-production moments) | All phase skills (AID Attend phase responsibility) | ADR-062; Dubois et al. 2026 |
| Self-Correction Blind Spot (mechanism behind architectural isolation) | Specialist subagents (exploitation mechanism) | Essay 013 §4; Tsui et al. 2025 |
| Architectural Isolation (fresh context exploiting blind spot) | All specialist subagents (design principle) | ADR-057; ADR-061; Essay 013 §4 |
| Corpus Contamination (early-phase sycophancy propagating downstream) | None (motivating context — the systemic risk) | Essay 013 §10 |
| Automation Bias Inversion (deep engagement = highest risk) | Orchestrator (motivates unconditional floor) | Essay 013 §3; Sayin & Khasawneh 2025 |
| Belief-Map (action — ask "what would I need to believe?") | All phase skills (at gates) | ADR-055; ADR-056 |
| Audit Framing (action — surface alternative framings) | Argument Auditor Agent (second audit section) | ADR-061 |
| Review Research Design (action — evaluate question set before execution) | Research Methods Reviewer Agent | ADR-060 |
| Assess Susceptibility (action — isolated evaluation of conversation signals) | Susceptibility Snapshot Evaluator Agent | ADR-057 |

### Structural Enforcement Concepts (from Essay 014 / ADRs 063-070) — NEW in v12.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Invariant 8 (mechanism execution must be structurally anchored) | Orchestrator (cross-cutting principle); all phase skills (execute anchored dispatches); Harness Layer hooks (enforce anchoring at Stop events) | Invariant 8; Essay 014; MODEL domain model Amendment #17 |
| Specification-Execution Gap (motivating pattern — specified mechanism ≠ working mechanism) | None (motivating context — the problem Cycle 10 addresses) | Essay 014 §§1-2 |
| Step-Anchored Dispatch (characteristic — dispatch at concrete, mechanically-unavoidable workflow step) | All phase skills (apply pattern); Research Skill (exemplar — citation/argument/research-methods auditors at 100% coverage) | Essay 014 §5; Spike S3 |
| Judgment-Anchored Dispatch (characteristic — dispatch dependent on orchestrator contextual recognition; the failure mode) | None (anti-pattern — the specification-execution gap) | Essay 014 §2; Spike S3 (0% historical coverage) |
| Mechanism Dispatch Site (specific, named position in skill file where a mechanism fires) | Each phase skill (owns its own dispatch sites) | ADR-065; Essay 014 §5 |
| Canonical Prompt Skeleton (skill-hook contract with literal `Output path:` line) | All phase skills (apply at every Tier 1 dispatch); Orchestrator (defines the skeleton as cross-cutting principle) | ADR-065 |
| Output Path Line (load-bearing field in dispatch prompts for harness-layer extraction) | All phase skills (include in every Tier 1 dispatch) | ADR-065; Spike S1 |
| Structurally Privileged Position (top third or bottom third of skill file — outside the "lost in the middle" zone) | All phase skills (relocate Tier 1 dispatches to compliant positions) | ADR-065 Fix 3; Spike S4; Liu et al. 2023 |
| Position Effects (instruction-following degradation in middle-of-file zone) | None (motivating context — the secondary failure mode beyond step-anchoring) | Spike S4; Essay 014 |
| Anchor Dispatch (action — skill-file edit to embed mechanism at concrete step with canonical skeleton at privileged position) | Skill maintainer via Conformance Audit Skill's dispatch prompt format audit; each phase skill during Cycle 10 implementation | ADR-065 |
| Skill-Structure Layer (Invariant 8's first substrate — primary for step-anchorable mechanisms) | Orchestrator (defines classification); all phase skills (anchor mechanisms at this substrate when step-anchorable) | ADR-065; ADR-067; Essay 014 §7 |
| Harness Layer (Invariant 8's second substrate — hook verification at tool-call or phase-end events) | Tier 1 Verify Dispatch Hook (PostToolUse half); Tier 1 Phase Manifest Check Hook (Stop half); Tier 1 Phase Manifest (declarative spec) | ADR-063; ADR-064; ADR-067; Essay 014 §7 |
| User-Tooling Layer (Invariant 8's third substrate — conversational mechanisms graduated to artifact-producing form) | Orchestrator (defines substrate); AID cycle (first migration); all phase skills (produce gate reflection notes) | ADR-066; ADR-067; Essay 014 §7 |
| Three-Tier Enforcement Classification (methodology-level taxonomy for unconditional structural mechanisms) | Orchestrator (defines catalog and four-step decision procedure) | ADR-067 |
| Classify Mechanism (action — run the four-step decision procedure to assign a mechanism to a substrate or reach step 4 non-Tier-1) | Decide Skill (when ADRs propose new Tier 1 mechanisms); Orchestrator (owns decision procedure specification) | ADR-067 |
| Per-Phase Manifest (declarative Harness Layer specification) | Tier 1 Phase Manifest module | ADR-063 |
| Manifest Format Version (`format_version: 1` for schema evolution) | Tier 1 Phase Manifest module | ADR-063 |
| Path Template (with `{cycle}` and optionally `{phase}` substitution tokens) | Tier 1 Phase Manifest module (declares); Tier 1 Phase Manifest Check Hook (resolves at runtime); Conformance Audit Skill (updates during migration) | ADR-063; ADR-070 |
| Required Headers / Required Fields / Min Bytes (structural assertions) | Tier 1 Phase Manifest module (declares); Tier 1 Phase Manifest Check Hook (evaluates) | ADR-063 |
| Audited Documents (manifest field — glob patterns for revision-aware reminder) | Tier 1 Phase Manifest module (declares); Tier 1 Phase Manifest Check Hook (mtime comparison) | ADR-064 |
| Dispatch Log (session-scoped JSONL record of every Tier 1 subagent dispatch) | Tier 1 Verify Dispatch Hook (writes); Tier 1 Phase Manifest Check Hook (reads for compound cross-reference) | ADR-064 |
| Compound Check (PostToolUse dispatch log + Stop manifest check cross-referenced) | Tier 1 Verify Dispatch Hook + Tier 1 Phase Manifest Check Hook (cooperate via shared identifiers) | ADR-064 |
| State B (missing artifact — mechanism never ran) | Tier 1 Phase Manifest Check Hook (detects and blocks with specific reason) | ADR-064; Essay 014 §5 |
| State C (trivial or sophisticated fabrication — artifact exists but not produced by isolated dispatch) | Tier 1 Phase Manifest Check Hook (detects trivial via size/header floor; detects sophisticated via dispatch log cross-reference) | ADR-064; Essay 014 §6 |
| Four Failure Modes (never-dispatched, failed-to-write, fabricated, malformed) | Tier 1 Phase Manifest Check Hook (distinguishes in block reasons) | ADR-064 |
| Fails-Safe-to-Allow (hook error handling principle — methodology continues to function, failure is visible) | Tier 1 Verify Dispatch Hook; Tier 1 Phase Manifest Check Hook | ADR-064 |
| GitHub Issue Surfacing (stderr notice with pre-populated issue URL on hook internal error) | Tier 1 Verify Dispatch Hook; Tier 1 Phase Manifest Check Hook; Hook Failure Issue Template | ADR-064 |
| User-as-Non-Maintainer (product principle — RDD targets developers using the plugin, not developers maintaining it) | None (cross-cutting product principle); Orchestrator (carries the framing); surfacing mechanisms honor the position | ADR-064; research-phase Commitment 1 |
| Advisory Mode (pre-migration corpus state — hook does not block, emits stderr notice, corpus continues to work without harness-layer verification) | Tier 1 Phase Manifest Check Hook (enters when `docs/housekeeping/.migration-version` absent) | ADR-064; ADR-070 |
| Enforcement Mode (post-migration corpus state — compound check runs, Stop hook blocks on failures) | Tier 1 Phase Manifest Check Hook (enters when marker file present) | ADR-064; ADR-070 |
| Migration Version Marker (`docs/housekeeping/.migration-version` file) | Conformance Audit Skill (writes during `/rdd-conform migrate`); Tier 1 Phase Manifest Check Hook (reads for mode detection) | ADR-064; ADR-070 |
| Revision-Aware Re-Audit Reminder (non-blocking mtime comparison notice) | Tier 1 Phase Manifest Check Hook | ADR-064 |
| Substantiality Judgment (whether a revision warrants re-audit — epistemic, not mechanical) | User + Agent jointly (the reminder surfaces the condition; the decision remains human) | ADR-064 |
| Graduate Conversational Mechanism (action — turn a conversational mechanism into an artifact-producing one at a canonical path) | Skill maintainer; first instance: AID cycle graduated to gate reflection note | ADR-066; MODEL domain model Amendment #17 |
| Gate Reflection Note (artifact — AID cycle's artifact-producing form) | Orchestrator (produces at phase boundaries); all phase skills (produce at standalone invocation gates) | ADR-066 |
| AID Interpret Privacy (engagement interpretation is private to the agent — not narrated to the user in conversation or file form) | Orchestrator (enforces across media); Gate Reflection Note format (omits interpretation) | ADR-066; Cycle 10 feedback memory |
| Reframe-Derailed Gate (limitation — well-formed artifact can encode framings user does not fully own) | None (named limitation — User-Tooling Layer cannot verify epistemic substance, only structural floor); Orchestrator carries the caveat | ADR-066; MODEL pre-mortem 2026-04-08 |
| Engagement-Degradation Threat Model (motivating context — fatigue, gaps, resumption can produce incongruent framings) | None (motivating context); compound defense addresses it | ADR-066; MODEL 2026-04-08 |
| Compound Defense (umbrella — the set of mechanisms that fire at the phase-boundary interstitial moment where course correction is structurally possible; currently three components covering non-overlapping failure modes, but the "coverage zones" description is descriptive of the current constellation rather than a membership test — the extensibility of the umbrella is empirical, growing from two components to three during Cycle 10's own development) | Orchestrator (defines as cross-cutting principle); Susceptibility Snapshot Evaluator Agent (content ceiling component); AID cycle via gate reflection note (structural floor component); belief-mapping in conversation (pre-artifact component) | ADR-066; ARCHITECT gate 2026-04-09 (phase-boundary interstitial framing) |
| Manifest Check (structural floor component of compound defense) | Tier 1 Phase Manifest Check Hook | ADR-066 |
| Content Ceiling (what the susceptibility snapshot catches — framing-adoption in well-formed artifacts) | Susceptibility Snapshot Evaluator Agent | ADR-066 |
| Pre-Artifact Zone (what belief-mapping catches — unexamined commitments before finalization) | All phase skills (apply belief-mapping at gates); Orchestrator | ADR-066; ADR-055 |
| Grounding Reframe Extension (protocol fires on significant snapshot findings with in-cycle course-correction implications) | Orchestrator (defines extended trigger condition); all phase skills (execute when triggered) | ADR-068 |
| Significance Properties (specificity, actionability, in-cycle applicability — calibration for the judgment term "significant") | Orchestrator (calibration tool for the Grounding Reframe trigger decision) | ADR-068 |
| In-Cycle Course Correction (principle — snapshot findings drive correction at their own boundary, not feed-forward) | Orchestrator (operating principle for Grounding Reframe trigger decisions); DISCOVER settled premise 4 | ADR-068; DISCOVER 2026-04-07 |
| Methodology Scope-of-Claim (the methodology's positive and negative guarantees) | Orchestrator (carries the scope-of-claim as cross-cutting principle) | ADR-069 |
| Competence Without Independent Second-Order Critique (named limitation — agent does not independently generate second-order critique of its own output) | Orchestrator (carries the limitation); all Tier 1 mechanisms (collectively protect against it) | ADR-069; research/discover/model/decide snapshots |
| Failure Mode (pattern — agent composes framing; user follows along without evaluating; absorbed as settled without scrutiny) | None (named pattern — documented across Cycle 10) | ADR-069 |
| Success Mode (pattern — agent composes framing; user evaluates on stated criteria; accepts or rejects on merits) | None (named pattern — cultivable but not guaranteed) | ADR-069; DECIDE 2026-04-09 |
| Stated Criteria (success-mode precondition — the user has criteria to apply to the evaluation) | User (brings criteria); provenance check subsections (make composition visible for evaluation) | ADR-069 |
| Provenance Check Subsection (in ADRs — selectively used to label agent composition at drafting time) | Decide Skill (includes in ADRs carrying non-driver content); Orchestrator (policy: drivers are primary, checks fill gaps) | ADR-069; FC-C refinement at DECIDE gate 2026-04-09 |
| Architectural Drivers (primary provenance attribution mechanism — research findings, domain model concepts, prior ADRs traced through ADR context) | Decide Skill (writes ADRs); Architect Skill (extends drivers into system design provenance); Orchestrator (policy) | ADR-069; Cycle 10 DECIDE framing audit |
| Layered Enforcement Adoption (the move — replace prose-only specifications with structurally anchored mechanisms; renamed from "methodology graduation (small-d)") | None (design principle — the direction Cycle 10 moves the methodology); Orchestrator (carries the principle) | Essay 014; MODEL domain model Amendment #17 |
| Centered vs. Infrastructure Framing (distinction between what the methodology centers for user reading vs. what underpins framework operation) | Orchestrator (cross-cutting design principle) | ADR-064; DECIDE 2026-04-08/09 |
| Centered Artifacts (essays, ADRs, domain model, product discovery, system design, roadmap, field guide, ORIENTATION) | Each producing skill (writes to top-level `docs/`) | ADR-064 |
| Infrastructure Artifacts (dispatch log, audit reports, cycle-status, gate reflection notes, manifest — underpin operation, surfaced by agent) | Each producing skill or hook (writes to `docs/housekeeping/`) | ADR-064 |
| Housekeeping Directory (`docs/housekeeping/`) | Conformance Audit Skill (creates during `/rdd-conform migrate`) | ADR-064; ADR-070 |
| Housekeeping Migration (action — move infrastructure artifacts into the housekeeping directory and update references) | Conformance Audit Skill (`/rdd-conform migrate` subcommand) | ADR-070 |
| Housekeeping Directory Organization Audit (new rdd-conform audit scope) | Conformance Audit Skill | ADR-070 |
| Gate Reflection Note Template Alignment Audit (new rdd-conform audit scope) | Conformance Audit Skill | ADR-070 |
| Dispatch Prompt Format Audit (new rdd-conform audit scope — verifies canonical skeleton + structurally privileged position) | Conformance Audit Skill | ADR-070 |
| Rollback Manifest (forensic record of migration file moves and reference updates) | Conformance Audit Skill (writes at `docs/housekeeping/.migration-rollback.json` during `/rdd-conform migrate`) | ADR-070 |
| Idempotency (migration is a no-op if marker file matches current plugin version) | Conformance Audit Skill (`/rdd-conform migrate` subcommand) | ADR-070 |
| Uncommitted Changes Refusal (migration refuses to run with unstaged skill modifications) | Conformance Audit Skill (`/rdd-conform migrate` subcommand) | ADR-070 |

### Adaptive Gate Concepts (from Essay 009 / ADRs 040-042) — NEW in v8.0

| Domain Concept/Action | Owning Module | Provenance |
|----------------------|---------------|------------|
| Reflection Time (user-facing alias for Epistemic Gate) | Orchestrator (defines dual-register convention); all phase skills (use in agent dialogue) | ADR-041; Essay 009 §9 |
| Attend-Interpret-Decide / AID cycle (adaptive gate protocol) | Orchestrator (defines protocol); all phase skills (execute at gates) | ADR-040; Essay 009 §5; Jacobs et al. 2010 |
| Engagement Signal (observable markers in conversation history) | All phase skills (read signals at gate time) | ADR-040; Essay 009 §4 |
| Pedagogical Move (five response modes: challenge, probe, teach, clarify, re-anchor) | All phase skills (select move at gate time) | ADR-040; Essay 009 §5 |
| Contingent Teaching (four-step loop within gates: diagnose, check, intervene, check) | All phase skills (execute when Interpret reveals gap) | ADR-040; Essay 009 §6; Wood, Bruner & Ross 1976 |
| Contingent Shift (increase support on struggle, decrease on success) | All phase skills (iterative adjustment within gates) | ADR-040; Essay 009 §3 |
| Earned Fatigue (tiredness from genuine deep engagement — signal to break) | All phase skills (detected during Attend; Re-anchor response offers break) | Product discovery 2026-03-30; Reflection 009 |
| Pace Regulator (RDD's function anchoring user in one domain) | Orchestrator (framing); all phase skills (gates sustain focus) | Product discovery 2026-03-30; Reflection 009 |
| IRE Pattern (the discourse pattern being replaced) | None (anti-pattern) | Essay 009 §2; Sinclair & Coulthard 1975 |
| Reframing (questioning the problem frame from cross-phase vantage) | All phase skills (available as Challenge sub-move at gates) | ADR-040; Essay 009 §7; Inversion Principle at gate level |
| Attend (read engagement signals from conversation history) | All phase skills | ADR-040; Invariant 3 (pragmatic action) |
| Interpret (form hypothesis about user engagement/understanding) | All phase skills | ADR-040; Invariant 3 (pragmatic action) |
| Select Pedagogical Move (choose gate response based on interpretation) | All phase skills | ADR-040; Invariant 3 (pragmatic action) |
| Reframe (surface narrowed solution space from cross-phase context) | All phase skills | ADR-040; Inversion Principle (7th location) |
| Version reporting (read plugin manifest version) | About Skill | ADR-042 |
| Methodology overview (user-language explanation of RDD) | About Skill | ADR-042 |

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
│   ├── Build Skill (outer loop; generates field-guide.md)
│   │       ├──mode-shift──→ Debug Skill (on unexpected failure)
│   │       ├──mode-shift──→ Refactor Skill (after green / stewardship)
│   │       └──mode-shift──→ Review Skill (at stewardship checkpoints)
│   ├── Debug Skill (standalone or via build mode-shift)
│   ├── Refactor Skill (standalone or via build mode-shift)
│   ├── Play Skill (optional; gamemaster mode of orchestrating agent)
│   ├── Synthesis Skill (usually terminal; conditional re-entry to Research)
│   │       └──dispatches──→ citation-auditor, argument-auditor
│   │       └──→ Research Skill (re-entry when structural experimentation surfaces new questions)
│   └── Conformance Audit Skill (utility) ──dispatches──→ conformance-scanner
│
├── Agents Layer ───────────────────────────────────────────────── (AMENDED v11.0: 6→8 agents)
│   citation-auditor (Sonnet) ──reads──→ essay/outline, research log ──writes──→ audit artifact
│   argument-auditor (Sonnet) ──reads──→ essay/ADRs/outline + SOURCE MATERIAL ──writes──→ two-section audit artifact (argument + framing) [AMENDED v11.0: framing audit extension per ADR-061]
│   lit-reviewer (Sonnet) ──reads──→ research question ──writes──→ research log entry
│   conformance-scanner (Sonnet) ──reads──→ ADRs, codebase ──writes──→ conformance debt table
│   orientation-writer (Sonnet) ──reads──→ artifact corpus ──writes──→ ORIENTATION.md
│   spike-runner (inherit) ──reads──→ spike question ──writes──→ research log entry
│   research-methods-reviewer (Sonnet) ──reads──→ research question set ──writes──→ research design review artifact [NEW v11.0: ADR-060]
│   susceptibility-snapshot-evaluator (Sonnet) ──reads──→ AID susceptibility signals ──writes──→ Susceptibility Snapshot artifact [NEW v11.0: ADR-057]
│
└── Hooks Layer ────────────────────────────────────────────────── (AMENDED v12.0: 5→7 hooks)
    invariant-reminder (PreToolUse: Write|Edit on docs/) → context injection
    epistemic-gate-enforcer (Stop during RDD phase) → reminder injection
    skill-activator (UserPromptSubmit) → skill suggestion + override prevention
    orientation-trigger (PostToolUse: Write on key artifacts) → regeneration reminder
    sizing-check (PostToolUse: Write on docs/) → sizing flag
    tier1-verify-dispatch (PostToolUse: Agent) → dispatch log append [NEW v12.0: ADR-064]
    tier1-phase-manifest-check (Stop) → compound check; advisory/enforcement mode [NEW v12.0: ADR-064]

Harness Layer Configuration (NEW v12.0):
    hooks/manifests/tier1-phase-manifest.yaml → declarative per-phase Tier 1 mechanism specification [ADR-063]
    .github/ISSUE_TEMPLATE/hook-failure.md → hook failure issue template for maintainer feedback loop [ADR-064]
    docs/housekeeping/dispatch-log.jsonl → session-scoped dispatch log (gitignored) [ADR-064]
    docs/housekeeping/.migration-version → advisory/enforcement mode marker [ADR-064; ADR-070]
```

**Skill-level edges (updated in v10.0):**
- Orchestrator → all phase skills including Play Skill (invokes, defines protocol)
- Orchestrator → Debug Skill, Refactor Skill (lists in Available Skills for standalone invocation)
- Build Skill → Debug Skill, Refactor Skill, Review Skill (mode-shift composition — context inheritance, seamless transitions; supersedes ADR-046 callout model)
- Synthesis Skill → Research Skill (conditional re-entry — writer-initiated)
- Orchestrator → Conformance Audit Skill (lists in Available Skills)
- Play Skill dispatches no specialist subagents (gamemaster requires conversation context)
- Debug Skill, Refactor Skill dispatch no specialist subagents (standalone work in conversation context)

**Skill-to-agent dispatch edges (NEW in v6.0, AMENDED in v11.0 and v12.0):**

All Tier 1 dispatches below use the canonical prompt skeleton per ADR-065 with a literal `Output path:` line at a structurally privileged position in the skill file.

- Research Skill → citation-auditor (after essay writing; canonical skeleton)
- Research Skill → argument-auditor (after citation audit passes — now includes framing audit section per ADR-061; canonical skeleton)
- Research Skill → lit-reviewer (user-selected research method)
- Research Skill → spike-runner (user-selected research method)
- Research Skill → research-methods-reviewer (before each research loop after substantial revision, not just first — ADR-060; canonical skeleton) **[NEW v11.0]**
- Research Skill → susceptibility-snapshot-evaluator (at phase-end — ADR-065 Fix 1; canonical skeleton with phase-keyed output path) **[NEW v12.0: moved from orchestrator to phase skill]**
- Discover Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Model Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Decide Skill → argument-auditor (after ADRs written — includes framing audit; canonical skeleton)
- Decide Skill → conformance-scanner (Step 3.5, codebase scan)
- Decide Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Architect Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Build Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Play Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Synthesis Skill → citation-auditor (before outline finalization; canonical skeleton)
- Synthesis Skill → argument-auditor (after citation audit on outline — includes framing audit; canonical skeleton)
- Synthesis Skill → susceptibility-snapshot-evaluator (at phase-end) **[NEW v12.0]**
- Conform Skill → conformance-scanner (drift detection operation)
- Orchestrator → orientation-writer (at milestones, triggered by orientation-trigger hook)
- **[REMOVED v12.0]** ~~Orchestrator → susceptibility-snapshot-evaluator~~ (the orchestrator no longer directly dispatches the snapshot; per-phase dispatch in phase skills per ADR-065 Fix 1)

**Harness Layer edges (NEW in v12.0):**
- Tier 1 Verify Dispatch Hook → Dispatch Log (appends JSONL entry on every Tier 1 dispatch via `PostToolUse` on `Agent`)
- Tier 1 Phase Manifest Check Hook ← Per-Phase Manifest (reads YAML at Stop events)
- Tier 1 Phase Manifest Check Hook ← Dispatch Log (reads JSONL for compound cross-reference)
- Tier 1 Phase Manifest Check Hook ← Cycle Status (reads current phase and cycle number)
- Tier 1 Phase Manifest Check Hook ← Audit Artifacts + Gate Reflection Notes (reads for structural assertions)
- Tier 1 Phase Manifest Check Hook ← Migration Version Marker (existence check for enforcement vs. advisory mode)
- Conformance Audit Skill → Per-Phase Manifest (updates `path_template` values during `/rdd-conform migrate`)
- Conformance Audit Skill → `docs/housekeeping/` (creates during migration); `.migration-version` (writes during migration); `.migration-rollback.json` (writes during migration)
- Conformance Audit Skill → Skill files + ADRs + Essays + Domain Model + ORIENTATION (mechanical reference substitution during migration)
- Conformance Audit Skill → Per-Phase Manifest (reads during dispatch prompt format audit)
- Conformance Audit Skill → Gate Reflection Notes (reads during gate reflection template alignment audit)
- Conformance Audit Skill → Skill files (reads during dispatch prompt format audit)

**Hook event edges (NEW in v6.0, AMENDED in v12.0):**
- invariant-reminder → fires on PreToolUse (Write|Edit on `docs/`)
- epistemic-gate-enforcer → fires on Stop (during RDD phases)
- skill-activator → fires on UserPromptSubmit (RDD intent detection)
- orientation-trigger → fires on PostToolUse (Write on system-design.md, domain-model.md, scenarios.md)
- sizing-check → fires on PostToolUse (Write on `docs/`)
- **tier1-verify-dispatch → fires on PostToolUse (Agent)** [NEW v12.0: ADR-064] — extracts `subagent_type` and `Output path:` from `tool_input.prompt`; appends JSONL entry to dispatch log if mechanism is in Tier 1 set
- **tier1-phase-manifest-check → fires on Stop** [NEW v12.0: ADR-064] — reads phase from cycle-status, loads manifest, performs compound check (structural assertions + dispatch log cross-reference), emits block with specific reason on failure in enforcement mode; advisory stderr notice in advisory mode; Fails-Safe-to-Allow on internal error with GitHub issue surfacing

**Inter-skill communication:** Skills do not depend on each other directly. They communicate through artifact files:

```
essay → product-discovery.md → domain-model.md → ADRs + scenarios + interaction-specs.md → system-design.md + roadmap.md → code + field-guide.md → field-notes.md
                                                                                                                                                        ↓
                                        [full artifact trail including field notes] → synthesis outline → synthesis essay (user)
                                                            ↓
                                              ORIENTATION.md (derived from full artifact trail at milestones)

field-notes.md feedback loop: → product-discovery.md (update mode), scenarios (missing), interaction-specs.md (gaps), research (new questions)
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
- Interaction specs: `./docs/interaction-specs.md`
- Field notes: `./docs/essays/reflections/field-notes.md`
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

### Orchestrator → Play Skill — NEW in v7.0
**Protocol:** The orchestrator invokes `/rdd-play` as an optional phase after BUILD. Like the synthesis skill, the play skill does NOT follow the standard 5-step epistemic gate protocol — the three-movement activity (inhabit → explore → reflect) subsumes the gate function (ADR-016 pattern extended via ADR-038). The orchestrating agent enters gamemaster mode during play.
**Shared types:** The play skill reads:
- Product discovery: `./docs/product-discovery.md` (stakeholder map, super-objectives)
- Interaction specs: `./docs/interaction-specs.md` (objectives, playable surface)
- Field guide: `./docs/references/field-guide.md` (map of the territory)
The play skill writes:
- Field notes: `./docs/essays/reflections/field-notes.md` (categorized discoveries)
**Error handling:** If interaction specs do not exist, the skill notes that play benefits from a playable surface but the practitioner may proceed with less structured play or return to DECIDE. If product discovery is missing, the skill cannot propose stakeholder roles — play cannot proceed meaningfully.
**Owned by:** Orchestrator defines PLAY as optional phase; Play Skill owns the three-movement process and gamemaster behavior.

### Decide Skill → Play Skill (via interaction-specs.md) — NEW in v7.0
**Protocol:** File-based. Decide Skill writes `./docs/interaction-specs.md` after writing scenarios. Play Skill reads it for the playable surface — stakeholder-organized task decompositions provide objectives for inhabitation and specific interaction mechanics to encounter.
**Shared types:** Interaction specs organized by stakeholder, each entry containing: stakeholder (from product discovery), super-objective (from discover), task (workflow level), interaction mechanics (how the task is performed).
**Error handling:** If interaction specs are missing when play begins, the play skill notes the gap and offers the practitioner a choice: proceed with less structured play, or return to DECIDE.
**Owned by:** Decide Skill owns the artifact format; Play Skill owns the consumption and interpretation.

### Play Skill → Discover/Decide/Research Skills (via field-notes.md) — NEW in v7.0
**Protocol:** File-based feedback loop. Play Skill writes `./docs/essays/reflections/field-notes.md` with discoveries categorized by feedback destination. In subsequent RDD cycles: Discover Skill (update mode) reads field notes alongside new research — usability friction entries surface as candidate value tensions, challenged assumptions surface as candidate assumption inversions. Decide Skill reads missing-scenario entries. Research reads new-question entries. Interaction specs receive interaction-gap entries.
**Shared types:** Field notes categorized into six types: missing scenario, usability friction, new question, challenged assumption, delight, interaction gap. Each note records the observation without prescribing a fix.
**Error handling:** If field notes do not exist (play was skipped or hasn't occurred), subsequent cycles proceed without them. Field notes are input to update mode, not a prerequisite.
**Owned by:** Play Skill owns the artifact; receiving skills own interpretation in their respective phases.

### Play Skill → Synthesis Skill (via field-notes.md) — NEW in v7.0
**Protocol:** File-based. Synthesis Skill reads field notes alongside the full artifact trail during artifact trail mining. Delight entries and surprising discoveries from play contribute experiential findings as candidate novelty signals — the kind of insight a conformance-only artifact trail cannot contain.
**Shared types:** Field notes (especially delight and surprise entries) as novelty signal candidates.
**Error handling:** If field notes do not exist, synthesis proceeds with the existing artifact trail (existing behavior).
**Owned by:** Play Skill owns the artifact; Synthesis Skill owns the mining and interpretation.

### Orchestrator → Synthesis Skill — NEW
**Protocol:** The orchestrator invokes `/rdd-synthesize` as an optional terminal phase. Unlike other phase skills, the synthesis skill does NOT follow the standard 5-step epistemic gate protocol — the three-phase conversation (journey review, novelty surfacing, framing) subsumes the gate function (ADR-016).
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

### Build Skill → Debug/Refactor/Review Skills (mode-shift composition) — NEW in v10.0
**Protocol:** Seamless mode shift within a single conversation. When a trigger condition is met (unexpected failure, smell after green, stewardship checkpoint), the build skill shifts into the corresponding mode. The inner skill's logic executes with full access to the build session's orientation context and current work package. When the inner skill's work resolves, the build flow resumes at the trigger point. No dispatch, no re-orientation, no perceivable boundary.
**Shared types:** The build session's validated orientation (answers to the five Orientation Questions), the current work package (scope, integration points, testable behaviors, dependencies), and the architectural intent (system design in pipeline mode, orientation summary in context-reconstructive mode). These are conversation context, not files — the mode shift happens within the same conversation.
**Error handling:** If the developer declines a mode shift, the build flow continues without it. If a mode shift reveals an issue that cannot be resolved (e.g., a bug that requires upstream research), the build flow pauses and the developer decides next steps.
**Owned by:** Build Skill owns the trigger conditions; each inner skill owns its specialized logic.
**Note:** This supersedes ADR-046's callout model for build→review. The key change: the prior model suggested the user invoke a separate skill; the new model shifts seamlessly with context continuity.

### Context Gathering Protocol (embedded in all composable skills) — NEW in v10.0
**Protocol:** Five-step protocol embedded in each skill of the Composable Skill Family. Steps 1-3 and 5 are shared; step 4 adapts to the invoking skill's direction.
1. Detect mode (check for RDD artifacts → pipeline or context-reconstructive)
2. Prompt for breadcrumbs (context-reconstructive mode only)
3. Fetch and read (heterogeneous sources, graceful degradation)
4. Synthesize orientation (skill-specific adaptation: build → work decomposition; debug → expected-vs-actual; refactor → structural health; review → design rationale)
5. Validate with user ("Does this capture the context?")
**Shared types:** Orientation summary (answers to five Orientation Questions). In context-reconstructive mode, written as session artifact (ADR-050). In pipeline mode, read from artifact trail.
**Error handling:** If tools for fetching are unavailable, the skill asks the user to paste content. If the user declines validation, the skill proceeds but notes the risk.
**Owned by:** Each skill owns its implementation; the protocol specification is shared reference material.

### Build Skill → Session Artifacts (`session/` directory) — NEW in v10.0
**Protocol:** In context-reconstructive mode, the build skill writes validated facsimiles to a `session/` directory within the project. Files use `session-artifact: true` frontmatter. Stewardship checkpoints read these files for conformance checks. The skill does not clean up session artifacts automatically.
**Shared types:** Markdown files with `session-artifact: true` frontmatter:
- `session/work-decomposition.md` (always written)
- `session/orientation.md` (written for standard/deep time budgets)
**Error handling:** If the `session/` directory does not exist, the skill creates it. If session artifacts from a prior session exist, the skill notes them and asks whether to continue or start fresh.
**Owned by:** Build Skill owns creation and reference; the developer owns lifecycle decisions (keep, promote, discard).

### Research Skill → Research Methods Reviewer Agent (dispatch) — NEW in v11.0
**Protocol:** Research Skill dispatches the Research Methods Reviewer Agent before the first research loop, and before each subsequent loop following a substantial essay revision (from framing audit findings, discovery feedback, or reflection). The agent reads the research question set, applies belief-mapping to each question, and writes a research design review artifact.
**Shared types:** Input: research question set (typically 3-7 questions). Output: structured review artifact at `./docs/essays/audits/research-design-review-NNN.md` (flagged questions, suggested reformulations, premature narrowing flags).
**Error handling:** If the agent fails to produce output, the research skill proceeds with its questions (graceful degradation). Flagged questions surface at the epistemic gate for user judgment.
**Owned by:** Research Skill owns dispatch timing; Research Methods Reviewer Agent owns the review methodology.

### Orchestrator → Susceptibility Snapshot Evaluator Agent (dispatch) — NEW in v11.0
**Protocol:** The orchestrator dispatches the Susceptibility Snapshot Evaluator Agent at every phase boundary (between skills). The agent receives the AID cycle's recorded susceptibility signals from the preceding phase, evaluates them in isolated context, and writes a Susceptibility Snapshot artifact. The snapshot's findings are acted on via the Grounding Reframe pattern (ADR-059) — not dismissible without engagement.
**Shared types:** Input: recorded susceptibility signals (assertion density, narrowing trajectory, framing adoption, confidence markers, alternative engagement). Output: Susceptibility Snapshot artifact (observed signals, interpretation, Grounding Reframe recommendation if warranted).
**Error handling:** If the agent fails, the orchestrator notes the gap and proceeds. The unconditional floor (ADR-058) has reduced coverage but other Tier 1 mechanisms remain.
**Owned by:** Orchestrator owns dispatch timing; Susceptibility Snapshot Evaluator Agent owns the evaluation methodology.

### Argument Auditor Agent (framing audit extension) — AMENDED in v11.0
**Protocol:** Extended from v10.0. The argument auditor now receives the artifact AND its source material (the full evidence base the artifact drew from). It produces a two-section output: (1) argument audit (existing — inferential chain verification), (2) framing audit (new — alternative framing identification, negative-space analysis, belief-mapping applied to dominant framing).
**Shared types:** Input: artifact + source material file paths. Output: two-section audit artifact (argument audit + framing audit, each with P1/P2/P3 issues).
**Error handling:** If framing audit section fails, argument audit section alone is produced (graceful degradation to v10.0 behavior).
**Owned by:** Argument Auditor Agent owns both sections; dispatching skill owns the dispatch decision.

### Feed-Forward Contract (ADR-004)
**Protocol:** Conversational. In single-session cycles, the user's epistemic responses are in conversation history. In multi-session cycles, the orchestrator's status table summarizes key responses.
**Shared types:** Natural language in conversation context.
**Error handling:** Multi-session persistence is lossy — acknowledged as known limitation (ADR-004).
**Owned by:** Orchestrator (defines the instruction to attend to prior responses).

### Phase Skill → Susceptibility Snapshot Evaluator Agent (per-phase dispatch — ADR-065 Fix 1) — NEW in v12.0
**Protocol:** Each phase skill dispatches the susceptibility-snapshot-evaluator at its phase-end step via the Task tool using the canonical prompt skeleton from ADR-065. The dispatch instruction lives at a structurally privileged position (bottom third of the skill file — phase-end transition). The canonical prompt skeleton has three parts: a brief describing the phase's AID signals and the boundary being crossed, a literal `Output path:` line naming `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md` (pre-migration: `docs/essays/audits/...`), and the phase-specific context (prior snapshot findings, cross-phase signals).
**Shared types:** Input: recorded susceptibility signals + phase identifier + canonical output path. Output: Susceptibility Snapshot artifact at the phase-keyed canonical path (observed signals, interpretation, Grounding Reframe recommendation if warranted).
**Error handling:** If the agent fails to produce the output artifact, the Stop hook's manifest check catches the missing artifact and blocks phase transition in enforcement mode (or emits an advisory notice in advisory mode). The phase skill does not itself verify artifact production — the harness layer does.
**Owned by:** Each phase skill owns its dispatch instruction and phase-specific brief content; the Susceptibility Snapshot Evaluator Agent owns the evaluation methodology; the Tier 1 Phase Manifest Check Hook owns the verification.
**Supersedes:** The orchestrator-centralized dispatch instruction in `skills/rdd/SKILL.md`'s Susceptibility Snapshot Dispatch subsection (Cycle 9) is superseded by the per-phase placement. The orchestrator still describes the mechanism as a cross-cutting principle but delegates the dispatch site to each phase skill.

### PostToolUse(Agent) → Dispatch Log (Harness Layer dispatch verification — ADR-064) — NEW in v12.0
**Protocol:** On every `PostToolUse` event where `tool_name == "Agent"`, the `tier1-verify-dispatch.sh` hook extracts `tool_input.subagent_type` from the hook input JSON. If the subagent type is in the Tier 1 set (research-methods-reviewer, citation-auditor, argument-auditor, susceptibility-snapshot-evaluator), the hook extracts the expected output path via regex matching `^Output path: (.+)$` from `tool_input.prompt`, resolves `{cycle}` and `{phase}` tokens, and appends a JSONL entry to `docs/housekeeping/dispatch-log.jsonl` with schema `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`. The hook always exits `allow` — verification is append-only; the dispatch already ran.
**Shared types:** Input: hook input JSON per Claude Code hook spec (`tool_name`, `tool_input`, `tool_use_id`). Output: JSONL dispatch log entry.
**Error handling:** Fails-Safe-to-Allow on internal error with stderr notice and GitHub issue URL. Non-Tier-1 dispatches exit silently (no log entry). Dispatches where `tool_input.prompt` omits the `Output path:` line are logged with `expected_path: null` (degraded mode, pre-ADR-065 compatibility).
**Owned by:** The hook script owns extraction and logging; the skill files own including the canonical prompt skeleton; the Tier 1 Phase Manifest Check Hook owns reading and cross-referencing the log.

### Stop → Compound Check (Harness Layer verification — ADR-064) — NEW in v12.0
**Protocol:** On every Stop event, the `tier1-phase-manifest-check.sh` hook runs the following sequence: (1) read the current phase from `docs/housekeeping/cycle-status.md` (or `docs/cycle-status.md` pre-migration); fail safe to allow if unparseable. (2) Read the current cycle number from the cycle-status `**Cycle number:** NNN` field; fall back to essay-prefix inference if absent; fail safe to allow if neither available. (3) Check `docs/housekeeping/.migration-version` for enforcement vs. advisory mode detection. (4) Load `hooks/manifests/tier1-phase-manifest.yaml`; fail safe to allow with GitHub issue surfacing if missing. (5) Look up the current phase's `required_mechanisms`. (6) For each required mechanism, run structural assertions (file existence, size floor, required headers, required fields) AND check the dispatch log for a matching entry (mechanism + resolved expected_path). (7) Emit `block` with a specific reason in enforcement mode, or stderr advisory notice in advisory mode, on failure. (8) Run the revision-aware reminder for mechanisms with `audited_documents`: compare audited file mtimes against the most recent matching dispatch log entry; emit a non-blocking model-visible notice if mtime mismatch.
**Shared types:** Input: hook input JSON per Claude Code hook spec. Output: `allow` (silent), `allow` with model-visible reminder (revision-aware), or `block` with specific reason naming the failing mechanism and failure mode.
**Error handling:** Always fails safe to allow on internal error with stderr notice and GitHub issue URL. In advisory mode, blocks are replaced with a one-per-session stderr advisory notice. Missing cycle-status or manifest files fail safe to allow.
**Owned by:** The hook script owns the compound check logic; the manifest owns the required mechanism specifications; the dispatch log owns the session-scoped record; the phase skills own producing artifacts at the canonical paths; the Conformance Audit Skill owns the migration that transitions the corpus from advisory to enforcement mode.

### Orchestrator → Gate Reflection Note (User-Tooling Layer — ADR-066) — NEW in v12.0
**Protocol:** At each phase boundary, after the AID cycle conversation has completed, the orchestrator composes a gate reflection note at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md` before declaring the phase complete. The note contains five required sections per ADR-066's template: the composed belief-mapping question (with phase-specific emphasis from the Question Toolkit), the user's verbatim response, the selected pedagogical move (named without the engagement interpretation that drove selection — AID privacy), and the commitment gating outputs (settled premises, open questions, specific commitments carried forward). The orchestrator writes the note before the Stop hook's manifest check runs.
**Shared types:** Markdown file at canonical path with five required headers and five required fields. Manifest entry per ADR-063: `aid-cycle-gate-reflection` with `min_bytes: 800` and the required_headers/required_fields list.
**Error handling:** If the orchestrator cannot write the note (filesystem error, missing directory in pre-migration state), the Stop hook's compound check will detect the missing file and emit a block (enforcement mode) or advisory notice (advisory mode). In advisory mode, the gate reflection note requirement degrades to an advisory — the methodology continues to function without the artifact.
**Owned by:** The orchestrator owns note production at phase boundaries during pipeline execution; each phase skill owns note production during standalone invocation (when the skill is invoked directly rather than via the orchestrator); the Tier 1 Phase Manifest Check Hook owns verification.
**Known limitation:** The reframe-derailed gate failure mode — a well-formed note can encode framings the user does not fully own. The manifest check verifies the structural floor, not the epistemic ceiling. The Susceptibility Snapshot at the same phase boundary is the complementary defense (compound defense pattern per ADR-066).

### Orchestrator → Grounding Reframe Protocol (Extended — ADR-068) — NEW in v12.0
**Protocol:** The Grounding Reframe protocol fires on two triggers: (1) ADR-059's original trigger — unassessable sycophancy risk — and (2) ADR-068's extended trigger — significant susceptibility snapshot finding with in-cycle course-correction implications. For the extended trigger, the orchestrator reads each snapshot finding and applies three significance properties: specificity (does the finding name concrete artifacts, decisions, or commitments in the current phase?), actionability (can a concrete grounding action be composed in direct response?), and in-cycle applicability (can the action be applied at the current phase boundary rather than feeding forward?). Findings meeting all three trigger the protocol. Findings not meeting all three are recorded as feed-forward signals in the cycle status.
**Shared types:** Snapshot finding + three significance properties + protocol body (name uncertainty, offer grounding actions, make cost visible).
**Error handling:** The significance decision is the orchestrator's judgment at snapshot-read time. There is no mechanical classifier — the three properties are calibration tools, not gates. Misclassification is recoverable: findings not caught at their own boundary still feed forward as signals for subsequent phases.
**Owned by:** The orchestrator owns the trigger decision and protocol execution; the Susceptibility Snapshot Evaluator Agent owns the finding production.

### Conformance Audit Skill → `/rdd-conform migrate` (Housekeeping Migration — ADR-070) — NEW in v12.0
**Protocol:** `/rdd-conform migrate` is a one-shot operation. The subcommand: (1) Checks `docs/housekeeping/.migration-version` — if present and matching the current plugin version, reports "already migrated" and exits. (2) Checks `git status` for uncommitted changes to `skills/` or `docs/` — refuses to run if any are present, directing the user to commit or stash. (3) Creates `docs/housekeeping/` + `audits/` + `gates/` subdirectories. (4) Moves `docs/essays/audits/*` → `docs/housekeeping/audits/*` preserving subdirectory structure. (5) Moves `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`. (6) Performs mechanical `sed`-style reference substitution across affected files (ADRs, Cycle 10 essay, spike reports, skill files, manifest, domain model, ORIENTATION) — does not touch `docs/cycle-archive/`, `docs/essays/reflections/`, `docs/essays/research-logs/`. (7) Writes `docs/housekeeping/.migration-version` with the current plugin version string. (8) Appends `docs/housekeeping/dispatch-log.jsonl` to `.gitignore` if not already present. (9) Writes rollback manifest at `docs/housekeeping/.migration-rollback.json`. (10) Produces summary report listing every file moved and every file whose references were updated.
**Shared types:** Input: current plugin version, file system state. Output: migrated corpus + marker file + rollback manifest + summary report.
**Error handling:** Idempotent (no-ops on already-migrated corpus). Refuses to run on uncommitted changes. Partial migration (interrupted run) is recoverable by re-running. Cycle-in-progress edge case: migration should be run at phase boundary or between cycles, not mid-phase. Rollback is git-based — `git checkout` the pre-migration state; the rollback manifest is forensic, not operational.
**Owned by:** The Conformance Audit Skill owns the subcommand; git owns the underlying reversibility.

### Stop Hook → Advisory Mode Notice (pre-migration corpus — ADR-064) — NEW in v12.0
**Protocol:** In advisory mode (when `docs/housekeeping/.migration-version` is absent), the Stop hook emits a non-blocking stderr notice identifying the corpus as pre-migration, explaining that compound-check verification is disabled, and directing the user to `/rdd-conform migrate` as the opt-in path to enforcement. The notice fires once per session via a session-scoped suppression marker.
**Shared types:** Stderr text stream. Session suppression marker.
**Error handling:** The notice is ignorable — users can continue working in advisory mode indefinitely without functional degradation beyond the loss of harness-layer verification. No SessionStart self-test, no per-session error escalation, no rdd-doctor diagnostic are shipped at v1.
**Owned by:** The Tier 1 Phase Manifest Check Hook owns emission; the user owns the migration decision.

### Hook Script → GitHub Issue Template (Fails-Safe-to-Allow surfacing — ADR-064) — NEW in v12.0
**Protocol:** On hook internal error (YAML parse failure, missing file, shell error, exception), the hook emits a non-blocking stderr notice naming the hook, a short machine-readable diagnostic, and a pre-populated GitHub issue URL at `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md`. The issue template asks for plugin version, hook name, stderr diagnostic line, OS/shell environment, and sanitized copy of hook input JSON if available.
**Shared types:** Stderr text + GitHub issue URL with query parameters.
**Error handling:** The stderr notice is the error-handling mechanism — it converts silent-fail-to-allow into visible-and-ignorable. Users who ignore the notice experience the same degraded verification as the no-hook baseline. Users who contribute via the GitHub issue provide structured data for maintainer diagnosis.
**Owned by:** Both Tier 1 hooks own emission; the Hook Failure Issue Template owns the reporting surface; the maintainer owns diagnosis and fix.

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
| Inversion principle appears in 6 locations | Orchestrator (cross-cutting), Product Discovery (procedural), Decide (check), Architect (check), Play (gamemaster inversions), Synthesis (narrative) | All 6 present | ADR-010; ADR-017; ADR-039 |
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
| Plugin installs with all components discovered | `claude --plugin-dir ./rdd` loads 10 skills, 6 agents, 5 hooks | All components registered | ADR-034; ADR-038 |
| Skill namespace uses hyphen separator | Skills invoked as `/rdd-research`, `/rdd-decide`, etc. | All skill references use hyphen syntax | ADR-034 |
| Skill activator prevents brainstorming override | UserPromptSubmit hook fires on RDD-related prompts and injects priority context | Hook registered and functional | ADR-035 |
| Play Skill has three-movement structure | Presence of inhabit, explore, reflect movements in SKILL.md | All 3 movements present | ADR-038 |
| Play Skill does NOT have separate EPISTEMIC GATE section | Activity subsumes gate (ADR-016 pattern) | No EPISTEMIC GATE header | ADR-038; ADR-016 |
| Play Skill includes gamemaster behavior | Presence of role proposals, points of concentration, complications, inversions in SKILL.md | All 4 gamemaster functions present | ADR-039 |
| Gamemaster shapes attention, not conclusions | Gamemaster instructions describe attention-shaping; no conclusion-generation language | Invariant 3 boundary maintained in skill text | ADR-039; Invariant 3 |
| Decide Skill produces interaction specs after scenarios | Presence of interaction spec generation step in SKILL.md | Step present, executes after scenario writing | ADR-037 |
| Interaction specs organized by stakeholder | Template specifies stakeholder sections with super-objective, task, interaction mechanics | Structure present in decide skill template | ADR-037 |
| Play reads interaction specs as playable surface | Play Skill reads `./docs/interaction-specs.md` | Read instruction present | ADR-037; ADR-038 |
| Field notes categorized by 6 feedback destinations | Play Skill categorizes into: missing scenario, usability friction, new question, challenged assumption, delight, interaction gap | All 6 categories present | ADR-038 |
| Pipeline includes PLAY after BUILD | Orchestrator pipeline sequence and state table include PLAY | Phase present between BUILD and SYNTHESIS, marked optional | ADR-038 |
| Orchestrator artifact summary includes interaction specs and field notes | Artifacts Summary table has DECIDE row with interaction specs and PLAY row with field notes | Both rows present | ADR-037; ADR-038 |
| Play Skill uses Stanislavski inhabitation structure | Skill references super-objective (from discover), objective (from interaction specs), obstacle (discovered through play) | All 3 levels present | ADR-038; ADR-039 |
| Discover Skill reads field notes in update mode | Discover Skill update mode includes instruction to read prior field notes | Read instruction present | ADR-038 |
| Synthesis Skill reads field notes in artifact trail mining | Synthesis Skill includes field notes in artifact trail reading list | Read instruction present | ADR-038 |
| Research log archived at cycle end | Research skill archives log after reflections, not at start of next cycle | Archival step at cycle end in skill file | ADR-036 |
| Agents run at model-appropriate level | Auditors, lit-reviewer, conformance-scanner, orientation-writer on Sonnet; spike-runner inherits parent | Model selection in each agent's frontmatter | ADR-032 |
| Hooks are advisory, not blocking | All hooks use exit code 0 (context injection); none use exit code 2 | Hook scripts return 0 | ADR-033 |
| All four composable skills implement Context Gathering | Presence of 5-step protocol in each SKILL.md | All 4 skills (build, debug, refactor, review) have Context Gathering section | ADR-049 |
| Context Gathering step 4 adapts per skill | Each skill's step 4 synthesis emphasizes its specialized direction | Build: work decomposition; Debug: expected-vs-actual; Refactor: structural health; Review: design rationale | ADR-049 |
| All composable skills support both operating modes | Each SKILL.md offers pipeline and context-reconstructive modes | Mode detection present in all 4 skills | ADR-049; ADR-044 |
| Build skill produces work decomposition in context-reconstructive mode | Presence of work decomposition step with dependency classification | Step present, writes session artifact | ADR-051 |
| Session artifacts written to `session/` directory | Build skill writes facsimiles with `session-artifact: true` frontmatter | Session artifact writing logic present | ADR-050 |
| All composable skills prompt for time budget | Time budget prompt present during or after Context Gathering | Prompt present in all 4 skills | ADR-053 |
| Time budget adapts scope, not understanding quality | Focused mode retains orientation validation | Validation step present at all budget levels | ADR-053; Invariant 4 |
| Build composes via mode shifts, not dispatch | Build SKILL.md describes trigger conditions with context continuity, no re-orientation | Mode-shift language (not dispatch/invoke) for debug/refactor/review | ADR-054 |
| Debug skill names the misunderstanding | Debug SKILL.md requires naming what the mental model was wrong about before fixing | Naming step present in hypothesis-trace-understand-fix cycle | ADR-048; Essay 011 §6 |
| Refactor skill includes AI Smell Taxonomy | Refactor SKILL.md level 1 includes classical + AI-exacerbated catalogs | Both catalogs present in diagnostic step | ADR-052 |
| AI hygiene prompts separate from smell detection | Refactor SKILL.md runs novel-pattern prompts separately from level 1 | Hygiene prompts in separate section, not in smell catalog | ADR-052 |
| Refactoring committed as structure change | Refactor skill instruction specifies `refactor:` commit prefix | Commit guidance present | ADR-052; Essay 011 §5 |
| Plugin installs with all components including new skills | Plugin loads 12 skills (was 10), 6 agents, 5 hooks | All components registered | ADR-034; ADR-048 |
| Orchestrator Available Skills includes debug and refactor | rdd/SKILL.md Available Skills table has rows for both | Both rows present | ADR-048 |
| Inversion Principle uses belief-mapping form | All skill EPISTEMIC GATE sections and Orchestrator cross-cutting; ADR-010 amendment note present | Belief-mapping framing present; adversarial framing absent as default | ADR-055; ADR-010 (amended) |
| AID cycle deploys six question forms | Orchestrator protocol and all phase skill gates reference question toolkit | All 6 forms available; phase-specific mapping documented | ADR-056 |
| Question forms are non-formulaic | Gate prompts compose forms with specific artifact content | No template recitation; each instance references specific content | ADR-056 (hard constraint) |
| AID Attend reads susceptibility signals | Orchestrator AID protocol includes assertion density, narrowing, framing adoption, embedded conclusions | Susceptibility signals listed alongside engagement signals | ADR-057 |
| Susceptibility Snapshot produced at every phase boundary | Orchestrator dispatches susceptibility-snapshot-evaluator at phase transitions | Dispatch present at all phase boundaries (Tier 1) | ADR-057; ADR-058 |
| Susceptibility Snapshot outputs handled via Grounding Reframe | Orchestrator processes snapshot findings as actionable fork | Not dismissible without engagement | ADR-057; ADR-058; ADR-059 |
| Tier 1 mechanisms fire unconditionally | Specialist audits, susceptibility snapshots, research methods review | Not subject to context-dependent relaxation | ADR-058 |
| Tier 2 mechanisms adapt to context | Question form selection, constraint intensity, assertion-aware observation | Calibrated by multidimensional rubric | ADR-058 |
| Grounding Reframe offers concrete actions | Orchestrator pattern: names uncertainty + offers grounding actions + makes visible cost of proceeding | Pattern present; not a disclaimer | ADR-059 |
| Research Methods Subagent fires before each loop | Research Skill dispatches before first loop AND after substantial revision | Multi-loop dispatch present | ADR-060 |
| Argument Auditor produces two-section output | Agent system prompt includes argument audit + framing audit | Both sections specified | ADR-061 |
| Framing audit asks three structural questions | Alternative framings, absent truths, dominant framing inversion | All 3 questions present | ADR-061 |
| Assertion-aware observation is semantic | AID Attend includes embedded conclusion detection; no lexical pattern matching | Semantic assessment present; no confidence-marker patterns | ADR-062 |
| Essay is checkpoint for RESEARCH phase | Research Skill enforces essay revision before pipeline advances after substantial reframing | Essay revision + re-audit loop present | DECIDE gate; Essay 013 §6 |
| Plugin installs with 8 agents | `claude --plugin-dir ./rdd` loads all agents including research-methods-reviewer and susceptibility-snapshot-evaluator | All 8 agents registered | ADR-032; ADR-060; ADR-057 |
| Invariant 8 is named in orchestrator cross-cutting principles | rdd/SKILL.md contains "Mechanism execution must be structurally anchored" or equivalent Invariant 8 language | Invariant 8 text present | Invariant 8; ADR-067 |
| Three-Tier Enforcement Classification is documented in orchestrator | rdd/SKILL.md describes Skill-Structure Layer, Harness Layer, User-Tooling Layer, and four-step decision procedure | Classification table + decision procedure present | ADR-067 |
| Every phase skill contains a Phase Boundary: Susceptibility Snapshot Dispatch subsection | All 8 phase skills (research, discover, model, decide, architect, build, play, synthesize) | Subsection present in every phase skill | ADR-065 Fix 1 |
| Phase Boundary Susceptibility Snapshot dispatch is at structurally privileged position | Subsection located in bottom third of each phase skill file | All 8 phase skills pass position audit | ADR-065 Fix 1; Spike S4 |
| Every Tier 1 dispatch prompt contains canonical Output path line | All citation-auditor, argument-auditor, research-methods-reviewer, susceptibility-snapshot-evaluator dispatches | Literal `Output path:` line present in every dispatch | ADR-065 Fix 2 |
| No Tier 1 dispatch site is in the middle third of its skill file | All existing dispatch sites (citation-auditor in research, argument-auditor in research/decide, research-methods-reviewer in research) audited | All sites at top or bottom third | ADR-065 Fix 3; Spike S4 |
| Susceptibility snapshot dispatch is anchored in phase skills, not orchestrator | Orchestrator no longer directly dispatches susceptibility-snapshot-evaluator | Dispatch removed from rdd/SKILL.md; per-phase dispatch present in all 8 phase skills | ADR-065 Fix 1 |
| Per-phase briefs for susceptibility snapshot are phase-specific, not generic | Each phase skill's snapshot dispatch instruction provides phase-specific brief content | Each brief names the phase, its AID signals, and cross-phase context | ADR-065 Fix 1 |
| Tier 1 phase manifest exists at canonical path | `hooks/manifests/tier1-phase-manifest.yaml` present | File exists with `format_version: 1` and required phases | ADR-063 |
| Manifest includes all Tier 1 mechanisms for all 8 phases | research, discover, model, decide, architect, build, play, synthesize phases each have required_mechanisms entries | Manifest entries complete | ADR-063; ADR-065; ADR-066 |
| Manifest entries include audited_documents for revision-aware reminder | argument-auditor entries include `audited_documents` glob patterns | Field present for audit mechanisms | ADR-064 |
| Manifest entries include gate reflection note mechanism | Each phase's required_mechanisms includes `aid-cycle-gate-reflection` | Entry present with `min_bytes: 800` and required headers | ADR-066 |
| Tier 1 Verify Dispatch Hook exists and fires on PostToolUse Agent | `hooks/scripts/tier1-verify-dispatch.sh` exists; `hooks.json` registers PostToolUse matcher on Agent | Hook registered and functional | ADR-064 |
| Tier 1 Phase Manifest Check Hook exists and fires on Stop | `hooks/scripts/tier1-phase-manifest-check.sh` exists; `hooks.json` registers Stop hook | Hook registered and functional | ADR-064 |
| Dispatch log schema matches ADR-064 specification | JSONL entries at `docs/housekeeping/dispatch-log.jsonl` contain `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}` | Schema compliant | ADR-064 |
| Dispatch log is gitignored | `.gitignore` contains `docs/housekeeping/dispatch-log.jsonl` entry | Entry present | ADR-064 |
| Compound check distinguishes four failure modes | Stop hook produces distinct block reasons: never-dispatched, failed-to-write, fabricated, malformed | Four reason types present in hook logic | ADR-064 |
| Compound check catches sophisticated State C in enforcement mode | Fabricating both artifact and dispatch log entry requires injecting fake PostToolUse event | Structural guarantee documented and tested | ADR-064 |
| Compound check's structural guarantee is qualified as enforcement-mode-only | System design and ADR text note that advisory mode does not hold the guarantee | Qualification present | ADR-064 |
| Advisory mode activates when housekeeping directory is absent | Stop hook emits non-blocking stderr notice on pre-migration corpus | Notice emitted; no block | ADR-064 |
| Enforcement mode activates when migration version marker is present | Stop hook runs compound check and blocks on failures | Enforcement behavior active post-migration | ADR-064; ADR-070 |
| Advisory mode notice fires once per session | Session-scoped suppression marker prevents repeat notices | Once-per-session behavior | ADR-064 |
| Fails-Safe-to-Allow with GitHub issue surfacing on hook internal error | Hook error emits non-blocking stderr notice with `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md` URL | Notice format compliant | ADR-064 |
| Hook failure issue template exists | `.github/ISSUE_TEMPLATE/hook-failure.md` present with required fields | Template present | ADR-064 |
| Revision-aware re-audit reminder is non-blocking | Stop hook emits model-visible reminder alongside `allow` when audited document mtime exceeds last dispatch | Reminder behavior: non-blocking, model-visible | ADR-064 |
| Revision-aware reminder substantiality judgment is human, not mechanical | Hook surfaces the temporal condition; user + agent decide whether re-audit is warranted | Decision remains epistemic, not enforced | ADR-064 |
| Gate reflection note produced at every phase boundary | Orchestrator writes note at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md` before declaring phase complete | Note present at every phase boundary | ADR-066 |
| Gate reflection note format matches ADR-066 template | Note contains 5 required headers (`# Gate Reflection:`, `## Belief-mapping question composed for this gate`, `## User's response`, `## Pedagogical move selected`, `## Commitment gating outputs`) and 4 required fields | Template compliant | ADR-066 |
| Gate reflection note omits engagement interpretation | Note content captures pedagogical move without narrating the interpretation that drove selection | AID privacy respected across media | ADR-066; Cycle 10 feedback memory |
| Gate reflection note minimum size floor is 800 bytes | Manifest entry for `aid-cycle-gate-reflection` specifies `min_bytes: 800` | Size floor present | ADR-066 |
| Compound defense names three components | System design documents manifest check + susceptibility snapshot + belief-mapping as non-overlapping coverage zones | Three components named and attributed | ADR-066 |
| Compound defense is extensible without renaming | Future additions join the compound defense without requiring a rename | Extensibility documented | ADR-066 |
| Reframe-derailed gate limitation is explicitly named | System design and ADR-066 document the limitation; future ADRs citing User-Tooling Layer inherit the obligation to name it | Limitation documented | ADR-066 |
| Grounding Reframe protocol has two triggers | Protocol fires on unassessable sycophancy risk (ADR-059) AND significant snapshot findings (ADR-068) | Both triggers documented in orchestrator | ADR-068 |
| Three significance properties are documented | Orchestrator describes specificity, actionability, in-cycle applicability as calibration for the judgment term "significant" | Properties present | ADR-068 |
| Snapshot findings drive in-cycle course correction at their own boundary | Orchestrator operates under the principle that findings meeting significance properties trigger the protocol at the boundary where they surface, rather than feeding forward | Principle documented | ADR-068; DISCOVER settled premise 4 |
| Methodology scope-of-claim is documented | System design and orchestrator name the positive scope (competent first-order analysis, Tier 1 mechanisms, conversational mechanisms, compound defense, architectural drivers) and negative scope (no independent second-order critique; guarantee rests on mechanisms firing; **compound check's structural guarantee applies only in enforcement mode — pre-migration corpora operate with skill-structure fix but without harness-layer compound verification**) | Scope-of-claim present with both negative-scope items visible at the orchestrator level | ADR-069; ADR-064 |
| Failure mode / success mode dichotomy is documented as a watch item | System design notes the dichotomy is built on seven failure-mode instances and one success-mode instance; future cycles will refine | Dichotomy present; empirical base noted | ADR-069 |
| Provenance via architectural drivers is primary, provenance check subsections are selective | DECIDE phase produces ADRs with drivers doing the primary attribution work; provenance check subsections used when ADRs carry non-driver content | Policy documented in orchestrator and DECIDE skill | ADR-069; FC-C refinement |
| Housekeeping directory exists post-migration | `docs/housekeeping/` with `audits/`, `gates/`, `cycle-status.md`, `.migration-version`, `dispatch-log.jsonl` | Directory structure present on migrated corpus | ADR-064; ADR-070 |
| Centered-vs-infrastructure framing is documented in orchestrator | rdd/SKILL.md describes the distinction between centered and infrastructure artifacts | Framing present as cross-cutting principle | ADR-064; DECIDE 2026-04-09 |
| `/rdd-conform migrate` subcommand exists | rdd-conform SKILL.md describes the migrate subcommand with 10-step operation | Subcommand documented | ADR-070 |
| `/rdd-conform migrate` is idempotent | Re-running on migrated corpus no-ops via marker file check | Idempotency verified | ADR-070 |
| `/rdd-conform migrate` refuses uncommitted skill changes | Operation checks `git status` and refuses to run if skills/ has unstaged modifications | Refusal behavior verified | ADR-070 |
| `/rdd-conform migrate` produces summary report | Operation lists every file moved and every file whose references were updated | Report produced | ADR-070 |
| `/rdd-conform migrate` produces rollback manifest | Operation writes `docs/housekeeping/.migration-rollback.json` for forensics | Manifest produced | ADR-070 |
| `/rdd-conform migrate` does not touch cycle-archive | Archived cycles retain pre-migration paths | Non-migration verified | ADR-070 |
| `/rdd-conform migrate` does not touch reflections and research-logs | These are centered artifacts, not infrastructure | Non-migration verified | ADR-070 |
| rdd-conform has housekeeping directory organization audit scope | `/rdd-conform` audit mode checks housekeeping directory structure | Audit scope present | ADR-070 |
| rdd-conform has gate reflection note template alignment audit scope | `/rdd-conform` audit mode checks gate reflection notes against canonical template | Audit scope present | ADR-070; ADR-066 |
| rdd-conform has dispatch prompt format audit scope | `/rdd-conform` audit mode checks skill files for canonical prompt skeleton and privileged position | Audit scope present | ADR-070; ADR-065 |
| rdd-conform audits do not auto-correct | All three new audit scopes produce finding reports; user acts on reports | No auto-correction | ADR-070 |
| Plugin installs with 7 hooks | `claude --plugin-dir ./rdd` loads 5 existing hooks + 2 new Tier 1 hooks | 7 hooks registered | ADR-033; ADR-064 |

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
| Orchestrator → Play Skill | Read Play SKILL.md; verify three-movement structure (inhabit, explore, reflect); verify NO separate EPISTEMIC GATE section; verify gamemaster behavior present; verify Stanislavski structure; verify field notes categorization | ADR-038, ADR-039 play contract |
| Decide Skill → interaction-specs.md | Read Decide SKILL.md; verify interaction spec generation step after scenarios; verify stakeholder-organized template with super-objective, task, interaction mechanics | ADR-037 interaction spec contract |
| Play Skill → interaction-specs.md | Read Play SKILL.md; verify it reads `./docs/interaction-specs.md` for playable surface; verify gamemaster draws objectives from interaction specs | ADR-037, ADR-038 playable surface contract |
| Play Skill → product-discovery.md | Read Play SKILL.md; verify it reads product discovery for stakeholder roles and super-objectives | ADR-038, ADR-039 inhabitation contract |
| Play Skill → field-notes.md | Read Play SKILL.md; verify field notes written to `./docs/essays/reflections/field-notes.md`; verify 6 categories; verify no-fix-prescription rule | ADR-038 field notes contract |
| Play Skill → field-guide.md | Read Play SKILL.md; verify it reads field guide as "map of the territory" during play | ADR-038 field guide/notes pairing |
| Discover Skill ← field-notes.md | Read Discover SKILL.md; verify update mode reads prior field notes; verify usability friction → value tensions, challenged assumptions → inversions | ADR-038 play feedback loop |
| Synthesis Skill ← field-notes.md | Read Synthesis SKILL.md; verify artifact trail mining includes field notes; verify delight entries as candidate novelty signals | ADR-038 play-synthesis contract |
| Epistemic Gate Enforcer → Play phase | Verify hook recognizes play subsumes its gate (like synthesis) and does not fire "missing gate" reminder | ADR-038 hook behavioral update |
| Orchestrator → Play in pipeline | Read Orchestrator SKILL.md; verify PLAY appears after BUILD, before SYNTHESIS in workflow modes; verify state table includes PLAY; verify artifact summary includes interaction-specs.md and field-notes.md; verify cross-phase integration rules include play feedback | ADR-037, ADR-038 orchestrator integration |
| Plugin Manifest → Runtime (updated) | Install via `--plugin-dir`; verify 12 skills (was 10), 6 agents, 5 hooks discovered | ADR-034; ADR-048 updated plugin discovery |
| Build Skill → Context Gathering | Read Build SKILL.md; verify 5-step Context Gathering protocol present; verify step 4 emphasizes work decomposition and testable behaviors; verify mode detection (pipeline/context-reconstructive); verify user validation step | ADR-049 Context Gathering contract |
| Debug Skill → Context Gathering | Read Debug SKILL.md; verify 5-step Context Gathering protocol present; verify step 4 emphasizes expected-vs-actual divergence | ADR-049 Context Gathering contract |
| Refactor Skill → Context Gathering | Read Refactor SKILL.md; verify 5-step Context Gathering protocol present; verify step 4 emphasizes structural health and architectural intent | ADR-049 Context Gathering contract |
| Build Skill → Work Decomposition | Read Build SKILL.md; verify work decomposition step in context-reconstructive mode; verify dependency classification (hard/implied/open) with heuristic note; verify session artifact writing | ADR-051 work decomposition contract |
| Build Skill → Session Artifacts | Read Build SKILL.md; verify `session/` directory convention; verify `session-artifact: true` frontmatter; verify stewardship reads session artifacts | ADR-050 session artifact contract |
| Build Skill → Debug (mode shift) | Read Build SKILL.md; verify unexpected failure triggers debug mode with context continuity (not dispatch/invoke language); verify no re-orientation occurs | ADR-054 mode-shift composition |
| Build Skill → Refactor (mode shift) | Read Build SKILL.md; verify after-green and stewardship triggers refactor mode with context continuity; verify `refactor:` commit instruction | ADR-054 mode-shift composition |
| Build Skill → Review (mode shift) | Read Build SKILL.md; verify stewardship checkpoint triggers review mode with context continuity; verify supersedes ADR-046 callout | ADR-054 mode-shift composition |
| Debug Skill → hypothesis-trace cycle | Read Debug SKILL.md; verify hypothesis-trace-understand-fix cycle present; verify misunderstanding-naming step before fix | ADR-048 debug epistemic contract |
| Refactor Skill → Three-Level Refactor | Read Refactor SKILL.md; verify level 1 (classical + AI-exacerbated smells), level 2 (patterns with inverse pairs), level 3 (methodology — architectural intent check) | ADR-052 three-level refactor contract |
| Refactor Skill → AI Hygiene Prompts | Read Refactor SKILL.md; verify hygiene prompts (Constraint Decay, Slopsquatting, Intent Debt) present as separate section from level 1 smell detection | ADR-052 hygiene prompt separation |
| Build/Debug/Refactor/Review → Time Budget | Read all 4 SKILL.md files; verify time budget prompt present; verify scope adaptation along continuous spectrum; verify orientation validation never skipped at any level | ADR-053 time budget contract |
| Orchestrator → Debug/Refactor in Available Skills | Read Orchestrator SKILL.md; verify Available Skills table includes `/rdd-debug` and `/rdd-refactor` with purpose and invocation descriptions | ADR-048 orchestrator integration |
| Phase Skill → Susceptibility Snapshot (per-phase dispatch, all 8 phases) | Read each phase skill (research, discover, model, decide, architect, build, play, synthesize); verify "Phase Boundary: Susceptibility Snapshot Dispatch" subsection is present at bottom-third position with canonical prompt skeleton including `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md` (or `docs/essays/audits/...` pre-migration) | ADR-065 Fix 1 per-phase dispatch contract |
| Existing Tier 1 Dispatches → Canonical Prompt Skeleton | Read Research SKILL.md, Decide SKILL.md, Synthesis SKILL.md; verify citation-auditor, argument-auditor, research-methods-reviewer dispatches include literal `Output path:` line with canonical path | ADR-065 Fix 2 |
| All Tier 1 Dispatch Sites → Structurally Privileged Position | Read all skill files with Tier 1 dispatches; verify no dispatch site is in the middle third of its skill file | ADR-065 Fix 3; Spike S4 |
| PostToolUse on Agent → Dispatch Log | Dispatch any Tier 1 subagent via Task tool; verify `tier1-verify-dispatch.sh` hook fires and appends JSONL entry to `docs/housekeeping/dispatch-log.jsonl` with correct schema | ADR-064 PostToolUse contract |
| PostToolUse on Agent → Non-Tier-1 Silence | Dispatch a non-Tier-1 subagent; verify hook exits silently without modifying dispatch log | ADR-064 scope discipline |
| PostToolUse on Agent → Missing Output Path Graceful Degradation | Dispatch a Tier 1 subagent with a prompt lacking the `Output path:` line; verify hook logs entry with `expected_path: null` | ADR-064 graceful degradation |
| Stop Hook → Manifest Structural Assertions | With manifest present and a Tier 1 artifact at canonical path; verify Stop hook evaluates file existence, size floor, required headers, required fields | ADR-063, ADR-064 structural assertion contract |
| Stop Hook → Compound Cross-Reference (enforcement mode) | With migration marker present; stage an artifact at canonical path without a matching dispatch log entry; verify Stop hook emits `block` with "artifact exists but no corresponding dispatch was logged" reason | ADR-064 compound check |
| Stop Hook → Four Failure Modes | Stage each of the four failure modes (never-dispatched, failed-to-write, fabricated, malformed); verify Stop hook emits distinct block reasons | ADR-064 failure mode distinction |
| Stop Hook → Advisory Mode | Remove `docs/housekeeping/`; verify Stop hook emits non-blocking stderr notice once per session directing to `/rdd-conform migrate`; verify methodology continues to function | ADR-064 advisory mode |
| Stop Hook → Enforcement Mode Transition | Run `/rdd-conform migrate`; verify `docs/housekeeping/.migration-version` is written; verify next Stop event enters enforcement mode and runs compound check | ADR-064, ADR-070 mode transition |
| Stop Hook → Fails-Safe-to-Allow | Induce internal error in Stop hook (malformed manifest, missing cycle-status); verify hook emits `allow` with stderr GitHub issue surfacing notice | ADR-064 failure handling |
| Stop Hook → Revision-Aware Reminder | Modify an audited essay after an argument-auditor dispatch; verify Stop hook emits non-blocking model-visible reminder naming the audited document and timestamps | ADR-064 revision-aware reminder |
| Orchestrator → Gate Reflection Note (pipeline mode) | Complete a phase boundary in pipeline mode; verify gate reflection note is written at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md` with 5 required headers and 4 required fields; verify engagement interpretation is NOT captured in the note | ADR-066 gate reflection note contract |
| Phase Skill → Gate Reflection Note (standalone mode) | Invoke any phase skill standalone; verify skill produces gate reflection note at canonical path when completing its gate | ADR-066; ADR-002 |
| Stop Hook → Gate Reflection Note Enforcement | With corpus in enforcement mode; complete phase conversation but skip writing the gate reflection note; verify Stop hook emits `block` with reason naming the missing note | ADR-066; ADR-064 |
| Orchestrator → Invariant 8 Documentation | Read rdd/SKILL.md; verify Invariant 8 is named in cross-cutting principles (or equivalent text about mechanism execution being structurally anchored) | Invariant 8; ADR-067 |
| Orchestrator → Three-Tier Classification | Read rdd/SKILL.md; verify Skill-Structure Layer, Harness Layer, User-Tooling Layer are documented with four-step decision procedure | ADR-067 |
| Orchestrator → Grounding Reframe Extension | Read rdd/SKILL.md; verify Grounding Reframe protocol has two triggers (unassessable risk + significant snapshot findings) and three significance properties | ADR-068 |
| Orchestrator → Methodology Scope-of-Claim | Read rdd/SKILL.md; verify positive scope (competent first-order analysis, Tier 1 mechanisms, conversational mechanisms, compound defense, architectural drivers) and negative scope (no independent second-order critique; compound check's structural guarantee applies only in enforcement mode) are both documented | ADR-069; ADR-064 (enforcement-mode qualification) |
| Orchestrator → Centered-vs-Infrastructure Framing | Read rdd/SKILL.md; verify framing is documented as cross-cutting principle and directs infrastructure artifacts to `docs/housekeeping/` | ADR-064; DECIDE 2026-04-09 |
| Tier 1 Phase Manifest → File Existence and Schema | Read `hooks/manifests/tier1-phase-manifest.yaml`; verify `format_version: 1`; verify all 8 phases present; verify required_mechanisms per phase include susceptibility-snapshot-evaluator and aid-cycle-gate-reflection at minimum | ADR-063; ADR-066 |
| Conformance Audit Skill → `/rdd-conform migrate` | Read rdd-conform SKILL.md; verify migrate subcommand is documented with 10-step operation, idempotency check, uncommitted-changes refusal, rollback manifest, summary report | ADR-070 migrate contract |
| Conformance Audit Skill → Three New Audit Scopes | Read rdd-conform SKILL.md; verify housekeeping directory organization audit, gate reflection note template alignment audit, dispatch prompt format audit are all documented | ADR-070; ADR-064; ADR-066; ADR-065 |
| Conformance Audit Skill → Migration Idempotency | Run `/rdd-conform migrate` twice on the same corpus; verify second run no-ops | ADR-070 |
| Conformance Audit Skill → Migration Atomicity | Verify ADR-065 skill-file edits and ADR-070 path updates ship as a single atomic change (either both present or both absent post-plugin-release) | ADR-070 atomicity requirement |
| Hook Failure Issue Template | Read `.github/ISSUE_TEMPLATE/hook-failure.md`; verify template requests plugin version, hook name, stderr diagnostic, OS/shell environment, hook input JSON | ADR-064 surfacing design |
| Plugin Manifest → Runtime (updated v12.0) | Install via `--plugin-dir`; verify 15 skills, 8 agents, 7 hooks discovered; verify `hooks/manifests/tier1-phase-manifest.yaml` is present alongside hook scripts | ADR-034; ADR-064 |

### Invariant Enforcement Tests

| Invariant | Enforcement Location | Test |
|-----------|---------------------|------|
| 0: User can speak with authority about what was built, who it was built for, and why | Pipeline-wide (cumulative); Product Discovery Skill (product dimension); Play Skill (experiential dimension); Build Skill context-reconstructive mode (extends Invariant 0 to codebases without full pipeline via orientation validation); Debug Skill (names the misunderstanding — builds causal understanding) | Cannot be tested structurally — this is an outcome. Context-reconstructive mode extends Invariant 0 to the Everyday Developer; debug naming step builds the deepest layer of understanding |
| 1: Understanding requires generation | Each skill's gate section; Play Skill (three movements are inherently generative) | Verify every gate requires user to produce something; verify play's inhabit/explore/reflect are generative activities |
| 2: Epistemic acts mandatory at every gate | Each skill's gate section + orchestrator protocol; Play Skill (activity subsumes gate — ADR-016 pattern) | Verify no gate consists solely of approval; play verified by three-movement presence |
| 3: Pragmatic automated, epistemic preserved; Gamemaster: shapes attention (pragmatic form), not conclusions (epistemic) | Each skill; Play Skill (gamemaster boundary principle) | Verify skills have AI generation + epistemic gates; verify gamemaster shapes attention not conclusions |
| 4: Epistemic cost productive, not merely brief (amended) | Each skill's AID cycle at gate; Orchestrator protocol | Verify gates use AID cycle (not fixed prompts); verify no "5-10 minute" references remain; verify teaching mode expands when needed |
| 5: Approval is not grounding | Orchestrator protocol | Verify protocol includes epistemic acts, not just approval |
| 6: Scaffolding must fade | Not enforced in v1 — tracked as debt | ADR-005 revisit trigger |
| 7: Epistemic acts bidirectional | Orchestrator feed-forward instruction; Product Discovery gate (user → AI direction especially strong) | Verify orchestrator instructs AI to reference prior gate responses; Product Discovery gate surfaces tacit product knowledge |
| 8: Mechanism execution must be structurally anchored | Skill-Structure Layer (phase skills own Tier 1 dispatch sites at privileged positions with canonical prompt skeleton — ADR-065); Harness Layer (Tier 1 Verify Dispatch Hook + Tier 1 Phase Manifest Check Hook + Per-Phase Manifest — ADR-063/064); User-Tooling Layer (AID cycle graduated to gate reflection note at canonical path — ADR-066); Orchestrator (defines Three-Tier Classification and four-step decision procedure — ADR-067) | Verify every unconditional structural mechanism is anchored to one of the three substrates; verify Tier 1 dispatch sites use canonical prompt skeleton at privileged positions; verify Per-Phase Manifest declares all Tier 1 mechanisms with path_template, min_bytes, required_headers, required_fields; verify Stop hook enforces compound check in enforcement mode; verify gate reflection notes produced at every phase boundary. **Current state:** Cycle 10 adds the infrastructure; the invariant is partly descriptive of what already works (citation, argument, research-methods auditors at 100% coverage per Spike S3) and partly prescriptive for what did not work (susceptibility snapshot at 0% historical coverage — addressed by ADR-065 Fix 1). |

### Test Layers

- **Unit:** Read each SKILL.md individually. Verify: EPISTEMIC GATE section exists, contains 2-3 prompts, prompts use exploratory framing, redirect for non-generative approval is present, discrepancy noting instruction is present. For Product Discovery Skill: verify forward mode, backward mode, update mode, all 5 artifact sections, assumption inversion step. For Play Skill: verify three-movement structure (no EPISTEMIC GATE section — activity subsumes gate), verify gamemaster behavior (4 functions), verify field notes template (6 categories), verify Stanislavski structure. For Conformance Audit Skill: verify four operations present. For each agent `.md` file: verify YAML frontmatter specifies model, verify system prompt specifies file I/O, verify no conversation history access. For each hook script: verify it reads JSON stdin, verify correct event matching, verify advisory exit code 0.
- **Integration:** Verify orchestrator protocol matches what skills implement. Verify workflow mode descriptions include PRODUCT DISCOVERY and PLAY. Verify feed-forward instruction exists. Verify Model/Decide/Architect skills read product discovery artifact. Verify Decide Skill produces interaction specs after scenarios. Verify Play Skill reads interaction specs, product discovery, and field guide. Verify Play field notes feed back to Discover (update mode), Decide, Research, and forward to Synthesis. Verify inversion principle appears in Orchestrator, Product Discovery, Decide, Architect, Play, Synthesis (6 locations). Verify three-tier artifact hierarchy includes roadmap (Tier 2) and field guide (Tier 3). Verify architect skill generates roadmap. Verify build skill generates field guide. Verify orchestrator supports scoped cycles and document sizing heuristics. Verify skill-to-agent dispatch: each phase skill that uses specialist work dispatches the corresponding agent (play dispatches none). Verify hook registration: all 5 hooks present in `hooks/hooks.json` with correct events and matchers; epistemic-gate-enforcer recognizes play subsumes its gate. Verify plugin discovery: `--plugin-dir` loads 10 skills, 6 agents, 5 hooks.
- **Acceptance:** The behavior scenarios in `scenarios.md` (228 existing + ~50 composable skill family from ADRs 048-054 = ~278 total). Verified by reading the modified files and confirming the described behavior is present in the prompt text.

## Roadmap

See [`./docs/roadmap.md`](./docs/roadmap.md) for the current roadmap — work packages, classified dependencies, transition states, and open decision points.

Prior cycles completed: Cycle 1 (ADRs 022-026: roadmap, field guide, sizing, conformance, scoped cycles), Cycle 2 (ADRs 027-030: synthesis enrichment), Cycle 3 (ADRs 031-036: plugin architecture), Cycle 4 (ADRs 037-039: interaction specs, play, gamemaster), Cycle 5 (ADRs 040-042: adaptive gates, reflection time, rdd-about), Cycle 6a (ADRs 043-047: code review), Cycle 6b (ADRs 048-054: composable skill family), Cycle 9 (ADRs 055-062: sycophancy resistance architecture). Current work packages address ADRs 063-070 (Cycle 10: structural enforcement architecture — Invariant 8 operationalization).

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
| 10 | 2026-03-30 | Adaptive gates, reflection time naming, and /rdd-about utility. Added 1 new module: About Skill (version reporting, methodology overview, depth-calibrated elaboration — utility, not pipeline phase). Updated 3 existing modules: Orchestrator (gate protocol becomes AID cycle with five pedagogical moves; adds pace regulator framing; Available Skills includes /rdd-about; optionally offers /rdd-about for fresh projects), Epistemic Gate Enforcer Hook (recognizes AID adaptive prompts), all 6 phase skills (EPISTEMIC GATE sections updated from fixed templates to AID cycle; user-facing dialogue uses "reflection time"). Added 5 architectural drivers (amended Invariant 4, AID cycle, reflection time naming, Inversion Principle at gates, anti-sycophancy). Added 16-row responsibility matrix section (Adaptive Gate Concepts). Updated invariant enforcement tests (Invariant 4 amended — productive not brief). Supersedes ADR-003 (fixed-assignment prompt table replaced by AID cycle; ADR-003's prompts become candidate library). Conformance scan: 19 implementation-layer violations mapped with resolution sequence. | ADRs 040-042 (essay 009 adaptive gates cycle) | ADR-040 (AID cycle), ADR-041 (reflection time naming), ADR-042 (/rdd-about utility); Essay 009; Invariant 4 (Amendment 13 — productive not brief); Invariant 0 (understanding is the purpose); Inversion Principle (7th location at gates) | Proposed |
| 11 | 2026-04-02 | Composable skill family. Added 2 new modules: Debug Skill (hypothesis-trace-understand-fix cycle), Refactor Skill (three-level diagnostic-remediation with AI Smell Taxonomy). Amended 2 existing modules: Build Skill (rewritten as outer loop with Context Gathering protocol, context-reconstructive mode, work decomposition, session artifacts, time budget, mode-shift composition — replaces monolithic build), Review Skill (mode-shift composition from build supersedes ADR-046 callout). Updated Orchestrator (Available Skills includes debug and refactor; plugin count 10→12). Added 9 architectural drivers. Added 19-row responsibility matrix section (Composable Skill Family Concepts). Updated dependency graph (mode-shift edges within build; debug and refactor as standalone skills). Added 3 integration contracts (mode-shift composition, Context Gathering protocol, session artifacts). Added 17 fitness criteria. Added 16 boundary integration tests. Updated invariant enforcement (Invariant 0 extended via context-reconstructive mode and debug naming). Updated acceptance scenario count (228→~278). | ADRs 048-054 (essay 011 composable skill family cycle) | ADR-048 (composable skill family), ADR-049 (Context Gathering protocol), ADR-050 (session artifacts), ADR-051 (work decomposition), ADR-052 (AI smell detection), ADR-053 (time budget), ADR-054 (mode-shift composition); Essay 011; DECIDE gate: "mode shifts not dispatch; the thread is understanding" | Proposed |
| 9 | 2026-03-26 | Play phase and interaction specification layer. Added 1 new module: Play Skill (three-movement experiential discovery with gamemaster mode, field notes production — no specialist subagents, no separate epistemic gate). Updated 4 existing modules: Decide Skill (produces interaction specs after scenarios), Orchestrator (pipeline includes PLAY after BUILD, state tracking, artifact summary, cross-phase integration for play feedback), Product Discovery Skill (update mode reads field notes), Synthesis Skill (reads field notes in artifact trail mining). Added 6 architectural drivers. Added 16-row responsibility matrix section (Play and Interaction Specification Concepts). Updated dependency graph (inter-skill artifact flow includes interaction-specs.md and field-notes.md with feedback loop). Added 4 integration contracts (Orchestrator→Play, Decide→Play via interaction-specs, Play→Discover/Decide/Research via field-notes, Play→Synthesis via field-notes). Added 14 fitness criteria. Added 12 boundary integration tests. Updated invariant enforcement tests (play serves Invariant 0 experiential dimension; gamemaster boundary for Invariant 3). Updated test layers and acceptance scenario count (192 → 228). Updated inversion principle locations from 5 to 6. | ADRs 037-039 (essay 008 play/interaction-spec cycle) | ADR-037 (interaction specification layer), ADR-038 (play phase), ADR-039 (agent as gamemaster); Essay 008; Invariant 0 (experiential authority dimension), Invariant 3 (gamemaster boundary) | Proposed |
| 12 | 2026-04-06 | Sycophancy resistance architecture. Added 2 new specialist subagent modules: Research Methods Reviewer Agent (pre-execution research design review with belief-mapping, fires before each research loop after substantial revision — ADR-060), Susceptibility Snapshot Evaluator Agent (isolated evaluation of AID susceptibility signals at phase boundaries — ADR-057). Amended 3 existing modules: Orchestrator (AID protocol extended with susceptibility signals + question toolkit + assertion-aware observation; two-tier sycophancy resistance principle; Grounding Reframe pattern; belief-mapping as Inversion Principle form; essay-as-checkpoint for RESEARCH; agent dispatch updated 6→8 subagents), Research Skill (essay-as-checkpoint enforcement; dispatches research-methods-reviewer before each loop; argument-auditor dispatch now includes framing audit), Argument Auditor Agent (scope extended with framing audit — three structural questions surfacing alternative framings, absent truths, dominant framing inversion). Added 10 architectural drivers (belief-mapping form, question toolkit, AID susceptibility, two-tier resistance, Grounding Reframe, research methods subagent, framing audit, assertion-aware observation, essay as checkpoint). Added 22-row responsibility matrix section (Sycophancy Resistance Concepts from Essay 013 / ADRs 055-062). Updated dependency graph (2 new agents, 2 new dispatch edges). Added 3 integration contracts (Research→Research Methods Reviewer, Orchestrator→Susceptibility Snapshot Evaluator, Argument Auditor framing audit extension). Added 16 fitness criteria. Updated Inversion Principle locations (6→still 6, but form specified as belief-mapping). No new invariants; Authority concept annotated with limitation transparency. Key architectural property: two-tier resistance — Tier 1 unconditional (subagent audits, snapshots, research methods review) fires regardless of context; Tier 2 context-responsive (question form selection, constraint intensity, assertion-aware observation) calibrated by multidimensional rubric. The agent cannot self-exempt from Tier 1. ADR-062 revised during DECIDE from hook to AID observation based on user challenge (semantic assessment > lexical matching; accepted limitation named). Essay as checkpoint: the essay is where understanding crystallizes — every substantial change circles back to essay revision before pipeline advances. | ADRs 055-062 (essay 013 sycophancy and RDD reflexivity cycle) | ADR-055 (belief-mapping operationalization of Inversion Principle), ADR-056 (question toolkit for AID), ADR-057 (AID susceptibility extension), ADR-058 (unconditional architectural floor), ADR-059 (Grounding Reframe), ADR-060 (Research Methods Subagent), ADR-061 (framing audit as argument auditor extension), ADR-062 (assertion-aware observation in AID — revised from hook); Essay 013; Invariant 0 (limitation transparency annotation); DECIDE gate: essay as checkpoint + loop as defense + research phase iterability; MODEL gate: context-dependent performative/genuine classification + unconditional floor + grounding reframe | Proposed |
| 13 | 2026-04-09 | Structural enforcement architecture — operationalizing Invariant 8. Added Appendix A (Per-Phase Susceptibility Snapshot Briefs) as design-phase artifact for WP-B implementation. Added 4 new modules in the Harness Layer: Tier 1 Phase Manifest (`hooks/manifests/tier1-phase-manifest.yaml`), Tier 1 Verify Dispatch Hook (`hooks/scripts/tier1-verify-dispatch.sh`, PostToolUse on Agent), Tier 1 Phase Manifest Check Hook (`hooks/scripts/tier1-phase-manifest-check.sh`, Stop event), and Hook Failure Issue Template (`.github/ISSUE_TEMPLATE/hook-failure.md`). Amended 11 existing modules: Orchestrator (Invariant 8 cross-cutting principle + Three-Tier Enforcement Classification with four-step decision procedure + Grounding Reframe extension + methodology scope-of-claim + centered-vs-infrastructure framing + gate reflection note production + susceptibility snapshot dispatch delegated to phase skills), all 8 phase skills (per-phase Susceptibility Snapshot Dispatch subsection at bottom-third position with canonical prompt skeleton per ADR-065 Fix 1; existing Tier 1 dispatches audited against canonical prompt skeleton per Fix 2 and structurally privileged position per Fix 3; gate reflection note production at phase-end per ADR-066), Conformance Audit Skill (`/rdd-conform migrate` subcommand with 10-step operation + three new audit scopes: housekeeping directory organization, gate reflection note template alignment, dispatch prompt format), Susceptibility Snapshot Evaluator Agent (canonical phase-keyed output paths `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`). Added 24 architectural drivers (Invariant 8; per-phase manifest; compound check; skill-structure as primary substrate; canonical prompt skeleton; structurally privileged position; User-Tooling Layer graduates conversational mechanisms; compound defense with three components; reframe-derailed gate limitation; Three-Tier Enforcement Classification; substrates not a priority hierarchy; Grounding Reframe extension; snapshot findings drive in-cycle course correction; methodology scope-of-claim; centered-vs-infrastructure framing; housekeeping directory; advisory vs enforcement mode; Fails-Safe-to-Allow; revision-aware reminder; provenance via architectural drivers is primary with provenance checks selective; advisory mode as UX commitment; rdd-conform scope extended with three audits; Layered Enforcement Adoption). Added 60+ row responsibility matrix section (Structural Enforcement Concepts from Essay 014 / ADRs 063-070). Updated dependency graph: 2 new hooks, 7 new skill→agent dispatch edges (per-phase susceptibility snapshot in each phase skill), removal of orchestrator→susceptibility-snapshot-evaluator direct dispatch (now anchored in phase skills), 10+ new Harness Layer edges. Added 10 integration contracts (Phase Skill → Susceptibility Snapshot Evaluator per-phase dispatch; PostToolUse on Agent → Dispatch Log; Stop → Compound Check; Orchestrator → Gate Reflection Note; Orchestrator → Grounding Reframe Extension; Conformance Audit Skill → `/rdd-conform migrate`; Stop Hook → Advisory Mode Notice; Hook Script → GitHub Issue Template). Added 47 fitness criteria covering Invariant 8 coverage, Three-Tier Classification documentation, per-phase dispatch presence at privileged positions, canonical prompt skeleton compliance, manifest schema and completeness, dispatch log schema, compound check behavior in both modes, Fails-Safe-to-Allow semantics, gate reflection note format and AID privacy, compound defense naming, Grounding Reframe extension with three significance properties, methodology scope-of-claim documentation, housekeeping directory structure post-migration, `/rdd-conform migrate` idempotency and atomicity, and three new audit scopes. Added 27 boundary integration tests for the new modules and edges. Added Invariant 8 enforcement test to the invariant tests table. Updated plugin discovery count: 7 hooks (was 5). Key architectural property: Three-Tier Enforcement Classification where substrates are context-dependent matches between mechanism type and enforcement technique, not a priority hierarchy; unified principle across all three substrates is "anchor the mechanism to a concrete, mechanically-unavoidable step with observable output." Cycle 10 is partly descriptive (many phase transitions already meet the anchoring criterion — citation/argument/research-methods auditors at 100% coverage per Spike S3) and partly prescriptive (the susceptibility snapshot at 0% historical coverage is the canonical failure case Cycle 10's diagnostic addresses). Advisory mode respects user-as-non-maintainer position: `/rdd-conform migrate` is opt-in; methodology continues to function in advisory mode without compound-check enforcement. Compound defense has three components (manifest check + snapshot + belief-mapping) covering non-overlapping failure modes of the engagement-degradation threat; extensible without renaming. Reframe-derailed gate limitation is explicitly named — User-Tooling Layer provides floor enforcement, not ceiling verification. Methodology scope-of-claim (ADR-069) names what the methodology guarantees (competent first-order analysis, Tier 1 structural resistance, conversational mechanisms inviting user second-order engagement, compound defense, architectural drivers provenance) and what it does not (independent second-order critique by agent alone — guarantee rests on mechanisms firing, which Invariant 8 structurally enforces). | ADRs 063-070 (Essay 014 specification-execution gap cycle); Invariant 8 (new, Cycle 10 MODEL amendment — broad scope covering any unconditional structural mechanism, not only Cycle 9's Tier 1 sycophancy-resistance architecture) | ADR-063 (Per-Phase Manifest Format); ADR-064 (Compound Check — PostToolUse Dispatch Log + Stop Manifest Verification); ADR-065 (Anchor Dispatch — Skill-Structure Fix with Fix 1 per-phase susceptibility snapshot dispatch + Fix 2 canonical prompt skeleton + Fix 3 position audit); ADR-066 (User-Tooling Layer — Graduating AID Cycle to Gate Reflection Note); ADR-067 (Three-Tier Enforcement Classification as Methodology-Level Taxonomy); ADR-068 (Grounding Reframe Extension — Fire on Significant Snapshot Findings); ADR-069 (Methodology Scope-of-Claim — Competence Without Independent Second-Order Critique); ADR-070 (Housekeeping Directory Migration and rdd-conform Scope Extension); Essay 014 (Specification-Execution Gap); Spike S1 (hook feasibility); Spike S2 (manifest format + reference Stop hook); Spike S3 (corpus audit — 100% vs. 0% coverage); Spike S4 (position effects — lost in the middle); Invariant 8; DECIDE gate: advisory mode as UX commitment (FC-A refinement) + centered-vs-infrastructure framing (FC-B refinement) + provenance via drivers (FC-C refinement); MODEL gate: broad scope for Invariant 8 + reframe-derailed gate limitation + compound defense pattern naming | Proposed |

## Appendix A: Per-Phase Susceptibility Snapshot Briefs (Cycle 10, WP-B deliverable)

This appendix holds the canonical brief content for each of the 8 phase skills' `Phase Boundary: Susceptibility Snapshot Dispatch` subsection. The briefs are phase-specific per ADR-056's non-formulaic requirement — each references concrete Cycle 10 findings where applicable and names the specific risks that phase is most vulnerable to.

**Structural wrapping (applied identically to all 8 phase skills):**

```
## Phase Boundary: Susceptibility Snapshot Dispatch

Before completing this phase, dispatch the susceptibility-snapshot-evaluator:

Dispatch the susceptibility-snapshot-evaluator subagent with the following brief:

<phase-specific brief content from Appendix A>

Output path: <pre-migration or post-migration canonical path from Appendix A>
```

The appendix records the pre-migration paths (`docs/essays/audits/...`). When `/rdd-conform migrate` runs in v0.7.1, the operation rewrites these to `docs/housekeeping/audits/...` in lockstep with the docs migration.

### A.1 Research phase (`skills/research/SKILL.md`)

> This is the research → discover boundary. Research carries the highest sycophancy gradient in the methodology (Essay 013; Cycle 9). The primary risk at this boundary is framing adoption at essay crystallization moments — the "softer than sycophancy but real" pattern documented four times in Cycle 10's own research phase (see susceptibility-snapshot-014-research.md). The AID cycle's recorded signals for this phase are attached. Evaluate whether the essay that is about to enter downstream phases has been shaped by framings absorbed at synthesis moments without competing frames being independently surfaced — particularly where the essay's argumentative backbone crystallized. Pay attention to moments where user-provided framings became load-bearing without belief-mapping against alternatives.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-research.md

### A.2 Discover phase (`skills/discover/SKILL.md`)

> This is the discover → model boundary. Product discovery crystallizes user-facing language (stakeholder maps, value tensions, assumption inversions, product vocabulary) into an artifact that model and decide both inherit. The canonical failure mode at this boundary was documented in Cycle 10's own discover phase (susceptibility-snapshot-014-discover.md Finding 1): research-phase framings propagating into product vocabulary and value tensions without attribution. Evaluate the attached AID signals for two specific patterns: (a) research-essay framings inherited into product-facing language without being tested against user voice, and (b) value tensions that surfaced as spectra but collapsed into binary framings without the alternatives being examined. The product discovery artifact entering model phase should read in user voice, not methodology voice.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-discover.md

### A.3 Model phase (`skills/model/SKILL.md`)

> This is the model → decide boundary. Model phase extracts domain vocabulary and, when consequential, amends invariants — the highest-stakes commitment type in the methodology because invariants constrain every downstream artifact. The canonical failure mode at this boundary was documented in Cycle 10's own MODEL phase (susceptibility-snapshot-014-model.md Finding 1): an invariant commitment moved from flag to acceptance in two exchanges; user-stated preference preceded implications analysis; alternatives were not engaged at comparable depth. Evaluate the attached AID signals for warrant-elicitation failures and preference-accelerated commitments. For any invariant amendment or consequential concept addition in this phase, check whether belief-mapping was performed before adoption — not after. The test is whether the user could name what they would need to believe for a different commitment to be right.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-model.md

### A.4 Decide phase (`skills/decide/SKILL.md`)

> This is the decide → architect boundary. Decide phase produces ADRs, behavior scenarios, and interaction specifications. The primary risk is that ADR framings originate from agent synthesis during drafting rather than from architectural drivers (research findings, domain model concepts, prior ADRs). Cycle 10's ADRs 063-070 introduced the provenance check subsection pattern specifically to make drafting-time synthesis visible as labeled content — so the absence of a provenance check from an ADR whose framings are not driver-derived is itself a signal. Evaluate the attached AID signals for rebuttal-elicitation failures on rejected alternatives, and for cross-ADR compositions where one ADR's framing was adopted by another within the same cycle without being independently tested. Check whether each ADR's core framing traces to its driver chain or to drafting-time composition.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-decide.md

### A.5 Architect phase (`skills/architect/SKILL.md`)

> This is the architect → build boundary. Architect phase composes modules from the domain model, ADRs, and scenarios. The specific risk is that module boundaries and responsibility allocations encode unexamined assumptions — particularly the assumption that a boundary serves the developer's mental model when it should serve the user's. The Inversion Principle check at architecture is the designed counterweight but can be performed pro forma. Evaluate the attached AID signals for solution-space narrowing on boundary choices and framing adoption from DECIDE-phase ADRs (the system design inherits ADR framings — was the inheritance examined or automatic?). Check whether the proposed module boundaries would survive a product-facing reading: do they track user mental models or only developer convenience?
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-architect.md

### A.6 Build phase (`skills/build/SKILL.md`)

> This is the build phase boundary (typically build → play or build → [cycle end]). Build is the most empirically grounded phase per the sycophancy gradient — test execution grounds commitments in observable outcomes, which resists framing adoption more structurally than earlier phases. The residual risks are in the spaces tests do not reach: stewardship-checkpoint commitments that adopt rejected-alternative framings without surfacing them, debug hypotheses that absorb a "this must be because X" framing without belief-mapping X, and mode-shift transitions (debug/refactor/review) where the user's mental model may drift without being tested. Evaluate the attached AID signals with build's empirical grounding as the baseline — concerning signals here are patterns the tests did not catch. Pay particular attention to any work package commitment that closed without examining an alternative the scenarios did not specify.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-build.md

### A.7 Play phase (`skills/play/SKILL.md`)

> This is the play → synthesize boundary (or play → [next cycle] if synthesize is deferred). Play produces field notes from stakeholder inhabitation and gamemaster-facilitated exploration. The specific risk at this boundary is that field notes flatten from observation into advocacy — discoveries that "confirm the design" crowd out discoveries that challenge it. Two signal patterns matter most for this phase: (a) selection bias in the six-category classification (are categories being applied asymmetrically to suppress challenging observations?), and (b) gamemaster/player role blur under task load, where the same agent proposes inversions AND inhabits — the inversions may be selected to serve the inhabitation rather than challenge it. Evaluate the attached AID signals for framing adoption in field note language (user voice vs. methodology voice) and for declining alternative engagement on discoveries that would challenge the design. The field notes entering synthesize should read as observation, not endorsement.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-play.md

### A.8 Synthesize phase (`skills/synthesize/SKILL.md`)

> This is the synthesize phase boundary (typically terminal for the cycle; or synthesize → research re-entry if structural experiments surface new questions). Synthesis is the canonical location where the "softer than sycophancy but real" framing-adoption pattern was first named in Cycle 10 — narrative framings composed at synthesis moments carry the highest risk because they shape what the cycle will be remembered as. The four-dimension framing navigation (discovery type, narrative form, audience constraint, epistemic posture) provides structural scaffolding, but the framings that emerge can still be shaped by synthesis-moment adoption. Evaluate the attached AID signals with particular emphasis on framing adoption and declining alternative engagement during the framing conversation. The outline about to become the writer's essay should carry framings the writer owns, not framings they inherited from agent composition or from the artifact trail without examining the alternatives.
>
> Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-synthesize.md

### Maintenance note for future cycles

Each brief references a concrete Cycle 10 finding where applicable (research phase: four framing-adoption moments; discover phase: Finding 1 of susceptibility-snapshot-014-discover.md; model phase: Finding 1 of susceptibility-snapshot-014-model.md; decide phase: the provenance check pattern from ADRs 063-070). These references are anchored in time. As future cycles accumulate additional evidence, the briefs may need updating — either by adding new canonical cases or by generalizing the existing references. A candidate refresh trigger: when a subsequent cycle produces a new phase-boundary canonical failure mode that the current brief does not reference. The `/rdd-conform` dispatch prompt format audit scope (ADR-070) verifies structural compliance with the canonical skeleton but does not audit brief content substance — brief refresh is a deliberate cycle operation, not an automated one.
