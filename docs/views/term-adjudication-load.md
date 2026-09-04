# Adjudication Load

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

The number of decisions handed back to the practitioner per loop or audit round: findings, framing questions, grounding actions, held-open readings. Grows with loop depth. Distinct from reading load: making each item cheaper to read does not reduce the count. The methodology's existing bounds (Convergence-Saturation Signal; patch-switching) limit rounds and loops, not items per round. Reduced by Pre-Triage.

**Product origin:** "loops peel back more layers of the onion that need more adjudication by the reader. So it's exhausting" (Solo Developer, 2026-09-03)

**Aliases:** Decision fatigue, gate fatigue (both conflate count with cost)

**Related:** Corpus Overwhelm, Pre-Triage, Pivot Point, Convergence-Saturation Signal, Grounding Reframe, Framing Audit

## Typed links

- `introduced-by` → [ADR-100: Pre-Triage and Plain-Language Presentation at Practitioner-Facing Moments](adr-100.md) — the count of decisions handed back per loop; reduced by Pre-Triage
- `related-to` → [Pivot Point](term-pivot-point.md) — what survives pre-triage
- `related-to` → [Corpus Overwhelm](term-corpus-overwhelm.md) — the item-count component

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-100: Pre-Triage and Plain-Language Presentation at Practitioner-Facing Moments](adr-100.md)** *(workflow point: every practitioner-facing moment (loop end, audit-round end, framing-audit surfacing, snapshot grounding actions, the AID gate); mechanism: pre-triage with an inspectable triage record; plain-language presentation rule)* — At every practitioner-facing moment the orchestrator pre-triages findings into resolve, carry forward, or pivot (a pivot changes what gets built, for whom, or why), runs the question form on itself first, never silently resolves a framing-class finding, writes the triage record, and presents what survives on one screen with referenced content inlined; the isolated susceptibility snapshot reads th…
  - `introduced-by` → the count of decisions handed back per loop; reduced by Pre-Triage
  - ← `introduces` the item-count component of Corpus Overwhelm this ADR reduces
- **[Corpus Overwhelm](term-corpus-overwhelm.md)** — The felt experience at holistic-synthesis moments (gates, architecture review, onboarding, re-entry after time away, graduation) when the count of mutually-referencing artifacts that must be held simultaneously exceeds working capacity.
  - `related-to` → the item-count component
  - ← `related-to` one of its two components
- **[Pivot Point](term-pivot-point.md)** — A finding or decision that changes the destination: what gets built, who it is built for, or why (Invariant 0's own list).
  - `related-to` → what survives pre-triage

[← Overview](overview.md)
