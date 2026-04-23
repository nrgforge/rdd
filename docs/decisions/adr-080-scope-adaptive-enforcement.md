# ADR-080: Scope-Adaptive Enforcement via Precondition Composition

**Status:** Proposed

## Context

Issue #14's question 4 names the gap: pre-hook cycles (started before v0.7.0) lack ADR-072's cycle-shape fields and cannot be resumed cleanly under enforcement mode. More broadly: smaller-scoped cycles need enforcement that gracefully recognizes its own inapplicability without losing the structural guarantees enforcement provides for full-pipeline cycles.

Essay 015 §5 surveys the precedents. **"Scope-adaptive enforcement" is not a named design pattern.** The patterns exist as compositions of general tools:

- **Liquibase preconditions with `onFail: CONTINUE`** — a migration step checks its own applicability and silently skips if not met. The migration framework continues; the step records that it was skipped.
- **Feature flag hierarchy** — a parent flag disables all dependent flags. Disabling at a higher level cascades; the dependent flags need no awareness of the parent.
- **OPA/Rego (Open Policy Agent)** — policy-as-code with full access to context, allowing fine-grained applicability decisions per check.

Based on these precedents, essay 015 §5 makes a design judgment: smaller-scoped cycles likely need enforcement that gracefully recognizes its own inapplicability, **composed from existing primitives**, rather than a fundamentally different enforcement architecture. ADR-072's `**Skipped phases:**` field is already an instance of this pattern: a precondition (this phase is not in the cycle) silently skips the check.

The decision posed by Issue #14 is whether to:

(a) Compose precondition-style applicability checks into the existing hook architecture, or
(b) Introduce a separate "lighter" enforcement tier for mini-cycles and scoped work.

The literature does not resolve which is architecturally correct. Essay 015 §5 explicitly notes: "the literature does not resolve whether this compositional approach is architecturally equivalent to a dedicated enforcement tier; this is a design judgment, not a finding."

The domain-model concept **Scope-Adaptive Enforcement** was added in Amendment 19. This ADR specifies the pattern.

## Decision

RDD adopts **precondition composition** as the scope-adaptive enforcement pattern. Manifest checks gain optional **applicability preconditions** that the hook evaluates before running the check. When a precondition is unmet, the check is skipped with `onFail: CONTINUE` semantics — the hook records the skip in the dispatch log and proceeds.

**Manifest format extension** — `tier1-phase-manifest.yaml` per-phase entries gain an optional `applicable_when` block:

```yaml
research:
  - artifact: docs/essays/<NNN>-<descriptive-name>.md
    description: Research essay (citation-audited, argument-audited, framing-audited)
  - artifact: docs/housekeeping/audits/argument-audit-research-<NNN>.md
    description: Argument and framing audit report
    applicable_when:
      - cycle_type_in: [standard, batch]
      - phase_not_skipped: research
```

The `applicable_when` block lists conditions; all conditions must hold for the check to run. When any condition is unmet, the hook records `skipped: applicable_when condition <X> not met` in the dispatch log and proceeds to the next check.

**Supported precondition primitives** (initial set; extensible):

| Primitive | Meaning |
|-----------|---------|
| `cycle_type_in: [list]` | Active cycle entry's `**Cycle type:**` is one of the listed values |
| `cycle_type_not_in: [list]` | Active cycle entry's `**Cycle type:**` is none of the listed values |
| `phase_not_skipped: <phase>` | The named phase is not in the active entry's `**Skipped phases:**` field |
| `parent_cycle_present` | The active entry has a `**Parent cycle:**` field (i.e., is nested) |
| `parent_cycle_absent` | The active entry has no `**Parent cycle:**` field |

The primitives compose from the multi-cycle schema (ADR-078) — they read the same fields the schema declares. New primitives are added only when an actual enforcement need arises, not speculatively.

**Default behavior preserved** — the existing manifest entries do not specify `applicable_when` and continue to fire unconditionally for the active cycle's current phase. The extension is additive; nothing changes for full-pipeline standard cycles.

**Mini-cycle / batch-cycle implications.**

A mini-cycle (e.g., the Cycle 015 DECIDE+BUILD scoped cycle) declares `**Cycle type:** mini-cycle` in its cycle-status entry. Existing manifest entries that depend on artifacts from skipped phases — for example, the research-essay citation-audit entry (`docs/housekeeping/audits/citation-audit-research-<NNN>.md`) — gain `applicable_when: [cycle_type_in: [standard, batch]]` so they no longer fire for mini-cycles that legitimately omit RESEARCH. The same manifest works for both cycle types; the precondition gates which checks fire.

A batch cycle (Cycle 016) declares `**Cycle type:** batch`. Most full-pipeline checks apply unchanged. The precondition framework provides the affordance for any future batch-specific manifest entries to gate themselves with `applicable_when: [cycle_type_in: [batch]]` — no concrete batch-specific entries exist in today's manifest, but the affordance is in place when one is needed.

**Migration / pre-ADR-072 cycles.**

Pre-ADR-072 cycles cannot declare `**Cycle type:**` because the schema did not exist when they were written. ADR-081 specifies the migration path; this ADR provides the enforcement primitive (`cycle_age_days_at_least` or, more directly, the legacy single-cycle format detection) that lets the hook treat legacy cycles permissively until they are migrated.

**What this ADR does not do.**

- It does not introduce a separate enforcement tier (rejected alternative below).
- It does not weaken enforcement for full-pipeline cycles. Standard cycles continue to be subject to the unconditional manifest checks that were established in prior ADRs.
- It does not allow preconditions to skip the compound check (ADR-064) for dispatches that did fire — the compound check remains unconditional for any dispatch that produced a dispatch-log entry.

## Rejected alternatives

**Separate enforcement tier for mini-cycles** — a "mini-manifest" or "lite-manifest" applied to small-scope work. Rejected. Two manifests double the maintenance surface and introduce a classification question for every new cycle type ("which manifest applies?"). The precondition approach keeps a single manifest and lets per-check applicability adapt — which is what `**Skipped phases:**` (ADR-072) already demonstrates works.

**Hardcode cycle-type exceptions in hook logic.** Rejected. Hook code that knows "if cycle_type == 'mini-cycle', skip these checks" embeds methodology decisions in code, where they are invisible to manifest readers and require code changes to update. The manifest is the readable, auditable source of truth; preconditions belong there.

**OPA/Rego with full policy-as-code.** Rejected as overhead-disproportionate. RDD does not need policy expressions arbitrary enough to warrant a policy engine; the precondition primitives above cover the observed needs. If complexity exceeds the primitives in future, OPA remains an option — the precondition format is a forward-compatible subset of policy-as-code.

**Make every check conditional by default.** Rejected. Defaulting to "conditional unless declared unconditional" inverts the safety guarantee — checks that should fire might not, and the methodology has no way to detect the omission. Defaulting to "unconditional unless declared conditional" preserves Invariant 8's structural guarantee for the cases that need it; preconditions are added only where the gating need is established.

**Compose preconditions in skill text** (e.g., "DECIDE skipped phases get no manifest enforcement" written into the orchestrator). Rejected. The hook's behavior must be readable from the manifest, not from the skill text the hook does not parse. Preconditions colocated with the manifest entries are visible to anyone reading the manifest; preconditions in skill text are invisible to the enforcement layer.

## Consequences

**Positive:**

- Closes the scope-adaptive enforcement gap: mini-cycles, batch cycles, and (with ADR-081) legacy cycles each get appropriate enforcement without forking the manifest.
- Composes with ADR-072 (`**Skipped phases:**` is the prototype precondition), ADR-078 (multi-cycle schema fields are the precondition substrate), and ADR-079 (in-progress-gate predicate is a relaxation that could later be expressed as a precondition).
- The `applicable_when` block is declarative and human-readable; the methodology's enforcement decisions are visible to anyone reading the manifest.
- The `onFail: CONTINUE` semantics borrowed from Liquibase are well-precedented and avoid the all-or-nothing failure mode.
- Forward-compatible: new precondition primitives can be added when enforcement needs surface, without changing existing entries.
- Skipped checks are recorded in the dispatch log — the methodology's compliance with Invariant 8 (mechanism execution must be observable) extends to the act of skipping.

**Negative:**

- Adds expressivity to the manifest format that practitioners must understand. Mitigated by the primitives being a small set of named conditions, not arbitrary expressions; the format is documented adjacent to the manifest.
- Misuse risk — a user could add `applicable_when: [cycle_type_in: [standard]]` to a check that should fire for all cycles, effectively disabling it for batch and mini-cycle work. Mitigated by manifest changes being version-controlled and reviewable; the misuse is observable.
- The hook implementation must evaluate preconditions before each check, adding a small per-check evaluation cost. Negligible at the methodology's manifest scale (tens of checks).
- The precondition primitives are an extension surface that may grow. The methodology's position is to add primitives only when concrete enforcement needs arise, preventing speculative complexity.

**Neutral:**

- Existing manifest entries with no `applicable_when` block behave identically to today — checks fire unconditionally for the active cycle's current phase.
- Standard full-pipeline cycles experience no behavior change.
- The manifest's YAML structure is unchanged (the new block is an optional per-entry field).

## Provenance check

The core framing — precondition composition rather than a separate enforcement tier — derives from essay 015 §5 ("smaller-scoped cycles likely need enforcement that gracefully recognizes its own inapplicability — composing existing primitives — rather than a fundamentally different enforcement architecture"). The Liquibase / feature flag / OPA precedents are essay-grounded. The Scope-Adaptive Enforcement concept is in the domain model from Amendment 19. Driver-derived.

The `applicable_when` block format is drafting-time synthesis composed against the existing YAML manifest format. The primitive names (`cycle_type_in`, `phase_not_skipped`, etc.) are drafting-time synthesis composed against the multi-cycle schema fields ADR-078 declares. The five initial primitives are drafting-time synthesis selected to cover the observed enforcement needs (mini-cycles, batch cycles, nested cycles); the methodology's position of adding primitives only when concrete needs arise is intentional restraint against speculative complexity. An earlier draft included a `cycle_age_days_at_least` primitive; it was removed because no concrete use case for time-based enforcement was named, and including it would have invited speculative interpretation by future manifest authors.

The "preconditions cannot skip the compound check for dispatches that fired" rule is drafting-time synthesis grounded in ADR-064's compound-check scope — the compound check verifies fabrication on dispatches that produced log entries; preconditions affect whether the dispatch fires in the first place, which is upstream of the compound check.

The "default behavior preserved" guarantee (existing manifest entries unchanged) is drafting-time synthesis intended to make the change additive and risk-bounded.
