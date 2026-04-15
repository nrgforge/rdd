# Active RDD Cycle: Lifecycle Composition in Build Stewardship

**Started:** 2026-04-13
**Cycle number:** 015
**Cycle type:** Methodology amendment (mini-cycle: DECIDE + BUILD only)
**Phase:** build
**Current phase:** BUILD ✅ complete (all five WPs delivered, BUILD gate reflection note produced, BUILD-exit susceptibility snapshot re-dispatched with canonical prompt formatting so the dispatch log captures `expected_path` correctly). Cycle 015 complete pending release tag.
**Skipped phases:** research, discover, model, architect
**Artifact base:** ./docs/
**Driving issue:** [Issue #10 — Build skill: add lifecycle composition to integration verification and stewardship](https://github.com/nrgforge/rdd/issues/10)
**Plugin version during cycle:** v0.7.2 (start)

## Scoping Decision

Issue 10 proposes two concrete build-skill additions (extend composable tests to cover lifecycle sequences; add shared-mutable-state check to Stewardship Tier 1) and names a new category — *lifecycle composition* — the skill does not currently hold. The issue already articulates the problem clearly and cites the proposed changes, so no research question is open.

Mini-cycle scoping (DECIDE + BUILD only) was agreed with the user after a reconnaissance pass established:

- No invariant amendment required — category *addition* to one skill, not cross-cutting rule.
- No upstream phases (research, discover, model, architect) touched.
- No other composable skills (debug, refactor, review) touched.
- No contradictions with existing ADRs.
- Glossary additions (Lifecycle Composition, Shared Mutable State, Lifecycle Boundary) small enough to fold into BUILD without standalone MODEL.

Explicitly ruled out to keep scope tight: taxonomy formalization beyond naming the third case; language-specific mutation semantics; mode-shift enforcement (user deferred — will reapproach across future build cycles); extension to debug/refactor/review skills.

Can-of-worms guardrail: if DECIDE surfaces anything that requires backfill into canonical upstream docs (domain model invariants, system design responsibility matrix, ADRs beyond 071), pause the mini-cycle and reassess scope before continuing.

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | — Skipped (scoped) | — | Issue 10 already articulates the problem; no open research question |
| DISCOVER | — Skipped (scoped) | — | No new stakeholder or job-to-be-done surfaced |
| MODEL | — Skipped (scoped) | — | Three glossary entries folded into BUILD, no invariant amendment |
| ARCHITECT | — Skipped (scoped) | — | No module-boundary changes |
| DECIDE | ✅ Complete | ADR-071 + ADR-072 + scenarios + roadmap | Option 3 at gate: proceed with ADR-072 as designed; hook-side alternative noted but un-examined; BUILD commitments carry forward |
| BUILD | ✅ Complete | Domain model glossary (3 entries) + build skill edits (3 extensions) + Stop hook branches (Paused + Skipped phases) + orchestrator convention + roadmap + ORIENTATION | Multi-cycle composition surfaced as reframe at BUILD gate; documented as six-question follow-up (Issue #14) |
| PLAY | ☐ N/A (not applicable to methodology amendment) | — | — |
| SYNTHESIZE | ☐ N/A | — | — |

## Deferred Work

- **Cycle 014 PLAY** — optional, planned to run after Cycle 015 completes. User committed to running PLAY on Cycle 014 next; any new issues surfaced by PLAY are to be addressed as they come.
- **Mode-shift enforcement question** (asked during Cycle 015 scoping) — user deferred; will reapproach after more build-cycle experience accumulates. Not open as an issue yet.
- **Multi-cycle composition — follow-up cycle candidate** (surfaced during Cycle 015's DECIDE → BUILD gate + BUILD-exit gate, 2026-04-14). The gate conversations surfaced a larger design question than ADR-072 itself addresses: cycle-status.md currently represents a single active cycle, but actual practice involves multiple cycles at different states (paused, mini-cycles, pre-hook cycles needing resumption). The single-cycle model produces hook-loop friction during active gates and leaves pre-hook cycles stranded under enforcement mode.

  **Framing (user-originated at the BUILD gate):** cycle-status.md should represent a stack of cycles at different states, with deliberate mini-cycles auto-pausing outer cycles and pushing onto the stack. The hook would read the active entry (top of stack) rather than the single `**Phase:**` field. ADR-072's two-field design becomes a specialization of this richer schema.

  **Question set for a dedicated follow-up cycle:**

    1. **Cycle-state schema.** What does a multi-cycle cycle-status.md look like concretely? Header fields, nested entries, relationships (parent/child, ordered, active/paused). Does ADR-072's two-field design fold in as a specialization, or do they coexist?
    2. **In-progress-gate case coverage.** With a richer state vocabulary (Active / Paused / Gate-in-progress / Nested), does the in-progress-gate case get its own declared marker, or does it still need a hook-side session-scoped block-once-then-advisory safety net (the un-examined alternative from Cycle 015)?
    3. **Hook-side vs. cycle-state composition.** Are the two approaches mutually exclusive or complementary? Preliminary read: complementary — cycle-state does the deliberate, auditable work; hook-side handles the states the user can't realistically declare in real time (e.g., during a multi-turn gate conversation).
    4. **`/rdd-conform` cycle-shape audit scope.** Pre-hook cycles (started before v0.7.0) don't have ADR-072's cycle-shape fields and can't be resumed cleanly under enforcement mode without them. Conform could gain an audit scope that detects pre-ADR-072 cycle-status.md files and walks the user through populating fields matching the cycle's actual state. Design: what to detect, what to prompt for, what to migrate automatically vs. manually.
    5. **Cycle 8 (rdd-pair) resumption test case.** rdd-pair is paused at MODEL, pre-hooks. Its resumption is a concrete test case for both the multi-cycle schema (if Cycle 014 PLAY starts first, rdd-pair would need to nest or coexist) and the conform cycle-shape audit (its cycle-status predates ADR-072). Any design should validate against this case.
    6. **Methodology graduation interaction.** If cycle-state becomes first-class and multi-cycle composition is supported, does that change what it means to "graduate" (ADR-025)? Graduation currently closes a single cycle's artifact corpus; does it compose with nested cycles, or is it a cross-stack operation?

  **Narrow-gap references:** the specific in-progress-gate case is documented in `docs/scenarios.md` (ADR-072 feature block, deferred scenario) and ADR-072 §Consequences (Negative). Those are the narrow-gap records; this Deferred Work entry captures the broader question set they belong to.

  **Scope note:** This follow-up is methodology-substantive and may warrant full pipeline (RESEARCH / DISCOVER / MODEL / DECIDE / ARCHITECT / BUILD) rather than a mini-cycle — the schema is not yet bounded tightly enough to skip phases responsibly. Explicitly out of Cycle 015's scope.

  **Durable capture:** [Issue #14 — Multi-cycle composition: cycle-status schema + hook-state handling](https://github.com/nrgforge/rdd/issues/14)

## DECIDE Gate Decision (visible record — option 3)

At the DECIDE → BUILD gate, pass-7 argument audit returned clean (zero issues, chains A–I hold). The susceptibility snapshot dispatched at the same boundary returned a significant, in-cycle-applicable finding on ADR-072 meeting all three Grounding Reframe triggers: ADR-072's rejected-alternatives section omits the most proximate alternative — extending the hook's existing session-scoped `/tmp/rdd-advisory-${SESSION_ID}` suppression pattern to the blocking path (block once per session on gate-in-progress, downgrade subsequent fires to advisory).

During the gate conversation, this failure mode manifested live: the Stop hook looped on the missing gate reflection note with no session-scoped suppression. The live failure is empirical content within the scope of the design question.

**Decision:** proceed with ADR-072 as designed. The hook-side alternative is not adopted in the ADR at this time; it is recorded here as un-examined.

**Un-examined alternative (hook-side, live):**

- Extend `NOTICE_MARKER="/tmp/rdd-advisory-${SESSION_ID:-unknown}"` session-scoped one-time-fire pattern to the blocking path.
- Block once per session on gate-in-progress conditions; downgrade subsequent fires to advisory for the remainder of the session.
- Addresses the 60-successive-blocks problem from the harness side without adding fields to cycle-status.md.
- Addresses the in-gate-conversation mini-cycle case (before any cycle-status.md field could be populated) that ADR-072's cycle-status.md two-field design does not cover.

BUILD inherits the commitments in the gate reflection note at `docs/housekeeping/gates/015-decide-gate.md`.

## Feed-Forward Signals

### From scoping conversation

**Settled premises (the user is building on these going into DECIDE):**

1. Issue 10's problem statement is clear enough to skip RESEARCH/DISCOVER/MODEL/ARCHITECT.
2. Lifecycle composition is a category addition to the build skill alongside structural composition, not a replacement.
3. No invariant amendment. No backward propagation sweep anticipated.
4. Scoped to build skill only; no cross-cut to debug/refactor/review.
5. Stop and reassess if DECIDE surfaces anything requiring backfill to canonical upstream docs.

**Open questions (the user is holding these open going into DECIDE):**

1. Whether the system design's Test Architecture table needs a row for lifecycle tests (default: skip unless clearly needed).
2. Whether three glossary entries is the right granularity (may be two, may be four — judgment call during BUILD).

**Specific commitments carried forward to DECIDE:**

1. ADR-071 must cite Issue 10 directly and document the two concrete skill changes.
2. Argument + framing audit must run on ADR-071 alongside Issue 10 and the build skill (which ADR-071 modifies).
3. Scenarios should cover the three concrete failure modes named in Issue 10: cached buffer invalidation, pooled connection mutation, retained registry entry — not abstract "shared mutable state" scenarios.

### From DECIDE gate

**Settled premises (the user is building on these going into BUILD):**

1. ADR-071's three-extension dual-placement structure holds; argument chains A–I sound through seven audit passes.
2. ADR-072's four argument chains hold through seven audit passes; pass-7 re-audit is clean.
3. ADR-072 proceeds as designed (option 3 at gate). Hook-side alternative is not adopted in the ADR at this time.
4. Cycle 015 scope remains DECIDE + BUILD; mini-cycle guardrails still hold.
5. Cycle 014 PLAY remains deferred; run after Cycle 015 completes.

**Open questions (the user is holding these open going into BUILD):**

1. Whether ADR-072's cycle-status.md two-field design is the right design, or whether a hook-side session-scoped block-then-advisory pattern is narrower and sufficient.
2. Whether ADR-072 as currently designed covers the in-gate-conversation mini-cycle shape (during which no cycle-status.md field is yet populated) or whether BUILD must address that case.
3. Whether the gate reflection note workflow in mini-cycles needs its own revisit (timing vs. manifest check).

**Specific commitments carried forward to BUILD:**

1. BUILD implements ADR-072 as designed (two cycle-status.md fields).
2. ADR-071's three concrete skill changes are implemented alongside: composable tests for lifecycle sequences + shared-mutable-state check in Stewardship Tier 1 + glossary entries (Lifecycle Composition, Shared Mutable State, Lifecycle Boundary, plus any adjustments judged during BUILD).
3. The in-gate-conversation mini-cycle loop case is live evidence; if ADR-072's two-field design does not break this specific loop, flag it during BUILD and surface as either an ADR-072 revision or a separate hook-side supplement.
4. If BUILD drifts into Design Amendment territory (material changes to ADR-072's decision, not just implementation detail), pause and reassess whether to reopen DECIDE before continuing.

## Context for Resumption

If this cycle is interrupted and later resumed, the key context is:

- Cycle 014 is complete through BUILD (v0.7.2 shipped 2026-04-13). Its cycle-status is archived at `../cycle-archive/cycle-014-specification-execution-gap-status.md`. Cycle 014 PLAY is still pending.
- Issue 10's scope is established above. Do not re-scope without reopening the conversation with the user.
- The user explicitly asked to minimize RDD ceremony. Stay proportional.
