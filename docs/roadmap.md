# Roadmap: Pedagogical RDD

**Updated:** 2026-04-28
**Derived from:** System Design v14.0, ADRs 001-090

## Work Packages

### Cycle 017: Readability & Comprehensibility (Issue #17 + methodology debt)

**Derived from:** ADRs 083-090, Essay 016, conformance-scan-decide-017.md (18 findings across 3 clusters)
**Cycle type:** Standard cycle
**Notes:** Path-migration work (Cluster 1, ~160 references across 23 files including hook test fixtures) is the largest mechanical scope. Skill-text and tooling work (Cluster 3) is smaller in volume but functionally significant. Advisory-language documentation debt (Cluster 2) was partly discharged at DECIDE (domain-model.md Amendment 22) and at ARCHITECT (system-design.md, system-design.agents.md, ORIENTATION.md). Field-guide.md and BUILD-time skill-text edits remain.

#### WP-A: `/rdd-conform migrate-to-rdd` Subcommand Implementation

**Objective:** Implement the `migrate-to-rdd` subcommand of `/rdd-conform` per ADR-085 §4 ten-step operation. Idempotent via `.rdd/.migration-version` marker; refuses uncommitted changes; produces summary report. Performs reference substitution across all affected files **including hook test fixtures explicitly** per the conformance scan finding (ADR-085 §10).

**Changes:**
- `skills/conform/SKILL.md` — new operation description in operations table; ten-step workflow (idempotency check; create `.rdd/` + subdirectories; move `audits/`, `gates/`, `cycle-status.md`, `dispatch-log.jsonl`, `.migration-version`; move `session/` → `.rdd/session/`; mechanical reference substitution sweep; `.gitignore` updates; write marker; produce report)
- Implementation must include the explicitly enumerated hook test fixtures in the substitution sweep: `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh`
- Reference substitution targets: `docs/decisions/*.md`, `docs/essays/*.md`, `skills/**/SKILL.md`, `hooks/manifests/tier1-phase-manifest.yaml`, `hooks/scripts/*.sh`, `hooks/tests/**/*.sh`, `docs/domain-model.md`, `docs/ORIENTATION.md`, `docs/system-design.md`, `docs/system-design.agents.md`
- New fixture tests: `test_conform_migrate_to_rdd_basic.sh`, `test_conform_migrate_to_rdd_idempotent.sh`, `test_conform_migrate_to_rdd_hook_fixtures.sh`

**Scenarios covered:** `.rdd/` Infrastructure Relocation (ADR-085) all migration scenarios; idempotency scenarios; hook test fixture inclusion scenario

**Dependencies:** None — independent

---

#### WP-B: Hook Script + Test Fixtures Path Substitution

**Objective:** Update `hooks/scripts/tier1-verify-dispatch.sh`, `hooks/scripts/tier1-phase-manifest-check.sh`, and the manifest's `path_template` values to read/write `.rdd/...` paths post-migration. Add backward-compat fallback for pre-migration corpora reading `.rdd/...`.

**Changes:**
- `hooks/scripts/tier1-verify-dispatch.sh` — dispatch log path read from `.rdd/dispatch-log.jsonl` first; legacy fallback to `.rdd/dispatch-log.jsonl`
- `hooks/scripts/tier1-phase-manifest-check.sh` — cycle-status.md read from `.rdd/cycle-status.md` first; legacy fallback; `.rdd/.migration-version` mode marker check; same fallback pattern
- `hooks/manifests/tier1-phase-manifest.yaml` — all `path_template` values updated from `.rdd/{audits,gates}/...` to `.rdd/{audits,gates}/...`
- **`hooks/hooks.json` (orientation-trigger matcher extension — surfaced at Cycle 017 ARCHITECT gate):** extend the orientation-trigger hook's PostToolUse matcher to fire on writes to `system-design.agents.md` alongside the existing system-design.md, domain-model.md, scenarios.md targets. One-line config edit; mechanical. Without it, edits to the companion file alone do not trigger ORIENTATION.md regeneration prompts — a sync-mechanism gap relative to the four sync mechanisms confirmed at the gate.
- Hook test fixtures — `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, `test_parses_cycle_stack_phase.sh` — fixture data updated to `.rdd/...` paths
- New fixture tests: `test_hook_reads_rdd_path_with_legacy_fallback.sh`, `test_hook_dispatch_log_writes_rdd_path.sh`, `test_orientation_trigger_fires_on_system_design_agents.sh`

**Scenarios covered:** Hook script path-update scenarios from ADR-085; backward-compat scenarios

**Dependencies:** WP-A (implied logic — WP-B's substitutions are mostly executed by the migration subcommand; WP-B implementation can stub references manually for testing without the migration running)

---

#### WP-C: `/rdd-research` Skill-Text Edit at Research → Discover Gate (ADR-087 §3)

**Objective:** Add the validation-spike decision step to `skills/research/SKILL.md` immediately before the research → discover gate's reflection-time prompt. Felt-trigger question + rationale-recording requirement. The skill text encodes prototype-or-no-prototype as a felt-judgment decision (not mandatory) per ADR-087 §3 anti-elaboration positioning.

**Changes:**
- `skills/research/SKILL.md` — new step at the gate position composing the trigger question (interaction-grounding rationale OR possibility-space-pruning rationale); rejection-with-rationale handling; spike-running with findings integration into essay before essay-as-checkpoint advance
- New fixture test: `test_research_validation_spike_step_anchored.sh`

**Scenarios covered:** Validation-Spike Research Method (ADR-087) all scenarios

**Dependencies:** None — independent

---

#### WP-D: Stop-Hook Manifest Check Advisory Disposition (ADR-088 / ADR-089 / ADR-090 implementation alignment)

**Objective:** Confirm the v0.8.3 advisory disposition is implemented across all modes per ADR-088 — the Stop-hook manifest check emits model-visible advisories rather than blocks. Update `hooks/scripts/tier1-phase-manifest-check.sh` advisory-output formatting to name failing mechanism with four-failure-mode classification. Implement In-Progress Phase predicate per ADR-090 (advisory-noise suppressor when field present and matching).

**Changes:**
- `hooks/scripts/tier1-phase-manifest-check.sh` — advisory output across all modes; four-failure-mode classification in advisory text; In-Progress Phase predicate evaluation (advisory-noise suppression when field matches current phase); ensure no exit code emits block disposition
- Update `skills/conform/SKILL.md` audit scopes — soft note for missing In-Progress Phase field (informational, not finding) per ADR-090
- New fixture tests: `test_hook_manifest_check_advisory.sh`, `test_hook_in_progress_phase_suppresses_advisory.sh`

**Scenarios covered:** Phase-Manifest Check Advisory (ADR-088), Three-Tier Classification's Harness Layer Revision (ADR-089), In-Progress Phase Field Role (ADR-090)

**Dependencies:** None — independent (the v0.8.3 release shipped this disposition; WP-D is the methodology-conformance verification that the implementation aligns with the ADRs)

---

#### WP-E: `field-guide.md` Regeneration

**Objective:** Regenerate `docs/references/field-guide.md` to reflect: (a) Cycle 017 module amendments and the new artifact module `system-design.agents.md`; (b) post-migration `.rdd/` paths per ADR-085; (c) advisory-disposition language updates per ADR-088 / ADR-089. Discharges the deferred sweep from Cycle 017 DECIDE for `field-guide.md`.

**Changes:**
- `docs/references/field-guide.md` — full regeneration after Cycle 017 BUILD scope is implemented
- References to `.rdd/` paths updated to `.rdd/` paths
- References to ADR-064 / ADR-067 framings updated to v0.8.3 advisory-disposition language

**Scenarios covered:** Field-guide regeneration (ADR-023 base scenarios + Cycle 017 path/disposition updates)

**Dependencies:** WP-A through WP-D (hard — field guide regenerates after the implementation work it documents)

---

#### WP-F: Graduation-Check Tooling for Code→Doc Dangling References (Issue #17)

**Objective:** Implement a pre-graduation scan that detects corpus-internal identifier strings (work-package numbers, ADR numbers, axis labels) in codebase candidates before they ossify into durable artifacts. Modeled on Tan et al. 2024's detection tool, in the reverse direction (code → doc rather than doc → code). Mechanism is structurally anchored at the moment of graduation (Invariant 8). Candidate work package per essay 016 §4.3.

**Changes:**
- New script: `hooks/scripts/graduation-check.sh` (or `skills/conform/SKILL.md` extension as a graduation-prep audit operation) — scans codebase for patterns matching `WP-[A-Z]`, `ADR-NNN`, axis labels declared in scoped-cycle artifacts; produces report with file:line locations for each match; user reviews before graduation
- Skill-text addition to `/rdd-graduate` (existing skill) referencing the pre-graduation scan as recommended step
- New fixture test: `test_graduation_check_detects_code_doc_dangling_refs.sh`

**Scenarios covered:** Graduation-check scenarios (Issue #17 candidate)

**Dependencies:** WP-A (implied — the migration-version marker semantics are useful for graduation-check's detection logic; could ship independently)

---

#### WP-G: Integration Verification + Release Housekeeping

**Objective:** Verify all Cycle 017 boundary integration tests pass, the conformance-scan re-runs cleanly, and the deferred-sweep discharge is complete (system-design.md, system-design.agents.md, ORIENTATION.md, field-guide.md all reference `.rdd/` paths and v0.8.3 advisory-disposition language). Bump plugin version. Release notes.

**Changes:**
- Integration verification: run all new boundary integration tests against the modified system; capture results in `.rdd/audits/integration-verification-017.md`
- Conformance-scan re-run: dispatch `/rdd-conform` after WP-A through WP-F complete; verify the 18 findings from `conformance-scan-decide-017.md` have closed
- Release housekeeping: bump plugin version in `.claude-plugin/plugin.json`; update README with Cycle 017 readability changes; release notes referencing all ADRs and Issue #17

**Scenarios covered:** Integration scenarios across all WPs; conformance-scan closure verification

**Dependencies:** WP-A through WP-F (hard — verification requires the implementations to exist)

## Dependency Graph

```
WP-A (migrate-to-rdd subcommand) ─────── implied ──► WP-B (hook script + test fixture path substitution)
WP-A ─────────────────────────────────── implied ──► WP-F (graduation-check tooling)

WP-C (/rdd-research validation-spike step) — independent

WP-D (Stop-hook advisory + In-Progress Phase predicate) — independent

WP-A, WP-B, WP-C, WP-D ────── all hard ──► WP-E (field-guide regeneration)

WP-A, WP-B, WP-C, WP-D, WP-E, WP-F ─── all hard ──► WP-G (integration verification + release)
```

**Classification key:**
- **Hard dependency:** B cannot be built without A. Examples: WP-E's field guide regenerates from the implementation in WP-A through WP-D; WP-G's verification requires all WPs to exist as targets.
- **Implied logic:** Building A before B is simpler. Examples: WP-A's migration sweep handles most of WP-B's substitutions automatically; WP-A's marker semantics inform WP-F's graduation-check detection logic; either could ship first with stubs.
- **Open choice:** Genuinely independent. WP-A, WP-C, WP-D can all be started in any order — no shared substrate.

## Transition States

### TS-1: Migration tooling operational (after WP-A + WP-B)

The `/rdd-conform migrate-to-rdd` subcommand exists and works. Hook scripts + test fixtures + manifest read `.rdd/` paths post-migration with backward-compat fallback to `.rdd/...`. Practitioners can run the migration on existing corpora; pre-migration corpora continue to operate under advisory disposition.

System is coherent at this state: existing skill workflows continue to operate; migration is opt-in; advisory disposition handles both placements.

### TS-2: Skill-side amendments operational (after WP-C + WP-D)

`/rdd-research` includes the validation-spike decision step at the research → discover gate. Stop-hook advisory disposition is verified and the In-Progress Phase predicate suppresses noise during phase work. Practitioners running RESEARCH can choose to ground research in actual interaction via tightly-scoped prototyping. Advisory output is calibrated for visibility without ceremony.

If TS-2 ships before TS-1: the skill-side changes operate; pre-migration corpora continue to use legacy paths in dispatch and audit artifacts.

### TS-3: Documentation discharge complete (after WP-E)

`field-guide.md` regenerates with the Cycle 017 path-and-disposition updates. The four-artifact downstream sweep from ADR-074 (system-design.md, system-design.agents.md, ORIENTATION.md, domain-model.md, field-guide.md) is fully discharged for Cycle 017's three concurrent supersessions (ADR-085, ADR-088, ADR-089).

### TS-4: Graduation-check tooling available (after WP-F)

The pre-graduation scan tool detects code → doc dangling references; integrated into `/rdd-graduate` workflow as recommended step. Issue #17's nomenclature-leakage thread has tooling support in addition to skill-text discipline.

### TS-5: Full Cycle 017 operational (after WP-G)

All boundary integration tests passing; conformance-scan-decide-017.md findings closed; plugin version bumped; release notes published. The methodology has gained: Cognitive-Economy Criterion / Outcome Test as admissibility criterion (cross-cutting); Pattern A/B catalog for agent-context placement (with the system-design split as canonical exemplar); `.rdd/` infrastructure relocation; v0.8.3 advisory disposition formalized; tightly-scoped prototyping as research method; AI-as-orienter non-adoption with future-cycle conditions; In-Progress Phase field role-shift; graduation-check tooling for code → doc dangling references.

## Open Decision Points

- **Order of TS-1 vs. TS-2.** Both are coherent transition states. The methodology has a slight bias toward TS-1 first because the migration unblocks the path-and-disposition updates in TS-3, but TS-2 first is also viable since skill text changes do not depend on migration. Builder choice based on context.
- **Whether WP-F (graduation-check tooling) ships in this cycle or is deferred.** F is the most exploratory WP — the reverse-direction code → doc detection is a novel research/engineering contribution per essay 016 §4.3 with no direct prior art. If the implementation surfaces unanticipated complexity, F could be deferred to a dedicated cycle. If it ships now, the field evidence is captured in this cycle's BUILD.
- **Hook backward-compat fallback duration.** WP-B's backward-compat fallback to `.rdd/...` paths supports pre-migration corpora indefinitely. A future cycle may consolidate the migrations or remove the fallback when migration adoption is complete. Open scope for follow-up.

## Completed Work Log

### Cycle 016: Methodology Seams (Issues #10–#16)

**Derived from:** ADRs 073-082, Essay 015, conformance-scan-decide-016.md (40 expected gaps in 8 groups)
**Cycle type:** Batch cycle (multi-issue, mixed research depth)
**Shipped across:** v0.8.0–v0.8.x (with v0.8.2 / v0.8.3 hotfixes during Cycle 017 entry)

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | cycle-status.md schema migration to Cycle Stack format (ADR-078) | b90d4a1 (2026-04-23) | Complete |
| B | Hook layer changes — Cycle Stack parser, in-progress gate, applicable_when, legacy detection (ADRs 078/079/080/081) | f158af4 (2026-04-23) | Complete |
| C | DECIDE skill amendments + ORIENTATION role-separation note (ADRs 073/074/075) | 06cfb50 (2026-04-23) | Complete |
| D | ARCHITECT skill amendment — fitness criteria decomposition gate check (ADR-076) | b46eb4e (2026-04-23) | Complete |
| E | BUILD skill amendments — Step 5.5 + Applicability Check (ADRs 073/077) | 677257a (2026-04-23) | Complete |
| F | RESEARCH skill + reviewer agent + orchestrator — question-isolation protocol (ADR-082) | 9dd999e (2026-04-23) | Complete |
| G | CONFORM skill cycle-shape audit operation (ADR-081) | 67b5ddf (2026-04-23) | Complete |
| H | Integration verification + release housekeeping | (multiple) | Complete |

**Summary:**
- Issue cluster (#10–#16) named seven methodology seams — boundaries where the methodology specified the shape on each side but not the relationship between them. Cycle 016 was a multi-issue batch cycle addressing all seven (Issue #15 — PostToolUse regex defect — was a pure-implementation fix that ran alongside the WPs without requiring an ADR).
- **ADR-073** introduced the Cycle Acceptance Criteria Table for emergent/aggregate criteria with layer-match verification (Step 5.5 in BUILD).
- **ADR-074** formalized ADR body immutability + status mutability + IETF-style Updates/Obsoletes supersession workflow with mandatory downstream-artifact sweep.
- **ADR-075** introduced preservation scenarios as the negative-space complement to behavior scenarios.
- **ADR-076** added the fitness-criteria decomposition gate check to ARCHITECT (qualitative claims must have adjacent `**Fitness:**` properties before phase advance).
- **ADR-077** added the applicability check at BUILD pattern reuse with four-prompt form including consultation of system-design.md fitness properties (integrated structural defense per ADR-076 + ADR-077 prompt 4).
- **ADR-078 + ADR-079 + ADR-080 + ADR-081** added the multi-cycle Cycle Stack schema with non-interrupting Stop predicate during in-progress gates, scope-adaptive enforcement via `applicable_when` precondition composition, and grandfathered enforcement for pre-ADR-072 cycles.
- **ADR-082** added the 5-step question-isolation protocol at RESEARCH entry with constraint-removal as the seventh Question Toolkit form.
- Mid-cycle, **two methodology hotfixes** shipped during Cycle 017 RESEARCH entry: v0.8.2 introduced the In-Progress Phase predicate to fix a Stop-hook cascade observed at RESEARCH Step 1.1; v0.8.3 demoted the manifest check to advisory across all modes after the user observed the original blocking semantic was never effective at agent-experience level. These hotfixes generated methodology debt — ADR-088 / ADR-089 / ADR-090 in Cycle 017 — but the structural shape of Cycle 016's interventions remains current.

**Dependency graph (as-built):**
```
WP-A (cycle-status schema) ──┬── hard ──► WP-B (hook layer)
                             └── hard ──► WP-G (cycle-shape audit)

WP-C (DECIDE skill) ────── implied ────► WP-E (BUILD skill — criteria table consumer)
WP-D (ARCHITECT skill) ─── implied ────► WP-E (BUILD skill — fitness property consumer)
WP-F (RESEARCH + reviewer + orchestrator) — independent

WP-A through WP-G ───────── all hard ───► WP-H (integration verification + release)
```

---

### Cycle 15: Lifecycle Composition in Build Stewardship (+ ADR-072 mid-cycle)

**Derived from:** ADRs 071, 072, Issue #10
**Cycle type:** Methodology amendment (mini-cycle: DECIDE + BUILD only)
**Shipped across:** v0.7.3

| WP | Title | Status | Release |
|----|-------|--------|---------|
| A | Domain model glossary — Lifecycle Composition / Shared Mutable State / Lifecycle Boundary | Complete | v0.7.3 |
| B | ADR-071 build skill edits — three-sided catch | Complete | v0.7.3 |
| C | ADR-072 hook script — Stop hook honors Skipped phases and Paused fields | Complete | v0.7.3 |
| D | ADR-072 convention documentation — cycle-status.md template + Pause Log | Complete | v0.7.3 |
| E | Integration verification + housekeeping | Complete | v0.7.3 |

**Summary:**
- Issue #10 named a methodology gap: the build skill's test and stewardship guidance addressed integration risk at type boundaries (mock vs. real) and structural boundaries (wrong module, wrong direction) but not lifecycle boundaries — where shared mutable state, ordered operations, and ambiguous ownership across components determine correctness.
- **ADR-071** added Lifecycle Composition as a named category in the build skill, anchored at three concrete workflow steps (design-time prompt, verification-time anchor, review-time detector).
- **ADR-072 scope creep surfaced mid-cycle** in response to a live hook-loop failure: the Stop hook fired 60+ times in succession while the user was away mid-DECIDE gate. ADR-072 added two optional header fields to cycle-status.md (`**Skipped phases:**`, `**Paused:**`) plus a Pause Log section, and extended the Stop hook to honor them.
- Known gap surfaced and deferred: ADR-072's two-field design did not cover the in-progress-gate case — addressed by Cycle 016 ADR-079 with `**In-progress gate:**` field and non-interrupting Stop predicate.

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
- Added **Invariant 8** (mechanism execution must be structurally anchored) via domain model Amendment 17.
- Built the three-substrate enforcement architecture: Skill-Structure Layer, Harness Layer, User-Tooling Layer.
- Added `/rdd-conform migrate` 10-step subcommand for the housekeeping migration.
- Added three new audit scopes (housekeeping organization, gate reflection note template alignment, dispatch prompt format).
- WP-F verification surfaced **nine latent defects** in the hook infrastructure missed by the synthetic test suite, all fixed inline.
- **First live operational Tier 1 dispatch in project history** at the build phase boundary.
- **Note (Cycle 017 amendment):** ADR-064 / ADR-067 / ADR-070 amended in Cycle 017 (advisory-disposition demotion + path migration). The Cycle 10 architecture remains foundational; the Cycle 017 amendments calibrate the enforcement disposition and path placement.

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

**Summary:** Two new specialist subagents (research-methods-reviewer, susceptibility-snapshot-evaluator); argument auditor extended with framing audit; AID cycle extended with susceptibility signals + Question Toolkit + assertion-aware observation; Two-Tier Sycophancy Resistance principle (Tier 1 unconditional + Tier 2 context-responsive); Grounding Reframe pattern; essay-as-checkpoint enforcement.

---

### Cycle 8: Pair-RDD (paused)

*Cycle 8 research complete (Essay 012). Cycle paused — Cycle 9 (sycophancy) took priority. Resume requires reconciling corpus intersection vs. live pairing session as two distinct design problems.*

---

### Cycle 7: Composable Skill Family

**Derived from:** ADRs 048-054, Essay 011

| WP | Title | Status |
|----|-------|--------|
| A | Context Gathering Protocol + Conformance Fixes | Complete |
| B | Debug Skill | Complete |
| C | Refactor Skill | Complete |
| D | Build Skill Rewrite | Complete |
| E | Orchestrator Integration | Complete |
| F | Verification Pass | Complete |

**Summary:** Shared Context Gathering protocol; `/rdd-debug` (hypothesis-trace-understand-fix); `/rdd-refactor` (Three-Level Refactor + AI Smell Taxonomy); `/rdd-build` rewrite as outer loop with mode-shift composition; orchestrator integration.

---

### Cycle 6: Code Review Utility Skill

**Derived from:** ADRs 043-047, Essay 010

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Review Skill File | d9a9937 | Complete |
| B | Build Skill Stewardship Callout | d9a9937 | Complete |
| C | Orchestrator Integration | d9a9937 | Complete |
| D | Verification Pass | d9a9937 | Complete |

**Summary:** `/rdd-review` utility skill with two operating modes; three-tier question-driven output; test quality evaluation with mutation testing lens; time-budget adaptation; reviewer autonomy safeguards.

---

### Cycle 5: Adaptive Epistemic Gates

**Derived from:** ADRs 040-042, Essay 009 (work pending in roadmap as carried forward)

---

### Cycle 4: Play and Interaction Specification

**Derived from:** ADRs 037-039, Essay 008

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Interaction Specification Layer | db28ebb | Complete |
| B | Play Skill | db28ebb | Complete |
| C | Orchestrator and Downstream Integration | db28ebb | Complete |
| D | Verification Pass | db28ebb | Complete |

---

### Cycle 3: Plugin Architecture

**Derived from:** ADRs 031-036, Essay 007

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | Plugin Repository and Manifest | 22bf389 | Complete |
| B | Auditor Agents | 4cca9b5, f7a3ed5 | Complete |
| C | Research Helper Agents | 5f2faec, a976de0 | Complete |
| D | Infrastructure Agents | 5f2faec, a976de0 | Complete |
| E | Cross-Cutting Hooks | 9203ad2 | Complete |
| F | Research Log Archival Update | 37884e6 | Complete |
| G | Namespace Migration and Artifact Corpus | c97fbec, 315bdb8, 6349c67 | Complete |

**Summary:** Created `nrgforge/rdd` plugin repository with four-layer architecture (9 skills + 6 specialist subagents + 5 cross-cutting hooks). Skill renames, marketplace distribution, manifesto.

---

### Cycle 2: Synthesis Enrichment

**Derived from:** ADRs 027-030, Essay 006 (commit a4abbf3)

---

### Cycle 1: Roadmap, Field Guide, Conformance, Scoped Cycles

**Derived from:** ADRs 022-026, Essay 005 (commit 4ad5f24)
