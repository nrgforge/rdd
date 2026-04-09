# ADR-057: AID Susceptibility Extension with Inline Observation and Isolated Evaluation

**Status:** Proposed
**Extends:** ADR-040 (Replace Fixed-Template Gates with Attend-Interpret-Decide Cycle)

> **Backward propagation note (2026-04-09):** Cycle 10 added Invariant 8 (Mechanism execution must be structurally anchored), which requires every unconditional structural mechanism to be anchored to one of three substrates (Skill-Structure Layer, Harness Layer, or User-Tooling Layer). ADR-057's specification that the Susceptibility Snapshot "fires at phase boundaries" without naming a substrate is the canonical example of judgment-anchored dispatch that Invariant 8 prohibits for unconditional mechanisms. Cycle 10's Spike S3 corpus audit found the mechanism had 0% historical dispatch coverage before Cycle 10 itself — the mechanism this ADR specifies had never fired operationally. ADR-057 is **retroactively anchored** by two Cycle 10 ADRs: **ADR-065** (Anchor Dispatch — Skill-Structure Layer) adds per-phase dispatch sites in each phase skill at structurally privileged positions, and **ADR-064** (Compound Check hooks — Harness Layer) adds manifest-based verification as defense-in-depth. Until those ADRs are implemented and the corpus is migrated (ADR-070), the mechanism described here is aspirational Tier 1 under Invariant 8's anchoring requirement — the claim of Tier 1 status is honored *in specification*, but *in execution* the mechanism depends on the retroactive anchoring. This is State B per Cycle 10's diagnostic: absence is visible, the path to recovery is clear.

## Context

The Automation Bias Inversion (Sayin & Khasawneh 2025) means deep engagement — the state the AID cycle is designed to cultivate — correlates with higher susceptibility to sycophantic Content Selection. The methodology's success condition is also its highest-risk condition.

AID currently reads engagement signals (depth, quality, specificity) to calibrate its pedagogical move. It does not attend to sycophancy susceptibility signals: assertion density, narrowing of the solution space without challenge, adoption of agent-provided framing without modification, or increasing confidence without corresponding engagement with alternatives.

The design question is whether susceptibility assessment should be integrated into AID or separated. Integration risks the sycophantic dynamic influencing its own detection — AID operates inside the conversation where sycophancy is strongest. Separation preserves Architectural Isolation but adds mechanism complexity.

## Decision

**Inline observation, isolated evaluation.**

The AID cycle extends to *notice* susceptibility signals during its Attend phase:
- Assertion density increasing over the conversation
- Solution space narrowing without the user initiating the narrowing
- Agent-provided framing adopted without modification or challenge
- Confidence markers ("clearly," "obviously," "the right approach is") at artifact-production moments
- Declining engagement with alternatives across successive gates

AID records these observations but does **not** evaluate them inline. Evaluation happens in an isolated context — a specialist subagent that reads the observed signals and produces a Susceptibility Snapshot artifact. The snapshot is a lightweight, structured assessment: which signals were observed, what they suggest about the interaction's susceptibility state, and what (if any) Grounding Reframe is warranted.

**Triggering conditions:** The isolated evaluation fires at phase boundaries (between skills), not continuously. This limits overhead and targets the moments where framing crystallizes into artifacts.

**The Susceptibility Snapshot is advisory, not blocking.** It informs the agent's next phase entry and is available to the user, but it does not halt the pipeline. The user may review it, act on its recommendations, or proceed.

## Consequences

**Positive:**
- Preserves AID's conversational fluency (no evaluation overhead during gates)
- Exploits Architectural Isolation (the Self-Correction Blind Spot means isolated evaluation treats the conversation as external input)
- Produces durable, inspectable artifacts (consistent with Artifact-Mediated Communication, ADR-031)
- Susceptibility signals compound — cross-gate awareness enables detection of patterns invisible in single exchanges

**Negative:**
- Phase-boundary triggering means mid-phase susceptibility goes unaddressed until the boundary. Mitigated: Assertion-Aware Observation (ADR-062) provides mid-phase coverage at artifact-production moments
- The snapshot's advisory status means it can be ignored. Mitigated: the Grounding Reframe (ADR-059) converts the snapshot's findings into actionable forks, not dischargeable caveats
- Adds mechanism complexity: AID now has a dual attention mandate (engagement + susceptibility). Mitigated: susceptibility signals largely overlap with engagement signals — assertion density, narrowing, and declining alternative engagement are relevant to both

**Neutral:**
- The evaluation subagent can run on the same model as other specialist subagents (Sonnet) — it does not require Opus-level reasoning
- The snapshot's format follows the existing Audit Artifact pattern (summary + prioritized issues + recommendations)
