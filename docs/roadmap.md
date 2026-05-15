# Roadmap: Pedagogical RDD

**Updated:** 2026-05-14
**Derived from:** System Design v15.0, ADRs 001-093

## Work Packages

*No active cycle. Cycle 018 (Essay-Outline Form Change) shipped at v0.8.6 — see Completed Work Log below. Active WPs would appear here when a cycle is in progress.*

<!-- Archived from active: Cycle 018 detailed WP block. Compact as-built record is in the Completed Work Log below. The full active-section detail (per-WP objectives, scenarios covered, dependency classifications, transition states TS-1 through TS-4, and Open Decision Points) is preserved in the cycle's archived cycle-status (post-graduation) and in `.rdd/audits/integration-verification-018.md`. -->

### (No active cycle WPs.)

The Cycle 018 detailed active block — per-WP objectives, scenarios covered, dependency classifications, transition states TS-1 through TS-4, and Open Decision Points — was archived to the Completed Work Log below at v0.8.6 release. The full per-WP detail is preserved in `.rdd/audits/integration-verification-018.md` (the BUILD WP-F audit) and in the cycle-status archive (post-graduation).

## Completed Work Log

### Cycle 018: Essay-Outline Form Change (ADR-092 + ADR-093)

**Derived from:** ADR-092 (Essay-Outline as RESEARCH artifact form; Pyramid Refinement structural property; Outline-Coherence Signal stewardship trigger); ADR-093 (argument-auditor scope extension; Skill-Structure Layer anchoring per ADR-067-as-updated-by-ADR-089); Essay 017 (Outlines as Research Artifacts — dogfooded both-form production); Domain Model Amendment 23; conformance-scan-018-decide.md (6 expected deferred-sweep items + 4 P3 unexpected debt items consolidated into unified BUILD sweep checklist)
**Cycle type:** Standard cycle (focused methodology amendment)
**Shipped:** v0.8.6 (2026-05-14) — BUILD mode auto per ADR-091

| WP | Title | Status |
|----|-------|--------|
| A | `/rdd-research` skill text — Essay-Outline production per ADR-092 (four-section template; Outline-Production Discipline; Argument-Graph format with MUST anchor + META reserved identifier; Outline-Coherence Signal stewardship with discrimination test; filename pattern updated to `essay-outline-NNN-<slug>.md`; legacy prose-explanation line removed) | Complete |
| B | `agents/argument-auditor.md` skill text — Essay-Outline as fourth named genre per ADR-093 (pyramid graph-traversal across four tiers; expansion-fidelity verification at Boundary 1/2/3 + Reverse 1/2; META audit-time review with P2 misclassification; Discrimination Test routing inline on Boundary 1 / Boundary 2 P1 findings; Pyramid Coverage Map + Expansion-Fidelity Findings output template extensions for Essay-Outline genre) | Complete |
| C | Orchestrator skill text — Essay-Outline naming references (frontmatter description; AVAILABLE SKILLS table; Mode A/B/C workflow sketches; Cross-Phase Integration descriptions; Three-Tier Enforcement substrate example; Essay-Outline-as-Research-Phase-Checkpoint subsection; Artifacts Summary table with both Essay-Outline canonical row and legacy prose-essay row; Important Principles) | Complete |
| D | `docs/ORIENTATION.md` Section 4 polish — top-of-file dateline + "Active cycle" + "What's settled" entries reflect BUILD landing; Section 4 (artifact map) work front-loaded in ARCHITECT | Complete |
| E | Domain Model Amendment 24 — Argument-Graph (as artifact section) concept entry's "auditor consumption is currently judgment-anchored" note updates to "auditor consumption is anchored in `agents/argument-auditor.md` per ADR-093"; small Amendment 24 logged in Amendment Log; no invariant changes | Complete |
| F | Integration verification + Cycle 018 release housekeeping — plugin version bumped 0.8.5 → 0.8.6; ADR-092 + ADR-093 status moved Proposed → Accepted; CHANGELOG v0.8.6 entry; `.rdd/audits/integration-verification-018.md` audit (all fixtures pass; all five invariant enforcement claims verified; all six expected sweep items closed; all four P3 debt items closed or recorded with future-cycle scope); roadmap migration (this entry) | Complete |

**Test fixtures shipped (load-bearing):**
- `hooks/tests/test_essay_outline_form_documented.sh` — 26 assertions; passes.
- `hooks/tests/test_argument_auditor_essay_outline_genre.sh` — 34 assertions; passes.
- All 21 hook tests pass (19 prior + 2 new).

**Summary:**
- The form change replaces prose essay with Essay-Outline as the canonical artifact `/rdd-research` produces — a four-section refinement hierarchy (Abstract Section / Argument-Graph / Citation-Embedded Outline / References) whose Pyramid Refinement property is verifiable by the argument-auditor's pyramid graph-traversal and expansion-fidelity verification at three boundaries plus reverse-direction. The Outline-Coherence Signal fires when the pyramid fails and discriminates scope failures (Boundary 1 → Abstract → Argument-Graph) from discipline failures (Boundary 2 → Argument-Graph → Citation-Embedded Outline). Discrimination Test routing appears inline in audit findings so the practitioner receives the diagnosis directly.
- ADR-092 and ADR-093 ship-together-hard per the cross-ADR integration constraint; the layer separation in ADR-092 §5 is operative only when both ADRs ship in the same pass.
- Backward compatibility preserved: legacy prose essays remain at their existing paths; the argument-auditor's behavior on prose essays, ADRs, and synthesis outlines is unchanged. Reflections and SYNTHESIZE essays retain narrative prose form (ADR-092 §8); the form change is RESEARCH-scoped.
- The methodology gained two structural mechanisms: Pyramid Refinement as a verifiable structural property with an operational compliance test (a/b/c/d), and the Outline-Coherence Signal as a stewardship trigger with discrimination routing. The argument-auditor's scope extended to a fourth named genre with Skill-Structure Layer anchoring per Invariant 8. Outline-Production Discipline operates conventionally per-bullet; expansion-fidelity verification operates structurally at level boundaries (ADR-092 §5 layer separation).
- BUILD ran in auto mode (per ADR-091) — the cycle's character (mechanically well-specified WPs anchored in audited ADRs) matched the auto-mode profile. Stewardship was self-administered via fixture tests + skill-text inspection during the WP-F audit. Auto-mode failure modes (design-alternative examination, scoping-judgment surfacing) did not bite this cycle because WP-A and WP-B were tightly specified by ADR-092 §4–§6 and ADR-093 §2–§5.

**Dependency graph (as-built):**
```
WP-A (Essay-Outline production) ◄─── ship-together hard ───► WP-B (Argument-Auditor genre extension)
        │                                                              │
        ├── implied logic ──► WP-C (Orchestrator naming)               │
        ├── implied logic ──► WP-D (ORIENTATION Section 4 polish)      │
        │                                                              │
        │                                                              └── hard ──► WP-E (Domain Model Amendment 24 follow-on)
        │
        └── (with WP-B, WP-C, WP-D, WP-E) ─── all hard ──► WP-F (integration verification + v0.8.6 release)
```

**Open Decision Points (resolved at BUILD):**
- WP-A/WP-B order within ship-together pass — builder chose WP-A → WP-B (natural sequence: skill text for the producing skill, then the auditor agent that consumes the produced artifact).
- WP-E ships in this BUILD — chose to ship-with-WP-B per ARCHITECT-gate decision (cleaner; aligns v15.0 release vocabulary with the BUILD outcome).
- Aspirational fixture tests beyond the two named — deferred to future stewardship pass per ARCHITECT Open Decision Point #2. The two load-bearing fixtures cover the ship-together constraint and the layer separation; the five aspirational fixtures are inspection-level rather than execution-level and their verification targets are covered by skill-text inspection assertions in the two load-bearing fixtures.
- `Dogfooded Both-Form Production` methodology amendment ADR — deferred to future cycle per RESEARCH feed-forward signal 8 (out of scope for Cycle 018 BUILD).

**Open questions held into future cycles:**
- Outline-Production Discipline reliability under task load (Invariant 8 territory; structurally analogous to Cycle 10 prose-hardening-doesn't-work finding; Pyramid Refinement audit at expansion level is the structural backstop).
- Argument-graph parsing at production-scale Essay-Outlines (cost grows with outline size; calibration emerges from practice).
- F2 SYNTHESIZE-precedent durability (ADR-092 §9 names the form change as upstream extension of the SYNTHESIZE pattern; whether that framing holds as both phases mature is a future-cycle observation target).
- Kim et al. Open Question 7 (input-side susceptibility) — held as Neutral consequence in ADR-092; future-cycle empirical test candidate.

**Methodology-level observations (for future-cycle methodology scope):**
- The ADR-drafting layer is a susceptibility surface neither the audit loop nor the susceptibility snapshot fully scoped. The DECIDE gate's R3 silent-fallback and the user-pushback-driven Context trio swap surfaced this. Candidate future-cycle scope for the argument-auditor: whether to cross-check the primary document's load-bearing trio against the source-material's load-bearing trios.
- The two-fixture-load-bearing + five-aspirational pattern is recorded as a methodology observation worth tracking. Future cycles producing Essay-Outlines will accumulate evidence about whether inspection-level coverage is sufficient or whether the aspirational fixtures should be promoted to load-bearing.
- Auto-mode BUILD ran a load-bearing methodology amendment to completion; the cycle's character matched the mode. The mode-recognized failure modes did not bite. Cycle 017's BUILD ran the same mode; the pattern is replicating as expected.

---



### Cycle 017: Readability & Comprehensibility (Issue #17 + methodology debt)

**Derived from:** ADRs 083-090, Essay 016, conformance-scan-decide-017.md (18 findings across 3 clusters)
**Cycle type:** Standard cycle
**Shipped across:** v0.8.4 (Cycle 017 WPs A–G); v0.8.5 (ADR-091 Dual-Mode BUILD — in-cycle methodology amendment between Cycle 017 close and Cycle 018 entry)

| WP | Title | Commit | Status |
|----|-------|--------|--------|
| A | `/rdd-conform migrate-to-rdd` subcommand implementation (ADR-085 ten-step operation; hook test fixture inclusion) | ce8fd08 (2026-04-28) | Complete |
| B | Hook scripts and test fixtures path-substitution to `.rdd/` (tier1-verify-dispatch, tier1-phase-manifest-check, manifest path_templates, hooks.json orientation-trigger matcher extension) | 001637d (2026-04-28) | Complete |
| C | `/rdd-research` validation-spike decision step at research → discover gate (ADR-087 §3) | 1d1a525 (2026-04-28) | Complete |
| D | Advisory-disposition four-failure-mode classification + In-Progress Phase predicate scope (ADR-088 / ADR-089 / ADR-090 implementation alignment) | 42a5db0 (2026-04-28) | Complete |
| E | `field-guide.md` regeneration for Cycle 016 + 017 amendments | 28ba4f4 (2026-04-28) | Complete |
| F | `/rdd-conform graduation-check` operation for code → doc dangling references (Issue #17) | 67e1032 (2026-04-28) | Complete |
| G | Integration verification + Cycle 017 release housekeeping (v0.8.4) | f2dc530 (2026-04-28) | Complete |

**Summary:**
- Issue #17 named the readability and comprehensibility thread: which artifacts is the agent producing, who reads them, and what value do they provide? Cycle 017 amended the methodology along three axes — Cognitive-Economy Criterion / Outcome Test as admissibility criterion for human-facing artifacts (ADR-083); Pattern A vs. Pattern B catalog for agent-context content placement (ADR-084 — the system-design split is the canonical Pattern B exemplar); `.rdd/` infrastructure relocation (ADR-085 partially superseding ADR-070).
- **Tier 1 Harness Layer demoted to advisory across all modes** per ADRs 088 / 089 / 090 — the v0.8.3 hotfix observation that the blocking semantic was never effective at agent-experience level was formalized as ADR-088 (Stop-hook manifest check is advisory across all modes; State-C claim language amended from "structurally impossible" to "structurally detectable"); ADR-089 amended the Three-Tier Classification's Harness Layer technique to advisory disposition (substrate primacy preserved); ADR-090 amended the In-Progress Phase field role to advisory-noise suppressor (optional; not correctness-critical). Skill-text anchoring (ADR-065) is named as the load-bearing enforcement layer post-v0.8.3.
- **Tightly-scoped prototyping added as Research-phase method** per ADR-087 §3 — alongside lit-review, literature search, and research-methods review, used to ground research in actual interaction and as counterforce against possibility-space explosion. Trigger question is felt (interaction-grounding rationale OR possibility-space-pruning rationale); decision moment at research → discover gate; rejection-with-rationale or run-with-documentation. Beck-port framing calibrated as useful conceptual frame but not load-bearing structural evidence; cycle-as-instance reflection encoded as standing caveat on research-phase outputs.
- **AI-as-orienter non-adopted** per ADR-086 pending operational-criterion conditions — three future-cycle conditions named (Operational Criterion Established, Usage Drift Monitorable, Authority Trade-Off Justified). The methodology distinguishes AI-as-orienter from AI-as-reading-prosthetic conceptually but the literature does not establish a tested criterion separating them in practice.
- Mid-cycle, ADR-091 Dual-Mode BUILD shipped as v0.8.5 (in-cycle methodology amendment between Cycle 017 close and Cycle 018 entry) — formalized the `**BUILD mode:**` field (auto / gated) on cycle-status entries per practitioner choice at BUILD entry; gated default; mode-selection axes are judgment-applied (mechanical-vs-generative work character; practitioner availability; cycle stakes; stewardship locality); auto mode does not catch design-alternative examination or scoping-judgment surfacing — those are gated-mode capabilities.
- Domain model Amendment 21 + Amendment 22 (coordinated three-touch) landed at MODEL / DECIDE phases. Behavior + preservation scenarios + Cycle 017 Acceptance Criteria Table appended to scenarios.md. Interaction specifications for Zero-Prior-Familiarity Reader (new stakeholder type) and Cycle 017 extensions appended to interaction-specs.md. Per ADR-076, each Cycle 017 module amendment carries decomposed `**Fitness:**` properties. Per ADR-074 the v14.0 amendment is a method-additions / amendments amendment — no supersession of prior ADRs of v14.0 itself, but ADR-085 / ADR-088 / ADR-089 are supersession headers on ADR-070 / ADR-064 / ADR-067 (partial). Zero new code modules introduced; one new artifact module (`system-design.agents.md`).

**Dependency graph (as-built):**
```
WP-A (migrate-to-rdd subcommand) ─────── implied ──► WP-B (hook script + test fixture path substitution)
WP-A ─────────────────────────────────── implied ──► WP-F (graduation-check tooling)

WP-C (/rdd-research validation-spike step) — independent
WP-D (Stop-hook advisory + In-Progress Phase predicate) — independent

WP-A, WP-B, WP-C, WP-D ────── all hard ──► WP-E (field-guide regeneration)

WP-A, WP-B, WP-C, WP-D, WP-E, WP-F ─── all hard ──► WP-G (integration verification + release)
```

---

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
