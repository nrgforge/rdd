# ADR-081: Grandfathered-Rule Migration for Pre-ADR-072 Cycles

**Status:** Proposed

## Context

Issue #14 question 4 names a concrete migration problem: pre-hook cycles (started before v0.7.0) lack ADR-072's cycle-shape fields and cannot be resumed cleanly under enforcement mode. The example case is **Cycle 8 (rdd-pair)**, paused at MODEL, pre-hooks. Its `cycle-status.md` predates ADR-072's `**Skipped phases:**` and `**Paused:**` fields, so the hook's manifest checks may misfire when the cycle is resumed.

Essay 015 §5 names the **grandfathered-rule pattern** as the relevant precedent: Microsoft Dynamics 365 and Atlassian Connect both use the pattern where active legacy instances continue under the old enforcement regime until explicitly upgraded. The pattern preserves the durable record of legacy work while preventing new work from accumulating under the old regime.

ADR-070 established the migration boundary for Cycle 10's structural ADRs: the `docs/housekeeping/.migration-version` file marks corpora as enforcement-mode (post-migration) versus advisory-mode (pre-migration). That migration handled the corpus-level transition; this ADR handles the per-cycle transition, where individual paused cycles may need to be brought under the new schema (ADR-072 cycle-shape fields, ADR-078 multi-cycle stack, ADR-079 in-progress-gate field, ADR-080 preconditions).

The decision posed: how does a pre-ADR-072 cycle resume under post-ADR-072 enforcement without forced rewrites and without losing enforcement guarantees for the cycles that have been migrated?

## Decision

**1. Legacy detection.**

The Stop hook detects pre-ADR-078 `cycle-status.md` files (single-entry, no `## Cycle Stack` header) and treats them as **legacy single-entry format** (per ADR-078). Within the legacy format, the hook detects pre-ADR-072 entries by the absence of any cycle-shape fields (`**Skipped phases:**`, `**Paused:**`, `**Cycle type:**`) — the entry was written before the schema existed.

When a legacy pre-ADR-072 entry is detected, the hook applies **grandfathered enforcement**: it runs in advisory mode for that cycle's manifest checks, regardless of the corpus-level `.migration-version` state. Advisory output ("checks that would have failed: X, Y, Z") is logged; no Stop is blocked.

**2. The grandfathered window.**

A pre-ADR-072 cycle remains under grandfathered enforcement until one of:

- The user runs `/rdd-conform` cycle-shape audit (defined below) and migrates the cycle to the current schema.
- The user explicitly graduates the cycle (ADR-025) — graduation closes the cycle, and the grandfathered window ends with the cycle.
- The user manually adds the current-schema fields (e.g., `**Cycle type:**`, `**Started:**`) to the legacy entry — once the entry has the current schema, the hook treats it as fully migrated and resumes enforcement-mode checks.

**3. `/rdd-conform` cycle-shape audit scope.**

`/rdd-conform` (the conformance audit utility) gains a **cycle-shape audit scope** that detects pre-ADR-072 `cycle-status.md` files and walks the user through populating fields matching the cycle's actual state. The audit:

- **Detects** the legacy entry (single-cycle format, no cycle-shape fields).
- **Reads** the existing entry's body to infer fields where possible (started date from explicit text or git history; cycle title; current phase from existing prose).
- **Prompts** the user for fields the existing entry does not provide (cycle type, current phase confirmation, paused state, parent cycle if any).
- **Writes** the migrated entry — preserving the existing prose body — into the current ADR-078 stack format.
- **Records** the migration in the entry's Pause Log (or, if no log exists, creates one) with a one-line "Migrated from pre-ADR-072 format on YYYY-MM-DD" entry.

The audit is opt-in per cycle. Running `/rdd-conform` against a corpus with multiple legacy cycles surfaces them as a list; the user migrates each individually or batch-confirms after review.

**4. What the migration preserves.**

- The existing entry's prose body (Phase Status table, Feed-Forward Signals, Context for Resumption sections) is preserved verbatim. The migration only adds cycle-shape header fields; it does not rewrite the body.
- The cycle's identity (cycle number, title, started date) is preserved.
- The cycle's pause state, if any, is captured in `**Paused:**` per ADR-072. If the legacy entry lists itself as paused in prose, the prose pause becomes the formal field; the prose remains for human readability.

**5. What the migration does not do.**

- It does not retroactively run manifest checks on the legacy cycle's already-completed phases. The grandfathered phases are accepted as-completed; only post-migration work is subject to enforcement.
- It does not change archived cycle artifacts (prior cycle-status.md files in `docs/cycle-archive/`). Archived cycles are historical records and remain in their original format.
- It does not require all legacy cycles in the corpus to be migrated before any cycle can use the new schema. Migration is per-cycle.

**6. Cycle 8 (rdd-pair) as the validation case.**

Issue #14 names rdd-pair as the concrete test case for the migration path. The validation: `/rdd-conform` cycle-shape audit on rdd-pair's `cycle-status.md` produces a current-schema entry that resumes cleanly under enforcement, with the Cycle 8 work preserved as historical context. Validation occurs in BUILD; if the audit's output is rough (missing fields the user cannot easily supply, ambiguous phase mapping), the audit's prompts are refined before the cycle migration is committed.

## Rejected alternatives

**Force migration of all legacy cycles before enforcement is enabled.** Rejected. Some legacy cycles may never resume — the migration cost is wasted. Some legacy cycles' state cannot be cleanly mapped to the current schema (e.g., a cycle paused mid-phase with ambiguous resume semantics) and forcing migration introduces fabrication risk. Per-cycle opt-in migration is the correct granularity.

**Treat all pre-ADR-072 cycles as "Paused" by default.** Rejected. The default-paused approach silently changes the cycle's enforcement state, which is the opposite of what Invariant 8 requires (changes to enforcement should be visible, not silent). Grandfathered advisory mode is honest about what the methodology cannot guarantee for legacy cycles, without misrepresenting their status.

**Auto-rewrite legacy cycle-status.md files on first hook fire after migration.** Rejected for the same fabrication reason — the hook's automatic rewrite cannot determine cycle type, current phase intent, or pause status with the user's epistemic authority. The user-prompt-driven migration via `/rdd-conform` preserves the user's authority over cycle state.

**Drop the grandfathered window after a fixed period (e.g., 90 days post-migration).** Rejected. Time-boxed grandfathering is appropriate when legacy cycles are expected to wind down naturally (e.g., legacy customers migrating to a new product version). RDD's legacy cycles are practitioner work that may resume after long pauses (Pair-RDD's Cycle 8 is the example — paused with no committed resume date). Time-boxing the grandfathered window introduces deadline pressure that is not aligned with the methodology's voluntary, deep-work character.

**Bundle the migration into ADR-080's precondition framework** (e.g., add a `legacy_format` precondition). Considered and partially adopted: ADR-080's precondition framework provides the mechanism by which the grandfathered checks are skipped, but the *detection* of legacy format is hook logic (parsing the file structure), not a precondition. The grandfathered policy is more than a precondition — it is the methodology's stance on how legacy work composes with new enforcement, recorded as its own ADR for visibility.

## Consequences

**Positive:**

- Closes the migration gap: pre-ADR-072 cycles can resume under post-migration enforcement without forced rewrites.
- Adopts the well-precedented grandfathered-rule pattern (Microsoft Dynamics 365, Atlassian Connect) — RDD's application is faithful to the precedent.
- Preserves the durable record of legacy work: the existing cycle-status.md prose is retained verbatim through migration; nothing is silently rewritten.
- The migration is opt-in per cycle, so practitioners migrate at the moment they are ready to resume the cycle, not before.
- `/rdd-conform`'s cycle-shape audit creates a clear migration path with user-driven prompts; the audit is a one-time event per legacy cycle.
- Cycle 8 (rdd-pair) becomes a concrete validation case for the migration path; if the audit's prompts are rough on the validation case, the audit is refined before broad use.

**Negative:**

- Legacy cycles in grandfathered mode receive only advisory enforcement. This is a deliberate gap (the methodology cannot retroactively enforce checks on work completed under the old schema) but means legacy cycles do not benefit from post-migration structural guarantees until migrated.
- Practitioners may forget to migrate legacy cycles when resuming them. Mitigated by the advisory output naming the grandfathered status visibly each session.
- The `/rdd-conform` cycle-shape audit is new functionality; building it adds implementation work beyond the methodology change.
- Some legacy cycles' state may be genuinely ambiguous (mid-phase, no clear pause marker, partial Phase Status table). The audit must be able to handle ambiguity gracefully; the failure mode is the user declining to migrate, in which case the cycle remains grandfathered.

**Neutral:**

- Cycles created after this ADR (and after ADR-072 / ADR-078) are born in the current schema; no migration ever applies to them.
- Archived cycles in `docs/cycle-archive/` are unaffected while archived. **If an archived cycle is unarchived (resumed from archive)** — moved back into `docs/cycle-status.md` — it is treated as any other paused cycle being resumed: if it pre-dates ADR-072, the grandfathered enforcement applies and `/rdd-conform` cycle-shape audit is the migration path. The unarchive-then-resume sequence is a low-likelihood edge case (Cycle 8 is paused-not-archived); naming it here avoids an unspecified behavior gap.
- The `.migration-version` file (ADR-070) continues to mark the corpus-level enforcement state; this ADR adds the per-cycle dimension on top.

## Provenance check

The core framing — grandfathered-rule migration with opt-in per-cycle audit — derives from Issue #14 question 4 (user-authored: "Conform could gain an audit scope that detects pre-ADR-072 `cycle-status.md` files and walks the user through populating fields matching the cycle's actual state") and essay 015 §5 ("a migration strategy for pre-ADR-072 cycles using the grandfathered-rule pattern"). The Microsoft Dynamics 365 and Atlassian Connect precedents are essay-grounded. Driver-derived.

The four-step audit workflow (detect / read / prompt / write) is drafting-time synthesis composed against the existing `/rdd-conform` skill structure (which already audits artifact templates and detects drift) — adding cycle-shape audit as a new scope follows the conform skill's existing pattern.

The "preserve prose body verbatim" rule is drafting-time synthesis intended to prevent fabrication: the audit migrates the schema header but does not edit the cycle's narrative content, which the user is the source of truth for.

The "no retroactive enforcement on completed phases" rule is drafting-time synthesis grounded in the grandfathered-rule pattern's principle (legacy work continues under legacy regime until explicitly upgraded).

The Cycle 8 (rdd-pair) validation case is from Issue #14 question 5 (user-authored). Driver-derived.

The "/rdd-conform cycle-shape audit detects multiple legacy cycles and surfaces them as a list" affordance is drafting-time synthesis intended to support corpora with multiple legacy cycles (e.g., a project that has run several mini-cycles before adopting v0.7.0).
