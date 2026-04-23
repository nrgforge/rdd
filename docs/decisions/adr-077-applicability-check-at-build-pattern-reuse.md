# ADR-077: Applicability Check at BUILD Pattern Reuse

**Status:** Proposed

## Context

Issue #13 documents a working code pattern reused in a new context where a key assumption did not hold; the failure was silent because the pattern's prior success suppressed doubt. Essay 015 §4 names the cognitive mechanism as the **Einstellung effect** (Bilalic, McLeod & Gobet 2008): once a familiar pattern activates, it does not merely compete with alternatives — it actively inhibits attention to features that would reveal its inapplicability. Bilalic et al.'s eye-tracking evidence shows experts who *verbally reported* searching for better solutions were, in their actual eye movements, continuing to attend only to features consistent with the already-activated solution. This is not satisficing (Simon 1956): it is **attentional suppression**, and additional review under the same activated frame does not catch what the frame excludes.

ADR-075 (preservation scenarios) and ADR-076 (fitness criteria decomposition) address the structural layer in DECIDE and ARCHITECT. They are first-line defenses because they are mechanically anchored. The cognitive layer — the moment in BUILD when the pattern is being applied — needs its own anchor because the structural mechanisms upstream cannot, by themselves, prevent attentional suppression at the application site.

The literature converges on **schema comparison** (Gentner, Loewenstein & Thompson 2003) as the best-evidenced intervention: requiring explicit comparison between the source case and at least one structural alternative forces the kind of structural mapping that spontaneous reuse bypasses. This is the cognitive mechanism the applicability check operationalizes.

The methodology's position (essay 015 §10): cognitive-mechanism interventions are **second-line defense** — worth building because they address the causal root, but not the layer to rely on alone. They operate conversationally and cannot be mechanically enforced to the same standard as artifact checks or hook predicates. This ADR specifies the second-line intervention; ADR-075 and ADR-076 carry the first-line structural load.

The domain-model concept **Applicability Check** was added in Amendment 19. This ADR specifies when and how it fires.

## Decision

The BUILD skill (and `/rdd-refactor` when extending existing patterns) gains an **applicability check** as a stewardship-checkpoint trigger that fires when code is being **extended by analogy** — when an existing pattern is being adapted to a new context.

**Trigger conditions:**

The **operative** trigger (the one the methodology can rely on at current substrate):

- The developer (or agent) explicitly references an existing pattern as the template ("we'll do this the way we did X"). This is conversational (Tier 2 per ADR-058); the trigger fires when the reference is recognized in the build conversation.

The following triggers are **aspirational** — they describe the broader detection space the methodology would benefit from but cannot currently implement reliably. They are listed so the scope-of-claim is honest, not as substrate the BUILD skill currently has:

- *(Aspirational.)* The new code is structurally similar to existing code in the same file/module/package, with parameters or types swapped. Requires automated structural-similarity detection that is not in the codebase. May be added in a future cycle (e.g., AST-based similarity heuristic).
- *(Aspirational.)* BUILD's existing stewardship checks flag a copy-shape with localized modifications. ADR-071's stewardship extensions added Lifecycle Composition checks but did not add copy-shape detection; this trigger has no current substrate. May be added in a future cycle by extending ADR-071 or filing a new ADR.

When the aspirational triggers are eventually implemented, the operative-trigger list expands; until then, the methodology relies on conversational recognition. This is the honest scope-of-claim per ADR-069 — the cognitive layer (Tier 2) operates with reduced reliability, and naming triggers that don't exist would create a reliability expectation the implementation cannot meet.

**The check itself** is a stewardship-checkpoint prompt — surfaced in the build conversation, not a hook block:

> *Pattern reuse detected. The pattern works in [original context]. Before applying it to [new context]:*
>
> *1. What is one structural alternative to this pattern? (A different approach, not a refinement of this one.)*
> *2. What's different about [new context] that might make this pattern wrong?*
> *3. Which assumptions of [original context] are you carrying forward — and which of those hold in [new context]?*
> *4. Which fitness properties does `system-design.md` declare for the affected module(s) (per ADR-076)? Does the candidate pattern satisfy each, or is satisfaction unverified?*

The four prompts are not a checklist to recite. They are the question forms the agent composes from the specific pattern, original context, and new context. The agent fills the bracketed slots with the actual content of the moment. **Prompt 4 is the integration point with ADR-076's fitness-property decomposition** — it makes the ARCHITECT-time decomposition load-bearing at the BUILD pattern-reuse moment by requiring the candidate pattern to be evaluated against the declared fitness properties for the module(s) it touches. When `system-design.md` declares no fitness properties for the affected module, prompt 4 is recorded as "no declared fitness properties for this module" — the absence is itself the recorded judgment, and ADR-076's gate check (which would have surfaced undecomposed claims at ARCHITECT time) becomes the audit trail for whether that absence is appropriate.

**The user's response is the load-bearing artifact.** The user articulates the alternative, names the differences, and identifies which assumptions hold and which do not. The agent does not generate the alternative; it asks the user to. (This follows ADR-055's belief-mapping principle: the question form is the structural intervention; the user's substantive response is the evidence.)

**When the response surfaces a genuine concern,** the build pauses. The developer evaluates whether the pattern still applies; if not, the alternative becomes the implementation candidate (and the original pattern becomes prior art rather than template). When the response confirms applicability with explicit reasoning, the build proceeds with the reasoning recorded in the build session log.

**When the prompts cannot be answered substantively** — the alternative cannot be named, the differences cannot be articulated, the assumption check is deflected — the agent does not advance. The block is conversational (Tier 2 mechanism, ADR-058 boundary), not structural; the agent surfaces the gap and offers grounding actions (consult the original pattern's ADR provenance, run a quick spike, defer the decision and revisit). The decision to proceed without resolving the gap is recorded visibly so the next susceptibility snapshot can register it.

## Rejected alternatives

**Make the applicability check a generic checklist applied to every commit.** Rejected. Generic checklists do not target assumption-level questions about the *specific pattern being applied* — the literature is clear that checklists detached from the analogical structure do not engage the Einstellung mechanism. The check must reference the specific pattern, original context, and new context to force the structural mapping; this is the Gentner et al. 2003 finding.

**Require a written justification artifact for every pattern reuse.** Rejected as overhead-heavy and prone to ceremonialization. Issue #13's Compounding-factor section warns that "review correctly identified the breaking change but framed it as a downstream update task" — written justifications produced under reuse pressure tend to confirm the pattern (the Einstellung dynamic operating at the documentation layer). The conversational form keeps the question live; the build-session log captures what was reasoned through.

**Make the check a hook block that prevents commits when triggered.** Rejected. The trigger conditions involve semantic detection that lexical hook patterns cannot reliably perform. A false-positive block on every code-similarity match would train the user to bypass; a false-negative miss recreates the gap. The Tier 2 conversational form is appropriate for the cognitive layer — ADR-058 explicitly establishes that conversational mechanisms operate in the agent's susceptibility zone and must accept reduced reliability.

**Replace the applicability check with a pre-mortem prompt** (Klein 2007: "Assume this reused pattern caused a regression that passed code review. What assumption of the original context doesn't hold here?"). Considered and partially adopted: the pre-mortem question is one of the three forms the agent may compose. Klein's research found a 30% improvement in failure-reason *identification*, but whether improved identification translates to fewer undetected failures at the pattern-application stage is not empirically established in software-engineering contexts. Schema comparison (Gentner et al. 2003) has stronger ecological validity for the analogical-transfer setting; the pre-mortem is a complementary form rather than a substitute.

**Skip the cognitive layer entirely; rely on ADR-075 + ADR-076 alone.** Rejected. The structural defenses are first-line and mechanically anchored, but they fire at DECIDE and ARCHITECT — upstream of the BUILD moment when the pattern is being applied. Essay 015 §4 documents that the three-review-point failure happened *despite* the relevant information being in the artifact trail; structural defenses cannot prevent attentional suppression at the application site if no prompt fires there. The cognitive layer is second-line because it is enforcement-weaker, not because it is dispensable. Prompt 4 of the applicability check explicitly consumes ADR-076's fitness-property output, making the ARCHITECT-time decomposition load-bearing at the BUILD reuse moment — the three ADRs (075, 076, 077) form an **integrated** defense via prompt 4's fitness-property consultation, not merely sequential phase coverage.

## Consequences

**Positive:**

- Closes the BUILD-phase share of the Issue #13 failure: pattern reuse now triggers a question that addresses the Einstellung mechanism at the application moment.
- Operationalizes Gentner et al. 2003 schema-comparison: the "name one structural alternative" prompt forces structural mapping at the moment spontaneous reuse would bypass it.
- Composes with ADR-055 (belief-mapping operationalization): the user's response is the structural anchor, not the agent's restatement of the question.
- Compatible with the existing stewardship-checkpoint substrate — the check is added to BUILD's conversation flow, not a new substrate.
- Honest about its layer: the ADR explicitly classifies the check as Tier 2 (conversational) per ADR-058, with reduced enforceability relative to structural mechanisms. The unassessable-risk fallback (offer grounding actions; record the decision visibly) follows ADR-068's Grounding Reframe extension.

**Negative:**

- The check operates inside the conversation where the agent's susceptibility may be in play. An agent under task immersion may compose a perfunctory version of the prompt or accept thin user responses. This is the Tier 2 limit Cycle 10 documented; the methodology does not over-claim.
- Trigger detection is heuristic. False positives (the prompt fires on coincidental similarity) create friction; false negatives (genuinely analogical reuse goes undetected) recreate the gap. The semantic-detection limitation is acknowledged; ADR-075 and ADR-076 carry the structural load that does not depend on trigger detection.
- The "no substantive answer" pause is conversational and the user can override. The override is recorded for the susceptibility snapshot; this records the gap rather than closing it.
- Pattern-reuse-heavy refactoring sessions may experience the prompt frequently. Mitigated by allowing batched application — the prompt may name multiple analogous reuses in a single check rather than firing per file — when the developer signals upfront that a coherent batch is being processed.

**Neutral:**

- Wholly novel implementation (no analogical reuse) carries no overhead — the trigger does not fire.
- The build-session log already records reasoning; the check's outputs land there without new tooling.

## Provenance check

The core framing — applicability check at BUILD pattern-reuse moments, operationalized as a stewardship-checkpoint prompt — derives from Issue #13 (user-authored) §"Possible process improvements" item 1 and essay 015 §4 ("BUILD: add an applicability check at the point of pattern reuse") and §10. The Einstellung mechanism (Bilalic et al. 2008), schema comparison (Gentner et al. 2003), and pre-mortem (Klein 2007) are all essay-grounded. The Applicability Check concept is in the domain model from Amendment 19. Driver-derived.

The three-prompt form (one alternative / what's different / which assumptions carry forward) is drafting-time synthesis composed against the schema-comparison literature (Gentner et al. 2003 calls for structural mapping) and the assumption-level question structure from Issue #13's body. The "user's response is load-bearing" principle follows ADR-055's belief-mapping operationalization.

The classification as Tier 2 (conversational) follows ADR-058's two-tier sycophancy resistance taxonomy. The Grounding Reframe fallback when prompts cannot be answered follows ADR-068's extension of ADR-059. Driver-derived from prior ADRs.

The trigger conditions were drafted as a three-item list (explicit reference / structural similarity / stewardship flag). The susceptibility snapshot at the architect → build boundary identified that the second and third items reference automated detection capabilities that don't exist in the codebase — ADR-071 contains no copy-shape detection, and no AST-based similarity heuristic is implemented. Per the user's grounding-reframe response, the trigger list was revised to mark the operative trigger (explicit reference, conversational) and explicitly classify the other two as aspirational future capability. The honest scope-of-claim follows ADR-069.

The "batched application" affordance is drafting-time synthesis added to mitigate the operational concern about per-file friction; it preserves the schema-comparison structural intervention while reducing ceremonial-recitation pressure.
