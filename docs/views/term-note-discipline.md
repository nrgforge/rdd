# Note Discipline

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

The rule that every non-trivial Typed Link carries note text; the link type alone is not semantic payload. Absence is silent failure: cross-reference resolution depends on the note (C4 constraint 5). Small but binding; ADR-CANDIDATE-020.3.

**Related:** Typed Link, Substrate

## Typed links

- `introduced-by` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — constraint 2: schema validation rejects an unnoted non-trivial link; the only trivial type is references
- `related-to` → [Typed Link](term-typed-link.md) — the rule every non-trivial Typed Link satisfies

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `introduced-by` → constraint 2: schema validation rejects an unnoted non-trivial link; the only trivial type is references
  - ← `introduces` constraint 2: every non-trivial link carries note text
- **[Typed Link](term-typed-link.md)** — A directed relationship between two Substrate records carrying a type (e.g., `applied-by`, `supersedes`, `parallel-to`, `cross-project-evidence`) and note text explaining the specific relationship.
  - `related-to` → the rule every non-trivial Typed Link satisfies
  - ← `related-to` subject to Note Discipline

[← Overview](overview.md)
