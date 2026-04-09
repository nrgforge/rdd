# ADR-066: User-Tooling Layer — Graduating Conversational Mechanisms to Artifact-Producing Form

**Status:** Proposed

## Context

Invariant 8 requires that any unconditional structural mechanism be anchored to one of three substrates: Skill-Structure Layer (ADR-065), Harness Layer (ADR-063/064), or User-Tooling Layer. The first two cover mechanisms with concrete workflow steps (step-anchorable) or tool-call events (hook-verifiable). The third covers what remains: **conversational mechanisms whose trigger is conversational and cannot be made structural through dispatch alone.** Essay 014 §7 names these as "mechanisms whose trigger cannot be made structural through dispatch alone — converting them into artifact-producing mechanisms is what makes them governable at all."

The three layers share a unified principle from Essay 014 §7: *anchor the mechanism to a concrete, mechanically-unavoidable step with observable output.* The technique differs — skill text edit, hook verification, or canonical-path artifact requirement — but the principle is invariant. The User-Tooling Layer turns conversational mechanisms into artifact-producing mechanisms by requiring them to produce files at canonical paths; the same manifest-and-assertion logic from ADR-063/064 then applies.

The mechanism that most needs this substrate is the **Attend-Interpret-Decide (AID) cycle at phase gates.** AID is specified in the orchestrator skill as a cross-phase ritual: read conversation history for engagement signals, form a hypothesis, select a pedagogical move, engage the user with a question from the Question Toolkit. Currently, AID produces only conversational output — the question is asked, the response is given, the orchestrator updates its internal state. Nothing is verifiable. If AID does not happen at a gate, the only signal is the absence of a question-response exchange in the conversation history, which can be lost to context compression or task-immersion pressure. This is precisely the judgment-anchored dispatch pattern Cycle 10's diagnostic flags.

**The reframe-derailed gate failure mode** (user-surfaced at MODEL pre-mortem 2026-04-08) adds a second concern. Even when AID fires and produces a gate-appropriate exchange, the gate can be *derailed* by a significant user reframe that the agent adopts at face value — leaving the conversation technically complete but the user's epistemic thread lost. A reframe-derailed gate passes surface checks while its epistemic substance is compromised. The manifest check alone cannot detect this: a reflection note with all required headers can still encode framings the user does not fully own. This limitation is load-bearing for any honest specification of the User-Tooling Layer.

**The engagement-degradation threat model** (user-surfaced at MODEL pre-mortem 2026-04-08, clarified at DECIDE gate 2026-04-08) frames why any defense is needed: user engagement can degrade from fatigue, long gaps between sessions, resumption after a break, or lax attention, and the degraded user can produce artifacts or reflections encoding framings incongruent with what the cycle has built up epistemically. The AID cycle's structural purpose is partly to resist this; the User-Tooling Layer's manifest check is one component of the compound defense against the threat (see §"Compound defense" below).

This ADR does three things: (1) adopts the User-Tooling Layer as an enforcement substrate per Invariant 8, (2) migrates the AID cycle at phase gates from purely conversational to artifact-producing, and (3) encodes the reframe-derailed gate limitation and the compound defense pattern honestly.

## Decision

### Principle: Graduate Conversational Mechanism

For conversational mechanisms that cannot be step-anchored (no concrete tool call to hook, no mechanically-unavoidable skill step to anchor to), the User-Tooling Layer provides an enforcement path: **require the mechanism to produce a verifiable artifact at a canonical path, then enforce artifact existence through the same manifest-and-assertion logic as ADR-063/064.** The artifact is the evidence the mechanism fired.

The domain model (Amendment #17) defines *Graduate Conversational Mechanism* as the action the skill maintainer performs: taking a conversational mechanism, identifying its natural artifact moment (phase boundary, commitment point, etc.), defining the canonical path and required content, and updating the relevant skill text to produce the artifact. This ADR is the first concrete instance.

**What the layer does:**
- Provides **structural floor enforcement**: did the mechanism fire at all? A missing artifact is evidence the mechanism did not run.
- Provides **partial shape evidence**: does the artifact have the required headers and fields? A stubbed or truncated artifact fails the structural assertions.

**What the layer does not do:**
- **Does not verify epistemic substance.** A well-formed reflection note with all required fields can still encode framings the user does not own. The User-Tooling Layer provides floor enforcement, not ceiling verification. The reframe-derailed gate limitation below names this explicitly.

### First migration: AID cycle gate reflection note

The AID cycle at phase boundaries graduates from purely conversational to artifact-producing. At each phase gate, the orchestrator must produce a **gate reflection note** at a canonical path before the phase can be declared complete.

**Canonical path:** `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md`

This is a new directory under the housekeeping pattern established in ADR-064. It is parallel to `docs/housekeeping/audits/` (the migration target for audit reports per ADR-070): both are infrastructure artifacts under the centered-vs-infrastructure framing — they underpin framework operation (gate reflection notes are consumed by the Stop hook's manifest check; audits are consumed by the orchestrator and surfaced to users by the agent), without being centered for direct user reading in normal workflow. Users can read either directly if they choose, but the methodology does not expect them to browse these files as part of cycle work.

**Required structure:**

```markdown
# Gate Reflection: {cycle-title} {phase-from} → {phase-to}

**Date:** 2026-04-08
**Phase boundary:** {phase-from} → {phase-to}
**Cycle:** {cycle-title}

## Belief-mapping question composed for this gate

<The specific question composed for this phase boundary, using the
phase-specific emphasis from the Question Toolkit (research: pre-mortem
+ open-question; discover: belief-mapping + commitment gating; model:
warrant elicitation; decide: rebuttal elicitation + belief-mapping on
rejected alternatives; build: commitment gating at stewardship).>

## User's response

<The user's actual response to the question, in full.>

## Pedagogical move selected

<The move from the Attend-Interpret-Decide catalog: Challenge, Probe,
Teach, Clarify, or Re-anchor. Name the move. Do not narrate the
interpretation that drove selection.>

## Commitment gating outputs

**Settled premises (the user is building on these going into {phase-to}):**
- ...

**Open questions (the user is holding these open going into {phase-to}):**
- ...

**Specific commitments carried forward to {phase-to}:**
- ...
```

**Captured vs. not captured:**
- **Captured (public):** the composed question, the user's response, the selected pedagogical move, the commitment gating outputs. These are evidence of gate activity.
- **Not captured:** the orchestrator's engagement interpretation. The interpretation drives move selection but is not narrated — not in conversation, not in file. Per Cycle 10's AID Interpret privacy principle, the user already knows how engaged they have been; narrating engagement back to them (in any form, including file form) is content-level sycophancy dressed as observation. The gate reflection note is private to the corpus and inspectable by the user, so including the interpretation would narrate engagement through the file channel. Excluding it honors the privacy principle across media.

The artifact respects AID privacy: a user reading the gate reflection note sees evidence of *what was asked, what they said, and what was carried forward* — not a characterization of their engagement quality.

**Manifest entry for ADR-063 format:**

```yaml
- mechanism: aid-cycle-gate-reflection
  path_template: docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md
  min_bytes: 800
  required_headers:
    - "# Gate Reflection:"
    - "## Belief-mapping question composed for this gate"
    - "## User's response"
    - "## Pedagogical move selected"
    - "## Commitment gating outputs"
  required_fields:
    - "**Phase boundary:**"
    - "**Settled premises"
    - "**Open questions"
    - "**Specific commitments"
```

The manifest supports this addition natively (ADR-063's format is per-mechanism extensible). The `{phase-from}` and `{phase-to}` tokens extend the existing `{cycle}` substitution pattern.

### Compound defense against engagement-degradation-induced framing incongruencies

The User-Tooling Layer's manifest check is one component of the **compound defense** against the engagement-degradation threat model surfaced at MODEL. The threat: user engagement degrades (fatigue, long gaps, resumption, lax attention) → the user produces artifacts or reflections encoding framings incongruent with what the cycle has epistemically built. The compound defense currently has three components covering non-overlapping failure modes at different points in the artifact lifecycle. The "compound defense" naming is deliberate — it is extensible. If a future mechanism is added to address a gap the current components do not cover, it joins the compound defense without the pattern needing to be renamed.

| Failure mode | Component | Mechanism type |
|---|---|---|
| Gate produced no substantive artifact / stubbed / missing required structure | **Manifest check** (User-Tooling Layer) | Post-artifact, structural floor |
| Well-formed artifact whose content encodes framings incongruent with the cycle's epistemic state | **Susceptibility snapshot** | Post-artifact, content ceiling |
| Unexamined assumptions or preference-accelerated commitments made in-conversation before the artifact is finalized | **Belief-mapping** | Pre-artifact, in-conversation |

**Coverage zones:**
- **Manifest check** catches the structural floor. A reflection note that is too short, missing headers, or missing required fields fails this check. Covers "user was so disengaged they wrote nothing substantive."
- **Susceptibility snapshot** catches the content ceiling. It evaluates conversation signals in isolated context at the same phase boundary, detecting framing-adoption patterns that would be encoded in the reflection note's content. Covers "user wrote a well-formed artifact but it encodes framings incongruent with the cycle's epistemic state."
- **Belief-mapping** catches the pre-artifact zone. It forces examination of alternatives in-conversation before the gate's artifact is finalized. Covers "user was about to commit to a framing without examining it."

Together the components form defense-in-depth at the phase boundary with non-overlapping coverage. None is sufficient alone; all three are currently needed to address the full threat. If future work identifies an additional failure mode not covered by the existing components, the compound defense absorbs the new component without restructuring.

### The reframe-derailed gate limitation

Even with the manifest check, a **reframe-derailed gate** can pass structural verification while encoding framings the user does not own. The failure mode: during the gate conversation, the agent adopts a significant user reframe at face value; the reflection note captures the exchange faithfully; all required structural elements are present; but the direction the note records is one the user has not fully worked through. The manifest check sees a well-formed artifact; the user sees a gate that technically completed. Neither sees that shared understanding was not preserved.

This limitation is load-bearing, not incidental. It is the specific case where the User-Tooling Layer's floor-enforcement cannot reach the ceiling. Three responses:

1. **Name the limitation in the ADR.** Done here. Future ADRs citing the User-Tooling Layer as the enforcement substrate for a conversational mechanism must acknowledge this limitation — it is inherited, not discretionary.
2. **Pair with the susceptibility snapshot.** The snapshot evaluates conversation signals (assertion density, solution-space narrowing, framing adoption without challenge) in isolated context at the same phase boundary. It can flag framing-adoption patterns the manifest check cannot. This pairing is part of the compound defense above.
3. **Leave epistemic substance to human judgment.** The manifest check enforces structural floor. The snapshot detects content-level drift. Neither can verify that the user fully owns what the artifact records — that remains a human judgment the methodology does not mechanize.

The limitation is a specific instance of the broader "competence without independent second-order critique" pattern that ADR-069 encodes as a named methodology scope-of-claim.

### Scope and boundaries

**In scope for this ADR:**
- Adopting the User-Tooling Layer as Invariant 8's third substrate
- Specifying the Graduate Conversational Mechanism action as an operational pattern
- Migrating the AID cycle gate reflection note as the first concrete instance
- Encoding the compound defense pattern with honest provenance
- Naming the reframe-derailed gate limitation as load-bearing

**Not in scope — explicit non-targets:**

- **Belief-mapping at mid-conversation user pushback.** This is not phase-bounded; there is no natural artifact moment. Essay 014 §7 line 184 names this as outside the User-Tooling Layer's reach. Under ADR-067's four-step decision procedure, this mechanism reaches **step 4** — no step-anchorable form (no concrete workflow step), no hook-verifiable event (not tool-call-bounded), no natural artifact moment (conversational, not phase-bounded). Per Invariant 8's anchoring requirement, mechanisms reaching step 4 **cannot be specified as unconditional**. Belief-mapping at pushback remains a **Tier 2 best-effort context-responsive mechanism** per ADR-058, with the honest acknowledgment that its execution depends on the orchestrator recognizing the pushback moment — exactly the judgment-anchored pattern Invariant 8 names as unreliable. Calling it a "Skill-Structure Layer concern" would be inconsistent with ADR-067's classification; the skill-text layer can instruct belief-mapping at pushback, but instruction without a concrete dispatch site does not satisfy the Skill-Structure Layer's step-anchoring requirement from ADR-065.
- **Assertion-aware observation at artifact-production moments.** ADR-062 specifies this as a Tier 2 mechanism with semantic detection the harness layer cannot reach. The User-Tooling Layer does not address it either because the observation is inline in the conversation and has no natural artifact moment distinct from the artifact it observes. Out of scope.
- **AID cycle during standalone skill invocation.** When a phase skill is invoked standalone (not via the orchestrator), the skill itself runs AID per ADR-002. The same gate reflection note requirement applies; the Stop hook's manifest check does not distinguish orchestrator vs. standalone invocation. This is consistent behavior, not special-casing.

## Consequences

**Positive:**

- **Invariant 8's third substrate is operationalized** — the User-Tooling Layer now has a concrete decision and a first migration, not just an essay concept and a domain model action.
- **The AID cycle at phase boundaries becomes hook-verifiable.** The Stop hook's manifest check, in enforcement mode, will block phase transitions that do not produce a gate reflection note at the canonical path. This closes one of the largest remaining judgment-anchored dispatch sites in the methodology.
- **The compound defense makes the engagement-degradation threat visible and inspectable.** Prior to this ADR, the methodology had all three defense mechanisms (belief-mapping, snapshot, and an implicit "did you produce anything" expectation of reflection notes) but did not name them as a coherent defense against a named threat. The naming makes the defense architecturally first-class. The "compound defense" umbrella is extensible — future components can join without the pattern needing to be renamed.
- **The reframe-derailed gate limitation is explicitly acknowledged.** Future ADRs citing the User-Tooling Layer inherit the obligation to name it. The methodology does not silently claim a guarantee it cannot deliver.
- **The gate reflection note format respects AID privacy across media.** The note captures evidence of gate activity without narrating engagement back to the user, applying the Cycle 10 AID Interpret privacy principle to file-based artifacts as well as conversational output.

**Negative:**

- **Every phase skill gains an additional artifact-production requirement.** The gate reflection note is new work at phase-end. Phase skills become more ritualistic as the artifact trail grows. Mitigation: the note format is structured and short; it is not a creative-writing exercise; the orchestrator produces it mechanically once the AID exchange completes.
- **A broken or interrupted phase transition can wedge if the note cannot be written.** Mitigation: the advisory-mode fallback from ADR-064 applies — on pre-migration corpora, on hook-script errors, or when `docs/housekeeping/gates/` does not exist, the note requirement degrades to a stderr advisory rather than a block. On a post-migration corpus with working hooks, phase transition does block until the note is written — the desired behavior.
- **The compound defense is partial coverage even when all its components fire.** The reframe-derailed gate limitation is a real epistemic gap. The ADR acknowledges this honestly rather than claiming the User-Tooling Layer is complete. Users who want stronger guarantees have no additional lever available within the methodology's current scope.
- **The gate reflection note format is new and will drift.** Template alignment over time is a conformance concern. `rdd-conform` should audit gate reflection notes for template alignment, which extends its scope alongside the existing housekeeping-audit extension in ADR-070.

**Neutral:**

- **The canonical path `docs/housekeeping/gates/` is a new directory under housekeeping.** Parallel to `docs/housekeeping/audits/`. Pre-migration path has no equivalent — this directory is created fresh at migration time per ADR-070.
- **The manifest format from ADR-063 extends natively.** The existing per-mechanism `required_mechanisms` structure supports the `aid-cycle-gate-reflection` entry without schema changes. The `{phase-from}` and `{phase-to}` substitution tokens extend the existing `{cycle}` substitution pattern.
- **The AID cycle's engagement interpretation remains private even with the artifact requirement.** This ADR is the specific application of the AID Interpret privacy principle to file-based artifacts, not a revision of the principle. Prior principle → current encoding.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

This ADR carries the most provenance-complex chain of the six structural ADRs, because three of its major components were user-surfaced at MODEL or DECIDE, with agent composition layered on top. The honest tracing:

- **User-Tooling Layer as Invariant 8's third substrate:** Essay 014 §7 and Cycle 10 MODEL phase Amendment #17. Not agent synthesis.
- **The unified principle across all three substrates ("anchor to a concrete, mechanically-unavoidable step with observable output"):** Essay 014 §7 line 172, explicit. Not agent synthesis.
- **Graduate Conversational Mechanism as an action name:** MODEL phase domain model Amendment #17. Not agent synthesis.
- **The AID cycle gate reflection note as the concrete example:** Essay 014 §7 line 182 proposes this pattern. The specific canonical path, required structure, and AID-privacy-respecting content design are composed in this ADR at drafting time. Essay proposes the pattern; ADR encodes the implementation. Agent composition layered on essay proposal.
- **The reframe-derailed gate failure mode:** **User-surfaced at MODEL pre-mortem 2026-04-08.** The agent's first-order User-Tooling Layer analysis did not include this failure mode. The user's pre-mortem response surfaced it. The agent confirmed it was a failure mode not previously considered and absorbed it into the domain model User-Tooling Layer concept. This ADR encodes it as a load-bearing limitation inherited by any future ADR citing the User-Tooling Layer. **Attribution: user-surfaced at MODEL gate; agent-composed the specific wording in this ADR.**
- **The engagement-degradation threat model:** **User-surfaced at MODEL pre-mortem 2026-04-08 and re-clarified at DECIDE gate 2026-04-08.** The user named: engagement degrades → artifacts encode incongruent framings. At MODEL, this was surfaced in the User-Tooling Layer pre-mortem. At DECIDE, the user clarified the original pairing (snapshot + belief-mapping as complementary defenses) after the agent surfaced a provenance discrepancy. The threat model is fully user-surfaced across both phases.
- **The "compound defense" umbrella term:** **Agent-composed at MODEL 2026-04-08 during the User-Tooling Layer concept edit; user-endorsed at DECIDE 2026-04-08.** The term was not the user's original framing — it was the agent's synthesis of the user's pre-mortem observation into a named pattern. The user confirmed this retrospectively at DECIDE: *"It was your term to say compound-defense, which was why I couldn't recall the concept easily before, but it makes sense to me and is descriptive."* The DECIDE endorsement also added a substantive justification for retaining the term: its extensibility. "Compound defense" does not bake in a component count, so additional defenses can join the pattern without renaming. **Attribution: term agent-composed at MODEL, user-endorsed at DECIDE with extensibility rationale.**
- **The compound defense's component breakdown (manifest + snapshot + belief-mapping covering non-overlapping failure modes):** **Hybrid provenance.** The snapshot and belief-mapping as complementary defenses were user-surfaced at MODEL in the User-Tooling Layer pre-mortem. The manifest-check component was agent-synthesized at MODEL during the User-Tooling Layer concept edit and user-endorsed at DECIDE 2026-04-08 after the DECIDE-phase provenance discrepancy surfacing resolved the question. The specific characterization of the components as covering "non-overlapping coverage zones" (structural floor / content ceiling / pre-artifact) is agent composition at DECIDE, building on the user's substantive endorsements. **Attribution: insights user-surfaced across MODEL and DECIDE; component taxonomy agent-composed at DECIDE.**
- **The AID-privacy-respecting content design:** Derived from Cycle 10 feedback memory on AID Interpret privacy (durable user preference from earlier cycles). Applied in this ADR to file-based artifacts as a new application of the existing principle. Not user-surfaced for this specific ADR, but not agent synthesis either — it is a pre-existing user principle being applied to a new context.
- **The `docs/housekeeping/gates/` path choice and the `{phase-from}-to-{phase-to}` substitution pattern:** Agent-composed at drafting time as a mechanical extension of the housekeeping pattern from ADR-064. Not from essay or user input.
- **The scope boundary decisions (belief-mapping at pushback, assertion-aware observation, AID during standalone as explicit non-targets):** Agent-composed at drafting time as independent second-order critique of what this ADR commits to.

**Watch item resolved at DECIDE.** This ADR originally drafted a "three-layer defense with zones" umbrella framing, flagged as a watch item because the user had not explicitly endorsed that specific umbrella. At the subsequent DECIDE turn, the user clarified that "compound defense" — the agent's own MODEL-phase term — is the right umbrella, for two reasons: it is descriptive, and it is extensible to future components without requiring a rename. The ADR was updated in the same DECIDE conversation to use "compound defense" consistently throughout. The first-draft "three-layer" terminology is preserved only in this provenance note for traceability. The watch item is resolved; no unresolved synthesis-moment framing adoption remains in the ADR.

**Result:** This ADR is the most provenance-complex of the six structural ADRs in Cycle 10. Three user-surfaced insights (threat model, reframe-derailed gate limitation, compound-defense substantive pairing) are encoded with explicit hybrid attribution. The "compound defense" umbrella term is agent-composed at MODEL and user-endorsed at DECIDE with an extensibility rationale. One architectural synthesis — the characterization of the three components as covering "non-overlapping coverage zones" — remains agent composition, but this is descriptive of the component boundaries rather than a new umbrella framing. No unresolved watch items; the DECIDE gate conversation resolved the earlier three-layer-vs-compound-defense question by endorsing the latter as the load-bearing umbrella.
