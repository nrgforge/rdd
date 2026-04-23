# ADR-079: Non-Interrupting Stop Predicate for In-Progress Gate Conversations

**Status:** Proposed

## Context

ADR-072's "Known gap" section explicitly named the failure: *"In-progress gate case not covered. ADR-072's two-field design handles user-away sessions (where `**Paused:**` is set before stepping away) and phase-skipped cycles (Mode D). It does not cover the case where a phase-boundary gate conversation is itself in progress and the user is actively present: neither `**Paused:**` nor `**Skipped phases:**` applies, so the hook runs the manifest check on every Stop between agent turns and blocks on the not-yet-produced gate reflection note."*

This was demonstrated live during Cycle 015's DECIDE → BUILD gate (two cascading loops) and surfaced again in the Cycle 015 BUILD-entry susceptibility snapshot. The Stop hook's current behavior — interrupting on every Stop event — is correct for most situations (a premature stop with required artifacts missing should block) but wrong for the in-progress-gate situation where the artifact is being produced *during* the gate conversation.

Essay 015 §5 maps this to BPMN's distinction between **interrupting and non-interrupting boundary events**. The Stop hook currently operates as an interrupting boundary event — it cancels the activity when triggered. The gate-in-progress scenario calls for non-interrupting behavior — the gate conversation continues; enforcement is deferred until the gate completes. The essay's conclusion: "This makes the fix **primarily a hook-behavior change**: the Stop hook needs a non-interrupting predicate. A schema field (`In-progress gate: true`) is enabling infrastructure; the hook logic is the fix."

The domain-model concept **Non-Interrupting Enforcement** was added in Amendment 19. This ADR specifies the predicate and the schema field that enables it.

## Decision

**1. Per-entry schema field** — `**In-progress gate:**` — declares an active gate conversation.

Format: a single line naming the phase-boundary gate currently in progress:

```
**In-progress gate:** decide → architect
```

Absent (default): no gate is in progress; existing hook behavior applies. When present, the field declares that a phase-boundary gate conversation is actively running and the gate's required artifacts (e.g., `aid-cycle-gate-reflection`) are being produced *during* the gate, not before it.

The field lives per cycle entry in the multi-cycle schema (ADR-078). Like `**Paused:**`, it is set when the gate begins and cleared when the gate completes.

**2. Stop hook non-interrupting predicate.**

The Stop hook reads the top entry's `**In-progress gate:**` field before dispatching to the per-phase manifest check.

- If `**In-progress gate:**` is present and names the current phase boundary: the hook returns **allow** without running the gate-reflection-note check. Other manifest checks for the source phase (the phase the gate is exiting) continue to run — the gate-in-progress declaration relaxes the gate's own artifact requirement, not the source phase's other requirements.
- **Implementation note: identifying the gate artifact in the manifest.** ADR-063's per-phase manifest format lists artifacts per phase without a sub-type field distinguishing "gate artifact" from "phase artifact." For this ADR's selective-skip semantics, the manifest is extended to mark the gate-reflection-note entry with an `artifact_type: aid-cycle-gate-reflection` field (the canonical identifier already used in cycle-status feed-forward references). The hook skips only the entry bearing this identifier when `**In-progress gate:**` is set; all other entries for the source phase continue to run. The `artifact_type` field is optional and back-compatible — entries without it behave as today.
- The hook emits a one-time advisory notice per session (using a separate session marker, distinct from the pause-notice marker established in ADR-072) acknowledging the in-progress gate.
- When the gate completes, the orchestrator (or the user) clears the field; subsequent Stop events run the full manifest check including the now-produced gate-reflection-note check.

**3. Lifecycle — when the field is set and cleared.**

The orchestrator skill is responsible for setting and clearing the field as part of the phase-boundary gate workflow:

- **Set:** at the start of the AID gate ("Before we move on — reflection time.") — the orchestrator updates `cycle-status.md`'s top entry with `**In-progress gate:** <phase-from> → <phase-to>` before the first agent turn of the gate conversation.
- **Cleared:** when the gate-reflection note is written (per ADR-066) — clearing the field signals that the gate has completed and full enforcement resumes.

The set/clear operations are mechanical edits to `cycle-status.md` performed by the orchestrator at the same workflow positions as the AID-gate dispatch and gate-reflection-note write. Anchoring the operations to step-anchored positions in the orchestrator follows Invariant 8.

**4. Compound check behavior.**

The compound check (ADR-064) and revision-aware re-audit reminder continue to fire for **non-gate** dispatches during an in-progress gate. The in-progress-gate predicate relaxes only the gate's own artifact requirement. Specialist subagent dispatches (citation auditor, argument auditor, susceptibility-snapshot evaluator, etc.) that fire during the gate conversation are still subject to fabrication detection.

**5. Failure-mode interaction.**

If the orchestrator fails to set the field (the gate begins but `**In-progress gate:**` is not written), the hook reverts to its existing behavior — the gate-reflection-note check fires and may block. This is the safe failure mode: existing behavior is preserved. The user's mitigation is the same as before this ADR (set `**Paused:**` if interrupted; produce the gate-reflection note if the gate is truly complete).

If the orchestrator fails to clear the field (the gate completes but `**In-progress gate:**` remains set), the gate-reflection-note check is silently skipped on subsequent Stops. This is the unsafe failure mode and is mitigated by:

- The advisory notice firing per session — the user sees that the field is set.
- The Pause Log / activity record showing the gate completion event.
- A `/rdd-conform` audit pass that detects `**In-progress gate:**` set when no gate is actively in progress (heuristic: field has been set for more than one session without the gate-reflection-note being written or the field being cleared).

The unsafe failure mode is acknowledged as a residual risk (the same risk class as ADR-072's "Fails Safe to Allow" pause field — the methodology cannot prevent practitioners from misrepresenting cycle state). The mitigation is observability, not prevention.

## Rejected alternatives

**Hook-side session-scoped block-once-then-advisory** (the alternative the Cycle 015 BUILD-entry susceptibility snapshot considered). The hook detects rapid-fire Stop events and after the first block, switches to advisory mode for the remainder of the session. Rejected as the *primary* fix because it is heuristic (rapid-fire detection has thresholds) and silent (the user does not see why the second block was downgraded). It may still be useful as a safety net for cases where the orchestrator fails to set `**In-progress gate:**`, but it is not the primary mechanism — the explicit declaration is.

**Detect in-progress-gate state by parsing the AID-cycle conversation pattern.** Rejected. The hook does not see conversation content, and parsing the agent's prose to detect "is this a gate conversation" is exactly the lexical-detection failure mode Invariant 8 names. The explicit field is the structural anchor.

**Default the in-progress-gate field to "true" during all phase-boundary periods.** Rejected. "Phase-boundary period" is not a sharp boundary the hook can detect; the AID gate may complete in one exchange or extend into multiple sessions. The field's set/clear is the unambiguous signal.

**Make the field a session-scoped marker** (e.g., `/tmp/rdd-in-progress-gate-${SESSION_ID}`). Rejected for the same reason ADR-072 rejected env-var pauses: session-scoped markers are invisible to the artifact trail. If the gate spans sessions (the user steps away mid-gate, returns the next day), the marker is gone but the gate is genuinely still in progress. The cycle-status.md field persists across sessions because cycle-status.md persists.

**Block all enforcement during in-progress gates** (not just the gate-reflection-note check). Rejected. Other dispatches during the gate (specialist subagents producing audits) should remain subject to fabrication detection. Relaxing only the gate's own artifact requirement is the minimum viable change.

**Add a third state marker (`**Gate in progress:**`) without the broader multi-cycle schema (ADR-078).** Considered. ADR-078 is logically separable from ADR-079, and ADR-079 could ship as a single-entry-only addition to the existing cycle-status.md format. The decision to specify the field as per-entry within the multi-cycle schema reflects the expectation that ADR-078 ships in the same release; if ADR-078 is deferred, ADR-079's field placement adapts to the single-cycle format trivially (field at top of file, not per entry).

## Consequences

**Positive:**

- Closes the in-progress-gate hook-cascade failure mode demonstrated live during Cycle 015.
- Composes with ADR-066's gate reflection note convention: the field declares that the note is being produced during the gate; the note's appearance signals the gate's completion.
- Uses the same structural pattern as ADR-072 (per-entry field that the hook reads before dispatching to manifest check) — methodology consistency.
- The set/clear operations are step-anchored in the orchestrator workflow at concrete positions (start of AID gate; gate-reflection-note write), satisfying Invariant 8.
- The advisory notice gives the user visibility into the field's state, supporting the observability mitigation for the unsafe failure mode.

**Negative:**

- Adds an orchestrator responsibility (set and clear the field) that, if missed, recreates the failure mode. Mitigated by the safe failure mode (existing behavior reverts) and by the field's set/clear being step-anchored in the AID gate workflow.
- The unsafe failure mode (field set, never cleared) skips the gate-reflection-note check silently on subsequent Stops. Mitigated by the per-session advisory notice and a `/rdd-conform` heuristic check; not eliminated. This is the analog of ADR-072's "Fails Safe to Allow" risk applied to a different field.
- One more field in the cycle-status entry schema. The field is optional (default absent) and self-documenting (the value names the phase boundary).

**Neutral:**

- Cycles that complete gates without interruption (the common case where the gate-reflection note is written promptly within a few exchanges) carry no overhead — the field can be set and cleared in the same gate flow without the hook ever needing to read it.
- Single-cycle (pre-ADR-078) cycle-status.md files can use the field at the top level; the hook adapts.
- The compound check's fabrication detection for non-gate dispatches is unchanged.

## Provenance check

The core framing — non-interrupting Stop predicate triggered by an explicit `**In-progress gate:**` field — derives from Issue #14's question 2 ("With a richer state vocabulary..., does the in-progress-gate case get its own declared marker, or does it still need a hook-side session-scoped block-once-then-advisory safety net?") and from essay 015 §5 ("This makes the fix **primarily a hook-behavior change**: the Stop hook needs a non-interrupting predicate"). The BPMN interrupting/non-interrupting boundary-event distinction is essay-grounded. The Non-Interrupting Enforcement concept is in the domain model from Amendment 19. Driver-derived.

The set-at-AID-start, clear-at-note-write lifecycle is drafting-time synthesis grounded in the existing AID gate workflow positions in the orchestrator skill. The set/clear positions are the natural workflow boundaries.

The "compound check still fires for non-gate dispatches during in-progress gates" rule is drafting-time synthesis composed against ADR-064's compound-check scope — the relaxation is targeted at the gate's own artifact, not at all dispatches.

The two-mode failure analysis (safe failure mode = existing behavior; unsafe failure mode = silent skip) and the observability mitigation (advisory notice + conform heuristic) are drafting-time synthesis grounded in ADR-072's "Fails Safe to Allow" treatment.

The one-time advisory notice with a separate session marker (distinct from the pause-notice marker) is drafting-time synthesis composed against ADR-072's existing notice convention — multiple notices need separate markers to avoid collision, as ADR-072 itself observed for the advisory-mode marker.
