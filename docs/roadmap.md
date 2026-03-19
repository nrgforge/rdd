# Roadmap: Pedagogical RDD

**Generated:** 2026-03-19
**Derived from:** System Design v6.0, ADRs 031-036

## Work Packages

### WP-A: Plugin Repository and Manifest

**Objective:** Create the `nrgforge/rdd` repository with plugin directory structure. Copy existing skills unchanged — the pipeline must work identically in the first release.

**Changes:**
- Create `.claude-plugin/plugin.json` with `name: "rdd"`
- Create `settings.json` with default permissions
- Copy 9 skill directories into `skills/`
- Verify skills function identically via `claude --plugin-dir ./rdd`

**Scenarios covered:** Plugin installs with all components discovered, Plugin skills use namespaced invocation

**Dependencies:** None

---

### WP-B: Specialist Subagent Extraction — Auditors

**Objective:** Extract citation-auditor and argument-auditor as specialist subagents. Highest-impact extraction: these two run across 3 phases and produce the clearest audit artifacts.

**Changes:**
- Create `agents/citation-auditor.md` with YAML frontmatter (model: sonnet), system prompt specifying input/output file paths, structured report format (P1/P2/P3)
- Create `agents/argument-auditor.md` with same pattern
- Update `/rdd-research` to dispatch agents instead of invoking `/citation-audit` and `/argument-audit`
- Update `/rdd-decide` to dispatch argument-auditor instead of invoking `/argument-audit`
- Update `/rdd-synthesis` to dispatch both agents instead of invoking skills
- Verify audit artifact files are produced and read back by phase skills

**Scenarios covered:** Artifact-mediated communication (3), Specialist subagent extraction (4)

**Dependencies:** WP-A → **hard dependency** (agents need the plugin directory structure)

---

### WP-C: Specialist Subagent Extraction — Research Helpers

**Objective:** Extract lit-reviewer and spike-runner as specialist subagents.

**Changes:**
- Create `agents/lit-reviewer.md` (model: sonnet) with web search capability, research log output
- Create `agents/spike-runner.md` (model: inherit) with scratch directory scoping, research log output
- Update `/rdd-research` to dispatch these agents as user-selected research methods

**Scenarios covered:** Lit-reviewer writes synthesis to research log, Spike runner inherits parent model

**Dependencies:** WP-A → **hard dependency**

---

### WP-D: Specialist Subagent Extraction — Infrastructure Agents

**Objective:** Extract conformance-scanner and orientation-writer as specialist subagents.

**Changes:**
- Create `agents/conformance-scanner.md` (model: sonnet) for ADR-to-code comparison
- Create `agents/orientation-writer.md` (model: sonnet) for ORIENTATION.md regeneration
- Update `/rdd-decide` to dispatch conformance-scanner at Step 3.5
- Update `/rdd-conform` to dispatch conformance-scanner for drift detection
- Update orchestrator to dispatch orientation-writer at milestones

**Scenarios covered:** Orientation-writer produces ORIENTATION.md, Conformance scanner agent dispatch

**Dependencies:** WP-A → **hard dependency**

---

### WP-E: Cross-Cutting Hooks

**Objective:** Implement 5 hooks that consolidate cross-cutting concerns currently duplicated across skills.

**Changes:**
- Create `hooks/hooks.json` with all 5 hook configurations
- Create `hooks/scripts/invariant-reminder.sh` (PreToolUse on `docs/`)
- Create `hooks/scripts/epistemic-gate.sh` (Stop during RDD phases)
- Create `hooks/scripts/skill-activator.js` (UserPromptSubmit, RDD intent detection, brainstorming override)
- Create `hooks/scripts/orientation-trigger.sh` (PostToolUse on key artifacts)
- Create `hooks/scripts/sizing-check.sh` (PostToolUse on `docs/`)
- Verify all hooks fire at correct events and inject expected context

**Scenarios covered:** Cross-cutting hooks (4), Skill activator (3)

**Dependencies:** WP-A → **hard dependency**

---

### WP-F: Research Log Archival Update

**Objective:** Move research log archival from start of next cycle to end of current cycle (ADR-036).

**Changes:**
- Update `/rdd-research` to archive `research-log.md` to `research-logs/NNN-descriptive-name.md` after reflections
- Add stale log detection at start of new cycle (archive if found)

**Scenarios covered:** Research log archival (2)

**Dependencies:** None (independent of plugin structure)

---

### WP-G: Namespace Migration and Artifact Corpus

**Objective:** Update all cross-references to plugin namespace and ship the artifact corpus.

**Changes:**
- Update all inter-skill references to `/rdd-research` hyphen pattern (already standard)
- Update orchestrator Available Skills table and workflow modes
- Copy `docs/` into plugin repository
- Update ORIENTATION.md to reflect plugin structure

**Scenarios covered:** Plugin skills use namespaced invocation, Plugin installs with artifact corpus accessible

**Dependencies:** WP-A → **implied logic** (namespace meaningful only in plugin context)

---

### WP-H: Plugin Verification

**Objective:** End-to-end verification that the plugin works as a complete system.

**Changes:**
- Install via `claude --plugin-dir ./rdd` and verify all components load
- Run sample RDD phase invocations through the plugin
- Verify all 192 scenarios (164 existing + 28 plugin architecture)
- Verify all fitness criteria including 9 new plugin criteria
- Verify all boundary integration tests including 14 new plugin tests

**Dependencies:** WP-A through WP-G → **hard dependency** (all plugin components must exist before verification)

---

## Dependency Graph

```
WP-A (Plugin Repo + Manifest) ←── prerequisite for all
     │
     ├── WP-B (Auditor Agents)           WP-F (Log Archival)
     │        open choice                      independent
     ├── WP-C (Research Helper Agents)
     │        open choice
     ├── WP-D (Infrastructure Agents)
     │        open choice
     ├── WP-E (Cross-Cutting Hooks)
     │        open choice
     ├── WP-G (Namespace + Corpus)
     │        implied logic after WP-A
     │
     └── hard dependency ───────── WP-H (Plugin Verification)
```

**Classification key:**
- **Hard dependency:** WP-A is prerequisite for all plugin work (structural necessity). WP-H requires all preceding WPs.
- **Implied logic:** WP-G is simpler after WP-A but could be stubbed.
- **Open choice:** WP-B, WP-C, WP-D, WP-E are genuinely independent. WP-F is fully independent.

## Transition States

### TS-1: Plugin Skeleton with Skills Only (after WP-A)

The plugin installs and all 9 skills work identically to standalone. No agents, no hooks — just a repackaging. This validates the distribution mechanism before adding new layers.

### TS-2: Plugin with Auditor Agents (after WP-A + WP-B)

Citation-auditor and argument-auditor produce durable audit artifacts across research, decide, and synthesis phases. The highest-value extraction — 3 phases benefit immediately. Other specialist work still runs inline.

### TS-3: Plugin with All Agents (after WP-A + WP-B + WP-C + WP-D)

All 6 specialist subagents operational. Full artifact-mediated communication pattern in place. Model-appropriate task routing active (Sonnet for mechanical work, parent model for spikes).

### TS-4: Full Four-Layer Plugin (after WP-A through WP-G)

Complete four-layer architecture: skills orchestrate, agents do specialist work, hooks enforce cross-cutting concerns. Namespace migration complete. Feature-complete but unverified.

### TS-5: Verified Plugin (after WP-H) — Target State

All scenarios satisfied, all fitness criteria met, all boundary tests pass. System Design v6.0 fully realized.

## Open Decision Points

- **WP-B/C/D/E ordering:** All four are open choice after WP-A. A builder might start with WP-B (auditors — highest-impact, clearest boundary) or WP-E (hooks — solves the brainstorming override immediately).
- **Cross-cycle ordering with essays 005/006:** If essay 005/006 WPs are incomplete, the builder must account for merge conflicts in shared skill files. Safest sequence: complete 005/006 first, then 007.
- **Hook script language:** ADR-033 proposes `.sh` for most hooks and `.js` for the skill activator (which needs more complex intent matching). The builder may prefer a single language.
- **Agent audit artifact path convention:** Where should audit artifacts live? `docs/audits/citation-audit-NNN.md` (separate directory) vs. alongside the audited artifact. Not prescribed by system design.
- **Existing standalone skill removal:** After plugin install, users with standalone skills in `~/.claude/skills/rdd-*` need to remove them to avoid conflicts. Migration script vs. documentation — builder decides.

---

## Completed Work Log

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
