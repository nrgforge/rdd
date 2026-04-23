# ADR-074: ADR Body Immutability, Status Mutability, and Supersession Workflow

**Status:** Proposed

## Context

Issue #12 names two competing pressures that ADRs are silently asked to absorb without explicit coordination:

1. **Historical record** — "what was decided, when, why, what alternatives were rejected." Value comes from fidelity to the moment of decision.
2. **Current input to system-design** — provenance chains in `system-design.md` cite ADRs to justify current architecture; if the cited ADR has drifted from the shipped code, the provenance chain misleads readers.

The pressure to amend ADRs to match shipped code is the real-world response to (2). The cost is the loss of (1). And the consequence is often worse than the staleness it was trying to solve, because it is silent — readers can no longer ask "when did this design change, and why?"

The naive fix ("never amend ADRs") solves (1) at the cost of (2): provenance chains stay frozen and slowly mislead.

Practitioner consensus on immutability is uniform across reviewed sources. Nygard (2011), Fowler (2023), AWS Prescriptive Guidance (2023), Microsoft Azure Well-Architected (2026), and GDS (2022) all converge on body-immutability with status-mutability — change is expressed through supersession (a new ADR replaces the old; the old ADR's status field is updated to "Superseded"). The IETF RFC process is the most relevant adjacent-field analog: published RFCs are never modified after publication; corrections flow through a typed errata system, and the IETF distinguishes three supersession mechanisms — **Obsoletes** (total replacement), **Updates** (partial modification — the old RFC remains partially valid), and **Historic** (deprecated technology, distinct from supersession). The IETF also publishes a periodic current-state index above the immutable corpus, structurally analogous to a maintained `system-design.md`.

The role separation Issue #12 proposes — ADRs as immutable historical record, `system-design.md` and `ORIENTATION.md` as current truth — is latent in established practice but nowhere formalized. GDS comes closest with a single sentence: "other documentation should be updated whenever a new ADR is accepted." The triggering mechanism for synchronizing current-state documents on supersession is the genuine gap.

The domain model concept **ADR Supersession** was added in Amendment 19, naming the lifecycle but not the workflow. This ADR specifies the workflow.

## Decision

**1. Role separation — make explicit what is currently implicit.**

The DECIDE skill (and reference from `/rdd-architect`) records the role separation:

> ADRs serve the historical-record role: "what was decided, when, why, what alternatives were rejected." Their value is fidelity to the moment of decision.
>
> `system-design.md`, `ORIENTATION.md`, `domain-model.md`, and `field-guide.md` serve the current-state role: "what is the architecture today, with provenance to the decisions that produced it." Their value is currency.
>
> When these roles are separated, a reader asking "what is current?" reads the current-state document; a reader asking "what was decided?" reads the ADR. Each artifact does one job and stays accurate at it.

**2. ADR mutability rules.**

For accepted ADRs:

- **Immutable:** Context, Decision, Rejected alternatives, Consequences, Provenance check. The decision text never changes after acceptance.
- **Mutable:** Status field (`Proposed` → `Accepted` → `Superseded by ADR-NNN` → `Deprecated`); a dated supersession header at the top of the ADR linking to the superseding decision.

A single supersession header has the form:

```markdown
> **Superseded by ADR-NNN on YYYY-MM-DD.** [One-line reason.]
```

For an ADR that is partially superseded (the IETF *Updates* category), the header reads:

```markdown
> **Updated by ADR-NNN on YYYY-MM-DD.** [Names which part is updated; the rest of this ADR remains current.]
```

The status field reflects the strongest applicable lifecycle state: `Updated by ADR-NNN` for partial supersession, `Superseded by ADR-NNN` for total supersession, `Deprecated` when the decision no longer applies but no new decision replaces it.

**3. Supersession workflow.**

When a later decision genuinely supersedes (or updates) an earlier ADR — distinct from implementation-level divergence (see drift decision tree below) — the workflow is:

1. **File a new superseding (or updating) ADR** describing the new decision and its rationale, citing the original ADR by number and one-line summary.
2. **Add a dated supersession (or update) header** at the top of the original ADR, linking to the new one. Update the status field accordingly. The original's body is not edited.
3. **Update the downstream current-state artifacts** so the current architecture now traces to the new decision, not the superseded one. The artifacts to sweep:
   - `system-design.md` — provenance chains in module/responsibility/driver tables
   - `ORIENTATION.md` — Section 4 (artifact map) and Section 5 (current state) if affected
   - `domain-model.md` — concept and relationship tables that cite the superseded ADR; Amendment Log entry recording the supersession's impact
   - `field-guide.md` — implementation-level entries that referenced the superseded decision
4. **Record the supersession in the cycle that produced it** — cycle-status.md notes the supersession in the relevant phase status entry.

Step 3 is the load-bearing step that prevents stale provenance. It is mandatory; supersession without downstream-artifact update creates exactly the silent provenance drift the workflow exists to prevent.

**4. Drift resolution decision tree.**

When ADR text and shipped code differ:

- **Implementation-level divergence** (the architectural decision still holds; one detail differs in code) — no ADR change. The code carries provenance via commit message; `field-guide.md` may note the divergence if useful for orientation.
- **Decision-level supersession** (the original architectural call has actually changed) — apply the supersession workflow above.
- **Drift not caused by either** (code that violated an ADR without filing a supersession) — the code is structural debt. Either reconform the code via a `refactor:` commit (BUILD's existing pattern) or file a superseding ADR that legitimizes the new direction. The methodology's position: **do not quietly amend the ADR to match a violation.** Silent amendment loses the historical record without announcing the change.

The drift resolution is a judgment the developer makes when the discrepancy is observed (typically during `/rdd-conform` audit, BUILD stewardship, or ARCHITECT review). The decision tree is the structure for that judgment.

## Rejected alternatives

**Allow body-mutability with date-stamped insertions ("living-document" approach).** Rejected. The minority position from the supersession literature: "We insert the new info into the existing ADR, with a date stamp." This trades provenance traceability for navigational simplicity. For RDD, where `system-design.md` explicitly cites ADRs as provenance for architectural choices, the living-document approach introduces a specific risk: the provenance link can point to content that has silently changed meaning. If ADR-012's decision text is mutated to match what shipped, but `system-design.md`'s provenance chain was written when ADR-012 said something else, the chain silently lies. Immutability serves RDD's provenance function; the living-document approach serves a different function (informal team memory aid, where provenance is not load-bearing).

**Single supersession category — no Updates/Obsoletes distinction.** Rejected. The IETF's three-way split (Obsoletes, Updates, Historic) reflects a real distinction observed in RDD's own corpus: many ADRs partially refine a prior ADR rather than replacing it wholesale. ADR-068 extended ADR-059 (Grounding Reframe) without superseding it; the *Updated by* header captures this faithfully where *Superseded by* would be misleading.

**Defer downstream-artifact update to a separate `/rdd-conform` pass.** Rejected. The conformance audit is a periodic sweep; the supersession workflow needs synchronous downstream update because the act of supersession is the moment the provenance chain becomes stale. Deferring to `/rdd-conform` recreates the silent-drift window. The audit remains as a backstop for misses.

**Treat drift-from-violation as automatic supersession.** Rejected. Silent legitimization of code that violated an accepted decision erodes the methodology's integrity. The decision tree explicitly forces the choice: reconform the code, or file a superseding ADR with rationale. Either preserves the historical record.

**Update `system-design.md` provenance to point at the superseding ADR by automated find/replace.** Rejected. Provenance chain text often carries phrasing tied to the superseded decision's context; mechanical substitution leaves prose that no longer reads coherently. The downstream-update step is a sweep with judgment, not a regex pass.

## Consequences

**Positive:**

- Closes the provenance-staleness gap: `system-design.md` chains stay current because supersession explicitly triggers their update.
- Preserves historical record: ADRs remain readable as records of the moment of decision, including alternatives that were rejected and reasoning that has since been refined.
- Adopts the IETF Updates/Obsoletes distinction, which matches the actual pattern in RDD's ADR corpus (many partial refinements; some total replacements).
- Names the role separation explicitly so future ADRs and skill files can reference it.
- Establishes a drift decision tree that names the third case (code violated an ADR without filing supersession) as structural debt, preventing the "quiet amend" failure mode.

**Negative:**

- Per-supersession overhead increases — Step 3's downstream sweep is the load-bearing step and the costliest. Mitigated by the alternative being silent provenance drift, which is worse.
- The supersession workflow adds per-correction friction. The essay observed that approximately 50% of open-source repositories with ADRs contain fewer than five records (essay 015 §3), which is consistent with high abandonment but does not establish that supersession-workflow friction is a cause. Whether the friction this ADR adds exceeds the threshold that correlates with abandonment in observed corpora is unknown. RDD's mitigation is that the corpus is project-internal (not open-source signaling) and the workflow is invoked only when a decision actually supersedes — not for every ADR change.
- Older RDD ADRs (those filed before this ADR) may not yet have supersession headers where they should. Backfilling is out of scope for this ADR; `/rdd-conform` may surface this as a debt item in a later pass.
- **Long-chain navigation cost.** As the ADR corpus grows, supersession chains deepen (ADR-NNN → ADR-MMM → ADR-PPP), and the query "which ADR is currently authoritative on topic X?" becomes more expensive. The essay (§3) names this as a real cost of immutability with supersession; this ADR does not address it directly. Mitigation paths for a future pass include a current-state index of active ADRs (the IETF's RFC index analog) or an automated query that walks supersession chains in `system-design.md`'s provenance lookups. Acknowledged as known cost without a current mitigation.

**Neutral:**

- Atomic ADRs that are never superseded carry no overhead beyond the existing structure.
- The `Status` field already exists in the ADR template; this ADR formalizes its allowed values and supersession-header convention.
- Existing ADR-supersession headers in the corpus (e.g., ADR-057's note about ADR-065 retroactively anchoring it) are consistent with this ADR; no immediate cleanup required.

## Provenance check

The role separation, the body-immutable / status-mutable rule, the supersession workflow, and the drift decision tree all originate in Issue #12 (user-authored) and essay 015 §3. The Nygard / Fowler / AWS / Azure / GDS practitioner consensus and the IETF RFC analog are essay-grounded. The ADR Supersession concept is in the domain model from Amendment 19. Driver-derived.

The specific formatting of the supersession and update headers (markdown blockquote with date and one-line reason) is drafting-time synthesis composed against the existing ADR-057 supersession header pattern in the corpus.

The four-artifact downstream sweep list (`system-design.md`, `ORIENTATION.md`, `domain-model.md`, `field-guide.md`) is drafting-time synthesis derived from the existing artifact hierarchy in the orchestrator skill (Tier 1 / Tier 2 / Tier 3 reading). The cycle-status entry in Step 4 is drafting-time synthesis grounded in the existing cycle-status.md phase-status convention.

The Updates / Obsoletes / Historic split is essay-grounded (IETF RFC process); the application to RDD's ADR corpus is drafting-time synthesis with the corpus example (ADR-068 partially extending ADR-059) as evidence the distinction is meaningful in practice.
