# Substrate

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

The layer of structured records, one per ADR, invariant, pattern, vocabulary term, scenario, or other governance unit, that carries audit-substance (thresholds, felt-trigger phrasings, rejected alternatives, graduation triggers) and provenance via Typed Links. Agent-facing primarily; human-readable via Surface Views. Treated as a first-class auditable layer (C1). Record shape is per type, not universal; the type set is extensible (C4). Whether the Substrate or the source ADRs are canonical is held open for DECIDE. Need not be a stored graph artifact (GraphReader 2024): the navigational scaffolding, not the storage form, carries the gain.

**Product origin:** "a graph behind a human-friendly format" (Solo Developer, research log §Step 1.4); "good for agent context"

**Aliases:** Knowledge graph, KG (the practitioner's candidate; the Substrate need not be a stored graph), record layer

**Related:** Surface View, Substrate-and-Surface Separation, Typed Link, Note Discipline, Audit Artifact, Companion File, Agent Outcome Test, Artifact Hierarchy

## Typed links

- `introduced-by` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — ADR-099 §The architecture commits to the Substrate layer
- `related-to` → [Surface View](term-surface-view.md) — the human-facing read derived from it
- `related-to` → [Typed Link](term-typed-link.md) — records carry provenance via Typed Links

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `introduced-by` → ADR-099 §The architecture commits to the Substrate layer
  - ← `introduces` the record layer this ADR commits to
- **[Surface View](term-surface-view.md)** — A view of the corpus computed single-source from the Substrate at a chosen resolution (overview first, drill-in on demand), preserving surrounding context at drill-in (focus+context, Cockburn et al.
  - `related-to` → the human-facing read derived from it
  - ← `related-to` computed from the Substrate
- **[Typed Link](term-typed-link.md)** — A directed relationship between two Substrate records carrying a type (e.g., `applied-by`, `supersedes`, `parallel-to`, `cross-project-evidence`) and note text explaining the specific relationship.
  - `related-to` → records carry provenance via Typed Links

[← Overview](overview.md)
