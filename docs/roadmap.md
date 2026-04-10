# Roadmap: Pedagogical RDD

**Updated:** 2026-04-09
**Derived from:** System Design v12.0, ADRs 063-070, Invariant 8

## Work Packages

Cycle 10 operationalizes Invariant 8 (mechanism execution must be structurally anchored) across three enforcement substrates: Skill-Structure Layer (per-phase dispatch sites in phase skills), Harness Layer (dispatch log + Stop hook compound check against per-phase manifest), and User-Tooling Layer (AID cycle graduated to gate reflection note). The work is separated into five implementation WPs and one verification WP, with a split release across two plugin versions.

**Release plan (per ARCHITECT-phase decisions):**

- **v0.7.0** ships WP-A + WP-B + WP-C + WP-D + WP-F(behavioral). Corpus stays in advisory mode until the user opts in. Skill files ship with pre-migration paths (`docs/essays/audits/...`) per ADR-070's Transitional State.
- **v0.7.1** ships WP-E + WP-F(migration dogfood). The `/rdd-conform migrate` subcommand lands; the RDD plugin's own corpus is migrated as the first user of the pattern.

**Priority within v0.7.0 — WP-B is the load-bearing primary fix.** Essay 014 §5 names the skill-structure fix as the direct response to Cycle 10's diagnostic; hooks (WP-A) are defense-in-depth on top, not a replacement. If v0.7.0 runs into friction and tradeoffs need to be made, WP-B's per-phase susceptibility snapshot dispatches are the minimum fix that resolves the 0% historical coverage gap the cycle is predicated on. WP-A's compound check is the backup that catches WP-B's remaining risk (silent fallback, sophisticated State C) but does not substitute for the primary anchoring. Builders should treat WP-B as the cycle's must-ship and WP-A as the cycle's should-ship. This priority is a pacing commitment from DECIDE-phase 2026-04-09 — cycle-specific urgency because the enforcement mechanisms being baked in are what give Invariant 8 its capacity for methodology self-auditing.

### WP-A: Harness Layer — Manifest + Compound Check Hooks (ADRs 063/064)

**Objective:** Install the Harness Layer infrastructure so that pre-migration corpora run in advisory mode and migrated corpora run in enforcement mode. This is the foundational work package — it can ship before any skill-file edits and operates in advisory mode until migration runs.

**Changes:**
- Create `hooks/manifests/tier1-phase-manifest.yaml` with `format_version: 1` and all 8 phases' `required_mechanisms` entries (susceptibility-snapshot-evaluator per phase, citation-auditor/argument-auditor for research and synthesize, research-methods-reviewer for research, argument-auditor for decide, `aid-cycle-gate-reflection` per phase, with `path_template` values using pre-migration paths `docs/essays/audits/...` that will be updated during WP-E migration)
- Create `hooks/scripts/tier1-verify-dispatch.sh` (PostToolUse matcher: `Agent`) — extracts `subagent_type` and `Output path:` line from `tool_input.prompt`; appends JSONL entry to dispatch log; Fails-Safe-to-Allow
- Create `hooks/scripts/tier1-phase-manifest-check.sh` (Stop event) — reads phase and cycle from cycle-status, loads manifest, performs compound check, advisory/enforcement mode detection via marker file, revision-aware reminder, Fails-Safe-to-Allow with GitHub issue surfacing
- Register both hooks in `hooks/hooks.json`
- Create `.github/ISSUE_TEMPLATE/hook-failure.md` with fields for plugin version, hook name, stderr diagnostic, OS/shell environment, sanitized hook input JSON
- Append `docs/housekeeping/dispatch-log.jsonl` to `.gitignore`
- Update system design dependency graph and fitness criteria to reflect the new infrastructure

**Scenarios covered:** Per-Phase Manifest Format (2341-2374), Compound Check (2376-2424), Advisory Mode (2426-2451), Fails-Safe-to-Allow (2453-2467), Revision-Aware Re-Audit Reminder (2469-2490), Compound check integration scenario (2713)

**Dependencies:** None (foundational). The corpus remains in advisory mode until WP-E migration runs — this is the designed graceful degradation from ADR-064.

---

### WP-B: Skill-Structure Layer — Anchor Dispatch (ADR-065)

**Objective:** Add per-phase susceptibility snapshot dispatch to each of the 8 phase skills at a structurally privileged position, and audit existing Tier 1 dispatch sites against the canonical prompt skeleton and position requirements.

**Changes:**
- **Fix 1:** Add a "Phase Boundary: Susceptibility Snapshot Dispatch" subsection to each phase skill (`skills/research/SKILL.md`, `skills/discover/SKILL.md`, `skills/model/SKILL.md`, `skills/decide/SKILL.md`, `skills/architect/SKILL.md`, `skills/build/SKILL.md`, `skills/play/SKILL.md`, `skills/synthesize/SKILL.md`) at the bottom-third position (phase-end). Each subsection contains the canonical prompt skeleton with phase-specific brief content and `Output path: docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md` (pre-migration path — updated in WP-E)
- **Fix 2:** Audit existing Tier 1 dispatches in `skills/research/SKILL.md` (citation-auditor, argument-auditor, research-methods-reviewer), `skills/decide/SKILL.md` (argument-auditor), and `skills/synthesize/SKILL.md` (citation-auditor, argument-auditor); ensure each dispatch prompt includes the literal `Output path:` line
- **Fix 3:** Position audit — relocate any middle-third dispatch sites to top or bottom third per Spike S4's lost-in-the-middle finding
- Remove the orchestrator-centralized susceptibility snapshot dispatch instruction from `skills/rdd/SKILL.md` (move to per-phase placement)
- Update `agents/susceptibility-snapshot-evaluator.md` to honor phase-keyed output paths (include `{phase}` token in path template)

**Scenarios covered:** Anchor Dispatch scenarios (2492-2523), canonical skeleton integration scenario (2713)

**Dependencies:** Open choice relative to WP-A (the canonical prompt skeleton has value independent of the hook — it documents the contract; but the PostToolUse hook's extraction behavior only exercises the skeleton once WP-A ships). Recommended sequencing: WP-A ships first, WP-B follows within the same plugin release.

---

### WP-C: User-Tooling Layer — Gate Reflection Note (ADR-066)

**Objective:** Graduate the AID cycle at phase boundaries from purely conversational to artifact-producing by requiring a gate reflection note at a canonical path. Extend the manifest with the gate reflection mechanism entry.

**Changes:**
- Update orchestrator (`skills/rdd/SKILL.md`) Stage Gates protocol to include gate reflection note production instruction: at each phase boundary, compose a gate reflection note at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md` (or `docs/essays/gates/...` pre-migration — this directory does not pre-exist, so WP-C creates it directly at `docs/housekeeping/gates/` if the housekeeping directory exists, or at a fallback path if not; the fallback handling is advisory-mode-aware)
- Add gate reflection note format specification to orchestrator protocol (5 required headers, 4 required fields per ADR-066) with explicit AID privacy instruction (omit engagement interpretation from note content)
- Add gate reflection note production to each phase skill's standalone gate protocol (so the skill produces the note whether invoked via orchestrator or standalone)
- Update `hooks/manifests/tier1-phase-manifest.yaml` (updates WP-A deliverable) to add `aid-cycle-gate-reflection` mechanism entries per phase with `min_bytes: 800` and required_headers/required_fields
- Document the compound defense pattern in the orchestrator as cross-cutting principle (three components: manifest check, susceptibility snapshot, belief-mapping; non-overlapping coverage zones; extensible)
- Document the reframe-derailed gate limitation explicitly in the orchestrator and in the gate reflection note specification

**Scenarios covered:** Gate Reflection Note (2525-2553), Compound Defense (2555-2568), Grounding Reframe extension integration scenario (2721)

**Dependencies:** Hard dependency on WP-A (needs the manifest mechanism to extend). WP-C's gate reflection note enforcement only becomes active in enforcement mode (post-migration via WP-E).

---

### WP-D: Three-Tier Classification + Grounding Reframe Extension + Methodology Scope-of-Claim (ADRs 067/068/069)

**Objective:** Document the Three-Tier Enforcement Classification with four-step decision procedure, extend the Grounding Reframe protocol to fire on significant snapshot findings with three significance properties, and document the methodology scope-of-claim (competence without independent second-order critique).

**Changes:**
- Add Three-Tier Enforcement Classification section to orchestrator (`skills/rdd/SKILL.md`) as cross-cutting principle: three substrates (Skill-Structure, Harness, User-Tooling), unified principle ("anchor to a concrete, mechanically-unavoidable step with observable output"), not a priority hierarchy, four-step decision procedure for classifying new mechanism proposals
- Add Grounding Reframe Extension to orchestrator: two triggers (unassessable sycophancy risk from ADR-059; significant snapshot finding from ADR-068), three significance properties (specificity, actionability, in-cycle applicability), in-cycle course correction at the boundary principle
- Add Methodology Scope-of-Claim to orchestrator: positive scope (5 items: competent first-order analysis, Tier 1 structural resistance, conversational mechanisms, compound defense, provenance via architectural drivers) and negative scope (3 items: agent does not independently generate second-order critique, "independent" is load-bearing, guarantee rests on mechanisms firing); failure mode / success mode dichotomy as a watch item
- Add Centered-vs-Infrastructure Framing to orchestrator as cross-cutting principle (ADR-064 sub-commitment that lives in the orchestrator even though its implementation lives in Conformance Audit Skill migration)
- Update domain model glossary cross-references where orchestrator describes these concepts

**Scenarios covered:** Three-Tier Classification (2570-2594), Grounding Reframe Extension (2596-2617), Methodology Scope-of-Claim (2619-2631), Three-substrate decision procedure integration scenario (2728)

**Dependencies:** Open choice relative to WP-B and WP-C (documentation-level changes in the orchestrator; they do not structurally depend on the hook infrastructure or the skill-file edits). Can be implemented in parallel with any of WP-A, WP-B, or WP-C.

---

### WP-E: Housekeeping Migration — `/rdd-conform migrate` Subcommand (ADR-070)

**Objective:** Implement the `/rdd-conform migrate` subcommand that moves infrastructure artifacts to `docs/housekeeping/`, updates path references across the corpus, writes the migration version marker to transition the Stop hook from advisory to enforcement mode, and extend `/rdd-conform` with three new audit scopes. **This WP ships atomically with WP-B's skill file edits per ADR-070's atomicity requirement.**

**Changes:**
- Add `migrate` subcommand to `skills/conform/SKILL.md` with the 10-step operation: idempotency check, uncommitted-changes refusal, create housekeeping subdirectories, move audits, move cycle-status, perform mechanical reference substitution across ADRs / essays / spike reports / skill files / manifest / domain model / ORIENTATION, write version marker, append `.gitignore`, write rollback manifest, produce summary report
- Update skill files' canonical paths from `docs/essays/audits/` to `docs/housekeeping/audits/` (atomic with WP-B Fix 1's dispatch paths)
- Update `hooks/manifests/tier1-phase-manifest.yaml` `path_template` values from pre-migration to post-migration paths (updates WP-A deliverable atomically)
- Update path references in `docs/decisions/*.md` (prior ADRs), `docs/essays/014-specification-execution-gap.md` (Cycle 10 essay), `docs/essays/research-logs/*.md` (Cycle 10 spike reports), `docs/domain-model.md` (Amendment Log entry #17), `docs/ORIENTATION.md` (Section 4 artifact map)
- Add three new audit scopes to `skills/conform/SKILL.md`: housekeeping directory organization audit, gate reflection note template alignment audit, dispatch prompt format audit
- Verify the audit scopes do not auto-correct (produce finding reports only)

**Scenarios covered:** Housekeeping Migration (2633-2682), rdd-conform Scope Extension (2684-2709), Housekeeping migration enables enforcement-mode integration scenario (2734)

**Dependencies:** **Hard dependency on WP-B** per ADR-070's atomicity requirement — ADR-065's skill-file edits and ADR-070's path updates must ship as a single atomic change. Shipping WP-B without WP-E's path updates means skill files and manifest reference pre-migration paths (acceptable — advisory mode). Shipping WP-E without WP-B's skill edits means the manifest would reference housekeeping paths while skill files still dispatched to pre-migration paths (not acceptable — false negatives on every phase boundary). Recommended release sequencing: ship WP-A + WP-B in one plugin release (advisory mode); ship WP-C + WP-D + WP-E in a subsequent release (or in the same release if ready). WP-E's migration itself is opt-in per user via `/rdd-conform migrate`.

---

### WP-F: Verification Pass (split across v0.7.0 and v0.7.1)

**Objective:** Verify Cycle 10 scenarios against the implementation, run the new `/rdd-conform` audit scopes, dogfood `/rdd-conform migrate` on the RDD plugin's own corpus as the first user of the pattern, and verify the Stop hook transitions from advisory to enforcement mode post-migration. Verification is split across the two releases to match the release plan.

#### WP-F(v0.7.0): Behavioral Verification

**Verification ordering** (per DECIDE-phase priority commitment 2026-04-09): WP-B's primary-fix verification runs **first**, before WP-A's compound-check verification. If WP-B's verification passes, the cycle's primary success criterion is met — the susceptibility snapshot mechanism fires reliably via the per-phase dispatch sites, addressing the 0% historical coverage gap Cycle 10 is predicated on. WP-A's verification is secondary — it verifies the defense-in-depth catches residual failure modes (silent fallback, sophisticated State C) but does not substitute for the primary fix.

- **First — WP-B primary fix verification:**
  - Manually trigger a phase boundary in each of the 8 phase skills (research, discover, model, decide, architect, build, play, synthesize) via a controlled test cycle
  - Verify the "Phase Boundary: Susceptibility Snapshot Dispatch" subsection fires — the agent reaches the bottom-third position and executes the dispatch
  - Verify the dispatch prompt contains the canonical prompt skeleton with the phase-specific brief from Appendix A of the system design
  - Verify the `Output path:` line references the correct pre-migration path for that phase
  - Verify the susceptibility-snapshot-evaluator runs and produces its artifact at the expected path
  - Verify the `rdd-conform` dispatch prompt format audit flags no middle-third placements in any skill file (Fix 3)
  - Verify existing Tier 1 dispatches (citation-auditor, argument-auditor, research-methods-reviewer) in research/decide/synthesize skills have the canonical `Output path:` line (Fix 2)
  - If any of these fail, stop and remediate before proceeding to WP-A verification — the primary fix is the cycle's load-bearing commitment
- **Second — WP-A defense-in-depth verification:**
  - Verify `hooks/manifests/tier1-phase-manifest.yaml` is present with correct schema per ADR-063
  - Verify the PostToolUse hook fires on Agent dispatches and appends JSONL entries to `docs/housekeeping/dispatch-log.jsonl` with correct schema
  - Verify the Stop hook enters advisory mode (corpus is pre-migration) and emits the once-per-session stderr notice directing to `/rdd-conform migrate`
  - Verify the Stop hook's compound check logic runs against the dispatch log (even though it does not block in advisory mode) — confirm logical correctness
  - Verify Fails-Safe-to-Allow fires on induced hook errors (malformed manifest, missing cycle-status) with the GitHub issue surfacing notice
  - Verify the revision-aware reminder logic works when an audited document is modified after its last dispatch (mtime comparison)
- **Third — WP-C verification:**
  - Verify gate reflection notes are produced at the expected path (`docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md`) at each phase boundary
  - Verify note content matches the ADR-066 template (5 required headers, 4 required fields)
  - Verify the note omits the engagement interpretation (AID privacy across media)
  - Verify the manifest's `aid-cycle-gate-reflection` entry catches missing notes structurally (even in advisory mode, verify the logic)
- **Fourth — WP-D verification:**
  - Read `skills/rdd/SKILL.md` and verify Invariant 8 is named in cross-cutting principles
  - Verify Three-Tier Enforcement Classification is documented with four-step decision procedure
  - Verify Grounding Reframe Extension is documented with three significance properties
  - Verify methodology scope-of-claim is documented with positive and negative scope
  - Verify centered-vs-infrastructure framing is documented
- **Scenario verification:**
  - Run each of Cycle 10's v0.7.0-scoped scenarios against the implementation (scenarios 2341-2631 cover ADRs 063-069; 2713-2733 integration scenarios for compound check + canonical skeleton + compound defense + three-substrate decision)
  - Record pass/fail with remediation for each failure
- Update cycle-status.md with v0.7.0 verification outcomes
- Flag the pre-existing drift in system-design.md (graduate skill missing from module list; 12-vs-15 skill count inconsistency) as out-of-scope for Cycle 10 but needing future attention

**Dependencies:** Hard dependency on WP-A, WP-B, WP-C, WP-D (all v0.7.0 implementation WPs complete before verification).

#### WP-F(v0.7.1): Migration Dogfood Verification

- Run `/rdd-conform migrate` on the RDD plugin's own corpus — review the diff via `git diff`, verify the summary report, verify the rollback manifest at `docs/housekeeping/.migration-rollback.json`, verify the marker file at `docs/housekeeping/.migration-version` is written with the v0.7.1 version string
- Verify the migration moves audits from `docs/essays/audits/` to `docs/housekeeping/audits/`, moves `docs/cycle-status.md` to `docs/housekeeping/cycle-status.md`, and creates the empty `docs/housekeeping/gates/` directory
- Verify mechanical reference substitution across prior ADRs, the Cycle 10 essay, spike reports, skill files, manifest, domain model, and ORIENTATION
- Verify the migration refuses to run with uncommitted skill file changes (simulate by staging a change and running migrate)
- Verify the migration is idempotent (run twice; second run no-ops)
- Verify the migration does not touch `docs/cycle-archive/`, `docs/essays/reflections/`, `docs/essays/research-logs/`
- Verify the Stop hook transitions from advisory to enforcement mode on the next session after migration
- Verify the compound check in enforcement mode actively blocks on a missing Tier 1 artifact with a specific failure-mode reason
- Verify the compound check catches test State B (remove a required artifact — expect block with "never dispatched" reason) and trivial State C (stub an audit artifact below the size floor — expect block with "size floor failure" reason)
- Run each of Cycle 10's v0.7.1-scoped scenarios (2633-2709 cover ADR-070 migration and new audit scopes; 2734-2739 cover migration-to-enforcement integration scenarios)
- Run the three new `/rdd-conform` audit scopes (housekeeping directory organization audit, gate reflection note template alignment audit, dispatch prompt format audit); verify each fires and produces expected finding reports
- Update cycle-status.md with v0.7.1 verification outcomes
- Close Cycle 10 and update the "Completed Work Log" below

**Scenarios covered:** All ~45 Cycle 10 scenarios (2341-2739) across both release verifications

**Dependencies:** Hard dependency on WP-E (v0.7.1 implementation) and on WP-F(v0.7.0) having shipped cleanly.

---

## Dependency Graph

```
WP-A (Harness Layer: Manifest + Hooks)
       │
       ├────────── hard dep ──────────┐
       │                              │
WP-B (Skill-Structure Fix)     WP-C (User-Tooling Layer)
       │                              │
       │                              │
       └────────── hard dep ──────────┴─── atomic ──→ WP-E (Housekeeping Migration)
                                                            │
WP-D (Three-Tier + Grounding Reframe                       │
      Ext + Scope-of-Claim) ────── open choice ────────────┤
                                                            │
                                                      WP-F (Verification)
```

**Classification key:**
- **Hard dependency:** WP-C hard-depends on WP-A (needs manifest mechanism to extend). WP-E hard-depends on WP-B (atomic shipping requirement per ADR-070 — path updates in skill files and manifest must move in lockstep). WP-F hard-depends on WP-A/B/C/D/E (terminal verification).
- **Atomic shipping unit:** WP-B + WP-E ship as a single atomic change per ADR-070. They can be drafted separately but must land together.
- **Open choice:** WP-D is genuinely independent of WP-A/B/C/E at the documentation level — it can be built in parallel with any other WP. WP-A and WP-B are open choice relative to each other in drafting, but share a coupling around the canonical prompt skeleton that is operational only when both are present.
- **Implied logic:** Building WP-A before WP-B is simpler (the hook infrastructure gives the skill-file edits something to verify against during development), but a skilled builder could do them in either order.

## Transition States

### TS-1: Harness Layer Installed, Advisory Mode (after WP-A)

Compound check hooks are installed and the manifest is present. The Stop hook detects the absence of `docs/housekeeping/` and enters advisory mode. Tier 1 dispatches are logged to a dispatch log in whatever location exists (or not at all if the directory doesn't exist). The methodology continues to work normally. The PostToolUse hook fires on Agent dispatches but has no canonical `Output path:` line to extract yet (unless WP-B is also shipped). Users see the advisory-mode stderr notice once per session directing them to `/rdd-conform migrate`.

This is a coherent state. The corpus can remain here indefinitely.

### TS-2: Skill-Structure Fix Applied, Still Advisory Mode (after WP-A + WP-B)

Per-phase susceptibility snapshot dispatches fire from each phase skill at the bottom-third position. The canonical prompt skeleton is in place, so the PostToolUse hook extracts output paths correctly. Dispatch log is populated with real entries. Advisory mode is still active because the migration hasn't run. The compound cross-reference is logically functional but not enforced — the Stop hook reads the dispatch log but emits advisory notices instead of blocks on failures.

Critical improvement over TS-1: the susceptibility snapshot mechanism now fires reliably at its structurally-anchored dispatch site (the 0% → target rate change Cycle 10's diagnostic predicted). This is the primary fix; the harness layer is defense-in-depth.

### TS-3: Full Tier 1 Infrastructure Documented, Still Advisory Mode (after WP-A + WP-B + WP-C + WP-D)

All infrastructure is in place. Gate reflection notes are produced at phase boundaries (or the orchestrator attempts to produce them, with advisory-mode fallback if `docs/housekeeping/gates/` doesn't exist yet). The orchestrator documents Invariant 8, the Three-Tier Classification with decision procedure, the Grounding Reframe Extension, the methodology scope-of-claim, and the compound defense. The methodology is epistemically complete; the only remaining step is the physical migration.

### TS-4: Enforcement Mode Active (after WP-E migration runs)

The corpus has `docs/housekeeping/.migration-version` present. The Stop hook transitions to enforcement mode. Compound check actively blocks on missing Tier 1 artifacts with specific failure-mode reasons. The structural guarantee against sophisticated State C holds. Gate reflection notes are enforced as phase-transition preconditions. The methodology's self-auditing capability under Invariant 8 is operational.

This is the target state. WP-F verifies this transition end-to-end on the RDD plugin's own corpus (the methodology is its own first user — dog-food consistency).

## Open Decision Points (resolved at the ARCHITECT gate, 2026-04-09)

All six open decisions surfaced during the ARCHITECT phase were walked through and resolved at the gate. Preserved here as a decision log so future cycles can see how similar questions got handled.

1. **Whether to ship WP-A + WP-B in a single plugin release or split into two releases.** Arguments: single release avoids a state where skill-file edits are ceremonial without the hook to exercise them; split release reduces the atomic shipping unit's size. **Resolved: single release** — both ship in v0.7.0. The canonical prompt skeleton in skill files has no operational value without the PostToolUse hook to extract it, so splitting would leave a release where the skill-file edits are ceremonial rather than operational.

2. **Whether to ship WP-C + WP-D + WP-E in the same release as WP-A + WP-B, or in a subsequent release.** Arguments: same release lands the entire Cycle 10 architecture coherently; subsequent release isolates WP-E's large migration diff (~70 ADRs + essays + skill files) from the other work. **Resolved: split release** — v0.7.0 = WP-A + WP-B + WP-C + WP-D + WP-F(behavioral); v0.7.1 = WP-E + WP-F(migration dogfood). The split gives v0.7.0 time to stabilize in the wild (such as it is — RDD has few users beyond the plugin author at this stage) before committing to the migration pattern. Corpus stays in advisory mode between releases per ADR-064's graceful degradation.

3. **Whether to run `/rdd-conform migrate` on the RDD plugin's own corpus as part of WP-F, or as a separate follow-up commit.** Arguments: dog-food consistency argues for WP-F inclusion; git history readability argues for separation. **Resolved by Decision 2** — the split release naturally isolates the migration dogfood into v0.7.1's verification pass. No additional decision needed; the migration happens in its own release, committed and verified as its own operation.

4. **Per-phase brief content for the susceptibility snapshot dispatch in each phase skill (WP-B Fix 1).** Arguments: defer to WP-B implementation time; draft now as design-phase artifact; draft template now and defer concrete briefs. **Resolved: draft now** as design-phase artifact. The ARCHITECT phase produced 8 phase-specific briefs in Appendix A of `docs/system-design.md`, each referencing concrete Cycle 10 findings where applicable and naming phase-specific risks. Placement: appendix rather than co-located with module entries, to keep the main module descriptions clean and make the briefs discoverable as a set for WP-B implementation. Maintenance note added: briefs are anchored in time and may need refresh as future cycles produce new canonical failure modes.

5. **Whether to add a fitness criterion that every phase skill's snapshot dispatch uses phase-specific brief content (not generic template).** Arguments: adds a self-check for WP-B implementation; "phase-specific" is semantic rather than structural and risks being gamable or unverifiable. **Resolved: skip.** The existing cross-cutting non-formulaic criterion (from ADR-056 — "Gate prompts compose forms with specific artifact content; no template recitation; each instance references specific content") already covers the principle at the methodology level. Appendix A's briefs are the design commitment. WP-F verification reads skill files against Appendix A as part of verifying ADR-065 Fix 1 landed correctly.

6. **Whether to encode the DECIDE-phase RED-phase urgency commitment more concretely in the architecture.** Arguments: the urgency is a pacing commitment, not an architectural feature, and belongs outside the architecture; but consequential enough that it should leave a trace. **Resolved: (b) + light (d)** — added a priority note at the top of this section (Work Packages introduction) flagging WP-B as the load-bearing primary fix, and updated WP-F to run WP-B's primary-fix verification first before WP-A's defense-in-depth verification. This honors the DECIDE commitment without adopting the TDD framing as load-bearing architectural metaphor (per the DECIDE → ARCHITECT snapshot Finding 2 restraint — the competing frame "the test runner IS the invariant's function" remains honest alongside the TDD analogy).

### Bonus decision (raised at the ARCHITECT gate presentation, not in the original list)

7. **Whether to name the compound check's advisory-mode conditional nature more prominently in the orchestrator's scope-of-claim.** Arguments: keep the scope-of-claim focused on cross-cutting commitments and let ADR-specific qualifications live in ADR-specific text; or elevate the enforcement-mode conditional nature to the scope-of-claim explicitly so users reading the orchestrator see the full honest picture without needing to cross-reference ADR-064. **Resolved: elevate it.** Added a second negative-scope item to the methodology scope-of-claim documentation in the Orchestrator module's ownership description: the compound check's structural guarantee applies only in enforcement mode; pre-migration corpora operate with WP-B's skill-structure fix but without harness-layer compound verification. This honors the user-as-non-maintainer product principle from ADR-064 consistently across ADR-069's scope-of-claim level and the Harness Layer ADR-064 level.

### Pre-existing drift (out of scope for Cycle 10, noted for follow-up)

- The `skills/graduate/` directory exists in the codebase but is missing from system-design.md's Module Decomposition section. Predates Cycle 10 (introduced at commit `db28ebb` during Cycle 4 as an extraction from the Conformance Audit Skill).
- System design fitness criterion line 1177 says "Plugin loads 10 skills" in the plugin discovery row, but actual is 15 (about, architect, build, conform, debug, decide, discover, graduate, model, play, rdd, refactor, research, review, synthesize). Consistent undercount across versions — the count hasn't been updated alongside new skill additions.

Both are surfaced in WP-F as observations and should become a separate backlog item after Cycle 10 closes. Cycle 10's scope is Invariant 8 operationalization, not system-design.md drift remediation.

## Completed Work Log

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
