# Roadmap: Pedagogical RDD

**Updated:** 2026-04-22
**Derived from:** System Design v13.0, ADRs 001-082

## Work Packages

### Cycle 016: Methodology Seams (Issues #10–#16)

**Derived from:** ADRs 073-082, Essay 015, conformance-scan-decide-016.md (40 expected gaps in 8 groups)
**Cycle type:** Batch cycle (multi-issue, mixed research depth)
**Note:** Issues #10 (lifecycle composition) and #15 (regex defect) are not in this cycle's WPs — #10 is live-validated in BUILD against the existing ADR-071 mitigation; #15 is a pure-implementation fix that runs alongside the WPs without requiring an ADR.

#### WP-A: cycle-status.md Schema Migration to Cycle Stack Format

**Status:** ✅ Shipped — b90d4a1 (2026-04-23). Cycle 016's active entry migrated to `## Cycle Stack` / `### Active:` format; orchestrator template updated with ADR-078/ADR-079 per-entry fields and nested-cycle spawn procedure; backward-compat with current Stop hook confirmed (no regression in Fails-Safe-to-Allow behavior on `BUILD (next)`).

**Objective:** Migrate `docs/cycle-status.md` from per-file fields (ADR-072) to per-entry fields within a `## Cycle Stack` section, with the active entry on top and paused entries beneath. Establishes the schema that WP-B's hook reads.

**Changes:**
- `docs/cycle-status.md` — schema migration; current Cycle 016 entry becomes the first entry in a Cycle Stack
- Per-entry fields added: `**Cycle number:**`, `**Started:**`, `**Current phase:**`, `**Cycle type:**`, `**Parent cycle:**`, `**Phase at pause:**`, `**Spawned by:**`, `**Pause-on-spawn policy:**`, `**Continue-parent rationale:**`, `**In-progress gate:**`. Existing fields (`**Skipped phases:**`, `**Paused:**`) remain valid per-entry
- Backward-compat preserved: legacy single-entry format continues to work; ADR-072's two fields fold in as per-entry fields

**Scenarios covered:** Multi-Cycle Schema in cycle-status.md (ADR-078) — all eight scenarios

**Dependencies:** None — independent

---

#### WP-B: Hook Layer Changes — Cycle Stack Parser, In-Progress Gate, Applicable_when, Legacy Detection

**Status:** ✅ Shipped — f158af4 (2026-04-23). Hook parses Cycle Stack top entry; in-progress-gate predicate skips aid-cycle-gate-reflection for source phase; applicable_when evaluator supports 5 primitives (cycle_type_in, cycle_type_not_in, phase_not_skipped, parent_cycle_present, parent_cycle_absent) with skip logged to dispatch log; pre-ADR-072 legacy detection forces grandfathered advisory mode per cycle; BUILD (next) parens parse bug fixed. Manifest gained artifact_type on 6 gate-reflection entries and applicable_when on 4 research-phase entries. New hooks/tests/ infrastructure with 6 scenario tests (27 assertions, all green). Paused Cycle 016 via ADR-072 until BUILD phase-exit artifacts exist (8f8a14d) — known methodology gap: mid-phase active work lacks an enforcement-aware mitigation beyond the overbroad Paused field.

**Objective:** Extend `hooks/scripts/tier1-phase-manifest-check.sh` to parse the multi-cycle Cycle Stack, evaluate the in-progress-gate predicate, evaluate `applicable_when` preconditions, and detect legacy pre-ADR-072 cycle-status format for grandfathered advisory mode. Add corresponding fields to `hooks/manifests/tier1-phase-manifest.yaml`.

**Changes:**
- `hooks/scripts/tier1-phase-manifest-check.sh` — Cycle Stack parser (top entry only); in-progress-gate predicate (selective skip on `artifact_type: aid-cycle-gate-reflection`); applicable_when evaluator (5 precondition primitives: `cycle_type_in`, `cycle_type_not_in`, `phase_not_skipped`, `parent_cycle_present`, `parent_cycle_absent`); legacy-format detection + grandfathered advisory mode
- `hooks/manifests/tier1-phase-manifest.yaml` — optional `applicable_when` block per entry; optional `artifact_type` field per entry
- New fixture tests: `test_hook_parses_multi_entry_stack.sh`, `test_hook_skips_gate_artifact_during_in_progress.sh`, `test_hook_detects_legacy_format_and_advisory.sh`, `test_hook_evaluates_applicable_when.sh`, plus nominal-conditions and backward-compat fixtures

**Scenarios covered:** Multi-Cycle Schema (ADR-078) hook scenarios; Non-Interrupting Stop Predicate (ADR-079) all six scenarios; Scope-Adaptive Enforcement (ADR-080) all five scenarios; Grandfathered-Rule Migration (ADR-081) hook-detection scenario

**Dependencies:** WP-A (hard dep — hook reads the schema; without WP-A's schema target, the hook has nothing to parse)

---

#### WP-C: DECIDE Skill Amendments + ORIENTATION.md Role-Separation Note

**Status:** ✅ Shipped — 06cfb50 (2026-04-23). `skills/decide/SKILL.md` extended with role-separation note in Step 2; new Step 2.5 ADR Lifecycle and Supersession Workflow (body-immutable/status-mutable rule, Superseded/Updates header formats, four-step workflow with fitness property for sweep verification, drift decision tree, Step 3.7 relationship); Step 4 extended with Preservation Scenarios subsection (ADR-075) and Cycle Acceptance Criteria Table subsection (ADR-073) with null-coverage judgments for both; Step 5 gained supersession gate check and extended highlights list. ADR template updated to reflect current corpus practice (Rejected alternatives + Provenance check). ADR-074 §3 downstream sweep for ADR-072 Updated by ADR-078 discharged: system-design.md already swept in v13.0 Amendment #14, ORIENTATION.md already swept during ARCHITECT regeneration, domain-model.md Amendment 20 recorded the supersession's impact with per-artifact sweep status, field-guide.md bundled with post-BUILD regeneration (WP-H). All 15 scenarios for ADRs 073/074/075 trace to skill text. ORIENTATION Section 4 role-separation paragraph was already in place from ARCHITECT regeneration — no further edit needed.

**Objective:** Extend `skills/decide/SKILL.md` with Cycle Acceptance Criteria Table production (ADR-073), ADR Supersession Workflow (ADR-074), and Preservation Scenarios (ADR-075). Add the role-separation note (ADR-074) to `docs/ORIENTATION.md` Section 4.

**Changes:**
- `skills/decide/SKILL.md` — Step 4 amended with criteria table production + null-coverage judgment-note; Step 4 amended with preservation scenario production; new section on ADR supersession workflow (body-immutable rule, status-mutable rule, supersession header writer for total replacement and partial Updates relationship, mandatory downstream-artifact sweep, drift decision tree); gate check for supersession header presence on superseding ADRs
- `docs/ORIENTATION.md` — Section 4 (artifact map) gains a brief role-separation paragraph: ADRs as historical record; system-design.md / ORIENTATION.md / domain-model.md / field-guide.md as current-state

**Scenarios covered:** Cycle Acceptance Criteria Table (ADR-073) production scenarios; ADR Body Immutability + Supersession Workflow (ADR-074) all six scenarios; Preservation Scenarios (ADR-075) all four scenarios

**Dependencies:** None — independent (skill text changes; user-facing artifact production)

---

#### WP-D: ARCHITECT Skill Amendment — Fitness Criteria Decomposition Gate Check

**Status:** ✅ Shipped — b46eb4e (2026-04-23). `skills/architect/SKILL.md` extended: Step 5 gained Qualitative Claim Identification subsection (agent walks responsibilities flagging quality language — transparent/seamless/backward-compatible/performant/lossless/isolated/etc. — while concrete responsibilities carry no overhead); Step 9 gained Decomposing Qualitative Claims into Fitness Properties subsection with `**Fitness:** <observable> — <how observed>` format, placement rules (inline or per-module subsection), refutability standard, compositional pathways into ADR-073/075/077, and direction-not-constraint signal for claims that resist decomposition; Step 10 Design Audit item 7 added as a hard gate that refuses advance on undecomposed qualitative claims; system-design.md template updated with optional **Fitness** subsection in Module Decomposition, responsibility-matrix inline-fitness convention, and clarified split between system-level criteria (table) and module-level fitness (inline with claim); Step 12 highlights list extended with decomposed qualitative claims + direction-not-constraint framing. All 5 scenarios for ADR-076 trace to skill text.

**Objective:** Extend `skills/architect/SKILL.md` with the fitness-criteria decomposition gate check (ADR-076). Refuses to advance ARCHITECT phase when any qualitative claim in module responsibilities lacks adjacent `**Fitness:**` properties.

**Changes:**
- `skills/architect/SKILL.md` — Step 5 (Responsibility Allocation) and Step 9 (Fitness Criteria) amended with qualitative-claim identification step; gate check refuses advance unless decomposition is recorded; system-design.md template updated to show the `**Fitness:** <observable> — <how observed>` line format

**Scenarios covered:** Fitness Criteria Decomposition (ADR-076) all five scenarios

**Dependencies:** None — independent

---

#### WP-E: BUILD Skill Amendments — Step 5.5 + Applicability Check

**Status:** ✅ Shipped — 677257a (2026-04-23). `skills/build/SKILL.md` extended with Step 5.5 Cycle Criterion Verification (ADR-073) inserted between existing Step 5 (Integration Verification) and Step 6 (Generate Field Guide); reads the Cycle Acceptance Criteria Table from scenarios.md or acceptance-criteria.md, walks each entry, handles Layer-match yes/no/null-judgment, and triggers a Design Amendment when the specified layer is unreachable from the test harness. Tier 1b Applicability Check (ADR-077) added between Tier 1 and Tier 2 stewardship — triggered (not always-on) per the operative-trigger-only reclassification from the architect → build gate Grounding Reframe; four-prompt composition-not-recitation form with prompt 4 integrating ADR-076 fitness-property consultation; outcomes handle substantive answers, pauseable concerns, and Grounding Reframe fallback for unanswerable prompts; batched application affordance for refactoring-heavy sessions. All 6 ADR-077 scenarios and 2 BUILD-side ADR-073 scenarios trace to skill text (the other 3 ADR-073 scenarios are DECIDE-side and satisfied by WP-C).

**Objective:** Extend `skills/build/SKILL.md` with Step 5.5 Cycle Criterion Verification (ADR-073) and the Applicability Check stewardship-checkpoint (ADR-077, four-prompt form including prompt 4 fitness-property consultation).

**Changes:**
- `skills/build/SKILL.md` — Step 5 amended with new Step 5.5 reading the Cycle Acceptance Criteria Table from `scenarios.md` and verifying each entry at its specified layer; Tier 1 Stewardship Check section amended with Applicability Check trigger conditions and four-prompt form (including prompt 4 reading `system-design.md` fitness properties); Grounding Reframe fallback for unanswerable prompts; "no declared fitness properties" judgment recording

**Scenarios covered:** Cycle Acceptance Criteria Table (ADR-073) BUILD-side scenarios; Applicability Check (ADR-077) all six scenarios

**Dependencies:** WP-C (implied logic — the criteria-table format is established in C; could be stubbed if E ships first); WP-D (implied logic — fitness-property format is established in D; could be stubbed if E ships first)

---

#### WP-F: RESEARCH Skill + Reviewer Agent + Orchestrator — Question-Isolation Protocol

**Objective:** Extend `skills/research/SKILL.md` with the 5-step question-isolation entry protocol (ADR-082). Extend `agents/research-methods-reviewer.md` with the fourth review criterion (incongruity surfacing). Extend `skills/rdd/SKILL.md` Question Toolkit with the seventh form (constraint-removal).

**Changes:**
- `skills/research/SKILL.md` — new Step 0 / entry protocol (5 steps: question articulation, constraint-removal response, reviewer dispatch, revise/accept, research loop begins); classified explicitly as first-line structural (Skill-Structure Layer per ADR-067) with cognitive component
- `agents/research-methods-reviewer.md` — fourth criterion (incongruity surfacing) added to the existing three (need-vs-artifact framing, embedded conclusions, prior-art treatment); reviewer's scope expanded to evaluate the question set as combined research questions + constraint-removal response
- `skills/rdd/SKILL.md` Question Toolkit — seventh form added: "What would we build if [key infrastructure component] were not available?" — primary at research entry; existing six forms unchanged

**Scenarios covered:** Question-Isolation Protocol (ADR-082) all eight scenarios

**Dependencies:** None — independent (skill + agent + orchestrator text changes)

---

#### WP-G: CONFORM Skill Cycle-Shape Audit Operation

**Objective:** Extend `skills/conform/SKILL.md` with a new audit operation (cycle-shape audit) that detects pre-ADR-072 cycle-status.md and walks the user through field migration, preserving prose body verbatim (ADR-081).

**Changes:**
- `skills/conform/SKILL.md` — new operation in the operations table; four-step workflow (detect / read-and-infer / prompt-user / write-migrated-entry); validation case is Cycle 8 (rdd-pair, paused at MODEL, pre-hooks)

**Scenarios covered:** Grandfathered-Rule Migration (ADR-081) audit + migration scenarios + archive-to-active edge case

**Dependencies:** WP-A (hard — needs the new Cycle Stack format as the migration target)

---

#### WP-H: Integration Verification + Release Housekeeping

**Objective:** Verify the 13 boundary integration tests, the Cycle 016 acceptance scenarios, and the conformance-scan re-run. Address Issue #15 (PostToolUse regex defect) as a parallel pure-implementation fix. Live-validate Issue #10's ADR-071 mitigations during this cycle's BUILD work as the implementation evidence.

**Changes:**
- Integration verification: run all 13 new boundary integration tests against the modified system; capture results in `docs/housekeeping/audits/integration-verification-016.md`
- Issue #15 fix: extend `hooks/scripts/post_tool_use.py` (or equivalent dispatch logger) regex to match markdown-formatted `Output path:` lines (bold, backticked, list-item variants) per the seven test fixtures specified in the issue body
- Issue #10 live validation: BUILD's normal stewardship work exercises the ADR-071 lifecycle-composition mitigations; capture observed behavior as field evidence
- Conformance-scan re-run: dispatch `/rdd-conform` after WP-A through WP-G complete; verify the 40 gaps from `conformance-scan-decide-016.md` have closed
- Release housekeeping: bump plugin version in `.claude-plugin/plugin.json`; update README; release notes referencing all ADRs and Issues addressed

**Scenarios covered:** Integration scenarios across all WPs; Issue #15 acceptance fixtures; Issue #10 live validation observations

**Dependencies:** WP-A through WP-G (hard — verification requires the implementations to exist)

## Dependency Graph

```
WP-A (cycle-status.md schema) ──┬── hard ──► WP-B (hook layer)
                                │
                                └── hard ──► WP-G (cycle-shape audit)

WP-C (DECIDE skill) ────────── implied ────► WP-E (BUILD skill — criteria table consumer)

WP-D (ARCHITECT skill) ─────── implied ────► WP-E (BUILD skill — fitness property consumer)

WP-F (RESEARCH + reviewer + orchestrator) — independent

WP-A, WP-B, WP-C, WP-D, WP-E, WP-F, WP-G ──── all hard ────► WP-H (integration verification + release)
```

**Classification key:**
- **Hard dependency:** B cannot be built without A. Examples: WP-B's hook reads the schema WP-A defines; WP-G's audit migrates *to* the schema WP-A defines; WP-H's integration verification requires WP-A through WP-G to exist as targets.
- **Implied logic:** Building A before B is simpler because B references concepts/formats A defines, but a stub is possible. Examples: WP-E's Step 5.5 reads the criteria-table format from WP-C, but BUILD-skill-only changes can be stubbed against a fixture if WP-C is delayed; WP-E's prompt 4 reads the fitness-property format from WP-D, similarly stubbable.
- **Open choice:** Genuinely independent. Examples: WP-A and WP-C and WP-D and WP-F can all be started in any order — no shared substrate, no read/write coupling.

## Transition States

### TS-1: Hook-layer changes operational (after WP-A + WP-B)

cycle-status.md uses the multi-cycle Cycle Stack format; the Stop hook parses it correctly; in-progress-gate cascade-blocks (the Cycle 015 failure mode) are prevented; mini-cycles get scope-adaptive enforcement via `applicable_when` preconditions; legacy pre-ADR-072 cycles get grandfathered advisory mode.

System is coherent at this state: existing skill workflows continue to operate as today; the new infrastructure is available but skill-side workflows have not yet adopted the new patterns. The methodology has fixed its hook-layer pain points (Cycle 015's most acute concerns) without requiring skill adoption.

### TS-2: Skill-side methodology amendments operational (after WP-C + WP-D + WP-E + WP-F + WP-G)

DECIDE produces criteria tables, supersession headers, preservation scenarios; ARCHITECT enforces fitness decomposition; BUILD verifies criteria at specified layers and surfaces applicability checks at pattern reuse; RESEARCH applies the question-isolation protocol; CONFORM offers cycle-shape audit migration.

If TS-2 ships before TS-1: the skill-side amendments operate against the legacy cycle-status format under grandfathered advisory mode (ADR-081 covers this) — methodology remains coherent but the hook-layer pain points persist.

### TS-3: Full Cycle 016 operational (after WP-H)

All boundary integration tests passing; Issue #15 regex defect fixed; Issue #10 live-validated. Plugin version bumped; release notes published. The methodology has gained: criterion-level verification, ADR lifecycle discipline, preservation coverage, fitness decomposition, applicability checks at pattern reuse, multi-cycle composition, non-interrupting in-progress-gate handling, scope-adaptive enforcement, grandfathered legacy support, and question-isolation at research entry.

## Open Decision Points

- **Order of TS-1 vs. TS-2.** Both are coherent transition states. The methodology has a slight bias toward TS-1 first because the in-progress-gate cascade-block is the most acute live-demonstrated failure (Cycle 015 BUILD gate), but TS-2 first is also viable since legacy cycles are advisory regardless. Builder choice based on context.
- **Whether WP-F (question-isolation protocol) ships in this cycle or is deferred.** F has the highest cognitive overhead among the WPs and was reclassified at the DECIDE gate (essay §10 said second-line cognitive; ADR-082 reclassified to first-line structural). If the reclassification proves contested in practice, F could be deferred to a future cycle. If it ships now, the field evidence is captured in this cycle's BUILD.
- **Whether Cycle 014 PLAY is folded into this cycle's BUILD or kept deferred.** PLAY remains deferred from Cycle 014; this cycle's WPs do not require PLAY work. Builder may choose to combine if scoped appropriately.

## Completed Work Log

### Cycle 15: Lifecycle Composition in Build Stewardship (+ ADR-072 mid-cycle)

**Derived from:** ADRs 071, 072, Issue #10
**Cycle type:** Methodology amendment (mini-cycle: DECIDE + BUILD only; RESEARCH / DISCOVER / MODEL / ARCHITECT skipped by explicit scoping)
**Shipped across:** v0.7.3

| WP | Title | Status | Release |
|----|-------|--------|---------|
| A | Domain model glossary — Lifecycle Composition / Shared Mutable State / Lifecycle Boundary | Complete | v0.7.3 |
| B | ADR-071 build skill edits — three-sided catch (COMPOSABLE TESTS §Lifecycle Composition + Step 5 anchor + Stewardship Tier 1 sub-item 6e) | Complete | v0.7.3 |
| C | ADR-072 hook script — Stop hook honors Skipped phases and Paused fields | Complete | v0.7.3 |
| D | ADR-072 convention documentation — cycle-status.md template + Pause Log in orchestrator skill | Complete | v0.7.3 |
| E | Integration verification + housekeeping | Complete | v0.7.3 |

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
