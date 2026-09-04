# Spike 020: Plain-JSON Typed-Link Substrate Prototype

*Date:* 2026-05-22

## Question

Can a plain-JSON typed-link substrate + derived computed surface preserve audit-substance + support focus+context multi-resolution viewing on the Cycle 019 5-ADR sample?

## What was built

A `substrate.json` file containing six records — the Calibration-with-Graduation-Trigger Pattern plus the five Cycle 019 ADRs (094–098) — each carrying typed `links` and a structured `audit-substance` block (commitment, warrants, rejected-alternatives, graduation-trigger, provenance). A Python derivation script generated seven Markdown surface files from the substrate: one overview view (Pattern + five compact application-point summaries with co-located typed cross-refs) and six drill-in views (one per record, each showing the full audit-substance block plus visible cross-refs plus a "surrounding records" footer naming the other records with their workflow points and mechanisms). The derivation is single-source — re-running the script regenerates every view from the substrate; no parallel hand-maintained content. The 5-ADR source corpus is 546 lines; the substrate is 268 lines; the generated surface is 535 lines (with the overview adding navigation affordances the sources do not provide). The substrate compresses 49% versus source while regenerating ~98% of the source surface area in a navigable form.

## Findings against the seven evaluation questions

### 1. Audit-substance preservation

The named five-field schema (commitment / warrants / rejected-alternatives / graduation-trigger / provenance) captured what is structurally invariant across the five ADRs. But the schema **lost sub-arguments embedded in the Decision section** that do not fit the five fields cleanly:

- ADR-094's `signal-evaluation step` skill-text amendment (the verdict-line template format) — operationally load-bearing for the methodology, but it is neither a warrant for the commitment nor a rejected alternative; it is the mechanism's specification. The substrate has no field for "mechanism specification."
- ADR-097's `Target 2 — Discriminating criterion` and `Target 3 — Standalone-at-commitment-time` sub-sections — these are sub-decisions inside the Decision, each with its own commitment-and-rationale shape. The substrate flattens them into the top-level commitment string, losing the sub-decision structure.
- ADR-098's `Why not ship the structural amendments in Cycle 019` sub-section — reflexive-application argument structure. It is a warrant-for-the-deferral-choice, not a warrant-for-the-commitment. The substrate's `warrants` array doesn't distinguish warrant-for-what.
- ADR-094's `Calibration trigger for threshold values` paragraph (post-Consequences) — a sub-graduation-trigger with finer-grained mechanics than the top-level graduation-trigger field.

**Verdict:** The schema preserves the canonical audit-substance, but the source ADRs carry more sub-structure than the five flat fields express. A faithful substrate needs nested fields (sub-commitments, warrant-for-what, sub-graduation-triggers) — or it accepts compression loss at the sub-argument level. The lossiness is not catastrophic but it is real, and it is exactly the kind of loss that becomes invisible once the source is no longer the canonical reference.

### 2. Schema fitness

The starting typed-link schema (`supersedes`, `implements`, `motivates`, `applies-pattern`) was **inadequate**. The five ADRs needed:

- `applied-by` (inverse of `applies-pattern`, for the Pattern record)
- `parallel-to` (ADR-094 ↔ ADR-096; ADR-095 ↔ ADR-083 — same-tier, distinct-workflow-point relationships)
- `shares-structural-limit-with` (ADR-095 ↔ ADR-097 — both inherit the discriminating-criterion trivially-passing-escape-hatch limit)
- `continues-discussion-of` (ADR-098 → ADR-097 — Three-Application F-P2 Pattern thread)
- `cross-project-evidence` (ADR-097 → llm-orc-ADR-016, plexus-ADR-038, plexus-ADR-024, zani-palette — evidence anchors outside the local corpus)
- `references` (ADRs → Invariants and prior ADRs; used when there is no stronger semantic relationship)

The four starting types covered roughly half of the relationships the five ADRs needed. The richer relationship vocabulary surfaced during substrate authoring — not as a planning exercise but as a consequence of trying to encode actual content. **This matters:** any schema fixed up front will under-cover the corpus. The schema needs to be extensible or it becomes a Procrustean bed.

Additionally, the schema needed `note` text on each link to carry the relationship's specific semantics inline (e.g., `motivates` ADR-098 with note `"reflexively applies Empirical-Grounding Filter to its own scope choice"`). Without note text, the typed link names a category but does not convey what the link actually does. Links to Invariant-0 / Invariant-4 / Invariant-8 in ADR-097 with no note text remained cold-lookup-required; the link type alone (`references`) did not deliver the semantic payload.

### 3. Surface derivation

Single-source derivation worked cleanly. The script reads the substrate once, generates seven Markdown files in a deterministic pass, and exits. No state, no parallel content, no opportunity for drift. The generated surface is human-readable. Re-running the script after a substrate edit regenerates the views with no manual reconciliation.

The overview view's compactness (one paragraph per record + co-located typed cross-refs) is materially easier to skim than a flat directory listing of five 100-line ADR files. The pattern's role as the organizing center is visible at the top; the application points are co-located, comparable side-by-side. This is the multi-resolution gain the practitioner's hypothesis predicted.

### 4. Focus+context vs. replace-context

Each drill-in view ends with a "Surrounding records" footer naming the other records with their workflow point and mechanism. The reader navigating into ADR-097's drill-in does not lose the orientation that ADR-094 is the round-end-saturation parallel and ADR-098 is the methodology-audit-coverage extension — the surrounding records are visible, named, and characterized at the bottom of the view.

This is focus+context per Cockburn et al. 2008's family typology — context is preserved within the focus view, not separated into a different window or hidden behind a back-navigation. It is **not** the failed zooming pattern where the overview disappears when the detail is shown.

The limitation: the footer names other records but does not show their summaries inline. A reader who wants ADR-094's summary while reading ADR-097's drill-in still has to navigate. A richer focus+context would show a one-line summary of each surrounding record. That is a surface-derivation enhancement, not a substrate change.

### 5. Cross-reference resolution

Cross-references are co-located with their semantic content **when the `note` field is populated**. The link `motivates → ADR-098 (ADR-098 applies ADR-097's filter reflexively to scope its own deferrals)` tells the reader what the relationship is without requiring lookup. This satisfies the Chandler & Sweller 1992 remedy (avoid split-attention by placing related elements adjacent) and Shneiderman 1996's information-scent principle.

The failure mode appears when notes are absent. ADR-097's links to `Invariant-0`, `Invariant-4`, `Invariant-8` have no notes; the reader sees only the link type (`references`) and must do cold lookup. **Discipline note:** the substrate authoring convention must require notes on every non-trivial link, or the cross-reference resolution claim degrades silently.

### 6. Comprehensiveness trap warning

The substrate's record format is **at risk of replicating the arc42 / C4 comprehensiveness failure mode**. The five-field audit-substance block invites every record to populate every field — and Loop 2 Q5's negative case (arc42's "can be overkill for simple systems"; C4's "felt very comprehensive, but by being comprehensive, it failed to represent the salient points") names exactly this risk.

Concretely: not every record needs all five fields. A vocabulary-term record might have only commitment + provenance. An Invariant record might have commitment + warrants without rejected-alternatives. Forcing every record into the five-field shape would produce thin/empty fields for records that don't need them. The schema must allow optional fields — and the authoring discipline must resist filling fields for completeness rather than for content.

**The Pattern record in this spike was already a stress test for this trap.** I populated its five fields, but the Pattern's "rejected-alternatives" are really the application-point ADRs' alternatives propagated upward — the Pattern itself does not reject specific alternatives, it names a class of methodology gap. The fields fit imperfectly. A real implementation would benefit from per-type schemas (Pattern records, ADR records, Invariant records have different shapes), not a single universal record shape.

### 7. Implementation friction

The deepest friction was **deciding what counts as audit-substance**. The five-field schema is opinionated. The source ADRs structure themselves around Decision / Consequences / Rejected Alternatives / Provenance, with audit findings (R2, R3, R5) sprinkled across these as in-place revisions. Encoding the ADRs into the five fields required interpretation — and interpretation is the compression step where things are lost.

Examples of friction:
- ADR-094's mechanism specification (the verdict-line template) had no natural home. I demoted it to the summary, losing structural visibility.
- ADR-097's Target 2/Target 3 sub-decisions are first-class commitments inside the Decision section. I compressed them into the top-level commitment field, losing their independent status.
- ADR-098's reflexive-application argument (ADR-098 applies ADR-097 to its own scope choice) is itself a substantive warrant. I placed it in `warrants`, but it is structurally different from the empirical warrants — it is a methodological-coherence warrant. The field doesn't distinguish.

A second-order friction: **the substrate's record IDs and link targets are stable identifiers, but the audit-substance content is summarization.** If the source ADR is later amended (a new audit finding is integrated), the substrate's audit-substance fields must be updated — but the update is interpretive, not mechanical. The single-source claim is solid for surface views, but the substrate itself is downstream of the source ADRs; it is not the canonical source. **A real implementation must answer:** is the substrate the source of truth (and the human-readable ADRs are derived from it)? Or are the source ADRs canonical (and the substrate is a derived index)? The spike did not resolve this; it assumed the latter.

## Failure modes encountered

- **Schema inadequacy on contact.** The four starting link types covered roughly half the actual relationships. Six new types surfaced during authoring. Any pre-committed schema will under-cover the corpus.
- **Compression-loss at the sub-argument level.** The five-field audit-substance schema loses ADR-094's signal-evaluation step, ADR-097's Target 2/Target 3 sub-decisions, ADR-098's reflexive-application argument. Lossy compression.
- **Comprehensiveness trap.** The Pattern record's fields fit imperfectly because not every record-type has all five fields. Universal record shape forces field-filling.
- **Note-discipline dependency.** Cross-reference resolution depends on every non-trivial link having note text. Absence is silent failure.
- **Authority ambiguity.** Spike assumed source ADRs are canonical and substrate is derived; this collapses the single-source-of-truth claim because edits to source require interpretive re-encoding into substrate.

## Surface-derivation samples

**Overview excerpt (compact application-point listing):**

> ### ADR-097: Empirical-Grounding Filter at DECIDE (Tier-2 Methodology Vocabulary)
>
> **Workflow point:** ADR-drafting-time | **Mechanism:** empirical-grounding-felt-trigger | **Tier:** Tier-2
>
> At ADR-drafting time, the practitioner-and-agent dyad applies a felt-trigger asking whether the commitment is empirically grounded by (1) PLAY evidence, (2) stakeholder-articulated demand, (3) spike validation, or (4) structural operationalization...
>
> **Cross-refs (co-located):**
> - `applies-pattern` → **PATTERN-calibration-with-graduation-trigger**
> - `motivates` → **ADR-098** *(ADR-098 applies ADR-097's filter reflexively to scope its own deferrals)*
> - `shares-structural-limit-with` → **ADR-095** *(discriminating-criterion / trivially-passing escape hatch)*
> - `cross-project-evidence` → **llm-orc-ADR-016** *(Conditional Acceptance pattern; WP-H4 close 2026-05-12)*

**Drill-in excerpt (focus+context footer):**

> ## Surrounding records (focus+context, not replace-context)
>
> *The drill-in keeps you oriented to the rest of the corpus. Each surrounding record is named with its workflow point and mechanism so you can navigate without cold lookup.*
>
> - **PATTERN-calibration-with-graduation-trigger**: Calibration-with-Graduation-Trigger *(workflow: methodology-vocabulary; mechanism: graduation-trigger)*
> - **ADR-094**: Audit Round-Count Calibration via Convergence-Saturation Signal *(workflow: audit-round-end; mechanism: saturation-signal)*
> - **ADR-095**: Agent Outcome Test for Agent-Facing Artifact Admissibility *(workflow: artifact-creation-moment; mechanism: felt-trigger-admissibility-test)*

## Recommendations for DECIDE / ARCHITECT phases

1. **The substrate-and-surface architecture works for the overview + drill-in navigation problem.** The hypothesis is supported by the spike: typed links + audit-substance + derivation produces a multi-resolution view that preserves focus+context and resolves cross-references inline. The plain-JSON form is plugin-native (no external dependencies; no graph database). This is the core finding to commit.

2. **Do not commit to a fixed typed-link schema.** Commit to an extensible schema (any string is a valid link type) with **note text required for every non-trivial link**. The Loop 2 lit-review's recommended four types are a starting set; expect to add more as the corpus grows. The methodology amendment should specify the discipline (typed links + note text) rather than the specific types.

3. **Do not commit to a single universal record shape.** Per-type schemas (Pattern, ADR, Invariant, Vocabulary-term, Scenario) will fit better than a five-field universal block. The arc42 comprehensiveness trap is real; forcing every record into the same shape produces empty fields or interpretive stretching. Each record type should have its own minimal field set.

4. **Resolve the authority question explicitly.** Either:
   - **(a) Substrate is canonical**, human-readable ADRs are derived. This preserves single-source-of-truth strictly but forces authors to write structured records, not prose.
   - **(b) Source ADRs are canonical**, substrate is a derived index. This preserves the prose-authoring practice but requires a maintenance discipline for keeping the substrate current with source edits — and that maintenance is interpretive, not mechanical.

   The spike used (b) implicitly. The choice is consequential and should be a named DECIDE-phase commitment, not a defaulted assumption.

5. **The compression-loss at the sub-argument level is the binding constraint.** ADR-097's Target 2/Target 3 sub-decisions, ADR-094's signal-evaluation step, ADR-098's reflexive-application argument — these are first-class content that the flat schema cannot hold without sub-structure. The schema should allow nested fields (sub-commitments inside commitments; warrants tagged by what they warrant) or the methodology accepts that the substrate is a compressed index, not a faithful encoding.

6. **The discriminating criterion question (Loop 2 Q5: when does the substrate become arc42-style overkill?) does not have a clean answer.** The spike demonstrates the risk: even with five records, the universal record shape stretches uncomfortably for the Pattern. Mitigation is per-type schemas (item 3) and per-record optional-field flexibility — not bigger-default-record-shape.

## What I would do differently in a real implementation

- **Start with three record types, not one.** Pattern records, ADR records, and Vocabulary-term records have materially different shapes. Universal record shape is a comprehensiveness trap.
- **Make `note` required on every link.** The cross-reference resolution claim depends on it. Schema validation should fail records with untyped or unnotated links.
- **Treat the substrate as derived from prose source, with a maintenance discipline** — not as the canonical source. The spike's experience showed that the audit-substance fields require interpretation; mechanically extracting them from prose is not currently a solved problem. Substrate updates are interpretive, like translation.
- **Build the substrate authoring workflow before scaling.** The spike authoring required reading each ADR fully and making interpretive judgments about field assignment. At ~100 ADRs (RDD's full corpus), this is a substantial cost. The methodology amendment should account for substrate-maintenance overhead, not pretend it is free.
- **Surface-derivation script should be part of the methodology toolchain**, not a one-off script. If the methodology commits to substrate-and-surface, the derivation tool is now a methodology artifact with its own maintenance.
- **Pilot with a small corpus first.** The spike's five-ADR scope was tractable. Scaling to 50+ ADRs would surface friction the spike did not see (cross-cycle link consistency; provenance link rot when source ADRs are renamed; namespace collisions; cycle-archive interaction).

## Spike code

The scratch directory `./scratch/spike-020-substrate-surface/` contained:

- `substrate.json` — six records (Pattern + 5 ADRs) with typed links and audit-substance blocks. 268 lines.
- `derive_surface.py` — Python script reading `substrate.json` and writing seven Markdown files to `surface/`. Pure standard library; no dependencies.
- `surface/overview.md` — generated overview view (128 lines).
- `surface/drill-{record-id}.md` — six generated drill-in views (62–74 lines each).

The script ran in under one second and produced human-readable Markdown output. Re-running regenerated identical files from the substrate.

**The scratch directory has been deleted** per spike-runner discipline (`rm -rf ./scratch/spike-020-substrate-surface/`). This document is the durable record of what existed and what was learned.
