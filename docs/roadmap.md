# Roadmap: Pedagogical RDD

**Generated:** 2026-04-02
**Derived from:** System Design v10.0, ADRs 048-054

## Work Packages

*No active work packages — Cycle 7 complete.*

## Dependency Graph

```
WP-A (Protocol + Conformance Fixes)
       │
  hard dependency
       │
       ├──────────────────────────┐
       │                          │
WP-B (Debug Skill)        WP-C (Refactor Skill)
  open choice                 open choice
       │                          │
       └──── implied logic ───────┘
                    │
             WP-D (Build Rewrite)
                    │
               hard dependency
                    │
             WP-E (Orchestrator)
                    │
               hard dependency
                    │
             WP-F (Verification)
```

**Classification key:**
- **Hard dependency:** WP-B and WP-C need the protocol from WP-A. WP-E needs the skills to exist. WP-F needs everything.
- **Implied logic:** WP-D is simpler to write after B and C exist (mode-shift descriptions can reference actual skill text), but the descriptions could be written from the ADRs alone.
- **Open choice:** WP-B and WP-C are genuinely independent — build debug or refactor first, builder's choice.

## Transition States

### TS-1: Protocol Defined, Conformance Fixed (after WP-A)

The Context Gathering protocol reference exists. The two standalone conformance violations (interaction-specs.md, /rdd-play) are fixed in the existing build skill. No new user-facing skills yet, but the foundation for all four is in place.

### TS-2: Standalone Skills Available (after WP-A + WP-B and/or WP-C)

At least one new standalone skill is usable: `/rdd-debug` for debugging with epistemic care, `/rdd-refactor` for structured refactoring with AI smell awareness. Each operates in both modes (pipeline and context-reconstructive). The build skill is still monolithic — no mode-shift composition yet.

### TS-3: Composable Build Functional (after WP-A + WP-B + WP-C + WP-D)

The build skill is rewritten as the outer loop. Mode shifts to debug, refactor, and review work seamlessly. Context-reconstructive mode serves the Everyday Developer. Session artifacts survive context compression. The composable skill family is functionally complete, though not yet listed in the orchestrator.

### TS-4: Fully Integrated (after all)

All skills listed in the orchestrator. Plugin discovers 12 skills. All scenarios, fitness criteria, and boundary tests verified.

## Open Decision Points

- **Session artifact location:** The `session/` directory could be at the project root (`./session/`) or within `./docs/` (`./docs/session/`). The builder decides based on gitignore conventions.
- **Context Gathering protocol reference location:** Could be a section in the orchestrator's cross-phase integration rules, a standalone reference file in the plugin, or inline in each skill with cross-references. The builder decides based on maintainability.
- **Build skill rewrite approach:** Could be an incremental rewrite (preserve existing pipeline mode, add context-reconstructive mode alongside) or a clean rewrite (start from the ADRs and scenarios). The builder decides based on how tangled the existing skill is.
- **Mode-shift language calibration:** The ADRs and scenarios use "mode shift" language. The actual skill text needs to describe what happens from the developer's perspective without referencing skill boundaries. The builder decides the concrete phrasing.

---

## Completed Work Log

### Cycle 7: Composable Skill Family

**Derived from:** ADRs 048-054, Essay 011

| WP | Title | Status |
|----|-------|--------|
| A | Context Gathering Protocol + Conformance Fixes | Complete |
| B | Debug Skill (`skills/debug/SKILL.md`) | Complete |
| C | Refactor Skill (`skills/refactor/SKILL.md`) | Complete |
| D | Build Skill Rewrite (`skills/build/SKILL.md`) | Complete |
| E | Orchestrator Integration | Complete |
| F | Verification Pass | Complete |

**Summary:**
- Defined shared Context Gathering protocol in orchestrator (5-step protocol with per-skill adaptation)
- Created `/rdd-debug` with hypothesis-trace-understand-fix cycle, naming the misunderstanding as non-negotiable step
- Created `/rdd-refactor` with Three-Level Refactor (smells → patterns → methodology), AI Smell Taxonomy (classical + AI-exacerbated), AI hygiene prompts (novel patterns — separate from detection)
- Rewrote `/rdd-build` as outer loop: context-reconstructive mode, work decomposition from available sources, session artifacts (`session/` directory), time budget mechanism, seamless mode-shift composition to debug/refactor/review
- Updated orchestrator: Available Skills includes debug and refactor, Artifacts Summary includes session artifacts, cross-phase integration describes composition
- Updated `/rdd-review` with MODE SHIFT FROM BUILD section and Context Gathering protocol reference (ADR-054 supersedes ADR-046)
- Fixed conformance violations: interaction-specs.md in build read list, /rdd-play in build NEXT PHASE
- Verification: 2 structural + 5 cosmetic findings from conformance scan, all resolved
- Full RDD cycle: research (Essay 011, citation/argument audited) → discover (product discovery updated — Everyday Developer stakeholder) → model (24 concepts, Amendment 15) → decide (7 ADRs, ~50 scenarios, interaction specs) → architect (system design v10.0, roadmap) → build (4 skill files created/rewritten + orchestrator)

**Dependency graph (as-built):**
```
WP-A (Protocol + Fixes)
       │
  hard dependency
       │
       ├──────────────────────────┐
       │                          │
WP-C (Refactor Skill)     WP-B (Debug Skill)
  open choice                 open choice
       │                          │
       └──── implied logic ───────┘
                    │
             WP-D (Build Rewrite)
                    │
               hard dependency
                    │
             WP-E (Orchestrator)
                    │
               hard dependency
                    │
             WP-F (Verification)
```

---

### Cycle 6: Code Review Utility Skill

**Derived from:** ADRs 043-047, Essay 010

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Review Skill File (`skills/review/SKILL.md`) | d9a9937 | Complete |
| B | Build Skill Stewardship Callout | d9a9937 | Complete |
| C | Orchestrator Integration | d9a9937 | Complete |
| D | Verification Pass | d9a9937 | Complete |

**Summary:**
- Created `/rdd-review` utility skill with two operating modes (corpus-grounded, context-reconstructive), three-tier question-driven output, test quality evaluation with mutation testing lens, time-budget adaptation (ZPD), and reviewer autonomy safeguards
- Added stewardship callout in build skill referencing `/rdd-review` after Tier 1 checks
- Added `/rdd-review` to orchestrator Available Skills table
- All 40 scenarios verified, 5 fitness criteria checked, plugin discovers 13 skills
- Full RDD cycle: research (Essay 010, citation/argument audited) → discover (product discovery updated) → model (14 concepts added, Amendment 14) → decide (5 ADRs, 40 scenarios, interaction specs) → architect (system design v9.0, roadmap) → build (skill file + integration)

**Dependency graph (as-built):**
```
WP-A (Review Skill)
       │
  implied logic
       │
WP-B (Build Callout)    WP-C (Orchestrator)
       open choice              open choice
              │                        │
              └──── hard dependency ───┘
                         │
                  WP-D (Verification)
```

---

### Cycle 5: Adaptive Epistemic Gates

**Derived from:** ADRs 040-042, Essay 009

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | AID Cycle in All Gate Sections | — | Pending |
| B | Reflection Time Naming | — | Pending |
| C | Orchestrator Gate Protocol Update | — | Pending |
| D | /rdd-about Utility Skill | — | Pending |
| E | Verification Pass | — | Pending |

**Note:** Cycle 5 work packages are carried forward from the prior roadmap. They are independent of Cycle 7 (composable skill family) and can be built in any order relative to it.

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
