# Research Design Review: Cycle 016
*2026-04-15*

## Reviewed question set
Cycle 016 batch — 17 questions across 5 tracks (#11, #12, #13, #14, #16) plus one cross-cutting question (X.1). Provided inline in the dispatch prompt.

## Summary

- **Questions reviewed:** 17 + 1 cross-cutting (18 total)
- **Flags raised:** 8 (3 embedded conclusions, 4 scope flags, 1 structural placement concern)
- **Premature narrowing:** Detected at question-set level — see below
- **Overall assessment:** The question set is better-formed than most. Tracks #11, #12, and #13 are mostly clean. The risks are concentrated in Track #14 (one embedded conclusion, one question that may be doing too much) and Track #16 (one scope concern). The cross-cutting question X.1 has a structural placement problem that the format obscures. The batch-cycle format introduces a systemic risk that warrants a standing note, not a per-question flag.

---

## Per-Question Review

### Track #11 — Cycle acceptance criteria traceability

---

#### Question 11.1: "How does the requirements-traceability literature handle verification of aggregate or emergent acceptance criteria that no atomic test case captures?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that "requirements traceability" is a distinct, well-developed literature with a settled treatment of this problem. The question assumes the literature has addressed it. A different question would be more productive if the relevant work is not in requirements-traceability literature specifically but in quality attribute verification, systems-level testing, or property-based testing — fields that work on exactly the problem of criteria that no single test instantiates. The question could return "the literature says: test coverage matrices" and miss that the harder answer lives in a different subfield.

**Embedded conclusions.** None flagged. The question appropriately inverts: it asks what the literature says rather than assuming it has a solution.

**Scope.** Appropriate. The question is well-bounded: a specific problem (emergent acceptance criteria), a specific literature (traceability), asking what that literature says. If the answer is "it doesn't address this," that is a finding.

---

#### Question 11.2: "In BDD/ATDD practice, what mechanisms exist for verifying 'layer-match' — that a criterion specifying integration layer X is exercised at layer X rather than stubbed at a lower boundary?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that BDD/ATDD practice has developed this concern and has named it in some form. If BDD/ATDD literature does not distinguish between "criterion exercised at the specified layer" and "criterion stubbed at a lower layer," the question will return silence or negative results. A different question — "Does BDD/ATDD literature recognize layer specificity of acceptance criteria as a distinct concern, and if so, how?" — opens the space to include a finding of "no, this gap is unaddressed."

More fundamentally: the researcher would need to believe that the failure mode in Issue #11 is a testing-practice problem (caught by better BDD/ATDD tooling) rather than a specification problem (criteria don't name the layer, so no mechanism can verify it). If it's a specification problem, the question is aimed at the wrong layer entirely.

**Embedded conclusions.** Flagged. "Layer-match" is the issue's own coinage. Using it in a lit-review question risks producing circular results: the researcher looks for "layer-match" mechanisms, finds none because the literature uses different concepts, and concludes the literature is silent — when in fact the relevant work exists under different terminology (test pyramid violations, integration test scope, contract testing). The question should ask about the underlying concern, not the project's name for it.

Suggested reformulation: "In BDD/ATDD practice, is there a recognized failure mode where a behavioral criterion specifying integration-level behavior is satisfied by a test that operates at a lower layer (unit or stub boundary)? What terminology does the literature use for this, and what verification mechanisms have been proposed?"

This reformulation opens the terminology question explicitly and does not assume the literature has the concept under a specific name.

**Scope.** Appropriate once reformulated. The underlying question is well-scoped and directly addresses Issue #11's gap.

---

#### Question 11.3: "Is the gap this issue names ('scenario-level coverage implies criterion-level coverage') documented as a known failure mode in software testing literature, and what terminology / mitigations are established?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the gap, if it exists in literature, is already named and mitigated. A different question matters if the gap is actually tacitly recognized but unmitigated — in which case the research task is to characterize why mitigation is hard, not to catalogue existing mitigations. The question as written treats "what mitigations are established" as a retrieval task; it should also ask what happens when no mitigations are established.

**Embedded conclusions.** None flagged. The question appropriately asks whether something is documented, not whether it is true.

**Scope.** Appropriate. This is a well-formed literature reconnaissance question.

---

### Track #12 — ADR supersession workflow

---

#### Question 12.1: "What do established ADR practitioners (Nygard, Tyree/Akerman, ThoughtWorks Radar, AWS Well-Architected) say about ADR mutability — which fields are intended immutable vs. mutable, and under what circumstances ADRs may be amended?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the established practitioners have addressed mutability systematically. They may not have. Nygard's original formulation is notably silent on amendment; the extension community has developed practices largely through blog posts and conference talks rather than systematic treatment. A different question exists if the answer to 12.1 is "the established sources don't address this clearly" — in which case the next productive question is: "What have practitioners developed in the absence of authoritative guidance, and what problems has that created?" The question should prime the researcher for a possible finding of silence.

**Embedded conclusions.** None flagged. The question asks what practitioners say, not what they should say.

**Scope.** Appropriate. The sources are named and appropriately scoped to the methodological tradition the project is operating in.

---

#### Question 12.2: "Is the role separation this issue proposes — ADRs as historical record vs. current-state documents (system-design, ORIENTATION) as current truth — present in existing methodologies, or is it novel?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that "novelty vs. prior art" is the most useful question to answer. It may not be. If the role separation is present in existing methodologies, that is validating but not necessarily prescriptive — the methodology may have found it for good local reasons. If it is novel, that is not disqualifying — it may be novel because the combination of ADRs with co-located current-state documents is also novel. The question that would be more productive under these beliefs: "What problems do existing methodologies solve with their chosen artifact-role partitioning, and do those solutions transfer to the ADR-plus-current-state context?" That asks whether the role separation is *adequate for the need*, not merely whether it exists elsewhere.

**Embedded conclusions.** Mild flag. "Is it novel?" is a binary that risks the research stopping at "yes, novel" without asking whether the novelty is well-founded. But this is mild — the question is still useful as a first-pass orientation.

**Scope.** Appropriate. This is a reasonable prior-art reconnaissance question.

---

#### Question 12.3: "What supersession workflows exist in adjacent fields (RFC processes, IETF/W3C standards, API deprecation, versioned architecture) for preserving historical fidelity while keeping current-state readers accurate?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that adjacent fields have solved this problem and that their solutions transfer to the ADR context. The IETF/W3C comparison is apt. The API deprecation comparison may not transfer cleanly — API deprecation signals that clients should change behavior, which is a different problem than ADR supersession, which signals that decision-readers should understand a historical sequence. If the researcher goes looking for "how do adjacent fields do this" without first asking "what is the underlying structure of the problem," they may over-import solutions from fields solving a different problem.

**Embedded conclusions.** None flagged. The question asks what exists, not what should be done.

**Scope.** Appropriate, with a note to the researcher: be explicit about which aspects of adjacent-field workflows map to the ADR problem and which do not. The analogy mapping exercise is a research task, not a given.

---

### Track #13 — Pattern reuse without applicability check

---

#### Question 13.1: "What does the cognitive psychology literature on analogical transfer and case-based reasoning identify as primary failure modes when a known solution is applied to a structurally similar but not identical problem?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that analogical transfer and case-based reasoning literature addresses *structural dissimilarity detection* — i.e., knowing when the analogy breaks. The literature actually addresses this: surface similarity and structural similarity are distinct, and the failure mode in Issue #13 (adopting a pattern because it worked before, in a situation that is surface-similar but structurally different) has a name in this literature (negative transfer, analogical overgeneralization). The question is well-aimed.

A different question would be more productive if the researcher believed that the failure mode in Issue #13 is less about analogical transfer and more about satisficing under cognitive load — reaching for the nearest available solution not because of analogical reasoning but because the decision has no forcing function to stop and compare. That's a different mechanism with different mitigations.

**Embedded conclusions.** None flagged. The question asks what the literature identifies, not what the answer should be.

**Scope.** Appropriate. The question spans two relevant subfields (analogical transfer, case-based reasoning) and asks a specific question about failure modes.

---

#### Question 13.2: "What mitigations — checklists, prompts, structured questioning, negative-transfer detection — have been shown to reliably trigger applicability questioning before pattern application?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that mitigations exist and that the research task is to catalogue them. If the cognitive psychology literature on this is primarily experimental (lab-based, controlled), the "shown to reliably" criterion may be too demanding: the literature may show effects in experimental conditions without evidence of deployment reliability in naturalistic settings. A different question would be more productive if the finding is "these interventions work in the lab but their reliability in practice is unknown": "What does the literature say about ecological validity of analogical-transfer mitigations — do laboratory-demonstrated effects transfer to naturalistic decision-making, and under what conditions?"

**Embedded conclusions.** Mild flag. "Shown to reliably trigger" presupposes some mitigations meet this bar. The question should remain open to a finding that nothing meets it.

Suggested reformulation: "What mitigations — checklists, prompts, structured questioning, negative-transfer detection — have been studied for triggering applicability questioning before pattern application, and what evidence exists about their reliability in practice vs. experimental settings?"

**Scope.** Appropriate once reformulated. The underlying need is sound.

---

#### Question 13.3: "Does software-engineering literature on design pattern misuse / framework migration / code reuse antipatterns name this failure mode, and how does it relate to the broader analogical-transfer literature?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the SE literature on pattern misuse has made the connection to cognitive psychology explicit. It mostly has not. The SE literature on antipatterns (Fowler's refactoring catalog, Brown et al.'s AntiPatterns, the patterns community) treats misuse primarily as a structural observation ("this is being used wrong") rather than explaining the cognitive mechanism that led to the misuse. A different question would be more productive if the researcher believed the connection is absent and needs to be synthesized: "What does the SE literature say about the observable forms of pattern-misuse failure, and does it offer cognitive explanations for the mechanism — or is the mechanism explanation entirely absent from that literature?"

**Embedded conclusions.** None flagged. The question asks whether a name and relationship exist, not whether they should.

**Scope.** Appropriate. This is a bridging question connecting two literatures, which is the right question for understanding Issue #13's mechanism.

---

### Track #14 — Multi-cycle composition

---

#### Question 14.1: "What prior art exists for representing nested / concurrent / paused workflow state — workflow engines (Temporal, Cadence, Airflow), hierarchical state machines, continuation-passing style, git worktree/stash/rebase-in-progress — and what abstractions has each settled on?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that abstraction convergence has occurred — that the prior art has "settled on" representations. For some of these (Temporal's workflow-as-code with durable execution, hierarchical state machines as in SCXML/Statecharts), convergence is real. For git's case (worktree/stash/rebase-in-progress are ad hoc extensions, not a designed abstraction), there is no settled answer. If the prior art disagrees or has converged only locally within subdomains, the question should ask why convergence has or hasn't occurred, not just catalogue what exists.

**Embedded conclusions.** None flagged. The question asks what prior art exists and what it settled on, not what should be done.

**Scope.** Appropriate. The source list is well-chosen and broad enough to reveal different abstraction strategies.

---

#### Question 14.2: "For workflows where the executor may be interrupted mid-step (e.g., user stepping away mid-gate), what patterns distinguish 'in-progress' from 'paused' and 'active'? What concrete data representations are used?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the in-progress / paused / active distinction matters at the schema level rather than being a semantic question about protocol. ADR-072's known gap (in-progress gate case not covered) is a concrete prompt for this question, but the gap may be better addressed by asking: "What are the observable consequences of misclassifying in-progress as paused, or paused as active — what invariants break?" That question produces requirements for the representation, not just a catalogue of representations.

**Embedded conclusions.** None flagged. The question asks what patterns exist and what data representations are used.

**Scope.** Appropriate. The question is directly addressed to ADR-072's known gap and the answer will be actionable.

---

#### Question 14.3: "What interaction patterns exist between nested workflows and composition operations (graduation, close, archive) — do outer-workflow close operations cascade, error out, or require explicit unwinding?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that nested workflow systems have faced and solved the composition-operation problem. Most workflow engines handle this — Temporal's child workflow cancellation, Airflow's SubDagOperator teardown — but the question is whether RDD's specific operations (graduation, close, archive) map cleanly to the analogues in those systems. They may not: "graduation" in RDD has a knowledge-transfer semantics that has no direct equivalent in workflow engines. The researcher should be alert to where the analogies break.

**Embedded conclusions.** None flagged. The question asks what patterns exist.

**Scope.** Appropriate, with the caveat noted above.

---

#### Question 14.4: "How can a workflow system with enforcement mechanisms (hooks, manifest checks, gates) adapt its enforcement to the scope of the current work unit — so that smaller-scoped cycles don't trip guardrails designed for full-pipeline cycles — without losing the structural guarantees those mechanisms provide for larger work units? What prior art exists for scope-adaptive enforcement?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that *scope-adaptive enforcement* is the right design response to the constraint. The question assumes that the solution shape is "adapt enforcement to scope." A different response exists: enforce the same structural guarantees at every scope, but change what those guarantees mean for smaller-scoped cycles — i.e., the guarantee holds but is vacuously satisfied at phases that don't exist in a smaller cycle. Under that belief, the question would be: "What mechanisms allow enforcement systems to express scope-conditional requirements, where a requirement is either applicable or vacuously true depending on the work unit's declared shape?"

There is also a risk in "without losing the structural guarantees": this framing assumes scope-adaptivity and structural integrity are both achievable. They may be in tension in ways the question doesn't acknowledge. A more productive question may name that tension explicitly: "What tradeoffs have scope-adaptive enforcement systems accepted between flexibility and structural guarantee preservation, and which tradeoffs are acceptable for RDD's specific guarantees?"

**Embedded conclusions.** Flagged. "How can" presupposes scope-adaptive enforcement is the right solution and the question is how to implement it. The issue names this as a design direction but it has not been established as the correct one. The alternative (scope-conditional vacuity — the requirement exists but is vacuously satisfied when its preconditions don't apply) is not considered.

Suggested reformulation: "For enforcement systems designed around full-pipeline execution, what mechanisms exist for handling smaller-scoped work units — and what tradeoffs have been made between scope flexibility and structural guarantee preservation? What prior art exists under terms like 'scope-adaptive enforcement', 'conditional preconditions', or 'policy applicability'?"

This opens the mechanism space and makes the tradeoff question explicit rather than assuming both goals are jointly achievable.

**Scope.** Too narrow as written, because the "how can" framing closes off the alternative mechanism. The reformulation addresses this.

---

#### Question 14.5: "For migration from single-cycle to multi-cycle representation — what strategies exist in comparable systems (schema evolution for config files, versioned state machines), and what is the cost profile of automated migration vs. user-walkthrough migration for pre-existing cycles?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the migration problem is primarily a schema-evolution problem — that the challenge is transforming existing cycle-status files. If the challenge is instead primarily a semantic problem (deciding which of an existing cycle's states corresponds to the new multi-cycle concepts), no schema-evolution tool will help, and the question is aimed at the wrong layer. The researcher should ask upfront: "Is this a structural migration problem (schema transformation) or a semantic migration problem (concept assignment), and does the answer change which prior art is relevant?"

**Embedded conclusions.** None flagged. The question asks what strategies exist and what the cost profile is.

**Scope.** Appropriate. The source list (schema evolution, versioned state machines) is well-chosen.

---

### Track #16 — Research-phase solution-anchoring

---

#### Question 16.1: "What does behavioral-decision-research literature (Tversky & Kahneman 1974 and subsequent replications) identify as the mechanisms by which existing context / prior exposure narrows search in subsequent decision-making?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that anchoring is the primary mechanism of interest. Prior exposure narrowing search is also addressed by availability heuristic, priming, and concept accessibility research, which are adjacent but distinct. If the mechanism in Issue #16 is more like priming (the prior artifact makes certain solution concepts more accessible) than anchoring (the prior artifact serves as a reference point against which adjustments are made), the question is aimed at a related but distinct literature. The question should be alert to this possibility rather than assuming anchoring is the right concept.

**Embedded conclusions.** None flagged. The question asks what the literature identifies, not what the answer is.

**Scope.** Appropriate. Tversky & Kahneman 1974 is the right starting point; "subsequent replications" is the right scope extension.

---

#### Question 16.2: "What interventions — constraint-removal questioning, inversion, counterfactual reasoning, devil's-advocate framings — have been experimentally validated to reduce anchoring in research / design / creative work?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that "experimentally validated" is the right bar to set. The Essay 013 spike experiment (which is directly relevant prior art here) demonstrated that belief-mapping works and adversarial framing overcorrects — in a compressed pipeline with scripted inputs. That is experimental evidence, but not from the behavioral-decision-research literature; it is from within the methodology itself. The question should either explicitly include RDD's own spike findings as prior art to be evaluated, or remain narrowly aimed at external literature. If the methodology is going to run research on this topic, it should not ignore its own experimental results.

There is also a concern about "experimentally validated": the bar for validation in lab-based debiasing research is low (college student samples, controlled tasks). Ecological validity is consistently poor for debiasing interventions. The question should ask about deployment reliability, not just experimental validation.

**Embedded conclusions.** Mild flag. "Experimentally validated to reduce anchoring" assumes the interventions have successfully reduced anchoring somewhere — this may be too generous. Some of these (devil's-advocate framing specifically) have a mixed or negative record in the debiasing literature.

Suggested reformulation: "What interventions — constraint-removal questioning, inversion, counterfactual reasoning, devil's-advocate framings — have been studied for reducing anchoring in research / design / creative work? What does the literature say about ecological validity — do lab-demonstrated effects transfer to naturalistic settings?"

**Scope.** Appropriate once reformulated. The ecological validity question is the critical one for actionable findings.

---

#### Question 16.3: "In research methodology literature (qualitative and design research), what practices exist for mitigating the effect of existing artifacts / prior work on research question formation, and how effective are they?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that qualitative and design research methodology literature has addressed this problem explicitly, and that "how effective are they" can be answered from that literature. Qualitative methodology literature (Lincoln & Guba, Creswell, Patton) discusses researcher positionality and reflexivity at length, but the effectiveness evidence is mostly theoretical or based on practitioner self-report — not experimental. "How effective are they" may produce a thin answer.

A more productive question exists if the researcher believed the relevant practices are better characterized in peer review methodology, systematic review methodology (PRISMA, Cochrane review protocols), or information retrieval research (query bias, search protocol design) — fields that have operationalized the concern about existing context biasing inquiry. These fields have more developed effectiveness evidence.

**Embedded conclusions.** None flagged. The question asks what exists and how effective — the "how effective" is an open question, not a presupposition.

**Scope.** Mild flag: "qualitative and design research" may be too narrow. The question should either expand the scope or explain why those two traditions are specifically the right ones. If the answer from those traditions is "practices exist but effectiveness is unknown," the question may stop too early.

Suggested scope expansion: Include systematic review methodology and peer review design as additional literature areas. These have operationalized the problem and have outcome data.

---

### Cross-cutting question

---

#### Question X.1: "Do #13 and #16 share a common mechanism — existing-artifact gravity suppressing inversion-questioning — or are they distinct failure modes that appear superficially similar? If the mechanism is shared, what does that imply for where the Inversion Principle's procedural home should live?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that mechanism-identity is the right question — that if #13 and #16 share a mechanism, the procedural response is to find a single procedural home for the Inversion Principle. But mechanism-identity and procedural-home-unity are not logically linked. Two problems can share a mechanism while requiring interventions at different pipeline stages, because the intervention needs to fire where the mechanism is active — and the mechanism may activate at different points in #13 (BUILD phase, when patterns are applied) vs. #16 (RESEARCH phase, when questions are formed). Shared mechanism does not imply shared procedural home.

The second half of the question ("what does that imply for where the Inversion Principle's procedural home should live") has an embedded directional assumption: that the finding will be "they share a mechanism" and the conclusion will be "therefore consolidate the procedural home." The possibility that the mechanism is shared but the procedural homes must remain separate is not considered.

**Embedded conclusions.** Flagged. The second clause presupposes a consolidation-favoring conclusion. The question should remain open to finding that shared mechanism implies different procedural homes, or that the mechanisms are distinct and each requires its own home.

Suggested reformulation: "Do #13 and #16 share a common mechanism — existing-artifact gravity suppressing inversion-questioning — or are they distinct failure modes that appear superficially similar? If shared: does a shared mechanism imply a unified procedural home, or can the same mechanism require intervention at different pipeline stages? If distinct: what are the implications of treating them as if they were the same?"

**Scope.** Structurally misplaced. This question should run before the per-track research, not after it. If the mechanism is shared, the research design for both tracks should account for that — it affects what literature is relevant, what the two tracks should be looking for, and whether they should share findings. Running it as a post-hoc synthesis question means the tracks will have run independently under an assumption (they are distinct) that the cross-cutting question is meant to test. The question should either be resolved before the research runs (as a design question, using Essay 013's findings on sycophancy mechanism vs. framing-adoption mechanism) or flagged explicitly as a question the tracks should hold in mind while running.

**Recommendation:** Make X.1 a pre-research question, not a synthesis question. The relevant prior art — Essay 013's analogical-transfer finding on sycophancy vs. framing-adoption vs. pattern-reuse — already provides partial evidence. The researcher should answer X.1 provisionally before running #13 and #16, then test that provisional answer against the research findings.

---

## Question Set Assessment

### Premature narrowing

One significant instance detected, at the question-set level rather than within individual tracks.

**X.1 is mispositioned as a synthesis question.** As noted above, X.1 asks whether #13 and #16 share a mechanism — but the answer to that question changes what the per-track research should look for. Running #13 and #16 as independent tracks, then asking X.1 afterward, means the research will have been conducted under an implicit assumption (they are distinct enough to study separately) that the cross-cutting question is meant to test. This is not premature narrowing within a track but premature partition between tracks.

**Track #14 assumes scope-adaptive enforcement as the solution shape.** Question 14.4 asks "how can" scope-adaptive enforcement be achieved, not "should" it be. The alternative mechanism — scope-conditional vacuity, where requirements exist but are vacuously satisfied at inapplicable phases — is not in the question set. If scope-adaptive enforcement turns out to be the wrong solution shape, the question set will not discover this.

**Track #16 may be redundant with existing Essay 013 findings.** Essay 013's spike experiment is directly relevant to Track #16: it identifies the mechanism by which existing context narrows search (RLHF-driven sycophancy, content selection), tests two candidate interventions (adversarial framing vs. belief-mapping), and finds that one overcorrects and one calibrates. If the research for Track #16 does not start from Essay 013 as a known-result baseline — treating it as prior art to be extended rather than terra incognita to be discovered — it risks reinventing findings already established within the methodology. The questions as written do not reference this prior art; the research should explicitly build on it.

### Coverage gaps

**Gap 1: The failure-severity question for Issue #11.**

The question set establishes what the literature says about emergent acceptance criteria and layer-matching. It does not ask: "Under what conditions does scenario-level coverage falsely satisfying criterion-level coverage actually matter — when does the gap produce real failures vs. when is it benign?" This question would establish whether the gap in Issue #11 warrants a methodological remedy or whether it is an acceptable simplification for most RDD cycles.

**Gap 2: The interaction between Track #14 and ADR-072's existing decisions.**

ADR-072 shipped in Cycle 015 with a known gap (in-progress gate case). Track #14's questions investigate multi-cycle composition broadly — but no question asks specifically: "Does the in-progress gate case require a schema change, a protocol change, or a hook-behavior change — and what are the implications for backward compatibility with existing cycle-status files?" This is a concrete prior-art question that the track doesn't ask.

**Gap 3: Track #12 does not ask the cost question.**

The questions establish what ADR mutability norms exist and what supersession workflows look like in adjacent fields. They do not ask: "What are the known costs of treating ADRs as immutable historical records — what breaks, what becomes hard to maintain, what creates reader confusion?" Without understanding the cost of the proposed role separation, the research may recommend a pattern that solves one problem (historical fidelity) while creating another (current-state documents becoming the single source of truth maintenance burden).

**Gap 4: The batch-cycle format risk is not addressed by any question.**

The batch-cycle format means 17 questions across 5 tracks, with varying depth requirements. Some tracks (like #11 and #12) warrant shallow-to-medium literature reconnaissance; Track #14 warrants deeper investigation because it has the most implementation complexity. No question addresses how to allocate research depth across tracks — which is a research-design decision, not a finding, but one the researcher should make explicit rather than leaving implicit.

### Batch-cycle-specific risks

This question set is the first instance of a multi-issue batch cycle in the corpus. Three format-specific risks deserve explicit naming:

**Risk 1: Shallow breadth masquerading as coverage.** 17 questions across 5 tracks creates pressure to complete all tracks to a similar depth. But Track #14 (multi-cycle composition) is substantively more complex than Track #12 (ADR supersession workflow) and warrants deeper research. The format tempts equal-depth treatment. The researcher should decide explicitly which tracks warrant deep research vs. orientation-level reconnaissance before beginning, not discover this mid-cycle.

**Risk 2: Cross-track interaction underinvestigation.** X.1 is the only cross-track question, and as noted above it is mispositioned. The #13/#16 interaction is visible. A less visible cross-track interaction: Track #14's scope-adaptive enforcement question (14.4) and Track #11's acceptance-criteria question share a dependency — if acceptance criteria can be emergent and scenario-level, then scope-adaptive enforcement must still preserve whatever structural guarantee acceptance criteria provide. Neither track mentions the other. If both tracks run independently and produce design recommendations, those recommendations may be incoherent with each other.

**Risk 3: Confirming a batch-cycle format that may not be appropriate.** The cycle framing is explicit that this is an experiment in multi-cycle composition. But the question set contains no question about whether the batch-cycle format is appropriate for these issues — whether some issues should have been held for dedicated cycles, or whether the batch format creates research-phase risks that single-issue cycles don't have. This is reflexive: the methodology should ask whether the format it is using is fit for purpose, not just execute within it. (This is a meta-note, not a research question gap — the user has been explicit about the experiment, and the reviewer is noting a risk, not prescribing a question.)

### Recommendations

**Highest priority — do before research runs:**

1. Reformulate 11.2 to open the terminology question explicitly (see above). The "layer-match" coinage creates a circular search risk.
2. Reposition X.1 as a pre-research question. Use Essay 013's mechanism findings as a provisional starting point. Have the researcher state their provisional answer before running Tracks #13 and #16, then test it.
3. Reformulate 14.4 to name the scope-conditional-vacuity alternative and make the tradeoff question explicit.

**High priority — reformulate before running the question:**

4. Reformulate 16.2 to include ecological validity and to acknowledge the methodology's own spike findings as prior art.
5. Expand 16.3's scope to include systematic review methodology and peer review design literature.
6. Add an explicit Track #14 question about the in-progress gate case specifically (Gap 2 above).

**Worth noting to researcher, not requiring reformulation:**

7. For 12.3: the researcher should explicitly map which aspects of adjacent-field supersession workflows apply to the ADR problem and which do not. The analogy work is part of the research task.
8. For 14.1: be alert to subfields where "settled abstractions" don't exist (git's ad hoc extensions) — that finding is as useful as finding convergence.
9. For Track #16: start from Essay 013 as a prior-art baseline, not from scratch. The spike findings are directly relevant. Research should extend them, not rediscover them.
10. For Track #14 vs. Track #11 interaction: the researcher should check whether the recommendations from both tracks are coherent with each other before delivering findings. Separate research tracks may produce separately-valid-but-jointly-incoherent recommendations.

**Track depth allocation (research-design recommendation, not a question flag):**

Tracks #11, #12, and #13 warrant orientation-depth research — reconnaissance to establish what the literature says and whether it names the problem, rather than deep investigative synthesis. Track #14 and Track #16 warrant deeper treatment. Track #14 because the implementation complexity is high and the questions span multiple subfields that need synthesis. Track #16 because the mechanism question (is Issue #16 the same as Issue #13?) is unresolved and shapes what research is relevant. Allocate accordingly before beginning.
