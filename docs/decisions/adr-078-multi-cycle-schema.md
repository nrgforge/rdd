# ADR-078: Multi-Cycle Schema in cycle-status.md

**Status:** Proposed

## Context

Issue #14 names a structural mismatch: `cycle-status.md` represents a single active cycle, yet practice involves multiple cycles at different states — paused, mini-cycles, pre-hook cycles needing resumption, and (latent) nested mini-cycles spawned within an outer cycle. The single-cycle model produces hook-loop friction during active gates and leaves pre-enforcement cycles stranded under enforcement mode. Cycle 015 demonstrated the friction live: the Stop hook cascaded blocks during an actively-in-progress gate conversation because the schema had no representation of the in-progress-gate state.

ADR-072 (Cycle Shape Declaration) addressed two of the symptoms — skipped phases and paused cycles — by adding two header fields. The user's framing at the Cycle 015 BUILD gate identified the larger pattern: `cycle-status.md` should represent **a stack of cycles at different states**, with deliberate mini-cycles auto-pausing the outer cycle and pushing onto the stack. The Stop hook would read the active entry (top of stack) rather than a single `**Phase:**` field. ADR-072's two-field design becomes a specialization of this richer schema.

Essay 015 §5 surveys three paradigms: durable workflow engines (Temporal's parent-child model with isolated Event Histories and the tripartite Parent Close Policy — TERMINATE / REQUEST_CANCEL / ABANDON); hierarchical state machines (Harel 1987, SCXML, XState — providing hierarchy, orthogonal regions, and the **history pseudostate** as the formal model for "resume where paused"); and schema evolution (Protobuf, Flyway/Liquibase, Temporal's `patched()`/`getVersion`). Each provides a partial answer; none directly maps to RDD's situation, where cycles are human-paced epistemic units rather than machine-executed workflows.

The Airflow SubDagOperator failure is the cautionary precedent: pause state did not propagate from parent to sub-DAGs because they ran via a BackfillJob that ignored the `is_paused` field (Airflow PR #5283), and Airflow eventually deprecated nesting in favor of flat TaskGroup. The lesson: coupling semantics that are not designed in produce inconsistent state between layers, and "we can add it later" rarely recovers.

The domain-model concept **Multi-Cycle Schema** is implicit in ADR-072 but not yet formalized as a structure. This ADR specifies the structure.

## Decision

`docs/cycle-status.md` adopts a **stack-based multi-cycle schema** in which the file represents a stack of cycle entries. The top of the stack is the active entry; entries beneath are paused outer cycles. ADR-072's `**Skipped phases:**` and `**Paused:**` header fields fold in as per-entry fields.

**File structure.**

```markdown
# RDD Cycle Status

## Cycle Stack

[Active and paused cycle entries, in stack order — top = active.]

### Active: [Cycle title]
**Cycle number:** NNN
**Started:** YYYY-MM-DD
**Current phase:** [phase] (next)
**Cycle type:** [standard | mini-cycle | batch]
**Parent cycle:** [cycle number, if nested; absent otherwise]
**Skipped phases:** [comma-separated phase names, if any]
**Pause-on-spawn policy:** [pause-parent | continue-parent — defaults to pause-parent]

[Phase Status, Feed-Forward Signals, etc. — same as today]

### Paused: [Outer cycle title]
**Cycle number:** NNN
**Paused:** YYYY-MM-DD — [reason]
**Phase at pause:** [phase that was active when paused]
**Spawned by:** [if paused because a nested cycle started, names the inner cycle]

[Phase Status, etc.]
```

The `## Cycle Stack` section is the new top-level structural element. Entries are separated by `### [Active|Paused]: <title>` headers. The order is stack order: active entry first, then most-recently-paused, then deeper paused entries.

**Per-entry fields.**

| Field | Required | Meaning |
|-------|----------|---------|
| `**Cycle number:**` | yes | Numeric identifier (e.g., `016`); allows hooks and audits to address cycles by stable name |
| `**Started:**` | yes | ISO date the cycle began |
| `**Current phase:**` | active only | Phase the cycle is at; `(next)` indicates the next phase to enter |
| `**Cycle type:**` | yes | `standard` (full pipeline), `mini-cycle` (scoped Mode D), `batch` (multi-issue, like Cycle 016). Describes content character. The structural relationship to other cycles is captured by `**Parent cycle:**` (presence indicates a nested cycle of any content character — e.g., a nested mini-cycle records `**Cycle type:** mini-cycle` plus `**Parent cycle:** 016`). |
| `**Parent cycle:**` | nested only | Cycle number of the outer cycle |
| `**Skipped phases:**` | optional | ADR-072 field, applied per entry |
| `**Paused:**` | paused entries only | ADR-072 field; date and reason |
| `**Phase at pause:**` | paused entries only | Phase the cycle was at when paused — used by the history-pseudostate logic on resume |
| `**Spawned by:**` | optional | Names the inner cycle that caused this entry to be paused, if applicable |
| `**Pause-on-spawn policy:**` | optional, active only | `pause-parent` (default — spawning a nested cycle pauses the outer) or `continue-parent` (rare; explicit decision that outer continues independently) |
| `**Continue-parent rationale:**` | required when `**Pause-on-spawn policy:** continue-parent` is set on a nested entry | One-line justification for why the outer cycle's enforcement should not apply during the inner cycle. Required by the procedural mitigation specified in the coupling-semantics section; the field's absence on a `continue-parent` entry is itself a signal the choice was not deliberated. |

**Coupling semantics — borrowed from Temporal's Parent Close Policy.**

When a nested cycle is spawned, the outer cycle's coupling to it is declared explicitly:

- **`pause-parent` (default).** The outer cycle pauses on spawn; the inner cycle becomes the active entry. When the inner cycle completes (or is itself paused), the outer cycle's entry's `**Paused:**` field is removed and it becomes active again at the phase it was at (history-pseudostate behavior — the cycle resumes where it paused, including any in-progress gate state recorded at pause time).
- **`continue-parent` (explicit).** The outer cycle continues; the inner cycle runs concurrently. Both entries are "active" in the sense of unpaused, but only one is `top of stack` — the most recently spawned. The Stop hook reads the top entry. This case is rare and intentional; the methodology's expectation is that practitioners sequence cycles rather than running them concurrently, and the `continue-parent` mode exists for cases where a brief side-cycle (e.g., `/rdd-conform` audit during an active build) genuinely should not pause the outer. **Acknowledged consequence:** while a `continue-parent` inner cycle is active, the outer cycle's manifest checks are not enforced — the Stop hook reads only the top entry. This is structurally similar to the Airflow SubDagOperator failure mode (state not propagated between layers), repurposed as a deliberate scope-of-enforcement choice rather than an unintended side effect. The methodology's mitigation is procedural: `continue-parent` requires a one-line `**Continue-parent rationale:**` field on the inner entry naming why the outer's enforcement should not apply during the inner. The rationale is reviewable in the cycle-status record. When the inner cycle completes (or is paused), the outer entry returns to top of stack and its enforcement resumes immediately.

**Hook behavior — what the Stop hook reads.**

The Stop hook reads the **top entry** of the cycle stack — the first `### Active: ...` or `### Paused: ...` header in the file. It does not read deeper entries; those are deliberately invisible to per-Stop checks because they represent paused work the methodology should not enforce against.

When the top entry is `Paused`, the existing ADR-072 short-circuit applies: all per-phase manifest checks return allow, and a one-time advisory notice fires per session. When the top entry is `Active`, the existing per-phase manifest check runs against the entry's `**Current phase:**` field, honoring `**Skipped phases:**` if present.

**Migration from single-cycle format.**

Pre-ADR-078 cycle-status.md files (single-entry, no `## Cycle Stack` header) are recognized by the hook as legacy single-entry format. The hook treats them as a single-entry stack: the entire file body is the one entry. This means existing cycle-status.md files continue to work without rewrite. ADR-081 specifies the migration path for cycles that need to be brought under the new schema.

**What this ADR does not change.**

- ADR-072's two header fields keep their semantics; they now appear per entry rather than once per file.
- The compound check (ADR-064) and revision-aware re-audit reminder continue to fire for the top entry's non-skipped, non-paused phases.
- The Pause Log convention from ADR-072 is retained and applies per entry — each cycle entry tracks its own pause/resume audit trail.
- Single-cycle cycle-status.md files (the format every cycle to date has used) remain valid; the schema is additive.

## Rejected alternatives

**One file per cycle (cycle-NNN-status.md), no stack.** Rejected. The file-per-cycle approach assumes **cycle-locality of artifacts** — that each cycle's state and artifacts naturally cluster together. RDD's pattern is the opposite: a **shared, durable artifact corpus** (essays, ADRs, domain-model, system-design, scenarios, interaction-specs) that cycles contribute to and read from. Cycle 016 reads Cycle 015's ADRs; ADR-078 cites ADR-072. The artifacts persist across cycles; cycles are bounded events against the corpus. The directory schema models the cycle-locality assumption that does not hold for RDD's actual pattern. Beyond this primary reason: file-per-cycle also loses the relationship between cycles — which is paused, which spawned which, which is at the top of the stack — and the hook would need to scan a directory and reconstruct the stack, recreating in scan logic what the stack file makes explicit. Single-file-with-stack is also more readable for the practitioner who returns after a pause and asks "what was I doing?"

**Drop `**Current phase:**` from per-entry; track phase via the existing Phase Status table.** Rejected. The Phase Status table is the per-cycle record of which phases are complete; the `**Current phase:**` field is the hook's address for the active phase. Conflating them forces the hook to parse table rows to find an unchecked phase, which is fragile to table format changes. The duplication is intentional: the field is the hook's target; the table is the practitioner's record.

**Inherit Temporal's full Parent Close Policy (TERMINATE / REQUEST_CANCEL / ABANDON).** Rejected. RDD cycles are not terminated by parent-cycle completion — they are paused (waiting for human resumption) or completed (human declares done) or graduated (formally folded into native docs per ADR-025). The Temporal taxonomy maps to machine-managed workflow termination, not to human-paced epistemic units. The `pause-parent` / `continue-parent` two-mode split captures the coupling semantics RDD actually needs.

**Make all cycles concurrent by default; require explicit pause.** Rejected. The default expectation is sequenced epistemic work: when the practitioner spawns a mini-cycle, they are diverting attention to it, and the outer cycle should reflect that. `pause-parent` as default matches the actual cognitive structure; `continue-parent` is the explicit decision when the side-cycle is genuinely lightweight.

**Use SCXML's full statechart formalism (orthogonal regions, deep history, internal/external transitions).** Rejected. RDD does not need a state-machine formalism with parallel regions. The single-stack-with-pause-and-resume covers the observed patterns (mini-cycles, paused outer cycles, batch cycles, the cycle-015 in-progress-gate friction) without the cognitive overhead of statechart semantics.

**Defer the multi-cycle schema and address only the in-progress gate case.** Rejected. ADR-079 separately addresses the in-progress-gate case; the broader schema is needed for nested and concurrent cases that ADR-079 alone does not cover. Bundling the in-progress-gate fix with the broader schema would conflate two distinct decisions; separating them allows each to be evaluated on its own merits.

## Consequences

**Positive:**

- Closes the multi-cycle gap: the methodology can now represent cycles at different states with explicit coupling semantics.
- Adopts the history-pseudostate pattern from statecharts (Harel 1987) and the Parent Close Policy pattern from Temporal — two proven precedents from the workflow/state-machine literatures.
- Backward-compatible: existing single-cycle `cycle-status.md` files continue to work without rewrite; the schema is additive.
- ADR-072's two fields fold in as per-entry fields; no semantic change to existing behavior.
- The Airflow SubDagOperator failure mode (pause state did not propagate from parent to sub-DAGs) is structurally prevented because the stack file is the single source of truth — the active entry's pause state cannot diverge from a separate "is_paused" field that the hook ignores.
- The `pause-parent` default aligns with the observed cognitive pattern: spawning a mini-cycle diverts attention to it.
- Composes with ADR-079 (non-interrupting Stop predicate) and ADR-080 (scope-adaptive enforcement) to cover the full Issue #14 scope.

**Negative:**

- The `cycle-status.md` file becomes more complex. Mitigated by the file structure being declarative markdown that a practitioner can read top-down: top entry = current work; entries below = paused work.
- The stack convention is novel within RDD; practitioners need to understand that "stack" means stack of cycles, not stack frames. Mitigated by the file's section headers (`## Cycle Stack`, `### Active`, `### Paused`) being self-explanatory.
- `**Pause-on-spawn policy:**` is a per-entry field that practitioners may set incorrectly (e.g., `continue-parent` when `pause-parent` is the right call). Mitigated by `pause-parent` being the default and the `continue-parent` choice being explicit.
- Hook implementation must change to parse the stack header structure; the regex that previously matched a single `**Phase:**` field needs to find the top `### Active:` entry first. Implementation effort is bounded but non-trivial.
- The `**Spawned by:**` and `**Phase at pause:**` fields require the spawning cycle (or the pausing event) to write them. If the practitioner pauses without setting these, the resume becomes ambiguous. Mitigated by the practitioner being the source of truth for cycle state — the methodology cannot prevent ambiguous practitioner inputs but can make the expected fields visible in the schema.

**Neutral:**

- Standard single-cycle workflows (Modes A-C in the orchestrator) need no additional fields; the entry's `**Cycle type:**` is `standard` and the stack has one entry.
- Existing cycle-status.md files in archived corpora are unchanged.
- The Pause Log convention from ADR-072 remains per entry.

## Provenance check

The core framing — `cycle-status.md` as a stack of cycle entries with the active entry at the top — derives from the user's framing at the Cycle 015 BUILD gate ("cycle-status.md should represent a stack of cycles at different states, with deliberate mini-cycles auto-pausing outer cycles and pushing onto the stack"), as recorded in Issue #14 §"Framing." Driver-derived from user.

The three-paradigm survey (durable workflow engines, hierarchical state machines, schema evolution) and the specific borrowings (Temporal's Parent Close Policy, Harel's history pseudostate, Airflow SubDagOperator as cautionary precedent) are essay-grounded (essay 015 §5).

The two-mode coupling policy (`pause-parent` default, `continue-parent` explicit) is drafting-time synthesis composed against Temporal's Parent Close Policy — RDD's cycles are human-paced epistemic units, so the Temporal taxonomy does not transfer directly. The reduction from three modes to two reflects RDD's actual coupling needs.

The per-entry field schema is drafting-time synthesis derived from ADR-072's two fields plus the new fields needed for stack semantics (cycle number, type, parent, phase-at-pause, spawned-by, pause-on-spawn-policy). Each field is justified by a specific use case in the hook behavior or in resume semantics.

The "top entry only" hook-read rule is drafting-time synthesis grounded in the principle that paused cycles should be invisible to per-Stop checks (otherwise the Airflow failure recurs). The single-cycle backward compatibility (legacy file = single-entry stack) is drafting-time synthesis intended to avoid forced rewrites of existing corpora.
