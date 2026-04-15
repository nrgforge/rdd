# ADR-072: Cycle Shape Declaration — Skipped Phases and Paused State

**Status:** Proposed

## Context

Cycle 015 is a scoped DECIDE+BUILD mini-cycle addressing Issue #10. RESEARCH, DISCOVER, MODEL, and ARCHITECT were explicitly skipped by user-agent agreement because Issue #10 already articulates the problem clearly and the change is a targeted methodology amendment. The orchestrator's Mode D (Custom) explicitly allows this: *"User picks which skills to run and in what order."*

At the DECIDE → BUILD boundary, the Stop hook (ADR-064) fired into an infinite loop. Its logic:

1. Parse the `**Phase:**` field in `docs/housekeeping/cycle-status.md` to identify the current phase.
2. Look up that phase in `hooks/manifests/tier1-phase-manifest.yaml`.
3. Require every artifact the manifest lists for that phase to exist before allowing Stop.

The cycle-status.md Phase field did not parse cleanly. After correction, the hook began correctly identifying `decide` as the current phase and began checking decide-phase artifacts — which existed. But the *aid-cycle-gate-reflection* artifact is produced at the natural close of the gate conversation, and a user-initiated pause (the user stepped away from the keyboard) created repeated Stop events that each blocked on the not-yet-produced note. Roughly 60 hook fires in a row before the user returned.

Two distinct issues surfaced:

1. **Phase-skipping in mini-cycles has no structural representation.** The manifest assumes every cycle has every phase. If a cycle skips phases by explicit agreement (Mode D, scoped cycles, methodology amendments), there is no field for the hook to read that would honor the skip. The phase field was initially written as a prose description ("RESEARCH / DISCOVER / MODEL / ARCHITECT skipped by explicit scoping"), which the hook's regex parsed as phase=research, triggering a false-positive block on research artifacts that were legitimately absent.

2. **In-progress gates and user-away sessions create Stop-hook loops.** The aid-cycle-gate-reflection note is produced in-context at gate close. While the gate conversation is in progress, every Stop event hits a legitimate "note doesn't exist yet" block. If the user is away from the keyboard, the agent emits repeated minimal responses (each triggering another Stop, each triggering another block) with no way for the methodology to distinguish *"agent prematurely stopping — block"* from *"gate legitimately in progress, awaiting user"*.

The first issue is a missing declaration. The second issue is a missing state.

This ADR introduces a minimal cycle-shape declaration schema in cycle-status.md that the Stop hook can read to honor skipped phases and recognize paused cycles, preserving Invariant 8 (mechanisms must be structurally anchored) by keeping the skip/pause visible and explicit.

## Decision

Extend `docs/housekeeping/cycle-status.md` with two optional fields that the Stop hook honors:

**Field 1 — `**Skipped phases:**` — enumerated phases this cycle does not run.**

Format: a comma-separated list of phase names using the canonical lowercase form (e.g., `research`, `discover`, `model`, `architect`, `play`, `synthesize`). Line format:

```
**Skipped phases:** research, discover, model, architect
```

Absent = no phases skipped (standard full-pipeline cycle). When present, the Stop hook skips manifest checks for the enumerated phases entirely — they are treated as having no required artifacts, regardless of manifest content.

**Field 2 — `**Paused:**` — the cycle is deliberately dormant.**

Format: a single line with a date and reason:

```
**Paused:** 2026-04-13 — user stepped away mid-DECIDE gate
```

When present, the Stop hook honors the pause: all per-phase manifest checks short-circuit to allow. The pause is intended to be removed when the cycle resumes; a pause-tracking log entry is also recorded in cycle-status.md (see below).

**Hook behavior changes:**

The Stop hook reads the `**Skipped phases:**` and `**Paused:**` fields from cycle-status.md before dispatching to phase manifest checks.

- If `**Paused:**` is present and non-empty: log the pause to stderr as an advisory notice once per session (using a separate session-scoped marker, e.g., `/tmp/rdd-pause-notice-${SESSION_ID}`, distinct from the existing advisory-mode marker `/tmp/rdd-advisory-${SESSION_ID}` so the two notices don't collide) and return allow without running any manifest check.
- Otherwise, if `**Skipped phases:**` enumerates the current phase: return allow without checking that phase's manifest.
- Otherwise: run the manifest check as before.

The compound check (ADR-064) and revision-aware re-audit reminder continue to fire for non-skipped, non-paused phases.

**Cycle-status convention for pause/resume:**

The cycle-status document gains a new "Pause Log" section (after Phase Status), recording each pause/resume event:

```markdown
## Pause Log

| # | Paused | Resumed | Reason |
|---|--------|---------|--------|
| 1 | 2026-04-13 | 2026-04-13 | User stepped away mid-DECIDE gate |
```

The Pause Log creates an audit trail: the pause is visible, not silent. Invariant 8 is preserved because the skip/pause is a declared, observable structure, not a silent bypass.

**What this ADR does not change:**

- The manifest format itself (no new fields in `tier1-phase-manifest.yaml`).
- The compound check's fabrication detection — it continues to run for non-skipped phases.
- The susceptibility snapshot, gate reflection note, or any other Tier 1 mechanism's *content* requirements for phases the cycle does include.
- Per-phase manifest logic for Mode A (Full Pipeline) cycles — those have no skipped phases and no pause, and the hook behaves exactly as before.

## Rejected alternatives

**Rely on user discipline: the user must know not to stop mid-gate and should use the `**Phase:**` field precisely.** Rejected. This is the same class of failure Invariant 8 addresses in the original direction — relying on agent or user judgment to execute a structural mechanism. The observed loop happened *because* discipline alone is insufficient when the methodology has no structural representation of the state. The fix should be structural, not behavioral.

**Add skipped/paused as agent-inferable fields (e.g., from cycle type).** Rejected. The cycle's shape is a user decision (scoping agreement, explicit pause) and should be declared explicitly in the durable record, not inferred from heuristics. Explicit declaration is a single source of truth the hook can rely on.

**Treat a pause as an environment-variable toggle (e.g., `RDD_PAUSED=1`).** Rejected. Environment variables are session-scoped and invisible to the artifact trail. If the methodology is partly a record of how the cycle unfolded, pauses belong in cycle-status.md where they persist and become reviewable.

**Extend the manifest format to include a "skippable" property per phase.** Rejected. Manifest-level skip would be cycle-independent (applying to all cycles) and would weaken the hook's guarantee for Mode A cycles. Skipping is a cycle decision, not a manifest decision. The field belongs in cycle-status.md.

**Introduce a new hook event ("PhaseTransition") that only fires when the user explicitly advances.** Rejected for this ADR's scope. Changing hook-event semantics is a larger harness-layer change. This ADR operates within the existing PostToolUse + Stop pattern and adds minimal machinery.

## Consequences

**Positive:**

- The Stop-hook infinite-loop failure mode is closed for mini-cycles and user-away sessions.
- Mode D (Custom) cycles gain a structural home — skipped phases are declared visibly in cycle-status.md and the hook honors the declaration.
- Invariant 8 is preserved: the skip/pause is structurally anchored (in cycle-status.md) and observable (by the Stop hook and any human reader). It is not a silent bypass.
- The compound check continues to operate on non-skipped phases, preserving fabrication detection for the phases the cycle does run.
- Scoped cycles (ADR-026) and mini-cycles gain explicit support without requiring per-cycle hook configuration.

**Negative:**

- Introduces two new optional fields in cycle-status.md that future maintainers must understand. Mitigated by the fields being advisory (absent = default behavior).
- Bypasses the compound check for the declared-skipped phases. This is the correct behavior for legitimate skips (Issue 10 has no research essay, so research-phase artifacts make no sense to require), but creates a narrow attack surface: a user could declare "skipped" to evade the check. This is equivalent to a user directly editing cycle-status.md to misrepresent cycle state, which the methodology already cannot prevent and is outside the compound check's threat model.
- Pause-until-resumed is user-driven. If the user never resumes, the cycle remains paused indefinitely. The methodology's position: an indefinitely-paused cycle is a deliberately open state, not a closed or abandoned one — the Pause Log entry has no resume date and remains visible. This is distinct from Graduation (ADR-025) which formally closes a cycle, and from abandonment (no affordance in the methodology). The observability argument for Invariant 8 compatibility depends on the Pause Log being readable, which is a weak structural anchor (it relies on the human reader); acceptable because the pause itself is declared explicitly in cycle-status.md, not silent. A future ADR could add pause-staleness signaling (e.g., auto-surface pauses older than N days) if the accumulation of stale pauses becomes a problem.
- **Known gap — in-progress gate case not covered.** ADR-072's two-field design handles user-away sessions (where `**Paused:**` is set before stepping away) and phase-skipped cycles (Mode D). It does not cover the case where a phase-boundary gate conversation is itself in progress and the user is actively present: neither `**Paused:**` nor `**Skipped phases:**` applies, so the hook runs the manifest check on every Stop between agent turns and blocks on the not-yet-produced gate reflection note. This was demonstrated live during Cycle 015's DECIDE → BUILD gate (two cascading loops) and surfaced by the BUILD-entry susceptibility snapshot (`docs/housekeeping/audits/susceptibility-snapshot-015-build.md`). The gap is documented in scenarios.md under ADR-072's feature block ("In-progress gate conversation does not cascade Stop-hook blocks — deferred") and is explicitly out of Cycle 015's scope (the cycle's target is Issue 10). Follow-up candidates for a future cycle include a hook-side session-scoped block-then-advisory supplement (the alternative flagged by the 015-decide snapshot) or a third cycle-status.md marker (`**Gate in progress:** <phase>`). Pragmatic mitigation until then: the user may set `**Paused:**` at the start of a gate conversation they expect to be interrupted, but this relies on user foresight rather than structural coverage.

**Neutral:**

- Full-pipeline cycles (Mode A) are unaffected — absent fields mean default behavior.
- Advisory-mode corpora continue to behave as today: no compound check, no enforcement. The skipped/paused fields are respected in advisory mode too, but since advisory mode doesn't block, the effect is a cleaner advisory message (no false positives about research-phase artifacts that were legitimately skipped).
- Post-migration enforcement-mode corpora get the structural benefit. This is consistent with ADR-070's migration boundary — the enforcement corpus gains this affordance; pre-migration corpora gain the advisory clean-up.

## Provenance check

*Note on normative status: same situational framing as ADR-071's Provenance check. Included here because the driver chain warranted explicit tracing (ADR-072 was drafted mid-gate in response to a concrete hook-loop failure during Cycle 015 and the decision's context is the observed loop itself).*

The core framing — cycle-shape declaration as a cycle-level (not manifest-level) affordance — originates from the user's own reframing at the DECIDE gate: *"for mini-cycles we should 'pause' via the cycle status doc and allow for side-sessions like this that don't send us into hook loops."* The user identified cycle-status.md as the correct location and named the semantic category (pause) before the agent drafted this ADR.

The two-field split (skipped phases vs. paused) is drafting-time synthesis but grounded: the user's reframing explicitly named the "pause" semantic, while the "skipped phases" semantic emerged from Cycle 015's scoping record which already listed skipped phases as prose.

The rejected alternatives are drafting-time synthesis composed against the user's stated design direction.

Hook-behavior implementation details (advisory notice, short-circuit logic) are drafting-time synthesis derived from the existing Stop hook's advisory-mode pattern (ADR-064).
