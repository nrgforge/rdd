# Roadmap: Pedagogical RDD

**Generated:** 2026-03-30
**Derived from:** System Design v8.0, ADRs 040-042

## Work Packages

### WP-A: AID Cycle in All Gate Sections (ADR-040)

**Objective:** Replace fixed-template epistemic gate prompts with the Attend-Interpret-Decide cycle across all 6 phase skill files. This is the core change — it makes gates engagement-sensitive.

**Changes:**
- Amend `skills/research/SKILL.md` EPISTEMIC GATE section: replace 3 fixed prompts with AID cycle protocol (attend to research-phase signals, interpret, select move with phase-appropriate examples)
- Amend `skills/discover/SKILL.md` EPISTEMIC GATE section: replace 5 fixed prompts with AID cycle
- Amend `skills/model/SKILL.md` EPISTEMIC GATE section: replace 2 fixed prompts with AID cycle
- Amend `skills/decide/SKILL.md` EPISTEMIC GATE section: replace 2 fixed prompts with AID cycle
- Amend `skills/architect/SKILL.md` EPISTEMIC GATE section: replace 3 fixed prompts with AID cycle
- Amend `skills/build/SKILL.md` EPISTEMIC GATE section: replace 2 fixed prompts with AID cycle
- Add supersession note to `docs/decisions/adr-003-phase-specific-epistemic-act-assignments.md` (ADR-003's fixed-assignment table becomes a candidate prompt library, not a fixed selection)

**Scenarios covered:** 11 ADR-040 scenarios: AID for all 5 engagement levels, earned fatigue vs. opacity distinction, contingent shift within gates, anti-sycophancy, Inversion Principle via reframing, AID as pragmatic action (Invariant 3), agent attends before prompt

**Dependencies:** None

---

### WP-B: Reflection Time Naming (ADR-041)

**Objective:** Apply the dual-register naming convention — "reflection time" in user-facing dialogue, "epistemic gate" in research/design vocabulary.

**Changes:**
- Amend all 6 phase skill EPISTEMIC GATE sections: add "Before moving on — reflection time." as the user-facing introduction preceding the AID prompt
- Amend `README.md`: replace "epistemic gates" with "reflection time" in user-facing sentences (lines 71, 91, 93)
- Amend `docs/ORIENTATION.md`: replace "Epistemic gate protocol" with "Reflection time protocol" in current-state section (line 80)
- Internal section headings (`### EPISTEMIC GATE`) may remain as design-vocabulary navigation

**Scenarios covered:** 3 ADR-041 scenarios: agent introduces gates as "reflection time", skill files use dual register, domain model retains primary concept

**Dependencies:** WP-A (implied logic — simpler to add naming after AID sections are rewritten, but could be done in parallel if both builders coordinate)

---

### WP-C: Orchestrator Gate Protocol Update

**Objective:** Update the orchestrator's gate protocol description to reflect the AID cycle, amended Invariant 4, and pace regulator framing.

**Changes:**
- Amend `skills/rdd/SKILL.md` Stage Gates section: replace "present 2-3 exploratory epistemic act prompts" with AID cycle description (attend, interpret, decide with five pedagogical moves)
- Remove "5-10 minutes per gate" from orchestrator text (Invariant 4 amended)
- Add pace regulator framing to deep work tool section
- Add `/rdd-about` to Available Skills table
- Add optional `/rdd-about` mention in ARTIFACT LOCATION "no artifacts found" branch
- Amend `hooks/scripts/epistemic-gate`: recognize AID adaptive prompts as valid gate behavior

**Scenarios covered:** 3 conformance scenarios (orchestrator reflects AID, hook recognizes AID, orchestrator offers /rdd-about to new users)

**Dependencies:** WP-A (implied logic — orchestrator describes the protocol that phase skills implement)

---

### WP-D: /rdd-about Utility Skill (ADR-042)

**Objective:** Create the self-explanation utility for new users and version awareness.

**Changes:**
- Create `skills/about/SKILL.md` with: version reporting (reads plugin manifest), methodology overview (user language), depth-calibrated elaboration
- Ensure `package.json` (or equivalent) version field is accessible

**Scenarios covered:** 5 ADR-042 scenarios: version reporting, methodology overview, depth calibration, orchestrator offers to new users, no artifacts produced

**Dependencies:** None (genuinely independent — can be built at any time)

---

### WP-E: Verification Pass

**Objective:** Verify all 20 new scenarios and updated fitness criteria.

**Changes:**
- Verify all ADR-040 scenarios (11) against phase skills
- Verify all ADR-041 scenarios (3) against skill files, README, ORIENTATION.md
- Verify all ADR-042 scenarios (5) against About Skill and orchestrator
- Verify conformance scenario: orchestrator reflects AID
- Verify Invariant 4 enforcement test: no "5-10 minutes" references remain
- Verify plugin discovers 11 skills (was 10)

**Scenarios covered:** All 20 new scenarios (verification)

**Dependencies:** WP-A (hard), WP-B (hard), WP-C (hard), WP-D (hard)

## Dependency Graph

```
WP-A (AID Cycle)          WP-D (/rdd-about)
       │                        │
  implied logic            independent
       │                        │
WP-B (Reflection Time)         │
       │                        │
  implied logic                 │
       │                        │
WP-C (Orchestrator)            │
       │                        │
       └──── hard dependency ───┘
                    │
             WP-E (Verification)
```

**Classification key:**
- **Hard dependency:** WP-E cannot run until A, B, C, D are complete — verification requires all components
- **Implied logic:** WP-B is simpler after WP-A (naming applies to rewritten sections); WP-C is simpler after WP-A (orchestrator describes the protocol skills implement)
- **Independent:** WP-D (/rdd-about) has no dependency on the gate changes — build any time

## Transition States

### TS-1: Adaptive Gates (after WP-A)

All phase skills use the AID cycle. Gates are engagement-sensitive. The system is functionally complete for the core change — the naming and orchestrator updates are polish. A user running any phase will experience adaptive gates immediately.

### TS-2: Full Adaptive + Named (after WP-A + WP-B + WP-C)

Gates are adaptive, user-facing language is "reflection time", orchestrator protocol is updated, hook recognizes adaptive behavior. The system is coherent for existing users.

### TS-3: Shareable (after all WPs)

`/rdd-about` exists for new users. Version awareness is available. README and ORIENTATION.md use updated language. The plugin is ready for broader sharing.

## Open Decision Points

- **AID section structure:** Each skill's EPISTEMIC GATE section needs to describe what engagement signals to attend to *for that specific phase*. The builder decides the phase-specific signal lists (e.g., RESEARCH: did the user ask follow-up questions during research? ARCHITECT: did the user connect architecture to their mental model?).
- **ADR-003 prompts as candidate library:** The superseded ADR-003's prompt table (self-explanation at RESEARCH, retrieval at MODEL, etc.) becomes a reference library the AID cycle can draw from — not a fixed assignment. The builder decides how to reference this library in the rewritten sections.
- **README scope of changes:** The conformance scan identifies 3 user-facing "epistemic gate" references in README. The builder decides whether to do a broader terminology pass or limit changes to the flagged lines.

---

## Completed Work Log

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
