# Field Guide: Pedagogical RDD

**Updated:** 2026-04-28
**Derived from:** System Design v14.0 Amendment #15, current implementation (SKILL.md files, agent files, Harness Layer hook scripts and manifest)

## How to Use This Guide

This guide maps the system design's modules to their current implementation state. Each skill module is a single SKILL.md file — the "code" in this meta-project is prompt text that instructs an AI agent. Each Harness Layer module is a bash or YAML file operating at the Claude Code runtime level. For the overall architecture, start with the slim `system-design.md`; for the dense reference detail (architectural drivers, responsibility matrix, integration contracts, fitness criteria) consult the companion `system-design.agents.md` (ADR-084 Pattern B). For routing to the right document, read `ORIENTATION.md`.

**Cycle 016 / 017 amendments reflected here:** ADR-084 Pattern B companion file (system-design.agents.md); ADR-085 `.rdd/` infrastructure relocation (path migration from `.rdd/` to `.rdd/`); ADR-088 / ADR-089 advisory-disposition demotion (Stop-hook manifest check is advisory across all modes, with skill-text anchoring as the load-bearing enforcement layer); ADR-090 In-Progress Phase field role-shift (advisory-noise suppressor scoped to per-phase manifest advisory only). Cycle 016 added preservation scenarios (ADR-075), Cycle Acceptance Criteria Table (ADR-073, BUILD Step 5.5), supersession workflow (ADR-074), Cycle Stack schema (ADR-078–081), question-isolation protocol (ADR-082), and applicability check at BUILD pattern reuse (ADR-077).

**Path placement note.** Hook scripts read both placements transparently: `.rdd/...` (canonical post-ADR-085) takes precedence; `.rdd/...` (legacy ADR-070) is the fallback. Pre-migration corpora continue to operate; the migration is opt-in via `/rdd-conform migrate-to-rdd` (Operation 10).

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
**Stability:** In flux — Cycle 9 added research methods review dispatch, framing audit, essay-as-checkpoint; Cycle 016 added Step 1: Question-Isolation Entry Protocol (ADR-082) with constraint-removal as primary form; Cycle 017 added Step 4c: Validation-Spike Decision (ADR-087)

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Question-Isolation Entry Protocol (ADR-082) | Step 1: form questions before consulting existing artifacts; constraint-removal as primary form | SKILL.md §Step 1 |
| Research Loop | Loop Mechanics (question → research → synthesize → decide) | SKILL.md §PROCESS |
| Spike | Spike Rules section with constraints | SKILL.md §Spike Rules |
| Essay (artifact) | Step 4: Essay with Abstract, body structure | SKILL.md §Step 4 |
| Citation Audit (invocation) | Step 4a: invoke `/citation-audit` | SKILL.md §Step 4a |
| Argument Audit (invocation) | Step 4b: invoke `/argument-audit` | SKILL.md §Step 4b |
| Validation-Spike Decision (ADR-087) | Step 4c: optional tightly-scoped prototyping at research → discover gate; felt-trigger question + rationale-recording | SKILL.md §Step 4c |
| Epistemic Gate | EPISTEMIC GATE section with reflection prompts | SKILL.md §EPISTEMIC GATE |
| Reflection (artifact) | Step 5: Record Reflections with feed-back loop | SKILL.md §Step 5 |
| Research Methods Review (invocation) | Step 1b: dispatch research-methods-reviewer before every research loop | SKILL.md §Step 1b |
| Argument Audit with Framing Audit (invocation) | Step 4b: framing audit runs unconditionally alongside argument audit | SKILL.md §Step 4b |
| Essay-as-checkpoint (enforcement) | Framing audit P1 issues advise pipeline pause until revision + re-audit | SKILL.md §Step 4b, §Step 5 |

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
**Stability:** In flux — Cycle 016 added preservation scenarios (ADR-075), Cycle Acceptance Criteria Table (ADR-073), ADR supersession workflow (ADR-074 with body-immutability + IETF Updates/Obsoletes); Cycle 017 used the supersession workflow on ADR-064/067/070 (eight new ADRs 083–090)

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| ADR (artifact) | ADR template with Status/Context/Decision/Consequences | SKILL.md §Step 2 |
| Preservation Scenario (ADR-075) | Negative-space complement to behavior scenarios; specifies invariants that must hold under change | SKILL.md §Preservation Scenarios |
| Cycle Acceptance Criteria Table (ADR-073) | Top-of-scenarios.md table with Criterion / Specified Layer / Verification Method / Layer-Match for emergent or aggregate criteria; null-coverage judgment when all criteria are atomic | SKILL.md §Cycle Acceptance Criteria |
| Supersession Workflow (ADR-074) | Body-immutability + Status field mutability + IETF-style Updates/Obsoletes header + mandatory four-artifact downstream sweep (system-design.md / ORIENTATION.md / domain-model.md / field-guide.md) | SKILL.md §ADR Supersession |
| Argument Audit (invocation) | Step 3: invoke `/argument-audit` on ADRs + essay | SKILL.md §Step 3 |
| Conformance Audit (code vs. ADRs) | Step 3.5: scan codebase for ADR violations | SKILL.md §Step 3.5 |
| Backward Propagation | Step 3.7: sweep prior docs when invariants change | SKILL.md §Step 3.7 |
| Behavior Scenario (artifact) | Step 4: Given/When/Then format with integration scenarios | SKILL.md §Step 4 |
| Interaction Specification (ADR-039) | Workflow-level task decomposition by stakeholder; appended to interaction-specs.md | SKILL.md §Interaction Specifications |

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
**Stability:** In flux — field guide generation (Step 6) and stewardship checkpoints added in Essay 005 cycle; Cycle 015 added Lifecycle Composition (ADR-071) as a third axis to N+M+1 with three-sided catch (design-time, verification-time, review-time); Cycle 016 added Step 5.5 Cycle Criterion Verification (ADR-073) and Tier 1b Applicability Check at pattern reuse (ADR-077)

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| BDD Outer Loop | Step 2: one scenario at a time, acceptance test first | SKILL.md §Step 2 |
| TDD Inner Loop | Step 3: red/green/refactor | SKILL.md §Step 3 |
| Structure vs. Behavior | Two kinds of changes, never mixed | SKILL.md §STRUCTURE VS. BEHAVIOR |
| Tidying | Exhale-inhale rhythm, tidying checklist | SKILL.md §TIDYING |
| Lifecycle Composition (ADR-071) | Composable Tests § Lifecycle Composition; three-sided catch at design / verification / review | SKILL.md §COMPOSABLE TESTS, Step 5, Tier 1 sub-item 6e |
| Cycle Criterion Verification (ADR-073) | Step 5.5: walk Cycle Acceptance Criteria Table; verify each entry at its specified layer; layer-match `no` triggers integration-test gap closure | SKILL.md §Step 5.5 |
| Stewardship Checkpoints | Tier 1 (lightweight) and Tier 2 (deep review) | SKILL.md §STEWARDSHIP CHECKPOINTS |
| Applicability Check (ADR-077) | Tier 1b: triggered four-prompt form at pattern reuse; consults system-design.md fitness properties (per ADR-076) | SKILL.md §Tier 1b |
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

**Implementation state:** Complete (10 operations as of v0.8.4 — Cycle 017 added Graduation Check and Migrate to .rdd/)
**Code location:** `skills/conform/SKILL.md`
**Stability:** In flux — Cycle 017 added Operations 9 (Graduation Check) and 10 (Migrate to .rdd/); Cycle 016 added Operation 8 (Cycle-Shape Audit, ADR-081); the migrate operation (Operation 4, ADR-070) had Step 5 refinements in v0.7.2

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Conformance Audit (ten operations) | Operations table + ten operation sections | SKILL.md §OPERATIONS |
| Audit (template alignment) | Operation 1: scan corpus against skill files | SKILL.md §Operation 1 |
| Remediation | Operation 2: generate missing content for structural gaps | SKILL.md §Operation 2 |
| Documentation Drift (detection) | Operation 3: compare artifacts vs. implementation | SKILL.md §Operation 3 |
| Housekeeping Migration (ADR-070) | Operation 4: 10-step migrate subcommand | SKILL.md §Operation 4 |
| Housekeeping Directory Organization Audit | Operation 5: detect pre-migration state, orphans, In-Progress Phase soft notes (ADR-090) | SKILL.md §Operation 5 |
| Gate Reflection Note Template Alignment Audit | Operation 6: ADR-066 template compliance | SKILL.md §Operation 6 |
| Dispatch Prompt Format Audit | Operation 7: ADR-065 canonical skeleton and position verification | SKILL.md §Operation 7 |
| Cycle-Shape Audit (ADR-081) | Operation 8: detect pre-ADR-072 cycle-status entries; migrate to ADR-078 Cycle Stack schema | SKILL.md §Operation 8 |
| Graduation Check (Issue #17) | Operation 9: pre-graduation scan for code → doc dangling references (WP-[A-Z], ADR-NNN, Cycle-N, etc.) | SKILL.md §Operation 9 |
| Migrate to `.rdd/` (ADR-085) | Operation 10: relocate `docs/housekeeping/` → `.rdd/` with idempotency marker, hook test fixture sweep, summary report | SKILL.md §Operation 10 |

### Design Rationale

This is NOT a pipeline phase — it's a utility invoked as needed. All ten operations are pragmatic actions (Invariant 3). The two-level severity classification (structural/format) prevents format obsession from blocking real work. Operation 4 (Migrate, ADR-070) is opt-in and one-shot; Operation 10 (Migrate to `.rdd/`, ADR-085) is the post-Cycle-017 successor that relocates infrastructure to the dotfile-prefixed directory for process-vs-product separation. The methodology continues to operate in advisory disposition during the transition window — hook scripts read both placements transparently. Operations 5-7 verify structural conformance to the canonical layout, the ADR-066 gate reflection note template, and the ADR-065 canonical dispatch prompt skeleton. Operation 8 (Cycle-Shape Audit) walks the user through migrating pre-ADR-072 cycle-status entries; Operation 9 (Graduation Check) is the reverse-direction Tan et al. 2024 detection for code → doc dangling references.

Distinct from product conformance (ADR-008, `/rdd-discover` backward mode), which checks product assumptions against user needs.

### Key Integration Points

- All SKILL.md files (input) — reads skill files to determine expected artifact structure, verifies canonical dispatch skeleton in Operation 7
- All artifact files (input) — reads corpus to compare against expectations
- Operation 4 (ADR-070): `docs/essays/audits/` → `.rdd/audits/`, etc.
- Operation 10 (ADR-085): `docs/housekeeping/...` → `.rdd/...` with explicit hook test fixture inclusion
- `.rdd/.migration-version` (write) — marker that transitions Stop hook compound check to enforcement-mode reading
- Operation 9: codebase scan for `WP-[A-Z]`, `ADR-NNN`, `Cycle-N` patterns; report classifies matches as refactor / inline-gloss / historical record
- `/rdd-graduate` (downstream caller) — Step 1b references Operation 9 as the recommended pre-graduation scan
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

---

## Module: Tier 1 Phase Manifest (NEW in v0.7.0; path templates migrated to .rdd/ in v0.8.4 per ADR-085)

**Implementation state:** Complete
**Code location:** `hooks/manifests/tier1-phase-manifest.yaml`
**Stability:** Settled — format version 1; Cycle 016 added `applicable_when` precondition support (ADR-080) and `aid-cycle-gate-reflection` user-tooling entries (ADR-066); Cycle 017 migrated all `path_template` values from `docs/housekeeping/...` to `.rdd/...` per ADR-085

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Per-Phase Manifest | Top-level `phases:` dictionary keyed by phase name | tier1-phase-manifest.yaml §phases |
| Required Mechanism | Entry with `mechanism`, `path_template`, `min_bytes`, `required_headers`, `required_fields` | tier1-phase-manifest.yaml per mechanism |
| Structural Assertion (S1 size floor) | `min_bytes` field | per mechanism |
| Structural Assertion (S2 required headers) | `required_headers` list | per mechanism |
| Structural Assertion (S3 required fields) | `required_fields` list | per mechanism |
| Audited Documents (revision-aware reminder) | `audited_documents` glob list | citation/argument auditor entries |
| Mechanism Type (subagent vs user-tooling) | `mechanism_type: user-tooling` field (default: subagent) | aid-cycle-gate-reflection entries |
| Artifact Type (predicate matching) | `artifact_type: aid-cycle-gate-reflection` for ADR-079 in-progress-gate predicate | per gate-reflection entry |
| Applicable When (ADR-080) | `applicable_when` list with primitives: `cycle_type_in`, `cycle_type_not_in`, `phase_not_skipped`, `parent_cycle_present`, `parent_cycle_absent` | per mechanism |
| Token Substitution | `{cycle}` and `{phase}` placeholders in `path_template` | per mechanism |
| Canonical Path (ADR-085) | All `path_template` values use `.rdd/audits/...` and `.rdd/gates/...`; hooks fall back to `docs/housekeeping/...` for pre-migration corpora | per mechanism |

### Design Rationale

The manifest is the single source of truth for phase-boundary Tier 1 obligations. It is consumed by the Stop hook's compound check (`tier1-phase-manifest-check.sh`). Per ADR-088 (Cycle 017), the manifest check is advisory across all modes — failures emit model-visible advisories rather than blocking. Play and synthesize phases are deliberately exempt from `aid-cycle-gate-reflection` entries because both subsume their gates (ADR-016, ADR-038). The `mechanism_type: user-tooling` distinction (v0.7.2) exempts orchestrator-produced artifacts from compound check (ADR-066). The `applicable_when` extension (Cycle 016, ADR-080) enables scope-adaptive enforcement: mechanisms can be conditioned on cycle type, parent-cycle presence, or skipped-phase enumeration. The Cycle 017 path migration to `.rdd/` paths is transparent — hook scripts apply legacy fallback so pre-migration corpora continue to operate.

### Key Integration Points

- `tier1-phase-manifest-check.sh` (consumer) — parses YAML at Stop event time; resolves paths via `.rdd/` → `docs/housekeeping/` cascade
- `tier1-verify-dispatch.sh` (consumer) — writes dispatch log entries that the Stop hook cross-references via two-form matching
- `/rdd-conform migrate-to-rdd` (Operation 10) — substitution sweep updated this file's path templates as part of the Cycle 017 migration

---

## Module: Tier 1 Dispatch Logger Hook (NEW in v0.7.0; .rdd/ path support added in v0.8.4 per ADR-085)

**Implementation state:** Complete
**Code location:** `hooks/scripts/tier1-verify-dispatch.sh`
**Stability:** Settled — Cycle 017 added `.rdd/` directory-presence selection per ADR-085

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| PostToolUse Hook (Agent matcher) | Fires on every Agent tool call | hooks/hooks.json §PostToolUse |
| Tier 1 Mechanism Filter | `TIER1_MECHANISMS` space-separated list | tier1-verify-dispatch.sh:20 |
| Plugin Namespace Stripping | `${SUBAGENT_TYPE#*:}` parameter expansion | tier1-verify-dispatch.sh §normalize |
| Output Path Extraction | Regex match on `^Output path: ` in tool prompt with markdown-formatted variants | tier1-verify-dispatch.sh §extract |
| Dispatch Log Location Selection (ADR-085) | Directory-presence cascade: `.rdd/` (canonical) → `docs/housekeeping/` (legacy) → `.rdd/` (fresh corpus default) | tier1-verify-dispatch.sh §init |
| Dispatch Log Entry | JSONL append with timestamp, session, mechanism (stripped), subagent_type (preserved), expected_path, tool_use_id | tier1-verify-dispatch.sh §append |
| Fails-Safe-to-Allow | `\|\| true` on jq write; `exit 0` on errors | tier1-verify-dispatch.sh §append |
| stdin Input Delivery | Reads stdin if `$1` is empty and stdin is not a terminal | tier1-verify-dispatch.sh §input |

### Design Rationale

Append-only verification infrastructure. This hook NEVER blocks — it only records evidence of dispatch events for the Stop hook's compound check to consume. The Fails-Safe-to-Allow discipline is critical: a broken dispatch logger must never wedge the agent. The plugin namespace stripping is required because Claude Code dispatches plugin-provided subagents with the `<plugin>:<name>` form, but the manifest uses bare names. The Cycle 017 directory-presence selection (ADR-085) ensures dispatch entries land at whichever placement the corpus is using — pre-migration corpora at `docs/housekeeping/`, post-migration corpora at `.rdd/`, fresh corpora default to `.rdd/`. Both Stop-hook helpers (`resolve_artifact_path`, `dispatch_log_has_entry`) read both forms transparently, so transition-window cycles continue to work.

### Key Integration Points

- Tier 1 Phase Manifest (indirect) — defines which mechanisms warrant logging
- Dispatch Log (`.rdd/dispatch-log.jsonl` post-migration; `docs/housekeeping/dispatch-log.jsonl` legacy) — append target
- `tier1-phase-manifest-check.sh` (downstream consumer) — cross-references log entries via `dispatch_log_has_entry()` two-form match

---

## Module: Tier 1 Phase Manifest Check Hook (NEW in v0.7.0; advisory across all modes since v0.8.3 per ADR-088)

**Implementation state:** Complete; advisory disposition across all modes per ADR-088 (v0.8.3)
**Code location:** `hooks/scripts/tier1-phase-manifest-check.sh`
**Stability:** Settled — Cycle 017 amendments per ADR-088 / ADR-089 / ADR-090 (advisory demotion + In-Progress Phase predicate scoped to per-phase advisory only); Cycle 016 added Cycle Stack parsing (ADR-078), In-progress gate predicate (ADR-079), applicable_when precondition evaluation (ADR-080), legacy pre-ADR-072 detection (ADR-081), and Skipped/Paused short-circuits (ADR-072)

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Stop Hook (manifest verification) | Fires on every Stop event | hooks/hooks.json §Stop |
| Three-Level Cycle-Status Precedence (ADR-085) | Reads `.rdd/cycle-status.md` → `docs/housekeeping/cycle-status.md` → `docs/cycle-status.md` (file-presence cascade) | tier1-phase-manifest-check.sh §init |
| Two-Level Dispatch Log + Migration Marker (ADR-085) | Directory-presence selection of `.rdd/...` (preferred) or `docs/housekeeping/...` (legacy) | tier1-phase-manifest-check.sh §init |
| Advisory Disposition (ADR-088) | All modes: missing artifacts emit `allow_with_message` advisory, never a block decision | tier1-phase-manifest-check.sh §emit |
| Four-Failure-Mode Classification (ADR-088 §1) | F1 not-dispatched, F2 dispatched-no-output, F3 fabrication-signal, F4 assertion-failure — labeled inline on each FAILURE message | tier1-phase-manifest-check.sh §iterate, §emit |
| In-Progress Phase Predicate (ADR-090) | Suppresses F1/F2/F4 per-phase advisories when field matches current phase; F3 fabrication signals continue to surface | tier1-phase-manifest-check.sh §in-progress-phase |
| In-Progress Gate Predicate (ADR-079) | Suppresses gate-reflection-note check for the source phase when `**In-progress gate:**` field is set | tier1-phase-manifest-check.sh §in-progress-gate |
| Cycle Stack Parsing (ADR-078) | Reads only the top `### Active:` entry of `## Cycle Stack`; legacy single-entry format treated as one-entry stack | tier1-phase-manifest-check.sh §active-entry |
| applicable_when Precondition Evaluation (ADR-080) | Five primitives (cycle_type_in/_not_in, phase_not_skipped, parent_cycle_present/_absent) skip mechanism if condition not met; skip recorded in dispatch log | tier1-phase-manifest-check.sh §applicable_when |
| Skipped Phases Short-Circuit (ADR-072) | `**Skipped phases:**` field bypasses all checks for enumerated phases | tier1-phase-manifest-check.sh §skipped |
| Paused Cycle Short-Circuit (ADR-072) | `**Paused:**` field bypasses all checks until removed | tier1-phase-manifest-check.sh §paused |
| Legacy Pre-ADR-072 Detection (ADR-081) | Entry without cycle-shape fields gets grandfathered advisory | tier1-phase-manifest-check.sh §legacy-detection |
| Path Resolution Helper (ADR-085) | `resolve_artifact_path()` tries `.rdd/...` then `docs/housekeeping/...` fallback | tier1-phase-manifest-check.sh §helpers |
| Compound Check Helper (ADR-064 / ADR-088) | `dispatch_log_has_entry()` matches both canonical and legacy expected_path forms | tier1-phase-manifest-check.sh §helpers |
| Revision-Aware Re-Audit Reminder | mtime comparison between audited documents and last dispatch | tier1-phase-manifest-check.sh §reminder |
| Fails-Safe-to-Allow | stderr diagnostic + `exit 0` on internal errors | tier1-phase-manifest-check.sh §die_open |
| stdin Input Delivery | Reads stdin if `$1` is empty and stdin is not a terminal | tier1-phase-manifest-check.sh §input |

### Design Rationale

The advisory-across-all-modes disposition (ADR-088) shifted the Harness Layer from "blocking enforcement" to "advisory verification with skill-discipline as the load-bearing enforcement layer." The compound-check fabrication-detection mechanism is preserved — State C is now structurally **detectable** (not impossible). The agent and practitioner see the advisory each turn; the cycle does not wedge. The In-Progress Phase predicate (ADR-090) is the advisory-noise suppressor for mid-phase work — it suppresses F1/F2/F4 per-phase failures while keeping F3 fabrication signals live (per ADR-090 §1: the suppression is scoped to the per-phase manifest advisory only). The path-resolution and dispatch-log fallback helpers (ADR-085) make the hook backward-compatible across the migration window: pre-ADR-085 corpora at `docs/housekeeping/...` and post-migration corpora at `.rdd/...` both work transparently. The `mechanism_type: user-tooling` branching (v0.7.2) exempts aid-cycle-gate-reflection from compound check because the note is produced in-context.

### Key Integration Points

- Tier 1 Phase Manifest (input) — parsed at every Stop event
- Dispatch Log (input) — cross-referenced via two-form matching (canonical .rdd/ + legacy docs/housekeeping/)
- Cycle-status.md (input, three-level precedence) — phase and cycle detection
- `.rdd/.migration-version` / `docs/housekeeping/.migration-version` (input) — advisory/enforcement-marker toggle (no longer affects blocking; both modes produce advisory output)
- Agent conversation (output) — advisory notice (stdout) surfaces to the model's context with the four-failure-mode legend
- `/rdd-conform migrate-to-rdd` (Operation 10) — produces the marker file at the new location post-migration

---

## Module: System Design Companion File (NEW in v0.8.4 — ADR-084 Pattern B)

**Implementation state:** Complete
**Code location:** `docs/system-design.agents.md`
**Stability:** New — Cycle 017 introduces this as the canonical Pattern B exemplar

### Domain Concepts in Code

| Concept | Code Manifestation | Location |
|---------|-------------------|----------|
| Companion-File Pattern (ADR-084 Pattern B) | Parallel-sibling agent-context file at predictable path `<artifact>.agents.md` | `system-design.agents.md` |
| Architectural Drivers Table (full) | The dense reference list relocated from `system-design.md` | system-design.agents.md §Architectural drivers |
| Responsibility Matrix (full) | Module-by-module concept and action allocation | system-design.agents.md §Responsibility Matrix |
| Integration Contracts (full) | File-mediated contracts between skills, agents, hooks, manifests | system-design.agents.md §Integration Contracts |
| Fitness Criteria (full) | Measurable architectural guardrails with ADR-076 decompositions | system-design.agents.md §Fitness Criteria |
| Test Architecture (full) | Boundary integration tests and lifecycle-sequence tests | system-design.agents.md §Test Architecture |
| Per-Phase Susceptibility Snapshot Briefs | Phase-anchored snapshot dispatch instructions | system-design.agents.md §Susceptibility Snapshot Briefs |
| Design Amendment Log (full history) | All 15 amendments through v14.0 | system-design.agents.md §Design Amendment Log |

### Design Rationale

ADR-084 names two patterns for agent-context content placement: Pattern A (audience-tagged sections within the existing artifact) below an agent-proposed ~50% threshold of audience-tagged volume; Pattern B (companion file at predictable path) above. The Cycle 017 system-design split was the canonical Pattern B exemplar — `system-design.md` carries the human-facing F-pattern orientation lead, the dependency-graph diagram, and brief module summaries; `system-design.agents.md` carries the dense reference detail agents constructing context for code work need. Cross-references in both directions; load-bearing diagram retained on the human-facing surface.

The orientation-trigger hook (per WP-B Cycle 017) was extended to fire on writes to `system-design.agents.md` alongside `system-design.md`, `domain-model.md`, `scenarios.md`, and `product-discovery.md`. Without that extension, edits to the companion file alone would not trigger ORIENTATION.md regeneration prompts — a sync-mechanism gap relative to the four sync mechanisms confirmed at the architect → build gate.

### Key Integration Points

- `system-design.md` (sibling) — slim human-facing surface; cross-references the companion at the F-pattern lead
- `orientation-trigger.sh` (PostToolUse hook) — fires on writes to this file (Cycle 017 WP-B)
- `/rdd-conform migrate-to-rdd` (Operation 10) — substitution sweep includes this file's path references
- ARCHITECT skill — produces this file when Pattern B is the per-artifact judgment

---

## Module: Hook Failure Issue Template (NEW in v0.7.0)

**Implementation state:** Complete
**Code location:** `.github/ISSUE_TEMPLATE/hook-failure.md`
**Stability:** Settled

### Design Rationale

Fails-Safe-to-Allow means a broken hook does not wedge the agent, but it also means silent failures can accumulate without user awareness. The Stop hook's `die_open` path emits a stderr notice linking to this issue template so users can report hook script failures with pre-populated fields (plugin version, hook name, stderr diagnostic, OS/shell environment, sanitized hook input JSON). This is the v1 surfacing strategy — per ADR-064 the "SessionStart self-test", "per-session suppression", and "rdd-doctor" alternatives are deferred unless the baseline proves insufficient.
