# RDD Cycle Status

## Cycle Stack

*No active cycle.*

The most recently completed cycle was **Cycle 017 — Readability & Comprehensibility**, archived at `docs/cycle-archive/cycle-017-readability-and-comprehensibility-status.md` on 2026-04-28. v0.8.5 is the current plugin release.

To start a new cycle, invoke `/rdd` (full pipeline), `/rdd-research` (research only), or any phase skill standalone. The orchestrator scans for existing artifacts, prompts for the artifact base, and creates a new active entry in this stack.

## Last completed cycle (summary for context)

**Cycle 017 — Readability & Comprehensibility** (started 2026-04-24; closed 2026-04-28)

- Eight new ADRs (083–090) shipped in v0.8.4; ADR-091 (Dual-Mode BUILD) shipped in v0.8.5 as an in-cycle methodology amendment from the BUILD-exit gate
- Pattern A/B catalog for agent-context content placement (ADR-084) shipped, with the system-design split (`system-design.md` + `system-design.agents.md`) as the canonical Pattern B exemplar
- `.rdd/` infrastructure relocation (ADR-085) tooling shipped and dogfooded on this corpus; the rdd repo itself migrated from `docs/housekeeping/` to `.rdd/`
- Stop-hook manifest check advisory across all modes (ADR-088); In-Progress Phase predicate scope narrowed to per-phase advisory only (ADR-090); compound-check fabrication detection retained
- `/rdd-research` validation-spike decision step (ADR-087) and `/rdd-conform` graduation-check operation (Issue #17) shipped
- 19 hook tests pass; integration verification report at `.rdd/audits/integration-verification-017.md`

**Open future-cycle items** (carried forward from Cycle 017):

- **Outcome Test invariant placement** (ADR-083 §6) — held as future-cycle scope.
- **"Does RDD over-engineer?"** (MODEL Amendment 21 + ADR-087 §3a) — partly addressable in-cycle via tightly-scoped prototyping; broader structural-posture critique remains future-cycle scope.
- **Cycle-as-instance reflection elevation** (ADR-087 §4) — methodology-level question whether any cycle's findings should be treated as research-not-validation until tested against the world.
- **Three framing-audit findings from DECIDE** (F-P2.1 ADR-083 bolt-on signal scope vs companion files; F-P2.2 ADR-086 final non-adoption framing tone; F-P3.1 ADR-084 naming convention novelty) — carried as user judgment.
- **ADR-091 framing-audit findings** (FF-P2.1 single-cycle legitimization without compensating mechanism for design-alternative-examination gap; FF-P3.1 heavy-lifting-vs-gated-default tension) — carried as user judgment.
- **Three unfeatured truths from ARCHITECT** (Ernst & Robillard scope qualification; "threading is wrong in principle" alternative; ADR-083 exception conditions agent-composed) — held as user judgment.
- **Corpus-internal-identifier accessibility audit** — surfaced at the architect → build gate's second exchange. Audit + restructure pass to gloss or footnote corpus-internal identifiers (ADR-NNN, Cycle-N, Tier-N, Spike-N, Invariant-N) for first-encounter readers.
- **Topical taxonomy for domain-model concepts/actions/relationships** — surfaced at the architect → build gate's third exchange. Whether organizing by what concepts are *about* would serve first-encounter readers better than chronological-by-cycle. Paired with the corpus-internal-identifier audit at different scales.
- **Product-facing Outcome Test verification** (architect-snapshot Signal E) — zero-prior-familiarity reader feedback on the ORIENTATION → routed-to artifacts traversal. Requires actual reader feedback per ADR-087 §4 cycle-as-instance reflection.
- **WP-D separate-hook design alternative** (build-snapshot Feed-forward D) — future-cycle candidate for evaluating whether the FAILURES_PHASE / FAILURES_COMPOUND partition would have been better served by a separate compound-check hook.
- **Auto-mode BUILD stewardship gap** (build-snapshot Feed-forward E + ADR-091 framing-audit FF-P2.1) — methodology question of whether to add a compensating mechanism for the design-alternative-examination gap.

PLAY and SYNTHESIZE were not run for Cycle 017; they remain available against this cycle or the corpus at any later time.
