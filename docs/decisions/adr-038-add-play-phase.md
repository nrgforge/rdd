# ADR-038: Add Play Phase After BUILD

**Status:** Proposed

## Context

Essay 008 identifies a constitutive gap between specification and situated action (Suchman 1987): a system can satisfy every scenario, pass every test, and meet every criterion while remaining hostile, confusing, or unusable to the stakeholders it serves. This gap is not a deficiency in specification — it is a structural feature of the relationship between plans and use. Interaction Specifications (ADR-037) substantially reduce the gap by specifying workflow-level mechanics, but a residual gap remains because *specifying* how someone uses a system and *using* it are different kinds of activity. Specifications capture intended use; play encounters actual use — and the divergence between them is where discoveries live.

Strong convergence across five disciplines — play theory (Huizinga, Caillois, Winnicott, Sutton-Smith, Sicart), design theory (Schon, Buxton), critical theory (de Certeau, Suchman), performance (Boal, Spolin), and philosophy (Gadamer, Bateson) — establishes that play is a fundamentally different epistemological mode from testing. Testing is practitioner-directed verification against predetermined questions. Play is disclosure by encounter — the system reveals itself through being engaged freely (Gadamer's ontological priority).

The discover-play symmetry gives the pipeline epistemic bookends around the pragmatic center: Product Discovery inverts assumptions about *what to build*; Play inverts assumptions about *what was built*. Both are epistemic, both are generative, both are bounded by felt understanding, and both serve Invariant 0 from the "who it was built for" dimension. The symmetry is structural (both serve the same invariant through the same mechanism — assumption inversion) but asymmetric in specifics: discover feeds forward into multiple named phases with specified relationships; play feeds back into prior phases through categorized Field Notes, with the re-entry mechanism to be specified in the `/rdd-play` skill design.

Play requires a Playable Surface — Interaction Specifications (ADR-037) create the structured layer play encounters and discovers deviations from. Without them, play is frustrating because there is nothing structured against which to discover divergence (confirmed through nrgforge/rdd#7).

## Decision

Add PLAY as an optional phase after BUILD, before SYNTHESIS. The pipeline becomes:

```
RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD → [PLAY] → [SYNTHESIS]
```

Play is relevant once BUILD has taken place — it requires built software to encounter. The Team Lead scoping use case (RESEARCH → ARCHITECT) does not reach play. Play precedes synthesis because synthesis mines the artifact trail for novelty, and play's Field Notes contribute experiential discoveries — surprises, frictions, delights — that a conformance-only trail (the artifact trail produced by BUILD) cannot contain. Without play, synthesis reports on what was planned and built; with play, synthesis discovers.

**Three-movement structure:**
1. **Inhabit** — choose a stakeholder from Product Discovery. Enter their perspective with a Super-Objective (from discover's stakeholder map) and Objective (from Interaction Specifications). Caillois's mimicry as epistemological act.
2. **Explore** — use the system as that stakeholder with a Point of Concentration (Spolin) but freedom to wander. Attend to whatever the system discloses rather than checking against predetermined questions.
3. **Reflect** — what was discovered? What surprised? Where did the system resist the stakeholder's intent? Categorize discoveries as Field Notes by feedback destination.

Repeat per stakeholder. Not every stakeholder needs equal play time — the practitioner decides where to dwell.

**Play itself is the epistemic act** — the same principle as ADR-016 (synthesis subsumes its gate). The three-movement activity is inherently generative at every step: inhabiting requires entering a perspective, exploring requires attending to disclosure, reflecting requires articulating discoveries. A cross-cutting reflection at the end of play asks: which stakeholder had the hardest time? What did play reveal that the specs missed?

**Bounded by felt understanding** (Invariant 0), not timebox (Invariant 4). Play continues until the practitioner's felt sense is that discovery has plateaued. Individual sessions are typically short (Spolin's theater games are 3-5 minutes each); the overall play phase continues until understanding plateaus across stakeholders. This is the same bounding principle as synthesis — provisional, pending operational experience. No stakeholder-count limit.

**Field Notes** are play's artifact: observational, naturalistic, in-the-moment discovery records categorized by feedback destination:

| Category | Feeds back to |
|----------|---------------|
| Missing scenario | DECIDE |
| Usability friction | DISCOVER (value tension) |
| New question | RESEARCH or domain model |
| Challenged assumption | DISCOVER (inversion) |
| Delight | SYNTHESIS |
| Interaction gap | Interaction Specifications |

Field Notes do not prescribe fixes — play observes and records. Fixes go through the normal cycle (Bruner's safety principle). Field Notes pair with the Field Guide: the guide is the map; the notes are the journal.

**Feedback sustains the pipeline loop.** Play's feedback into discover makes play the precondition for the next discover phase, giving the pipeline its iterative character.

**Playing as oneself is equally valid.** If the practitioner is the primary stakeholder, self-play is natural — the play frame itself (Bateson's metacommunicative shift) makes the familiar strange regardless of whose role is inhabited. Self-play eliminates the Epistemic Distance concern entirely because there is no role gap; the Gamemaster (ADR-039) addresses distance specifically when inhabiting *other* stakeholders' roles.

## Consequences

**Positive:**
- Completes the discover-play symmetry — the pipeline now has epistemic bookends around the pragmatic center
- Serves Invariant 0 from the "who it was built for" dimension — inhabiting stakeholders builds authority to speak about stakeholder experience
- Surfaces what specifications structurally cannot capture — the constitutive gap between plan and situated action
- Enriches the artifact trail with experiential discoveries before synthesis mines it — play log becomes source material for the most interesting synthesis insights
- Provides the feedback mechanism that sustains the pipeline's iterative character

**Negative:**
- Adds a phase to the pipeline. Mitigated by optionality (like synthesis) and felt-understanding bounding
- Epistemic Distance (Deterding) is a genuine tension — the person who built the system may struggle to inhabit unfamiliar roles. Mitigated by the play frame, discover's stakeholder profiles, and the Gamemaster (ADR-039), but not eliminated
- Requires built software — cannot be used in the scoping use case (RESEARCH → ARCHITECT) or research-only mode

**Neutral:**
- ADR-016's pattern (phase subsumes its gate) applies directly — no new gate infrastructure needed
- Spike-play (exploring feasibility before build completes) is a valid but distinct activity. This ADR formalizes post-build play; spike-play remains informal
