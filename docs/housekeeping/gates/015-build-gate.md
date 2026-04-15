# Gate Reflection: Cycle 015 — Lifecycle Composition BUILD → cycle-end

**Date:** 2026-04-14
**Phase boundary:** BUILD → cycle-end (no PLAY, no SYNTHESIZE in this mini-cycle)
**Cycle:** 015 — Lifecycle Composition in Build Stewardship (mini-cycle: DECIDE + BUILD only)

## Belief-mapping question composed for this gate

All fifteen active scenarios (8 ADR-071 + 7 ADR-072) were satisfied by the five WPs. One scenario is explicitly deferred as a known gap — the in-progress-gate case. Cycle 015 bundled a mid-cycle scope-expansion (ADR-072) rather than spawning a separate cycle for it. The DECIDE gate demonstrated the exact failure mode ADR-072 was designed to address (live hook-loop), and the user selected option 3 at that gate (proceed with ADR-072 as designed, carry the un-examined hook-side alternative forward, document visibly). The BUILD-exit susceptibility snapshot confirmed the grounding action from the BUILD-entry snapshot (write the in-progress-gate scenario) was executed and the residual signals from DECIDE moved to lower risk weight.

The gate question posed at BUILD-exit:

> The cycle carries a specific, named, un-examined alternative into the future: hook-side session-scoped block-then-advisory suppression as a narrower fix for the infinite-loop class. ADR-072's design did not adopt it; the BUILD-entry snapshot said it would have closed the in-progress-gate case ADR-072 leaves uncovered. Going into the next cycle — whether that's the in-progress-gate follow-up, Cycle 14 PLAY, or something else entirely — which premises about this un-examined alternative are you holding as settled (things you now believe about it), and which remain genuinely open (things you'd need evidence or a spike to decide)? And: does Cycle 015 teach anything about when scope-expansion mid-cycle is worth the interruption versus when a separate cycle would be cleaner?

The question is commitment-gating form (one of the six Question Toolkit forms), composed to test earned confidence on the un-examined alternative specifically and on the scope-expansion lesson generally.

## User's response

The user's first response was a comprehension request — "Can you explain more about this alternative?" — which established that the hook-side alternative had been named in prior audits but not explicitly grounded in the gate conversation. The agent's reply described the hook-side pattern concretely (session-scoped `/tmp/rdd-gate-block-${SESSION_ID}` marker, block-once-per-session-then-downgrade-to-advisory), reusing the hook's existing advisory-mode one-time-notice mechanism, and enumerated trade-offs for both ADR-072's adopted design and the un-examined alternative.

The user's substantive response then reframed the question:

> "My inclination is that I don't want a 'mini-cycle' to have annoying looping hooks that make the conversational output noisy. I'd rather be able to deliberately run a mini-cycle, have the current cycle (if applicable) paused in order to add this mini-cycle to the cycle-status and allow for that behavior. The cycle-status could track the state of multiple open cycles at different stages. For example, there was a cycle that went to a certain point on rdd-pair. Here, I wanted to pause before play to do a mini-cycle to address some specific issues. Some prior cycles that I may resume later were started before the hooks even existed. How does conform apply there? This is what I'm thinking about right now."

This reframe raised three distinct points:

1. **Preferred direction for hook-state handling** — cycle-status.md is the right artifact for deliberate cycle-state declaration; hook-side `/tmp` markers are the wrong shape for state that should be auditable.
2. **Multi-cycle composition as first-class methodology concept** — cycle-status.md should track multiple cycles at different states (paused, nested, mini-cycle), not a single active cycle. ADR-072's two-field design becomes a specialization of this richer schema.
3. **Pre-hook cycles and `/rdd-conform`** — cycles started before the hook infrastructure existed (e.g., Cycle 8 rdd-pair, paused at MODEL) need a conform path to re-enter current enforcement regime.

The agent's synthesis turn mapped out the implications: the user's preferred model addresses cross-cycle transitions (pause outer, run mini, resume) but does not by itself address the in-progress-gate case within a single cycle (user engaged in multi-turn conversation, no pause to declare). A richer cycle-state vocabulary (including a Gate-in-progress marker) or a complementary hook-side safety net would still be needed for that case.

The user's follow-up response made the next step explicit:

> "Yes - it leads me to think that this mid-cycle question should be documented as a set of questions to bring into a follow-up cycle that can be done properly."

This authorized:

- Expanding Cycle 015's Deferred Work entry from a narrow in-progress-gate note to a six-question set covering the broader multi-cycle composition design question
- Creating a durable capture: GitHub Issue #14 (Multi-cycle composition: cycle-status schema + hook-state handling)

## Pedagogical move selected

Probe → Teach → Synthesis. The initial move was Probe (commitment-gating form referencing specific artifact content — the un-examined alternative named in the BUILD-entry snapshot). The user's comprehension request shifted the move to Teach (concrete explanation of the hook-side alternative with trade-offs). The user's substantive reframe prompted a synthesis turn — the agent surfaced the implications of the reframe (what the multi-cycle model covers, what it doesn't cover alone, how `/rdd-conform` fits) without driving toward a decision. The user's final response authorized durable capture; the agent executed (Deferred Work expansion + Issue #14).

## Commitment gating outputs

**Settled premises (the user is building on these going into cycle-end / follow-up work):**

- ADR-071 + ADR-072 ship as specified. Cycle 015's implementation work is complete. All 15 active scenarios satisfied; 1 scenario deferred as a known gap with three-location documentation.
- The cycle-status.md direction is right — "pause" and cycle-shape belong in the artifact trail, not in ephemeral `/tmp` markers. The Invariant-8 rationale for the cycle-status.md approach (structurally anchored and observable) holds.
- Mini-cycles warrant first-class methodology support (multi-cycle composition) rather than hook-side accommodation alone. The single-cycle model is insufficient for actual practice.
- Pre-hook cycles (Cycle 8 rdd-pair specifically) need a `/rdd-conform` path to re-enter the current enforcement regime. The gap is real and Cycle 8's resumption will hit it.
- Scope-expansion mid-cycle (ADR-072 bundled into Cycle 015) was bounded but produced design compression — the un-examined hook-side alternative and the now-surfaced multi-cycle composition reframe are both evidence that a dedicated cycle would have had more room to think. The bundling was defensible (mini-cycle preserved, the failure mode was live evidence for ADR-072's scope), but the compression-cost is visible in retrospect.

**Open questions (carried forward to Issue #14 follow-up cycle):**

1. Cycle-state schema concrete shape — header fields, nested entries, relationships (parent/child, ordered, active/paused).
2. Whether the in-progress-gate case gets its own declared marker (e.g., Gate-in-progress) or still needs a hook-side session-scoped block-once-then-advisory safety net.
3. Hook-side vs. cycle-state composition — mutually exclusive or complementary.
4. `/rdd-conform` cycle-shape audit scope design — detection, prompting, automatic vs. manual migration.
5. Cycle 8 (rdd-pair) resumption as the concrete test case for both the multi-cycle schema and the conform audit scope.
6. Methodology graduation (ADR-025) interaction with multi-cycle composition — does graduate close a single cycle's corpus or operate cross-stack?

**Specific commitments carried forward:**

- Issue #14 is the durable reference for the follow-up cycle's question set; Cycle 015's Deferred Work section mirrors it for archive-time discoverability.
- Cycle 014 PLAY remains deferred (separately from Issue #14); the user committed to running PLAY on Cycle 014 after Cycle 015 closes. Issue #14's follow-up cycle should be scoped so it does not displace Cycle 014 PLAY.
- The minor hygiene observation from the BUILD-exit snapshot — `ADVISORY_MARKER="/tmp/rdd-advisory-notice-$$"` (line 29 of the Stop hook) uses PID-scoping while the rest of the hook uses SESSION_ID, and the variable appears to be dead code — is out of Cycle 015's scope and belongs in a future housekeeping pass, not in Issue #14's scope.
