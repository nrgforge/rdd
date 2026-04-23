# ADR-075: Preservation Scenarios in DECIDE

**Status:** Proposed

## Context

Issue #13 documents a three-process-point failure: a working code pattern was reused in a new context where a key assumption did not hold; scenario writing, fitness criteria, and code review all missed the mismatch despite the relevant information being in the artifact trail throughout the cycle. Essay 015 §4 names the cognitive mechanism as the **Einstellung effect** (Bilalic, McLeod & Gobet 2008): once a familiar pattern activates, it does not merely compete with alternatives — it actively inhibits attention to features that would reveal its inapplicability.

Behavior scenarios in DECIDE specify what the new feature *should* do. They do not specify what existing observable behavior the feature *should not change*. The negative-space coverage is structurally absent. The Inversion Principle (ADR-055, operationalized as belief-mapping) is the methodology's named tool for surfacing what the artifact does not address; its current procedural home is DISCOVER (assumption inversions). DECIDE has no procedural anchor for inverting at the scenario level — for asking "what should this feature *not* change?"

This ADR adds preservation scenarios as a structural complement to behavior scenarios, anchoring the negative-space question at a concrete DECIDE step. The cognitive mechanism (Einstellung) is addressed at BUILD by ADR-077 (Applicability Check); fitness-criteria decomposition is addressed at ARCHITECT by ADR-076. This ADR addresses the DECIDE-phase share of the failure: the absence of negative-space scenarios at the moment behavior scenarios are written.

## Decision

When DECIDE writes behavior scenarios for a feature, it also writes **preservation scenarios** for the same feature, in the same `scenarios.md` block. A preservation scenario asserts that an existing observable behavior, contract, or invariant remains unchanged when the feature is exercised:

```markdown
### Preservation: [Descriptive name — what is being preserved]
**Given** [precondition exercising the new feature alongside the existing behavior]
**When** [action invoking the new feature]
**Then** [the existing observable behavior X remains unchanged — stated refutably]
```

The skill instruction is to surface, for each new feature scenario block, at least one preservation scenario covering the contract or behavior most at risk of being silently changed. The selection is informed by:

- **Product-discovery assumption inversions** for the relevant area
- **Existing scenarios in `scenarios.md`** that the new feature touches
- **System-design provenance chains** from the affected modules (which ADRs/decisions established the existing behavior)

When the new feature genuinely cannot affect any existing behavior — a wholly isolated module or a brand-new entry point — the preservation block records that judgment as a one-line note ("No existing observable behavior is in the call path; preservation scenarios omitted") rather than fabricating a scenario. The note is itself the structural anchor: the question was asked.

The DECIDE skill's Step 4 (Behavior Scenarios) is updated to require preservation scenarios alongside behavior scenarios for any feature that touches existing modules. The skill text names the prompt explicitly: *"What should this feature not change? Write that as a refutable scenario."*

## Rejected alternatives

**Treat preservation as an implicit responsibility of behavior scenarios.** Rejected. This is the status quo Issue #13 documents as failing. The information needed was in the artifact trail throughout the cycle; the failure was that no specific moment in the workflow asked the question. Implicit coverage is exactly what Invariant 8 says will fail under task load.

**Add preservation scenarios at BUILD when the change is implemented.** Rejected. By BUILD time the implementation pattern is selected and the Einstellung effect is most active — the scenario writer is anchored on the new feature's success path. The DECIDE-phase placement asks the negative-space question before the implementation pattern frames what feels relevant. ADR-077 separately addresses the BUILD-time cognitive layer; preservation scenarios sit upstream as the structural anchor.

**Generate preservation scenarios via the Inversion Principle's existing belief-mapping form (ADR-055) without a dedicated scenario type.** Rejected. Belief-mapping is a *question form* used in conversation; preservation scenarios are *artifact entries* in `scenarios.md`. The ADR-055 form ("what would you need to believe for the alternative to be right?") is suited to challenging decisions; the preservation form is suited to specifying invariants. They serve different functions at different layers. Both can fire — belief-mapping during the DECIDE gate conversation, preservation scenarios as the persistent artifact.

**Make preservation scenarios optional.** Rejected for any feature touching existing modules. Optionality recreates the gap. The methodology's position: the question must be asked; the answer may be "no existing behavior in the call path," but the question is not skipped.

**Adopt a contract-test framing (Pact-style consumer-driven contracts) instead of preservation scenarios.** Considered. Under this framing, preservation scenarios would be expressed as contract assertions: existing scenarios in `scenarios.md` are "provider contracts," and the new feature's preservation scenario is a "consumer-contract-style" assertion against the new feature as the provider. The framing has tooling support (Pact, consumer-driven contract literature) and a developed failure-mode taxonomy. Rejected as the *primary* artifact form because preservation scenarios live in `scenarios.md` alongside behavior scenarios for readability and DECIDE-workflow contiguity; the contract-test framing would partition the artifact set across two files (or two formats within one file) without enabling capability the Given/When/Then form does not already enable. The contract-test framing remains available at BUILD time as an implementation choice — preservation scenarios may be implemented as contract tests where the project already uses contract testing tooling.

## Consequences

**Positive:**

- Closes the DECIDE-phase share of the Issue #13 failure: the negative-space question now has a concrete artifact anchor at the moment scenarios are written.
- Composes naturally with the Cycle Acceptance Criteria Table (ADR-073): preservation scenarios cover criterion-shaped invariants ("X remains unchanged when Y is enabled") at the scenario layer.
- Operationalizes Invariant 8 at a new site: the Inversion Principle gains a concrete dispatch point in DECIDE rather than relying on the orchestrator to remember to apply it.
- Compatible with Einstellung-mitigation literature (Gentner, Loewenstein & Thompson 2003 on schema comparison): preservation scenarios force structural attention to the existing-behavior side of the comparison before the new-behavior implementation pattern activates.
- The "no existing behavior in the call path" note is itself structurally informative — it records that the question was asked and the answer was negative, which is observable and reviewable.

**Negative:**

- Adds DECIDE-time work proportional to the number of feature blocks. Mitigated by the per-block requirement being one preservation scenario (or one judgment note), not exhaustive coverage.
- Risk of preservation scenarios being written formulaically ("the system continues to work" — non-refutable) defeats the purpose. Mitigated by the same refutability standard already required of behavior scenarios; scenarios.md's existing convention (each Then clause must be observable and verifiable) carries forward.
- The preservation scenarios themselves can become Einstellung-anchored: the writer's mental model of "what could change" is itself shaped by the new feature's framing. The Bilalic et al. (2008) characterization the ADR rests on — *"the first-activated framework captures attention before deliberate search can proceed"* — applies recursively to the act of writing the preservation scenarios. The same developer who is anchored on the new feature's success path while writing behavior scenarios is anchored on the same path while writing preservation scenarios, and may select preservation candidates that the new feature is *unlikely to violate* rather than the contracts it is *most at risk of violating*. Partial mitigations operate at two layers: (a) the prompt explicitly directs the writer to check existing scenarios, ADRs, and system-design provenance for the affected modules — sources outside the new feature's frame; (b) ADR-077's BUILD-time applicability check is the second-stage defense against authorship-time Einstellung — when the BUILD-moment fitness-property consultation (ADR-077 prompt 4) surfaces a property the preservation scenarios did not cover, the gap is caught at the application site even if the DECIDE-time selection missed it. The DECIDE-time structural anchor is the *recorded question* (preservation scenarios written), not Einstellung-freedom in their selection.

**Neutral:**

- Cycles whose work is wholly new code (no contact with existing modules) carry no per-feature preservation overhead beyond a one-line note.
- The artifact format (Given/When/Then) reuses the existing scenario structure; no new tooling or template work required.

## Provenance check

The core framing — preservation scenarios as the negative-space complement to behavior scenarios — derives from Issue #13 (user-authored) §"Possible process improvements" item 3 and essay 015 §4 §10 ("DECIDE: ... generate preservation scenarios alongside behavior scenarios"). The Einstellung mechanism (Bilalic et al. 2008) is essay-grounded; the Gentner et al. 2003 schema-comparison evidence is essay-grounded. Driver-derived.

The Given/When/Then format for preservation scenarios is reuse of the existing scenarios.md convention, not new synthesis. The "Preservation:" prefix is drafting-time synthesis composed against the existing "Scenario:" prefix to make the type visible in the artifact.

The "no existing behavior in the call path" judgment-note convention is drafting-time synthesis grounded in Invariant 8's principle that structural anchors must be observable — a recorded judgment is observable; a silent omission is not.

The list of three input sources (assumption inversions, existing scenarios, system-design provenance) is drafting-time synthesis derived from the existing artifact set DECIDE already reads.
