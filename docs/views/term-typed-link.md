# Typed Link

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

A directed relationship between two Substrate records carrying a type (e.g., `applied-by`, `supersedes`, `parallel-to`, `cross-project-evidence`) and note text explaining the specific relationship. The type set is extensible: the spike's four starting types covered roughly half the relationships five ADRs needed (C4). Subject to Note Discipline.

**Related:** Substrate, Note Discipline, Provenance Chain, Supersession

## Typed links

- `introduced-by` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — constraint 1: any string is a valid link type
- `related-to` → [Note Discipline](term-note-discipline.md) — subject to Note Discipline

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `introduced-by` → constraint 1: any string is a valid link type
  - ← `introduces` constraint 1: extensible link types
- **[Note Discipline](term-note-discipline.md)** — The rule that every non-trivial Typed Link carries note text; the link type alone is not semantic payload.
  - `related-to` → subject to Note Discipline
  - ← `related-to` the rule every non-trivial Typed Link satisfies
- **[Substrate](term-substrate.md)** — The layer of structured records, one per ADR, invariant, pattern, vocabulary term, scenario, or other governance unit, that carries audit-substance (thresholds, felt-trigger phrasings, rejected alternatives, graduation triggers) and proven…
  - ← `related-to` records carry provenance via Typed Links

[← Overview](overview.md)
