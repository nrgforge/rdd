# Calibration-with-Graduation-Trigger Pattern

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

The single decision-structure the five Cycle 019 ADRs (094–098) each instantiate: workflow point + calibration mechanism + tier classification + audit-bearing artifact + graduation trigger (C1). Also applied by ADR-083 (Cycle 017) and ADR-091 (Cycle 018). Compresses to one Pattern record plus per-application Substrate entries without audit-substance loss, provided the Substrate is auditable. Recurs as methodology vocabulary across cycles; the five-ADR clustering at one level does not recur (Grounding Loop 4), so its topology-level diagnostic value is single-cycle evidence and it inherits the kitchen-sink caveat (C7).

**Product origin:** "middle of the road choices as opposed to one big bold choice" (Solo Developer, theater metaphor, Cycle 019 DECIDE gate)

**Related:** Substrate, Empirical-Grounding Filter, Convergence-Saturation Signal, Agent Outcome Test, Kitchen-Sink Mechanism, Three-Application F-P2 Pattern

## Typed links

- `record` → [Calibration-with-Graduation-Trigger Pattern](pattern-calibration-with-graduation-trigger.md) — the Pattern record is the Substrate form of this concept
- `named-in` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — ADR-099 §Context: the C1 finding that opened the cycle

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `named-in` → ADR-099 §Context: the C1 finding that opened the cycle
- **[Calibration-with-Graduation-Trigger Pattern](pattern-calibration-with-graduation-trigger.md)** — The single decision-structure the five Cycle 019 ADRs (094 through 098) each instantiate: workflow point + calibration mechanism + tier classification + audit-bearing artifact + graduation trigger (Essay-Outline 020 C1).
  - `record` → the Pattern record is the Substrate form of this concept
  - ← `named-in` the domain-model concept this record is the Substrate form of
- **[Substrate-and-Surface Separation](term-substrate-and-surface-separation.md)** — Cycle 020's central architectural commitment (C3): audit-substance and provenance live in the Substrate; humans read Surface Views derived from it; single-source derivation (a toolchain artifact, not a discipline) prevents dual-maintenance…
  - ← `related-to` the C1 finding whose auditable form the separation provides

[← Overview](overview.md)
