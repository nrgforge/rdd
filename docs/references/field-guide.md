# Field Guide: Pedagogical RDD

**Updated:** 2026-04-06
**Derived from:** System Design v11.0, current implementation (SKILL.md files, agent files)

## How to Use This Guide

This guide maps the system design's modules to their current implementation state. Each module is a single SKILL.md file — the "code" in this meta-project is prompt text that instructs an AI agent. For the overall architecture, read the system design. For routing to the right document, read ORIENTATION.md.

---

## Module: Orchestrator

**Implementation state:** Complete
**Code location:** `skills/rdd/SKILL.md`
**Stability:** In flux — accumulates cross-cutting principles with each RDD cycle

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Pipeline | Workflow Modes section (Modes A-D) | SKILL.md §WORKFLOW MODES |
| Epistemic Gate (protocol) | Stage Gates section | SKILL.md §ORCHESTRATION RULES |
| Feed-Forward (enrichment) | Feed-Forward section + status table "Key Epistemic Response" column | SKILL.md §Feed-Forward |
| Artifact Hierarchy (three-tier) | ORIENTATION.md section + Artifacts Summary | SKILL.md §Orientation Document, §Artifacts Summary |
| Inversion Principle (cross-cutting) | Cross-Phase Integration bullet | SKILL.md §Cross-Phase Integration |
| Document Sizing Heuristics | Five cascading heuristics | SKILL.md §IMPORTANT PRINCIPLES |
| Scoped Cycle | Scoped Cycles section | SKILL.md §Scoped Cycles |
| Deep Work Tool (framing) | Opening paragraph | SKILL.md line 10 |
| Question Toolkit (six forms) | Six research-grounded question forms with goal-first composition process | SKILL.md §Question Toolkit |
| Two-Tier Sycophancy Resistance | Tier 1 (unconditional architectural) + Tier 2 (context-responsive) separation | SKILL.md §Two-Tier Sycophancy Resistance |
| Grounding Reframe (pattern) | Three-step naming/offering/making-visible pattern | SKILL.md §Grounding Reframe |
| Essay-as-checkpoint (cross-cutting) | Enforces essay revision before pipeline advances past RESEARCH | SKILL.md §Essay as Research Phase Checkpoint |
| Susceptibility Snapshot Dispatch | Tier 1 dispatch of susceptibility-snapshot-evaluator at every phase boundary | SKILL.md §Susceptibility Snapshot Dispatch |

### Design Rationale

The orchestrator is the only module that depends on nothing and is depended on by everything. It defines the contract (epistemic gate protocol) that all skills implement. It does NOT contain phase logic — each skill owns its own process. The orchestrator's job is sequencing, cross-cutting principles, and state tracking.

The "compiled rollup" principle means the system design absorbs upstream context so downstream phases don't need the full artifact trail. The orchestrator enforces this by instructing `/rdd-build` to read system-design.md as its primary context.

### Key Integration Points

- All Phase Skills — defines the epistemic gate protocol they must implement
- ORIENTATION.md — defines regeneration milestones and five-section structure
- Conformance Audit Skill — lists it in Available Skills table (user invokes as needed)

---

## Module: Research Skill

**Implementation state:** Complete
**Code location:** `skills/research/SKILL.md`
**Stability:** In flux — Cycle 9 added research methods review dispatch, framing audit, essay-as-checkpoint

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Research Loop | Loop Mechanics (question → research → synthesize → decide) | SKILL.md §PROCESS |
| Spike | Spike Rules section with constraints | SKILL.md §Spike Rules |
| Essay (artifact) | Step 4: Essay with Abstract, body structure | SKILL.md §Step 4 |
| Citation Audit (invocation) | Step 4a: invoke `/citation-audit` | SKILL.md §Step 4a |
| Argument Audit (invocation) | Step 4b: invoke `/argument-audit` | SKILL.md §Step 4b |
| Epistemic Gate | EPISTEMIC GATE section with reflection prompts | SKILL.md §EPISTEMIC GATE |
| Reflection (artifact) | Step 5: Record Reflections with feed-back loop | SKILL.md §Step 5 |
| Research Methods Review (invocation) | Step 1b: dispatch research-methods-reviewer before every research loop | SKILL.md §Step 1b |
| Argument Audit with Framing Audit (invocation) | Step 4b: framing audit runs unconditionally alongside argument audit | SKILL.md §Step 4b |
| Essay-as-checkpoint (enforcement) | Framing audit P1 issues block pipeline advance; re-audit after revision | SKILL.md §Step 4b, §Step 5 |

### Design Rationale

Research is the only phase that loops — question → investigate → synthesize → repeat. The essay is the forcing function: if you can't write it clearly, you don't understand it. The citation and argument audits before the epistemic gate ensure the essay entering downstream phases is vetted.

### Key Integration Points

- Citation Audit Skill (external) — invoked on essay before gate
- Argument Audit Skill (external) — invoked on essay after citation audit
- Product Discovery Skill (via essay file) — reads the essay as input

---

## Module: Product Discovery Skill

**Implementation state:** Complete
**Code location:** `skills/discover/SKILL.md`
**Stability:** Settled — three modes (forward, backward, update) fully implemented

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Product Discovery (three modes) | Mode detection table + Steps 2a/2b/2c | SKILL.md §Step 1, §Steps 2a-2c |
| Stakeholder Map | Section 1 of artifact template | SKILL.md §Section 1 |
| User Mental Model | Section 2 (Jobs and Mental Models) | SKILL.md §Section 2 |
| Value Tension | Section 3 of artifact template | SKILL.md §Section 3 |
| Assumption Inversion | Section 4 — procedural home of Inversion Principle | SKILL.md §Section 4 |
| Product Vocabulary | Section 5 — feeds domain model Product Origin column | SKILL.md §Section 5 |
| Product Conformance (backward) | Step 2b: extract implicit assumptions, validate, produce debt table | SKILL.md §Step 2b |

### Design Rationale

The skill runs in every pipeline cycle past RESEARCH — even when `product-discovery.md` exists. Update mode (Step 2c) is the most common case. Backward mode exists for systems that have never had product discovery. The artifact is written in user language — a non-technical stakeholder should be able to read it.

### Key Integration Points

- Model Skill (via product-discovery.md) — Product Vocabulary Table feeds Product Origin column
- Decide Skill (via product-discovery.md) — Assumption Inversions become candidate scenarios
- Architect Skill (via product-discovery.md) — Provenance chains extend to stakeholder/job/value

---

## Module: Model Skill

**Implementation state:** Complete
**Code location:** `skills/model/SKILL.md`
**Stability:** Settled

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Domain Model (artifact) | Concepts, Actions, Relationships, Invariants, Open Questions tables | SKILL.md §Step 2 |
| Product Origin (provenance) | Product Origin column in Concepts table | SKILL.md §Step 2 template |
| Invariant (constitutional authority) | Step 3.5: Constitutional Authority section | SKILL.md §Step 3.5 |
| Amendment Log | Amendment Log table in domain model template | SKILL.md §Step 2 template |

### Design Rationale

Invariants are the highest-authority artifact. The Constitutional Authority step (3.5) ensures that invariant changes trigger propagation. The model is deliberately lightweight — a glossary, not a class diagram.

### Key Integration Points

- All downstream skills — vocabulary is binding; code must use glossary terms
- Decide Skill (via domain-model.md) — vocabulary constrains ADRs and scenarios

---

## Module: Decide Skill

**Implementation state:** Complete
**Code location:** `skills/decide/SKILL.md`
**Stability:** Settled

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| ADR (artifact) | ADR template with Status/Context/Decision/Consequences | SKILL.md §Step 2 |
| Argument Audit (invocation) | Step 3: invoke `/argument-audit` on ADRs + essay | SKILL.md §Step 3 |
| Conformance Audit (code vs. ADRs) | Step 3.5: scan codebase for ADR violations | SKILL.md §Step 3.5 |
| Backward Propagation | Step 3.7: sweep prior docs when invariants change | SKILL.md §Step 3.7 |
| Behavior Scenario (artifact) | Step 4: Given/When/Then format with integration scenarios | SKILL.md §Step 4 |

### Design Rationale

ADRs capture the "why" behind decisions; scenarios capture the "what" the system must do. The argument audit after ADRs ensures decisions follow logically from research. Conformance audit catches existing code that contradicts ADRs, producing debt that informs scenario writing.

### Key Integration Points

- Argument Audit Skill (external) — invoked on ADRs
- Architect Skill (via ADR + scenario files) — ADRs constrain module boundaries
- Build Skill (via scenarios.md) — scenarios drive TDD

---

## Module: Architect Skill

**Implementation state:** Complete
**Code location:** `skills/architect/SKILL.md`
**Stability:** In flux — roadmap generation (Step 11) added in Essay 005 cycle

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| System Design (artifact) | System Design Template with 10 sections | SKILL.md §SYSTEM DESIGN TEMPLATE |
| Responsibility Matrix | Step 5: every concept/action → one owning module | SKILL.md §Step 5 |
| Dependency Graph | Step 6: directed edges, no cycles, layering rules | SKILL.md §Step 6 |
| Fitness Criteria | Step 9: measurable architectural guardrails | SKILL.md §Step 9 |
| Roadmap (artifact) | Step 11: work packages, dependency classification, transition states | SKILL.md §Step 11 |
| Work Package | Step 11 subsection: name, objective, changes, scenarios, dependencies | SKILL.md §Derive Work Packages |
| Dependency Classification | Hard dependency / implied logic / open choice | SKILL.md §Classify Dependencies |
| Transition State | Coherent intermediate architecture | SKILL.md §Describe Transition States |
| Design Amendment | Amendment Process (propose → trace → approve → apply → log) | SKILL.md §DESIGN AMENDMENTS |

### Design Rationale

The responsibility matrix is the central artifact — it prevents god-classes by making ownership explicit before code exists. The roadmap was separated from the system design (ADR-022) because sequencing context has different audiences and change rates than architectural structure.

### Key Integration Points

- Build Skill (via system-design.md + roadmap.md) — system design is the primary context document
- Orchestrator (via ORIENTATION.md) — roadmap appears at Tier 2

---

## Module: Build Skill

**Implementation state:** Complete
**Code location:** `skills/build/SKILL.md`
**Stability:** In flux — field guide generation (Step 6) and stewardship checkpoints added in Essay 005 cycle

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| BDD Outer Loop | Step 2: one scenario at a time, acceptance test first | SKILL.md §Step 2 |
| TDD Inner Loop | Step 3: red/green/refactor | SKILL.md §Step 3 |
| Structure vs. Behavior | Two kinds of changes, never mixed | SKILL.md §STRUCTURE VS. BEHAVIOR |
| Tidying | Exhale-inhale rhythm, tidying checklist | SKILL.md §TIDYING |
| Stewardship Checkpoints | Tier 1 (lightweight) and Tier 2 (deep review) | SKILL.md §STEWARDSHIP CHECKPOINTS |
| Design Amendment (from build) | Amendment process when build reveals design flaw | SKILL.md §DESIGN AMENDMENTS |
| Field Guide (artifact) | Step 6: module-to-implementation mapping | SKILL.md §Step 6 |

### Design Rationale

The build skill is the longest SKILL.md because it carries the most operational guidance — TDD mechanics, tidying philosophy, stewardship checkpoint protocol, and design amendment process. The field guide bridges the gap between architectural intent (system design) and actual code (implementation).

### Key Integration Points

- System Design (via system-design.md) — primary context document
- Stewardship Checkpoints — verify code conforms to system design during build
- Synthesis Skill (via artifact trail) — synthesis reads the build's outputs

---

## Module: Synthesis Skill

**Implementation state:** Complete
**Code location:** `skills/synthesize/SKILL.md`
**Stability:** Settled

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Artifact Trail Mining | Step 1: read full trail | SKILL.md §Step 1 |
| Novelty Signal (five signals) | Step 2: detect volta, contra-essay, hidden protagonist, method surprise, thread | SKILL.md §Step 2 |
| Three-Phase Conversation | Journey review → novelty surfacing → framing | SKILL.md §Steps 2-4 |
| Worth-the-Calories Tests | Davis test, ABT test, inversion test | SKILL.md §Step 4 |
| Narrative Inversion Lenses | Three lenses during framing | SKILL.md §Step 4 |
| Outline (artifact) | Pre-populated references, citation-audited, argument-audited | SKILL.md §Step 5 |

### Design Rationale

Unique architectural property: the three-phase conversation subsumes the epistemic gate (ADR-016). No separate EPISTEMIC GATE section. The writer writes the essay — the agent only produces the outline. This is the only phase where the user explicitly does the generative work outside the pipeline.

### Key Integration Points

- Full artifact trail (via files) — reads everything, not just the preceding phase's output
- Citation Audit Skill (external) — invoked on outline references
- Argument Audit Skill (external) — invoked on outline after citation audit
- Orchestrator (context loading) — synthesis essay becomes context source for future sessions

---

## Module: Conformance Audit Skill

**Implementation state:** Complete
**Code location:** `skills/conform/SKILL.md`
**Stability:** In flux — first implementation; graduation operation is "open design territory" per the skill text

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Conformance Audit (four operations) | Operations table + four operation sections | SKILL.md §OPERATIONS |
| Audit (template alignment) | Operation 1: scan corpus against skill files | SKILL.md §Operation 1 |
| Remediation | Operation 2: generate missing content for structural gaps | SKILL.md §Operation 2 |
| Documentation Drift (detection) | Operation 3: compare artifacts vs. implementation | SKILL.md §Operation 3 |
| Graduation (knowledge migration) | Operation 4: durable/scaffolding/ambiguous classification | SKILL.md §Operation 4 |
| Documentation Fatigue (signal) | Referenced in graduation context | SKILL.md §Operation 4 |

### Design Rationale

This is NOT a pipeline phase — it's a utility invoked as needed. All four operations are pragmatic actions (Invariant 3). The two-level severity classification (structural/format) prevents format obsession from blocking real work. Graduation is explicitly flagged as "open design territory" — the framework will be refined through practice.

Distinct from product conformance (ADR-008, `/rdd-discover` backward mode), which checks product assumptions against user needs.

### Key Integration Points

- All SKILL.md files (input) — reads skill files to determine expected artifact structure
- All artifact files (input) — reads corpus to compare against expectations
- Orchestrator — listed in Available Skills table

---

## Module: Research Methods Reviewer Agent

**Implementation state:** Complete
**Code location:** `agents/research-methods-reviewer.md`
**Stability:** In flux — NEW in v11.0; will be calibrated through practice

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Belief-Mapping (question evaluation) | Per-question: "What would the researcher need to believe for a different question to be more productive?" | agents/research-methods-reviewer.md §Belief-Mapping |
| Embedded Conclusion Detection | Flags questions presupposing their answer; suggests reformulation | agents/research-methods-reviewer.md §Embedded Conclusion Detection |
| Premature Narrowing (question set) | Flags when the question set as a whole narrows prematurely | agents/research-methods-reviewer.md §Premature Narrowing |

### Design Rationale

Architectural Isolation is the point: the reviewer runs in a fresh context before research executes, with no stake in the questions it evaluates. Tier 1 unconditional mechanism — fires before every research loop and again after substantial essay revision. Output is a structured review artifact at `./docs/essays/audits/research-design-review-NNN.md`; the user decides whether to adopt, adapt, or keep original formulations.

### Key Integration Points

- Research Skill (caller) — dispatched at Step 1b and after substantial revisions
- Research log and prior essays (input) — provides prior research context

---

## Module: Susceptibility Snapshot Evaluator Agent

**Implementation state:** Complete
**Code location:** `agents/susceptibility-snapshot-evaluator.md`
**Stability:** In flux — NEW in v11.0; will be calibrated through practice

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Susceptibility Signals (six) | Assertion density, narrowing, framing adoption, confidence markers, declining alternative engagement, embedded conclusions | agents/susceptibility-snapshot-evaluator.md §Input |
| Signal Assessment (three dimensions) | Strength × Trajectory × Phase Context (sycophancy gradient) | agents/susceptibility-snapshot-evaluator.md §Signal Assessment |
| Pattern Interpretation | Earned confidence vs. sycophantic reinforcement distinction | agents/susceptibility-snapshot-evaluator.md §Pattern Interpretation |
| Grounding Reframe Recommendation | Recommends when multiple signals converge + early phase + downstream inheritance | agents/susceptibility-snapshot-evaluator.md §Grounding Reframe Recommendation |
| Self-Correction Blind Spot (exploit) | Fresh context treats prior output as external input | agents/susceptibility-snapshot-evaluator.md §opening |

### Design Rationale

The agent's isolation is its entire value proposition. The in-conversation agent cannot reliably self-assess sycophancy because it is inside the conversation. The snapshot evaluator runs at every phase boundary (Tier 1 unconditional), reads recorded signals as external input, and produces a structured advisory artifact. It does not block pipeline advancement — it informs via the Grounding Reframe pattern. Grounding action outcomes feed back into subsequent evaluations.

### Key Integration Points

- Orchestrator (caller) — dispatched at every phase boundary
- Phase skills (standalone caller) — each skill handles its own dispatch when invoked outside the orchestrator
- Prior snapshots (input) — reads earlier snapshots for trajectory assessment

---

## Module: Argument Auditor Agent

**Implementation state:** Complete
**Code location:** `agents/argument-auditor.md`
**Stability:** Settled — AMENDED in v11.0: framing audit added as unconditional second section

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Argument Audit (Section 1) | Maps inferential chains, verifies logical soundness, hidden assumptions, scope accuracy | agents/argument-auditor.md §Process |
| Framing Audit (Section 2) | Three structural questions: alternative framings, absent truths, dominant framing inversion | agents/argument-auditor.md §Section 2 |
| Source Material Reading | Reads the full evidence base alongside the artifact for framing comparison | agents/argument-auditor.md §Input |
| Belief-Mapping (framing) | "What would the reader need to believe for this alternative framing to be right?" | agents/argument-auditor.md §Question 1 |

### Design Rationale

The two-section output is a Tier 1 unconditional mechanism. The framing audit makes the negative space of content selection visible — what the evidence supported but the artifact didn't choose. Both sections run on every dispatch; the framing audit is not optional. Known limitation (P3-B): the framing auditor is itself subject to content selection; architectural isolation reduces but does not eliminate this.

### Key Integration Points

- Research Skill (caller) — dispatched after citation audit on essays
- Decide Skill (caller) — dispatched after ADRs written
- Synthesis Skill (caller) — dispatched after citation audit on outlines
