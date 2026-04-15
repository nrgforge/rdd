# Roadmap: Pedagogical RDD

**Updated:** 2026-04-14
**Derived from:** System Design v12.0, ADRs 001-072

## Work Packages

No active work packages. Cycle 15 complete pending BUILD gate close. Cycle 014 PLAY remains deferred. See Completed Work Log below.

## Completed Work Log

### Cycle 15: Lifecycle Composition in Build Stewardship (+ ADR-072 mid-cycle)

**Derived from:** ADRs 071, 072, Issue #10
**Cycle type:** Methodology amendment (mini-cycle: DECIDE + BUILD only; RESEARCH / DISCOVER / MODEL / ARCHITECT skipped by explicit scoping)
**Shipped across:** pending release

| WP | Title | Status | Release |
|----|-------|--------|---------|
| A | Domain model glossary — Lifecycle Composition / Shared Mutable State / Lifecycle Boundary | Complete | pending |
| B | ADR-071 build skill edits — three-sided catch (COMPOSABLE TESTS §Lifecycle Composition + Step 5 anchor + Stewardship Tier 1 sub-item 6e) | Complete | pending |
| C | ADR-072 hook script — Stop hook honors Skipped phases and Paused fields | Complete | pending |
| D | ADR-072 convention documentation — cycle-status.md template + Pause Log in orchestrator skill | Complete | pending |
| E | Integration verification + housekeeping | Complete | pending |

**Summary:**
- Issue #10 named a methodology gap: the build skill's test and stewardship guidance addresses integration risk at **type boundaries** (mock vs. real) and **structural boundaries** (wrong module, wrong direction) but not **lifecycle boundaries** — where shared mutable state, ordered operations, and ambiguous ownership across components determine correctness
- **ADR-071** added *Lifecycle Composition* as a named category in the build skill, anchored at three existing concrete workflow steps to form a three-sided catch: design-time prompt (COMPOSABLE TESTS §Lifecycle Composition), verification-time anchor (Step 5 lifecycle-sequence guidance), and review-time detector (Stewardship Tier 1 Test quality sub-item 6e Shared mutable state). Three glossary entries added to the domain model (Lifecycle Composition, Shared Mutable State, Lifecycle Boundary)
- **ADR-072 scope creep surfaced mid-cycle** in response to a live hook-loop failure: the Stop hook (ADR-064) fired 60+ times in succession while the user was away mid-DECIDE gate, because the methodology had no structural representation of skipped phases (mini-cycle shape) or paused cycles (user-away state). ADR-072 added two optional header fields to cycle-status.md (`**Skipped phases:**`, `**Paused:**`) plus a Pause Log section, and extended the Stop hook to honor them
- **Known gap surfaced by BUILD-entry susceptibility snapshot, documented and deferred:** ADR-072's two-field design covers user-away and phase-skipped cases but not the in-gate-conversation mini-cycle case (no cycle-status.md field can be set before Stop fires between agent turns during an active gate). The gap manifested live twice during the DECIDE → BUILD gate itself. Documented in scenarios.md (deferred scenario under ADR-072 feature block), ADR-072 §Consequences (Negative), and cycle-status.md Deferred Work. Candidate follow-up: hook-side session-scoped block-then-advisory, or a third cycle-status.md marker (`**Gate in progress:**`)
- Seven argument-audit passes on ADR-071 + ADR-072 + scenarios (clean on pass 7). Two susceptibility snapshots (`015-decide` pre-gate, `015-build` at BUILD entry — the latter producing a Grounding Reframe on the ADR-072 coverage gap)
- Live smoke test: Cycle 015's own cycle-status.md gained `**Skipped phases:** research, discover, model, architect` as a permanent cycle-shape declaration; temporarily setting Phase=research confirmed the hook's Skipped phases bypass works on the real project structure. Six additional fixture tests (paused bypass, skipped non-match, full-pipeline regression, case-insensitive matching, session-scoped notice suppression) all pass

**Dependency graph (as-built):**
```
WP-A (glossary)
  │
  hard dep
  │
  ▼
WP-B (ADR-071 skill edits)     WP-C (hook)     WP-D (convention)
                    │              │              │
                    └──────────────┴──────────────┘
                                   │
                              hard dep
                                   │
                                   ▼
                            WP-E (integration)
```

**Observed pattern:** The cycle dog-fooded the failure mode it was designing a fix for. The DECIDE gate's in-progress Stop hook loop was the empirical evidence that ADR-072's framing was under-specified — and a BUILD-entry susceptibility snapshot dispatched in a separate agent context caught the gap that the in-conversation agent had drifted past. Tier 1 Architectural Isolation (Cycle 9) firing on its own evidence within a cycle about extending the catchment.

---

### Cycle 10: Specification-Execution Gap in Prompt-Based Methodology

**Derived from:** ADRs 063-070, Essay 014, Invariant 8
**Shipped across:** v0.7.0 (WP-A/B/C/D), v0.7.1 (WP-E), v0.7.2 (WP-F verification + remediation)

| WP | Title | Status | Release |
|----|-------|--------|---------|
| A | Harness Layer — Manifest + Compound Check Hooks (ADRs 063/064) | Complete | v0.7.0 |
| B | Skill-Structure Layer — Anchor Dispatch (ADR-065) | Complete | v0.7.0 |
| C | User-Tooling Layer — Gate Reflection Note (ADR-066) | Complete | v0.7.0 |
| D | Three-Tier Classification + Grounding Reframe Extension + Methodology Scope-of-Claim (ADRs 067/068/069) | Complete | v0.7.0 |
| E | Housekeeping Migration — `/rdd-conform migrate` Subcommand (ADR-070) | Complete | v0.7.1 |
| F | Verification Pass — behavioral + migration dogfood + remediation | Complete | v0.7.2 |

**Summary:**
- Added **Invariant 8** (mechanism execution must be structurally anchored) via domain model Amendment 17, with broad scope covering any unconditional structural mechanism the methodology specifies
- Built the three-substrate enforcement architecture: Skill-Structure Layer (per-phase susceptibility snapshot dispatch at bottom-third position in all 8 phase skills with canonical prompt skeleton), Harness Layer (YAML manifest + PostToolUse dispatch logger + Stop hook compound check against per-phase manifest, with advisory/enforcement mode split and Fails-Safe-to-Allow), User-Tooling Layer (AID gate reflection note graduated from conversational form to artifact at canonical path)
- Added `/rdd-conform migrate` 10-step subcommand that moves `docs/essays/audits/` → `docs/housekeeping/audits/`, `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`, creates `docs/housekeeping/gates/`, mechanically substitutes path references across the corpus (including `docs/system-design.md` per Finding #4), writes `docs/housekeeping/.migration-version` to transition the Stop hook to enforcement mode, and produces rollback manifest and summary report
- Added three new `/rdd-conform` audit scopes (housekeeping directory organization, gate reflection note template alignment, dispatch prompt format) and the `mechanism_type: user-tooling` manifest field for distinguishing in-context orchestrator artifacts from isolated-subagent-produced artifacts
- Verified 57 Cycle 10 scenarios (44 v0.7.0 + 13 v0.7.1) with WP-F surfacing **nine latent defects** in the hook infrastructure that the synthetic test suite had missed. All nine fixes committed inline during verification: Stop hook schema, E1 cycle-sensitivity, JSON null vs string, migrate file list, mechanism_type distinction, migrate internal link rewrite, plugin namespace prefix matching, plugin cache drift (documented manual sync procedure), and stdin input delivery across all hooks (the deepest defect — every input-dependent RDD hook had been silently non-functional in Claude Code's actual runtime since v0.6.0 because synthetic tests invoked scripts directly with `$1` while the runtime delivers payload via stdin)
- **First live operational Tier 1 dispatch in project history** at the build phase boundary: the ADR-065 Skill-Structure anchor fired without ceremonial attention, produced a substantive snapshot, was logged by the PostToolUse hook, cross-referenced by the Stop hook compound check, and cleared the enforcement-mode block. ARCHITECT phase open question 1 answered empirically
- **First gate reflection note** produced by the User-Tooling Layer graduated-artifact mechanism at `docs/housekeeping/gates/014-build-gate.md`
- **Three preserved historical snapshots** at `docs/housekeeping/audits/` (`.pre-prefix-fix.md`, `.post-prefix-pre-stdin.md`, and canonical `susceptibility-snapshot-014-build.md`) document the defect surfacing through WP-F verification
- Migration dogfood: the RDD plugin's own corpus migrated successfully (58 files changed — 40 moves + 15 reference updates + 2 new infrastructure files + 1 cycle-status move). The methodology is the first user of its own migration tool
- Full RDD cycle: research (Essay 014, 4 spike reports, 2 literature reviews, 5 ceremonial susceptibility snapshots, citation/argument/framing audited) → discover (product discovery updated with per-entry Grounding Reframe pass) → model (22 new concepts, Invariant 8, Amendment 17) → decide (8 ADRs, ~45 scenarios, interaction specs) → architect (system design v12.0 Amendment #13, Appendix A with 8 per-phase briefs, roadmap Cycle 10) → build (manifest + 2 new hooks + 6 phase skill amendments + 4 WP-D orchestrator amendments + /rdd-conform migrate 10-step subcommand + 9 verification-driven remediation fixes)

**Dependency graph (as-built):**
```
WP-A (Harness Layer)     WP-B (Skill-Structure)     WP-C (User-Tooling)     WP-D (Orchestrator)
       │                         │                         │                       │
  open choice              open choice                open choice             open choice
       │                         │                         │                       │
       └─────────────────────────┴─────────────────────────┴───────────────────────┘
                                               │
                                          hard dep
                                               │
                                WP-E (Migrate Subcommand, v0.7.1 atomic)
                                               │
                                          hard dep
                                               │
                                WP-F (Verification — v0.7.2 remediation)
```

**Observed pattern:** WP-F verification produced six commits worth of remediation that the synthetic test suite had missed, all surfacing because the methodology's own enforcement held under runtime conditions. The methodology caught its own implementation defects running against itself — both the catastrophic implementation quality signal (nine latent defects shipped) and the vindicating methodology design signal (the enforcement architecture detected them) are true simultaneously.

---

### Cycle 9: Sycophancy Resistance Architecture

**Derived from:** ADRs 055-062, Essay 013

| WP | Title | Status |
|----|-------|--------|
| A | New Specialist Subagents (research-methods-reviewer, susceptibility-snapshot-evaluator) | Complete |
| B | Argument Auditor Framing Extension | Complete |
| C | AID Cycle Extension (Orchestrator + All Phase Skills) | Complete |
| D | Orchestrator Integration | Complete |
| E | Verification Pass | Complete |

**Summary:**
- Created research-methods-reviewer agent (belief-mapping question review, embedded conclusion detection, premature narrowing flags)
- Created susceptibility-snapshot-evaluator agent (isolated signal evaluation, Grounding Reframe recommendations)
- Extended argument auditor with framing audit (three structural questions, source material reading, two-section output)
- Extended AID cycle across orchestrator + 6 phase skills: susceptibility signal observation, Question Toolkit with goal-first composition (6 research-grounded forms), assertion-aware observation, belief-mapping as Inversion Principle form
- Added Two-Tier Sycophancy Resistance (Tier 1 unconditional: subagent audits, snapshots, research methods review; Tier 2 context-responsive: question forms, constraint intensity, assertion-aware observation)
- Added Grounding Reframe pattern, essay-as-checkpoint enforcement, commitment gating
- Updated cross-phase integration rules for new mechanisms
- Verification: 28 scenarios verified (6 gaps found and fixed during first pass), 16 fitness criteria checked
- Full RDD cycle: research (Essay 013, spike experiment, citation/argument audited) → discover (product discovery updated) → model (18 concepts, Amendment 16) → decide (8 ADRs, ~45 scenarios, interaction specs) → architect (system design v11.0, roadmap) → build (2 agents created, 1 agent amended, 7 skill files amended)

**Dependency graph (as-built):**
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

---

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
