# Research Design Review: Cycle 017 — Re-Audit (R2)

**Reviewed question set:** `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md` — Steps 1.1, 1.2, and 1.4 (Q1–Q6 plus the `system-design.md` constraint-removal response and thread-the-needle field evidence), evaluated as one artifact.
**Constraint-removal response included:** Yes
**Prior report:** `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/research-design-review-017.md`
**Date:** 2026-04-24

---

## Summary

- **Questions reviewed:** 6 (Q1–Q6) plus constraint-removal response and thread-the-needle field evidence
- **Flags raised:** 5 (0 P1 blocking, 3 P2 non-blocking, 2 P3 observations)
- **Criteria applied:** 1–4 (ADR-082 full set)

The P1 blocking issue from the first review — incongruity not examined (artifact-form mismatch) — is **resolved**. Q5 directly surfaces the artifact-form thesis and connects it to the rest of the question set. No new P1 issues are raised. Three non-blocking concerns are introduced or persist from the first review; two observations are carried forward. The revised set is well enough formed to proceed to the research loop, subject to the P2 items being held in awareness.

---

## Resolved from First Review

### P1 (Incongruity Surfacing): Resolved

**Status:** Resolved from first review.

Q5 directly names the incongruity the first review flagged: the visual structural representation already satisfies the human-technical-stakeholder orientation need, and the question asks what that implies for artifact-form decisions — whether visual representations should be a primary artifact type, whether the human-reader and AI-agent audiences need separate artifact forms, and how prose-restructuring concerns in Q2–Q4 relate. The question does not presuppose the answer; it holds the incongruity open as a thesis to examine. This closes the P1 flag cleanly.

### P2 #1 (Human-vs-Agent Axis Underspecified): Resolved via Q5 + Q6

**Status:** Resolved from first review.

The human-vs-agent design axis, previously listed symmetrically as one of four audiences in Q2, is now explicitly centered in Q5 (do the two audiences need separate artifact forms?) and Q6 (should primarily-agent-facing documentation be scoped to a dedicated subdirectory?). The first review's recommendation to add a sub-question or amend Q2 is satisfied by the two-question coverage. Q2 itself is unchanged, but the axis is no longer underweighted in the question set as a whole.

---

## P1: Blocking Issues

**None.** No blocking issues are raised against the revised question set (Q1–Q6 plus constraint-removal response and thread-the-needle field evidence).

---

## P2: Non-Blocking Concerns

### P2-A: Q6 Embeds a Destination-Presupposition in Its Opening Frame

**Status:** New in this review.
**Criterion:** Embedded Conclusions (ADR-082 Criterion 2).

**The issue.** Q6 opens: "Should primarily-agent-facing documentation be scoped to a dedicated subdirectory (e.g., `.rdd/` or similar)?" The parenthetical `(e.g., .rdd/ or similar)` is doing real work that the `e.g.` cannot fully neutralize. It names `.rdd/` — a concrete existing directory in the RDD corpus — as the default candidate for the proposed dedicated subdirectory. This is not purely illustrative: `.rdd/` is the directory Driving Concern 3 identifies as the target for relocating `housekeeping/` and session docs to make process-vs-product structurally legible. Using it as the example for an agent-facing subdirectory silently imports Driving Concern 3's solution-in-progress as the candidate answer to a question whose question is whether such a directory should exist at all.

The deeper presupposition the example activates: if the research loop reader arrives at Q6 with `.rdd/` as the salient candidate, they are more likely to examine how agent-facing artifacts would live inside `.rdd/` than to ask whether a dedicated agent-context directory is the right structural move relative to alternatives (e.g., in-file audience tagging, per-artifact YAML frontmatter flags, restructuring artifact content rather than relocating whole files). The `e.g.` gestures at openness; the specific candidate pre-loads the solution space.

A second, narrower version of the same presupposition appears in Q6's subpart (a): "how the human-vs-agent audience axis relates to existing organization axes — Q3's process-vs-product, ADR-070's centered-vs-infrastructure — same axis differently named, related-but-distinct axes that compose, or competing axes the cycle must reconcile?" This enumeration is well-formed for three of the options. But the question does not include the option that the human-vs-agent axis should become the *primary* axis and the others should be re-examined against it. Given that the constraint-removal response established the human-vs-agent distinction as the structurally primary finding, the omission is mild but worth naming.

**Suggested reformulation for Q6's opening:**

> Should primarily-agent-facing documentation be separated from human-facing documentation at the organizational level — and if so, by what mechanism (dedicated subdirectory, in-file structuring, artifact splitting, frontmatter tagging, or other)? In support of that decision, examine: (a) how the human-vs-agent audience axis relates to existing organization axes — Q3's process-vs-product, ADR-070's centered-vs-infrastructure — including whether the human-vs-agent axis is a distinct primary axis or a specialization of an existing one; (b) whether "primarily agent-facing" is a tractable classification given that some artifacts are mixed-audience at the section level per the constraint-removal — does separation require splitting artifacts first; (c) what classification strategies from documentation taxonomies survive both graduation and ongoing reorganization without producing dangling references or audience-mismatched reading paths.

This reformulation opens the solution space (mechanism is not presumed to be a subdirectory), includes the option that the human-vs-agent axis may be primary rather than co-equal, and preserves all of Q6's substantive inquiry.

**Severity:** Non-blocking. The current Q6 wording does not foreclose the right answer; a careful research loop will likely examine alternatives. But naming `.rdd/` as the `e.g.` will produce a gravitational pull toward that solution that the question's framing does not account for. The reformulation above is recommended for adoption before the lit-review dispatch.

---

### P2-B: Thread-the-Needle Field Evidence Holds the Candidate Diagnosis Cleanly — but the Connection to Q5+Q6 Creates a Directional Pull

**Status:** New in this review.
**Criterion:** Embedded Conclusions (ADR-082 Criterion 2) / Premature Narrowing (ADR-082 Criterion 3).

**The issue.** The research log (Step 1.4) records the thread-the-needle field evidence carefully:

> "Recorded as a candidate diagnosis, not yet confirmed mechanism: the 'thread the needle' approach may itself be the source of the readability friction external stakeholders are reporting."

This is correctly hedged. The concern is not with the hedging, which is honest. The concern is structural: the field evidence is embedded at the end of Step 1.4, immediately before the presentation of Q5 and Q6, and the framing that connects them is:

> "This connects directly to Q5 (artifact form) and Q6 (location/scoping) — both questions become the cycle's instrument for examining whether the threaded-needle approach is sustainable for the audiences in play."

That framing is technically accurate but produces a directional pull. Q5 and Q6 become "instruments for examining whether the threaded-needle approach is sustainable" — which orients the research toward *evaluating* the threaded-needle approach. This is different from the prior framing of Q5 and Q6 as open questions about what form and scoping serve each audience. The first framing is neutral (what form serves each audience?); the second framing tilts toward a verdict (is threaded-needle sustainable?). The tilt is mild — "sustainable" is not the same as "failing" — but the directional pull is real: a research loop briefed on Q5 as an instrument for evaluating threaded-needle will look for evidence bearing on threaded-needle, not for alternative diagnoses that threaded-needle's failure mode is itself the result of a different root cause (e.g., the problem is not "one artifact for two audiences" but "the agent-context material uses prose when diagrams suffice for humans and structured data would serve agents better, regardless of whether they share an artifact").

The field evidence framing does not presuppose its answer — the hedge is genuine. But the transitional sentence connecting the evidence to Q5+Q6 narrows the research direction more than the hedge intends.

**Recommendation.** The research loop should be explicitly briefed to treat the thread-the-needle candidate diagnosis as one of several competing hypotheses for the readability friction, not as the framing within which Q5 and Q6 operate. The competing hypotheses recorded elsewhere in the research log (front-loading of density, volume, audience conflation at the content level rather than the artifact level) remain viable and should be treated symmetrically. This briefing is appropriate at Step 1.5 and does not require revising the research log text.

**Severity:** Non-blocking. The hedge is honest, the framing is recoverable in the research loop, and the question set does not embed a conclusion in the disqualifying sense. The concern is that the connecting framing will inadvertently narrow the research scope without the cycle noticing.

---

### P2-C: Q2's Research-Direction Tilt Toward Density-Ordering Persists — Partially Addressed by Q5, Not Fully Resolved

**Status:** Persists from first review (downgraded from P2 to lower-severity P2; Q5 partially offsets).
**Criterion:** Embedded Conclusions (ADR-082 Criterion 2).

**The issue.** The first review flagged that Q2's time-granularity scaffold (30 seconds / 5 minutes / 30 minutes) directs lit-review resources toward density-ordering and progressive-disclosure literature while the constraint-removal more strongly supports audience-conflation as the mechanism. The user addressed this by adding Q5, which directly centers the audience-conflation and artifact-form thesis. Q5's presence means the research loop now has an explicit question pointing at the audience-conflation mechanism — the lit-review on Q5 will produce findings the Q2 lit-review might not.

The tilt in Q2 is therefore partially addressed: Q5 covers the territory Q2's framing underweights. However, the concern is not fully resolved because Q2 and Q5 will likely be dispatched as separate lit-review searches on their own question texts. A researcher who receives Q2's findings will receive findings about cognitive load, progressive disclosure, and first-encounter design without receiving Q5's findings about dual-audience artifact forms. If Q2's findings are used in isolation (e.g., to brief a specific writing-and-organization change to a Tier-2 document), they will carry the density-ordering tilt without correction.

The first review's P2 recommendation was: "Brief the research loop explicitly to treat density-ordering and audience-conflation as co-equal candidate mechanisms." That briefing remains the appropriate resolution, and Q5's addition does not substitute for it. The recommendation stands unchanged.

**Severity:** Non-blocking, lower severity than at first review because Q5 exists. The briefing at Step 1.5 should explicitly note that Q2's findings should be read alongside Q5's findings as co-equal diagnostics, not applied independently.

---

## P3: Observations

### P3-A: Q6's Literature Candidates Import a Framing the Cycle Has Not Examined

**Status:** New in this review.
**Criterion:** Provenance check on intellectual sources.

**The observation.** Q6's subpart (c) names "documentation taxonomies (Diátaxis, JIT/multi-audience technical writing)" as candidate literature for classification strategies. Both are well-regarded; neither is a mismatch for the question's substance. The flag is narrower: Diátaxis (Procida 2021) is a documentation organization framework built around four documentation types (tutorials, how-to guides, reference material, explanation) — and the framework's design assumption is that artifacts should serve one documentation type, not mixed purposes. This is directly congruent with Q6's hypothesis that threaded-needle (one artifact, two audiences) may be the problem. The risk is that Diátaxis arrives at the question with a prior verdict already embedded in its taxonomy: mixing documentation types is a classification error. A research loop that treats Diátaxis as authoritative literature for Q6 may conclude that the corpus should be restructured on Diátaxis principles without examining whether Diátaxis's four-type taxonomy maps coherently onto RDD's human-vs-agent distinction (it does not obviously map — agents don't read tutorials or explanations in the same sense; the agent-facing material in `system-design.md` is closer to structured reference data than to any Diátaxis type).

The cycle should treat Diátaxis as one candidate framework, note that its type-separation principle is congruent with Q6's hypothesis (making it a partial source of confirmation bias), and actively seek alternative frameworks that take a different position — for instance, literature on "layered documentation" or single-sourcing approaches where one document serves multiple audiences through progressive disclosure or conditional content.

**Action required:** None before the research loop runs. This observation should be passed to the lit-review dispatch for Q6 so the researcher treats Diátaxis's congruence with the question's hypothesis as a reason for additional scrutiny, not as independent corroboration.

---

### P3-B: The "Feel Better" Purpose Statement and the Unifying-Frame Hypothesis Remain Untested

**Status:** Persists from first review (unchanged; carried as observation).
**Criterion:** Testability of the cycle's purpose statement (ADR-069).

**The observation.** The first review flagged that the cycle's "making the human experience feel better" purpose statement is too soft for gate-time evaluation, and that no question tests whether the five driving concerns share a mechanism (the unifying frame: "corpus and turn-structure optimized for production discipline; this cycle shifts toward readerly and interactional usability"). The addition of Q5 and Q6 does not address either observation — both remain open.

The unifying-frame hypothesis is held correctly in the cycle-status ("to be tested in RESEARCH") and the research log is explicit that it is not taken as given. Q5's addition is the strongest current implicit test of the unifying frame — if the artifact-form mismatch thesis (Q5) is confirmed, it suggests a mechanism distinct from "production-discipline optimization" (the diagnosis would be "audience-conflation at design time" rather than "optimization for a different goal"). But no question explicitly asks whether the five driving concerns share a mechanism and what that mechanism is. This remains a gap in the question set's scope.

**Action required:** None before the research loop. At DECIDE, the user should articulate a testable version of "feel better" against which research findings can be evaluated for in-scope methodology changes. The first review offered a candidate: "Tier-2 documents should satisfy the human-stakeholder orientation need without requiring AI-mediated summarization as a reading prosthetic." That formulation remains available and consistent with the user's normative distinction (AI as reading prosthetic vs. AI as code-context builder). Additionally, the research loop should be asked, at synthesis time, to assess whether the findings across Q1–Q6 support or challenge the unifying frame as a single mechanism.

---

## Question Set Assessment

### Per-Question Review (Revised Questions Only — Q1–Q4 Unchanged from First Review)

#### Q5: "When a visual structural representation already satisfies the human-technical-stakeholder orientation need better than prose, what does that imply for artifact-form decisions across the corpus?..."

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the visual representation's superiority is a finding about the *current* artifact state rather than an artifact of the external stakeholder's reading context. A different question would be more productive if the finding is not "diagrams work better than prose for orientation" but "external stakeholders in handoff contexts prefer diagrams because they are time-pressured and prose-dense docs signal a time cost they cannot afford in that moment." Under that belief, the diagnosis shifts from form-mismatch to *context-mismatch*: the document is appropriate for readers who will actually use it as reference material, but the first-encounter handoff context is a different reading task than the ongoing-reference task the document is built for. The question that would be more productive under that belief: "Does the orientation failure occur because the artifact form is wrong, or because the reading context (initial handoff) calls for a different artifact than the ongoing-reference artifact being offered?"

Q5 is currently scoped to "what does it imply for artifact-form decisions" — it does not include the context-mismatch alternative. The research loop should be aware that the form-mismatch and context-mismatch hypotheses make different predictions about what the right intervention is: form-mismatch predicts that restructuring the artifact fixes the problem; context-mismatch predicts that adding a *separate, context-appropriate artifact* (an onboarding brief, a visual-only summary) for the initial handoff moment would fix it without changing the reference artifact.

**Embedded conclusions.** Mild flag. The opening premise "when a visual structural representation already satisfies the human-technical-stakeholder orientation need better than prose" is doing significant work. It treats the constraint-removal response's finding ("the diagram carries the value") as established prior art rather than as a hypothesis to examine. The user's instinct is plausible and the constraint-removal response does support it — but it is a single-person, single-artifact impression, not a researched finding. Q5 would be more robust if it held the premise as a hypothesis: "If visual structural representations satisfy the orientation need better than prose for human technical stakeholders, what would that imply for artifact-form decisions?" The `if` version preserves the premise's tractability while preventing the research loop from treating it as already confirmed. The current phrasing risks treating a hypothesis as a datum.

**Scope.** Appropriate overall. Well-structured compound question with distinguishable sub-theses.

---

#### Q6: "Should primarily-agent-facing documentation be scoped to a dedicated subdirectory (e.g., `.rdd/` or similar)?..."

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that organizational location (subdirectory) is the primary lever for solving the audience-mismatch problem. A different question would be more productive if the primary lever is artifact *content* structure rather than location — if the right answer is that `system-design.md` should be restructured so that the diagram and human-readable orientation material appear as a separable top-layer while agent-context material is in a clearly demarcated lower section (or a machine-readable companion file), without moving any artifact to a different directory. Under that belief, the question about subdirectory scoping addresses a secondary concern (folder hygiene / VCS exclusion of agent-context material) while the primary concern (mixed-audience artifacts producing readability friction) is solved at the content-structure level.

Q6's subpart (b) partially surfaces this: "whether 'primarily agent-facing' is a tractable classification given that some artifacts are mixed-audience at the section level." This is the right question to ask. The belief-mapping observation is that subpart (b) implies the answer to Q6's opening question may be "no — you cannot scope primarily-agent-facing artifacts to a directory without first splitting them, which means the splitting decision is prior to the directory decision." That ordering implication deserves to be explicit in Q6: the directory question may be premature until the artifact-splitting question (Q5's domain) has a provisional answer.

**Embedded conclusions.** See P2-A above — the `.rdd/` example. Additionally, the question asks "Should primarily-agent-facing documentation be scoped to a dedicated subdirectory?" — which presupposes that a "primarily agent-facing" classification is tractable and that the result of Q5's artifact-form examination will be the production of a class of artifacts that are primarily agent-facing. This is a plausible outcome of the research, but Q5 may also conclude that artifacts cannot be cleanly partitioned along human-vs-agent lines (they may need to serve both audiences by design, with structural layering rather than separation). Q6's framing takes the separability conclusion as a premise.

**Scope.** Appropriate for the folder-hygiene thread. Potentially sequence-dependent on Q5 in ways the question does not acknowledge.

---

### Premature Narrowing / Prior-Art Treatment

**Prior-art treatment:** Satisfied. The constraint-removal response treats `system-design.md` as prior art (not a constraint). Q3 treats ADR-070's placement decision as revisable prior art. Q6's subpart (a) explicitly treats ADR-070's centered-vs-infrastructure axis as an object of examination rather than a ground truth. No regression on this criterion.

**Premature narrowing.** One instance worth naming. Q5 and Q6 are both downstream of the constraint-removal response's finding that the diagram carries the value in `system-design.md`. That finding is a single informant's single-artifact impression. Both Q5 and Q6 treat it as a sufficiently established premise to scaffold a research direction — Q5 asks what it implies for artifact-form decisions, Q6 asks what the organizational consequence should be. If the lit-review on Q5 does not confirm the premise (if the research finds that diagrams are not reliably superior to well-structured prose for first-encounter technical orientation), the scaffolding for both Q5 and Q6 shifts. The research loop should explicitly check the premise as a hypothesis, not build entirely on top of it. This is the same concern noted in Q5's embedded-conclusions flag above; naming it at the question-set level makes the risk visible.

**No new disqualifying premature narrowing** beyond the above. The question set explores distinguishably different problem threads (Q1: nomenclature, Q2: cognitive legibility, Q3: process-product structure, Q4: turn-structure, Q5: artifact form, Q6: organizational scoping) without assuming all threads share the same architectural approach.

---

### Incongruity Surfacing

**First-review incongruity (artifact-form mismatch vs. prose-restructuring):** Resolved. Q5 directly surfaces it.

**New incongruity visible in the revised context:** One adjacency worth naming, though it does not rise to P1 status.

Q6's subpart (a) asks how the human-vs-agent axis relates to ADR-070's centered-vs-infrastructure axis. ADR-070 uses the centered-vs-infrastructure framing to distinguish artifacts designed to be read by users from artifacts that underpin framework operation. The agent's role in ADR-070's taxonomy is as a *producer* of infrastructure artifacts (dispatch logs, audit reports) and as a *reader* of centered artifacts (essays, ADRs). The agent is not classified as a separate readership with distinct documentation needs — ADR-070's framing does not distinguish between "artifacts the agent reads for comprehension" and "artifacts designed as machine-readable structured context for agent use." The human-vs-agent axis Q5 and Q6 are examining may be a refinement *inside* the centered-vs-infrastructure framing's existing "centered" category rather than a distinct axis at the same level. If so, the cycle may be creating organizational complexity (a new directory, a new classification axis) for a distinction that ADR-070 already handles at a coarser level. The question this adjacency surfaces: is "primarily agent-facing" a genuinely novel organization axis, or is it a sub-classification within "centered artifacts" that can be handled without a new structural layer?

This adjacency is not blocking, but it should be examined in Q6's research.

---

### Coverage Gaps in the Revised Set

**Q5 and Q6 sequence dependency is not surfaced.** Q6 asks whether primarily-agent-facing documentation should be scoped to a dedicated subdirectory; Q5 may conclude that the artifact-level split is the right intervention (separate artifacts for the two audiences). If Q5 concludes that the artifact-form solution is splitting, Q6's directory-scoping question is answered in part by Q5's answer. Conversely, if Q5 concludes that visual-first restructuring (not splitting) is the right form intervention, the class of "primarily-agent-facing artifacts" that Q6 would scope to a directory may not exist as a category. The sequence dependency is not a gap in the question set per se — both questions are needed — but the research loop should be briefed to treat Q5's findings as potentially prior to Q6's, not as parallel independent inquiries.

**Q3 and Q6 intersection is not marked.** Both Q3 (process-vs-product) and Q6 (audience-based organizational scoping) produce recommendations about where artifacts live in the corpus. The two axes can conflict: a process artifact (e.g., an audit report) that is primarily agent-facing under Q6's axis might land in `.rdd/` under Q6's recommendation but in `housekeeping/` under Q3's recommendation. No question asks how the two organizational recommendations compose. This is a coordination concern that the research loop should surface at synthesis time even if neither question is revised.

**The five-concern unifying frame remains untested.** See P3-B above. No addition to the question set addresses this.

---

### Recommendations (Prioritized)

**Before the research loop runs:**

1. (P2-A) Revise Q6's opening to remove the `.rdd/` example and open the solution-mechanism space. The reformulation offered above preserves all of Q6's substantive inquiry while neutralizing the destination-presupposition. This is the only recommended text change to the question set.

**Before the lit-review dispatch (Step 1.5 briefing):**

2. (P2-B) Brief the research loop to treat the thread-the-needle candidate diagnosis as one of several competing hypotheses for the readability friction — symmetrically with density-ordering, volume, and context-mismatch hypotheses — rather than as the organizing frame for Q5 and Q6.

3. (P2-C) Brief the research loop to read Q2 findings and Q5 findings as co-equal diagnostics. If lit-review dispatches are made separately for Q2 and Q5, the synthesis step should explicitly require the two finding sets to be compared and checked for mechanism alignment.

4. (P2-A, narrower) Brief the research loop on Q5 to hold "diagrams satisfy the orientation need better than prose" as a hypothesis to be tested against literature — not as an established premise. The constraint-removal response supports the hypothesis; confirming or qualifying it is one of Q5's research tasks.

5. (P3-A) Brief the lit-review dispatch for Q6 to treat Diátaxis's type-separation principle as congruent with the cycle's hypothesis (a source of confirmation bias risk) and to actively seek literature that takes a different position on serving multiple audiences from a single document.

**Before the epistemic gate (DECIDE), not before the research loop:**

6. (P3-B) Articulate a testable form of the "feel better" purpose statement for use at the epistemic gate. The first review's candidate — "Tier-2 documents should satisfy the human-stakeholder orientation need without requiring AI-mediated summarization as a reading prosthetic" — remains available.

7. (P3-B) Ask the research loop, at synthesis time, to assess whether Q1–Q6 findings support or challenge the unifying frame ("corpus optimized for production discipline") as a single mechanism, or whether they support distinct mechanisms for distinct driving concerns.
