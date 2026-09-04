# Research Design Review

**Reviewed question set:** `docs/essays/research-logs/research-log.md` (Steps 1.1–1.3)
**Constraint-removal response included:** Yes (Step 1.2)
**Date:** 2026-05-22

## Summary

- **Questions reviewed:** 3 (primary question + 2 interlocking sub-questions, treated as one question set together with the Step 1.2 constraint-removal response)
- **Flags raised:** 6 (2 P1, 3 P2, 1 P3)
- **Criteria applied:** 1–4 (ADR-082 full criteria set)

---

## Per-Question Review

### Question 1: Primary — "Does the RDD corpus exhibit an uneven topology... and could a compact, agent-navigable structure simultaneously maximize provenance, surface duplicated responsibilities, and let gate checkpoints be presented in plain language?"

**Belief-mapping:** What would the researcher need to believe for a different question to be more productive?

The framing couples two distinct hypotheses: (a) the corpus has uneven topology, and (b) a specific structural intervention (compact, agent-navigable structure) addresses it. These are separable. A different question would be more productive if the researcher believed: the topology is fine but the *access pattern* is wrong (the corpus is navigated in the wrong order, not structured at the wrong granularity); or that the plain-language gate presentation problem is a skill-text problem rather than a corpus-structure problem; or that the simultaneous three-goal requirement (provenance + duplication-surface + plain language) is the framing constraint, and relaxing one goal changes which structures are viable.

The "simultaneously" framing in the primary question quietly narrows the solution space to structures that can satisfy all three conditions at once. A compaction that satisfies provenance and plain language but surfaces duplicated responsibilities only partially would be excluded by this framing even if it addressed the user's actual pain. The question does not give any of the three goals primacy, which would help if they come apart.

**Embedded conclusions:** **Flagged — P2.**

The question names the user's candidate solution structure in its framing: "compact, agent-navigable structure (user's candidate: a knowledge graph linking invariants × vocabulary × ADRs × code)." The parenthetical brackets the KG candidate correctly as the user's proposal, not the answer. But the primary question's structure is "does X exist, and could [specific structure type] address it?" — the second half accepts the structure category before the research has examined alternatives. The research log does record the KG candidate as input requiring bracketing, and Loop 2 examines alternatives. However, the question itself asks whether the KG-type structure *could* do the job, not whether it is the *best* candidate or whether the need-level goals can be served by a simpler structure.

Suggested reformulation: "Does the RDD corpus exhibit an uneven topology — and what would it mean to serve graduation-phase legibility for both human practitioners and downstream agents on the same corpus?" This reformulation preserves all three underlying needs (provenance, duplication-surfacing, plain language at gates) as evaluation criteria for whatever structure the research surfaces, rather than importing the solution shape into the question.

**Scope:** Appropriate in intent, slightly over-specified in structure. The question's scope is correctly set at the cycle level — it addresses the research entry question before committing to a direction. The simultaneous-three-goals framing and the parenthetical KG reference are the only scope concerns.

---

### Question 2 (sub): "Are Cycle 019's 5 ADRs actually five distinct calibration moves, or one underlying move expressed at unnecessary granularity?"

**Belief-mapping:** What would the researcher need to believe for a different question to be more productive?

The question assumes that "unnecessary granularity" is the right diagnostic for whatever problem the 5 ADRs present. A more productive question would come into view if the researcher believed: the granularity is warranted but the *cross-referencing convention* makes it feel denser than it is (presentation failure, not structural failure); or that the 5 ADRs are 5 distinct moves each addressing a different consumer (one for human practitioner, one for agent dispatch, etc.) and the topology looks uneven precisely because it is correctly bifurcated; or that the count of 5 is simply the artifact of how the cycle worked and prior cycles have had comparable or higher counts without producing the same felt-difficulty.

Cycle 019 shipped 5 ADRs (094–098). Cycle 018 shipped 2 (ADR-092, ADR-093) but included substantially more audit infrastructure per the Essay-Outline's own evidence. The comparison the question uses — "5 middle-of-the-road vs. one bold choice" — is the user's theater metaphor, which is vivid but needs empirical grounding before it drives compression. Whether 5 ADRs is "too many" requires a baseline, and the question as framed takes the theater metaphor as already-established diagnosis.

**Embedded conclusions:** **Flagged — P1.**

"Unnecessary granularity" presupposes the granularity is the problem and compression is the remedy. A non-presupposing formulation: "Are Cycle 019's 5 ADRs five distinct calibration moves or are they structurally compressible — and if compressible, what is lost?" The "what is lost" is the test any compression must pass: whether the audit-substance survives. The question as currently framed does not ask whether compression is a safe move, only whether the 5 ADRs share substructure. It is possible that they do share substructure and that the sharing is the correct way to represent related decisions (they inform each other; their warrants overlap) rather than evidence that they should be collapsed.

**Scope:** Too narrow on one axis. The question investigates Cycle 019's 5 ADRs specifically. The user's theater metaphor generalizes ("the granularity of ADRs") — if it's a structural tendency, it should be visible across cycles, not only in the most recent one. Loop 4 is conditional on Loop 1's finding, but the sub-question as stated does not make clear that the single-cycle examination is a first pass with cross-cycle examination contingent on the finding. The research plan does encode this correctly in Loop 4. The question itself should signal the conditionality.

---

### Question 3 (sub): "Can corpus knowledge move into structures the agent navigates compactly AND the user reads in plain language?"

**Belief-mapping:** What would the researcher need to believe for a different question to be more productive?

The question takes the "same corpus serves both audiences" as the framing. A different question would emerge from believing: the two audiences can never be served optimally by the same structure, so the right question is not "can we find a structure that does both" but "where exactly do the audiences' needs diverge, and what is the minimal divergence point a dual representation would need to encode?" Or: the agent's navigation problem and the user's plain-language problem are both downstream symptoms of the same upstream cause (ADRs accumulate cross-references that require both audiences to hold too much context simultaneously), and the right intervention is at the cross-referencing convention rather than at the structure type.

The user's reframing at Step 1.3 ("how to make it user-friendly AND still enabling for agentic flows") correctly captures this as a dual-audience question. The sub-question as written imports the answer category ("structures the agent navigates compactly AND the user reads") and asks whether such structures exist. That's subtly different from asking what the structural requirement for dual-audience navigability actually is.

**Embedded conclusions:** **Flagged — P2.**

"Compact AND plain language" as the dual-success criterion assumes these are co-satisfiable in the same artifact. The methodological pattern the prior ADRs (083, 084) already established suggests they may not be: ADR-084's Pattern B (companion file) explicitly handles cases where the two audiences require divergent content, meaning the "same source, both audiences" criterion is only one of two supported patterns. The question as framed tests only the "same source" path and would pass over the companion-file / dual-source answer even if that answer is well-supported. Suggested reformulation: "What would it take for the corpus to be navigable by agents AND legible to practitioners at graduation — and does that require the same structure or different ones?"

**Scope:** Appropriate in breadth. The question is correctly framed at the need level (navigation, legibility) rather than at the mechanism level.

---

## Constraint-Removal Response Review

**Response substance:** Engaged — not performative, not null. The user did not imagine a world without ADRs; they re-anchored to a structural refinement within the ADR mechanism. This is consistent with ADR-082's "irreplaceable-artifact case" — the user's response constitutes substantive engagement on record, which is the structural requirement. The Step 1.2 analysis correctly characterizes this as bifurcating two functions currently bundled in ADRs (big-picture commitment function vs. granular-detail-carrying function).

**Embedded conclusions in the response:** **Flagged — P1.**

The user's response treats the big-picture commitment function as *functionally irreplaceable* and the analysis records this without surfacing the structural alternative families the research phase should at minimum acknowledge. The user's phrase "I like ADRs from the standpoint that they communicate specific decisions" encodes a defense of the decision-recording form that goes slightly past the evidence: the user's felt value of ADRs-as-decision-communication is not equivalent to ADRs being the only or best structure for decision communication. The Step 1.2 analysis calls out the re-anchoring but then records "The research does not need to re-argue whether ADRs themselves are necessary" — which is the ADR-082 irreplaceable-artifact acceptance condition. However, the analysis does not record the alternative structural families before closing the bracket.

Three structural alternatives that the constraint-removal response bracket should have named before accepting the irreplaceable-artifact finding:

1. **Decisions-as-scenarios-only** — design decisions encoded as refutable behavior scenarios rather than as narrative records; the DECIDE phase already produces scenarios alongside ADRs, so this alternative is not hypothetical.
2. **Decisions-as-living-narrative** — a single evolving design rationale document (the "architectural notebook" pattern) rather than incremental append-only records; this is how Cockburn's Crystal methodology handles design rationale.
3. **Decisions-as-graph-only** — the KG candidate the user names, applied to the decision layer rather than the compaction layer; decisions become nodes with typed relationships rather than prose ADRs.

None of these needs to win. But the constraint-removal response that does not name them before concluding "ADRs' commitment function is irreplaceable" has not fully established the irreplaceable-artifact condition — it has established the user's preference within the ADR form. The Step 1.3 research plan does not include a loop that stress-tests this conclusion against the structural alternatives before proceeding.

**Recommendation:** Add a brief Step 1.2 addendum that names the three alternative families and records a one-sentence user-position on each. This does not need to be research — it is the constraint-removal protocol's due diligence. It also surfaces whether "decisions-as-scenarios-only" would address the topology problem without requiring any compaction substrate at all, which is the strongest version of the incongruity flag below.

---

## Question Set Assessment

### Premature narrowing / prior-art treatment

**Flag — P2.** The criterion is partially satisfied and partially not.

The Step 1.2 constraint-removal response partially satisfies the prior-art treatment criterion for ADRs — the constraint-removal prompt structurally treats ADRs as prior art to examine rather than as an unchallengeable fixture, and the user's response provides substantive engagement. That part of the criterion is met.

However, the prior-art treatment criterion is **not satisfied for the user's graduation practice of thematic consolidation**. The research log names this practice at Step 1.3 as "load-bearing user-evidence" but frames it as evidence to investigate, not as a potential prior-art answer to the research question. The user has been doing thematic consolidation in real work contexts and the methodology does not currently scaffold it. That existing practice is the simplest available answer to part of the research question — "how can practitioners reduce corpus weight at graduation?" — and the question set does not ask whether scaffolding the existing practice (without structural compaction) would be sufficient. Instead the question set jumps to compaction substrate questions. See Incongruity Surfacing below.

The prior ADRs (072, 083, 084, 095) are referenced at Step 1.3 as a "partial-answer pattern" the cycle should examine. This is appropriate — they are treated as evidence of a pattern the cycle is extending, not as constraints that foreclose the question. The prior-art treatment for the prior ADRs is adequate.

---

### Incongruity surfacing

**Flag — P1.** This is the most significant finding in the review.

The incongruity is visible in the research context but the question set does not surface it for examination:

- **Simple available answer:** The user's graduation practice is thematic consolidation of ADRs — a manual move the user already performs in real work contexts. This is a simple, proven, human-executed pattern.
- **Complex proposed answer:** The KG candidate / JSON-linked-list candidate — a structural mechanism requiring a representation format, a generation convention, tooling, and a consuming agent that navigates the new structure.

These two exist in adjacent areas of the same problem space (reducing corpus weight at graduation; making ADRs navigable at the big-picture level). The simpler answer is already in operation; the complex answer is being designed from scratch.

The research log names the thematic-consolidation practice at Step 1.3 and correctly identifies it as "empirical evidence that exists in the user's practice but not yet in the methodology." But the question set does not ask the decisive question that would distinguish whether the complex mechanism is warranted: **"Would scaffolding what the user already does (thematic consolidation) satisfy the graduation-phase legibility need — and if so, what does the methodology gain from the substrate-and-KG mechanism that the scaffolded consolidation does not provide?"**

This question is missing from all five loops. Loop 1 examines whether the 5 ADRs can compress thematically and what the user's graduation practice preserves/loses. But Loop 1 does not set up a threshold question: if thematic consolidation (methodology-scaffolded) turns out to satisfy the graduation need, should the cycle stop there rather than proceeding to substrate design? Without this threshold question, the research plan implicitly assumes the substrate work is necessary regardless of what Loop 1 finds.

The consequence: if the research plan proceeds without surfacing this incongruity, the cycle risks designing a complex mechanism for a problem the user has already solved informally. The substrate work has real cost (design, ADR, skill-text, future maintenance). The simpler available answer deserves a direct comparison at Loop 1 close, before Loop 2 (substrate lit-review) begins.

**Recommended addition:** At Loop 1's close, add an explicit threshold question: "Does thematic consolidation (scaffolded as a methodology move) satisfy the graduation-phase legibility need for the human practitioner? If yes, what specific capability does a substrate mechanism provide that the scaffolded consolidation does not?" Loop 2 should begin only if this question produces a clear gap that thematic consolidation cannot fill.

---

### Coverage gaps

**Gap 1 — P2:** The cycle title names "corpus topology" but the question set does not define what a healthy topology looks like. The topology sub-question (Question 2) asks whether the 5 ADRs are one or five moves. But topology compression requires a criterion for what a well-compressed topology would look like. Without this, the Loop 1 analysis has no benchmark against which to judge whether the 5 ADRs are well-structured or over-structured. Prior work (ADR-083, ADR-095) defines admissibility criteria for individual artifacts; no prior ADR defines a topology-level structure criterion. The question set should include or anticipate a topology-normative criterion question: "What does a well-formed cycle ADR topology look like?" without which "compressible" is underdefined.

**Gap 2 — P3:** The audience-bifurcation reframing (Step 1.3) widens the cycle's scope substantially. The question set does not include a question that tests whether the prior partial answers in ADRs 072, 083, 084, 085, 092, 095 are converging toward a single unifying pattern the methodology has not yet named, or are five separate patches pulling in different directions. The user's reframing ("I attempt to graduate them by removing the artifact trail") suggests the current partial answers have not resolved the frustration. A coverage question: "What have the prior audience-bifurcation moves collectively achieved, and what residual does the user's reported frustration name that they have not addressed?" This is distinct from the topology question and from the substrate question; it is a pattern-synthesis question that could change the cycle's scope if the prior moves are found to be incoherent at the pattern level.

---

### Recommendations

**P1-A — Constraint-removal addendum before Loop 1 begins (high priority).**

The Step 1.2 constraint-removal response closes with "The research does not need to re-argue whether ADRs themselves are necessary" but does not record the structural alternative families before accepting that conclusion. Add a brief addendum naming the three families (decisions-as-scenarios-only; decisions-as-living-narrative; decisions-as-graph-only) and the user's one-sentence position on each. The specific question to surface: "Would decisions-as-scenarios-only (encoding design decisions as refutable behavior scenarios rather than narrative ADRs) satisfy the commitment-function you associate with ADRs?" If the answer is yes, that alternative collapses the topology problem and the substrate problem simultaneously. If no, record why — that answer becomes a carry-forward research input for the loop structure.

**P1-B — Incongruity threshold question at Loop 1 close (high priority).**

Add to the Loop 1 output a mandatory threshold question: "Does scaffolding the user's existing thematic-consolidation practice satisfy the graduation-phase legibility need without a substrate mechanism?" Loop 2 (substrate lit-review) and Loop 5 (substrate spike) are conditional on this question producing a clear gap. If Loop 1 finds that thematic consolidation (scaffolded) is sufficient, the cycle should scope to the scaffolding ADR and hold the substrate work for a future cycle with more evidence.

**P2-A — Reformulate Question 2 to bracket "unnecessary" (medium priority).**

Replace "expressed at unnecessary granularity" with "expressed at a granularity that may or may not be warranted." The research should test whether compression is safe, not only whether it is structurally possible. Compression that loses audit-substance fails the user's own stated requirement ("some other substrate that is also auditable"). The question should set up the audit-substance test explicitly.

**P2-B — Reformulate the primary question to remove solution-shape (medium priority).**

Remove the parenthetical "(user's candidate: a knowledge graph...)" from the primary question and relocate it to the research plan as a candidate substrate direction. The primary question should be clean of solution-shape references: "Does the RDD corpus exhibit an uneven topology, and what would it mean to serve both graduation-phase legibility for practitioners and agent navigability on the same corpus — without assuming the two require the same structural mechanism?"

**P2-C — Add topology normative criterion (medium priority).**

Either add a question or add a Loop 1 task: "What would a well-formed ADR topology look like for a cycle of Cycle 019's scope?" Without this benchmark, the Loop 1 topology analysis has no standard against which to judge whether 5 is too many, just right, or unexpectedly few.

**P3-A — Audience-bifurcation pattern synthesis (lower priority).**

Optionally add a scoped prior-art synthesis task to Loop 1 or as a sub-task of Loop 2: catalog what the prior six audience-bifurcation ADRs (072, 083, 084, 085, 092, 095) collectively achieved against the user's stated frustration. This surfaces whether the cycle is extending a coherent pattern or patching an incoherent one. Can be scoped narrowly — a one-page synthesis of what the prior partial answers do and do not cover is sufficient. If the prior answers are coherent but incomplete, the cycle's scope narrows appropriately. If the prior answers are pulling in different directions, the cycle's scope may need to address the incoherence before proposing additional patches.

---

## Concerns specific to this cycle's context

### Solution-anchoring on JSON-linked-list

The research plan records the JSON-linked-list candidate as "candidate substrate direction, not adopted as the methodology answer" and Loop 2 examines alternatives. This bracketing is **marginally sufficient but fragile**. The issue is sequencing: Loop 2 (substrate lit-review) is the loop that examines alternative substrates, but the Loop 5 spike question is already written with the JSON-linked-list as its specific target ("Prototype a JSON-linked representation..."). The spike question was written before the lit-review ran. If Loop 2 finds that the JSON-linked-list candidate is one of several viable approaches, the spike question's pre-commitment to the JSON-linked form may anchor the spike's design even when the lit-review nominally examines alternatives. The bracketing claim requires that Loop 2 visibly updates the spike question if the lit-review evidence supports a different candidate. The current plan does not have an explicit step that says "Loop 2 output revises the Loop 5 spike target." Adding this explicit revision step would close the anchoring gap.

### Audience-bifurcation as new finding vs. extension of prior methodology direction

The cycle's Step 1.3 framing presents the audience-bifurcation reframing as a user-sharpening of the cycle's question. But the prior ADRs (072, 083, 084, 085, 092, 095) collectively constitute a multi-cycle progression on the audience-bifurcation question. The cycle is positioned to *extend* the pattern, but the research log does not explicitly address whether the extension hypothesis is the right positioning — it is also possible that the pattern needs revision, not extension, given that the user reports persistent frustration despite the prior moves. Both postures are legitimate; the question set should be explicit about which one the cycle tests.

The research log's Step 1.3 notes: "The user is reporting that frustration persists despite these moves. The cycle should examine the pattern: are the partial answers converging on something the methodology has not yet named, or pulling in different directions?" This is exactly the right question. It should be promoted from a Load-Bearing User-Evidence note to a named research question or Loop 1 task, rather than remaining as background context. If the partial answers are pulling in different directions, the cycle's extension assumption is wrong and the correct move is revision, not addition.

### Constraint-removal completeness

The user's treatment of ADRs' big-picture commitment function as irreplaceable is not fully established as the ADR-082 irreplaceable-artifact case. ADR-082 requires substantive engagement on record. The user's response ("I like ADRs from the standpoint that they communicate specific decisions") is engagement, but at one sentence of justification for a conclusion ("commitment function is irreplaceable") that forecloses a large region of the solution space. The three structural alternative families named above (decisions-as-scenarios-only; decisions-as-living-narrative; decisions-as-graph-only) are not performative alternatives — they are architecturally distinct patterns each with real-world adoption. Decisions-as-scenarios-only in particular is not hypothetical for this methodology: the DECIDE phase already produces behavior scenarios alongside ADRs, and the question of whether scenarios alone could carry what ADRs carry is an empirical question about this corpus, not a purely abstract one. The irreplaceable-artifact case is stronger when the user has named and rejected specific alternatives, not when alternatives were never surfaced. This is a P1 finding because it directly constrains the solution space the research will explore.
