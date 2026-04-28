# ADR-090: In-Progress Phase Field — Advisory-Noise Suppressor After v0.8.3

**Status:** Proposed

## Context

The `**In-progress phase:**` field was introduced in v0.8.2 (mid-Cycle-017) as an emergency response to a Stop-hook cascade observed at RESEARCH Step 1.1: every agent turn during pre-dispatch (awaiting user input) triggered the per-phase manifest check, which blocked because no required artifacts existed yet, and the block reason re-fired on every subsequent turn — a visible loop that paused the cycle. The v0.8.2 fix introduced the field as a **load-bearing predicate**: when present and matching the current phase, the Stop hook short-circuits the manifest check.

v0.8.3 demoted the manifest check to advisory across all modes (per ADR-088). The blocking-loop failure mode that v0.8.2 fixed no longer exists — the manifest check no longer blocks, so it cannot cascade. The In-progress phase field's load-bearing predicate role is therefore obsolete; the failure mode it prevented no longer occurs.

But the field remains useful in a different role. With the manifest check now firing on every Stop event during phase work and surfacing the same advisory until the phase's required artifacts appear, the agent and practitioner see the same "missing artifacts" message turn after turn during normal phase progression. The advisory is correct (the artifacts genuinely have not been produced yet), but its repetition during expected mid-phase work is **noise** rather than signal. The In-progress phase field's amended role is to suppress this noise — when set and matching the current phase, the Stop hook does not emit the manifest advisory; when removed at phase-exit readiness, the advisory fires the next time and surfaces any genuinely missing artifacts.

The role shift is documented inline in the orchestrator skill text and in cycle-status.md's per-entry header description (per ADR-078's multi-cycle schema). But the methodology's documentation has the field originally introduced as load-bearing infrastructure. Practitioners reading the corpus see the field's introduction in v0.8.2 as if it were correctness-critical when it is now optional UX. This ADR captures the role shift in its own ADR so future readers do not see the field documented as load-bearing without the v0.8.3 update.

## Decision

The `**In-progress phase:**` field's role is **advisory-noise suppression**, not phase-manifest-check enforcement. The field is **optional**; absence does not produce a correctness failure.

### 1. Field role after v0.8.3

When the field is present on the active cycle entry and names the current phase in canonical lowercase (`research`, `discover`, `model`, `decide`, `architect`, `build`, `play`, `synthesize`):

- The Stop hook **suppresses** the per-phase manifest advisory for the named phase.
- A **one-time advisory** per session may emit (the orchestrator's own choice via skill text) noting that the manifest check is suppressed for the in-progress phase. This makes the suppression visible — practitioners can see why the advisory is quiet during phase work.
- Other Stop-hook checks (the gate-reflection-note check from ADR-066 conditioned on `**In-progress gate:**`; the compound-check fabrication detection from ADR-064 as updated by ADR-088) are unaffected. The In-progress phase field's suppression is scoped to the per-phase manifest advisory only.

When the field is absent or names a phase different from the current cycle phase:

- The Stop hook fires the per-phase manifest advisory normally. Missing artifacts surface as model-visible advisories on every Stop event until the artifacts appear.

### 2. The field is no longer correctness-critical

The v0.8.2 introduction documented the field as load-bearing for preventing the blocking-loop failure mode. v0.8.3's advisory demotion makes the loop impossible (the manifest check cannot block, so it cannot cascade). The field's absence in v0.8.3 produces:

- **Repeated advisory output** during mid-phase work (the missing-artifacts message fires on every Stop event). This is noise, not a correctness failure.
- **No cycle wedging** (the agent processes the advisory and proceeds; no block is emitted).
- **Eventual artifact production through skill-text discipline** (the phase skill's anchored dispatches still fire; the artifacts appear; the advisory clears).

A practitioner running RDD without setting the field at phase entry experiences noisier but functionally-correct cycle progression. The field's amended role is UX, not correctness.

### 3. Field set/clear lifecycle

The field's set/clear lifecycle is unchanged from v0.8.2:

- **Set at phase entry.** When the orchestrator dispatches to a phase skill, the orchestrator updates `cycle-status.md`'s active cycle entry adding `**In-progress phase:** <phase>` (canonical lowercase).
- **Removed at phase-exit readiness.** When all required artifacts have been produced (audits dispatched, gate reflection note written, susceptibility snapshot complete), the orchestrator removes the line. The next Stop event fires the manifest advisory; if all obligations are met, the advisory is silent (no missing artifacts to surface). The orchestrator advances `**Current phase:**` to the next phase and adds `**In-progress phase:** <next-phase>` in the same edit.

The set/clear positions are step-anchored in the orchestrator skill text per Invariant 8. Standalone phase-skill invocation (without orchestrator) operates without setting the field — practitioners invoking a phase skill directly experience the noisier behavior described in §2.

### 4. Standalone-skill-invocation accommodation

The v0.8.3 advisory demotion eliminated the standalone-skill-invocation vulnerability that was the second issue surfaced at Pause 2. With the manifest check advisory rather than blocking, standalone phase-skill invocation can proceed without the field — the practitioner sees noisier advisory output but no cycle wedging. The accommodation is automatic: the field is optional; standalone invocation operating without it produces correct cycle behavior with louder advisory noise.

Practitioners who want the cleaner experience can set the field manually at phase entry by editing `cycle-status.md` directly. The field's set/clear is a small mechanical edit; the orchestrator's automation is convenience, not correctness.

### 5. Conformance-audit posture

The conformance audit (`/rdd-conform`) does not enforce the field's presence. An audit that finds a cycle-status.md entry without an In-progress phase field during active phase work emits a soft note ("the active entry has no In-progress phase field; advisory output may be noisy during phase work"). The note is informational, not a finding requiring remediation.

The conformance audit does still flag stale field state — a field set for a phase that has been completed (per cycle-status.md's phase status table) is a stewardship concern, but the concern is about cycle-status hygiene, not about the field's correctness role. The remediation when the conformance audit emits this finding is to remove the `**In-progress phase:**` line from the affected cycle-status.md entry. The audit's finding requires no other action; it does not block any operation and does not require methodology-level escalation.

## Rejected alternatives

**Remove the In-progress phase field entirely.** Considered. With the v0.8.3 advisory demotion, the field's load-bearing role is gone; the question is whether its UX role is worth retaining. Rejected because the advisory-noise suppression is a real practitioner experience improvement: cycles with the field set are quieter and easier to follow during long phase work. Removing the field would reintroduce the noise without delivering any methodology benefit.

**Make the field automatic (the Stop hook detects "phase work in progress" through other signals).** Rejected. Detecting "phase work in progress" automatically requires the hook to parse cycle-status.md's phase status table and decide whether the active phase has not yet completed all required artifacts — i.e., re-implementing the manifest check's logic with a different conclusion. This is more complex than reading an explicit field; it also reintroduces the heuristic-detection concerns Invariant 8 addresses (the hook would be making a contextual judgment about "is this mid-phase or phase-exit-ready?"). The explicit field is the structurally honest form.

**Promote the field to load-bearing in v0.8.3 by re-enabling some form of blocking.** Rejected. v0.8.3's advisory demotion was deliberate (per Pause 2's diagnosis); restoring blocking semantics would reintroduce the failure mode the demotion fixed. The amendment direction is calibration toward less enforcement at the harness layer, not back toward more.

**Document the role shift inline in v0.8.3 release notes only, without a separate ADR.** Rejected. The methodology's ADR corpus is the authoritative documentation of methodology decisions. A role-shift of a field introduced as load-bearing infrastructure is an architectural decision; release notes record what shipped, ADRs record why and what the decision is. Both are needed.

**Defer the role-shift documentation until a future cycle.** Rejected. The methodology-debt naming in cycle-status.md was explicit about this ADR being owed in Cycle 017. Deferring would leave the corpus with the field's v0.8.2 documentation as if it were still correctness-critical, which is the silent-drift failure mode ADR-074 addresses.

## Consequences

**Positive:**

- The field's role after v0.8.3 is documented in its own ADR. Future readers of the corpus see the role shift explicitly rather than encountering v0.8.2 documentation as if it were current.
- The field's optional status is named explicitly. Practitioners running RDD without the orchestrator (standalone phase-skill invocation) can do so without confusion about whether they are missing a correctness-critical step.
- The conformance audit's soft-note posture is named. Practitioners seeing a soft note about a missing field understand it is informational.
- The advisory-noise-suppression role is honest scope-of-claim — the field's contribution is UX, not correctness; documenting it as UX prevents future practitioners from over-relying on it as a correctness mechanism.

**Negative:**

- The role shift produces methodology-internal complexity: the field exists; it is set and cleared by the orchestrator; it is optional; its role in v0.8.2 was different from its role in v0.8.3. Practitioners who do not need to understand the field can mostly ignore it (the orchestrator handles it automatically), but practitioners who do need to understand it (debugging unexpected advisory behavior, doing standalone invocations, writing skill text) need to read the v0.8.2 → v0.8.3 history. Mitigation: this ADR is the canonical history; future readers go to one place rather than reconstructing it from cycle-status pause-log entries.
- Standalone phase-skill invocation produces noisier output than orchestrator-driven invocation. Some practitioners may experience this as a regression even though it is functionally correct. Mitigation: practitioners can set the field manually if they want the cleaner experience; the field's set is a small mechanical edit.

**Neutral:**

- The orchestrator skill's set/clear protocol is unchanged from v0.8.2.
- The cycle-status.md schema (per ADR-078, ADR-079) is unchanged.
- The advisory mode for pre-migration corpora (ADR-064 §"Advisory mode for pre-migration corpora") is unchanged. The In-progress phase field's behavior is the same on pre-migration and post-migration corpora.

## Provenance check

- **The role-shift diagnosis (load-bearing predicate → advisory-noise suppressor):** user-articulated at Pause 2 (recorded in cycle-status.md Pause Log entry 2). Driver-derived; user-surfaced.
- **The amended field role (suppression scope, lifecycle):** drafting-time synthesis composed against the v0.8.3 implementation that already shipped. Agent composition; implementation-derived.
- **The standalone-skill-invocation accommodation:** user-articulated at Pause 2 (the second observation). Driver-derived.
- **The conformance-audit soft-note posture:** drafting-time synthesis. Agent composition; principle-derived.
- **The optional-not-correctness-critical positioning:** v0.8.3's advisory demotion makes this true mechanically; the ADR captures the methodology-level commitment that the implementation already represents. Implementation-derived.

**Result:** The role-shift diagnosis and standalone-invocation observation are user-surfaced. The amended field role description, conformance posture, and positioning language are agent-composed against the v0.8.3 implementation. No synthesis-moment framing adoption detected. This is a small ADR — the role shift is small — but the documentation honesty is methodology-level.
