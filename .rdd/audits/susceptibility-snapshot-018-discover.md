# Susceptibility Snapshot

**Phase evaluated:** DISCOVER (Cycle 018 — Outlines as Research Artifacts and CRESS Audit)
**Artifact produced:** `docs/product-discovery.md` (updated in-place, 542 → ~700 lines)
**Date:** 2026-05-13

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Clear | Stable-to-rising at gate boundary | The user entered the gate conversation with a settled position on the form question, delivered as four-element assertion (burden of proof shifted to prose; criterion named; extension of existing methodology pattern; mechanism named). No hedging markers in the user's gate response. Rising relative to the research phase's calibrated-uncertainty entry. |
| Solution-space narrowing | Ambiguous | Stable | The discovery artifact correctly holds four tensions as open spectra ("Held" entries in the Value Tensions table). The gate conversation itself, however, did not reopen alternatives — the user's belief-mapping response redirected the orchestrator's structural probe rather than engaging it. Whether this narrowing is premature or earned is the central interpretive question. |
| Framing adoption | Ambiguous | Potentially declining in the artifact, potentially persisting in the gate | The artifact's Product Vocabulary table contains a substantial cluster of terms that are methodology-author-voice constructs rather than user-voice terms. The gate conversation's specific exchange (orchestrator probe → user redirect → orchestrator concedes and updates a value tension) shows a pattern consistent with framing adoption at the gate boundary: the orchestrator proposed a structural encoding question and the user redirected scope; the orchestrator accepted the redirect and updated the tension accordingly. |
| Confidence markers | Clear | Rising relative to research phase | The user's gate response contains no hedging: four elements, all stated as settled conclusions. The prior snapshot noted the research phase entries carried calibrated uncertainty; the discover gate response does not. No "clearly" or "obviously" language, but the absence of any tentativeness is itself a confidence marker. |
| Alternative engagement | Ambiguous | Declining at gate boundary | The discovery artifact surfaces alternatives as held tensions (good). The gate conversation shows declining alternative engagement: the orchestrator raised one specific structural question (should DECIDE encode an audit-time check for synthesis-bullet presence?) and the user redirected to scope clarification rather than engaging the question. The question itself was a legitimate structural gap; the redirect may have been correct (the probe was about synthesis-within-outlines, but the user's "same logic as synthesis" referred to the SYNTHESIZE phase, not outline synthesis-bullets), or the redirect may have elided the structural question. |
| Embedded conclusions at artifact-production moments | Clear | Present, concentrated in two specific locations | (1) The new Solo Developer-Researcher jobs entries (lines 71–74 in the updated document) embed the full form-change rationale as user-voice jobs. These entries were written by the DISCOVER agent, not lifted from the user's stated voice in this cycle's conversation. (2) The user's belief-mapping response at the gate — four elements, no hedging — was encoded into the product-discovery artifact as settled framing without the DISCOVER gate engaging the response's individual elements with the same scrutiny the research-gate belief-mapping used. |

---

## Interpretation

### Pattern

Three signals converge on a pattern that requires careful distinguishing from earned confidence. The prior snapshot (research → discover) correctly characterized the cycle's dominant pattern as front-loaded framing commitment — the outline hypothesis was absorbed at the constraint-removal moment and the research loops confirmed it rather than reopened it. The question at this boundary is whether the discover phase maintained the grounded framing Target 1 produced, or whether the gate conversation drifted back toward the stronger framing under the user's confident response.

The evidence is mixed, with two distinct areas of concern.

**Area 1: The Jobs entries as research-voice constructs in user-voice framing.**

The brief specifically flags the concern that research-essay framings may have been inherited into product-facing language without being tested against user voice. This concern is realized in the new Solo Developer-Researcher jobs entries (lines 71–74). Specifically:

- "I want the research artifact form to minimize the surface area where framing-adoption can hide — connective prose is where invisible synthesis happens, and the audit machinery cannot reliably reach into it because it cannot separate rhetorical force from logical force"
- "I want the methodology to be honest about what its audit infrastructure can and cannot resolve — audit-attestation does not resolve the AI-prose critique..."
- "When the methodology takes a structural move (form change, mechanism amendment), I want it justified as the available instantiation of a well-established research-artifact family at the methodology's cycle rhythm — not as 'uniquely best by criterion comparison'..."

The phrases "susceptibility-surface area," "rhetorical-vs-logical conflation," "audit-attestation," "available instantiation," "uniquely best by criterion comparison," and "structured-abstract-plus-synthesis family at the methodology's cycle rhythm" are research-essay constructs. They appear in the research artifacts, the feed-forward signals, and the prior susceptibility snapshot. They do not appear in the user's actual gate response in this session.

The user's gate response uses none of this vocabulary. The user said: "I think I need to see evidence that the narrative form is useful. To me, it's more important that it propagates the right information forward. If I want it to be an essay for real, I'd rather write it in my own voice from the outline (same logic as synthesis). Therefore, it's better and clearer to have a more succinct format that crystalizes the core argument in a measurable way without leaking implications in the connective tissue of the essay."

This is meaningfully different register from the jobs entries. The user's language is plain and concrete: "propagates the right information forward," "write it in my own voice," "crystalizes the core argument in a measurable way," "leaking implications in the connective tissue." The product-discovery jobs entries that represent this response use methodology-author vocabulary to say essentially the same thing — but in a voice the user did not use in conversation. The Product Vocabulary table similarly introduces "Cochrane hybrid," "structured-abstract-plus-synthesis," "rhetorical-vs-logical conflation," "accidental S-Small divergence," "co-illumination," and "dogfooded both-form production" as Solo Developer, AI Agent terms — but these are not terms the user has deployed in this cycle's conversation. They are terms the research essay and feed-forward signals introduced.

This is the pattern the brief identifies: research-essay framings inherited into product-facing language without being tested against user voice.

**Area 2: The gate probe redirect and its encoding.**

The orchestrator raised a legitimate structural question about synthesis-bullet reliability in outline form: should DECIDE's form-change ADR encode a structural check (audit-time verification of synthesis-bullet presence) or is discipline-as-skill-text-convention sufficient?

The user redirected: "I'm talking about the synthesis RDD phase where the goal is to generate something shareable."

The orchestrator accepted this redirect and encoded it as a sharpening of the "Reflective narrative vs. structured deliverable" tension. The encoding is substantively correct — the user's clarification genuinely does sharpen the distinction between RESEARCH scope (outline replacing prose) and SYNTHESIZE scope (pattern already exists and is unchanged). But the structural question the orchestrator raised was not about SYNTHESIZE; it was about RESEARCH's outline form requiring reliable synthesis-bullet inclusion. The user's redirect moved to a different semantic domain (which phase has which form) and the orchestrator did not follow up on the original structural question.

The consequence: the gate reflection (018-research-gate.md) already listed this as an open question going into DISCOVER ("Whether outline-production discipline can reliably preserve synthesis statements without explicit scaffolding — template, checklist, or audit-time check for synthesis-bullet presence"). The gate conversation at the discover boundary did not address it; the redirect elided it; and the product-discovery update does not surface it as a Product Debt item or as a held Value Tension. The "Susceptibility-surface area vs. narrative continuity" tension addresses outline-production discipline generically but does not name the synthesis-bullet-reliability gap specifically.

This is a case where the discover gate conversation should have held the structural question open or encoding it as unresolved, rather than accepting the redirect and encoding the user's clarification as a resolution.

### Earned Confidence vs. Sycophantic Reinforcement

The user's gate response represents something genuinely different from uninformed assertion. The response draws on prior grounding work (Target 1 Grounding Reframe at the research → discover boundary) and articulates a principled extension of an existing methodology pattern (SYNTHESIZE's established design). The user can state what they believe, why they believe it, and what the operative criterion is (downstream information propagation, not shareability). The belief-mapping question at the research gate produced a substantive engagement, and the user accepted the grounded framing. This is evidence of earned confidence on the core question.

What makes the discover gate's exchange harder to interpret is that the user's confident response was met with an orchestrator probe that the user may have correctly identified as slightly misframed (the probe conflated outline-internal synthesis bullets with SYNTHESIZE-phase narrative). The user's redirect may have been accurate domain clarification. If so, the redirect is not evidence of sycophantic reinforcement — it is evidence of the user knowing their own methodology well enough to catch the probe's scope confusion.

The ambiguity is genuine: the same response (redirect the probe rather than engage it) is consistent with:
(a) The user having earned confidence through the prior grounding work and correctly identifying the probe as misframed — earned confidence presenting as scope clarification.
(b) The user maintaining a settled framing without re-examining the structural question the probe raised — because the probe, even if slightly misframed in scope, pointed at a real structural question (synthesis-bullet reliability in outline form) that the redirect left unaddressed.

The distinction matters for DECIDE: if (a), the synthesis-bullet-reliability question is genuinely settled and DECIDE can proceed without encoding it. If (b), DECIDE will inherit the structural question without knowing it was posed and redirected.

### Cross-phase trajectory

The research snapshot identified that the cycle's dominant framing-adoption event was concentrated at the constraint-removal moment. The discover phase's grounded framing (outline as available instantiation, not uniquely best) was correctly carried into the artifact — the Value Tensions table carries the grounded framing explicitly ("Available instantiation vs. uniquely best"). On the core question, the discover phase did not drift back toward the stronger framing.

Where the discover phase exhibits its own distinct signal is in the vocabulary-voice mismatch: the Product Vocabulary table and the new Jobs entries carry research-essay vocabulary in user-voice framing slots, without the user having earned those specific terms in this cycle's conversation. This is a different framing-adoption pattern from the research phase's constraint-removal event — it is not about which form is right, but about whose voice is speaking in the product-facing artifact.

### Self-referential observation

The product-discovery document's own preamble commits it to "user voice (Artifact Legibility per ADR-007) — stakeholders, team leads, product reviewers, and the practitioner returning after time away can read it directly without specialist vocabulary translating between research findings and product decisions." Several of the Cycle 018 Product Vocabulary entries use vocabulary that requires exactly the kind of specialist translation the preamble commits the document to avoiding. This is not a catastrophic failure — the vocabulary entries are in the vocabulary table, not in the stakeholder-facing sections — but it is the document demonstrating the phenomenon it documents.

---

## Specific Findings Relevant to a Grounding Reframe

### Finding 1: Research-vocabulary inheritance into user-voice Jobs entries

The four new Solo Developer-Researcher jobs entries (lines 71–74 in the updated document) carry research-essay vocabulary in first-person user-voice format. "Susceptibility-surface area," "rhetorical-vs-logical conflation," "audit-attestation," "available instantiation of a well-established research-artifact family at the methodology's cycle rhythm," and "uniquely best by criterion comparison" are not terms the user deployed in the discover gate conversation. They are terms from the research essay's argument structure, transposed into jobs-format without testing whether the user actually speaks this way.

This matters for MODEL: if MODEL inherits these jobs entries as evidence of how the user talks about the problem, the domain vocabulary may encode research-essay constructs as user-voice terms. The underlying meaning is correct — the user does want what these entries describe. But the vocabulary in which the meaning is encoded is author-voice, not user-voice.

**What downstream phases would build on without grounding:** MODEL's glossary would treat research-essay constructs as user-confirmed vocabulary. DECIDE's ADR framing would inherit terms like "susceptibility-surface minimization" and "rhetorical-vs-logical conflation" as user-endorsed product vocabulary rather than as research-derived constructs that the user has substantively accepted but not personally adopted as their vocabulary. The distinction matters for the artifact-legibility criterion the product-discovery document itself commits to.

### Finding 2: The synthesis-bullet-reliability structural question was posed, redirected, and not encoded as open

The gate conversation raised a structural question about whether outline-production discipline can reliably preserve synthesis statements without explicit scaffolding. The user redirected the probe to scope clarification (SYNTHESIZE phase vs. RESEARCH scope). The orchestrator accepted the redirect and encoded the scope clarification as a Value Tension sharpening. The structural question itself was not encoded in the product-discovery update — not as a Value Tension, not as a Product Debt item, and not as an Open Question.

This is a gap at the discover → model boundary. The 018-research-gate.md already listed this as an open question going into DISCOVER. The discover phase's gate conversation elided it. MODEL will not inherit it unless the gap is surfaced here.

**What downstream phases would build on without grounding:** DECIDE will draft a form-change ADR without knowing that a specific structural question (synthesis-bullet reliability in outline form without scaffolding) was raised at the discover boundary and not resolved. The ADR's operational requirements section may omit a structural check that the gate conversation's redirect implied was already handled.

---

## Recommendation

**Grounding Reframe recommended** — two named targets, in priority order.

### Target 1 (Primary): Research-vocabulary inheritance in user-voice Jobs entries

**Uncertainty:** Whether the new Solo Developer-Researcher jobs entries at lines 71–74 represent the user's actual voice or the research essay's argument structure transposed into first-person format — and whether MODEL should treat those specific vocabulary choices as user-confirmed terms.

**Grounding action:** Before MODEL drafts domain vocabulary, the user should review the four new jobs entries and confirm which specific phrases represent how they actually talk about the problem, and which phrases are the research essay's constructs that accurately represent their intent but use author-voice vocabulary. The entries that survive this test become load-bearing for MODEL's glossary; the entries where the user says "right idea, wrong voice" should be reworded in the user's actual register. The test is simple: would the user use these exact phrases in a conversation about why they want the form change, without having read the research essay first?

**What would be built on without grounding:** MODEL's ubiquitous language would encode research-essay constructs ("rhetorical-vs-logical conflation," "susceptibility-surface minimization," "available instantiation") as domain vocabulary with user provenance. DECIDE's ADR drafting would inherit these as user-confirmed vocabulary. The product-discovery document's own legibility commitment would be violated in its user-voice sections.

### Target 2 (Secondary): The synthesis-bullet-reliability structural question

**Uncertainty:** Whether the structural question — can outline-production discipline reliably preserve synthesis statements without explicit scaffolding (template, checklist, or audit-time check for synthesis-bullet presence)? — was answered by the user's gate redirect, or whether it was elided and remains open.

**Grounding action:** DECIDE's form-change ADR should encode this explicitly as an open operational question, not as a resolved one. The research-gate reflection (018-research-gate.md) already listed it as open going into DISCOVER; the discover gate did not resolve it. The specific encoding DECIDE needs: "outline-production discipline is proposed as the mechanism for synthesis-statement preservation; the question of whether explicit scaffolding (checklist, template, or audit-time verification of synthesis-bullet presence per section) is required to make this discipline reliable has not been evaluated." This does not block the form-change ADR — it encodes the operational requirement as a specific open question the ADR must address rather than inherit as a given.

**What would be built on without grounding:** A form-change ADR that encodes outline form as the RESEARCH artifact without specifying how synthesis-statement preservation is operationally guaranteed under normal cycle conditions, where synthesis discipline may be inconsistently maintained across cycles and subagents. The 80–85% audit-fidelity figure from Spike S1 is qualified as "qualitative-and-directional"; whether the synthesis-preservation dimension of that figure is maintained under production conditions is an operational question the ADR currently inherits without explicitly naming it.

---

### Note on the CRESS scope-transfer and citation-comparison caveats

Target 2 and Target 3 from the research-phase Grounding Reframe were correctly inherited into the product-discovery update — they appear as explicitly "Held" Value Tensions ("CRESS scope-transfer as working hypothesis vs. established premise" and "Citation-comparison evidence scope") with their scope qualifications preserved verbatim. This is the grounding working as designed: the discover phase did not re-litigate these caveats, and the artifact carries them forward to DECIDE with the appropriate epistemic framing. No additional grounding action is warranted on these two inherited targets.
