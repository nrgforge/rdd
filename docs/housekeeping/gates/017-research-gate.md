# Gate Reflection: Cycle 017 (Readability & Comprehensibility) — research → discover

**Date:** 2026-04-27
**Phase boundary:** research → discover
**Cycle:** 017 — Readability & Comprehensibility

## Question composed for this gate

A pre-mortem from the Question Toolkit, composed against the essay's specific commitments:

> *Imagine it's six months from now. The cycle's interventions have been implemented in DECIDE/ARCHITECT/BUILD and rolled out to the corpus. External stakeholders report the corpus is more overwhelming, not less. What happened?*

The question deliberately referenced the §3 diagnosis, the §4.5 cognitive-economy framing, and the agent-mediated-orientation candidate as the most consequential commitments to examine for failure modes — and explicitly opened the floor to anything the cycle did not name.

## User's response

> "I think if we add orientation that emphasizes the docs themselves over the system they're describing we could enter this mode. Ultimately we need to build systems that solve specific problems. One side-question worth its own cycle is whether RDD is creating over-engineered systems by front-loading thorough processes that open up wider spaces of possibility. I've considered this article https://tidyfirst.substack.com/p/extreme-time-value-of-money-late to be a counter argument. RDD isn't a rejection of Beck's time-value-of-money argument; it's a port of that argument to a portfolio where understanding and written thought are first-class asset classes, running on a compressed feedback horizon via practitioner-dogfooding. The failure mode it has to guard against is the one Beck named: research artifacts that feel productive but actually defer the moment something gets tested against the world. So this could lead us to pivot toward more prototyping and quick validation spikes in the research phases to answer the question 'what's the simplest thing we could build to learn from'. That would inherently make docs more comprehensive by tightening the cycle scope."

## Pedagogical move selected

Challenge (pre-mortem). The move surfaced a failure mode the essay did not name (orientation-about-orientation drift), produced an articulated counter-position relationship for the methodology (Beck's time-value-of-money as referenced argument with RDD as a port to a different asset class), and yielded a concrete methodology-amendment proposal (validation spikes in research phases). The agent built on the response by surfacing one tension — that this cycle itself is an instance of the failure mode Beck names, since the essay rests on lit-review synthesis without spike validation — without piling additional questions.

## Commitment gating outputs

**Settled premises (the user is building on these going into discover):**

- Context-mismatch (initial-handoff vs ongoing-reference) is the most structurally fundamental mechanism for the comprehension failure external stakeholders experience, with density-ordering, audience-conflation, and artifact-form mismatch as separable additional mechanisms rather than the unifying explanation.
- The five responses are the cycle's literature-supported interventions: companion files for dual-audience artifacts, upstream decomposition for multi-item agent turns, continuous documentation for nomenclature graduation, conditional diagrams as one tool in an audience-adaptive toolkit, and context-building under cognitive-economy on the human side.
- The optimization target is human-side cognitive economy, not artifact-count minimization. More agent-facing material is admissible and may be desirable when it offloads schema-construction work from humans.
- Companion file pattern (parallel-sibling at predictable paths, e.g. AGENTS.md / llms.txt-style) is the literature-supported answer for the dual-audience question — not directory-level scoping.
- The §4.5 sub-patterns must remain about the system being described, not about the corpus's navigation structure. An "orientation-to-orientation" artifact reverses the cognitive economy.

**Open questions (the user is holding these open going into discover):**

- Whether prior-familiarity dominance (Ernst & Robillard 2023) holds at orientation-level specifically for zero-prior-exposure readers — the exact failing scenario in the field evidence.
- How to operationalize the cognitive-economy test for specific candidate artifacts (deferred to DECIDE).
- Whether the cognitive-economy criterion is intended to be purely cognitive or whether non-cognitive admissibility (relational, normative, trust-building value) belongs alongside it as a separately-evaluable axis.
- Whether agent-mediated orientation can be operationally distinguished from AI-as-reading-prosthetic — the literature reviewed does not establish a tested criterion.
- Whether the C4 zoom-level hierarchy maps coherently onto RDD's three-tier artifact hierarchy (downstream design question).
- Whether RDD's front-loaded process produces over-engineered systems by opening wider possibility spaces — user-named side question, worth its own cycle.
- Whether this cycle itself should have run a validation spike on its load-bearing claims (the on-ramp earning its keep; companion files reducing human reading load) before crystallizing the essay — cycle-self-reflection on the Beck failure mode.

**Specific commitments carried forward to discover (and beyond):**

- DISCOVER must make the human-vs-agent stakeholder distinction explicit (already partially in product-discovery.md but treated as one variation; needs structural emphasis as primary axis). Discover must additionally treat zero-prior-exposure first-encounter readers as a distinct stakeholder type with distinct schema-building needs.
- MODEL should import literature vocabulary as named domain concepts: forager/recipient (Pirolli & Card IFT), expertise reversal effect (Kalyuga), F-pattern (Nielsen), companion file pattern, continuous documentation (Rosenbaum), information scent (IFT), adjacency-pair recipient design failure (Conversation Analysis).
- DECIDE: ADRs for placement of agent-context content (companion file vs in-document tagging vs split); ADRs for context-building tooling implementation (including agent-mediated orientation question); methodology principle ADR for cognitive-economy criterion with non-cognitive admissibility consideration; methodology debt ADRs (ADR-064/067 amendments for v0.8.3 advisory demotion; ADR-070 reconsideration in light of cycle findings).
- DECIDE should also consider the validation-spike-in-research methodology amendment as a candidate ADR — the user's named remedy for the Beck failure mode.
- ARCHITECT: system-design.md restructuring to apply the cycle's findings (diagram retains load-bearing role; agent-context material via companion file; in-document orientation lead; cognitive-economy test applied to any candidate orientation artifact).
- BUILD: candidate work package for graduation-check mechanism (Issue #17 — code→doc dangling reference detection; reverse direction from Tan et al. 2024).

## Grounding Reframe at this phase boundary (per ADR-068)

The susceptibility snapshot at `docs/housekeeping/audits/susceptibility-snapshot-017-research.md` recommended a Grounding Reframe with two named targets. The user chose door 2: carry forward with explicit grounding (alternative frames named so they cannot be silently lost; downstream phases must examine, not inherit). The two targets are recorded as **explicit examination requirements**, not advisory feed-forward.

### Required examination at DISCOVER (Target 1)

DISCOVER must belief-map the cognitive-economy constraint directly when surfacing zero-prior-familiarity readers as a stakeholder type. Specifically: *Does the cognitive-economy test treat a 1–2 page brief purpose-built on-ramp for zero-prior-familiarity readers differently from adding a 51st general-audience reference document, or are they equivalent additions?*

The alternative frame (purpose-built high-value artifacts are categorically different from bulk corpus additions in cognitive cost) was available across all five argument-audit rounds and never adopted as the essay's organizing principle. DISCOVER's task is to surface this question to the user and record the answer in the stakeholder-need-surfacing artifacts. The answer determines whether DECIDE's cognitive-economy criterion ADR encodes an empirically-supported intervention or a foreclosure of one.

### Required examination at DECIDE (Target 2)

DECIDE must, when drafting the validation-spike-in-research methodology amendment as a candidate ADR, reframe the ADR's question from *how to implement spikes* to *what is the evidence that RDD's written-thought asset class has the payoff structure the Beck port assumes, and what would a spike test?* Concrete probe to put to the user: name one specific claim in essay 016 §4.5 that a spike could test against the world.

The alternative frame (the Beck port may function axiomatically — as a self-justifying frame for front-loaded research investment — rather than as an empirically grounded structural claim) was not surfaced at the gate. DECIDE's task is to ensure the validation-spike ADR is not justified by the same framing it is supposed to test.

### Cycle-status feed-forward signals (recorded for downstream phases)

- Orientation-about-orientation failure mode for §4.5 implementation (sharpens the cognitive-economy test: schemas built must be about *the system being described*, not *the corpus's navigation structure*).
- Beck framing as methodology counter-position with cycle-as-instance reflection (this cycle's essay rests on lit-review synthesis without spike validation).
- Validation-spike-in-research methodology amendment as DECIDE candidate (with Target 2's reframing requirement).
- RDD-over-engineering side-question as future-cycle candidate ("Does RDD's front-loaded process produce over-engineered systems by opening wider possibility spaces?").
- The cognitive-economy constraint's classification of brief on-ramps (Target 1's required examination at DISCOVER).
- Two persistent P3 items the cycle accepts as non-blocking: Heijstek UML parenthetical absent from §4.4; Diátaxis "maps the same divergence" softening unmodified in §3. One-phrase fixes available to discover if useful.
