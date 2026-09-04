# Calibration-with-Graduation-Trigger Pattern

[← Overview](overview.md)

**Type:** Pattern

## Summary

The single decision-structure the five Cycle 019 ADRs (094 through 098) each instantiate: workflow point + calibration mechanism + tier classification + audit-bearing artifact + graduation trigger (Essay-Outline 020 C1).

## Statement

A methodology amendment at a named workflow point specifies a calibration mechanism, a tier classification (Skill-Structure Layer or Tier-2 felt-trigger), an audit-bearing artifact that records the mechanism's operation, and a graduation trigger stating the multi-cycle evidence that promotes, relaxes, or revises the mechanism.

## Applications

- [ADR-094: Audit Round-Count Calibration via Convergence-Saturation Signal](adr-094.md)
- [ADR-095: Agent Outcome Test for Agent-Facing Artifact Admissibility](adr-095.md)
- [ADR-096: Patch-Switching Criterion for RESEARCH Loop Termination](adr-096.md)
- [ADR-097: Empirical-Grounding Filter at DECIDE (Tier-2 Methodology Vocabulary)](adr-097.md)
- [ADR-098: Methodology-Level Audit Gap: Named Deferrals (FF1 + FF3)](adr-098.md)

## Caveats

- Also applied by ADR-083 (Cycle 017; Outcome Test with in-place-first default) and ADR-091 (Cycle 018; dual-mode BUILD). The five-ADR clustering at one level did not recur in Cycles 017 and 018 (research log Grounding Loop 4), so the pattern's topology-level diagnostic value is single-cycle evidence.
- Inherits the kitchen-sink caveat (Essay-Outline 020 C7; ADR-097): its diagnostic value depends on producing actionable distinctions at artifact-creation moments, not on being retrospectively applicable to any artifact.
- The Pattern does not itself reject specific alternatives; the rejected alternatives live in each application record (spike-020 §6).

## Provenance

- Essay-Outline 020 C1 (five ADRs compress to one Pattern record plus five entries without audit-substance loss).
- Research log Loop 1 (topology confirmation) and Grounding Loop 4 (cross-cycle check).
- spike-020 §1–§7 (the record shape this Pattern was first authored in).
- domain-model Amendment #29 (Calibration-with-Graduation-Trigger Pattern as a concept).

## Typed links

- `applied-by` → [ADR-094: Audit Round-Count Calibration via Convergence-Saturation Signal](adr-094.md) — audit-round-end: Convergence-Saturation Signal with round-count thresholds; Skill-Structure Layer; verdict line is the audit-bearing artifact
- `applied-by` → [ADR-095: Agent Outcome Test for Agent-Facing Artifact Admissibility](adr-095.md) — agent-facing artifact creation: Agent Outcome Test felt-trigger; Tier-2; graduation trigger names a /rdd-conform audit step
- `applied-by` → [ADR-096: Patch-Switching Criterion for RESEARCH Loop Termination](adr-096.md) — research-loop-end: Patch-Switching Criterion with three-way verdict; Skill-Structure Layer; verdict line in the research log
- `applied-by` → [ADR-097: Empirical-Grounding Filter at DECIDE (Tier-2 Methodology Vocabulary)](adr-097.md) — ADR-drafting: Empirical-Grounding Filter with four grounding paths; Tier-2; Conditional Acceptance and adr-deferred- forms
- `applied-by` → [ADR-098: Methodology-Level Audit Gap: Named Deferrals (FF1 + FF3)](adr-098.md) — methodology audit coverage: FF1 and FF3 as named deferrals with two-direction graduation triggers
- `named-in` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — ADR-099 §Context: the Pattern is the C1 finding that opened the cycle; the Substrate is the form in which a Pattern plus entries is auditable
- `named-in` → [Calibration-with-Graduation-Trigger Pattern](term-calibration-with-graduation-trigger-pattern.md) — the domain-model concept this record is the Substrate form of

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-094: Audit Round-Count Calibration via Convergence-Saturation Signal](adr-094.md)** *(workflow point: audit-round-end; mechanism: Convergence-Saturation Signal verdict line)* — Default audit round count is 3; round 4 fires only when the Convergence-Saturation Signal (R3: P1 = 0, P2-new ≤ 1, no new framings) has not triggered; round 5 only if R4 surfaces a new P1; rounds beyond 5 need explicit practitioner authorization.
  - `applied-by` → audit-round-end: Convergence-Saturation Signal with round-count thresholds; Skill-Structure Layer; verdict line is the audit-bearing artifact
  - ← `applies-pattern` Skill-Structure Layer application at audit-round-end; the verdict line is the audit-bearing artifact; threshold recalibration after 2–4 cycles is the graduation trigger
- **[ADR-095: Agent Outcome Test for Agent-Facing Artifact Admissibility](adr-095.md)** *(workflow point: agent-facing artifact creation; mechanism: Agent Outcome Test felt-trigger)* — A Tier-2 felt-trigger at agent-facing artifact creation, parallel to ADR-083's human-facing Outcome Test: does this artifact produce direct agent consumption without re-orientation cost, or does it feel additional to the agent-facing corpus?
  - `applied-by` → agent-facing artifact creation: Agent Outcome Test felt-trigger; Tier-2; graduation trigger names a /rdd-conform audit step
  - ← `applies-pattern` Tier-2 application at agent-facing artifact creation; the graduation trigger names a candidate /rdd-conform audit step
- **[ADR-096: Patch-Switching Criterion for RESEARCH Loop Termination](adr-096.md)** *(workflow point: research-loop-end; mechanism: Patch-Switching Criterion verdict line)* — Pirolli and Card's information-foraging patch-switching applied at research-loop-end: a three-way verdict (continue this patch, switch patch, switch to synthesis) against marginal yield versus opportunity cost, with a practitioner-elicited expected observation and a reflexive-versus-genuine pre-mortem discrimination.
  - `applied-by` → research-loop-end: Patch-Switching Criterion with three-way verdict; Skill-Structure Layer; verdict line in the research log
  - ← `applies-pattern` Skill-Structure Layer application at research-loop-end; the verdict line in the research log is the audit-bearing artifact
- **[ADR-097: Empirical-Grounding Filter at DECIDE (Tier-2 Methodology Vocabulary)](adr-097.md)** *(workflow point: ADR-drafting; mechanism: Empirical-Grounding Filter felt-trigger)* — At ADR-drafting time the dyad asks whether the commitment is empirically grounded by one of four paths (PLAY evidence; stakeholder-articulated demand; spike validation; structural operationalization); when none applies the ADR takes Conditional Acceptance or the adr-deferred- filename pattern.
  - `applied-by` → ADR-drafting: Empirical-Grounding Filter with four grounding paths; Tier-2; Conditional Acceptance and adr-deferred- forms
  - ← `applies-pattern` Tier-2 application at ADR-drafting; the felt-trigger record in the ADR's Provenance check is the audit-bearing artifact
- **[ADR-098: Methodology-Level Audit Gap: Named Deferrals (FF1 + FF3)](adr-098.md)** *(workflow point: methodology audit coverage; mechanism: named deferral with two-direction graduation trigger)* — FF1 (practitioner-originated framing absorption is not audited by any specialist subagent) and FF3 (in-place amendments to RESEARCH artifacts during downstream phases have no re-audit protocol) are recorded as recognized gaps at vocabulary level; structural amendment is deferred with two-direction graduation triggers (harm evidence or reliance evidence over 2–4 cycles).
  - `applied-by` → methodology audit coverage: FF1 and FF3 as named deferrals with two-direction graduation triggers
  - ← `applies-pattern` the graduation-trigger element applied to a deferral rather than a mechanism; two-direction trigger closes the asymmetry a harm-only trigger would create
- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `named-in` → ADR-099 §Context: the Pattern is the C1 finding that opened the cycle; the Substrate is the form in which a Pattern plus entries is auditable
  - ← `names` the C1 finding that opened the cycle: five ADRs compress to one Pattern record plus entries, provided the Substrate is auditable
- **[Calibration-with-Graduation-Trigger Pattern](term-calibration-with-graduation-trigger-pattern.md)** — The single decision-structure the five Cycle 019 ADRs (094–098) each instantiate: workflow point + calibration mechanism + tier classification + audit-bearing artifact + graduation trigger (C1).
  - `named-in` → the domain-model concept this record is the Substrate form of
  - ← `record` the Pattern record is the Substrate form of this concept

[← Overview](overview.md)
