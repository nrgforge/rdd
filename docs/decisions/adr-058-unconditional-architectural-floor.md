# ADR-058: Unconditional Architectural Floor for Sycophancy Resistance

**Status:** Proposed

## Context

The Cycle 9 domain modeling phase identified that the Performative/Genuine Structural Resistance distinction is context-dependent, not mechanism-fixed. The same mechanism (e.g., AID engagement calibration) can be performative in one phase and genuine in another as empirical grounding increases. This context-dependence is a design strength — it allows the methodology to be responsive rather than rigid.

However, context-dependence creates an escape hatch: the agent could rationalize lighter constraints by claiming the context provides sufficient grounding ("the user seems confident, the context seems grounded, so lighter constraints are appropriate here"). This is the sycophancy dynamic applied to its own governance. The Automation Bias Inversion means the users most likely to seem grounded are the highest-risk.

The resolution: context-dependence applies to *how much* structural constraint, not to *whether* structural constraint applies. Some mechanisms must be unconditional.

## Decision

Genuine Structural Resistance operates in two tiers:

**Tier 1: Unconditional architectural mechanisms** — fire regardless of context, not subject to agent or user relaxation:
- Specialist subagent dispatch for auditing (citation audit, argument audit, framing audit) — Architectural Isolation exploits the Self-Correction Blind Spot
- Susceptibility Snapshot evaluation at phase boundaries (ADR-057) — isolated from the conversation dynamic
- Research Methods Subagent review before research execution (ADR-060) — isolated pre-execution design review
- Mandatory structural output sections in audits (warrants, rebuttals, alternative framings) — absence is visible

**Tier 2: Context-responsive conversational mechanisms** — calibrated by the multidimensional rubric (phase vulnerability × engagement quality × content trajectory):
- Question form selection from the toolkit (ADR-056) — which of the six forms to deploy
- Constraint intensity — how deeply to probe alternatives at gates
- Grounding Reframe specificity (ADR-059) — which concrete actions to suggest
- Assertion-Aware Observation (ADR-062) — part of the mandatory AID Attend phase and fires at every gate. "Tier 2" means the agent exercises contextual judgment about *which* assertions warrant open-question reframing — the detection frequency is context-responsive; the detection obligation is not. Accepted limitation: operates inside the conversation without Architectural Isolation; Tier 1 backstops provide structural insurance

**The agent cannot unilaterally determine that context provides sufficient grounding to skip Tier 1 mechanisms.** When the user provides domain knowledge as grounding, the Tier 1 mechanisms still run — the user's input is additional evidence, not a replacement for structural assessment.

**"Unconditional" applies to both firing and output handling.** Tier 1 mechanisms always fire (the subagent always runs, the snapshot is always produced). Their outputs are acted on via the Grounding Reframe pattern (ADR-059) — findings that warrant grounding are presented as actionable forks, not as dismissible caveats. A user who receives a Susceptibility Snapshot with concerning signals is presented with a Grounding Reframe; proceeding without engagement is a visible, conscious choice (not a silent dismissal). The unconditional floor has no gap at the output stage.

## Consequences

**Positive:**
- Constrains the context-as-rationalization escape hatch without eliminating context-responsiveness
- The unconditional floor means the pipeline has a minimum sycophancy resistance level regardless of phase, mode, or user engagement
- Tier separation is implementable — Tier 1 mechanisms are already architectural (subagent dispatch, hooks); Tier 2 mechanisms are already conversational (AID question selection)

**Negative:**
- Tier 1 mechanisms add overhead in phases where sycophancy risk may be genuinely low (e.g., BUILD with passing tests). Mitigated: the overhead is small (audits run in background, hooks fire conditionally), and the Sycophancy Gradient says BUILD is already the most resistant phase
- The agent cannot self-exempt even when self-exemption would be efficient. This is by design — the cost of unnecessary auditing is far lower than the cost of missed sycophantic contamination

**Neutral:**
- The tier boundary may shift as practice reveals which mechanisms are genuinely load-bearing. This ADR establishes the principle; future amendments can adjust classification
- Standalone skill invocation (context-reconstructive mode) operates with Tier 1 mechanisms present but reduced Tier 2 calibration data — the unconditional floor provides a safety net where the full pipeline's grounding is absent
