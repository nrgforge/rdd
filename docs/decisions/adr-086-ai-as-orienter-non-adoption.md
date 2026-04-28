# ADR-086: AI-as-Orienter — Non-Adoption Pending Operational Criterion

**Status:** Proposed

## Context

Essay 016 §4.5 examined whether **agent-mediated orientation** — an interactive, conversational on-ramp that builds the reader's schemas through dialogue rather than through document reading — should be adopted as a methodology pattern. The pattern is conceptually distinct from **AI-as-reading-prosthetic**, the user-rejected pattern where humans need AI to translate documents that should be human-readable directly. The distinction:

- **AI-as-orienter** is intended use: the agent provides interactive schema-building for first-encounter readers, the corpus's primary readables remain self-supporting, the agent fills a structured orientation role.
- **AI-as-prosthetic** is the rejected pattern: humans cannot read the documents directly, the agent becomes a translation layer, the documents' direct human readability is foreclosed.

The literature on Information Foraging Theory and Cognitive Load Theory supports the underlying principle: schema-building can happen through interaction as readily as through reading, and interaction handles zero-prior-context better than dense reference material does (essay 016 §4.5). The distinction between AI-as-orienter and AI-as-prosthetic is conceptually genuine — interactive dialogue and document translation are categorically different roles.

The literature does **not** establish a tested operational criterion separating the two roles in practice. Essay 016 §4.5 names this explicitly: *"the distinction is conceptually genuine but operationally fragile — it can shade into the rejected pattern under usage drift, and no source in the cycle's reviewed literature establishes a tested criterion for separating them."*

The DISCOVER gate confirmed the operational-criterion question as the load-bearing concern. Value Tension T5 ("AI-as-orienter vs. AI-as-prosthetic") was committed as held-open with adoption explicitly blocked: *"Adoption of AI-as-Orienter is blocked at DECIDE on whether the operational-criterion problem can be solved."* The MODEL gate carried the question forward without alteration, encoding AI-as-Prosthetic / AI-as-Orienter as paired domain concepts in Amendment 21 with the explicit hold-open marker.

This ADR addresses the DECIDE-phase resolution: whether the operational-criterion problem can be solved at this cycle's evidence level, and what the methodology's position is until it can.

## Decision

The methodology **does not adopt AI-as-orienter** as a structural pattern in this cycle. Adoption is **blocked pending an operational criterion** that distinguishes AI-as-orienter from AI-as-prosthetic in observable behavior, not only in stated intent.

### 1. The operational-criterion problem is unresolved

The cycle's evidence does not establish a criterion that distinguishes AI-as-orienter from AI-as-prosthetic in practice. Two specific failure modes the literature acknowledges:

- **Usage drift.** A pattern adopted as AI-as-orienter (interactive schema-building during a structured first-encounter session) can drift under repeat use into AI-as-prosthetic (the practitioner returns to the agent for ongoing reading rather than for first-encounter orientation; the corpus's direct human readability is gradually deferred). The drift is gradual and self-reinforcing.
- **Indistinguishability at usage time (agent-hypothesized, not literature-established).** From inside an interactive session with the agent, the practitioner cannot reliably tell whether they are using the agent to build their own schemas (AI-as-orienter) or to substitute for the reading work the corpus should support (AI-as-prosthetic). The two feel similar; the differentiator is downstream — what does the practitioner do *next* when they encounter the corpus without the agent — but the usage-time behavior is not differentiable. This second failure mode is **agent-hypothesized** rather than essay-grounded. The reviewed literature does not directly establish indistinguishability at usage time as a tested mechanism; the hypothesis is offered as a plausible second-order concern that compounds the essay-grounded usage-drift failure mode. The non-adoption decision rests soundly on the usage-drift failure mode alone (which is essay-grounded, §4.5); this hypothesis is offered for consideration but does not itself carry the decision. If the hypothesis turns out not to hold in practice, the non-adoption argument is unaffected.

The first failure mode is essay-grounded; the second is agent-hypothesized. The non-adoption holds on the first alone. A criterion that resolves them would need to be either (a) an observable usage-pattern signal that distinguishes one role from the other (e.g., interaction frequency, session-vs-ongoing-use ratio, content the agent produces vs. content the agent points the practitioner to), or (b) a structural commitment in the methodology that bounds the agent's role in a way that makes drift detectable. Neither is established in the reviewed literature, and Cycle 017's evidence does not provide an empirical baseline to test against.

### 2. Default position: corpus directly readable; agent assists pragmatic work

The methodology's existing position holds: the corpus must be directly readable by humans without AI as workaround. This is the practitioner's outcome test, encoded in ADR-083 (cognitive-economy criterion). The Outcome Test applies to agent-mediated orientation as a candidate intervention: an agent-mediated on-ramp is admissible only if its presence produces direct human understanding without AI as workaround — and the operational-criterion problem makes that test unverifiable for agent-mediated orientation specifically.

The cycle's other admissible interventions remain available:

- In-place restructuring of existing artifacts (ADR-083 default).
- Companion files for genuinely-divergent agent-context content (ADR-084 Pattern B).
- F-pattern orientation leads at the top of Tier-2 documents (ARCHITECT input from essay 016 §6).
- Brief purpose-built human-facing on-ramps where cognitive economy is positive and the four named exception conditions in ADR-083 §4 apply.

Each of these is a **document-level** intervention that does not require ongoing agent-mediated interpretation. Practitioners reading the corpus encounter the artifacts directly; the agent's role remains pragmatic (generation, synthesis, formatting) rather than orientation-mediating.

### 3. The reframe-during-gate scenario as a bounded existing pattern

The methodology already supports a bounded form of agent-mediated dialogue at the AID gate — the agent helps the practitioner attend to artifact content through belief-mapping, warrant elicitation, and reflection-time challenge. This is **not** AI-as-orienter in the sense the cycle examined. The AID gate operates on artifacts the practitioner has already produced or is producing in the same cycle; the gate's purpose is reflection on the practitioner's own work, not first-encounter orientation to a corpus the practitioner has not engaged.

The AID gate pattern remains current and is not affected by this ADR. The non-adoption applies specifically to **agent-mediated first-encounter orientation as a structural methodology pattern** for new readers encountering an established corpus.

### 4. Future-cycle conditions for revisiting

The non-adoption is conditional, not permanent. A future cycle may adopt AI-as-orienter if the operational-criterion problem is solved. Conditions that would trigger revisiting:

- **Empirical evidence from a controlled study or spike** of agent-mediated orientation behavior in practice — usage logs, follow-up corpus engagement, or qualitative observation that distinguishes the two roles in observable practitioner behavior.
- **A literature finding** that establishes a tested operational criterion (a peer-reviewed source, not a practitioner blog or marketing source).
- **A methodology-internal proposal** that bounds the agent's role structurally — e.g., a session-scoped orientation skill that produces an artifact the practitioner reads independently after the session, with the artifact serving as the criterion that the orientation produced understanding rather than substitution.

The third condition is the most accessible path; future cycles can prototype a session-bounded orientation pattern with structural artifacts and test whether the operational-criterion problem dissolves under that constraint. This ADR does not specify the prototype; it names the condition that would warrant reopening adoption.

## Rejected alternatives

**Adopt AI-as-orienter conditionally with a usage-time disclaimer ("the agent supports orientation; practitioners should retain direct corpus readability").** Rejected. The disclaimer pattern is the AI-as-prosthetic risk in a different form — it adopts the role and adds a guardrail that depends on practitioner self-vigilance to maintain. The literature documents that usage drift is gradual and self-reinforcing; vigilance-based mitigations are unreliable for self-reinforcing failure modes. The disclaimer pattern would adopt the role and silently shade into the rejected pattern under repeat use.

**Adopt AI-as-orienter with structural usage limits (e.g., "the agent can answer first-encounter questions but must point practitioners to corpus sections rather than synthesize content").** Considered as a stronger alternative. The pattern is plausible — the agent's role is bounded to navigation rather than synthesis; the corpus retains its readable function; the agent's contribution is information scent rather than schema-building-via-content. The reason for non-adoption: the boundary between "navigation" and "synthesis" is not operationally testable. An agent answering "where in the corpus does X live?" can answer accurately or can paraphrase, and the practitioner cannot reliably tell which. The structural limit would still depend on agent behavior the methodology cannot verify. A future cycle that builds tooling to enforce the limit (e.g., the agent's responses must contain only corpus-derived passages with cited locations and no original synthesis) could revisit; the tooling work is out of scope here.

**Adopt AI-as-orienter as Tier 2 best-effort with explicit non-structural status (per Invariant 8's "best-effort" disposition).** Rejected. Tier 2 best-effort is appropriate for mechanisms whose unconditional structural mechanism cannot be specified but whose pattern is methodology-supported. AI-as-orienter is not in that category — the methodology's existing position (corpus directly readable; agent assists pragmatic work) is the supported pattern, and AI-as-orienter as a separate pattern would compete with that position rather than supplementing it. Invariant 8's best-effort disposition is not the right home for a pattern whose adoption requires resolving an unresolved separation question.

**Defer the question without naming non-adoption (treat as ongoing open question).** Rejected. The DISCOVER gate explicitly committed the question to DECIDE for resolution, with adoption blocked on the operational-criterion problem. Deferring without naming a position would silently leave the question to drift across cycles. Naming non-adoption with future-cycle conditions for revisiting is the resolution that respects the gate's commitment.

**Adopt AI-as-orienter and rely on the bolt-on / felt-additional signal (ADR-083) to detect drift toward AI-as-prosthetic.** Considered. The bolt-on signal applies to candidate human-facing artifacts; AI-as-orienter is not an artifact, it is a methodology modality. The signal's structural anchoring (felt at the moment of artifact proposal) does not transfer to a continuous interaction modality. The signal would not catch AI-as-orienter drift because there is no proposal moment at which the signal fires. This is a category mismatch, not a usable mitigation.

## Consequences

**Positive:**

- The methodology's current position (corpus directly readable; agent assists pragmatic work) is preserved. Practitioners and stakeholders inheriting the methodology read the corpus directly; the agent does not become a structural orientation layer.
- The non-adoption is reasoned, not arbitrary. The operational-criterion problem is named explicitly; future cycles have a clear condition for revisiting.
- The decision composes with ADR-083's Outcome Test: AI-as-orienter as a candidate intervention fails the test specifically because its outcome is unverifiable, not because it is conceptually rejected.
- The AID gate pattern (bounded agent-mediated dialogue on artifacts the practitioner has produced) remains current and is not affected. The non-adoption is scoped to first-encounter orientation, not to all agent-mediated dialogue.
- Practitioners using existing AI tooling for first-encounter reading (the field-evidence pattern that triggered Cycle 017) are not foreclosed from doing so; they are simply not following a methodology-supported pattern. This is honest scope-of-claim — the methodology cannot force practitioners not to use AI for reading, but it does not certify that pattern as supported.

**Negative:**

- The methodology does not address the field-evidence problem (external stakeholders feeding mature corpora to AI for summarization) by adopting an alternative structural pattern. The interventions of essay 016 §4.1–§4.5 (in-place restructuring, companion files, F-pattern leads, brief purpose-built on-ramps) carry the cycle's response; AI-as-orienter is not one of them.
- The non-adoption may surprise practitioners who assumed agent-mediated orientation would be adopted given the cycle's investigation of corpus readability. The conceptual distinction between AI-as-orienter and AI-as-prosthetic was developed in essay 016 §4.5; the cycle's resolution is that the conceptual distinction is genuine but operationally insufficient.
- The future-cycle conditions for revisiting are conditional on work that has not been scheduled. AI-as-orienter remains blocked indefinitely unless a future cycle explicitly takes it up. This is the cycle's honest scope-of-claim — adoption is not on the methodology's roadmap, only on its potential roadmap.

**Neutral:**

- The AI-as-Prosthetic / AI-as-Orienter paired concept in domain model Amendment 21 remains the canonical encoding. This ADR encodes the disposition the concept's "Adoption blocked" marker anticipated.
- The Operational Criterion Problem is named in this ADR but not encoded as a separate concept. Whether to add it as a domain concept is a future-cycle question; the term operates here as descriptive language for a class of methodology decisions where conceptual genuine distinctions are operationally fragile.
- The decision does not foreclose other agent-mediated patterns the methodology may adopt in the future (e.g., agent-as-gamemaster during play, agent-mediated review in `/rdd-review`). Those patterns have their own structural-anchoring stories and are not affected.

## Provenance check

- **The conceptual distinction between AI-as-orienter and AI-as-prosthetic:** essay 016 §4.5. Driver-derived.
- **The operational-criterion problem as the load-bearing barrier to adoption:** essay 016 §4.5 (the "operationally fragile" framing). Driver-derived.
- **The DECIDE-phase commitment to address the question:** product-discovery Value Tension T5; DISCOVER gate; MODEL gate. Driver-derived.
- **The non-adoption disposition:** drafting-time application of Invariant 8's anchoring requirement (a mechanism whose operational criterion is unresolved cannot be specified as adopted) plus the Outcome Test (an intervention whose outcome is unverifiable fails the test). Agent composition; principle-derived.
- **The two specific failure modes (usage drift, indistinguishability at usage time):** drafting-time synthesis. The first is essay-grounded (§4.5's "shade into the rejected pattern under usage drift" framing); the second is agent-composed against the practitioner-vs-agent observability question that the literature does not directly address.
- **The future-cycle conditions for revisiting (three named conditions):** drafting-time synthesis. The first (empirical study) is agent composition. The second (literature finding) is reflexive composition of the cycle's literature-review pattern. The third (methodology-internal session-bounded prototype) is agent composition with structural-anchoring shape. All three are agent-composed, principle-derived.
- **The AID gate scope distinction (bounded agent-mediated dialogue is not AI-as-orienter):** drafting-time synthesis composed against the existing AID gate pattern (ADR-040, ADR-041, ADR-056) and Question Toolkit. Agent composition; pattern-derived.

**Result:** Conceptual framing and the load-bearing barrier (operational-criterion problem) are essay-grounded. The disposition (non-adoption pending criterion) and the AID-gate-scope distinction are agent-composed against driver-derived principles (Invariant 8, Outcome Test, AID gate pattern). The two specific failure modes and three future-cycle conditions are agent-composed with mixed driver-derivation. No synthesis-moment framing adoption detected.
