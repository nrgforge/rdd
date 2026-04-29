# Gate Reflection: Cycle 016 Multi-Issue Batch Cycle — decide → architect

**Date:** 2026-04-22
**Phase boundary:** decide → architect
**Cycle:** 016 — Multi-Issue Batch Cycle (Issues #10–#16)

## Belief-mapping question composed for this gate

> What would you need to believe for the directory-based schema (one file per cycle plus a registry) to be the right choice over the stack-based schema you proposed at the Cycle 015 gate?

The question targeted ADR-078, where the susceptibility snapshot's #1 carry-forward observation noted the stack-based schema was inherited from the user's Cycle 015 BUILD-gate framing, with the directory alternative dismissed in two sentences in the Rejected Alternatives section. The gate's epistemic goal: surface whether the stack choice was an examined design decision or an inherited constraint.

## User's response

> "I think if we organized all the artifacts together 1:1 with cycles that'd be a clear signal. But the same artifact corpus can be used across many cycles."

## Pedagogical move selected

Probe (belief-mapping form per ADR-055).

The move was followed by a gate-revision step: the user's response sharpened ADR-078's Rejected Alternatives more than the existing text. ADR-078 was updated to lead with the cycle-locality framing the user articulated at the gate. The conversation produced revision; the gate did not consist solely of approval.

## Commitment gating outputs

**Settled premises (carrying into ARCHITECT):**

- Structural-first / cognitive-second ordering for the seven issues' interventions
- 10 ADRs (073–082) as accepted decisions, with ADR-078's Rejected Alternatives sharpened to lead with cycle-locality framing
- Issue #14's coupling semantics: `pause-parent` default; `continue-parent` requires `**Continue-parent rationale:**` field
- Issue #13's integrated defense: ADR-076 fitness properties → ADR-077 prompt 4 consumption; ADR-075 preservation scenarios with named Einstellung-at-authorship residual
- Issue #11's table-then-Step-5.5 split between DECIDE and BUILD
- Issue #12's body-immutable + IETF-style Updates/Obsoletes split + downstream-sweep load-bearing step
- Issue #16's question-isolation as first-line structural (Skill-Structure Layer per ADR-067), reclassified from essay 015 §10's "second-line cognitive" framing
- Issues #10 and #15 not getting ADRs (live validation in BUILD + pure implementation respectively)
- ADR-072 received `Updated by ADR-078` header per the new ADR-074 workflow; downstream-artifact sweep deferred to BUILD when ADR-078 actually ships

**Open questions (held into ARCHITECT):**

- Copy-shape detection substrate for ADR-077's trigger — does ARCHITECT's system-design for the BUILD skill specify this mechanism, or is the trigger reclassified as aspirational?
- Essay 015 §10 / ADR-082 classification divergence — ARCHITECT uses ADR-082's first-line structural classification; the essay's "second-line cognitive" framing is the historical record
- Implementation grouping per the conformance scan (8 groups A–H) — does ARCHITECT preserve those groupings as a sequencing recommendation, or restructure?
- Whether the multi-cycle schema (ADR-078) needs to ship before any other Cycle-016 ADR can be enforced (the question Issue #14 itself raised)

**Specific commitments carried forward to ARCHITECT:**

- Module decomposition for the Cycle 016 ADR cluster across the existing skill / hook / manifest substrates (Group A hook layer, Group C DECIDE skill, Group D ARCHITECT skill, Group E BUILD skill, Group F RESEARCH skill + reviewer agent + orchestrator) — the conformance scan's groupings are the starting point
- Responsibility allocation for the new fields and behaviors — `**Continue-parent rationale:**`, `**In-progress gate:**`, `applicable_when` blocks, legacy-format detection — across the multi-cycle schema, the Stop hook, and the manifest format
- Provenance chains in `system-design.md` for the Cycle 016 ADRs — each new module/responsibility entry traces to an ADR in the 073–082 range and through to the originating issue and essay 015 section
- Fitness criteria decomposition (per ADR-076) for any qualitative claim ARCHITECT introduces while specifying the new modules — the methodology applies to its own ARCHITECT phase
