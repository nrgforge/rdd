# Gate Reflection: Cycle 015 — Lifecycle Composition DECIDE → BUILD

**Date:** 2026-04-14
**Phase boundary:** DECIDE → BUILD
**Cycle:** 015 — Lifecycle Composition in Build Stewardship (mini-cycle: DECIDE + BUILD only)

## Belief-mapping question composed for this gate

The pass-7 argument audit came back clean — zero issues, chains A–I hold, all pass-6 fixes verified. The susceptibility snapshot dispatched at the same phase boundary returned a significant, in-cycle-applicable finding on ADR-072 meeting all three Grounding Reframe triggers (specific, actionable, in-cycle): the rejected-alternatives section covers four alternatives but omits the most proximate one — extending the hook's existing session-scoped `/tmp/rdd-advisory-${SESSION_ID}` suppression pattern to the blocking path (block once per session on gate-in-progress, downgrade subsequent fires to advisory). This would address the 60-successive-blocks problem from the harness side without adding fields to cycle-status.md. The snapshot read the user-authored framings ("pause" semantic and cycle-status.md location, both quoted verbatim in ADR-072's Provenance check) as operationalized into design specification before the hook-side alternative was examined.

The Grounding Reframe offered three paths:

1. **Belief-map the hook-side alternative.** What would have to be true for the hook-side approach (one-block-then-advisory, no cycle-status.md fields) to be the right design? What would have to be true for the cycle-status.md approach to win on its merits once the alternative is fully in view?
2. **Spike the hook-side approach.** Sketch the hook change (session-scoped marker + downgrade-to-advisory logic) well enough to compare against ADR-072's two-field design on complexity, failure modes, and what each makes impossible.
3. **Proceed with ADR-072 as designed** — record the decision visibly, note the un-examined alternative, and carry forward into BUILD.

## User's response

The gate conversation was interrupted by the live manifestation of the failure mode ADR-072 addresses. The Stop hook fired on successive turns with the manifest-check message, with no session-scoped suppression on the blocking path. After the agent surfaced the loop state twice, the user's first response:

> "The problem we have here currently is docs/housekeeping/gates/015-decide-gate.md is not getting creating in a way that allows the hooks to execute successfully when we're doing little mini-cycles here. As a result, the hook is looping infinitely."

This named a workflow-level concern: in mini-cycles, the gate reflection note's production timing collides with the Stop hook's manifest check such that the hook loops infinitely before the note can be produced. The live failure is empirical content in the scope of the design question — the hook-side alternative named by the susceptibility snapshot would have broken the loop with or without ADR-072's cycle-status.md fields populated. ADR-072's design relies on a populated `Paused` field in cycle-status.md; during a gate conversation in progress, that field is not yet set, so the cycle-status.md approach alone does not cover the in-gate-conversation mini-cycle shape.

After the initial gate reflection note was produced, the user's explicit selection:

> "To be clear, I think let's move into option 3 from the gate."

Option 3 — proceed with ADR-072 as designed, record the decision visibly in cycle-status.md, note the un-examined hook-side alternative, and carry forward into BUILD.

## Pedagogical move selected

Probe. The move referenced ADR-072's scope directly — naming that the infinite loop the user reported is the same category of failure the ADR addresses, and that the loop's occurrence during a gate conversation (before any cycle-status.md field could be populated) is evidence-in-scope for the design question. The agent stopped without fabricating a selection. The user's explicit selection of option 3 followed in the next turn.

## Commitment gating outputs

**Settled premises (the user is building on these going into BUILD):**

- ADR-071's three-extension dual-placement structure holds through seven audit passes; argument chains A–I are sound.
- ADR-072's four argument chains hold through seven audit passes.
- Pass-7 argument audit is clean; argument-level correctness of both ADRs is not in question.
- Cycle 015 scope remains DECIDE + BUILD; the mini-cycle guardrails established at scoping still hold.
- Cycle 014 PLAY remains deferred; to be run after Cycle 015 completes.

**Open questions (the user is holding these open going into BUILD):**

- Whether ADR-072's cycle-status.md two-field design is the right design, or whether a hook-side session-scoped block-then-advisory pattern is narrower and sufficient.
- Whether ADR-072 as currently designed covers the in-gate-conversation mini-cycle shape — during which no cycle-status.md field is yet populated — or whether BUILD must address that case.
- Whether BUILD should implement ADR-072 as written, a hook-side variant, both, or revise ADR-072 before implementing.
- Whether the gate reflection note workflow in mini-cycles needs its own revisit (timing vs. manifest check).

**Specific commitments carried forward to BUILD:**

- BUILD must engage the hook-side alternative explicitly. Either implement it alongside ADR-072, substitute it, or document in the ADR why the cycle-status.md approach is sufficient once the live failure mode (in-gate-conversation mini-cycle loop) is accounted for.
- ADR-072's rejected-alternatives section should be updated during BUILD to include the hook-side alternative with an explicit rebuttal (or, if adopted, supersession).
- The in-gate-conversation mini-cycle loop case is live evidence; any BUILD design that does not break this specific loop should be flagged.
- If BUILD produces a design change sufficient to constitute Design Amendment territory rather than pure implementation, pause and reassess whether this bleeds back into DECIDE before continuing.
