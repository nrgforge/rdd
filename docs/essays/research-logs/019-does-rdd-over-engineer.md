# Research Log: Does RDD Over-Engineer?

**Cycle:** 019
**Started:** 2026-05-14
**Plugin version:** v0.8.6
**Artifact base:** `./docs/`

---

## Step 1.1 — Question articulation (pre-corpus-read)

The user has articulated the cycle's driving question via `/rdd:rdd` invocation, with the framing inherited verbatim from prior-cycle reflection (Reflection 016, Cycle 017 close). The question is written here as the research log's first content, **before** the agent re-reads the existing RDD methodology corpus for this research entry. The structural anchor (ADR-082 §1) is the artifact: the research log's first entry is the question.

### Driving question (primary)

> *Does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs?*

### Reflection-016 framing (secondary, source)

> *Whether RDD is creating over-engineered systems by front-loading thorough processes that open up wider spaces of possibility.*

A critique of the methodology's structural posture, not of any specific artifact.

### Source anchors

- `docs/domain-model.md:984` — Open Questions entry: *"(Cycle 017, future-cycle candidate) Does RDD over-engineer? ... deserves a dedicated cycle with its own constraint-removal protocol, lit-review, and audit cycle."*
- `docs/essays/reflections/016-initial-handoff-and-the-audience-at-the-margin.md` §"Side-question worth its own cycle: does RDD over-engineer?"

### What is already known or assumed (per cycle-entry feed-forward signals)

The methodology has already produced concept-level partial answers to overlapping questions; the research phase should reference these rather than rediscover them (see `.rdd/cycle-status.md` §From cycle entry, signal 3 — six prior partial answers including Reflection 005 "RDD as Deep Work Tool"; Invariant 4 amendment "productive, not merely brief"; ADR-014 "Worth the Calories"; ADR-083 Cognitive Economy Criterion; ADR-091 Dual-Mode BUILD; the graduation lifecycle).

### What would change the user's approach if the answer were different

Three load-bearing branches:

- **If "yes, RDD over-engineers"**: the methodology's structural posture itself needs amendment. Candidate amendments would target the front-loading character of the early-phase chain (RESEARCH + DISCOVER + MODEL + DECIDE) or the audit infrastructure's cost profile.
- **If "no, perceived over-engineering is methodology-mismatch"**: the question's resolution is graduation discipline and scoped-cycle calibration; the methodology's structural posture is right, and remediation is in applying RDD only where it earns its keep.
- **If "the question itself is mis-framed"**: a different diagnostic vocabulary is needed — possibly distinguishing process-tax (the methodology's own artifact output) from product-elaboration (the system the methodology helps design). The over-engineering may be in one layer, both, or neither.

### Reflexivity note

The methodology under critique runs the cycle. Two specific risks the research phase must hold (per cycle-status feed-forward signal 2):
- **Self-justification susceptibility** — agent training and corpus rationale may defend RDD without examining the critique.
- **Self-flagellation susceptibility** — equally, agent may over-correct toward the critique to demonstrate non-defensiveness.

Tier 1 architectural-isolation mechanisms (citation audit, argument audit with framing audit and pyramid graph-traversal, research-methods review, susceptibility snapshot) are the principal defenses. User pushback at the gate is the secondary defense.

---

## Step 1.2 — Constraint-removal prompt

### Most consequential bracketed artifact (user-selected)

**The early-phase chain: RESEARCH → DISCOVER → MODEL → DECIDE.**

The user's own question framing names "research front-loading" as the candidate mechanism, so the four upstream phases (the chain that runs before ARCHITECT and BUILD) are the natural artifact to bracket. The question explicitly investigates whether their presence produces elaborated possibility spaces exceeding what the user needs.

### Imagined-without-it framing

**SCOPE-OF-CLAIM CAVEAT (artifact-shape risk):** The user named the artifact but did not author the imagined-without-it framing in their reply; the framing below is **agent-generated**. The skill text (ADR-082 Step 1.2) warns this carries the artifact-shape risk — the agent's framing may be anchored on the same artifact the question is supposed to bracket. The research-methods-reviewer dispatch (Step 1.3) is the architectural-isolation defense; flagged framing issues are surfaced to the user at Step 1.4.

With that caveat recorded, the agent-generated framing:

Imagine a software-development methodology with no separate RESEARCH, DISCOVER, MODEL, or DECIDE phases — work begins at ARCHITECT or, more commonly, at BUILD. The default solution space the over-engineering question would open onto in that absence:

- **Replacement mechanisms for what the early-phase chain provides** would have to be named: how would assumptions be surfaced before code crystallized them? How would stakeholder needs be examined? How would domain vocabulary stabilize? Would decisions be recorded? In most contemporary software development, the answers are: assumptions surface during code review or in production incidents; stakeholder needs surface from tickets, conversations, and product-management briefs; vocabulary stabilizes by accretion; decisions are recorded inconsistently in PR descriptions, Slack threads, or not at all. The early-phase chain's absence does not eliminate these activities — it disperses them into less-structured surfaces.
- **The "elaborated possibility space" critique inverts**: without the early-phase chain, the question would not be "is the elaborated possibility space too wide?" but "is the possibility space examined at all?" The early-phase chain is the part of RDD that examines possibility space deliberately rather than letting it crystallize implicitly in code and tickets.
- **A counterfactual where over-engineering still occurs**: even without the early-phase chain, software systems become over-engineered through accretion — speculative generality, premature abstraction, half-finished features, hypothetical-future-requirement design. The early-phase chain may shift *when* over-elaboration occurs (upfront vs. accreted) rather than *whether* it occurs.
- **A counterfactual where over-engineering reduces**: alternatively, if the early-phase chain reliably produces system-design and ADR artifacts that downstream BUILD treats as "design must include all this," the absence might shrink built systems toward what the developer judges sufficient on the spot — at the cost of un-examined assumptions.

The bracketing does not settle the question. It surfaces that the over-engineering critique implicitly assumes a counterfactual (some other methodology or no methodology) whose own over-engineering profile is unspecified. The research phase should investigate this counterfactual rather than treat it as obviously better.

### What this surfaces for the research plan

Three research-plan implications from the bracketing:

1. The cycle's lit-review scope must include **methodologies that lack RDD's early-phase chain** (or equivalents) — agile/XP with no upfront design, vibe-coding, hack-and-ship, code-first cultures — and ask: what does their over-engineering profile look like? The over-engineering question is comparative, not absolute.
2. The cycle must distinguish **process-tax** (the methodology's own artifacts — ADRs, scenarios, domain models, system designs the methodology produces) from **product-elaboration** (the system the methodology helps design — built code, deployed features, infrastructure). The over-engineering may be in one layer, both, or neither.
3. The cycle should test whether RDD's existing partial answers (Reflection 005 deep-work-tool framing; Invariant 4 productive-not-brief; ADR-014 worth-the-calories; ADR-083 cognitive-economy; ADR-091 dual-mode BUILD; graduation lifecycle) sit at the right layer (process-tax remediation, product-elaboration remediation, or neither) and whether their coverage matches the over-engineering critique's actual scope.

---

## Step 1.3 — Research plan and reviewer dispatch

### Research plan (provisional, pending reviewer feedback)

**Layer A — Lit-review (academic literature; dispatched as a `/rdd-lit-review` subagent run):**

- **A1.** Over-engineering as a documented phenomenon in software methodologies — definitions, instances, measurement attempts. Including YAGNI literature, speculative generality (Fowler), gold-plating (PMBoK), and any empirical studies of process-induced elaboration.
- **A2.** Process-tax vs product-elaboration distinction in software engineering literature — does the field separate "the artifacts the methodology produces" from "the artifacts of the system being built"? Process-cost research, methodology-overhead empirical studies (where they exist).
- **A3.** Lightweight-vs-heavyweight methodology profiles and their over-engineering accumulation — agile/XP/scrum's stated anti-over-engineering posture vs measured outcomes; CMMI cost-vs-quality empirical research; methodology-mismatch literature (Cockburn's Crystal methodology-fit framework; situated methodology selection).
- **A4.** AI-pair-programming and methodology-overhead in the LLM era — recent literature (post-2022) on how generative AI changes the cost calculus of methodology artifacts. Are artifacts cheaper to produce now? Does cheaper production undermine YAGNI? Does AI-amplified production accelerate over-engineering?
- **A5.** Possibility-space / design-space literature in design research (Cross; Goel & Pirolli; design space exploration) — under what conditions does early-phase possibility-space exploration produce better-fit final designs vs worse-fit elaborated ones?

**Layer B — Web search (current practitioner discourse):**

- **B1.** Contemporary critique of AI-assisted software-engineering methodologies and their over-engineering profile — practitioner blog posts, conference talks, X/Twitter discourse 2024–2026. Sample: "AI methodology overhead," "AI code review overload," "specification overflow."
- **B2.** Spec-driven development and BMAD-style methodologies' reception — comparator methodologies in RDD's adjacent space; how their over-engineering risk has been discussed.

**Layer C — RDD corpus reflexive analysis (the methodology's own dogfood):**

- **C1.** Artifact-size accumulation across cycles — domain-model.md is 366KB; system-design.agents.md is 187KB; product-discovery.md is 182KB; scenarios.md is 257KB; cycle-status (active) was 30KB; 93 ADRs ranging from ~3KB to ~30KB. Is the per-cycle marginal cost growing? Is the corpus's read-cost growing past the threshold where it earns its keep?
- **C2.** The five candidate competing diagnoses (cycle-status feed-forward signal 5): methodology-mismatch / front-loading-amplifies-possibility-space / audit-infrastructure-cost / possibility-space-vs-need-space / process-vs-product-conflation. Which have empirical support in the corpus's own evidence?
- **C3.** Existing partial answers' fit-to-question — Reflection 005, Invariant 4, ADR-014, ADR-083, ADR-091, graduation lifecycle. Where do they cover the over-engineering critique, where don't they, and where do they (perhaps) miss the critique's actual target?
- **C4.** Cycle 018's specific cost profile as the most-recent fully-shipped case study — ~14 specialist subagent dispatches; both-form dogfooded production doubling audit costs; R1→R4 iteration. Was the cost-to-value ratio earned, and how would one know?

**Layer D — Validation spike (per ADR-087, decided at Step 4c):**

Deferred. The question is methodological/empirical, not technical. A prototype is unlikely to surface novel content the lit-review and corpus reflexive analysis cannot reach. The Step 4c decision branch will be re-examined after research loops produce content; a tightly-scoped prototype may surface in DECIDE or BUILD if a specific operationalizable amendment crystallizes.

### Loop sequencing

Loop 1: Layer A (lit-review). Lit-reviewer dispatched as subagent producing a citation-grounded synthesis report. Findings update the research log.

Loop 2: Layer B (web search). Targeted searches on practitioner discourse. Findings update the research log.

Loop 3: Layer C (RDD corpus reflexive analysis). Agent-conducted analysis with primary-source readings of the named artifacts. Findings update the research log.

Loop 4 (provisional): Synthesis loop. After Layers A–C, draft an integrating section that surfaces convergent findings, distinguishes process-tax from product-elaboration, and tests the five candidate diagnoses against the assembled evidence.

The user decides whether additional loops are needed before advancing to the Essay-Outline (Step 4).

### Research-methods-reviewer dispatch (R1)

The reviewer was dispatched on the question set (the primary question + reflexivity branches in Step 1.1) plus the constraint-removal response from Step 1.2.

Output path: `.rdd/audits/research-design-review-019.md` (R1, dated 2026-05-15).

---

## Step 1.4 — Reviewer findings and revisions

### Reviewer findings (R1)

The research-methods reviewer R1 surfaced **8 findings (3 P1, 4 P2, 1 P3 + 1 informational)**:

**P1 (load-bearing):**
- **Finding 3**: The driving question presupposes the mechanism. "Produces" is a causal verb; "research front-loading" is mechanism-naming language. Both presuppositions narrow the research space before investigation — committing to one of five candidate diagnoses (front-loading-amplifies-possibility-space) and treating it as a premise.
- **Finding 8**: The agent-generated constraint-removal framing is artifact-shaped in two ways: (a) it defends the artifact rather than bracketing it (all four imagined-without-it observations argue for the chain's value or equivalence; no structured alternatives are named); (b) it stays anchored on the early-phase chain when audit-infrastructure may be a more consequential bracketing target (Cycle 018 dispatched ~14 specialist subagents — the cost profile of that verification layer is non-trivial and may exceed the early-phase chain's profile for some cycle types).

**P2:**
- **Finding 1**: The question is artifact-framed ("research front-loading") rather than need-framed ("when do practitioners find the early phases produce more than they use?"). Layer A lit-review scope is sensitive to this.
- **Finding 4**: Branch B forecloses three of five candidate diagnoses by routing all non-yes outcomes through "methodology-mismatch / graduation discipline." Audit-infrastructure-cost, process-vs-product-conflation, and possibility-space-vs-need-space each represent distinct "no" answers with different remediation paths.
- **Finding 5**: Prior-art treatment is downstream (Layer C) rather than formative (built into the question). The lit-review would run without knowing whether the corpus's prior partial answers already cover the question.
- **Finding 7**: A four-loop research plan is proposed for a question where six prior partial answers already exist. The lit-review (Layer A, Loop 1) is sequenced before the prior-art examination (Layer C, Loop 3), risking lit-review scope being uncalibrated against the corpus's existing answers.

**P3 + informational:**
- **Finding 2**: "What the user actually needs" is an undefined baseline; the comparative is unfalsifiable as written.
- **Finding 9**: Naming both self-justification and self-flagellation susceptibility symmetrically does not produce symmetric inquiry if question framing, artifact selection, and branch structure all lean in the same direction (toward the critique).

### User decision (Step 1.4)

User adopted the recommended package (2026-05-15): adopt the reviewer's question reformulation, dual-bracket (keep early-phase chain + add audit-infrastructure), reorder loops, expand branches, re-dispatch reviewer on revised set.

### Revised driving question (supersedes Step 1.1)

**SUPERSESSION**: The driving question below replaces the question framed in Step 1.1 for downstream consumption. The original framing is preserved verbatim in Step 1.1 as the source-anchor record (it is Reflection 016's verbatim framing, which the cycle inherits as the practitioner-originated form of the question).

**Revised driving question:**

> *Where in RDD's process, if anywhere, does elaboration accumulate beyond what practitioners find valuable — and what mechanism best accounts for it?*

What this revision does:
- Removes the causal-claim presupposition ("produces" → "accumulate beyond what practitioners find valuable")
- Removes the mechanism-presupposition ("research front-loading" → "where in RDD's process, if anywhere")
- Removes the unfalsifiable-baseline framing ("what the user actually needs" → "what practitioners find valuable") — anchors the comparative on practitioner judgment rather than an external needs baseline
- Adds "if anywhere" to hold the affirmative answer as one of three possibilities (yes / no / mis-framed) rather than as the implicit premise

### Revised constraint-removal (supersedes Step 1.2; dual-bracketing)

**SUPERSESSION**: The dual-bracketing below replaces the single-artifact constraint-removal in Step 1.2 for downstream consumption. The user's original artifact selection (early-phase chain) is preserved as Artifact 1; the reviewer's recommended second target (audit-infrastructure) is added as Artifact 2. Both framings use the structured-alternatives prompt rather than the dispersal-counterfactual prompt.

**SCOPE-OF-CLAIM CAVEAT (artifact-shape risk, ongoing):** The framings below remain agent-generated; the user authorized the package but did not author the framings. The artifact-shape risk persists — recorded explicitly so the re-dispatched research-methods reviewer (R2) can evaluate whether the new framings actually bracket vs. defend.

---

#### Artifact 1: Early-phase chain (RESEARCH → DISCOVER → MODEL → DECIDE)

**Structured-alternatives prompt:** What structured alternatives to the early-phase chain would achieve similar epistemic goals (surfacing assumptions before code crystallizes them, establishing domain vocabulary, examining stakeholder needs, recording decisions) at lower process cost?

**Agent-generated structured alternatives to consider:**

1. **Type-driven design with property-based testing.** Surface assumptions through type signatures and invariant-bearing properties rather than through written domain models; the type system carries some of the invariant-tracking work. Property-based tests carry some of the scenario-articulation work. *Over-engineering profile:* may over-elaborate types or properties; under-documents non-formal decisions; performs poorly when domain vocabulary itself is contested.

2. **Pair-walkthrough discovery sessions.** Replace written product-discovery with timeboxed stakeholder-walkthrough sessions producing minimal decision notes (no full discovery document). *Over-engineering profile:* depends on stakeholder availability; loses the surface where written examination catches what conversation misses; may under-record assumption inversions and value tensions.

3. **Sketch-and-iterate.** A single short brief (1–2 pages max) covering goals, key constraints, and initial decisions; revisited at code-time when ambiguity surfaces. No separate research, model, or decide phases. *Over-engineering profile:* shifts elaboration to code-time when stakes are higher; may produce ad-hoc decisions that are harder to audit later.

4. **Spec-driven development with executable specs.** Executable specifications (BDD scenarios, property tests) are the primary artifact; no separate domain model or system design as separate documents. Spec lives in the codebase. *Over-engineering profile:* may over-elaborate specs; under-documents the rationale behind decisions; performs poorly when the spec form itself is contested.

5. **Decision-record-only methodology.** Only ADRs are produced; no domain model, no scenarios, no system design as separate artifacts. ADRs reference each other and the code. *Over-engineering profile:* may under-document vocabulary and stakeholder context; performs poorly on assumption-surfacing.

**What the bracketing surfaces:** Each alternative targets the same epistemic goals as the early-phase chain through structurally different means. Each carries its own over-engineering profile. The over-engineering question becomes comparative: does RDD's early-phase chain produce more elaboration than alternative methodologies achieving the same epistemic work, or is the elaboration RDD produces commensurate with (or less than) the elaboration alternatives would produce? The research phase should engage at least 2-3 of these alternatives substantively rather than treating "absence of the chain" as the only counterfactual.

---

#### Artifact 2: Audit infrastructure (Tier 1 specialist subagents, iterative-audit rounds)

**Structured-alternatives prompt:** What structured alternatives to RDD's specialist subagent audit infrastructure would achieve similar epistemic goals (catching framing-adoption, verifying citations, surfacing logical gaps, identifying susceptibility patterns, providing architectural isolation) at lower per-cycle cost?

**Agent-generated structured alternatives to consider:**

1. **Single-pass audit (no R-rounds).** One audit per artifact, accept the result; no R1→R2→R3→R4 iteration. Saves substantial cost. *Trade-off:* loses the convergent error-correction pattern Cycle 018 documented; second-pass framing issues may go undetected.

2. **Sampled audit.** Every Nth artifact gets audited; saves coverage cost. *Trade-off:* probabilistic gap coverage; specific artifacts may slip through unaudited.

3. **Self-audit with rubric (no isolated context).** The same agent runs through an audit rubric on its own output. No architectural isolation. *Trade-off:* gives up the Self-Correction Blind Spot defense (ADR-058); cheaper but the in-context agent's susceptibility is unmitigated.

4. **User-as-auditor with checklists.** User runs through structured checklists for each artifact; no specialist subagents. *Trade-off:* shifts audit cost from subagent dispatch to user attention; depends on user availability and discipline.

5. **Catastrophic-only audit.** Audits run only when the user flags concerns or when stewardship signals fire (Outline-Coherence Signal, etc.); no preventive audit at every artifact. *Trade-off:* depends on signal sensitivity; preventive coverage drops to zero outside the trigger surface.

6. **Inline calibration markers only.** The artifact carries epistemic-strength tags (working hypothesis, directional, empirically established) but no separate audit subagent. *Trade-off:* gives up independent verification entirely; calibration markers are agent-generated and carry the same susceptibility as the artifact.

7. **Periodic external review.** Replace per-cycle audit subagents with periodic external reviews (human reviewers, automated linters, infrequent but deeper passes). *Trade-off:* depends on external-reviewer availability; loses per-cycle continuity.

8. **No specialist subagents; rely on gate conversations.** The user's gate engagement is the audit; no separate audit infrastructure. *Trade-off:* gives up architectural isolation; depends entirely on user's gate engagement quality.

**What the bracketing surfaces:** The audit infrastructure's per-cycle cost is concrete and measurable (~14 specialist subagent dispatches in Cycle 018, multiplied by the iterative-audit pattern). Each structured alternative trades cost against a specific defense the current architecture provides. The over-engineering question becomes: does the current audit architecture's per-cycle cost match the cost of the failures it prevents, and would any of the alternatives achieve a substantially better cost-to-prevented-failure ratio for the workload RDD is actually doing?

---

### Revised three-branch frame (supersedes Step 1.1 branches)

The branches in Step 1.1 ("yes / no, methodology-mismatch / mis-framed") foreclosed three of five candidate diagnoses. Revised five-branch structure:

- **Branch A (yes-by-front-loading):** RDD's early-phase chain front-loading drives over-elaboration. Amendment target: the early-phase chain itself (or its scope-setting).
- **Branch B (yes-by-audit-infrastructure):** The audit infrastructure produces diminishing returns; the verification overhead exceeds the failure-prevention value for the workload. Amendment target: audit scope calibration (which artifacts get audited, how many rounds, when self-audit suffices).
- **Branch C (no-by-methodology-mismatch):** RDD's structural posture is calibrated for high-stakes / identity-forming work; perceived over-engineering reflects practitioners applying it to lower-stakes work. Amendment target: graduation discipline; scoped-cycle calibration.
- **Branch D (no-by-possibility-space-navigation):** RDD opens a wide possibility space and relies on practitioners to navigate to what they need. The failure (if any) is navigation, not elaboration. Amendment target: scope-setting guidance; navigation aids.
- **Branch E (mis-framed-as-process-vs-product-conflation):** The over-engineering, if any, is in the *methodology's own artifacts* (process-tax) rather than in the *systems the methodology helps design* (product-elaboration). Amendment target: artifact-scope calibration; the methodology's own corpus rather than the systems it produces.

The five branches map 1:1 to the five candidate competing diagnoses in cycle-status feed-forward signal 5. Branches A and B are "yes" routes (with different mechanisms and different amendments). Branches C and D are "no" routes (with different rationales and different remediations). Branch E is the mis-framing route.

### Revised research plan loop sequencing (supersedes Step 1.3)

The reviewer recommends running Layer C's prior-art-fit-to-question pre-pass BEFORE the lit-review, so the lit-review scope is calibrated against genuine gaps rather than rediscovering what the corpus has partially answered.

**Revised loop sequence:**

- **Loop 1: Layer C3 pre-pass (prior-art fit-to-question).** Examine the six prior partial answers (Reflection 005, Invariant 4, ADR-014, ADR-083, ADR-091, graduation lifecycle) against the revised driving question and the five branches. Identify where the prior art covers each branch, where it leaves gaps, and what new investigation is genuinely needed.
- **Loop 2: Layer A lit-review** (scoped to the gaps identified in Loop 1). The lit-reviewer dispatch brief frames both hypotheses with equal investigative weight per Finding 9 recommendation.
- **Loop 3: Layer B web search** (current practitioner discourse, scoped to gaps).
- **Loop 4: Layer C1, C2, C4** (corpus reflexive analysis — artifact-size accumulation, candidate-diagnoses test against corpus evidence, Cycle 018 case study).
- **Loop 5: Synthesis** — integrating section; test five candidate diagnoses against assembled evidence.

### Research-methods-reviewer R2 dispatch

R2 dispatched on the revised question set; output at `.rdd/audits/research-design-review-019-r2.md`.

**R2 verdict: ready for research-loop dispatch.**

- All three R1 P1s **RESOLVED** (mechanism-presupposition removed; dual-bracketing with structured-alternatives prompts; structured alternatives are substantive, not straw).
- All four R1 P2s and the R1 P3 **RESOLVED** (five-branch frame maps 1:1 to candidate diagnoses; loop reordering addresses prior-art formative integration; practitioners-find-valuable replaces unfalsifiable baseline).
- R1 Finding 9 (reflexivity posture) **PARTIALLY-RESOLVED**: structural lean in question set corrected; dispatch-brief design carryover remains (Loop 2 lit-reviewer brief should frame both hypotheses with equal investigative weight).

**Three new R2-surfaced items (carryover into loop dispatch briefs, not question-set revisions):**

- **B1 (P2)**: "Practitioners" is now the load-bearing term in the baseline, but has three incompatible referent populations (this-user-as-sole-practitioner / RDD-practitioners-as-population / comparable-methodology-practitioners-as-proxy). Loop 2 dispatch brief MUST include a one-line working specification of the referent population.
- **B2 (P2)**: The audit infrastructure runs inside the early-phase chain in RDD's actual process; Artifact 1 and Artifact 2 are not fully separable bracketing targets. Branches A and B may be compounding effects of one mechanism rather than independent diagnoses. The Loop 1 C3 pre-pass should surface whether the prior art treats the costs as separable; the synthesis loop must address this.
- **B-P3 (P3)**: Artifact 1 structured alternatives are weighted toward technical/formal alternatives; organizational/process alternatives (continuous stakeholder pairing, architecture review boards, narrative design sessions) are under-represented. Loop 2 brief can flag this as additional lit-review scope.

Carryover items are recorded against Loops 1–5 dispatch briefs (the lit-review brief for B1 and B-P3; the C3 pre-pass for B2; the synthesis brief for B2's compounding-effects question).

---

## Step 1.5 — Research loops begin

Loop sequencing (per revised plan in Step 1.4):
- **Loop 1: Layer C3 pre-pass** — prior-art fit-to-question against the five branches (begins now)
- **Loop 2: Layer A lit-review** (gap-calibrated by Loop 1; brief incorporates B1, B-P3, Finding 9 carryovers)
- **Loop 3: Layer B web search** (gap-calibrated by Loops 1–2)
- **Loop 4: Layer C1, C2, C4** corpus reflexive analysis
- **Loop 5: synthesis**

---

## Loop 1: Layer C3 pre-pass — prior-art fit-to-question

**Method:** Agent-conducted primary-source readings of the six prior partial answers (Reflection 005, Invariant 4, ADR-014, ADR-083, ADR-091, graduation lifecycle). For each prior answer: identify what over-engineering concern it addresses; which of the five branches it covers; what it leaves un-addressed. Synthesize coverage map and identify branches with genuine gaps.

**B2 carryover for this loop:** Whether the prior art treats the early-phase chain's cost and the audit-infrastructure's cost as separable, or whether prior art treats them as compounding effects of one mechanism.

### Primary-source readings

**1. Reflection 005 ("Roadmap, Field Guide, and Document Sizing"; deep-work-tool framing).** Section "RDD as a Deep Work Tool" (lines 20–34). RDD is not a permanent methodology that owns the project's documentation; it is a deep work tool reached for when a problem warrants structured thinking, put away when knowledge has been absorbed. Lifecycle: identify problem → scope to subfolder → run cycles → graduate knowledge into native docs → archive. Connects to Invariant 6 (scaffolding must fade) applied at the methodology level. The graduation trigger is a felt phase transition from identity-forming work ("we're building and understanding what this is") to feature-extending work ("we know what this is, now we're working on features").

**2. Invariant 4 (`domain-model.md:31`).** "Epistemic cost must be productive, not merely brief. Each gate's time must build understanding. The constraint is on *waste* (formulaic exchanges that build nothing), not on *duration* (a teaching conversation that resolves a real comprehension gap). Productive gates may take longer when the Attend-Interpret-Decide cycle reveals the user needs teaching; this is the methodology working, not failing. Earned fatigue from deep engagement is a signal to take a break, not a signal that the methodology is too heavy."

**3. ADR-014 ("Worth the Calories" Quality Gate; Status: Proposed).** Three-test gate applied at SYNTHESIS phase during synthesis-essay framing: Davis Test (assumption denial), ABT Test (And/But/Therefore narrative), Inversion Test (negates audience belief). "If no framing passes all three tests, the honest answer is: this cycle did not produce an essay worth writing." Authorial discipline at the synthesis layer. NOT a check on whether the cycle itself was worth running — only on whether the cycle's synthesis essay deserves publication.

**4. ADR-083 (Cognitive Economy Criterion; Status: Proposed).** Outcome Test as admissibility criterion for human-facing artifacts: "does this produce direct human understanding without AI as workaround?" In-place-first default (improve existing artifacts before adding new ones). Bolt-on / felt-additional as failure-mode signal (when an explainer doc gets proposed as a workaround for thick original docs, the original docs need fixing instead). Methodology-wide default with named exception conditions (audience asymmetry, content-divergence, documentation-fatigue at post-graduation lifecycle position, zero-prior-familiarity reader cohort). Encoded at methodology-principle level (Tier 2); invariant elevation held open for future cycle.

**5. ADR-091 (Dual-Mode BUILD; Status: Proposed).** Recognizes two BUILD patterns: gated mode (per-scenario-group EPISTEMIC GATES with AID cycle) and auto mode (autonomous execution after high-level practitioner direction). Mode-selection axes: (1) mechanical-vs-generative work character (primary); (2) practitioner availability and cognitive budget; (3) cycle stakes and reversibility; (4) stewardship locality (catching vs. teaching). Auto mode delivers catching (drift detection, test verification, conformance pass) but not teaching (design-alternative examination, scoping-judgment surfacing). Practitioner declares; methodology surfaces the question; default is `gated`. Scope is BUILD layer only.

**6. Graduation lifecycle (ADR-025 + Reflection 005 framing + domain-model concepts).** Conformance audit (`/rdd-conform`) + graduation (`/rdd-graduate`) as paired mechanisms. Scope → cycle → graduate. Scoped Cycle subfolders. Graduation folds durable knowledge into native project docs; archives RDD-specific artifacts. Triggered by the felt phase transition from identity-forming to feature-extending work. Pace Regulator concept frames RDD as counter-practice to AI productivity loop: "the value proposition is not productivity but the felt experience of understanding."

### Coverage map: prior answers × five branches

The five branches:
- **Branch A** (yes-by-front-loading) — early-phase chain drives over-elaboration; remedy is the chain itself.
- **Branch B** (yes-by-audit-infrastructure) — verification overhead exceeds prevention value; remedy is audit-scope calibration.
- **Branch C** (no-by-methodology-mismatch) — RDD's posture is calibrated for high-stakes/identity-forming work; remedy is graduation discipline.
- **Branch D** (no-by-possibility-space-navigation) — RDD opens wide space; failure (if any) is navigation, not elaboration; remedy is scope-setting guidance.
- **Branch E** (mis-framed-as-process-vs-product-conflation) — over-engineering is in methodology's own artifacts, not in systems built; remedy is artifact-scope calibration.

| Prior partial answer | Branch A | Branch B | Branch C | Branch D | Branch E |
|---|---|---|---|---|---|
| Reflection 005 (deep-work-tool) | — | — | **STRONG** | — | partial |
| Invariant 4 (productive-not-brief) | weak | — | — | — | — |
| ADR-014 (Worth the Calories) | — | — | — | — | partial (SYNTHESIS scope only) |
| ADR-083 (Cognitive Economy) | — | — | — | partial | **STRONG** (human-artifact scope) |
| ADR-091 (Dual-Mode BUILD) | — | partial (BUILD scope only) | — | — | — |
| Graduation lifecycle | — | — | **STRONG** | — | — |

**STRONG** = the prior answer is structurally responsive to the branch (gives a remedy that maps to the branch's amendment target).
**partial** = the prior answer addresses part of the branch's scope but not the full territory.
**weak** = the prior answer addresses adjacent concerns but does not target the branch's mechanism.
**—** = no engagement.

### Branch-by-branch synthesis

**Branch A (yes-by-front-loading): WEAK COVERAGE.** No prior answer treats the early-phase chain as the unit of analysis or as a potential over-elaboration source. Invariant 4 addresses gates (which span all phases, not specifically the early chain) and frames gate cost as productive-not-wasteful (assumes the gate is doing work, doesn't ask whether the whole early-phase chain is producing work worth doing). **Gap: there is no existing methodology principle that asks whether the early-phase chain *as a chain* is calibrated to the cycle's actual stakes.** Branch A's investigation is genuinely open — the methodology has not addressed it.

**Branch B (yes-by-audit-infrastructure): PARTIAL COVERAGE (BUILD-scoped only).** ADR-091 addresses the catching-vs-teaching tradeoff in BUILD by introducing dual mode. The same calculus does not exist for the early-phase chain's audit infrastructure (citation audit, argument audit with framing audit + pyramid graph-traversal, susceptibility snapshot, research-methods reviewer, conformance scan). The audit infrastructure runs in full at every phase — there is no "auto mode" for RESEARCH, DISCOVER, MODEL, DECIDE, ARCHITECT. **Gap: ADR-091's dual-mode logic is structurally limited to BUILD; whether it generalizes to upstream phases (e.g., an "auto mode" with sampled or single-pass auditing for mechanical research cycles) has not been examined.** Branch B's investigation is largely open.

**Branch C (no-by-methodology-mismatch): STRONG COVERAGE.** Reflection 005's deep-work-tool framing and the graduation lifecycle (ADR-025) together constitute a substantial answer: RDD is designed for problems that warrant structured thinking; perceived over-engineering signals either methodology-mismatch (the problem doesn't warrant it) or post-purpose state (the methodology has done its job and should be graduated). The remedy is in place: scope cycles to problems that warrant them; graduate when work shifts from identity-forming to feature-extending. **Gap: the diagnostic for "is this problem identity-forming enough to warrant RDD?" is felt-judgment, not operationalized — practitioners adopting RDD have no entry criterion beyond "reach for it when warranted."** The remedy exists; the entry-side calibration is informal.

**Branch D (no-by-possibility-space-navigation): WEAK COVERAGE.** ADR-083's Outcome Test and in-place-first default address navigation-failure-as-failure for human-facing artifacts but do not address possibility-space navigation as a general phenomenon (when RDD's research opens a space wider than the user needs, what guides navigation to the subset relevant to the current cycle?). **Gap: the methodology does not have an explicit navigation criterion for the possibility space opened by research. Scope-setting happens upstream (at cycle entry, in product discovery's stakeholder maps) but the "what subset of the elaborated space am I using?" question is implicit.** Branch D's investigation is open.

**Branch E (mis-framed-as-process-vs-product-conflation): STRONG COVERAGE (within scope).** ADR-083 is structurally aimed at exactly this branch — it asks whether the methodology's *artifacts* over-elaborate for human readers. The Outcome Test, in-place-first default, and bolt-on / felt-additional signal together constitute an answer for the artifact layer: admissibility criterion that distinguishes "this artifact produces understanding" from "this artifact is process-tax." ADR-014 covers a sub-scope (the synthesis essay specifically). **Gap: ADR-083's scope is human-facing artifacts specifically (entry points, on-ramps for first-encounter readers, orientation aids). It does not address agent-facing artifacts (ADRs, scenarios, system designs, domain models in their current form, audit reports) — which are the bulk of RDD's artifact output and the more likely target of the process-vs-product critique.** Branch E is well-covered for human-reading layer; agent-reading layer is open.

### B2 carryover answer: are early-phase chain cost and audit-infrastructure cost separable in the prior art?

**No.** None of the six prior partial answers treats the audit-infrastructure cost as a separable concern from the broader "process cost" frame. The methodology has addressed cost at:
- The gate layer (Invariant 4)
- The synthesis essay layer (ADR-014)
- The human-facing artifact admissibility layer (ADR-083)
- The BUILD phase pattern layer (ADR-091)
- The cycle-as-a-whole lifecycle layer (Reflection 005 / graduation)

None of these scope to the audit infrastructure specifically. The audit infrastructure has been treated implicitly as part of "the methodology's structural posture" — its cost is the cost the methodology pays for architectural-isolation defenses against sycophancy and framing-adoption (ADR-058, ADR-061, etc.). Its cost has not been questioned as a separable optimization target.

**Implication for the cycle's research:** the audit-infrastructure cost is **genuinely novel territory** for this research cycle. The prior art neither defends it nor critiques it — it has been infrastructure that was added when the methodology needed it (Cycle 9 introduced Tier 1 audits; Cycle 18 extended argument-auditor with pyramid graph-traversal) without a calibration mechanism to ask whether the cost is right. Branch B's mechanism is the cycle's most underexamined investigation target.

### Loop 1 conclusions and Loop 2 (lit-review) scope calibration

The prior art covers:
- Branch C strongly (deep-work-tool framing + graduation lifecycle)
- Branch E strongly (within human-facing artifact scope; ADR-083 + ADR-014)

The prior art leaves substantial gaps in:
- Branch A (early-phase chain as a chain; no existing principle asks whether the chain itself is over-calibrated)
- Branch B (audit infrastructure as a separable cost concern; the entire territory is novel)
- Branch D (possibility-space navigation; scope-setting is upstream-implicit, no explicit navigation criterion)
- Branch E (agent-facing artifact layer — ADRs, scenarios, system designs, domain models — which is the bulk of RDD's output)

**Loop 2 (lit-review) scope calibration:**

The lit-review should NOT re-investigate Branch C's territory (deep-work-tool framing) or the human-facing-artifact subset of Branch E (Outcome Test). Those are well-covered.

The lit-review SHOULD focus on:
- **Branch A**: methodology research on early-phase-chain calibration (waterfall vs. agile vs. lean; upfront-design-vs-emergent-design empirical research; specification-heavy methodology cost research; CMMI process-cost vs. quality empirical research)
- **Branch B**: audit-infrastructure cost research (formal-verification cost-vs-defect-prevention research; code-review density empirical research; gatekeeping-vs-throughput tradeoffs in software engineering; LLM-evaluation cost research)
- **Branch D**: possibility-space navigation literature (design space exploration; the Cross / Goel & Pirolli tradition; "satisficing vs. optimizing" in design)
- **Branch E (agent-facing layer)**: artifact-form-vs-consumption research; documentation-for-AI literature; spec-driven development critique; the BMAD / spec-driven methodology overhead discussion

The lit-review brief MUST include the three Loop-2 carryovers from R2:
- B1: working specification of "practitioners" referent (this-user as primary, with comparator-methodology practitioners as a secondary lens for cross-methodology comparison)
- B-P3: organizational/process alternatives (continuous stakeholder pairing, architecture review boards, narrative design sessions) as additional scope
- Finding 9: frame both hypotheses ("over-engineering critique warranted" AND "perceived over-engineering is methodology-mismatch or expectation mismatch") with equal investigative weight; neither treated as null

### Loop 1 conclusion: ready to dispatch Loop 2 (lit-review)

The C3 pre-pass surfaced three meaningful contributions:
1. **Branches A and B are genuinely under-examined territory; the lit-review should concentrate scope here.** Branch C and the human-side of Branch E are well-covered and need not be re-investigated.
2. **The audit-infrastructure cost (Branch B) is novel territory for the methodology itself; the prior art has no separation between early-phase chain cost and audit infrastructure cost.** This is itself a finding worth recording.
3. **Branch E has two distinct subsets (human-facing artifacts: covered by ADR-083; agent-facing artifacts: substantively uncovered).** The lit-review and corpus reflexive analysis should distinguish these.

---

## Loop 2: Layer A lit-review — methodology overhead and the over-engineering question

**Method:** Lit-reviewer specialist subagent dispatched with gap-calibrated scope (Branches A and B as primary; D and E as secondary; B-P3 organizational alternatives as tertiary). 32 sources reviewed.

**Output:** `./docs/essays/research-logs/lit-review-019-methodology-overhead.md`

### Branch-by-branch findings (lit-review evidence)

**Branch A (early-phase-chain calibration):**
- YAGNI/cost-of-carry frame (Fowler 1999/2015; Beck 1999) is the strongest analytic tool — but scoped to *code capabilities*, not methodology artifacts. **No parallel YAGNI analysis exists for ADRs, domain models, or research phases.**
- Boehm's cost-of-defects-by-phase (1981) is directionally sound but empirically contested (Bossavit 2012); does not generalize cleanly to small-team/solo development.
- **Cockburn's Crystal methodology-fit framework (2004) is the most calibrating source.** Crystal Clear prescribes very light process for solo developers — heavier than RDD's process for solo-team-size. But Crystal explicitly admits heavier process for high-criticality novel problems. RDD's stated domain (identity-forming, methodologically novel, cross-session knowledge persistence) sits in Crystal's heavier-process quadrant. The methodology-mismatch hypothesis has direct purchase: RDD's chain may be appropriate for high-criticality novel problems but mis-applied to lower-criticality work below the threshold.
- Rahman & Cysneiros (2024): agile methods generate MORE requirements-related defects than waterfall — *under-elaboration has a cost*. Supports the over-engineering critique only insofar as the cycle can show RDD elaborates past the proportionality point.
- **B-P3 organizational alternatives** (XP on-site customer, lean startup customer development): degrade systematically under solo-developer + cross-session conditions. For RDD's specific context, organizational alternatives without written artifacts perform worse.

**Branch B (audit-infrastructure cost):**
- Fagan (1976) inspection finds 80-90% defects with ~30x payback — foundational support for RDD's audit rationale.
- Bacchelli & Bird (2013) ICSE study: modern code review's *primary documented benefit* is knowledge transfer, team awareness, alternative solution generation — NOT defect detection. **In solo context, the knowledge-transfer mechanism does not apply.** The case for RDD's audit infrastructure in solo context must rest on defect detection (specifically, catching sycophancy-induced framing-adoption).
- Iterative-review diminishing returns (consistent across human + LLM): largest gains in rounds 1-2; 3-5 rounds productive for critical content; over-refinement past 5 rearranges errors without removing them. **RDD's R1→R4 pattern sits at the upper edge of the productive range.**
- Liu et al. (2024): LLMs cannot reliably self-correct without external feedback; isolated auditors structurally better. **Architectural-isolation design of RDD's specialist subagents is empirically grounded.**
- LLM-as-judge in expert-knowledge domains (Zheng et al. 2024; ACL 2025): 60-68% agreement with SMEs (vs. 80%+ on instruction-following). RDD's audit artifacts sit at the expert-knowledge end — genuine precision limit.
- **Most consequential finding**: the intersection of (a) iterative multi-round review × (b) qualitative research artifacts × (c) LLM specialist auditors × (d) solo-developer context has **no direct empirical literature**. The Branch B question remains genuinely open after Loop 2.

**Branch D (possibility-space navigation):**
- Goel & Pirolli (1992): problem-structuring IS the work for ill-structured problems, not preamble. Inverts the "early-phase chain is unnecessary preamble" framing.
- Cross/Simon: satisficing, not optimizing — the over-engineering critique requires showing RDD elaborates PAST the satisficing point, not just that elaboration occurs.
- Lawson (2006); Goel & Pirolli (1992): **expert designers do MORE upfront breadth-first exploration, not less. RDD's early-phase chain models expert design behavior.**
- Gero & Kan (2011); Zanker et al. (2019): design fixation as failure mode of early commitment. Spec-driven/type-driven/sketch-and-iterate alternatives EACH involve early-form-commitment that could induce fixation.
- Pirolli & Card (1999): information foraging's patch-switching criterion. **RDD does NOT have an explicit patch-switching criterion for RESEARCH termination** — this is the specific Branch D gap.

**Branch E (agent-facing artifact layer):**
- Thoughtworks Tech Radar (2025): SDD has "bias toward heavy upfront specification" — 1,300-line date-display example as concrete data point. **Specification overhead does not scale proportionally with task complexity.**
- Paulsen et al. (2025): LLMs' effective context consumption falls up to 99% below nominal window limits on complex tasks. **Artifact length is not a proxy for agent-consumed value.**
- 2026 arXiv on context strategies for ADR generation: semantic relevance > completeness. **A 93-ADR corpus where only 15-20 ADRs are relevant per cycle has a consumption pattern where irrelevant ADRs are effective noise.**
- Fowler (2025): specs (task-specific) vs. context documents (session-persistent). RDD has both — ADRs as specs; domain model + system design as context. Critique should specify which layer.

### Cross-branch synthesis from Loop 2

**Convergence 1 — Proportionality principle.** Cockburn + Fowler + Simon + Pirolli & Card converge: elaborate enough for stakes, then stop. RDD's stopping criteria (cycle-entry scope-setting, driving question, graduation trigger) exist but are *informal*. **A more explicit RESEARCH termination criterion would address the proportionality gap without requiring structural change to the phase chain.**

**Convergence 2 — Isolation warranted; round count uncalibrated.** Design fixation literature + LLM self-correction research converge on the need for isolated external review. RDD's audit architecture is empirically supported. **The round count (R1→R4) is at the upper edge of literature-supported productive range (3-5).** Trimming to 3 rounds when convergence signals saturation would align with literature without losing architectural rationale.

**Convergence 3 — Specification overhead is fixed-cost per cycle.** Methodology overhead does not scale proportionally with task size. **Short cycles on simple problems are more over-calibrated than long cycles on complex problems.** The methodology-mismatch hypothesis is supported here as a calibration question, not a structural rejection.

**Divergence — Expert behavior vs. barely-sufficient methodology.** Design cognition (expert behavior: more upfront exploration) vs. agile/XP (barely-sufficient: strip to minimum). Resolution is context-dependent (high-criticality novel work → expert behavior; well-structured low-criticality work → barely-sufficient). **Whether RDD's actual problems systematically fall on one side or the other is what Loop 4 corpus analysis must determine from the cycle record.**

**Framing-audit asymmetry flagged**: SDD practitioner discourse defaults to "more specification is better" (its reference failure mode is under-specification, not over-specification). Using its meta-framing uncritically would lean toward methodology-mismatch hypothesis without examining over-engineering failure mode in spec-driven approaches. Note for downstream framing audit.

### Loop 3 disposition

Loop 3 (web search for current practitioner discourse) was provisionally planned. The lit-review's Branch E section already covered Thoughtworks 2025, Osmani 2025, Redmonk 2025 SDD discourse + the 2026 arXiv on ADR generation. Remaining practitioner-discourse scope (AI-pair-programming overhead, BMAD-style methodology reception) is folded into Loop 4's corpus reflexive analysis. **Loop 3 is skipped as a separate loop.**

---

## Loop 4: Layer C corpus reflexive analysis — RDD's own evidence against the literature

**Method:** Agent-conducted analysis of RDD's own artifact corpus against the Loop 2 findings. Three sub-targets: C1 (artifact-size accumulation), C2 (five-candidate-diagnoses test against corpus evidence), C4 (Cycle 018 case study).

### C1 — Artifact-size accumulation

The current RDD corpus at v0.8.6 (Cycle 018 close):

| Artifact | Size | Notes |
|---|---|---|
| `docs/domain-model.md` | 366 KB | 24 amendments; ~24+ concepts in Amendment 23 alone (Cycle 018) |
| `docs/scenarios.md` | 257 KB | All cycle behavior scenarios accumulated |
| `docs/system-design.agents.md` | 187 KB | Detailed agent-facing version; 16 design amendments |
| `docs/product-discovery.md` | 182 KB | All product-discovery accumulated |
| `docs/interaction-specs.md` | 71 KB | Cycle 018 added two new stakeholder sections |
| `docs/ORIENTATION.md` | 29 KB | Tier-1 entry point |
| `docs/roadmap.md` | 27 KB | Cycle 018 WPs migrated to Completed Work Log |
| `docs/system-design.md` | 21 KB | Pattern B (human-facing companion to agents.md) |
| `docs/decisions/` | 93 ADRs | ~3 KB to ~30 KB each; ~500 KB+ total |
| `docs/essays/` | 18 essays + 17 reflections + research-logs | Highly variable |
| `.rdd/cycle-status.md` (active) | ~30 KB | Per-cycle working doc |

**Total corpus:** roughly 1.5+ MB of textual artifacts plus the ADR collection.

**Against the literature**: Paulsen et al. (2025) names LLM effective context consumption falling 99% below nominal limits on complex tasks. A 366 KB domain model + 257 KB scenarios + 187 KB system-design.agents has aggregate token cost vastly exceeding any single agent's effective context window. Downstream phases must already select subsets — but the methodology does not have an explicit selection criterion. **The corpus IS in the over-the-limit territory the agent-facing critique predicts.**

**Counter-evidence**: not all artifacts are read every cycle. The orchestrator and phase skills navigate the corpus by reading specific sections. ORIENTATION.md (29 KB) is designed as a Tier-1 entry routing to depth. The three-tier artifact hierarchy IS a selection mechanism. The 99%-below-nominal finding applies to monolithic context-window consumption; RDD's pattern is selective retrieval.

**C1 net finding**: artifact-size accumulation is real and substantial; the methodology's existing selection mechanisms (three-tier hierarchy, phase-skill scoping) partially address it; the explicit per-cycle "what subset does this cycle actually consume?" question is not part of the methodology. **Branch E (agent-facing) gap confirmed at the empirical level — the corpus is in the territory the literature flags as having an under-consumption / noise problem.**

### C2 — Five-candidate-diagnoses test against corpus evidence

**Branch A (yes-by-front-loading):** Mixed evidence.
- Supporting: 366 KB domain model + 257 KB scenarios + ~500 KB ADRs is substantial elaboration. Many ADRs are methodology-internal (about RDD itself, not about a downstream system being designed). Cockburn would predict lighter process for solo team size; RDD is heavier.
- Counter: RDD's stated domain (identity-forming, methodologically novel) matches Crystal's heavier-process justification. Cycle 018's BUILD ran efficiently in auto mode because the ADRs were precise — suggests the early-phase chain produced valuable specification.
- **Net**: Branch A is partially supported. The early-phase chain is heavier than baseline for solo team size but appears proportionate to the methodology's actual stakes. The proportionality is per-cycle, not per-methodology — and the methodology lacks an explicit per-cycle calibration mechanism.

**Branch B (yes-by-audit-infrastructure):** Substantially supported.
- Cycle 018 dispatched ~14 specialist subagents (cycle-status feed-forward signal 4). R1→R4 iterative-audit pattern across multiple artifacts. The both-form dogfooded production design (ADR-092) doubled audit costs. **The audit infrastructure cost is non-trivial and quantifiable.**
- The literature: R1→R4 is at the upper edge of the 3-5 productive range; in solo context, the knowledge-transfer mechanism Bacchelli & Bird identify does NOT apply (no team to learn from review); the defense rests on defect detection.
- Cycle 018 DID surface real catches via the audit infrastructure: the R3 silent-fallback (an audit-subagent delivered findings inline rather than via Write) was caught at R4; the DECIDE-gate framing asymmetry (prose-essay §7's trio vs. Loop C's trio) was caught by user pushback, NOT by audit loops (the audit loops ran R1-R3 clean before the gate). So the audit infrastructure caught some failures but missed the consequential ones — the cross-source framing asymmetry was caught by user judgment.
- **Net**: Branch B is supported as a calibration question, not as a structural rejection. The audit infrastructure has architectural justification (Liu et al. 2024) but the round count appears uncalibrated — R3-rounds-clean did not predict the framing asymmetry the gate caught. **Trimming to 3 rounds when convergence signals saturation would align with literature without losing architectural rationale.**

**Branch C (no-by-methodology-mismatch):** Strongly supported (continuing from Loop 1).
- Reflection 005's deep-work-tool framing + graduation lifecycle remain the strongest existing answer.
- Cycle 018's content (Essay-Outline form change; CRESS audit; pyramid graph-traversal) is identity-forming methodology work, matching Crystal's high-criticality novel-problem quadrant.
- **Net**: Branch C is strongly supported for the methodology's actual workload but the entry-side calibration (when does a problem warrant RDD?) remains felt-judgment, not operationalized.

**Branch D (no-by-possibility-space-navigation):** Confirmed gap.
- Pirolli & Card's patch-switching criterion is genuinely absent from RDD's RESEARCH phase. The phase has scope-setting at cycle entry (driving question; constraint-removal protocol) but no explicit *termination* criterion. The current termination is "user decides research is sufficient" — felt-judgment, not operationalized.
- Cycle 018's RESEARCH ran several lit-reviews (`lit-review-018-ai-prose-critique-landscape`, `lit-review-018-minimal-surface-artifact-design`) and produced both prose + outline forms of the same essay (~5,000 + ~600 line artifacts). The patch-switching question: when should RESEARCH have stopped? The methodology does not say.
- **Net**: Branch D's mechanism is real and the literature (Pirolli & Card) names it directly. RDD does not have this criterion.

**Branch E (mis-framed-as-process-vs-product-conflation):** Branch E has two distinct subsets per Loop 1.
- *Human-facing artifact layer*: ADR-083 covers it (Outcome Test, in-place-first, bolt-on/felt-additional). Strong coverage.
- *Agent-facing artifact layer*: substantial gap. The bulk of RDD's artifacts (ADRs, scenarios, system designs, domain models, audit reports) are agent-facing. The methodology does not have an admissibility criterion for them parallel to ADR-083.
- Fowler's (2025) specs-vs-context-documents distinction is useful: ADRs function as task-specific specs; the domain model and system design function as session-persistent context. **Each has its own consumption-limit profile per the literature.**
- **Net**: Branch E's mis-framing IS happening — the over-engineering critique conflates "the systems RDD designs" (rarely over-engineered, because the methodology's own discipline is upstream) with "the methodology's own artifacts" (which DO accumulate). The latter is the more accurate target. ADR-083 partially addresses it (human-facing); the agent-facing layer remains substantively uncovered.

### C4 — Cycle 018 case study

Cycle 018 (Outlines as Research Artifacts and CRESS Audit) is the cycle's most-recent fully-shipped case study. From cycle-status archive:

- **Specialist subagent dispatches**: ~14 (research-methods reviewer + lit-reviewer × 2 + outline-derivation subagent + argument-auditor × 4 + citation-auditor × 4 + susceptibility-snapshot evaluator + correction subagents × 2)
- **Audit rounds**: R1→R4 (4 rounds) for argument audit and citation audit
- **Both-form dogfooded production**: doubled audit-related costs to generate empirical comparison the cycle's central argument relied on
- **BUILD mode**: auto (per ADR-091)
- **WPs landed**: 6 (A through F)
- **Two BUILD-originated design decisions surfaced as feed-forward**: Boundary 3 escalation rule + Boundary 2 routing crystallization — auto-mode failure-mode-envelope evidence
- **DECIDE-gate framing-asymmetry catch**: user pushback at the gate caught a framing the audit loops did not catch (the cycle's largest single revision)

**Against the proportionality principle**: was Cycle 018's audit cost proportionate to its output?
- *Yes-evidence*: the cycle shipped two load-bearing ADRs (ADR-092, ADR-093) with substantive empirical anchoring; the both-form dogfooded production generated the citation-comparison evidence the form-change ADR relied on; the audit rounds caught real issues; the audit loops did NOT catch the framing asymmetry but the user did (the gate's judgment-applied catch is part of the methodology's expected division of labor — Invariant 1, 7).
- *No-evidence*: the 14 specialist dispatches multiplied across the cycle is approaching the practical ceiling for a single cycle's cost; the R3 silent-fallback (audit subagent delivered inline rather than via Write) revealed a workflow integrity gap that the methodology only caught at R4; the both-form production was an empirical investment specifically *for this cycle's argument*, not a general-purpose method — it doubled costs without doubling output value for typical cycles.
- **Net**: Cycle 018's cost was proportionate to its output as a *methodology amendment cycle* shipping load-bearing principles. The cost would have been disproportionate for a routine feature-extension cycle of equivalent length. **This confirms the proportionality principle from Loop 2 and Branch B's calibration question.**

**Against Branch B (audit-infrastructure)**:
- R1→R4 audit pattern: at the upper edge of literature-supported range. The R3 silent-fallback shows R3 did not converge cleanly; R4 was needed to detect the dispatch-pattern gap. This is evidence the round count was earning its keep on this specific cycle.
- The framing-asymmetry catch (user pushback, NOT audit) shows the audit loops have a scope-of-claim: they catch within-document framing issues, they do NOT catch cross-source framing asymmetry. This is consistent with ADR-058 (Architectural Isolation has scope-of-claim).
- **Net**: the audit infrastructure earned its cost on Cycle 018 specifically, but the cycle's most consequential catch came from outside the audit infrastructure (the gate conversation). The argument for the audit infrastructure's full round count is per-cycle, not per-methodology — and the methodology lacks a per-cycle calibration mechanism for round count.

**Against Branch A**:
- Cycle 018 ran the full early-phase chain (RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD) over multiple sessions. The chain produced precise WPs that BUILD executed in auto mode efficiently — evidence that the chain's elaboration *enabled* downstream efficiency rather than producing over-elaborated downstream artifacts.
- The cycle's output (two ADRs + skill-text edits + fixture tests) is methodology infrastructure, not a built system. **Branch A's mechanism (front-loading drives over-elaboration in built systems) does not apply when the cycle's output IS methodology infrastructure.** The early-phase chain produced exactly the methodology infrastructure the cycle's stakes warranted.

### Loop 4 synthesis: the picture from RDD's own evidence

1. **The over-engineering question's load-bearing mechanism is per-cycle calibration, not the methodology's structural posture.** Cycle 018 was a high-criticality methodology-amendment cycle; its cost was proportionate to its stakes. Lower-criticality cycles run on the same machinery would be over-calibrated. The methodology's calibration mechanism (cycle entry; constraint-removal protocol; scope-setting) is upstream but does not adjust the *machinery weight* per-cycle — every cycle runs the full audit infrastructure at the full round count regardless of stakes.

2. **The audit infrastructure has architectural justification and a calibration gap.** R1→R4 is at the upper edge of literature-supported range; on Cycle 018, the round count earned its keep but the most consequential catch came from outside the audit loops. **Trimming the round count when convergence signals saturation, while keeping the architectural isolation, would align with literature without losing the defense.**

3. **The agent-facing artifact layer accumulates without a parallel to ADR-083's Outcome Test.** Domain-model 366 KB; scenarios 257 KB; ADRs ~500 KB total. The literature (Paulsen et al. 2025; 2026 arXiv on ADR retrieval) confirms this is in the territory where unselected context becomes noise. **An admissibility criterion for agent-facing artifacts (parallel to but distinct from ADR-083's Outcome Test for human-facing artifacts) is a candidate ADR for future cycles.**

4. **The RESEARCH phase lacks an explicit patch-switching criterion (Pirolli & Card).** Cycle 018 ran multiple lit-reviews and produced both prose + outline forms — substantial elaboration. The methodology's current termination is "user decides research is sufficient" — felt-judgment. **An explicit RESEARCH patch-switching criterion (e.g., "stop when the marginal lit-review-loop produces no new content informing the driving question") is a candidate methodology amendment.**

5. **Branch E's process-vs-product-conflation diagnosis is the most accurate framing of the user's stated concern, with two qualifications.** The over-engineering critique applies to the methodology's own artifacts (which DO accumulate) rather than to the systems RDD designs (which the methodology's discipline keeps lean). The qualification: (a) the human-facing artifact subset is covered by ADR-083; the agent-facing subset is open. (b) The accumulation is partially intentional (each cycle adds knowledge by design) and partially uncalibrated (the methodology lacks per-cycle pruning beyond graduation).

### Loop 4 closing observations

- The cycle's central reframing: **the over-engineering question is most accurately a calibration question**, not a structural-posture question. The methodology's posture is calibrated for the methodology-amendment work it actually does; the calibration gap is per-cycle (not all cycles need the full machinery weight) and per-artifact-layer (the agent-facing layer lacks an admissibility criterion).
- This is consistent with the methodology's existing partial answers (Branch C strongly covered; ADR-091 introducing dual-mode at BUILD; ADR-083 introducing Outcome Test for human-facing artifacts) — the same calibration pattern extended upstream and to the agent-facing layer would close the open gaps.
- **The cycle's contribution is not a refutation of the methodology's posture; it is the next step in the calibration pattern the methodology has been building over time.** Branch C / Branch E (human layer) were the prior calibration moves; Branch B (audit-infrastructure calibration) and Branch E (agent-facing layer) are the cycle's open scope.

---

## Loop 6: Re-opened RESEARCH on the v1-build translation question (gate-feedback)

**Trigger:** Epistemic gate at research → discover boundary surfaced a substantive reframe from the practitioner. The cycle's evidence (Cycle 018 as anchor) addresses methodology-internal calibration; the practitioner's actual concern is **research-to-v1-build translation**: when RDD produces a v1 prototype (not a methodology amendment), does the front-loaded process yield YAGNI-consistent builds or kitchen-sink builds?

**New research question (Loop 6):**

> *Does RDD's research-to-build pipeline produce simplest-useful v1 implementations, or does it load v1 builds with everything the research possibility space surfaced? Specifically: when RDD is applied to producing a v1 prototype, does the front-loaded process yield YAGNI-consistent builds or kitchen-sink builds — and what is the operative mechanism?*

**Practitioner's stated criterion for what would change the conclusion** (verbatim from the gate): *"I'd need to see evidence that our methodology produces everything-and-the-kitchen-sink (versus YAGNI) implementations."*

**Practitioner's affirmed positive value** (verbatim from the gate): *"what is GOOD about RDD is its propensity to work with nuance."* This is consequential — the YAGNI-vs-kitchen-sink question must not become a recommendation that compromises RDD's nuance-handling. The two values are held simultaneously: simplest-useful v1 AND nuance-preserving research.

**Constraint-removal for Loop 6 (agent-generated, caveat applies):**

Most consequential artifact to bracket for this question: **the ARCHITECT-phase output** (system-design.md + roadmap.md + interaction-specs.md) — the bridge between research-elaborated possibility space and built v1 implementation. Imagining-without-it: what if the early-phase chain (RESEARCH → DISCOVER → MODEL → DECIDE) fed directly into BUILD with NO intermediate system-design / roadmap / interaction-spec artifact? The practitioner would build v1 from scenarios + ADRs alone, with system structure emerging during BUILD. This brackets the question of whether the ARCHITECT-layer artifacts are the kitchen-sink mechanism (translating broad research into elaborated specifications that BUILD then implements faithfully) OR the YAGNI mechanism (concentrating decisions where alternatives can be examined before code).

**SCOPE-OF-CLAIM CAVEAT (Loop 6):** The user's question is empirical and asks about RDD's actual practice. RDD-on-RDD evidence is methodology-internal (the systems being built ARE methodology amendments, not v1 prototypes); the user's direct experience using RDD on non-methodology v1 prototypes is the natural evidence source the cycle does not have. Loop 6 must work with the evidence sources available; if none are sufficient, the honest conclusion is "the question remains open pending evidence the cycle cannot internally generate."

### Loop 6 evidence sources (user-selected at the gate, 2026-05-16)

The practitioner named **two evidence sources** for Loop 6:
1. **Corpus examination of RDD's own scenarios + system-design as YAGNI/kitchen-sink proxies.**
2. **Three external projects where RDD is being applied** to non-methodology work: **zani** (at `/Users/nathangreen/Development/zani`), **llm-orc** (at `/Users/nathangreen/Development/eddi-lab/llm-orc`, described as "agentic-serving"), and **plexus** (at `/Users/nathangreen/Development/plexus`, MCP server for knowledge-graph engine with provenance tracking).

These three external projects are the load-bearing empirical evidence for Loop 6 — they are non-methodology RDD applications.

### Loop 6.1: RDD's own corpus as proxy evidence (agent-conducted)

Examined `docs/scenarios.md` (257 KB, 3,919 lines, 582 scenarios across 19 cycles) and `docs/system-design.md` (21 KB, 178 lines) + `docs/system-design.agents.md` (187 KB, 1,077 lines).

**YAGNI signals (strong):**

1. **Null-coverage judgment pattern** (Cycle 018 acceptance criteria, `scenarios.md:3676`). Cycle 018's central susceptibility-surface-area-reduction claim is explicitly identified as an "emergent multi-cycle empirical question" and **NOT scoped into the cycle's scenarios**. Quoted verbatim: *"No emergent or aggregate criteria identified; all DECIDE-phase criteria are atomic with 1:1 scenario mapping."* This is exemplary YAGNI specification discipline — don't write scenarios for emergent questions that future cycles will revisit.

2. **Preservation scenarios pattern** (Cycle 018, `scenarios.md:3726-3743`). Explicit scenarios specifying what is NOT changing: Reflections retain prose form; Synthesis Essay retains prose form; existing prose-essay artifacts remain readable in their existing form. These are anti-elaboration scenarios — they prevent scope creep that would naturally accompany a form-change ADR.

3. **Deferred-sweeps-with-rationale pattern** (`scenarios.md:3617-3621`). Partial sweeps are deferred to natural regeneration moments (system-design.md and ORIENTATION.md to ARCHITECT; field-guide.md to BUILD) with the regeneration moment named explicitly. YAGNI: do the sweep when natural, not preemptively.

4. **Atomic scenario-to-criterion mapping.** Cycles document acceptance criteria from product-discovery; scenarios map 1:1 to criteria. The cycle does not generate scenarios for hypothetical-future-criteria.

5. **Rejected-alternatives discipline in ADRs.** ADR-091 explicitly rejects "Define a third mode" + "Define a continuous spectrum" for v1; defers "parameterized binary" to future cycle. ADR-083 explicitly rejects "Outcome Test elevated to invariant" for v1. The ADRs encode "rejected/deferred for v1" reasoning as standard practice.

6. **system-design split (Pattern A vs Pattern B per ADR-084).** Recognition that the comprehensive 187 KB system-design exceeded what humans could read at depth; split into a 21 KB human-facing version + 187 KB agent-facing companion. This is YAGNI applied to the artifact's reading-cost — only as much human-facing material as humans need.

**Kitchen-sink signals (weak / methodology-specific):**

1. **High scenario count** (582 across 19 cycles, ~30/cycle avg). But each scenario is small and atomic; the high count reflects 19 cycles of accumulated work, not per-cycle kitchen-sink.

2. **Domain model size** (366 KB; 24+ concepts per major amendment). This is methodology-vocabulary accumulation — each cycle introduces vocabulary that downstream ADRs and skill text use. The accumulation is expected for a methodology that builds up its conceptual apparatus over time.

3. **Some scenarios cover meta-methodology behavior** (conformance checks; preservation scenarios about what NOT to do). For a non-methodology v1 prototype, these would not exist; they're a methodology-specific overhead.

**Loop 6.1 verdict:** RDD's own corpus shows **strong YAGNI specification discipline** at the per-cycle level — null-coverage judgments, preservation scenarios, deferred sweeps, atomic scenario mapping, "rejected/deferred for v1" patterns in ADRs. The accumulation IS visible (large domain model; large scenarios.md aggregate), but it's the natural consequence of 19 cycles of methodology-building, not per-cycle kitchen-sink. **The methodology's own specification practice exemplifies the discipline the practitioner is asking about.** However: this evidence is methodology-internal; the question is whether the SAME discipline transfers when RDD is applied to non-methodology projects. Loop 6.2 (external project investigations) is the load-bearing test.

### Loop 6.2: External RDD applications (zani, llm-orc, plexus)

#### Zani (Rust terminal writing app; ~13.9k LOC; 18 ADRs; investigation agent reported 2026-05-16)

**Project shape:** Single-user TUI on ratatui+crossterm+ropey; full RDD adoption (ORIENTATION, product-discovery, domain-model with 18 invariants, system-design v1.0, scenarios at 117 across 21 features, roadmap, 18 ADRs, 6 essays, 41k-line field-guide). Predates ADR-085 infrastructure relocation; artifacts in `docs/` (no `.rdd/`).

**Verdict: moderately YAGNI on core features, kitchen-sink on the palette subsystem.**

**YAGNI signals (specific):**
- **Mid-build invariant amendment for YAGNI reasons.** ADR-007 (writing-window-opt-in) flipped Writing Window from default-on to opt-in mid-build because spawning surprised tmux users. Quoted from the cycle: *"a literal 'the simplest useful thing' course correction."*
- **Named YAGNI rejections in 10 of 18 ADRs.** ADR-011 (local-config) rejects per-document frontmatter as *"Overengineering for v1. Per-folder covers the 'project = mood' use case."* ADR-018 rejects setting a specific numeric Dark-Vivid threshold as *"a magic number masquerading as evidence."*
- **No premature integration code.** WP-E (Plexus + llm-orc integration) has `[Planned]` scenarios — zero references in `src/`. Roadmap defers the result-surface design as *"Open choice. Builder must choose before implementing."*
- **Tight scenario-to-feature ratio.** 117 scenarios across 21 features (~5.6 per feature), each scenario is one concrete observable behavior — not an alternatives matrix.
- **Defaults match minimum need.** `Cargo.toml` lists only 6 production dependencies. No CLI argument parser yet; `main.rs` does manual flag parsing.

**Kitchen-sink signals (specific):**
- **Heavy responsibility matrix.** `docs/system-design.md` enumerates 40+ Domain Concept/Action rows and 14 named modules plus 13 leaf modules — extensive structure for a ~12k-LOC single-user TUI. The fitness criterion *"no module owns more than 8 glossary concepts"* reads as YAGNI-shaped scaffolding, but the matrix itself is generous.
- **Research-surfaced features ship as invariants.** **ADR-018 Chroma Targets defines 8 separate ΔE2000 bands grounded in Essay 005's color-science findings, then requires retuning all 40 existing palettes to comply.** This is research-driven, not stakeholder-driven — there is no recorded writer complaint that Light Vivid palettes "feel" insufficiently vivid (per ADR-018: *"may register as more vivid"*). **Classic kitchen-sink failure-mode: research surfaces a topic → essay deepens → ADR formalizes as invariant → BUILD implements faithfully → existing work must retune to comply.**
- **Specification mass before BUILD.** ADR-017 (Flora Reference) and WP-C call for 40 structured species entries with citations, Essence Mode, validation score (A/B/C/D), retirement notes — for naming 40 palettes. Justified to prevent circular-reference drift in Provenance Descriptions, but a sizable doc artifact whose payoff is *"enables periodic validation cadence."*
- **40 palettes in 8 affective categories.** Defensible on the mood-instrument essay argument, but on the high end of what a v0.1 writer requires.

**The asymmetry that matters most:** the writing-app *core* (editor 1,779 LOC, writing_surface 984 LOC, app 2,120 LOC) is shaped by **user-facing scenarios** — those code regions are tight. The palette subsystem (1,953 LOC) is shaped by **essays/research** — six ADRs (009, 014, 015, 016, 017, 018) each ratchet the palette commitment upward. **The mechanism: research → essay → ADR-as-invariant → BUILD implements faithfully. The asymmetry is the cycle-019 finding.**

**Caveats** (from the investigation): no BUILD-mode records observable (predates ADR-091); palette elaboration may be intentional product strategy (per README: "calibrated mood instruments") rather than over-engineering; the counterfactual ("did writers need 40 palettes?") cannot be verified from artifacts alone.

#### llm-orc (v0.17.0, ~33,400 LOC; agentic subsystem ~8,600 LOC with full RDD; investigation agent reported 2026-05-16)

**Project shape:** Python orchestration library for ensembles of LLM/script agents with OpenAI-compatible serving layer. RDD adoption is feature-scoped: applied to the "agentic serving" feature at `docs/agentic-serving/` through 6 cycles. Full RDD artifact set for the agentic feature (25 ADRs, domain-model, scenarios at 146, system-design with 27 fitness criteria, product-discovery, roadmap, ORIENTATION, essays, housekeeping).

**Verdict: predominantly YAGNI, with localized kitchen-sink risk in the calibration/observability subsystem.** Confidence: medium-high.

**YAGNI signals (strong, with notable institutional innovations):**
- **Formal `adr-deferred-` filename pattern.** `adr-deferred-005-summarizer-harness-reconsideration.md` is itself a YAGNI affordance — the methodology has a recognized form for *deferred* ADRs where evidence is "below evidentiary threshold for in-cycle amendment." Quote: *"single-trial on a single fixture... below evidentiary threshold for in-cycle amendment."* This is innovation beyond RDD's own current methodology.
- **No-op skeleton modules.** `plexus_adapter.py` (64 LOC) ships no-op stubs for WP-I; WP-K replaces bodies with real Plexus MCP client calls when needed. Concrete current use case, deferred body for later cycle.
- **160 occurrences of "defer/rejected/out-of-scope/future cycle" across 25 ADRs** (`grep -c`). Defer-language is structural to the corpus, not occasional.
- **ADR-001 picks simpler of three options + defers hybrid.** Internal/external/hybrid execution models surveyed; *"the hybrid model is deferred — it is not attempted in this cycle. This ADR does not close OQ #3 — it commits to the internal model as the pragmatic entry point."*
- **ADR-003 caps the orchestrator tool surface at exactly five tools** and **rejects dynamic tool authoring that research surveyed**: *"The set is closed. Adding a new orchestrator tool requires a new ADR."*
- **ADR-002 baseline-vs-upgrade split** for Plexus integration: *"Layers 1-3 constitute the baseline product; Layer 4 is an additive upgrade."*
- **ADR-009 phases Plexus integration**: Phase 1 = tools only; Phase 2 (context injection) deferred pending two open questions. Reserved as empty hook so it can be added without rework.
- **Auto-mode BUILD did NOT collapse into kitchen-sink.** Cycle 6 ran in auto mode (per `cycle-status.md` line 18). WP-A close-out surfaced a deferral the practitioner endorsed (*"per-request override application deferred until a concrete scenario demands it"* — cycle-1 archive build feed-forward #41). The practitioner-as-reviewer caught the kitchen-sink temptation inside BUILD. This is empirical evidence against the auto-mode design-alternative-bypass failure mode named in ADR-091.

**Kitchen-sink signals (specific, but smaller scope):**
- **25 ADRs in 6 cycles** for a single feature is high density. Cumulative architectural surface for one feature: 4 layers, ~12 modules, 27 fitness criteria, 146 scenarios.
- **5-layer conversation compaction pipeline** (ADR-012, `conversation_compaction.py` = 682 LOC) is heavy machinery for v1, though there is an evidence-driven cheapest-first scenario.
- **Cross-layer calibration signal channel (ADR-016)** carves a special exception to the layering rule with *five bounding mechanisms*. The ADR is marked *"conditional acceptance — first-deployment evidence pending"* — honest, but suggests the design ran ahead of evidence.
- **Large research-driven modules:** `calibration_signal_channel.py` (1,043 LOC), `calibration_gate.py` (892 LOC), `orchestrator_tool_dispatch.py` (1,053 LOC) — substantial built mass in machinery that exists because research surfaced multi-agent debate / verdict trichotomy literature.

**The trim-and-defer pattern (RDD-artifact-to-built-code translation):** The artifact corpus *systematically trims* the research possibility space. RESEARCH surveyed external/internal/hybrid execution models, dynamic tool authoring, full Plexus integration, summarization variants, multiple composition palettes. DECIDE consistently chose the single simplest option DISCOVER showed had concrete demand, with deferral visible in ADR-001 / ADR-003 / ADR-009 / `adr-deferred-005`. Built code follows: no-op skeleton for not-yet-needed Plexus calls; tool surface enforced at dispatcher; compose_ensemble validates against existing primitives only.

**Where the built code IS large, it is PLAY-driven, not RESEARCH-surfaced.** Cycle 4 essay 002, the 7-mode failure taxonomy, AS-7 content-stripping — these motivated the calibration channel from observed failures. **Cycle 5 PLAY reframed observability as "infrastructure-complete / routing-incomplete," which scoped Cycle 6 to *routing telemetry* rather than rebuilding the substrate.** PLAY appears to be doing real refutation work, pulling features back rather than forward.

**Critical for Cycle 019's question:** llm-orc demonstrates the same asymmetry zani showed, BUT in the OPPOSITE direction — kitchen-sink risk concentrates in **research-surveyed** subsystems (ADR-016 calibration channel, marked "conditional acceptance — first-deployment evidence pending"), while PLAY-driven/empirically-grounded modules earn their LOC. The mechanism: when research surfaces a possibility the cycle has no empirical filter for, the elaboration tends toward kitchen-sink. When PLAY provides empirical refutation, scope tightens.

**Caveats** (from the investigation): single-feature sample within llm-orc (broader codebase predates RDD); sampled ~8 of 25 ADRs in depth; YAGNI judged against agent's reading of stakeholder demand without operator-side data; Cycle 6 is mid-BUILD with close-out observations potentially pending.

#### plexus (Rust knowledge-graph engine v0.3.0, ~30k LOC; 43 ADRs; investigation agent reported 2026-05-16)

**Project shape:** Rust knowledge-graph engine with provenance tracking, distributed as MCP server and library (AGPL-3.0). RDD adoption is *extensive* — 43 ADRs (000–042), full artifact suite (docs/decisions/, domain-model 125 KB, system-design 72 KB, scenarios grouped by ADR range, product-discovery, ORIENTATION, cycle-status, roadmap, audits, spikes, gates, essay-outlines).

**Verdict: strong YAGNI signal. High confidence.**

**YAGNI signals (strongest of the three projects):**
- **ADR-038 (release-binary feature profile) explicitly REFUSES to add a Rust embedding path despite research justifying one.** Default Homebrew binary ships with `default = []` — no ONNX Runtime, no sqlite-vec, no fastembed. The methodology surfaced a feature; the decision step **declined** it on architectural-restraint grounds. Reframed as *"positive decision, not defect-by-omission."* The single clearest data point in any of the three projects.
- **ADR-024 actively CANCELS previously-deferred work.** The Tier 1 declarative enrichment DSL (deferred in ADR-022) is cancelled on YAGNI grounds: *"the llm-orc ensemble YAML already serves this purpose."* Three-tier model collapsed to two. **RDD here actively PRUNES speculative work, not just adds — strongest counter-evidence to the over-engineering critique observed in the cross-project corpus.**
- **ADR-040 rejects broadening DiscoveryGap**: *"Keeping the core small preserves ADR-024's framing... consumers grow capability through the declarative/ensemble path, not by expanding the Rust core."*
- **ADR-023**: graph-science algorithms (PageRank, community detection, centrality) — none built into the Rust core. Delegated to llm-orc/Python NetworkX ensembles. Plexus's `src/query/` (~2,200 LOC, 9 files) is bounded to find/traverse/filter/path/step.
- **ADR-002**: literally *"Decision: Deferred. Needs research spike"* — then superseded by ADR-016 once spike produced evidence.
- **ADR-041 explicit "parking" section**: *"phenomenology hypothesis remains parked for a future cycle's non-builder PLAY"*; `cycle-status.md` has a "Hypotheses Parked for Future Cycles" section.
- **Single storage backend** (SQLite). No backend-abstraction proliferation despite `GraphStore` trait.
- **TagConceptBridger REMOVAL**: a previously-built enrichment was REMOVED when classified as domain-specific.
- **20 of 43 ADRs** carry "considered-and-rejected" language; "deferred"/"out of scope"/"future ADR" appear repeatedly.

**Kitchen-sink signals (concentrated in documentation, not code):**
- 43 ADRs for v0.3.0 is high decision-density; provenance model is genuinely rich (broader than minimum viable); 17 MCP tools; documentation is large (125 KB domain model + 72 KB system-design) — **kitchen-sink in documentation, not code.** The Rust artifact distributed is demonstrably narrow.

**A critical pattern across all three projects**: plexus delegates extensibility to llm-orc rather than building Rust-internal generality; llm-orc applies extensibility to PLAY-discovered failure modes rather than research-surfaced speculation; zani's writing core is shaped by user-facing scenarios while the palette subsystem is shaped by essays. **The YAGNI discipline is structural across all three projects; the kitchen-sink failure mode, where it appears, traces to a specific mechanism: research-surveyed possibilities that survive into ADRs without empirical grounding.**

**Caveats:** sampled ~10 of 43 ADRs in depth; "lean core, extend via llm-orc/specs" is a posture that pushes generality outward (a critic could call this kitchen-sink-by-delegation), though distributed Rust artifact is demonstrably narrow.

---

### Loop 6 synthesis: cross-project pattern + revised cycle finding

**Pattern across all four corpora (RDD itself + zani + llm-orc + plexus):**

1. **YAGNI discipline IS real and structural across RDD applications.** All three external projects show explicit "rejected/deferred for v1" language in ADRs as standard practice. Institutional innovations emerged from each:
   - **llm-orc**: formal `adr-deferred-` filename pattern; "considered-and-rejected" sections; 160 occurrences of defer/rejected language across 25 ADRs; no-op skeleton modules with deferred-body pattern.
   - **plexus**: ADR-038's explicit refusal to add research-justified feature on architectural-restraint grounds; ADR-024's cancellation of previously-deferred work; TagConceptBridger REMOVAL when scope was corrected; "Hypotheses Parked for Future Cycles" cycle-status section.
   - **zani**: ADR-007 mid-build invariant amendment for YAGNI reasons; explicit "Overengineering for v1" rejection language in ADR-011; preservation scenarios.
   - **RDD itself**: null-coverage judgments; preservation scenarios; deferred-sweeps-with-rationale; atomic scenario-to-criterion mapping.

2. **The kitchen-sink failure mode, where observed, is LOCALIZED and traces to a specific mechanism — not pervasive.**
   - **zani palette subsystem (1,953 LOC; 8 ΔE2000 chroma bands; required retuning all 40 existing palettes)**: research → essay → ADR-as-invariant → BUILD implements faithfully. **Research-driven cascade, no PLAY filter, no stakeholder pull recorded.**
   - **llm-orc calibration channel (1,043 LOC; ADR-016 marked "conditional acceptance — first-deployment evidence pending")**: research surveys multi-agent debate literature → ADR formalizes channel → 1,043 LOC built ahead of empirical evidence. **Research-surveyed without empirical filter.**
   - **plexus documentation volume (125 KB domain model + 72 KB system-design)**: methodology-internal artifact accumulation; *code* is demonstrably narrow.
   - **RDD itself documentation volume**: 19 cycles of methodology-building accumulation.

3. **The asymmetric mechanism: research-driven cascades without empirical filter can become kitchen-sink; PLAY-driven, DISCOVER-driven, stakeholder-driven, and mid-build empirically-corrected elaboration earns its weight.**
   - **zani**: writing-app core shaped by user-facing scenarios — tight. Palette subsystem shaped by essays — elaborated.
   - **llm-orc**: large modules partly research-surveyed (kitchen-sink risk) and partly **PLAY-driven** (Cycle 4 essay 002, the 7-mode failure taxonomy, AS-7 content-stripping). **Cycle 5 PLAY pulled features BACK** (reframed observability as "infrastructure-complete / routing-incomplete," scoping Cycle 6 to routing telemetry rather than rebuilding substrate). PLAY does real refutation work.
   - **plexus**: ADR-038 and ADR-024 actively decline / cancel research-surveyed features that lack empirical pull.

4. **Auto-mode BUILD does NOT cause kitchen-sink in observed evidence.** llm-orc Cycle 6 ran in auto mode; WP-A close-out surfaced a deferral the practitioner endorsed. **Empirical evidence against the auto-mode design-alternative-bypass failure mode named in ADR-091.** The kitchen-sink mechanism operates upstream (in DECIDE) where research possibility crystallizes into ADRs.

5. **DECIDE phase systematically TRIMS the research possibility space.** Visible in all three external projects: explicit rejection language, deferral, scope narrowing. The methodology's existing practice already does what the over-engineering critique would call for — DECIDE is the filter point. The question is whether it filters consistently, and what signal the methodology gives at DECIDE when research-surveyed possibility lacks empirical grounding.

**The new finding (revises and refines C1):** the over-engineering question's most accurate mechanism is **empirical grounding asymmetry**: elaboration that is empirically grounded (PLAY-driven, DISCOVER-driven via stakeholder pull, spike-validated) earns its weight; elaboration that is research-surveyed without empirical filter is the kitchen-sink failure-mode site. The calibration question (cycle's central finding C1) is now more specific: it is calibration of the **empirical-grounding criterion at DECIDE**, not calibration of machinery weight per se.

**The user's "what is GOOD about RDD is its propensity to work with nuance" is structurally preserved.** Research SHOULD surface nuance (this is the methodology's value). The remedy is not to compress research; it is to **filter research-surveyed possibilities through empirical grounding at DECIDE before committing to ADRs.** Plexus's ADR-038 (decline research-justified feature) and ADR-024 (cancel previously-deferred work) are the exemplar pattern. llm-orc's "conditional acceptance — first-deployment evidence pending" annotation on ADR-016 is a closely-related pattern.

**A FOURTH in-cycle ADR candidate emerges from Loop 6:** **ADR-CANDIDATE-019.4 — empirical-grounding criterion at DECIDE.** When an ADR commits to a feature based on research-surfaced possibility without PLAY evidence / stakeholder-articulated demand / spike validation, the ADR should be marked "conditional acceptance — first-deployment evidence pending" or held in the `adr-deferred-` form (llm-orc's institutional innovation) until empirical grounding lands. Skill-Structure Layer amendment to `/rdd-decide` adding the empirical-grounding check at ADR-drafting; small amendment with cross-project empirical support.

**Branch A is now MORE consequential than the original Essay-Outline suggested.** The "per-cycle early-phase chain weight" framing is superseded by the more specific finding: chain weight matters less than whether DECIDE applies the empirical-grounding filter. ADR-CANDIDATE-019.4 IS Branch A's specific remedy, with cross-project evidence — it is no longer "held for future cycles."

---





---

## Validation-Spike Decision (ADR-087)

**Decision: REJECT prototyping for this cycle, with rationale recorded.**

**Felt-trigger question** (composed against the cycle's specific content): Is the cycle at risk of producing speculative claims that downstream phases will over-elaborate, where a tangible answer from a focused prototype would prune the possibility space directly? Or: would interaction-grounding (testing the cycle's claims against an actual built slice) surface real additional questions or directions that lit-review and methods alone cannot reach?

**Rationale for rejection:**

1. **The cycle's claims are grounded in three converging evidence sources** — 32-source lit-review (direct on Branches B, D, E; analogical on Branch A); corpus reflexive analysis with Cycle 018 as case study (~14 specialist subagent dispatches; R1→R4 audit pattern; both-form dogfooded production; all directly observable from the archived cycle-status); the methodology's own prior calibration moves (ADR-091, ADR-083, Reflection 005) as observable precedent for the calibration pattern C2 names. Speculative claims that lack empirical grounding are flagged with `(working hypothesis)` / `(directional)` / `(working synthesis)` calibration markers in the Essay-Outline.
2. **The candidate ADRs (019.1 Audit-round-count; 019.2 Agent Outcome Test; 019.3 RESEARCH patch-switching) will be drafted in DECIDE, not RESEARCH.** A spike at RESEARCH boundary would test the cycle's *research claims* — but the research claims are well-supported. The ADR-design questions that may benefit from prototyping (e.g., what specific signal indicates audit convergence-saturation? what specific test operationalizes the Agent Outcome Test?) are DECIDE-phase questions; they will surface there. A premature spike at the RESEARCH boundary would either repeat the literature work or anticipate the ADR-design without the ADR-context.
3. **Branch D's most directly spike-able question** — would a Pirolli & Card patch-switching criterion applied retrospectively to Cycle 018 RESEARCH have fired correctly? — is small enough to fold into DECIDE's ADR-019.3 drafting as a worked-example check. Pulling it forward to RESEARCH would not surface additional content.
4. **The argument-audit R2 verdict (audit-clean; ready to advance)** indicates the Essay-Outline's claims hold their citations and inferential chains. Where speculation remains, it is named via calibration markers and scope-of-claim caveats — including the F-P1 fifth caveat addition naming the cycle-type-distribution scope limitation.
5. **The user's commitment** at cycle entry was to a dedicated cycle on the over-engineering OQ. The cycle has produced a substantive RESEARCH artifact (Essay-Outline with five-branch verdict + three in-cycle ADR candidates). Adding a validation spike at this boundary would not advance the user's stated purpose — DECIDE and downstream phases are the natural next sites for any operational-detail prototyping.

**Anti-elaboration positioning recorded:** The rejection is itself an anti-elaboration move — declining to prototype where the literature and corpus reflexive evidence are direct on the cycle's claims. Future cycles inherit calibrated confidence on the claims rather than treating them as validated. If a downstream ADR (019.1, 019.2, or 019.3) surfaces a specific operationalization question that prototyping could answer, that is the right point for a tightly-scoped spike — at the ADR-design moment, not at the RESEARCH boundary.

---

## Loop 5: Synthesis — five-branch verdict and proposed Essay-Outline framing

Based on Loops 1, 2, and 4, the five branches resolve as follows:

| Branch | Status | Mechanism support | Remedy candidate |
|---|---|---|---|
| **A** (yes-by-front-loading) | PARTIALLY supported | Early-phase chain heavier than Crystal Clear baseline for solo team size; but appropriate for methodology's actual high-criticality novel-work stakes. Mechanism is calibration, not structural rejection. | Per-cycle calibration criterion (similar to ADR-091 dual-mode but for early-phase chain weight) — candidate future cycle |
| **B** (yes-by-audit-infrastructure) | SUPPORTED as a calibration question | R1→R4 at upper edge of 3-5 productive range; architectural-isolation justified; round-count uncalibrated; solo context removes knowledge-transfer mechanism | Trim round count when convergence signals saturation (3 rounds default; 4-5 only when warranted by signal) — candidate ADR |
| **C** (no-by-methodology-mismatch) | STRONGLY supported (existing) | Reflection 005 deep-work-tool + graduation lifecycle | Already in place; calibration is felt-judgment |
| **D** (no-by-possibility-space-navigation) | SUPPORTED as a missing-criterion question | Pirolli & Card patch-switching directly applicable; absent from RESEARCH | Explicit RESEARCH patch-switching criterion — candidate ADR |
| **E** (mis-framed-as-process-vs-product-conflation) | STRONGLY supported (most accurate frame) | Methodology artifacts accumulate; human layer covered (ADR-083); agent-facing layer uncovered | Outcome-Test-analog for agent-facing artifacts (acknowledging Fowler's spec-vs-context-doc distinction) — candidate ADR |

**The cycle's central finding: the over-engineering question is most accurately a *calibration question* across multiple methodology layers, not a structural rejection of any single layer.**

The methodology has been *progressively building* the calibration pattern over time (ADR-091 dual-mode BUILD; ADR-083 cognitive economy for human artifacts). This cycle's contribution names the next two calibration moves: audit-infrastructure round-count calibration (Branch B remedy) and agent-facing artifact admissibility (Branch E remedy). Branch A's calibration gap (per-cycle early-phase chain weight) and Branch D's missing criterion (RESEARCH patch-switching) are additional candidate moves.

**The user's stated concern is best served by**:
1. Naming the calibration pattern explicitly (the methodology has been building it; the cycle makes the pattern visible)
2. Identifying the specific open calibration moves (Branches B and E; Branches A and D as additional candidates)
3. NOT amending the methodology's structural posture — the literature supports it for the methodology's actual workload, and the calibration is per-cycle and per-layer, not at the methodology-wide level

The user is now ready to decide whether to:
- Loop again with a new question (e.g., go deeper on Branch B's specific calibration criteria, or on the agent-facing Outcome-Test analog)
- Proceed to the Essay-Outline synthesizing these findings
- Defer specific remedies to subsequent cycles (each branch's remedy is itself a substantial methodology amendment cycle)

---



---
