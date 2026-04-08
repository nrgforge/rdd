# Active RDD Cycle: Specification-Execution Gap in Prompt-Based Methodology

**Started:** 2026-04-06
**Current phase:** RESEARCH ✅ complete; DISCOVER next
**Artifact base:** ./docs/
**Essay:** [014-specification-execution-gap.md](./essays/014-specification-execution-gap.md)
**Plugin version during cycle:** v0.6.3

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | [014-specification-execution-gap.md](./essays/014-specification-execution-gap.md) | Sharpened diagnostic: *mechanisms anchored to concrete workflow steps execute reliably (100% coverage); mechanisms whose dispatch depends on orchestrator contextual judgment do not (0% coverage for susceptibility snapshot)*. Recommendation: hook-based architecture (PostToolUse on Agent + Stop hook with per-phase manifest) as defense-in-depth on top of a primary skill-structure fix (add concrete dispatch sites for mechanisms that lack them). Honest scope: covers 4 of 6 observed failure modes; items 5–6 require a user-tooling layer (named, not designed here). Closing stance: *"know it when they see it"* — verification cannot prove mechanism effectiveness but creates observable conditions for contextual judgment. |
| DISCOVER | ▶ Next | — | — |
| MODEL | ☐ Pending | — | — |
| DECIDE | ☐ Pending | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Research Phase Artifact Trail

- **Essay:** [`./essays/014-specification-execution-gap.md`](./essays/014-specification-execution-gap.md) — citation-audited clean (re-audit), argument + framing audited clean (two re-audits)
- **Reflections:** [`./essays/reflections/014-specification-execution-gap.md`](./essays/reflections/014-specification-execution-gap.md) — captures gate conversation findings, susceptibility snapshot, Grounding Reframe disposition, commitments for downstream phases
- **Research log:** [`./essays/research-logs/014-specification-execution-gap.md`](./essays/research-logs/014-specification-execution-gap.md) — archived from `research-log.md` at phase end
- **Literature reviews:**
  - [`./essays/research-logs/lit-review-instruction-following-degradation.md`](./essays/research-logs/lit-review-instruction-following-degradation.md)
  - [`./essays/research-logs/lit-review-telemetry-acceptance-criteria.md`](./essays/research-logs/lit-review-telemetry-acceptance-criteria.md)
- **Spike reports (4):**
  - [`./essays/research-logs/spike-s4-fail-loud-dispatch.md`](./essays/research-logs/spike-s4-fail-loud-dispatch.md) — text hardening is insufficient (negative result)
  - [`./essays/research-logs/spike-s1-hook-feasibility.md`](./essays/research-logs/spike-s1-hook-feasibility.md) — hook architecture feasibility; items 1–3 fully, item 4 partially, items 5–6 out of reach
  - [`./essays/research-logs/spike-s2-acceptance-criteria.md`](./essays/research-logs/spike-s2-acceptance-criteria.md) — YAML per-phase manifest format + tested reference Stop hook
  - [`./essays/research-logs/spike-s3-base-rate-audit.md`](./essays/research-logs/spike-s3-base-rate-audit.md) — corpus audit: 100% coverage for step-anchored mechanisms, 0% for susceptibility snapshot
- **Audit reports:**
  - [`./essays/audits/research-design-review-014.md`](./essays/audits/research-design-review-014.md)
  - [`./essays/audits/citation-audit-014.md`](./essays/audits/citation-audit-014.md) + `-reaudit.md` (clean)
  - [`./essays/audits/argument-audit-014.md`](./essays/audits/argument-audit-014.md) + `-reaudit.md` + `-reaudit-2.md` (all clean)
  - [`./essays/audits/susceptibility-snapshot-014-research.md`](./essays/audits/susceptibility-snapshot-014-research.md) — Tier 1 unconditional snapshot at research → discover boundary

## Feed-Forward Signals

### From RESEARCH

**Settled premises (the user is building on these going into discover):**

1. The sharpened diagnostic (step-anchored vs. judgment-anchored) is a genuine narrowing of the original issue and should shape how discover and model think about mechanism classification.
2. Externalization + procedural enforcement is the right direction for the framework's reliability improvements.
3. The skill-structure fix is the first move for any Tier 1 mechanism lacking a concrete dispatch site; hooks are defense-in-depth on top, not a replacement.
4. The user-tooling layer is feasible and grounded in the already-working epistemic gate mechanism; it is the natural home for conversational mechanisms that cannot be step-anchored.
5. The cycle's success criterion is *material reduction* of framework-attributable failures, not elimination. Residual failures should become clearly attributable to the model, not the framework — making the next research question well-defined.

**Open questions (the user is holding these open going into discover):**

1. Whether the hook architecture specifically is worth its complexity cost (the user noted *"it could also feel heavy"*).
2. Whether the skill-based dispatch will actually fire in practice (the user noted *"my fear is that it won't be dispatched"*).
3. Whether RDD-in-Claude-Code can reach an 80% reliability threshold at which framework failures become clearly distinguishable from model failures.
4. What to do about the models at the point where the conversation moves to model-attributable failures (explicitly future work, out of scope for Cycle 10).
5. Broader declarative-decomposition approaches for orchestrating frontier capabilities across defined processes (explicitly future work).

**Specific commitments carried forward to DECIDE:**

1. **Hook-script reliability assessment.** The ADR for the hook architecture must include an explicit assessment of whether "fails safe to allow" is a sufficient mitigation for hook-script bugs, given that silent fail-to-allow and no hook produce the same observable outcome. Options to consider: a fail-loud mode for hook-script internal errors, a hook self-test mechanism at SessionStart, or explicit acceptance of the residual risk with reasons.
2. **Framing audit necessity rationale.** The rationale for the framing audit as an unconditional Tier 1 mechanism should cite the four documented agent-side framing-adoption moments from this cycle and the one case (the skill-structure fix alternative) where the isolated framing audit generated an alternative the in-context agent had not surfaced. This grounds the Tier 1 status in direct cycle evidence, not just theoretical reasoning.
3. **Possible ADR — "No new Tier 1 mechanism without a concrete dispatch site"** as a methodology-level rule. Would turn Cycle 10's recommendation from retroactive fix into a durable constraint on future mechanism additions.
4. **Possible ADR — the three-tier categorization** (skill-structure layer / harness layer / user-tooling layer) as a methodology-level classification system for Tier 1 mechanisms going forward.

### Active risk register

- **Until the hook architecture is built, the susceptibility-snapshot dispatch rate is expected to return to 0% in any new cycle that does not have ceremonial attention on the dispatch.** The snapshot at this phase boundary fired because the user and agent jointly tracked whether it would fire; this is not the condition the methodology needs to reproduce at scale. The user is effectively the harness layer in the interim.
- The cycle's recommendation carries an implementation dependency: implementable but not yet implemented. The intermediate state between "prose-only" and "hook-enforced" is fragile to user attention.

### Agent-side susceptibility observation (for downstream phases to attend to)

The susceptibility snapshot surfaced a "softer than sycophancy but real" pattern: the agent reached for user-provided framings at rhetorical synthesis moments in four documented instances. Each adoption was evidence-grounded and two were externally verified by the re-auditor. The framing audit caught the most consequential instance (the missing skill-structure fix alternative). Downstream phases (especially DECIDE when writing ADRs) should treat this as an active concern and be attentive to whether the pattern operates at their scale as well.

## Context for Resumption

This cycle is a direct follow-up to Cycle 9 (`013-sycophancy-and-rdd-reflexivity.md` + ADRs 055–062). Cycle 9 added the Tier 1 resistance architecture; Cycle 10 investigates why that architecture sometimes fails to fire. The issue that seeded Cycle 10 is [nrgforge/rdd#9](https://github.com/nrgforge/rdd/issues/9), filed the same day Cycle 9's architecture shipped as v0.6.0.

**If resuming in a new session:** read [`./essays/014-specification-execution-gap.md`](./essays/014-specification-execution-gap.md) as context, then [`./essays/reflections/014-specification-execution-gap.md`](./essays/reflections/014-specification-execution-gap.md) for the gate-level observations and downstream commitments. Continue to `/rdd-discover`.

**Reflexive note about this cycle:** Cycle 10 investigates whether the methodology's Tier 1 mechanisms actually fire under task load. The susceptibility-snapshot dispatch at the research → discover boundary was the first instance in the project's corpus of that specific mechanism firing. It fired because the cycle had explicitly set the expectation that it would fire and the user was actively present to track the dispatch. In other words: the cycle's own execution is a data point *inside* the asymmetry table it documents. This is noted so downstream phases do not over-interpret "the snapshot fired" as evidence of methodology reliability — it is evidence of ceremonial reliability, not operational reliability.

## Candidate follow-up cycles

**The Privilege Budget — mechanistic account of lost-in-the-middle and how it constrains skill file design.** Surfaced at the end of Cycle 10's research phase gate. The lit review on instruction-following degradation established that position effects are empirically robust (Liu et al. 2023; Guo & Vosoughi 2025) but explicitly flagged that the *mechanistic* account is unsettled. A follow-up cycle could investigate: (a) is there a file-length threshold at which the effect becomes design-relevant, or is it a continuous gradient; (b) is concept density per unit of text a separate variable from instruction count (benchmark work has varied count, not density); (c) what is the "privilege budget" — how much critical content can structurally-privileged positions hold before the privileging dilutes. The practical payoff: if the privilege budget turns out to be large enough to hold all Tier 1 mechanisms, then Cycle 10's hook architecture is over-engineered for a subset of the cases it addresses (specifically the "susceptibility snapshot not dispatched because it is at line 202 of a 530-line file" case, which could be addressed by moving the dispatch to the top of the appropriate phase skill instead of by adding a hook). This would narrow Cycle 10's hook recommendation to the silent-fallback cases where position-privileging does not help (items 1–3), separating them from cases where position-privileging might suffice (item 5 specifically). Not in scope for this cycle; noted for future consideration.

**Synthesis-moment susceptibility beyond the essay-level framing audit.** From Cycle 10's susceptibility snapshot: the snapshot identified a "softer than sycophancy but real" pattern where the orchestrator reached for user-provided framings at synthesis moments. The essay-level framing audit is the methodology's current response. A narrower question worth scoping later: are there synthesis moments beyond the essay-level framing audit where the pattern operates and the methodology does not currently have an isolated-dispatch response? Not urgent; carried forward as a possible future scope.
