# Research Design Review: Cycle 017

**Reviewed question set:** `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md` — Steps 1.1 and 1.2 (Q1–Q4 plus the `system-design.md` constraint-removal response), evaluated as one artifact.
**Constraint-removal response included:** Yes
**Date:** 2026-04-24

---

## Summary

- **Questions reviewed:** 4 (Q1–Q4) plus constraint-removal response, evaluated together
- **Flags raised:** 5 (1 P1 blocking, 3 P2 non-blocking, 1 P3 observation)
- **Criteria applied:** 1–4 (ADR-082 full set)

No question contains a disqualifying embedded conclusion. The question set is largely need-framed. Prior-art treatment is satisfied by the constraint-removal response. The blocking issue is an incongruity in the research context that the question set does not examine and that is load-bearing for the cycle's diagnosis. The non-blocking concerns are: the human-vs-agent audience axis being underspecified as a design axis in Q2; the "feel better" purpose statement being too soft to be load-bearing at the epistemic gate; and a mild tilt in Q2's framing toward the density mechanism over the audience-conflation mechanism the constraint-removal itself surfaced.

---

## Per-Question Review

### Q1: "When work-package IDs, ADR numbers, axis labels, and invariant numbers appear in code, tests, or graduated documents, what failure modes does that create — and what alternative naming strategies preserve traceability without binding durable artifacts to corpus state?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the failure of nomenclature leakage is primarily a *naming* problem — solved by alternative naming strategies. A different question would be more productive if the failure is instead a *graduation* problem: RDD artifacts graduate into codebases, and the question is whether graduation ceremonies should strip corpus-internal references or whether the documents that receive them need a different contract with corpus identifiers. The question as written asks "what alternative naming strategies?" — which anchors the solution space to naming. If the right answer is "the graduation step should perform a reference-scrubbing pass," or "corpus IDs should be treated as hyperlinks rather than inline citations," the question misses both. The broader form: "What properties should the relationship between corpus-internal identifiers and durable artifacts have, and what mechanisms enforce that relationship at graduation?"

**Embedded conclusions.** None disqualifying. The question holds the solution space open enough ("what alternative naming strategies") while also asking about failure modes before proposing solutions. Appropriately structured.

**Scope.** Appropriate. The question is focused on an observable problem (leakage) and asks both for its failure modes and for alternative strategies — which is the right shape for a research question on a known-symptom issue.

---

### Q2: "What does a reader need in the first 30 seconds, 5 minutes, and 30 minutes of encountering a technical reference document — and how do those needs vary by audience (returning practitioner, new collaborator, external reviewer, agent re-orientation)?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that reader needs at each time granularity are the primary differentiating variable — i.e., that what readers need at 30 seconds vs. 30 minutes is the most useful frame for diagnosing the external stakeholder bounce problem. A different question would be more productive if the differentiating variable is not time-granularity but *audience separation*: the problem the constraint-removal surfaced is not that `system-design.md` fails readers at the 5-minute mark, but that it serves two audiences (human technical stakeholders and AI agents preparing to build) with one artifact shape, and the human audience experiences what is effectively agent-context material as noise or cognitive overhead. Under that belief, the more productive question would be: "When an artifact serves audiences with structurally different consumption patterns — a human seeking high-level orientation vs. an agent consuming dense context — what artifact shapes and separation strategies serve each audience, and what are the costs of conflating them?"

The time-granularity framing is real and useful. But as written, Q2 positions "agent re-orientation" as one audience item in a list of four, rather than centering the human-vs-agent split as a design axis. The constraint-removal response (Finding 1) explicitly identified this split as structurally distinct from the other audience variations — the agent audience wants comprehensive context; the human audience wants diagrams and orientation. Listing them symmetrically in Q2 risks treating a structurally significant distinction as just another audience variation.

**Embedded conclusions.** Mild flag. The time-granularity scaffold (30 seconds / 5 minutes / 30 minutes) is a useful heuristic but it is not a neutral research frame — it comes from UX and document-design practice and brings with it an assumption that the problem is legibility-over-time rather than audience-separation. The scaffold does not exclude the audience-separation finding, but it does de-emphasize it as an organizing axis.

The question does not presuppose its answer in the disqualifying sense (it asks "what does a reader need?" not "how do we reduce verbosity?"), so the flag is mild rather than blocking. The concern is that the time-granularity frame will draw lit-review resources toward cognitive-load and progressive-disclosure literature while the audience-separation finding sits underweighted in the research design.

**Scope.** Appropriate for the legibility thread. Underweighted for the audience-separation thread surfaced by the constraint-removal — see P2 flag below.

---

### Q3: "What separates process artifacts (audits, dispatch logs, gate notes, session docs) from product artifacts (essays, ADRs, system design) in terms of who reads them, how, and when — and what location/visibility strategies make that distinction structurally legible without burying still-useful process traces?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the process-vs-product distinction is primarily a *visibility and location* problem. A different question would be more productive if it is a *semantic* problem — if the real issue is that some process artifacts (e.g., research logs, argument audits) are also substantive research products that external readers may legitimately want to read, and the current classification creates a false binary. The question asks for location/visibility strategies that make the distinction "structurally legible without burying still-useful process traces" — which acknowledges the tension but does not foreground it as a design axis. If the answer is that the process/product binary should be abandoned in favor of a different taxonomy (e.g., "generated-during-cycle" vs. "graduated"), the question as written will not surface it.

The reference to ADR-070's `housekeeping/` decision in the cycle-status context is relevant here. ADR-070 placed `housekeeping/` at a hierarchically equivalent level to `essays/`, and the cycle is reconsidering this. Q3 is doing legitimate prior-art work in treating this as a revisable decision — the question asks what the right separation is, not how to implement ADR-070. This satisfies the prior-art criterion at the process/product thread.

**Embedded conclusions.** None flagged. The question appropriately asks what the distinction is before asking how to implement it.

**Scope.** Appropriate. The question is well-bounded around a concrete, observable problem.

---

### Q4: "When the agent has N items needing user attention in a single turn (clarifying questions + decision context + gate response), what response patterns serve comprehension — and what makes a 'wall of text' default hostile in ways that 'enumerate-then-walk-through' resolves (or doesn't)?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the "enumerate-then-walk-through" pattern is the correct candidate solution and the research task is to confirm or qualify it. A different question would be more productive if the enumerate-then-walk-through pattern is itself a proposed solution that needs to be tested against alternatives — for instance, single-item-per-turn chunking, structured templating, or explicit load-acknowledgment before content. The question names the candidate pattern in the question text, which partially forecloses the solution space.

The question also assumes that the wall-of-text failure is primarily a *structural ordering* problem (the items need to be enumerated before walking through). It may instead be a *volume* problem (too many items per turn regardless of ordering), a *scope* problem (agent is trying to handle too many concerns at once), or a *priority problem* (user cannot tell which item is most urgent). These alternative mechanisms are not surfaced.

**Embedded conclusions.** Mild flag. "What makes a 'wall of text' default hostile in ways that 'enumerate-then-walk-through' resolves (or doesn't)?" — the "or doesn't" is carrying significant weight here. It preserves formal openness, but the framing nonetheless anchors the research toward evaluating enumerate-then-walk-through rather than generating candidate patterns from first principles. This is a soft embedded conclusion: the solution candidate is named in the question rather than derived from the research.

Suggested reformulation: "When an agent has multiple items requiring user attention in a single turn, what response patterns serve comprehension — and what does the HCI and conversational-agent literature say about how multi-item response structure, chunking, and prioritization affect user cognitive load and decision quality?"

This opens the solution space while preserving the concrete failure mode as the motivating context.

**Scope.** Appropriate. The question is directly grounded in observable field evidence (the Stop-hook loop session, documented in cycle-status Feed-Forward Signals) and addresses a concrete interaction failure.

---

## Constraint-Removal Response Review

**Response substance.** Engaged. The user produced a content-bearing answer that distinguishes three audience-value regions within `system-design.md` (diagram / module descriptions / agent-context material), names the diagram as the load-bearing element for human-stakeholder orientation, and explicitly acknowledges that "a lot" of the artifact's current content serves AI agents rather than human readers. This is not a null answer or a performative "we would rebuild the same thing" response. The finding — that a single artifact currently serves two audiences with incompatible consumption patterns — is a genuine structural observation.

The response also surfaces a normative refinement: the user is not objecting to AI-mediated code construction (that role is legitimate) but to AI as a reading prosthetic for documents that look like they should be human-readable. This distinction is substantive and relevant to how Q2's research is scoped.

**Embedded conclusions in the response.** One mild instance. The response implicitly treats the current `system-design.md` artifact shape (one document, multiple audience regions) as the baseline to refine rather than examining whether the human and agent audiences should be served by separate artifacts entirely. The phrase "Without this human-level grounding, the user is faced with the code base to explore which isn't tenable" establishes that the function is real and needed — but it does not examine whether the function should live in a combined or separated artifact. The agent's recorded findings (Finding 4 in the research log) note this gap. The response, taken as prior art, treats the current shape as a constraint rather than as a candidate shape to evaluate alongside alternatives. This is the self-referential bind ADR-082's constraint-removal prompt is designed to open; the user partially engages with it (the diagram can be separated from the rest) but does not fully bracket the artifact's current shape.

This is mild: the response substantially advances the prior-art treatment criterion. The incomplete bracketing is noted rather than flagged as a design problem.

---

## Question Set Assessment

### Premature narrowing / prior-art treatment

**Prior-art treatment: satisfied by the constraint-removal response.** The response treats `system-design.md` as prior art — not as a constraint but as an artifact to be examined — and produces a substantive finding (audience-value partition). Q3 also treats ADR-070's `housekeeping/` placement as a revisable prior decision rather than as a constraint. The criterion is met.

**No disqualifying premature narrowing detected.** The question set does not assume the same architectural approach across all questions. Questions are scoped to different problem threads and do not all presuppose a single mechanism. Q2 is the closest to premature narrowing (see P2 flag), but the narrowing is mild enough to be non-blocking.

---

### Incongruity surfacing — P1 FLAG

**Criterion:** Incongruity surfacing (ADR-082 Criterion 4).

**The incongruity.** The research context (research log Step 1.1, field evidence; cycle-status Driving Concerns; constraint-removal response) contains an incongruity that the question set does not examine.

The constraint-removal response establishes that the load-bearing element of `system-design.md` for human technical stakeholders is the *diagram* — a visual representation of structural relationships. Module descriptions are hedged as "perhaps helpful." The rest is characterized as agent-context material. The user's instinct is that visual structural relationships are more effective for first-encounter orientation than dense prose.

Adjacent to this, Driving Concern 4 (verbosity) names the problem as "1500 words to say what could be 500 + a diagram." The unifying frame candidate ("corpus and turn-structure optimized for production discipline; this cycle shifts toward readerly and interactional usability") implies that the production-discipline optimization produced verbose, prose-dense artifacts.

Here is the incongruity: the user has already identified a *simple solution* to the external-stakeholder orientation problem — *the diagram* — that coexists with the complex solution being designed for the same problem — restructuring the prose document (Q2, Q3, and the verbosity thread). The cycle is proposing to investigate what readers need at 30 seconds / 5 minutes / 30 minutes, how to restructure Tier-2 documents, where to locate process vs. product artifacts, and how to reduce verbosity. But the user's own constraint-removal response identifies a mode of communication (visual structural diagram) that already satisfies the high-level orientation need better than prose restructuring.

The incongruity signal: a simple solution (the diagram already works; it carries the value) sits adjacent to a complex solution being designed (restructure the prose document's information architecture, apply progressive-disclosure principles, adjust location and visibility strategies). The question the set is not asking: **Is the complex prose-restructuring solution addressing the actual orientation problem, or is it addressing a different problem (the module-description and agent-context material) while the diagram already handles the part that matters?**

This is not a question with a predetermined answer. The complex solution may be correct — the diagram may need prose support, the verbosity thread may be real, and progressive-disclosure principles may apply to the non-diagram sections. But it may also be that the cycle's energy is concentrated on the complex solution (prose restructuring) while the simple solution (prioritize diagrams as a first-class artifact type across Tier-2 docs, strip or separate agent-context material) sits unexamined in the constraint-removal response.

The question the cycle is missing: *When the visual representation already satisfies the human-stakeholder orientation need better than the prose sections, does the problem diagnosis shift from "the document is not well-organized" to "the document form is mixed — the artifact type that serves the orientation need is a diagram, and the artifact type that serves the agent-context need is a structured text file — and the wrong form is being used for the wrong audience"?*

Without this question, the cycle may produce excellent findings on progressive-disclosure, information architecture, and process-vs-product visibility — and still miss that the root diagnosis is artifact-form mismatch rather than document-organization failure.

**Recommendation (P1):** Add a question to the set that directly examines the artifact-form thesis: do Tier-2 orientation documents serve their human-stakeholder audience better when they lead with (or primarily consist of) visual structural representations, and what does that imply for the artifact-form decisions across the cycle's five driving concerns? This question should run alongside — not instead of — Q2. It opens the possibility that the complex solutions being researched address a real but secondary problem.

---

### P2: Human-vs-agent audience axis underspecified in Q2

**Criterion:** Need-vs-artifact framing (ADR-082 Criterion 1) / additional consideration.

**The issue.** The constraint-removal response (Finding 1) identified the human-vs-agent audience split as a structurally distinct design axis for Tier-2 artifacts — not merely one variation among several audience types. Q2 lists "agent re-orientation" as one of four audiences in a symmetrical list: "returning practitioner, new collaborator, external reviewer, agent re-orientation." This treats the human-vs-agent split as one dimension among four, when the constraint-removal response establishes it as the primary structural division: human readers want diagrams and orientation; agents want dense, comprehensive context. The two audiences have fundamentally different artifact-consumption modes, not just different experience levels or positional contexts.

The cycle-status Stakeholder Grounding section (added after constraint-removal) explicitly flags this: "The cycle should not collapse the two; both are stakeholders, both have legitimate needs." The research log's agent-surfaced findings (Finding 6) name this as a gap in Q1–Q4.

The research-methods-reviewer instruction additionally asks for assessment of whether the human-vs-agent axis should be made explicit, subsumed under Q2, or left to the constraint-removal response as sufficient surfacing.

**Assessment.** The constraint-removal response surfaces the axis, but surfacing in the constraint-removal response and holding it as an active design axis in the research loop are different things. A lit-review dispatched on Q2 as written will focus on cognitive-load and progressive-disclosure literature (the time-granularity scaffold directs it there). That literature is genuinely relevant. But it will not naturally produce findings about artifact-form separation for dual-audience artifacts — that requires information architecture / content strategy literature that a different question would direct the researcher toward.

**Recommendation (P2, non-blocking).** Amend Q2 to make the human-vs-agent split an explicit design axis alongside the time-granularity scaffold — or add a targeted sub-question that directs the lit-review dispatch toward dual-audience artifact design. The constraint-removal response is not sufficient surfacing for the research loop; it establishes the finding, but the research loop needs to be aimed at it. One formulation: "When a document serves both human readers seeking high-level orientation and AI agents requiring comprehensive context, what artifact shapes or separation strategies serve each audience — and is a single artifact form capable of serving both without one audience experiencing the other's material as overhead?"

---

### P3: "Feel better" purpose statement is soft for gate-time evaluation

**Criterion:** Additional consideration (testability of the cycle's purpose statement).

**The issue.** The cycle's purpose is articulated as "making the human experience of working within the framework feel better, in line with the goal of preserving (not eroding) understanding." The research log records this as a preference statement and notes (correctly) that "feel better" as the cycle's purpose statement will be examined in the research loop and at the epistemic gate. This is honest scope-of-claim.

However, at gate time the epistemic gate will need a testable formulation of what "feel better" means in order to evaluate whether the research findings actually serve the cycle's purpose. ADR-069 (Methodology Scope-of-Claim) requires that readability claims be scoped honestly: "Readability is partly unassessable without reader feedback; the methodology provides structural aids, not guarantees of reader experience." The cycle's purpose as stated is a user-experience claim that the methodology cannot verify structurally.

This is not a blocking issue for the research loop — the research literature will produce findable claims about human cognitive needs, information architecture, and turn-structure patterns regardless of whether the purpose statement is testable. But at DECIDE, a testable version of the purpose will be needed to scope which findings warrant methodology changes and which are interesting but out of scope.

A testable form might be: "Tier-2 documents should satisfy the human-stakeholder orientation need without requiring AI-mediated summarization as a reading prosthetic." This is falsifiable in principle (a document either satisfies the orientation need directly or it does not), consistent with the user's normative refinement from the constraint-removal response (the objection is to AI as reading prosthetic, not to AI as code-context builder), and consistent with ADR-069's scope-of-claim discipline.

**Recommendation (P3, observation).** The purpose statement does not need to be sharpened before the research loop runs. The research log correctly holds it as an aspiration to examine rather than a constraint to enforce. The reviewer notes this as a pre-DECIDE concern: before the epistemic gate, the user should articulate a testable version of "feel better" that the research findings can be evaluated against. The formulation above is offered as a candidate, not a prescription.

---

### P2: Q2's framing may tilt toward density-ordering over audience-conflation

**Criterion:** Embedded conclusions (ADR-082 Criterion 2) / additional consideration.

**The issue.** The research log's Field Evidence records two user hypotheses: (1) front-loading of density, and (2) volume. The research log's constraint-removal findings (Finding 5) explicitly flag that the constraint-removal response does not support the density-ordering hypothesis — the user did not say "the top of `system-design.md` is too dense"; the user said "the diagram carries the value; the rest is mostly for agents." The research log correctly names these as distinct mechanisms.

Q2's time-granularity scaffold (30 seconds / 5 minutes / 30 minutes) is more directly compatible with the density-ordering hypothesis (the failure occurs at the 5-minute mark; the document should front-load orientation) than with the audience-conflation hypothesis (the document serves two audiences with incompatible consumption modes; restructuring the document's ordering doesn't solve the conflation problem). A lit-review dispatched on Q2 as written will return findings on progressive-disclosure, information architecture, and first-encounter cognitive load — which are the correct resources for the density-ordering hypothesis. They are a partial resource for the audience-conflation hypothesis at best.

This is a mild concern, not a disqualifying embedded conclusion. Q2 does not exclude the audience-conflation mechanism. But the scaffold directs research resources toward density-ordering literature while the constraint-removal response established audience conflation as the more strongly supported mechanism. The question set should actively direct the lit-review toward both mechanisms rather than structurally favoring one.

**Recommendation (P2, non-blocking).** The research loop should be briefed to treat density-ordering and audience-conflation as co-equal candidate mechanisms and to seek literature relevant to each. If the lit-review is dispatched on Q2 as written without explicit instruction to examine audience-conflation as a separate mechanism, the research may produce progressive-disclosure findings that partially address the wrong mechanism. This briefing can happen at Step 1.5 (research loop initiation) rather than requiring Q2 to be reformulated.

---

### Coverage gaps

**The five driving concerns share a candidate mechanism that no question names.** The unifying frame candidate ("corpus optimized for production discipline; this cycle shifts toward readerly usability") implies that a single mechanism (production-discipline optimization) is responsible for all five concerns. No question tests whether this unifying mechanism is correct or whether the five concerns have distinct mechanisms requiring distinct interventions. If the unifying frame is wrong — if some concerns stem from production-discipline optimization while others stem from audience conflation, and others from volume — the cycle's findings may produce interventions aimed at a unified mechanism that does not exist. The research loop should hold the unifying frame as a hypothesis to test, not a premise to build from. The cycle-status correctly marks the frame as "user-proposed, to be tested in RESEARCH," but no question in Q1–Q4 directly tests whether the five concerns share a mechanism. This is a coverage gap worth naming, though not blocking.

**Q4 does not examine whether the multi-item turn problem is agent-scoped or methodology-scoped.** The field evidence for Q4 (the Stop-hook loop session) was a specific failure mode involving a blocking enforcement mechanism creating repeated turns. This is a methodology-infrastructure failure, not a general turn-structure failure. Q4 asks the general question well, but the cycle's feed-forward signals suggest the concrete failure was enforcement-loop-specific. The research findings on HCI and conversational-agent turn structure may be correct but inapplicable to the specific failure mode unless the question explicitly scopes to enforcement-heavy multi-item turns.

---

### Recommendations (prioritized)

**P1 — add before research loop runs:**

1. Add a question examining the artifact-form thesis: whether the orientation function for human technical stakeholders is better served by visual structural representations as a primary (not supplementary) artifact type, and whether the complex prose-restructuring solutions being researched address a secondary problem while the primary diagnosis is artifact-form mismatch. This is the incongruity the question set is not examining.

**P2 — consider before dispatching lit-review:**

2. Amend Q2 or add a sub-question to make the human-vs-agent audience split an explicit design axis, directing the lit-review toward dual-audience artifact design literature alongside cognitive-load and progressive-disclosure literature.
3. Brief the research loop explicitly to treat density-ordering and audience-conflation as co-equal candidate mechanisms. If Q2 is not reformulated, this briefing is the minimum required to prevent the lit-review from inadvertently over-indexing on density-ordering.

**P3 — address before epistemic gate, not before research loop:**

4. Sharpen the "feel better" purpose statement into a testable form before the epistemic gate evaluation. The research loop can run on the current formulation; DECIDE and gate evaluation require a criterion against which findings can be assessed as in-scope or out-of-scope for methodology changes.
