# Corpus Overwhelm

[← Overview](overview.md)

**Type:** Term (concept) · **Cycle:** 020

## Definition

The felt experience at holistic-synthesis moments (gates, architecture review, onboarding, re-entry after time away, graduation) when the count of mutually-referencing artifacts that must be held simultaneously exceeds working capacity. Mechanism: Sweller's element interactivity (C2); moment-independent, with graduation the widest-scope case, not a different case. Two components with different remedies: reading load (per-item cost; addressed by Surface Views and gate tooling) and Adjudication Load (item count; not addressed by either).

**Product origin:** "it takes a long time and it's a lot of text to read"; "no one reads them" (Solo Developer, 2026-09-03 and research log §User reframing)

**Related:** Adjudication Load, Cognitive Load, Substrate-and-Surface Separation, Zero-Prior-Familiarity Reader, Expertise Reversal Effect

## Typed links

- `addressed-by` → [ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md) — the reading-load component (per-item cost) via Surface Views
- `addressed-by` → [ADR-100: Pre-Triage and Plain-Language Presentation at Practitioner-Facing Moments](adr-100.md) — the Adjudication Load component (item count) via rules 1–5; reading load in the conversation via rules 6–7
- `related-to` → [Adjudication Load](term-adjudication-load.md) — one of its two components

## Surrounding records

_Focus+context: every record linked to or from this one, so you can navigate without cold lookup._

- **[ADR-099: Substrate-and-Surface Separation as Methodology-Wide Architecture](adr-099.md)** *(workflow point: corpus architecture (DECIDE and MODEL artifact creation; phase exit; re-entry); mechanism: Substrate records + single-source derivation toolchain)* — The methodology separates a Substrate of typed records (agent-facing; auditable; one per governance unit) from Surface Views derived from it single-source (human-facing; overview first, drill-in on demand, incompleteness signaled), with six binding constraints and, under §Authority option C, records canonical for units authored after this ADR and legacy units canonical in their files with index r…
  - `addressed-by` → the reading-load component (per-item cost) via Surface Views
  - ← `addresses` the reading-load component; Adjudication Load is ADR-100's
- **[ADR-100: Pre-Triage and Plain-Language Presentation at Practitioner-Facing Moments](adr-100.md)** *(workflow point: every practitioner-facing moment (loop end, audit-round end, framing-audit surfacing, snapshot grounding actions, the AID gate); mechanism: pre-triage with an inspectable triage record; plain-language presentation rule)* — At every practitioner-facing moment the orchestrator pre-triages findings into resolve, carry forward, or pivot (a pivot changes what gets built, for whom, or why), runs the question form on itself first, never silently resolves a framing-class finding, writes the triage record, and presents what survives on one screen with referenced content inlined; the isolated susceptibility snapshot reads th…
  - `addressed-by` → the Adjudication Load component (item count) via rules 1–5; reading load in the conversation via rules 6–7
  - ← `addresses` rules 1–5 address Adjudication Load; rules 6–7 address reading load in the conversation
- **[Adjudication Load](term-adjudication-load.md)** — The number of decisions handed back to the practitioner per loop or audit round: findings, framing questions, grounding actions, held-open readings.
  - `related-to` → one of its two components
  - ← `related-to` the item-count component

[← Overview](overview.md)
