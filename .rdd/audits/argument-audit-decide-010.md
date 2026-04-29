# Argument Audit Report

**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-043-code-review-utility-skill.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-044-two-review-operating-modes.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-045-questions-not-findings.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-046-review-build-integration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-047-collaborative-context-gathering.md`

**Evidence trail:** `/Users/nathangreen/Development/rdd/docs/essays/010-code-review-as-epistemic-practice.md`

**Date:** 2026-03-31

---

## Summary

- **Argument chains mapped:** 14
- **Issues found:** 9 (1 P1, 5 P2, 3 P3)

### Chains mapped

1. ADR-043: Review is epistemic not defect-focused (Essay 010, Bacchelli & Bird) → utility skill rather than pipeline phase → no durable artifact produced
2. ADR-043: Three stakeholder use cases span within-corpus and standalone contexts → must work in both → utility positioning rather than build-embedded
3. ADR-043: Stewardship checks serve architectural conformance; review serves epistemic understanding → these are distinct purposes → separate skill files
4. ADR-044: CRDM model shows orientation (~27%) is prerequisite for effective analysis → both modes need orientation → modes differ only in how orientation is sourced
5. ADR-044: RDD artifact trail exists in corpus-grounded context → leverage it rather than reconstruct → corpus-grounded mode reads ADRs, scenarios, domain model
6. ADR-044: No artifact trail in standalone context → must reconstruct orientation → context-reconstructive mode with collaborative gathering
7. ADR-045: Reviewer-as-passthrough anti-pattern — findings forwarded without engagement eliminate knowledge transfer → questions require reviewer to think → primary output is questions not findings
8. ADR-045: Value tension from discovery — pure question mode makes reviewer rediscover mechanical issues the agent already knows → mechanical findings as secondary output
9. ADR-045: Quantitative limits from SmartBear/Cisco → cognitive budget is finite → adaptive depth (zone of proximal development) matches question set to reviewer's time
10. ADR-046: Build stewardship checks (Tier 1/2) target architectural conformance; review targets epistemic understanding → complementary not duplicative → optional callout in build skill
11. ADR-046: Solo developer-researcher stakeholder needs to catch drift in AI-generated code → build integration supports this use case → corpus-grounded mode invocable during build
12. ADR-047: CRDM orientation phase essential but in context-reconstructive mode no artifacts exist → collaborative breadcrumb model — reviewer knows what is relevant, agent can fetch → five-step protocol
13. ADR-047: Fully automated discovery rejected → agent cannot determine relevance without reviewer's domain knowledge; reviewer's selection is itself epistemic → collaborative rather than automated
14. ADR-047: Reviewer-only gathering rejected → agent's synthesis accelerates orientation within zone of proximal development → agent synthesis with reviewer validation

---

## Issues

### P1 — Must Fix

---

**Issue P1-1: ADR-045 cites "Invariant 4" without any domain model reference being readable in these ADRs, and the essay does not mention Invariant 4**

- **Location:** ADR-045 Decision section, Rejected alternative: "Questions-only output (no mechanical findings)"
- **Claim:** "Mechanical issues are not judgment calls" and the rationale for the hybrid output model is grounded in "Invariant 4 — epistemic cost must be productive, not merely burdensome."
- **Evidence gap:** Essay 010 does not contain or reference Invariant 4. The essay does support the general principle — it says agent-generated questions should serve the reviewer's learning — but it does not articulate a named invariant about productive epistemic cost. ADR-045's decision to include mechanical findings as a secondary output is defensible on the essay's grounds (the agent's role is to free reviewer cognitive budget for judgment-heavy work, per the "Agent's Role" section), but the specific reasoning in the Rejected Alternatives section invokes a domain model invariant as the operative constraint without establishing that invariant through any reasoning visible in the essay or in these five ADRs. A reader auditing the ADR set cannot verify that Invariant 4 actually says what ADR-045 claims it says, nor that the essay grounds that invariant. The chain has a broken link: Essay 010 → domain model Invariant 4 → ADR-045, where the middle step is invisible.
- **Recommendation:** Either (a) quote the Invariant 4 text verbatim in the ADR-045 Context section and cite the domain model directly, or (b) derive the hybrid-output decision from the essay's own language — the "Agent's Role" section supports the same conclusion ("freeing the reviewer's cognitive budget for the judgment-heavy work that only humans can do") without requiring an external invariant. If domain model invariants are the operative grounding, the Context section should include the relevant excerpt so the chain can be verified without opening a separate file.

---

### P2 — Should Fix

---

**Issue P2-1: ADR-043 claims the skill's output is "ephemeral by design" but ADR-045 leaves open whether reviewer responses are captured**

- **Location:** ADR-043 Decision section, Rejected alternative: "Making code review a pipeline phase"; ADR-045 Consequences, Neutral section
- **Claim:** ADR-043 states that "pipeline phases produce durable artifacts — the review skill's output (questions for the reviewer's consideration) is ephemeral by design." ADR-045 Consequences (Neutral) states: "The reviewer's responses to questions are not captured as artifacts — they exist in conversation."
- **Evidence gap:** The two ADRs are consistent with each other but neither derives the ephemerality decision from Essay 010. The essay's success criterion — "the reviewer can discuss the code changes without AI assistance afterward" — is a criterion about the reviewer's internalized understanding, not about what gets written down. It is compatible with ephemeral output. But the essay also notes that "in an RDD context, this explanation already exists in the artifact trail" and discusses the value of a "provenance chain." Durable review records would extend that chain; ephemeral outputs do not. ADR-043 does not acknowledge this tension — it asserts ephemerality as a design property without explaining why durable review notes would be harmful or unnecessary, when the broader RDD philosophy explicitly values traceability.
- **Recommendation:** Add a sentence to ADR-043 explaining why ephemerality is correct despite RDD's general preference for durable artifacts. The most defensible argument is that the review's value is in the reviewer's mental model, not in a record of the questions — the essay supports this framing. Making the reasoning explicit closes the apparent tension with RDD's artifact-trail philosophy.

---

**Issue P2-2: ADR-044 mode detection heuristic is underdetermined and may misfire on partial RDD corpora**

- **Location:** ADR-044 Decision section, "Mode detection" paragraph
- **Claim:** "If RDD artifacts exist in the project (`./docs/domain-model.md`, `./docs/decisions/`, `./docs/scenarios.md`), offer corpus-grounded mode."
- **Evidence gap:** Essay 010's corpus-grounded mode requires that the relevant artifacts exist for the work package under review, not merely that some RDD artifacts exist in the project. A project with a domain model and several ADRs but no scenarios for the specific change being reviewed has a partial artifact trail. In that case, the orientation context the essay describes — "ADRs record decisions and their rationale — the reviewer can verify whether code implements what was decided" — may exist for some aspects of the code but not others. ADR-044 does not address this intermediate case. The heuristic as specified (presence of three directories/files) would trigger corpus-grounded mode even when the relevant artifacts do not exist for the specific change, potentially giving the reviewer false confidence in the orientation scaffold.
- **Recommendation:** Qualify the mode detection description: after detecting artifacts, the skill should also check whether the specific work package (or the affected modules/ADRs) has corresponding corpus entries. If the corpus is present but the relevant artifacts are absent, the skill should surface this explicitly — either falling back to context-reconstructive mode or noting which orientation gaps the reviewer will need to fill manually. The essay's own framing is that corpus-grounded mode works because "the reviewer can check whether code uses the agreed-upon concepts" — if the relevant ADRs and scenarios do not cover the change, this promise is not fulfilled.

---

**Issue P2-3: ADR-045 does not specify who classifies a finding as "mechanical" versus "question-worthy," and the consequences section names this as a judgment call without resolving it**

- **Location:** ADR-045 Decision section, "Mechanical findings (secondary output)"; ADR-045 Consequences, Negative
- **Claim:** "Clear, objective issues that do not require judgment — missing type checks, circular dependencies, obvious bugs, style violations" are mechanical. "The boundary between 'question-worthy' and 'mechanical finding' requires judgment — the skill must make this classification."
- **Evidence gap:** The ADR identifies that the classification requires judgment and assigns it to "the skill," but does not specify the decision logic the skill should use. Essay 010 provides supporting context — the agent should handle "surface-level verification" while freeing cognitive budget for "judgment-heavy work" — but does not define the boundary either. The essay's examples of legitimate agent contributions (linting, type checking, test coverage analysis, dependency scanning) suggest a mechanical/automated category, but do not address cases in the middle: is a design pattern that is technically valid but historically fraught in this codebase a question or a finding? The ADR leaves the boundary at "the skill must make this classification" without specifying the classification logic. This gap will propagate directly into implementation: skill authors will need to make this design decision without guidance.
- **Recommendation:** Add a classification heuristic to the Decision section. A workable formulation consistent with the essay: a finding is mechanical if it can be determined without knowledge of intent, context, or system history (the agent can verify it against objective criteria alone). A question is warranted when the issue could be correct given an intent or context the agent does not have. This maps to the CRDM analysis phase's recognition-primed judgment — mechanical findings are those where no pattern-matching against context is required.

---

**Issue P2-4: ADR-046 asserts "genuine code review that builds confidence" but does not explain how build-integrated review differs epistemically from standalone review**

- **Location:** ADR-046 Decision section, Integration mechanics, final bullet
- **Claim:** "This is a genuine code review that builds confidence the changes are good, not just an epistemic exercise."
- **Evidence gap:** The phrase "not just an epistemic exercise" appears to distinguish build-integrated review from something lesser, but the entire argument structure of Essay 010 — and all five ADRs — frames the epistemic function as the primary value. The essay's success criterion is the reviewer's ability to discuss changes without AI assistance afterward, which is precisely an epistemic outcome. The sentence as written reads as a defense against an objection (that epistemic review is impractical or insufficiently outcome-focused) but neither the objection nor the defense is grounded in the essay or the other ADRs. The phrase risks suggesting that "merely epistemic" review is insufficient — which undermines the foundational claim of the entire ADR set.
- **Recommendation:** Revise the sentence to eliminate the implicit demotion of epistemic value. A cleaner formulation: "Review during build serves both purposes — building the reviewer's genuine understanding of what was implemented and confirming the implementation is good. The success criterion (can the reviewer discuss the changes without AI assistance?) captures both." This is consistent with Essay 010's framing and avoids the internal tension.

---

**Issue P2-5: ADR-047 describes a five-step protocol but does not specify what happens when the reviewer's orientation validation reveals the agent's synthesis was substantially wrong**

- **Location:** ADR-047 Decision section, step 4: "The reviewer validates or corrects"
- **Claim:** "The reviewer confirms, adjusts, or extends the orientation. This is the grounding move — the reviewer's engagement with the synthesis ensures the orientation reflects reality, not just the agent's interpretation."
- **Evidence gap:** The protocol describes correction as a possibility ("adjusts, or extends") but treats it as a minor variation on confirmation. The essay notes that context reconstruction is necessary because without it "analysis lacks the context needed for recognition-primed judgment" — meaning a wrong orientation is not just incomplete but actively harmful to review quality. If the reviewer's validation reveals the agent's synthesis was substantially wrong (e.g., the agent misread the ticket goal), the protocol does not describe whether the agent re-synthesizes from the corrected orientation before generating questions, or whether the reviewer is expected to mentally adjust the subsequent questions themselves. The five steps imply a linear sequence; correction at step 4 should loop back to synthesis at step 3, but this is not stated.
- **Recommendation:** Add a loop condition to the protocol: "If the reviewer's correction is substantial — the agent's orientation missed the core goal or constraint — the agent re-synthesizes orientation before proceeding to step 5." This makes the protocol robust to the realistic failure mode of misreading available context, and is consistent with the essay's emphasis on adequate orientation as prerequisite for effective analysis.

---

### P3 — Consider

---

**Issue P3-1: ADR-043 uses "product discovery" as evidence for three stakeholder use cases without identifying where that discovery is documented**

- **Location:** ADR-043 Context, second paragraph
- **Claim:** "The product discovery identifies three stakeholders who need code review: the solo developer-researcher... the team lead... and teammates..."
- **Evidence gap:** Essay 010 does not identify these three stakeholders by name or frame them as a product discovery output. The essay mentions the reviewer and author as roles and briefly notes "practitioner accounts" for senior reviewer behavior, but the three-stakeholder taxonomy reads as a product discovery artifact (in RDD terms, a discovery-phase output) that predates or accompanies these ADRs. The ADRs cite it as established fact, but no path exists for a reader to verify it against the essay. This is not an error — the product discovery is a legitimate prior artifact — but its absence from the evidence trail creates an unverifiable premise in the context section.
- **Recommendation:** Add a parenthetical identifying where the product discovery for code review is documented (e.g., a conversation log, a discovery artifact file, or a reference to a forthcoming doc). If no such document exists, reframe: "Three stakeholder use cases emerged from applying the essay's analysis" and derive the use cases explicitly from the essay's content, which is sufficient to support all three.

---

**Issue P3-2: ADR-044 describes context-reconstructive mode as "RDD-lite" but does not resolve whether this framing could be misread as a claim that RDD itself should be run for all code reviews**

- **Location:** ADR-044 Decision section, "Context-reconstructive review (RDD-lite)" description; Essay 010, "Two Operating Modes" section
- **Claim:** Context-reconstructive review is "RDD-lite: not the full phase sequence, but the same epistemic posture — understand before judging."
- **Evidence gap:** The essay uses "RDD-lite" as a characterization of epistemic posture, not a process claim. ADR-044 inherits the term but does not define what the "lite" qualifier excludes. A reader unfamiliar with the essay could reasonably ask: which RDD phases are included? Is there a research phase? A model phase? The ADR is clear that orientation is the operative concern, but "RDD-lite" as a label implies a defined reduced-form process that does not exist in the ADR set. The term does useful work in connecting the standalone mode to the broader RDD philosophy, but it operates as an evocative metaphor rather than a specified procedure.
- **Recommendation:** Either define "RDD-lite" briefly within the ADR (two sentences on which RDD activities it mirrors: context-gathering as lightweight research, assumption-surfacing as lightweight discovery) or replace the label with a description: "context-reconstructive review applies the same epistemic posture as RDD — understand before judging — without requiring the full phase sequence." This reduces the risk of the term importing expectations the ADR does not fulfill.

---

**Issue P3-3: Essay 010 explicitly qualifies the deskilling risk as "suggestive rather than proven" but ADR-045's treatment of the reviewer-as-passthrough anti-pattern presents it as established**

- **Location:** ADR-045 Context, second paragraph ("The superpowers code-reviewer agent produces findings categorized as Critical/Important/Minor with a merge verdict. This is a verdict machine — it optimizes for the reviewer's verdict, not the reviewer's understanding.")
- **Claim:** The findings-based output pattern is characterized as producing the reviewer-as-passthrough anti-pattern — a framing drawn directly from Essay 010's deskilling argument.
- **Evidence gap:** Essay 010 explicitly hedges: "The analogy is suggestive rather than proven for software — direct evidence of AI-induced deskilling in code review has not yet been published." The essay presents the deskilling mechanism as plausible, not established. ADR-045 inherits this reasoning but drops the hedge — the "verdict machine" characterization and the "reviewer-as-passthrough with extra steps" language treat the deskilling claim as if it were an established finding rather than a well-reasoned concern. The decision to prefer questions over findings is still well-supported by the essay's epistemic value argument (knowledge transfer, shared understanding), which does not depend on the deskilling claim. But presenting the deskilling risk as demonstrated rather than probable slightly overstates the evidentiary foundation.
- **Recommendation:** Add a qualifier in the ADR-045 Context when invoking the passthrough/deskilling risk: "The deskilling mechanism is plausible but not yet empirically confirmed in software contexts (Essay 010). The stronger grounding for questions-over-findings is that findings bypass the cognitive engagement that produces review's actual value — knowledge transfer and shared understanding — regardless of whether deskilling occurs." This preserves the decision's validity while accurately representing the epistemic status of its grounding.
