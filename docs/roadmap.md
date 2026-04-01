# Roadmap: Pedagogical RDD

**Generated:** 2026-03-31
**Derived from:** System Design v9.0, ADRs 043-047

## Work Packages

### WP-A: Review Skill File (`skills/review/SKILL.md`)

**Objective:** Create the code-review utility skill with both operating modes, question-driven output, and time-budget adaptation.

**Changes:**
- Create `skills/review/SKILL.md` with frontmatter (name: rdd-review, description, allowed-tools: Read, Grep, Glob, Bash, WebFetch, WebSearch)
- Implement mode detection: scan for RDD artifacts, offer corpus-grounded or context-reconstructive
- Implement corpus-grounded mode: read relevant artifact slice (ADRs, scenarios, domain model) for work package scope, synthesize orientation, surface questions
- Implement context-reconstructive mode: collaborative context-gathering protocol (prompt for breadcrumbs, fetch/read, synthesize orientation, validate with reviewer, re-synthesize on substantial correction)
- Implement three-tier output: pure mechanical findings, observation→question, pure questions
- Implement time-budget adaptation: ask reviewer about available time, scale question depth accordingly
- Implement reviewer autonomy safeguards: no merge verdict, no severity ratings, no pre-written comments, decline to write comments for reviewer
- Include utility skill preamble (not a pipeline phase, no epistemic gate section, no cycle position)

**Scenarios covered:** All Feature scenarios for ADRs 043, 044, 045, 047; Review Success Criterion; Review Anti-Pattern Detection

**Dependencies:** None

---

### WP-B: Build Skill Stewardship Callout

**Objective:** Add the review integration callout to the build skill's stewardship section.

**Changes:**
- Amend `skills/build/SKILL.md` stewardship section: after Tier 1 check description, add callout noting the user may invoke `/rdd-review` for epistemic review of the work package
- The callout is informational — build continues with or without review

**Scenarios covered:** All Feature scenarios for ADR-046 (build stewardship integration)

**Dependencies:** WP-A (implied logic — the callout references a skill that should exist, but the build skill functions without it)

---

### WP-C: Orchestrator Integration

**Objective:** Register the review skill in the orchestrator's Available Skills table.

**Changes:**
- Amend `skills/rdd/SKILL.md` Available Skills table: add `/rdd-review` with description "Code review utility — scaffolds reviewer understanding through question-driven orientation"
- Ensure plugin discovers the new skill directory

**Scenarios covered:** Review skill listed in orchestrator's Available Skills (integration test)

**Dependencies:** WP-A (implied logic — the skill should exist before being listed, but the orchestrator entry is just a text addition)

---

### WP-D: Verification Pass

**Objective:** Verify all new scenarios and fitness criteria.

**Changes:**
- Verify all 36 code-review scenarios against skill files
- Verify fitness criteria: no merge verdict language, both modes present, three-tier output specified, build callout exists
- Verify plugin discovers 12 skills (was 11)
- Verify skill reads artifacts correctly in corpus-grounded mode

**Scenarios covered:** All 36 scenarios (verification)

**Dependencies:** WP-A (hard), WP-B (hard), WP-C (hard)

## Dependency Graph

```
WP-A (Review Skill)
       │
  implied logic
       │
WP-B (Build Callout)    WP-C (Orchestrator)
       │                        │
       └──── hard dependency ───┘
                    │
             WP-D (Verification)
```

**Classification key:**
- **Hard dependency:** WP-D cannot run until A, B, C are complete — verification requires all components
- **Implied logic:** WP-B and WP-C reference the review skill that WP-A creates, but both are text additions that could be written before WP-A
- **Open choice:** WP-B and WP-C are independent of each other — build either first

## Transition States

### TS-1: Review Skill Exists (after WP-A)

The review skill is invocable standalone. Users can run `/rdd-review` for any code review — both corpus-grounded and context-reconstructive modes work. The skill is functionally complete for standalone use. Build integration and orchestrator listing are not yet in place, so the user must know to invoke it directly.

### TS-2: Fully Integrated (after WP-A + WP-B + WP-C)

The review skill is listed in the orchestrator, the build skill suggests it at stewardship boundaries, and standalone invocation works. The skill is discoverable and integrated.

## Open Decision Points

- **Allowed tools for review skill:** The skill needs `Read`, `Grep`, `Glob` for artifact reading. It may also benefit from `Bash` (for `gh`/`glab` CLI), `WebFetch` (for ticket URLs), and `WebSearch` (for doc lookup). The builder decides the minimal tool set that supports both modes.
- **Build skill callout placement:** The stewardship section has Tier 1 and Tier 2 checks. The callout could go after Tier 1 (where most reviews would trigger) or after the full stewardship reflexive loop. The builder decides based on flow.

---

## Completed Work Log

### Cycle 5: Adaptive Epistemic Gates

**Derived from:** ADRs 040-042, Essay 009

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | AID Cycle in All Gate Sections | — | Pending |
| B | Reflection Time Naming | — | Pending |
| C | Orchestrator Gate Protocol Update | — | Pending |
| D | /rdd-about Utility Skill | — | Pending |
| E | Verification Pass | — | Pending |

**Note:** Cycle 5 work packages are carried forward from the prior roadmap. They are independent of Cycle 6 (code review) and can be built in any order relative to Cycle 6.

---

### Cycle 4: Play and Interaction Specification

**Derived from:** ADRs 037-039, Essay 008

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Interaction Specification Layer (Decide Skill) | db28ebb | Complete |
| B | Play Skill | db28ebb | Complete |
| C | Orchestrator and Downstream Integration | db28ebb | Complete |
| D | Verification Pass | db28ebb | Complete |

**Summary:**
- Created Play Skill with three-movement experiential discovery (inhabit → explore → reflect), gamemaster behavior, Stanislavski inhabitation structure
- Added interaction specification production to Decide Skill
- Updated orchestrator with PLAY in pipeline, state tracking, artifact summary, cross-phase play feedback integration
- Updated discover (reads field notes), synthesize (reads field notes), epistemic-gate-enforcer (recognizes play subsumes gate)
- All 36 scenarios verified by 3 parallel agents. Plugin discovers 10 skills.

**Dependency graph (as-built):**
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

---

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
