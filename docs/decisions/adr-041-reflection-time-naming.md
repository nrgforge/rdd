# ADR-041: Rename User-Facing Gate Language to "Reflection Time"

**Status:** Proposed

## Context

"Epistemic gate" is precise terminology that names the concept exactly: a gate requiring an epistemic act. But it is academic language that creates distance between the user and the practice. The term signals assessment, formality, and judgment — connotations the adaptive gate redesign (ADR-040) works to displace.

Essay 009 evaluated alternatives against multiple research traditions. "Reflection time" aligns with Schon's reflection-on-action (1983), Rowe's wait-time research (1974), and standard professional practice terminology in nursing, teaching, and coaching. It carries connotations of pause-and-think rather than test-and-pass.

The product discovery value tension "terminology precision vs. accessibility" (partially addressed) motivated the search for user-facing language that preserves the concept while lowering the barrier.

## Decision

Adopt a dual-register naming convention:

- **Research/design vocabulary**: "epistemic gate" remains in the domain model, essays, ADRs, system design, and any artifact intended for methodology designers or researchers.
- **User-facing vocabulary**: "reflection time" is used in skill file text that the agent speaks to the user, README and manifesto, orientation document, and any context where the user encounters the term directly.

The agent introduces gates naturally: "Before moving on — reflection time." Followed by the adaptive prompt from the AID cycle (ADR-040).

The mapping is explicit and documented: Reflection Time IS the Epistemic Gate, renamed for the audience that experiences it.

One risk: "reflection time" may signal passivity — time to quietly think rather than time to produce something. Invariant 1 requires generation. The mitigation: the term names the pause; the adaptive prompt supplies the generative requirement. The term becomes misleading only if used without the accompanying prompt.

## Alternatives Considered

**"Checkpoint conversation"** — too mechanical, suggests passing/failing.

**"Check-in"** — too casual, does not signal the cognitive work involved.

**"Pause and reflect"** — verbose; "reflection time" is tighter.

**"Staying with it"** — Haraway-inflected but obscure to new users unfamiliar with the philosophical grounding.

**Keep "epistemic gate" everywhere** — rejected because the terminology barrier is a real adoption concern confirmed by the product discovery value tension. Precise terminology may self-select for committed users, but it should not exclude users who would benefit from the methodology.

## Consequences

**Positive:**
- Lowers the terminology barrier for new users
- Signals the right character: pause, think, reflect — not test, pass, proceed
- Establishes a pattern (precise internal term, accessible external term) applicable to other RDD terminology
- Professional framing: practitioners reflect; students take exams

**Negative:**
- Two registers create a maintenance burden — skill files must be consistent about which term to use where
- "Reflection time" may under-signal the generative requirement (Invariant 1). Constraint: skill file authors must pair every instance of "reflection time" with an immediate generative prompt. This pairing rule should be documented in the domain model's Reflection Time concept entry
- New users reading both research artifacts and user-facing text may be confused by the dual naming

**Neutral:**
- The domain model concept remains "Epistemic Gate" with "Reflection Time" as a documented alias
- No code changes required — this is a documentation and skill file terminology change
