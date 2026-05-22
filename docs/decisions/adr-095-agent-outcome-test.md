# ADR-095: Agent Outcome Test for Agent-Facing Artifact Admissibility

**Status:** Accepted

## Context

ADR-083 (Cognitive Economy Criterion) introduced the Outcome Test as the admissibility criterion for **human-facing artifacts** at the methodology level: *does this artifact produce direct human understanding without AI as workaround?* The practitioner's outcome-coded test replaced earlier reading-cost-coded criteria. The Bolt-On / Felt Additional failure-mode signal (Cycle 017 reflections) names when the test signals a failure: artifacts that feel additional to the real docs are signs that the docs themselves need improvement.

ADR-083's scope is **human-facing**. Cycle 019's research (essay-outline-018 §8 W7.1 + Loop 6 cross-project investigations) identified an analogous gap for **agent-facing artifacts** — the ADRs, scenarios, domain model, system design, and audit reports that downstream specialist subagents and orchestrator dispatches consume. Cycle 019's process produced ~14 specialist subagent dispatches per cycle (per essay-outline §10 carry-forward). Each dispatch reads a subset of the corpus as context. If agent-facing artifacts proliferate without an admissibility criterion at the corpus level, the cycle's token cost rises and the Architectural Isolation defense (per ADR-058) becomes harder to maintain — the subagent's context window fills with material that does not bear on its specific audit.

The cycle's Essay-Outline Section 10 names ADR-CANDIDATE-019.2 as a Branch E Calibration Move at Tier-2 methodology-principle level, parallel to ADR-083. The Tier-2 scope (felt-judgment-anchored, no Skill-Structure Layer enforcement) was chosen at R3 of the cycle's argument-audit per practitioner gate response to the framing finding — proposing heavy structural enforcement from thin cross-project evidence would itself instantiate the over-elaboration pattern the cycle's research names.

## Decision

The methodology adopts the **Agent Outcome Test** as the Tier-2 admissibility criterion for agent-facing artifacts.

### The test

When a new agent-facing artifact is proposed (an ADR, scenario block, domain-model entry, system-design section, audit-report template, skill text addition), the practitioner applies the felt-trigger question at the artifact's creation moment:

> *"Does this artifact produce direct agent consumption without re-orientation cost, or does it feel additional to the agent-facing corpus the methodology already provides?"*

The test is satisfied when:

- The artifact's intended consumer (which specialist subagent, dispatch, or orchestrator phase reads it?) is named — **as a necessary but not sufficient condition (per R2 audit P1-A 2026-05-22)**. An answer of "future practitioners re-reading this cycle" or "any agent that needs context" passes the letter of the test while failing its spirit; the test fails when the consumer description is so broad it covers every artifact. The discriminating felt-trigger is: *does naming this specific consumer help me decide whether to write this artifact differently, remove it, or leave it as is?* If the consumer-naming produces no actionable distinction, it is a trivially-passing answer.
- The artifact's intended consumer can be expected to consume it at its specified layer (per Document Sizing Heuristics, ADR-024 — Read Contract). The agent reading the artifact does so for a purpose the artifact's structure supports.
- The artifact does not duplicate content already available to the same agent through a shorter or better-positioned source.

The test fails when:

- The artifact's intended consumer is not named, or is named so broadly that the description covers every artifact (a sign the artifact is corpus-accumulation, not consumption-driven).
- The artifact feels like an additional context source the methodology's existing artifacts already cover (the **Bolt-On / Felt Additional** signal applied to the agent-facing layer).
- The artifact's information is consumed only by re-orienting from another artifact first (a sign of compounded re-orientation cost).

**Discriminating-criterion structural limit (acknowledged in Decision per R2 audit P1-A):** Like ADR-097's Kitchen-Sink Mechanism vs. Outcome distinction, the consumer-naming test inherits the Tier-2 structural limit — a practitioner can retrospectively name any artifact's consumer and the test passes. The methodology's response: the operational threshold is whether the consumer-naming produces an actionable distinction at the artifact-creation moment, not whether a consumer can in principle be named. The distinction's operational status (genuine clarification vs. trivially-passing escape hatch) is subject to multi-cycle observation per the graduation trigger below.

### Test scope

The test applies to **new agent-facing artifacts** proposed in any phase. It does not apply retroactively to existing artifacts — Cycle 019's evidence does not warrant a corpus-wide audit of pre-existing artifacts against the new criterion. The Tier-2 scope's structural limit applies: vocabulary amendments do not constrain practitioners who fail to apply the felt-trigger.

### Distinct from ADR-083

ADR-083's Outcome Test (human-facing) and ADR-095's Agent Outcome Test (agent-facing) are parallel, not hierarchical. An artifact may pass one and fail the other (e.g., a domain-model entry that is highly legible to humans but redundant with the ORIENTATION.md reading-path for the same agent). The Document Sizing Heuristics (ADR-024) and the Three-Tier Artifact Hierarchy (ADR-019) determine the appropriate placement when both tests are at stake.

### Encoding

The test is encoded at Tier-2 methodology-principle level — the practitioner applies the felt-trigger; no Skill-Structure Layer enforcement (no hook, no auditor subagent, no manifest entry). The test is recorded in:

- `docs/domain-model.md` Concepts table (Agent Outcome Test as named concept; already added at Amendment #25).
- The orchestrator's "Important Principles" section or "Centered-vs-Infrastructure" framing reference.
- This ADR (ADR-095) as the historical record of the decision and rationale.

### Graduation trigger

Per the cycle's Tier-2 limitation note (essay-outline §10): if future cycles produce agent-facing artifacts that fail the felt-trigger test (e.g., artifacts whose intended consumer is not named, or that duplicate existing content), multi-cycle evidence of the pattern's persistence is the graduation trigger from Tier-2 to Skill-Structure Layer enforcement. Concretely: a candidate Skill-Structure Layer mechanism would be a /rdd-conform audit step that checks whether each agent-facing artifact in the corpus names its intended consumer.

## Rejected alternatives

**A. Skill-Structure Layer enforcement at proposal time.** Rejected because the cross-project evidence base is thin — the methodology's own corpus shows agent-facing artifact accumulation, but no external project has been observed to fail the test. Per the cycle's reflexive logic (essay-outline §10): proposing heavy structural enforcement from thin evidence would itself instantiate the over-elaboration pattern the cycle's research names. The Tier-2 scope is the methodology's recognition-without-enforcement posture.

**B. Apply the test to all existing artifacts retroactively.** Rejected because the cycle's evidence is not retrospective. The test names a forward-going admissibility criterion; applying it to the existing corpus would convert a research finding into a corpus-wide audit obligation the cycle's evidence does not warrant.

**C. Bundle with ADR-083 as a single Outcome Test scoped to both human and agent consumers.** Rejected because human-facing and agent-facing tests have different operational characters: human-facing legibility depends on the reader's schema and reading task (Cycle 017 vocabulary — Forager/Recipient, Information Scent, Initial-Handoff vs. Ongoing-Reference); agent-facing consumption depends on dispatch context, layer-match to the consuming subagent's purpose, and Read Contract. Bundling collapses operational distinctions that the test's application depends on.

**D. Treat agent-facing artifact accumulation as a non-issue.** Rejected because the cycle's research surfaced the asymmetry as real (essay-outline §10 carry-forward; ~14 specialist subagent dispatches per cycle; Architectural Isolation depends on each subagent's context being relevant). The accumulation is a quiet failure mode — it does not produce immediate visible damage, but compounds across cycles.

## Consequences

**Positive:**
- Agent-facing artifact proliferation has a named admissibility criterion at the methodology level.
- The Bolt-On / Felt Additional signal (Cycle 017) extends to the agent-facing layer — the same diagnostic vocabulary applies to both Tier-2 admissibility tests.
- The test scaffolds the practitioner's judgment at artifact-creation moments without imposing structural enforcement cost.
- The graduation trigger (multi-cycle evidence of the felt-trigger failing) is named, so future cycles can assess whether structural enforcement is warranted.

**Negative:**
- The test is practitioner-judgment-anchored. Cycle 019 MODEL gate documented Practitioner-Originated Framing Absorption as a susceptibility class; the Agent Outcome Test's "intended consumer" framing is itself a practitioner-applied frame that future cycles' practitioners may apply selectively.
- Two parallel Outcome Tests (ADR-083 human; ADR-095 agent) require practitioners to apply both at artifact-creation moments. The cognitive cost of distinguishing the two tests is real, even though the tests are conceptually parallel.

**Neutral:**
- The Three-Tier Enforcement classification (ADR-067) places this ADR in Tier-2 / Skill-Structure Layer scope of the methodology's vocabulary, but with explicit "no Skill-Structure Layer enforcement" framing — the test is vocabulary scaffolding, not workflow-step enforcement.

## Provenance check

- **ADR-083 Outcome Test** for human-facing artifacts: docs/decisions/adr-083-cognitive-economy-criterion.md (Cycle 017 DECIDE).
- **Bolt-On / Felt Additional signal**: domain model Amendment #21 (Cycle 017, MODEL phase).
- **Apply Outcome Test** as named action: domain model Amendment #21 (Cycle 017, MODEL phase).
- **Agent Outcome Test** as named concept and **Calibration Move** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Essay-Outline-018 §10 ADR-CANDIDATE-019.2** specifies the Branch E remedy.
- **Tier-2 scope choice** (felt-judgment-anchored, not Skill-Structure Layer enforcement): from the R3 framing-finding integration during Cycle 019 argument-audit; gate response recorded in essay-outline §10.
- **Driver chain:** Essay-Outline-018 §10 ADR-CANDIDATE-019.2 → Cycle 019 MODEL gate commitment → ADR-095.

Drafting-time synthesis (not from the driver chain): the specific phrasing of the felt-trigger question, the test-satisfied / test-failed enumeration, and the graduation trigger's concrete /rdd-conform audit step are drafting-time synthesis.
