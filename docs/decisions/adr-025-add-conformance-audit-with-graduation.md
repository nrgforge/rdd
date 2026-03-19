# ADR-025: Add Conformance Audit with Graduation

**Status:** Proposed

## Context

Essay 005 identifies three scenarios that produce documentation drift — a mismatch between what RDD's skill files expect and what the project's artifact corpus contains:

1. **Skill evolution** — RDD gains new artifact types or template changes; existing projects have artifacts shaped by older skill versions
2. **RDD adoption** — RDD is added to an existing project; existing artifacts don't conform to RDD's expected structure
3. **Post-build drift** — RDD produces artifacts through ARCHITECT, then someone builds without `/rdd-build`; code changes but docs don't

None of RDD's existing mechanisms (backward propagation, product conformance, stewardship checkpoints, orientation regeneration) address template-level conformance across the artifact corpus when the skill set itself changes.

The user's experience also surfaces a fourth need: when RDD has served its purpose at a given scope, the knowledge should be folded into the project's native docs and the RDD artifacts archived — graduation.

## Decision

Add a **Conformance Audit** mechanism with four operations:

1. **Audit** — scan the project's artifact corpus against the current skill version's expected structure. Produce a gap analysis: missing artifacts, missing sections, template mismatches, broken inter-artifact references. Use a simple two-level severity: structural (blocks downstream phases) vs. format (cosmetic, doesn't block anything).

2. **Remediation** — for structural gaps, generate missing artifacts or sections where possible (pragmatic action, Invariant 3). For format gaps, flag them for the user to address at the next relevant phase.

3. **Drift detection** — compare artifacts against current implementation to detect post-build drift. Flag stale sections and let the user decide: update the docs (pragmatic) or re-run the relevant phase (epistemic, if understanding needs rebuilding). Note: drift detection is a semantic comparison task with lower reliability than template auditing — the agent may miss subtle divergences between documentation and code. It is a best-effort sweep, not a guarantee of completeness.

4. **Graduation** — fold RDD knowledge (decisions, vocabulary, product context, rationale) into the project's native documentation format. Archive RDD artifacts as historical record. A recurring operation at the subsystem level, not a one-time exit. Note: the specific mechanics of graduation — what constitutes "durable knowledge," how to identify the right migration target format, what to archive vs. discard — are less researched than the audit/remediation operations and remain open design questions to be resolved through practice.

All four operations are pragmatic actions (Invariant 3). The audit produces a report; the user decides what to act on.

## Consequences

**Positive:**
- Existing projects can adopt RDD without starting from scratch — the audit identifies what exists and what needs creation
- Skill evolution doesn't leave projects stranded on old templates
- Post-build drift is detected before it undermines the next RDD cycle
- Graduation provides a clean exit ramp — RDD as a deep work tool that integrates into existing practice

**Negative:**
- Another skill to build and maintain
- Graduation requires judgment about what knowledge is durable vs. what was process scaffolding
- Drift detection against code requires the agent to read implementation — potentially expensive

**Neutral:**
- Graduation is inspired by Invariant 6's principle (scaffolding must fade), applied at the methodology level — the analogy is directional (both involve removing structure that has served its purpose) but operates at a different level than Invariant 6's original scope (learning trajectory vs. project lifecycle)
- The conformance audit complements the existing Product Conformance (ADR-008) — template alignment vs. product assumption alignment
