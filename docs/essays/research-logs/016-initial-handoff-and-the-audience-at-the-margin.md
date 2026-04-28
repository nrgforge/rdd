# Research Log: Readability & Comprehensibility (Cycle 017)

*Started 2026-04-24. Plugin version v0.8.3.*

## Step 1.1 — Cycle entry questions

These four questions frame the cycle. They are need-framed (focused on what readers/users need rather than how to fix existing artifacts) and treat current corpus structure as prior art rather than constraint. The user-proposed unifying frame ("the corpus and turn-structure are optimized for production discipline; this cycle shifts toward readerly and interactional usability") is recorded in `cycle-status.md` as a hypothesis to be tested at Step 1.2 via constraint-removal — it is **not** taken as given here.

### Q1. Corpus-internal nomenclature

When work-package IDs, ADR numbers, axis labels, and invariant numbers appear in code, tests, or graduated documents, what failure modes does that create — and what alternative naming strategies preserve traceability without binding durable artifacts to corpus state?

### Q2. Document legibility on first encounter

What does a reader need in the first 30 seconds, 5 minutes, and 30 minutes of encountering a technical reference document — and how do those needs vary by audience (returning practitioner, new collaborator, external reviewer, agent re-orientation)?

### Q3. Process-vs-product visibility

What separates process artifacts (audits, dispatch logs, gate notes, session docs) from product artifacts (essays, ADRs, system design) in terms of who reads them, how, and when — and what location/visibility strategies make that distinction structurally legible without burying still-useful process traces?

### Q4. Turn structure under multi-item pressure

When the agent has N items needing user attention in a single turn (clarifying questions + decision context + gate response), what response patterns serve comprehension — and what makes a "wall of text" default hostile in ways that "enumerate-then-walk-through" resolves (or doesn't)?

## Field evidence informing the cycle (user-provided at Step 1.1)

The user has carried RDD artifact corpora through to architecture and handed them off to external stakeholders across multiple iterations. The pattern reported below is held as separable evidence + user hypothesis + user aspiration, not as a unified diagnosis.

**Observation (provenance-bearing).** External stakeholders' initial reception is positive — the docs are described as "fantastic" and `ORIENTATION.md` is reported to work as an entry point. When stakeholders proceed past the entry point and attempt to actually read the substantive Tier-2 docs (system-design.md, product-discovery.md, others), the experience becomes overwhelming. The de facto workaround stakeholders adopt is feeding the docs to their own AI assistants for summarization and interpretation.

**User hypotheses (recorded as hypotheses to examine, not confirmed mechanisms).**

1. *Front-loading of density.* Tier-2 docs lead with high-density structural content (e.g., system-design.md opens on a long architectural-drivers table) without first establishing orientation. The first thing the reader meets is the densest thing.
2. *Volume.* In some cases, the docs may simply contain too much information for the reader's purpose at that moment.

**User aspiration.** "In an ideal world they wouldn't need AI to understand the system-design doc at a high level at least." This is a preference statement, not an established design constraint. The cycle should examine whether direct human readability at a high level is the appropriate design goal across audiences, or whether AI-mediated summarization is a legitimate (possibly even intended) reading mode for some audiences and the felt dissatisfaction is signaling something else (e.g., loss of authorial voice in the AI summary, mistrust of AI summarization fidelity, social/professional discomfort with "needing" AI to read docs that look like they should be readable).

This evidence concretely informs Q2 (the failure point falls between "first 5 minutes" and "first 30 minutes" for the external-reviewer audience). The legitimacy of AI-mediated reading as a workflow is a sub-question Q2 does not directly ask; it may surface at Step 1.2 where the constraint-removal naturally examines what readers would need if the artifact in question weren't there.

## Step 1.2 — Constraint-removal

**Named artifact:** `./docs/system-design.md`

**Rationale for naming this artifact.** The user concretely identified `system-design.md` as the doc external stakeholders bounce off after passing `ORIENTATION.md`. It sits at Tier 2 as the "primary readable for technical stakeholders," which means its presence shapes the corpus's default answer to "where does an external reviewer go to understand this system." It is the most consequential single artifact whose shape encodes the methodology's current bet on how depth meets readability for the technical-stakeholder audience.

**Prompt put to the user.** *What if `system-design.md` were not available — neither as it currently exists nor in any artifact filling that exact slot? How would the problem of "external stakeholders need to come to understand this system" be solved?*

**User response (verbatim, with one transcription correction — "tennable" → "tenable"):**

> If we didn't have the system-design doc I think we'd lose a high-level overview of the system. The value I think is in the system design diagram. It's much easier for people to see how things inter-relate with a clear visual of the structure. The module descriptions beyond that are perhaps helpful. Otherwise there's a lot that's more helpful to the AI agent in constructing a context for what is built or to be built. Without this human-level grounding, the user is faced with the code base to explore which isn't tenable for another technical stakeholder to review choices and get a quick sense of things.

**Findings the response surfaces (agent reading, recorded for research-methods-reviewer attention).**

1. **Audience separability inside the artifact.** The user partitions `system-design.md` content into three regions with distinguishable audience-value profiles:
   - *The system design diagram* — high human value; the load-bearing element of the artifact's "high-level overview" function for technical stakeholders.
   - *Module descriptions* — hedged human value ("perhaps helpful").
   - *The rest* — characterized as "more helpful to the AI agent in constructing a context for what is built or to be built" — i.e., agent-consumption material rather than human-reader material.

   This is an audience-model finding. The current artifact serves at least two audiences (human technical stakeholders + AI agents preparing to build) with a single artifact-shape; the two audiences want different things from it.

2. **Diagrams carry the high-level orientation function better than prose, in the user's instinct.** Visual structural relationships convey "how things inter-relate" more effectively than prose at first encounter. This is a candidate finding for Q2, not yet examined against literature.

3. **The codebase is not a tenable substitute** for technical-stakeholder review at the "review choices and get a quick sense of things" granularity. The need is real and only docs can serve it; the bar is review-and-quick-sense, not complete reference.

4. **What ORIENTATION.md does not cover.** The user's response treats high-level system overview as a function distinct from ORIENTATION.md's entry-point role. There is a third readable layer occupying the space between Tier 1 (ORIENTATION) and Tier 3 (depth artifacts) that `system-design.md` currently inhabits — and the user identifies the diagram as the load-bearing piece of that layer.

5. **Mechanism shift: density → audience conflation.** The user's prior hypothesis ("front-loaded density") is not directly supported by this response. The response does not say "the top of `system-design.md` is too dense" — it says "the diagram carries the value; the rest is mostly for agents." Audience conflation and density-ordering are distinct mechanisms; both remain candidate mechanisms for Q2 to examine.

6. **Sub-question raised but not directly asked by Q1–Q4.** The response distinguishes "human-stakeholder readable" from "agent-context material." Q3 asks process-vs-product (a different axis). Q2 lists "agent re-orientation" as one audience but does not center the human-vs-agent split as a design axis for Tier-2 artifacts. The research-methods-reviewer is well-positioned to assess whether Q1–Q4 adequately surface this axis or whether the question set is missing it.

**Normative clarification embedded in the response.** The user's earlier framing ("in an ideal world they wouldn't need AI to understand the system-design doc") is now refined: the user is *not* objecting to "AI as code-construction-context-builder" (that role is acknowledged as legitimate). The user is objecting to "AI as human-reading-prosthetic" — humans needing AI to translate docs that look like they should be human-readable directly. This is a normative distinction the cycle should hold.

## Cycle framing context (added after constraint-removal, before research-methods-reviewer dispatch)

### Larger RDD purpose (user articulation)

The user has articulated RDD's larger purpose as: **use generative AI to speed up toil, but preserve understanding.** This cycle's readability and comprehensibility work is positioned as serving that larger purpose specifically — *making the human experience of working within the framework feel better, in line with the goal of preserving (not eroding) understanding*. This framing claim is held by the cycle as articulated; whether "feel better" is the sharpest testable form will be examined in the research loop and at the epistemic gate.

### Stakeholder grounding (verified against `./docs/product-discovery.md`)

The user noted that product-discovery identifies both people and agents as stakeholders. Verified:

- **Direct human stakeholders:** Solo Developer-Researcher (primary user), Research-Engineer, Team Lead (using RDD for scoping), Everyday Developer.
- **Direct AI stakeholder:** AI Agent — with three modes: orchestrating agent, specialist subagents, gamemaster (in play phase).
- **Indirect human stakeholders (direct for BUILD):** Teammates/Collaborators, Architecture and Product Specialists.

The cycle's "make the human experience feel better" thread maps to the human stakeholder rows. Agent-stakeholder needs are a parallel concern — and the constraint-removal response (Finding 1) already distinguished human-readable from agent-context content as separable audiences for `system-design.md`. The cycle should not collapse the two; both are stakeholders, both have legitimate needs.

### External source: Decker, "AI Burnout" (https://ky.fyi/posts/ai-burnout)

Brought into the cycle by the user as framing material. Recorded faithfully here; the user's specific draw is delineated separately so the reviewer sees both source and selection.

**Faithful summary of the post's argument.** The author's central claim is that AI's pervasive infiltration into tech work — *combined with the industry's abandonment of progressive/equity ideals* — has made meaningful work impossible and rendered resistance futile, producing burnout understood as "emotional experience of political defeat" rather than mere tiredness. Mechanisms identified: loss of agency (AI decisions bypass human review), **eroded comprehension** (documents/code accumulate faster than people can read them; institutional knowledge-building breaks down), inescapable presence, interpersonal tension around speaking up, and broader disillusionment with tech's equity backsliding. Concrete experiences described include unconsented meeting recording, unverified chatbot answers, unreviewed authentication code, AI-generated design prototypes displacing critical discussion, paste-in AI code reviews, engineers citing AI tools as authoritative over docs, and leadership mandates to adopt AI tools. The post articulates *principles* rather than AI-specific remedies: "things worth doing are worth doing well"; "friction is good"; code review's value is in "institutional knowledge as people debate and iterate." Pull-quotes: *"AI had hooked its tendrils into every corner of my work life."* / *"Friction is good."* / *"The point is to build institutional knowledge as people debate and iterate."*

**The user's specific draw from the post.** The user characterized it as "doing a good job of conveying the state we're all in right now of not understanding what AI is doing." This is a methodological / comprehension-focused read that maps to two of the post's threads (eroded comprehension, friction-is-good) and is a partial filter of the post's broader political/equity argument. The threads the user pulled are real, present in the post, and directly load-bearing for this cycle.

**Load-bearing for this cycle:**

- *Eroded comprehension* — direct relevance to Q2 (legibility on first encounter) and to the user's "human experience feel better" framing. The post treats this as one mechanism among several driving burnout.
- *"Friction is good"* — relevant grounding for RDD's positioning. RDD already understands itself as "preserve understanding" rather than "remove all toil"; the post articulates a principled defense of that posture.
- *"Institutional knowledge as people debate and iterate"* — relevant to the cycle's framing of artifacts as both human-readable and dialogue-supporting; supports the cycle's thread 5 (turn structure / interactional usability).

**Not directly load-bearing for this cycle (recorded for completeness, not pursued here):**

- The post's political/equity argument and political-defeat framing of burnout. These are authorial position, not within this cycle's scope. The cycle's purpose is comprehension-preserving readability work on the RDD corpus and turn-structure, not a broader cultural intervention.

## Step 1.3 — Research plan and first reviewer dispatch

**Research plan (approved by user):** two-tier — web-search orientation pass on the question set first, then targeted lit-review dispatches likely on Q2 (cognitive/UX literature on first-encounter document design) and Q4 (HCI/conversational-agent literature on turn structure under cognitive load); Q1 and Q3 may be sufficiently practitioner-grounded to skip lit-review. No spikes proposed at this stage.

**First reviewer dispatch.** Reviewer ran on Q1–Q4 + constraint-removal response. Output: `docs/housekeeping/audits/research-design-review-017.md`.

## Step 1.4 — First reviewer findings and user revisions

### Summary of the first reviewer's report

- **P1 (blocking).** Incongruity not examined — the constraint-removal response identified the diagram as load-bearing for human-stakeholder orientation, but no question in Q1–Q4 asks whether the actual diagnosis is **artifact-form mismatch** rather than **document-organization failure**. The reviewer recommended adding a question on the artifact-form thesis.
- **P2 (non-blocking).** (i) Q2 understates the human-vs-agent split as a design axis — listed symmetrically as one of four audiences when constraint-removal established it as a structurally primary division. (ii) Q2's time-granularity scaffold mildly tilts research toward density-ordering literature when constraint-removal more strongly supports the audience-conflation mechanism.
- **P3 (observations).** "Feel better" purpose statement is too soft for gate-time scope evaluation (pre-DECIDE concern, not blocking); no question directly tests whether the five driving concerns share a mechanism (the user-proposed unifying frame is held as hypothesis but not interrogated); Q4 does not scope to the enforcement-loop-specific failure mode that produced the field evidence.

### User decisions on the first review

- **Q5 adopted as drafted.** Folds P1 (artifact-form thesis) and P2 #1 (human-vs-agent axis) into one question.
- **Q6 added.** Captures the user's broader question on audience-scoped folder structure and explicitly reconciles it with the three pre-existing organization axes (Q3 process-vs-product, ADR-070 centered-vs-infrastructure, Q5 artifact form).
- **Remaining P2 #2 (research-loop briefing on co-equal mechanisms) deferred to Step 1.5** — addressable at lit-review dispatch without question revision.
- **P3 observations held for the next reviewer pass and pre-DECIDE** — they may be re-evaluated against the revised question set.

### Field evidence surfaced during Q6 review (user articulation)

The user noted that the corpus has previously **"tried to thread the needle"** — designating some primary documents as serving agents and humans alike (one artifact, two audiences). The user's experience handing those documents to external stakeholders is that they are *hard to comprehend as currently shaped*.

Recorded as a candidate diagnosis, not yet confirmed mechanism: **the "thread the needle" approach may itself be the source of the readability friction external stakeholders are reporting**, which would mean the cycle's solution direction is not "make the threaded-needle docs better at threading the needle" but rather "stop threading the needle for these audiences." This connects directly to Q5 (artifact form) and Q6 (location/scoping) — both questions become the cycle's instrument for examining whether the threaded-needle approach is sustainable for the audiences in play.

The reviewer dispatched on the revised question set should see this as part of the question set's grounding and may evaluate whether the framing embeds a conclusion (i.e., whether "threaded-needle is failing" presupposes its answer).

### Revised question set (Q1–Q6)

Q1–Q4 unchanged from Step 1.1. Q5 and Q6 added below as adopted.

#### Q5. Artifact form and audience separation for Tier-2 orientation

When a visual structural representation already satisfies the human-technical-stakeholder orientation need better than prose, what does that imply for artifact-form decisions across the corpus? Specifically: should visual representations be a primary artifact type rather than a supplementary one; do the human-reader and AI-agent audiences need separate artifact forms (visual orientation for humans, dense context for agents) rather than a combined artifact; and how do the prose-restructuring concerns (Q2 legibility, Q3 process/product, the verbosity thread) relate to this finding — addressing the same problem from a different angle, a secondary problem on the agent-context material that diagrams don't serve, or something else?

#### Q6. Audience as a corpus-organization axis (final, post-re-audit P2-A revision)

Should primarily-agent-facing documentation be separated from human-facing documentation at the organizational level — and if so, by what mechanism (dedicated subdirectory, in-file structuring, artifact splitting, frontmatter tagging, or other)? In support of that decision, examine: (a) how the human-vs-agent audience axis relates to existing organization axes — Q3's process-vs-product, ADR-070's centered-vs-infrastructure — including whether the human-vs-agent axis is a distinct primary axis or a specialization of an existing one; (b) whether "primarily agent-facing" is a tractable classification given that some artifacts are mixed-audience at the section level per the constraint-removal — does separation require splitting artifacts first; (c) what classification strategies from documentation taxonomies survive both graduation and ongoing reorganization without producing dangling references or audience-mismatched reading paths.

## Step 1.3 (re-dispatch) — Second reviewer dispatch on revised question set

Per the mandatory re-audit rule, the research-methods-reviewer was re-dispatched on the revised question set Q1–Q6 + constraint-removal response + thread-the-needle field evidence + first reviewer report. Output: `docs/housekeeping/audits/research-design-review-017-r2.md`.

## Step 1.4 (post-re-audit) — Re-audit findings and final disposition

### Summary of the re-audit

- **P1 (blocking) from first review: Resolved.** Q5 closed the artifact-form-mismatch incongruity. No new P1 issues raised.
- **P2 #1 from first review (human-vs-agent axis underweight): Resolved.** Q5 + Q6 together explicitly center the axis.
- **P2-A (new):** Q6 named `.rdd/` as the example, pre-loading the destination. Reviewer recommended one text revision: open the mechanism space (subdirectory / in-file structuring / artifact splitting / frontmatter tagging / other) and add the option that human-vs-agent may be a primary axis rather than co-equal.
- **P2-B (new):** Thread-the-needle field evidence is correctly hedged, but the connecting framing to Q5+Q6 ("instrument for examining whether threaded-needle is sustainable") creates directional pull. Resolution: Step 1.5 briefing.
- **P2-C (persists, lower severity):** Q2's density-ordering tilt is partially offset by Q5; full resolution requires Step 1.5 briefing that Q2 and Q5 findings be read as co-equal diagnostics.
- **P3-A (new):** Diátaxis is congruent with Q6's audience-separation hypothesis — confirmation-bias risk. Lit-review on Q6 should actively seek alternative positions (layered documentation, single-sourcing for multiple audiences).
- **P3-B (persists):** "Feel better" purpose statement and unifying-frame hypothesis remain untested. Pre-DECIDE concern.

### User decisions on the re-audit

- **P2-A: Adopted as drafted.** Q6 above replaces the prior version with the reviewer's recommended reformulation verbatim. Per protocol, verbatim adoption of the reviewer's own reformulation does not require a third re-audit (the reviewer has already evaluated this exact text).
- **P2-B, P2-C, P3-A:** carried as Step 1.5 briefing commitments (see below). No further question-text changes.
- **P3-B:** carried as pre-DECIDE concern; "feel better" testability candidate from first review remains on the table.

### Step 1.5 briefing commitments (carried into the lit-review dispatches)

The following briefings will be applied at lit-review dispatch time (not at orientation-pass web search time, which is broader). They are committed here so they survive across sessions.

1. **Co-equal mechanism treatment:** Density-ordering, audience-conflation, volume, and *context-mismatch* (initial-handoff vs ongoing-reference are different reading tasks — the reviewer surfaced this competing hypothesis to form-mismatch) are treated as co-equal candidate mechanisms for the readability friction. Q2's findings and Q5's findings are read together at synthesis, not applied independently.

2. **Thread-the-needle as one hypothesis among several:** The threaded-needle candidate diagnosis is examined symmetrically with competing hypotheses, not as the organizing frame for Q5 and Q6.

3. **Q5 premise as hypothesis:** "Diagrams satisfy the orientation need better than prose" is held as a hypothesis to be tested against literature — not as an established premise. The constraint-removal response supports it; the lit-review confirms or qualifies it.

4. **Q6 confirmation-bias scrutiny:** Diátaxis's type-separation principle is congruent with Q6's audience-separation hypothesis. The lit-review actively seeks alternative positions — single-sourcing, layered documentation, conditional content, multi-audience progressive disclosure — and treats Diátaxis as one candidate framework, not authoritative ground truth.

5. **Q5→Q6 sequence dependency:** Q5's artifact-form findings may bound Q6's scope. If Q5 concludes "split artifacts," the directory question changes shape; if Q5 concludes "structural layering within one artifact," the Q6 class may not exist. Q6's research is conditional on Q5's findings, not parallel-independent.

6. **Q3 + Q6 organizational coordination:** Q3 (process-vs-product) and Q6 (audience-based scoping) both produce location recommendations; the synthesis step explicitly checks for conflicts and asks how the two axes compose.

7. **Synthesis-time unifying-frame assessment:** At synthesis, the loop is asked whether Q1–Q6 findings support or challenge the unifying frame ("corpus optimized for production discipline") as a single mechanism vs distinct mechanisms across the five concerns.

## Step 1.5 — Research loop iteration 1: web-search orientation pass

**Method:** WebSearch (Anthropic harness), 2026-04-27. One search per question, six in parallel. Orientation level only — surfaces vocabulary, lead practitioners, and signposts to deeper literature; does not substitute for systematic lit-review on questions warranting it.

### Q1 — Nomenclature leakage / stable identifiers / dangling references

**Surfaced concepts.** Stable Dependencies Principle (components depend on more-stable components; dependencies point in direction of increasing stability). Afferent/Efferent coupling metrics. **Continuous documentation** (InfoQ — three principles: continuously verifying docs, documenting at point of need, coupling docs to code). Empirical research on **automatic detection of outdated/dangling code element references in documentation** (Springer Empirical Software Engineering, 2023) — directly addresses the cycle's failure mode.

**Alternative framings surfaced.** (1) *Coupling-and-cohesion lens* — nomenclature leakage as a coupling issue (corpus internals → code) addressable via standard coupling-reduction strategies. (2) *Continuous-documentation lens* — the issue is not naming but the lack of mechanisms to keep docs and code synchronized; alternative diagnosis worth examining at MODEL/DECIDE.

**Lit-review verdict.** Yes (focused). Springer ESE 2023 paper is a primary anchor; adjacent work on doc-code synchronization warrants targeted retrieval.

### Q2 — Document legibility on first encounter / progressive disclosure / cognitive load

**Surfaced concepts.** Progressive Disclosure (NN/g, IxDF) — gradually reveal complex information as user progresses. Grounded in **Cognitive Load Theory** (Sweller). Particularly effective for novice users encountering technical documentation. Indirect references to **Information Foraging Theory** (Pirolli & Card, 1999) — primary source needs lit-review retrieval.

**Notable reframe.** *"Progressive disclosure treats the agent as an intelligent information forager, not a passive recipient of pre-selected context"* — this maps directly to the audience-conflation finding from constraint-removal: human readers want to forage, agent consumers want exhaustive context. The literature already names the distinction the cycle surfaced empirically. **Vocabulary import opportunity for MODEL.**

**Lit-review verdict.** Yes (deep). CLT, IFT, document-design research are foundational. Brief: hold density-ordering and audience-conflation as co-equal mechanisms.

### Q3 — Process vs product artifacts / location and visibility

**Surfaced concepts.** gitignore conventions; artifactignore (Azure Pipelines); software artifact taxonomy from project management literature.

**Coverage gap.** Search returned predominantly DevOps/CI tooling content rather than documentation-organization taxonomy. "Process artifacts vs product artifacts" is not an established term in the doc-org literature — closest established framings are "build-time vs runtime artifacts" (DevOps) and "documentation type" (Diátaxis).

**Lit-review verdict.** Fold into Q6's documentation-taxonomy dispatch. Q3 standalone does not warrant a separate lit-review.

### Q4 — Conversational agent multi-item turn structure / cognitive load

**Surfaced concepts.** AI-research literature on **agent-side** cognitive load: working memory in LLM agents = context window; capacity-limited like human working memory; semantic chunking; compressed cognitive states evaluated per turn.

**Coverage gap (significant).** Orientation pass returned almost entirely agent-facing memory architectures, **not** user-facing conversational UX. The cycle's Q4 is about user cognitive load when receiving multi-item agent responses — the inverse direction. The HCI / conversational UX literature (NN/g, Miller 7±2, pragmatics of turn-taking, CHI/CSCW multi-turn dialogue research) was not surfaced by these search terms.

**Lit-review verdict.** Yes (deep, re-targeted). Search terms need re-tuning toward "conversational UX," "user comprehension multi-turn dialogue," "Nielsen turn-taking," "chat interface response design."

### Q5 — Diagram-driven documentation / visual orientation

**Surfaced concepts.** **Carnegie Mellon SEI claim: teams using architecture diagrams report 40% fewer miscommunications than text-only teams** (cited via vFunction blog; primary source needs lit-review verification — claim carries methodology-level weight if confirmed). **C4 model** (Simon Brown) — hierarchical levels of architecture diagrams: system context, container, component, code. **Diagram-Driven Design** (chapter 22 of "The Software Architect Elevator," Gregor Hohpe). "Start simple. Begin with 5-7 major components" — consistent with cognitive-load chunking principles.

**Alternative positions surfaced (per re-audit briefing requirement).** *"Use diagrams judiciously where they add value over prose. Unnecessary diagrams create documentation bloat."* Diagrams are not universally superior; they excel for *spatial/parallel/complex* content used *strategically alongside prose*, not as universal replacements. The cycle's Q5 hypothesis ("diagrams superior for first-encounter orientation") is broadly supported but conditional, not absolute.

**Lit-review verdict.** Yes (deep). Primary sources to retrieve: CMU SEI study (verify 40% claim), C4 model docs (Simon Brown), Diagram-Driven Design (Hohpe). Brief: diagrams-superior held as conditional hypothesis per Step 1.5 briefing #3.

### Q6 — Audience as a corpus-organization axis / single-sourcing / Diátaxis alternatives

**Surfaced concepts.** Diátaxis (Procida) — four documentation types (tutorial, how-to, reference, explanation). **Single-sourcing** (Paligo, ClickHelp, Writerside): create content once, reuse in multiple contexts. **Layered content architecture**: basic concepts shared across audiences, role-specific details conditionally included. Conditional text blocks. Variable sets and filtering attributes.

**Alternative-seeking outcome (per re-audit P3-A briefing).** Single-sourcing IS the established alternative position to Diátaxis's type-separation. The two are complementary in practice — Diátaxis classifies WHAT a document is; single-sourcing handles HOW the same content is presented to different audiences. Layered content architecture is concrete and well-developed in practice: shared core + audience-specific conditionals.

**Direct mapping to the cycle.** Layered architecture (shared core + audience conditionals) potentially maps onto RDD's existing structure: ORIENTATION.md as shared core; Tier-2 docs as audience-conditional layers. This is a **concrete alternative to "scope agent-facing to `.rdd/`"** — in-document audience layering vs filesystem-level separation. Q6 now has a real alternative mechanism to test against, not just an absence-of-decision.

**Lit-review verdict.** Yes (deep). Retrieve Diátaxis primary docs, single-sourcing literature (practitioner + technical communication academic), conditional-content patterns. Brief: actively seek alternatives to Diátaxis (already partially satisfied by single-sourcing finding); examine whether layered architecture maps coherently onto RDD's three-tier hierarchy.

### Lit-review dispatch priorities (verdict from orientation)

| Question | Lit-review | Sequence | Notes |
|---|---|---|---|
| Q1 | Yes (focused) | Parallel | Springer ESE 2023 anchor + adjacent work |
| Q2 | Yes (deep) | Parallel | CLT, IFT, document-design |
| Q3 | Fold into Q6 | n/a | Documentation taxonomy covers it |
| Q4 | Yes (deep, re-targeted) | Parallel | HCI/conversational UX, not LLM-agent-memory |
| Q5 | Yes (deep) | **First (gating)** | Q5 findings may bound Q6 scope (Step 1.5 briefing #5) |
| Q6 | Yes (deep) | After Q5 | Single-sourcing + layered architecture as alternatives to Diátaxis |

**Plan:** Dispatch Q5 first as gating step. Once Q5 returns: dispatch Q1, Q2, Q4 (re-targeted), Q6 in parallel, with Q5's findings carried forward as context (especially into Q6).

### Notable second-order findings from orientation pass

1. **Vocabulary the cycle has been re-inventing already exists.** Information Foraging Theory's "forager vs recipient" distinction names what the constraint-removal surfaced as "human-reader vs agent-consumer." Single-sourcing's "shared core + audience conditionals" names a pattern Q6 was framing as a new question. Importing existing vocabulary is cheaper than re-inventing it and connects the cycle's findings to a wider community of practice.

2. **The cycle's "diagrams superior" hypothesis has empirical anchoring (CMU SEI 40% claim) but also conditional qualifiers in the practitioner literature.** Hold the hypothesis as conditional, per Step 1.5 briefing #3.

3. **Q4's orientation pass missed its target literature entirely.** Re-targeted lit-review search terms required before dispatch.

## Step 1.5 — Research loop iteration 2: Q5 lit-review (gating dispatch)

**Method:** rdd:lit-reviewer specialist subagent, model sonnet, 2026-04-27. Full output: `./docs/essays/research-logs/lit-review-017-diagram-driven-orientation.md`. Summary below.

### Key findings

1. **Diagrams hypothesis: qualified support, not unconditional confirmation.**
   - Larkin & Simon (1987): diagrams outperform sentential representations specifically for *search-intensive*, *recognition-dependent*, *spatial/topological/parallel-relational* content. Outside those conditions the advantage is not asserted.
   - Mayer (2001) and dual coding theory (Clark & Paivio 1991): integrated verbal-and-visual representation, **not diagram substitution of prose**.
   - **Heijstek, Kühne & Chaudron (2011), ESEM, n=47:** controlled experiment on software architecture documentation — text users scored as well as or better than diagram users overall, and *significantly better on topology-related questions*. Authors state findings "question the role of diagrams in software architecture documentation."
   - **Ernst & Robillard (2023), EMSE, n=65:** documentation format (narrative vs structured) was *not* a significant predictor of comprehension. **Prior familiarity with the source code was the dominant variable.**
   - Rukmono et al. (2024), 17 practitioners interviewed: diagrams dominate in practice but treated as one tool in an audience-adaptive "explanation window," not universal substitute.

2. **Dual-audience question: literature consensus favors layered delivery from shared source over fully separate artifacts.**
   - llms.txt (Howard 2024): parallel file formats (HTML for humans, Markdown for machines), not separate corpora.
   - Mintlify: unified Markdown source with YAML frontmatter, rendered interactively for humans, flat for AI parsers.
   - Determining factor: **content divergence**. When human-facing and agent-facing material require genuinely different facts, separate authoring is indicated; when they draw on the same facts presented differently, unified-source-with-layered-output is more maintainable.
   - Single-sourcing literature documents two-artifact maintenance risk: divergence + synchronization failure.

3. **Competing mechanisms — all supported, none mutually exclusive. Strongest specific empirical support: context-mismatch (mechanism (e)).**
   - **(e) context-mismatch:** Ernst & Robillard (2023) found prior-familiarity dominates format effects. Pirolli & Card (1999) provide theoretical account: information scent is low for first-encounter readers; artifacts designed for returning practitioners fail them. Rukmono et al. (2024) confirm practitioners adapt to this variable.
   - (b) density-ordering: independently supported by Sweller CLT and Mayer's coherence principle.
   - (c) audience conflation: real, but addressable within unified artifact via content-level layering — does not require full artifact separation.
   - (a) artifact-form mismatch: partially supported, conditional.
   - (d) volume: plausible but likely downstream of other mechanisms.

4. **Provenance: CMU SEI "40% fewer miscommunications" claim is definitively unsourceable.** Direct retrieval of cited blog found no statistic, no source. Systematic search of CMU SEI Digital Library found no matching study. **Drop from RDD reasoning entirely.** Do not cite.

5. **Confirmed primary sources.** C4 model (Brown 2006–2011, c4model.com) — multi-audience zoom-level hierarchy is documented design principle. Diagram-Driven Design (Hohpe 2020) — diagrams as active design instruments enforcing conceptual clarity.

### Implications for the cycle (significant recalibration)

- **The cycle's working hypothesis ("diagrams superior for first-encounter human-stakeholder orientation") is not robustly supported by the literature.** It has qualified support, conditional on content type and granularity. The hypothesis Q5 was scoped to test has been substantially weakened — not falsified, but materially qualified.
- **The most empirically supported mechanism is *context-mismatch* (Ernst & Robillard 2023), not artifact-form mismatch.** This shifts the cycle's diagnostic frame: the failure mode external stakeholders experience may be primarily that initial-handoff is a different reading task than ongoing-reference, and the artifact is built for the latter while being encountered as the former. Form changes (diagrams) may help but may not address the primary cause.
- **The dual-audience question's literature consensus undermines the "scope to `.rdd/`" hypothesis.** Layered delivery from shared source (llms.txt, Mintlify-style YAML frontmatter) is the literature's preferred mechanism. Q6's "should agent-facing live in a separate directory?" inherits a literature-level pre-disposition toward "no — use in-document layering instead."
- **The thread-the-needle diagnosis is partially undermined.** Layered delivery IS a refined form of threading the needle (one source, multiple audiences via layered output). The user's experience that current threaded-needle docs are hard to comprehend may indicate *poor threading* rather than *threading is wrong*.

### Open questions surfacing from Q5

- Does Heijstek et al.'s (2011) result generalize from formal UML diagrams to RDD's informal architectural diagrams?
- Does Ernst & Robillard's (2023) prior-familiarity finding hold for zero-code-exposure external stakeholders specifically?
- Does C4's zoom-level hierarchy map directly onto RDD's three-tier structure, or does the mapping require argument?
- HCI literature gap on initial-handoff vs ongoing-reference as distinct reading tasks — most significant gap for the now-foregrounded context-mismatch mechanism.

## Step 1.5 — Research loop iteration 3: parallel lit-reviews on Q1, Q2, Q4, Q6

**Method:** rdd:lit-reviewer specialist subagents, model sonnet, dispatched in parallel 2026-04-27.

### Q1 — Nomenclature leakage / corpus-internal identifiers

Full output: `./docs/essays/research-logs/lit-review-017-nomenclature-leakage.md`.

**Most strongly supported framing: doc-code coupling (continuous documentation), not naming.** The failure mode is a synchronization problem, not fundamentally a naming problem.

- **Empirical baseline:** Tan, Wagner & Treude (2024, EMSE) — most GitHub projects in 3,000+ repo sample contain outdated code element references in documentation at some point. Aghajani et al. (2019, ICSE) — up-to-dateness failures account for ~25% of doc content issues across 878 artifacts. Hata et al. (2019, ICSE) — ~10% of links in source code comments are dead. Xiao et al. (2023, EMSE) — 70% of distinct links in commit messages decay. **Staleness is routine, not marginal.**
- **Four naming-strategy durability profiles:** (i) semantic naming (RDD's current — embeds mutable content; Berners-Lee 1998 identifies as primary cause of identifier decay); (ii) opaque identifiers (DOIs at 99.1% resolution success vs ~69% for plain URLs over same window — Coble & Karlin 2023); (iii) sequential+immutability+supersession (IETF RFC series, ADR community practice); (iv) name+registry indirection (PURL, 303-redirect — W3C pattern, Sauermann & Cyganiak 2008).
- **Continuous-documentation principles** (Rosenbaum 2021, InfoQ/Swimm): always up-to-date, created when best, code-coupled. Most fully realized practitioner implementation: continuous verification with CI/CD hooks flagging docs for review when referenced code elements change.
- **Stable Dependencies Principle** (Martin 2002): policy implication — corpus artifacts that reference stable codebase surfaces (public APIs, versioned interfaces) accumulate fewer dangling references than those referencing volatile internals.
- **Cross-domain analogues:** reference rot in scholarship (Coble & Karlin 2023: 31% rot in DHQ citations 2007–2019); URI stability theory; IETF RFC supersession model.

**Genuine empirical gap, novel to RDD.** The literature studies doc→code dangling references (Tan et al.). RDD's Issue #17 is code→doc dangling references (the reverse direction), which is not studied empirically. Graduation ceremonies are not addressed in prior literature. Both correctly name real design gaps.

### Q2 — Document legibility on first encounter

Full output: `./docs/essays/research-logs/lit-review-017-document-legibility.md`.

**Context-mismatch is the most structurally fundamental mechanism**, supported by four converging frameworks: Cognitive Load Theory (Sweller 1988, 1998, 2010); Information Foraging Theory (Pirolli & Card 1999); Diátaxis (purpose-typing); and the Ernst & Robillard (2023) finding that prior-familiarity dominates format effects.

- **F-pattern eyetracking** (Nielsen 2006, n=232, thousands of pages): first encounter is dominated by scanning — horizontal sweep across top, shorter sweep lower, then vertical scan down left margin. **No word-for-word reading occurs in the first seconds.** Critical information must appear in upper-left or it will not be read.
- **Morkes & Nielsen (1997, n=81):** scannable layout improves measured usability by 47%; conciseness by 58%; objective tone by 27%. Combined: **+124% usability**.
- **CLT mechanism for first-encounter failure:** first-encounter reader has zero schemas → maximum intrinsic load. Front-loading dense reference material (e.g., the architectural-drivers table) imposes maximum extraneous load at the moment intrinsic load is highest.
- **IFT mechanism:** first-encounter reader has zero information scent. Lookup-optimized structure provides no scent for the forager.
- **Expertise reversal effect** (Kalyuga et al. 2003): designs for novices lose effectiveness for experts and vice versa. *Measurable comprehension difference, not preference.* Returning practitioners' schemas make orientation scaffolding redundant; new collaborators' lack of schemas makes dense reference incomprehensible.
- **Agent README empirical evidence:** readability scores at 16.6 (legal-document level) — agent-optimized density is empirically hostile to human first-encounter reading. arXiv 2604.07502: humans need small files and visual formatting; agents need consolidated access and navigational indexes. *Structural divergence, not just preference.*

**Time-granularity scaffold (30s/5min/30min) is heuristic, not empirical.** No published source. Heuristically congruent with F-pattern, CLT, scanning research, but claims derived from it should not be presented as empirically established.

**Scope-expansion implication.** Ernst & Robillard's prior-familiarity dominance suggests the cycle's intervention scope should include *context-building tools* (orientation summaries, conceptual introductions), not just document restructuring. Document reorganization alone may have limited effect if prior-familiarity is the dominant variable. Per ADR-069, scope claims should be appropriately bounded.

**Open empirical question:** prior-familiarity dominance at *orientation level specifically* (zero-prior-exposure first-encounter reading) was not separately analyzed in Ernst & Robillard. The exact failing scenario in the cycle's field evidence — external stakeholders bouncing off Tier-2 docs — is not directly tested.

### Q4 — Conversational turn structure under multi-item pressure

Full output: `./docs/essays/research-logs/lit-review-017-conversational-turn-structure.md`.

**The failure mechanism is fourfold, not one.** The literature distinguishes four separable causes of multi-item agent turn failure:

- **(A) Structural ordering** — high-density content front-loaded without orientation. Remedy: inverted pyramid, answer-first.
- **(B) Volume** — too many items, exceeding the 3–5 chunk working memory ceiling (Cowan 2001). Remedy: single-item-per-turn chunking *across* turns.
- **(C) Scope** — agent mixing heterogeneous concern types (gate response + questions + context) that should have been separated upstream. Remedy: upstream decomposition.
- **(D) Priority opacity** — user cannot determine which item demands a response. Remedy: explicit priority announcement before content.

**The Q4 field evidence exhibits all four simultaneously.** The "enumerate-then-walk-through" pattern named in the question addresses B and D but **leaves A and C unaddressed**. The most neglected mechanism in the cycle's framing is **scope (C)**: the agent should have decided, before producing the turn, that a gate response and clarifying questions belong in separate turns — not just that they should be enumerated before delivery.

- **"Wall of text" is documented but colloquial** — not a named HCI construct, but the underlying phenomenon is empirically established (F-pattern: 79% scan, 16% read fully; NN/g accordion-editing study: users rework long AI outputs rather than comprehending them; Springer 2024 chatbot study: unstructured responses elevate physiological arousal and perceived effort).
- **Pragmatics + CA provide theoretical ground.** Grice's quantity and manner maxims directly prohibit over-contribution per turn. Sperber & Wilson's relevance theory predicts users rationally deprioritize underprocessed items — the clarifying questions get abandoned, not the gate response, because the user follows the highest-relevance path. CA's adjacency-pair structure shows why multiple simultaneous first pair parts create recipient design failure.

**Open question:** no empirical study directly tests enumerate-then-walk-through as a named pattern. Task-type dependency of optimal chunking granularity is unresolved.

### Q6 — Audience as a corpus-organization axis (Q3 folded in)

Full output: `./docs/essays/research-logs/lit-review-017-audience-corpus-organization.md`.

**Literature does NOT support directory-level audience separation.** Diátaxis, DITA, Information Mapping all organize by *content type*, not audience type. The pattern that scales is **parallel-sibling companion files at predictable paths** (llms.txt alongside HTML, AGENTS.md alongside README.md) — companion files that are *additive*, not *substitutive*.

- **Diátaxis confirmation-bias risk realized.** Its boundary-crossing warning applies to *type* mixing (tutorial vs reference vs how-to vs explanation), **not audience mixing**. The analogy Q6's hypothesis was drawing from Diátaxis does not hold precisely. Treating Diátaxis as confirmation for audience separation is the bias the briefing named.
- **DITA's audience-separation pattern: metadata attribute (@audience) with conditional processing**, not directory reorganization. Closest classical analogue to Q6's question; its answer is *tagging, not folder structure*.
- **2024–2025 consensus bifurcates by scenario:**
   - *Documentation-site corpora (shared content, high overlap):* unified source with audience-conditional rendering or frontmatter layering (DITA, Mintlify, TCBOK/Paligo). Separate corpora create maintenance divergence.
   - *Context-engineering artifacts (functionally divergent content, different facts):* parallel-sibling files at predictable paths (llms.txt, AGENTS.md). Not separate directories — *companion files*.
- **New finding:** agent context-window compression is itself a driver of separation. Comprehensive unified documents may actively degrade agent performance by burying critical context in the lost-in-the-middle zone. **This argues for a purpose-built, compressed agent-facing artifact — but as a companion file, not a separate directory.**

**On Q3 (process vs product):** not formalized in tech-comm taxonomy literature. The closest structural answer in the software ecosystem is the **dotfile convention** (`.github/`). ADR-070's `.rdd/` for *infrastructure artifacts* (dispatch logs, migration markers, cycle-status, operational logs) is well-supported by this convention. The distinction between "infrastructure artifacts" and "still-useful process traces" (research logs, audit reports) is a genuine judgment call; the literature supports the residual-value distinction ADR-070 already drew.

**On axis interaction:** multiple classification axes cannot all be primary in a hierarchical filesystem. Classical frameworks unanimous: content *type* should be primary directory-level axis; audience as secondary metadata. The llms.txt / AGENTS.md pattern enacts "audience at the margin" — primary corpus retains type-based organization, audience optimization is *additive* via companion files.

**On tractability of "primarily agent-facing":** tractable when content is *functionally divergent* (agent version requires genuinely different facts). Not tractable when same content serves both audiences at different rates. AGENTS.md case is tractable (build steps, test commands clutter human docs); system-design.md case is a judgment call requiring artifact examination, not literature.

**On reorganization survival:** type-based and role-based classifications survive reorganization better than audience-based — type and generative role are content properties; audience can shift as consumption patterns change.

## Step 1.5 — Cross-iteration synthesis

The cycle has cycled through web-search orientation + five lit-reviews. The combined picture is substantially recalibrated from the cycle's entry hypotheses. Recording the synthesis here as a research-loop entry, *not* yet as the essay.

### Diagnosis: the user's "front-loaded density" hypothesis is partially superseded

The user's entry hypothesis was *front-loaded density* in Tier-2 docs. The constraint-removal surfaced a refined hypothesis (*audience conflation* / *artifact-form mismatch*: diagrams better than prose for orientation). Five lit-reviews converging:

- **Context-mismatch** (initial-handoff is a different reading task than ongoing-reference) is the most empirically supported primary mechanism. Ernst & Robillard 2023 + four converging frameworks (CLT, IFT, Diátaxis, expertise reversal). The user's docs are designed for ongoing-reference; external stakeholders encounter them as initial-handoff. Form changes (diagrams) help with the symptom but do not address the primary cause.
- **Density-ordering** is real and independent — front-loading dense material applies maximum extraneous load when intrinsic load is highest (CLT mechanism). Even after context-mismatch is addressed, density-ordering will continue to fail first-encounter readers.
- **Audience conflation** is real but addressable within unified artifacts via content-level layering (DITA @audience, Mintlify-style frontmatter, parallel-sibling companion files like llms.txt / AGENTS.md). Does not require directory-level separation.
- **Artifact-form mismatch** (diagrams vs prose) is partially supported, conditional on content type and granularity. Diagrams are not universally superior; they excel for spatial/parallel/complex content used strategically. Heijstek 2011 found text users scored as well or better; Ernst & Robillard 2023 found format was not a significant predictor.
- **Volume** is plausible but downstream of other mechanisms.

### Q6 has a literature-supported answer

The cycle's "should agent-facing live in `.rdd/`?" framing is partially superseded. The literature's answer:

- **For infrastructure artifacts** (operational logs, dispatch logs, migration markers, cycle-status): yes, dotfile convention supports `.rdd/`. ADR-070 already does this for housekeeping; the literature supports extending it.
- **For agent-context content** (the parts of system-design.md the user described as "more helpful to the AI agent in constructing context"): the supported pattern is **parallel-sibling companion files** (an `AGENTS.md` or similar at the corpus root, additive to the human-facing docs) — *not* a separate directory.
- **For dual-audience artifacts where content is shared:** unified source with audience metadata (frontmatter conditionals); not separate artifacts.

### Q4 has a literature-supported answer

The cycle's "enumerate-then-walk-through" pattern is partial. The fourfold mechanism account (ordering / volume / scope / priority) clarifies that the pattern addresses volume + priority but not ordering + scope. **Scope (upstream decomposition)** is the most neglected mechanism — the agent should decide whether multiple concern-types belong in separate turns *before* producing the turn.

### Q1 names a real, novel design gap

Continuous documentation lens is the strongest framing. Code→doc dangling references (RDD's Issue #17) are not empirically studied — graduation ceremonies are not addressed in prior literature. The cycle has a genuine novel contribution here: the framework's process for graduating corpus identifiers into durable artifacts.

### Vocabulary the cycle should import

- *Forager vs recipient* (Pirolli & Card IFT) — names the human-vs-agent audience axis empirically.
- *Expertise reversal effect* (Kalyuga 2003) — names the measurable comprehension difference between novice and expert reading patterns.
- *F-pattern* (Nielsen 2006) — names the first-encounter scanning behavior.
- *Companion file pattern* (llms.txt, AGENTS.md) — names the dual-audience design pattern that scales.
- *Continuous documentation* (Rosenbaum 2021) — names the doc-code coupling framing.
- *Information scent* (IFT) — names what first-encounter readers lack.
- *Adjacency-pair recipient design failure* (Conversation Analysis) — names what multi-initiation turns produce.

### Open questions surviving the research loop

- Heijstek 2011 generalization to informal architectural diagrams (Q5 gap).
- Ernst & Robillard 2023 prior-familiarity dominance at *orientation level* specifically (Q2 gap).
- Code→doc dangling reference detection — empirical research is reverse-direction (Q1 gap).
- Empirical study of enumerate-then-walk-through as named pattern (Q4 gap).
- Whether C4 zoom-level hierarchy maps onto RDD three-tier structure (Q5 + Q6 cross-cutting).

These are gaps no further lit-review will close — they require either spike, field study, or are tractable through synthesis-into-essay rather than further investigation. Recommendation: proceed to essay, with the option to loop back if essay-writing surfaces unresolved gaps.
