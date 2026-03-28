# Roadmap: Pedagogical RDD

**Generated:** 2026-03-26
**Derived from:** System Design v7.0, ADRs 037-039

## Work Packages

### WP-A: Interaction Specification Layer (Decide Skill)

**Objective:** Enable the Decide Skill to produce interaction specifications — the missing middle layer between business-rule scenarios and technical implementation — derived from Product Discovery's stakeholder models.

**Changes:**
- Amend `skills/decide/SKILL.md` to add interaction spec generation step after scenario writing
- Add interaction spec artifact template (stakeholder sections with super-objective, task, interaction mechanics)
- Artifact written to `./docs/interaction-specs.md`

**Scenarios covered:** ADR-037 scenarios (6): DECIDE produces interaction specs, organized by stakeholder, derived from product discovery, creates playable surface, complements scenarios, derivation method acknowledged as open

**Dependencies:** None

---

### WP-B: Play Skill

**Objective:** Create the Play Skill — post-build experiential discovery through stakeholder inhabitation, with the orchestrating agent as gamemaster.

**Changes:**
- Create `skills/play/SKILL.md` with three-movement structure (inhabit → explore → reflect)
- Implement gamemaster behavior: role proposals, points of concentration, complications, inversions
- Implement Stanislavski inhabitation structure (super-objective from discover, objective from interaction specs, obstacle discovered through play)
- Define field notes artifact template with 6 feedback-destination categories
- Implement felt-understanding bounding (no timebox, no stakeholder-count limit)
- No separate EPISTEMIC GATE section (activity subsumes gate — ADR-016 pattern)
- Field notes written to `./docs/field-notes.md`

**Scenarios covered:** ADR-038 scenarios (16): play positioned after BUILD, requires built software, inhabit/explore/reflect movements, field notes production and categorization, play itself is epistemic act, felt-understanding bounding, playing as oneself valid, playable surface requirement, repeat per stakeholder, enriches artifact trail, feedback sustains loop, field notes pair with field guide. ADR-039 scenarios (8): gamemaster proposes roles, proposes points of concentration, introduces complications/inversions, shapes attention not conclusions, over-facilitation detection, human gamemaster equally valid, Stanislavski structure, extends Inversion Principle.

**Dependencies:** None (WP-A implied logic — play reads interaction specs, but skill can be written to reference the artifact path before it exists)

---

### WP-C: Orchestrator and Downstream Integration

**Objective:** Wire play and interaction specs into the pipeline — update the orchestrator, synthesis, discover, and hook infrastructure.

**Changes:**
- Amend `skills/rdd/SKILL.md`: pipeline sequence (PLAY after BUILD, before SYNTHESIS), state tracking table (PLAY row), artifact summary (interaction specs in DECIDE, field notes in PLAY), cross-phase integration rules (play feedback loops), Available Skills table (`/rdd-play`), Mode A pipeline listing
- Amend `skills/synthesize/SKILL.md`: read field notes in artifact trail mining (delight entries as candidate novelty signals)
- Amend `skills/discover/SKILL.md`: update mode reads prior field notes (usability friction → value tensions, challenged assumptions → inversions)
- Update `hooks/scripts/epistemic-gate`: recognize play subsumes its gate (like synthesis)

**Scenarios covered:** Conformance scenarios (4): orchestrator pipeline includes PLAY, state tracking includes PLAY, artifact summary includes interaction specs and field notes, cross-phase integration includes play. Integration boundary scenarios (3): play reads interaction specs, field notes reference product discovery stakeholders, play feedback re-enters discover in update mode.

**Dependencies:** WP-A (implied logic — orchestrator references interaction-specs.md), WP-B (implied logic — orchestrator references play skill and field-notes.md)

---

### WP-D: Verification Pass

**Objective:** Verify all 36 new scenarios, 14 new fitness criteria, and 12 new boundary integration tests.

**Changes:**
- Verify all ADR-037 scenarios (6) against Decide Skill
- Verify all ADR-038 scenarios (16) against Play Skill
- Verify all ADR-039 scenarios (8) against Play Skill
- Verify conformance scenarios (4) against Orchestrator
- Verify integration boundary scenarios (3) against cross-skill artifact flow
- Verify all 14 new fitness criteria
- Verify all 12 new boundary integration tests
- Verify plugin discovers 10 skills (was 9)

**Scenarios covered:** All 36 new scenarios (verification)

**Dependencies:** WP-A (hard), WP-B (hard), WP-C (hard)

## Dependency Graph

```
WP-A (Interaction Specs)     WP-B (Play Skill)
       open choice                open choice
              │                        │
              └──── implied logic ──────┘
                         │
                  WP-C (Orchestrator + Downstream)
                         │
                    hard dependency
                         │
                  WP-D (Verification)
```

**Classification key:**
- **Hard dependency:** WP-D cannot run until A, B, and C are complete — verification requires all components
- **Implied logic:** WP-C references artifacts from A and B, simpler to build after them, but a builder could stub the references
- **Open choice:** WP-A and WP-B are genuinely independent — build either first

## Transition States

### TS-1: Richer Specification Layer (after WP-A)

The Decide Skill produces interaction specifications alongside scenarios. The pipeline is usable without play — interaction specs enrich the specification layer and can inform BUILD directly. This is a coherent intermediate architecture: DECIDE produces three artifacts (ADRs, scenarios, interaction specs) where it previously produced two.

### TS-2: Full Play Pipeline (after WP-A + WP-B + WP-C)

The complete play/interaction-spec cycle is wired. The pipeline offers PLAY after BUILD. The discover skill reads field notes in update mode. Synthesis reads field notes. The system is ready for end-to-end play sessions, pending verification.

## Open Decision Points

- **Interaction spec format evolution:** ADR-037 acknowledges the derivation method from stakeholder model to task decomposition is an open design problem. The format will evolve through use. The builder should start with the simplest structure that creates a playable surface.
- **Field notes artifact structure:** The scenarios specify 6 feedback-destination categories but not the artifact's exact markdown structure. The builder designs this during WP-B, keeping it naturalistic (field notes, not structured log — per discover gate feed-forward signal 8).
- **Epistemic-gate-enforcer hook update:** The hook needs to recognize play (like synthesis) subsumes its gate. The simplest approach: add "play" to the same check that already recognizes synthesis. The builder decides the implementation detail.

---

## Completed Work Log

### Cycle 3: Plugin Architecture

**Derived from:** ADRs 031-036, Essay 007

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Plugin Repository and Manifest | 22bf389 | Complete |
| B | Auditor Agents (citation-auditor, argument-auditor) | 4cca9b5, f7a3ed5 | Complete |
| C | Research Helper Agents (lit-reviewer, spike-runner) | 5f2faec, a976de0 | Complete |
| D | Infrastructure Agents (conformance-scanner, orientation-writer) | 5f2faec, a976de0 | Complete |
| E | Cross-Cutting Hooks (5 hooks) | 9203ad2 | Complete |
| F | Research Log Archival Update | 37884e6 | Complete |
| G | Namespace Migration and Artifact Corpus | c97fbec, 315bdb8, 6349c67 | Complete |
| — | Skill renames (rdd-product → rdd-discover, rdd-synthesis → rdd-synthesize) | a7d5f48, e6724ac | Complete |
| — | Marketplace distribution (marketplace.json) | fe92881 | Complete |
| — | README and manifesto | 59a2607+ | Complete |

**Summary:**
- Created `nrgforge/rdd` plugin repository with four-layer architecture: 9 skills, 6 specialist subagents, 5 cross-cutting hooks
- Extracted citation-auditor, argument-auditor, lit-reviewer, conformance-scanner, orientation-writer, spike-runner as isolated agents with artifact-mediated communication
- Implemented invariant-reminder, epistemic-gate-enforcer, skill-activator, orientation-trigger, and sizing-check hooks
- Renamed skills to verb forms matching the pipeline (discover, synthesize)
- Renamed skill directories for clean plugin namespacing (drop `rdd-` prefix)
- Discovered runtime uses hyphen separators not colons (ADR-034 amended)
- Added marketplace.json for distribution via `/plugin marketplace add nrgforge/rdd`
- Published manifesto at nrgforge.github.io/rdd/

**Dependency graph (as-built):**
```
A (Plugin Repo) ←── prerequisite for all
     │
     ├── B (Auditor Agents)           F (Log Archival)
     │        open choice                  independent
     ├── C (Research Helper Agents)
     │        open choice
     ├── D (Infrastructure Agents)
     │        open choice
     ├── E (Cross-Cutting Hooks)
     │        open choice
     ├── G (Namespace + Corpus)
     │        implied logic
     │
     └── Skill renames + marketplace + manifesto (emerged during build)
```

---

### Cycle 2: Synthesis Enrichment

**Derived from:** ADRs 027-030, Essay 006

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Synthesis Skill — Framing Conversation Overhaul | a4abbf3 | Complete |
| B | Synthesis Skill — Two-Register Outline | a4abbf3 | Complete |
| C | Synthesis Skill — Re-Entry Logic | a4abbf3 | Complete |
| D | Synthesis Conformance Verification | a4abbf3 | Complete |

**Summary:**
- Overhauled synthesis framing conversation with four-dimension navigation (discovery type, narrative form, audience constraint, epistemic posture) via structural experiments (a4abbf3)
- Added two-register outline production (argumentative backbone + curatorial arrangement) and re-entry logic for RESEARCH when structural experiments surface gaps
- All 31 synthesis enrichment scenarios verified, 7 fitness criteria checked, 3 boundary integration tests passed

**Dependency graph (as-built):**
```
A (Framing Overhaul)
     ├───── implied ─── B (Two-Register Outline)
     ├───── implied ─── C (Re-Entry Logic)
     └──── hard dep ────┴──── hard dep
                        │
                 D (Verification Pass)
```

---

### Cycle 1: Roadmap, Field Guide, Conformance, Scoped Cycles

**Derived from:** ADRs 022-026, Essay 005

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Architect Skill — Roadmap Generation | 4ad5f24 | Complete |
| B | Conformance Audit Skill | 4ad5f24 | Complete |
| C | Build Skill — Field Guide Generation | 4ad5f24 | Complete |
| D | Orchestrator — Artifact Hierarchy, Document Sizing, Available Skills | 4ad5f24 | Complete |
| E | Orchestrator — Scoped Cycles and Deep Work Tool Framing | 4ad5f24 | Complete |
| F | Verification Pass | 4ad5f24 | Complete |

**Summary:**
- Added roadmap generation to architect skill, field guide generation to build skill, and conformance audit as a new utility skill (4ad5f24)
- Updated orchestrator with three-tier artifact hierarchy (roadmap at Tier 2, field guide at Tier 3), document sizing heuristics, scoped cycle workflow pattern, and deep work tool framing
- All 33 scenarios (652-867) verified, 13 fitness criteria checked, 7 boundary integration tests passed

**Dependency graph (as-built):**
```
A (Roadmap Gen)         B (Conformance Audit)         C (Field Guide Gen)
     └───── implied ────────┴──── implied ────────────────┘
                            │
                     D (Orchestrator: Artifacts + Sizing)
                            │
                      implied logic
                            │
                     E (Orchestrator: Scoped Cycles)
                            │
                      hard dependency
                            │
                     F (Verification Pass)
```
