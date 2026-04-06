# Roadmap: Pedagogical RDD

**Generated:** 2026-04-06
**Derived from:** System Design v11.0, ADRs 055-062

## Work Packages

### WP-A: New Specialist Subagents

**Objective:** Create the two new specialist subagent modules that Tier 1 mechanisms depend on.

**Changes:**
- Create `agents/research-methods-reviewer.md` — system prompt with belief-mapping question review, embedded conclusion detection, premature narrowing flags, artifact output format
- Create `agents/susceptibility-snapshot-evaluator.md` — system prompt with susceptibility signal evaluation, snapshot artifact format, Grounding Reframe recommendation logic

**Scenarios covered:** Research Methods Subagent (ADR-060) scenarios, Susceptibility Snapshot (ADR-057) scenarios

**Dependencies:** None — agents are self-contained files with no inter-agent dependencies

---

### WP-B: Argument Auditor Framing Extension

**Objective:** Extend the argument auditor's scope with the framing audit section (three questions, source material reading, two-section output).

**Changes:**
- Amend `agents/argument-auditor.md` — add framing audit instructions (three questions: alternative framings, absent truths, dominant framing inversion); update output format to two-section artifact; add source material reading instruction

**Scenarios covered:** Framing Audit (ADR-061) scenarios

**Dependencies:** None — amendment to existing agent file

---

### WP-C: AID Cycle Extension (Orchestrator + All Phase Skills)

**Objective:** Extend the AID cycle with susceptibility signal observation, question toolkit, assertion-aware observation, and belief-mapping as Inversion Principle form.

**Changes:**
- Amend orchestrator `skills/rdd/SKILL.md` — AID protocol extended with susceptibility signal list, question toolkit reference (six forms with phase mapping), assertion-aware observation instruction, belief-mapping operationalization of Inversion Principle, two-tier resistance principle, Grounding Reframe pattern, essay-as-checkpoint for RESEARCH phase
- Amend all phase skills' EPISTEMIC GATE sections — reference question toolkit, add susceptibility signal observation to Attend phase, add assertion-aware observation instruction
- Amend `skills/research/SKILL.md` — add Research Methods Subagent dispatch before each loop, essay-as-checkpoint enforcement, framing audit in argument audit dispatch
- Amend ADR-010 — amendment note for PLAY + SYNTHESIS scope expansion and belief-mapping form (already done during DECIDE)

**Scenarios covered:** Belief-mapping (ADR-055), question toolkit (ADR-056), AID susceptibility (ADR-057), unconditional floor (ADR-058), Grounding Reframe (ADR-059), assertion-aware observation (ADR-062), essay-as-checkpoint scenarios

**Dependencies:** WP-A (hard — susceptibility snapshot evaluator must exist before orchestrator can reference dispatch); WP-B (implied — framing audit extension should exist before research skill references it, but the instruction could reference the to-be-created agent)

---

### WP-D: Orchestrator Integration

**Objective:** Update orchestrator agent dispatch protocol, Available Skills table, plugin discovery count, cross-cutting principles.

**Changes:**
- Amend orchestrator — agent dispatch protocol updated (6→8 subagents), plugin discovery expectation (12 skills, 8 agents, 5 hooks), cross-cutting principles include two-tier resistance and Grounding Reframe

**Scenarios covered:** Integration scenarios (full stack at phase boundary, standalone invocation)

**Dependencies:** WP-A (hard — agents must exist), WP-C (hard — AID extensions must be in place)

---

### WP-E: Verification Pass

**Objective:** Run conformance scan, verify all scenarios, check fitness criteria, confirm plugin discovery.

**Changes:**
- Dispatch conformance-scanner against updated skill files and ADRs 055-062
- Verify ~45 new scenarios against skill text
- Check 16 new fitness criteria
- Confirm plugin discovers 12 skills, 8 agents, 5 hooks

**Scenarios covered:** All Cycle 9 scenarios

**Dependencies:** WP-A, WP-B, WP-C, WP-D (hard — all must be complete)

## Dependency Graph

```
WP-A (New Agents)          WP-B (Framing Audit Extension)
       │                          │
  open choice                open choice
       │                          │
       └──────── hard dep ────────┘
                    │
             WP-C (AID Extension)
                    │
               hard dependency
                    │
             WP-D (Orchestrator)
                    │
               hard dependency
                    │
             WP-E (Verification)
```

**Classification key:**
- **Hard dependency:** WP-C needs agents from WP-A and framing audit from WP-B to reference. WP-D needs AID extensions. WP-E needs everything.
- **Open choice:** WP-A and WP-B are genuinely independent — new agents and framing audit extension can be built in either order.

## Transition States

### TS-1: Agents Available (after WP-A + WP-B)

The two new specialist subagents and the extended argument auditor exist as agent files. No skill file changes yet — agents are buildable and testable in isolation. The plugin would discover 8 agents.

### TS-2: AID Extended (after WP-A + WP-B + WP-C)

The AID cycle is extended with susceptibility signals, question toolkit, and assertion-aware observation across all phase skills. The research skill dispatches the Research Methods Subagent and enforces essay-as-checkpoint. The Grounding Reframe pattern is specified. The sycophancy resistance architecture is functionally complete but not yet reflected in the orchestrator's dispatch protocol and Available Skills.

### TS-3: Fully Integrated (after all)

Orchestrator updated with 8-agent dispatch, updated plugin discovery, cross-cutting resistance principles. All scenarios verified, fitness criteria checked.

## Open Decision Points

- **Susceptibility signal thresholds:** What constitutes "increasing" assertion density or "declining" alternative engagement is unspecified. Calibration should emerge from practice across real cycles — the first implementation should log signals without committing to thresholds.
- **Framing audit source material scope:** The argument auditor now reads source material alongside the artifact. For essays, this means the research log. For ADRs, this means the essay + prior ADRs. The builder decides how to specify the source material path in the dispatch instruction.
- **Non-formulaic verification:** The non-formulaic requirement (question forms composed with context, not templates) is a hard constraint but not mechanically verifiable. The conformance scan can flag stylistic repetition but cannot guarantee contextual composition. The builder decides how to encode the spirit-over-letter instruction in skill text.

---

## Completed Work Log

### Cycle 8: Pair-RDD (paused)

*Cycle 8 research complete (Essay 012). Cycle paused — Cycle 9 (sycophancy) took priority.*

---

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
