# ADR-076: Fitness Criteria Decomposition in ARCHITECT

**Status:** Proposed

## Context

Issue #13's failure chain identifies the ARCHITECT-phase share: a system design assigned a qualitative goal ("transparent," "seamless," "backward-compatible") to a module without decomposing it into testable properties. The module received an aspiration without a verification criterion. When BUILD reused a working pattern that violated the qualitative claim, no fitness check fired — there was nothing concrete enough to fail against.

The general principle the ADR rests on is straightforward: a qualitative claim is a *direction*, not a *constraint*; only its decomposition into observable properties makes it enforceable. Issue #13's body characterizes this as a methodology gap (the failure mode is "well-known in the architecture-quality literature"), but the essay does not cite specific architecture-fitness sources, and this ADR does not introduce any. The decomposition requirement is grounded in Issue #13's failure chain and essay 015 §4 §10, not in a citation chain to architecture-fitness literature.

RDD's ARCHITECT phase produces system-design.md with a responsibility matrix and provenance chains. It does not currently require qualitative claims to be decomposed before the gate passes. Essay 015 §4 §10 names this as a contributing factor in the Issue #13 failure: the qualitative claim was made; the decomposition was not. The cognitive layer addressed by ADR-077 (BUILD applicability check) catches the pattern-reuse moment, but a fitness criterion that exists at decomposition time would have caught the same failure earlier in the workflow.

This ADR makes the decomposition a structural ARCHITECT-phase requirement, gated at the system-design completion step.

## Decision

When ARCHITECT assigns a **qualitative claim** to a module's responsibility — language like "transparent," "seamless," "backward-compatible," "performant," "lossless," "isolated," "unified," or any other adjective specifying a quality without a measurable target — the system-design step requires the claim to be decomposed into one or more **testable fitness properties** before the gate may pass.

A testable fitness property is an observable, verifiable statement of the form:

```markdown
**Fitness:** <observable property> — <how observed/measured>
```

Examples:

- *Qualitative claim:* "The X module is transparent to existing consumers."
  *Testable fitness property:* "When X is enabled, the Y consumer's request-response payload, status codes, and error messages are byte-identical to the X-disabled baseline. Verified by recorded fixture comparison in the X integration test suite."

- *Qualitative claim:* "The Z subsystem is backward-compatible."
  *Testable fitness properties:* "(a) All scenarios from version N-1 in `scenarios.md` continue to pass. (b) The version-N protocol accepts every payload shape the version-(N-1) protocol accepted, verified by the protocol-compatibility test fixture set."

The fitness properties are recorded in `system-design.md` adjacent to the qualitative claim — either inline within the responsibility matrix entry, or in a per-module **Fitness** subsection if multiple properties are required. Each fitness property must be **specific enough that a test can be written from it without ambiguity** — the same standard scenarios in `scenarios.md` already meet.

The ARCHITECT skill's system-design step is updated to require:

1. **Identification of qualitative claims** in the responsibility matrix and module descriptions.
2. **Decomposition of each qualitative claim** into one or more testable fitness properties.
3. **Refusal to advance the ARCHITECT gate** when a qualitative claim remains undecomposed. The skill's gate check explicitly asks: *"Are any module responsibilities phrased as qualitative claims (transparent, backward-compatible, etc.) without decomposed fitness properties? If yes, the gate does not pass."*

Fitness properties carry forward into BUILD as additional acceptance signals. They compose with the Cycle Acceptance Criteria Table (ADR-073) — fitness properties that specify a layer become entries in the table; properties that are scenario-decomposable become preservation or behavior scenarios in `scenarios.md` (ADR-075).

The decomposition does not require the qualitative claim itself to be removed from system-design.md. The claim is the human-readable summary; the fitness properties are the verification anchors. Both have value: the claim communicates intent, the properties enable verification.

## Rejected alternatives

**Treat fitness criteria decomposition as a BUILD responsibility.** Rejected. By BUILD time the implementation pattern is selected and the qualitative claim is more likely to be read as descriptive ("we built a transparent X") than as a constraint. The decomposition serves the constraint function only when it is established before implementation; ARCHITECT-time placement preserves the constraint-not-description framing.

**Embed fitness criteria in `scenarios.md` rather than `system-design.md`.** Rejected. The qualitative claim lives at the architectural layer (responsibilities, module boundaries) where the scope of the claim is established. Decomposing the claim in `scenarios.md` (where individual scenarios live) loses the connection between the architectural intent and the verification — and creates ambiguity about which module owns each fitness property. The decomposition belongs adjacent to the claim it decomposes; the resulting scenarios may be reflected in `scenarios.md`, but the source of truth is the system design.

**Allow qualitative claims to stand without decomposition when the claim is "obviously testable."** Rejected. The Issue #13 failure case is exactly this — the "transparent" claim was assumed obviously testable; nobody wrote down what specifically would be tested; the test was never written. The exception swallows the rule. The methodology's position: if the claim is genuinely obvious, writing it down is cheap; if it is not obvious, the cost of decomposition is the cost of catching the gap.

**Generate fitness properties via an LLM dispatch (specialist subagent) rather than as a phase-skill requirement.** Rejected. The decomposition is design work — the user must understand which properties are load-bearing and which are derived. Delegating to a subagent recreates the architectural-decisions-by-AI failure mode (Invariant 0). The skill prompts the user to perform the decomposition; the agent assists with framing.

**Defer the gate check to a separate `/rdd-conform` audit.** Rejected for the same reason as ADR-074's Step 3: the conformance audit is a periodic sweep, not a forcing function at the moment of decision. Decomposing fitness criteria after BUILD has already implemented against an undecomposed claim recreates the gap.

## Consequences

**Positive:**

- Closes the ARCHITECT-phase share of the Issue #13 failure when fitness properties are consulted at the BUILD reuse moment. Decomposition alone is necessary but not sufficient; the integration is supplied by ADR-077 prompt 4 ("Which fitness properties does `system-design.md` declare for the affected module(s)?"), which makes the decomposed properties load-bearing during pattern reuse rather than passive entries in `system-design.md`.
- Composes with ADR-073 (acceptance criteria table — fitness properties may become entries) and ADR-075 (preservation scenarios — fitness properties may become preservation scenarios). The three ADRs form an integrated structural defense via ADR-077's prompt 4 consumption of fitness properties; the integration is specified in ADR-077, not merely implied.
- Operationalizes Invariant 8 at a new site: the gate check is a concrete, mechanically observable workflow step (skill text refuses to advance unless decomposition is recorded).
- Fitness properties become persistent verification anchors that survive across ADR supersession — the property's wording is testable, the underlying claim's phrasing may evolve.

**Negative:**

- ARCHITECT-time work increases for system designs with many qualitative claims. Mitigated by the requirement being per-claim, not per-module — modules whose responsibilities are stated in concrete terms carry no overhead.
- Risk of fitness properties being written formulaically ("X is transparent — verified by being transparent") defeats the purpose. Mitigated by the same refutability standard scenarios already meet; the skill's gate check explicitly tests for refutability ("Could a test be written from this property without ambiguity?").
- Some genuinely qualitative properties (developer experience, learnability) resist decomposition into single-test properties. Acceptable: the methodology's position is that resisting decomposition is itself a signal — the property may be a *direction* the architecture is optimizing toward rather than a *constraint* the architecture must satisfy. Decomposition forces the distinction.
- Existing system-design.md content may contain undecomposed qualitative claims. Backfilling is out of scope for this ADR; `/rdd-conform` may surface this as debt in a later pass.

**Neutral:**

- Module responsibilities stated in concrete terms (e.g., "exposes the ExtractFile RPC accepting a Path and returning a TokenStream") need no decomposition — they are already testable.
- The ARCHITECT skill's existing responsibility matrix structure is unchanged; the fitness column or subsection is additive.

## Provenance check

The core framing — qualitative claims must be decomposed into testable fitness properties before the ARCHITECT gate passes — derives from Issue #13 (user-authored) §"Possible process improvements" item 2 and essay 015 §4 ("ARCHITECT phase should decompose qualitative fitness claims into testable properties") and §10. Driver-derived from issue and essay.

This ADR does not invoke architecture-fitness-function literature (Lewis & Fowler, ATAM, Bass-Clements-Kazman) as supporting evidence. An earlier draft did; the citations were removed because the essay does not cite them and they were not citation-audited within this cycle. Future ADRs may re-introduce these references after citation audit; this ADR's decision rests on Issue #13's failure chain and essay 015's analysis alone.

The example decompositions ("transparent → byte-identical payloads," "backward-compatible → version-N accepts every version-(N-1) payload") are drafting-time synthesis intended as illustrative — concrete enough to make the standard recognizable, abstract enough to translate across domains.

The integration with ADR-073 (acceptance criteria table) and ADR-075 (preservation scenarios) is drafting-time synthesis grounded in the structural-defense framing from essay 015 §10 (first-line structural / second-line cognitive).

The "qualitative claim is the human-readable summary; fitness properties are the verification anchors" framing — preserving both rather than replacing the claim — is drafting-time synthesis grounded in the practitioner observation that qualitative claims serve a communication function the testable properties do not.
