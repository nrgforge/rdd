# Surface View

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

A view of the corpus computed single-source from the Substrate at a chosen resolution (overview first, drill-in on demand), preserving surrounding context at drill-in (focus+context, Cockburn et al. 2008) and signaling its own incompleteness. The human-facing read of the corpus. Never hand-maintained in parallel with the Substrate. Named "Surface View" rather than "Surface" to avoid collision with the action *Surface* (user surfaces tacit knowledge); "surface" as the noun half of "substrate-and-surface" remains acceptable in the compound.

**Product origin:** "a high-level picture that then leads to sub-system pictures"; "see it at different resolutions" (Solo Developer, research log §Step 1.4)

**Aliases:** Surface (as a noun, outside the compound "substrate-and-surface"), rendered view, projection

**Related:** Substrate, Substrate-and-Surface Separation, Orientation Document, Artifact Legibility, Outcome Test, Artifact Hierarchy

## Typed links

- `introduced-by` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — never hand-maintained; derived single-source
- `related-to` → [Substrate](term-substrate.md) — computed from the Substrate

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `introduced-by` → never hand-maintained; derived single-source
  - ← `introduces` the human-facing read derived from the Substrate
- **[Substrate](term-substrate.md)** — The layer of structured records, one per ADR, invariant, pattern, vocabulary term, scenario, or other governance unit, that carries audit-substance (thresholds, felt-trigger phrasings, rejected alternatives, graduation triggers) and proven…
  - `related-to` → computed from the Substrate
  - ← `related-to` the human-facing read derived from it

[← Overview](overview.md)
