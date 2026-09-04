# Research Log: Cycle 020 — Corpus Topology and Agent-Navigable Compaction

*Started 2026-05-22. Plugin version at start: v0.8.7.*

## Step 1.1: Articulated research question(s) (written before corpus read)

The user's question, recorded as articulated at cycle open (verbatim and paraphrased):

### Primary question

Does the RDD corpus exhibit an **uneven topology** — middle-of-the-road choices accreting where single bold ones would suffice — and could a **compact, agent-navigable structure** (user's candidate: a knowledge graph linking invariants × vocabulary × ADRs × code) simultaneously:

1. Maximize provenance,
2. Surface duplicated responsibilities, and
3. Let gate checkpoints be presented to the user in plain language instead of cross-referential subsection-numbering ("invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing")?

### Two interlocking sub-questions

- **Topology sub-question.** Are Cycle 019's 5 ADRs (094, 095, 096, 097, 098) actually five distinct calibration moves, or one underlying move expressed at unnecessary granularity? The theater metaphor (user-framed): "the granularity of ADRs (5 new in the last cycle) was akin to an actor making middle of the road choices as opposed to a one big bold choice that is easy to understand. The result is that we write complex code to suit many small cases versus making a singular choice we can easily validate."
- **Compaction sub-question.** Can corpus knowledge move into structures the agent navigates compactly AND the user reads in plain language? The user's felt experience: gate checkpoints present language like "invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing — what would you need to believe for the converse to be true?" — high cross-referential density that obscures the underlying choice.

### What the user already knows or assumes

- Cycle 019 concluded that over-engineering resolves to a *calibration* question across methodology layers (Essay-Outline 018 C1).
- The user introduced the "uneven topology" hypothesis during the Cycle 019 DECIDE gate as the cycle was closing — flagged as open thread, not yet researched.
- The user has named a specific candidate solution (knowledge graph). The cycle's research-entry discipline must bracket this candidate before treating it as the answer.
- Plexus MCP (KG engine with provenance tracking) is loaded in this environment — making KG spikes cheap if RESEARCH determines a spike is warranted.

### What would change the user's approach if the answer were different

- If the 5 Cycle 019 ADRs are genuinely 5 distinct moves with no compressible substructure → the topology hypothesis is wrong; the gate-density problem is independent and needs its own remedy.
- If the ADRs are compressible (share warrants / consequences / decision-mechanism patterns) → the methodology may have a granularity calibration move available, parallel to ADR-091 (dual-mode BUILD) and ADR-083 (cognitive economy for human-facing artifacts).
- If KG-backed compaction is the right structure → spike-test feasibility on this project's corpus; design a methodology amendment.
- If KG is the wrong structure (other compactions serve better) → the cycle pivots to whatever the evidence supports.
- If neither topology nor compaction has a tractable methodology answer → the cycle outputs scope-of-claim discipline (name the residual; record the conditions under which future cycles could address it).

## Step 1.2: Constraint-removal prompt and response

### Agent-named artifact

**ADR-as-the-decision-recording-unit.** Of the artifacts whose presence most shapes the default solution space for this cycle's question, ADRs are the structural commitment closest to both sub-questions. The topology sub-question is literally about ADR granularity (the user's "5 middle-of-the-road choices vs. one bold choice" framing). The compaction sub-question inherits its weight from the corpus's ADR-dominated bulk (98 ADRs across ~500 KB per Cycle 019's measurement). The user's KG hypothesis is itself an implicit critique of how ADRs accumulate and cross-reference.

### Agent-composed prompt

> *What if RDD did not use ADRs as its unit of decision recording? How would the framework capture and make navigable its accumulated design choices — and how would the "topology" and "gate-density" pains look in that alternative world?*

### User response (verbatim)

> If I think about how RDD is used through the graduation phase, my experience has been the corpus is too much to grapple with as a person. I like ADRs from the standpoint that they communicate specific decisions. But similarly it can be hard to get the big picture from the granularity of them. So like last time, I'd be interested in 1 ADR that was higher level rather than 5 granular ones. These can still translate into a coherent implementation but through some other substrate perhaps (that is also auditable).

### Analysis of the response (not a delegation — recording what the response surfaces)

The constraint-removal prompt was not fully accepted as bracketing — the user did not imagine a world without ADRs. Instead, the response **re-anchored to a structural refinement within the ADR mechanism**, distinguishing two functions ADRs currently bundle:

1. **The big-picture commitment function** — what ADRs do well; the user values it; they want this preserved.
2. **The granular-detail-carrying function** — what makes ADRs accumulate to corpus weight that "is too much to grapple with as a person" at graduation. The user proposes pushing this function into **"some other substrate ... that is also auditable."**

**Three load-bearing things this response names:**

- The felt-overwhelm has a **specific phase anchor: graduation**. The corpus weight is most felt at the moment when knowledge must be folded into native docs and the scaffolding comes down. This is empirically tractable and worth investigating (why graduation specifically?).
- The user is **not arguing ADRs should be eliminated** — they're arguing for structural refinement, with the topology hypothesis as the diagnosis (5 → 1).
- The proposed alternative substrate **must remain auditable**. The audit-substance is non-negotiable; the format/granularity is negotiable. This is the test any candidate compaction structure must pass.

**Greenfield-equivalent acknowledgment:** Per ADR-082 §"Irreplaceable-artifact case", the user's response treats ADRs' big-picture commitment function as functionally irreplaceable. The structural refinement (split commitment from detail) is the framing the cycle proceeds under. The research does not need to re-argue whether ADRs themselves are necessary; it does need to investigate (a) topology compression within the ADR layer and (b) substrates that can carry granular detail while preserving auditability.

## Step 1.4: Research-methods reviewer findings + user responses to P1-A bracketing

### Reviewer findings (full report at `.rdd/audits/research-design-review-020.md`)

Six flags total: 2 P1, 3 P2, 1 P3, plus one watch-item on Loop 5 spike target.

- **P1-A** (constraint-removal completeness): three structural alternative families needed on record with user position before Loop 1.
- **P1-B** (incongruity not surfaced): simple answer (scaffolded thematic consolidation) vs. complex answer (substrate mechanism) needs threshold question at Loop 1 close. **Adopted as Loop 1 deliverable.**
- **P1-C** (embedded conclusion in "unnecessary granularity"): topology sub-question reformulated. **Reformulation adopted.**
- **P2-A** (primary question imports KG): KG mention moved to plan's candidate-directions section. **Adopted.**
- **P2-B** (co-satisfiability assumption): compaction question reformulated to "does it require the same structure or different ones?" **Adopted.**
- **P2-C** (missing normative criterion): added Loop 1 task — "what does well-formed ADR topology look like for Cycle 019's scope?" **Adopted.**
- **P3** (audience-bifurcation pattern synthesis): promoted to named Loop 1 task. **Adopted.**
- **Watch-item** (Loop 5 spike target pre-written for JSON-linked-list): added explicit Loop 2 close step — "revise Loop 5 spike target if evidence supports different candidate." **Adopted.**

### User positions on P1-A alternatives (verbatim)

> 1) Scenarios are ok, but they are fine-grained by design - they don't help the user see the big picture.
> 2) I like this but again, it's a lot for a user to hold
> 3) This is my favorite -- a picture is much easier to reason about. This is where having a high-level picture, that then leads to sub-system pictures is helpful. I think you were not talking about a visual graph -- but I think a graph structure could be visualized by a variety of tools in a variety of ways. If we have a good way to see it at different resolutions that would greatly enhance RDD's "understanding" value proposition.

### Analysis of the three positions (recording what they surface — not collapsing to a single direction)

**Decisions-as-scenarios-only: rejected.** Same fine-grained occlusion as ADRs. **Important pattern-level finding:** the topology pain is NOT unique to ADRs. Any granular artifact form suffers the big-picture-occlusion problem. This generalizes Cycle 020's question beyond ADRs specifically.

**Decisions-as-living-narrative: partial appeal, rejected on cognitive load.** "A lot for a user to hold." The Cockburn pattern's central reading mechanism is a single long narrative; the user names cognitive load at the synthesis moment as the disqualifier. **Pattern-level finding:** the corpus weight problem is not solved by reducing artifact count alone — a single long document has the same problem if it's monolithic.

**Decisions-as-graph-only: favored, sharpened.** The user's reasoning is load-bearing:
1. **"A picture is much easier to reason about."** Visual reasoning is named as the value proposition.
2. **Multi-resolution viewability** — "having a high-level picture, that then leads to sub-system pictures is helpful... If we have a good way to see it at different resolutions that would greatly enhance RDD's 'understanding' value proposition."
3. **Structure vs. visualization are separable.** "I think you were not talking about a visual graph -- but I think a graph structure could be visualized by a variety of tools in a variety of ways." The graph is the data structure (plugin-native, plain text); visualization is a tool-agnostic downstream rendering.

**Familiar pattern-naming (for the research's benefit):** the user has implicitly named what Shneiderman 1996 calls *"overview first, zoom and filter, then details on demand"* — the visual information-seeking mantra. The C4 model (Brown) is the architecture-diagram analog. Cognitive map literature (Tversky; Kosslyn) speaks to multi-resolution mental models. Loop 2 should attend to this literature directly.

### What this changes about Cycle 020's direction

**Strengthened candidate** (NOT yet adopted as methodology answer): a graph-structured data layer (plugin-native — JSON, markdown frontmatter with cross-refs, or similar parseable form) that supports multi-resolution viewing (high-level → sub-system → detail). The graph is the substrate; viewing is a separate rendering concern that tools (Mermaid, Graphviz, agent-generated ASCII, computed summaries) can take on.

**Bracketing still holds.** Per ADR-082 discipline: the user has given strong reasoning for this candidate, but research should examine evidence on:
- Does multi-resolution visualization actually deliver understanding gains, or does it create new failure modes (e.g., context loss at zoom boundaries; over-confidence in incomplete views)?
- What graph structures support multi-resolution? Hierarchical graphs? Nested abstractions? Recursive composition?
- What plugin-native rendering options exist? What are their cost/fidelity tradeoffs?
- Where has multi-resolution viewability FAILED in software documentation? (negative cases matter)

**Generalization:** the topology problem is not unique to ADRs (scenarios suffer it too). The cycle's framing should not treat ADR-topology as the central question — the central question is **artifact-granularity-vs-big-picture-occlusion** across the corpus, with ADRs as the most acute case.

## Step 1.5: User-articulated telos (recorded at Loop 1 start)

The user added a sharper teleological frame at Loop 1 entry — recording verbatim because it specifies WHY the user-friendliness matters in measurable terms:

> Claude now has "auto-mode", which is great. To me though it means I want to do due diligence planning via RDD so that by the time I get to build and its work packages, I don't need to think very much. But when RDD has lots of information and technicalities for me to weigh on the way to build, I get fatigued. I like RDD's thoroughness, but if RDD wants to earn its keep, it should help me, the user, understand as plainly as possible so I can in turn give the clearest direction possible.

### Telos restated

The methodology's value to the practitioner is measured by **the clarity of direction-giving the practitioner can provide**, especially when downstream phases (auto-mode BUILD per ADR-091) execute that direction without further practitioner involvement. Fatigue at pre-BUILD phases → unclear direction → degraded BUILD output. The user-friendly half of the audience-bifurcation question is therefore not a comfort concern; it is a **direction-quality concern** with measurable downstream consequences.

### What this changes about Cycle 020's evaluation criteria

Any candidate methodology amendment from this cycle should be evaluated against:
1. **Does it preserve agent capability?** (the agent-enabling half)
2. **Does it reduce practitioner fatigue at gate-and-decision moments?** (the user-friendly half)
3. **Does it improve the clarity of direction the practitioner can give to downstream phases?** (the load-bearing telos)

Criterion 3 is the user's load-bearing claim. Criteria 1 and 2 are necessary but not sufficient.

### Connection to existing methodology moves

- **ADR-091 (dual-mode BUILD).** Auto-mode shifts the practitioner out of the BUILD loop. Direction-quality therefore matters more, not less, when auto-mode is in use.
- **ADR-083 (cognitive economy).** Already names fatigue as a concern at human-facing artifacts. The user is now extending the concern: fatigue is not just an in-phase issue; it propagates to direction-quality downstream.
- **ADR-095 (agent outcome test).** Agent-facing artifact admissibility. The user's telos says agent-capability preservation is necessary but the practitioner-direction-clarity test is the load-bearing one.

## Loop 1: Topology examination + graduation-practice as evidence (2026-05-22)

**Method:** Direct read and analysis of ADRs 094–098 + Essay-Outline 018 §10. No subagent dispatch.

### 1.1 Decomposition map per ADR

| ADR | Commitment | Workflow point | Calibration mechanism | Tier | Graduation trigger |
|-----|-----------|---------------|----------------------|------|-------------------|
| **094** | Audit-round-count calibrated by Convergence-Saturation Signal; default 3 rounds | Audit-round-end (within an artifact's audit sequence) | Verdict-line: P1 count, P2-new count, new framings, recommendation | **Skill-Structure** (agent definitions; verdict-line observable) | After 2–4 cycles, retrospective evaluation of TRIGGERED predictions tightens/loosens thresholds |
| **095** | Agent Outcome Test as Tier-2 admissibility criterion for agent-facing artifacts | Agent-facing artifact creation moment | Felt-trigger: "does this produce direct agent consumption without re-orientation cost?" + consumer-naming-with-actionable-distinction discriminator | **Tier-2** (felt-judgment; no enforcement) | Multi-cycle evidence of felt-trigger failing → /rdd-conform audit step |
| **096** | RESEARCH loop termination via Pirolli-Card patch-switching | Research-loop-end | Verdict-line: marginal yield, specific next-question, practitioner expected observation, recommendation | **Skill-Structure** (skill text addition to /rdd-research) | Future-cycle extension to SYNTHESIZE phase if evidence warrants |
| **097** | Empirical-Grounding Filter at DECIDE; four grounding-mechanism paths; Conditional Acceptance / adr-deferred- patterns | ADR-drafting moment | Felt-trigger: "empirically grounded by PLAY / stakeholder / spike / structural-operationalization?" | **Tier-2** (felt-judgment; no enforcement) | After 2–4 cycles, Loop 6-style cross-project assessment; if kitchen-sink persists, graduate to larger Branch A amendment |
| **098** | FF1 + FF3 named-deferrals with two-direction (harm + reliance) graduation triggers | Methodology-level audit gap recognition | Named-deferral with explicit conditions; current operating posture = best-effort advisory | **Tier-2** (vocabulary recognition; no enforcement) | 2–4 cycles of harm evidence OR reliance evidence → Skill-Structure Layer amendment |

### 1.2 Compression analysis — shared structural pattern

**All five ADRs apply a single underlying methodology pattern**, which can be named:

> **Calibration-with-Graduation-Trigger Pattern.** When the methodology recognizes a workflow point where (a) marginal yield, (b) admissibility, or (c) audit coverage needs tuning, it adopts: a workflow-point spec → a calibration mechanism (saturation signal / felt-trigger / named-deferral) → a tier classification (Skill-Structure if evidence supports; Tier-2 if not) → an audit-bearing artifact (verdict-line / vocabulary annotation / structured-record entry) → a graduation trigger (multi-cycle conditions for escalating tier).

The five ADRs are five **application points** of this single pattern:

| Application point | ADR | Calibration mechanism class |
|-------------------|-----|----------------------------|
| Audit-round-end | 094 | Saturation signal (marginal yield) |
| Research-loop-end | 096 | Saturation signal (marginal yield) |
| Agent-facing artifact creation | 095 | Felt-trigger admissibility |
| ADR-drafting (empirical grounding) | 097 | Felt-trigger admissibility |
| Methodology-level audit gaps | 098 | Named-deferral with two-direction triggers |

**Shared structural elements across ADRs:**

- All five name the workflow point precisely (mechanically-observable position).
- All five specify the calibration mechanism at the named position.
- All five classify tier (Skill-Structure / Tier-2) based on evidence base depth.
- All five carry an audit-bearing artifact (verdict-line / felt-trigger annotation / named-deferral).
- All five name multi-cycle graduation triggers.
- All five apply ADR-097's Empirical-Grounding Filter to their own scope choices (Tier-2 from thin evidence; Skill-Structure from direct evidence). ADR-098 is the most explicit about this reflexive application.

**Shared rejected alternatives (across multiple ADRs):**

- "Fixed count / fixed criterion" rejected in 094 (Alt A) and 096 (Alt A) for the same reason.
- "Bundle with X as one cross-skill mechanism" rejected in 094 (Alt E) and 096 (Alt D) and 098 (Alt D) for similar workflow-point-distinctness reasons.
- "Skill-Structure enforcement from thin evidence" rejected in 095 (Alt A), 097 (Alt A), and 098 (Alt A) for the same reflexive-application reason.

The rejected-alternative overlap is itself evidence of the shared pattern: the same alternatives are considered and rejected for the same reasons because the same underlying decision is being made at five workflow points.

### 1.3 Audit-substance preservation test

**Question:** Can the 5 ADRs compress to 1 ADR + structured substrate entries without losing audit-substance?

**Three compression options examined:**

- **Option A** — One ADR (the pattern) + five structured substrate entries (the applications). Substrate is a first-class auditable layer.
  - Audit-substance preserved IF substrate is auditable. The user's "JSON linked list" candidate is one form; alternatives include structured markdown tables, scenarios.md-style blocks, dedicated structured-record files.
  - Each substrate entry carries: workflow point, calibration mechanism class, specific mechanism details (verdict-line format / felt-trigger phrasing / named-deferral conditions), tier, rejected alternatives specific to this application, graduation trigger.
  - **Verdict:** preserves audit-substance.
- **Option B** — One ADR with no substrate; details collapse into the pattern statement.
  - Specific thresholds, felt-trigger phrasings, four-grounding-mechanism-paths, two-direction-triggers are lost.
  - **Verdict:** FAILS audit-substance test. Specific design choices that were fought-for in R3/R5 rounds disappear.
- **Option C** — One ADR with five application points described in-line; rejected alternatives aggregated where overlapping.
  - Audit-substance preserved but ADR becomes large; no separation of overview from detail.
  - **Verdict:** preserves audit-substance but does not achieve the user's compaction goal — the ADR layer becomes the heavy layer instead of the substrate layer.

**Compression verdict:** Option A is the only compression that simultaneously (a) reduces the user-facing ADR count from 5 to 1, (b) preserves audit-substance, (c) supports the user-named "graph + multi-resolution viz" reading where overview (ADR) and detail (substrate) are separable.

### 1.4 Well-formed ADR topology benchmark (reviewer P2-C)

Based on the compression analysis, a candidate benchmark for what well-formed ADR topology looks like for a cycle of Cycle 019's scope:

**A well-formed ADR topology decomposes into:**

1. **One or more Big-Move ADRs** — each commits the methodology to a structural pattern. Audit-bearing at the pattern level. Reader-facing.
2. **N substrate entries** — each commits the methodology to a specific application of a Big Move at a named workflow point. Audit-bearing at the application level. Agent-facing primarily; reader-facing via multi-resolution navigation from the Big-Move ADR.

**Indicators of well-formed topology:**

- Each Big Move maps to a coherent structural pattern (workflow-point / calibration-mechanism / tier / artifact / graduation).
- Application points are independently testable but inherit pattern-level audit guarantees.
- A practitioner asking "what is the methodology doing here?" gets the Big-Move ADR; an auditor verifying a specific commitment gets the substrate entry.
- The Three-Tier Enforcement Classification (ADR-067) maps cleanly: Big Moves and substrate entries each declare their tier.

**Indicators of ill-formed topology (the 5-ADR Cycle 019 case):**

- Multiple ADRs each apply the same underlying pattern at different workflow points but are filed at the same level of granularity.
- Reader navigates 5 ADRs to construct the pattern that 1 ADR + 5 substrate entries would have presented directly.
- Rejected-alternative overlap is not visible because each ADR's rejected-alternatives section is local.
- Reflexive application of one ADR's reasoning to another's scope choice is visible (ADR-097 → ADR-098) but the structural relationship is not.

### 1.5 Audience-bifurcation pattern synthesis (reviewer P3)

The methodology already has multiple ADRs addressing the audience-bifurcation question:

| ADR | What it does | Pattern direction |
|-----|--------------|-------------------|
| **064** | Centered-vs-Infrastructure distinction (introduced at DECIDE gate 2026-04-09) | Names the two artifact categories |
| **083** | Cognitive Economy for human-facing artifacts (Outcome Test) | Tier-2 admissibility for human-facing |
| **084** | Agent context content placement (Patterns A–C) | Co-location / different-source structural patterns |
| **085** | RDD infrastructure relocation (`.rdd/`) | Filesystem-level separation |
| **092** | Essay-Outline as RESEARCH artifact form (structured-content layer) | Form change to reduce surface for framing-adoption |
| **095** | Agent Outcome Test (parallel to 083) | Tier-2 admissibility for agent-facing |

**Pattern synthesis:** All six ADRs are convergent — they progressively articulate the audience-bifurcation as a methodology-level structural concern with consistent direction: separate the two consumption surfaces; classify artifacts by intended consumer; use admissibility tests calibrated to consumer needs. The Cycle 019 pattern (the 5 new ADRs) is **consistent with this lineage** — it does not contradict the prior moves.

**But:** the user's lived experience reports that despite this convergent progression, the felt-overwhelm at graduation persists. This is a load-bearing finding. The convergent ADRs have made structural moves (relocation, admissibility tests, form changes) but have not produced a **substrate-and-surface separation** that lets the user read at the resolution they need. Each move has chipped at the surface; none has changed the underlying read pattern from "navigate N artifacts" to "view the corpus at the resolution you need."

**Pattern-synthesis verdict:** The audience-bifurcation lineage is **convergent but incomplete**. Cycle 020's potential contribution is the substrate-and-surface separation that the prior six ADRs have been building toward without naming explicitly.

### 1.6 Threshold answer (reviewer P1-B) — does scaffolded thematic consolidation suffice?

User's existing graduation practice: manual thematic consolidation of ADRs. Reviewer's threshold question: does scaffolding what the user already does satisfy the graduation need, and if so, what specific capability does a substrate mechanism provide that scaffolded thematic consolidation cannot?

**Answer:** Scaffolded thematic consolidation is **necessary but not sufficient** for the user's stated need.

What scaffolded thematic consolidation provides:
- The graduation moment becomes less ad-hoc; the methodology supports the user in doing what they already do.
- Reduces some user labor.

What it does NOT provide:
- **Multi-resolution viewability.** Consolidation produces a flat thematic document; it does not produce overview → drill-in → detail navigation.
- **Audit-substance preservation at the detail level.** Consolidation either keeps detail (no compaction win) or loses detail (audit-substance breaks).
- **Agent-side preservation.** Consolidation is human-facing; agents still need the granular form for context. Without a substrate that serves both, agents lose context when humans consolidate.
- **The "picture" the user named.** Consolidation does not produce the visualizable graph structure the user identified as the "favorite" option in Step 1.4.

**The substrate mechanism's specific capability:** a single source from which both the user-facing surface (compressed thematic view, plain language, viewable at chosen resolution) and the agent-facing substrate (full linked detail, audit-substance preserved, queryable) can be derived. Consolidation cannot do this because it is a one-way human-facing transformation.

**Threshold verdict:** the cycle's research should proceed past consolidation-scaffolding to the substrate question. Loops 2–3 are warranted.

### 1.7 Caveats — kitchen-sink risk for the pattern itself

Per ADR-097's Target 2 (Kitchen-Sink Mechanism vs. Outcome discriminating-criterion), the **Calibration-with-Graduation-Trigger Pattern** itself inherits the same Tier-2 structural limit. The pattern is broad enough that it could absorb many methodology choices retrospectively. Specifically:

- Almost any methodology amendment could be reframed as "calibrating at workflow point X with graduation trigger Y."
- The pattern's diagnostic value depends on whether it produces actionable distinctions at the ADR-drafting moment, not whether it can be retrospectively applied.

**Operational threshold:** the pattern-naming has value only if it (a) reduces the future-cycle ADR-drafting cost (one pattern + one substrate entry vs. one new ADR), (b) helps future cycles recognize when they are extending the pattern vs. proposing a new one, (c) makes the calibration choices visible at the user-facing surface without burying them in substrate detail.

This is a held caveat — Cycle 020's research should examine whether the pattern survives operational test in Loops 2–3, not just structural recognition in Loop 1.

### 1.8 Patch-Switching Criterion verdict (Loop 1 → Loop 2)

**Marginal yield this loop:**
- P1 finding: topology hypothesis confirmed structurally — 5 ADRs apply 1 underlying pattern at 5 workflow points; compression to 1 ADR + 5 substrate entries preserves audit-substance IF substrate is first-class auditable.
- P1 finding: scaffolded thematic consolidation is necessary but not sufficient; substrate mechanism is the load-bearing missing piece.
- P1 finding: audience-bifurcation lineage is convergent but incomplete; Cycle 020's potential contribution is substrate-and-surface separation.
- P2 finding: well-formed ADR topology benchmark sketched (one Big Move + N substrate entries).
- P2 finding: kitchen-sink risk for the pattern itself identified as held caveat.

**Specific question for next loop (Loop 2 substrate lit-review):** What substrate forms have been validated in software engineering literature for separating overview from detail while preserving audit-substance? What plugin-native substrate candidates exist (markdown frontmatter, structured tables, scenarios.md-style blocks, JSON-linked, dual-view auto-generation)? What negative cases (where multi-resolution viewability failed) exist?

**Practitioner expected observation (verbatim, 2026-05-22):**

> Yeah I'm happy to hold the question open because I'm not sure the answer myself. I just had a hypothesis that the agent lens could be a graph because it's dense and provenance rich. That can inform and sit behind a much more human-friendly format. But I am open.

**Reading the response:** A null answer per ADR-096's discrimination test (no specific observation that would change the reading is named). The practitioner's hypothesis is articulated clearly — *dual-layer architecture: graph (dense, provenance-rich) as agent-facing substrate; more human-friendly format as user-facing surface*. This is structurally aligned with Loop 1.3's Option A compression verdict and Loop 1.5's "convergent-but-incomplete" pattern synthesis. The practitioner is open to evidence shifting the candidate substrate form or revealing failure modes.

**Practitioner-hypothesis to test in Loop 2 (recorded as working framing, not pre-committed methodology direction):**
- Agent-facing substrate: graph form (dense, provenance-rich); plugin-native; auditable
- User-facing surface: human-friendly format (multi-resolution viz / plain-language / computed views) derived from or co-existing with the substrate
- Open questions: which graph form (JSON-linked / RDF-style / custom / agent-emergent); which surface form (Mermaid viz / narrative / dashboard); single-source-derivation vs. separate maintenance

## Loop 2: Substrate-and-surface separation (lit-review) — 2026-05-22

**Method:** Dispatched rdd:lit-reviewer; full report at `docs/essays/research-logs/lit-review-020-substrate-and-surface-separation.md`. Synthesis below extracts the load-bearing findings for the cycle's direction.

### 2.1 P1 findings — strongest empirical anchors

**P1 — Lethbridge, Singer, Forward (2003) confirms the user's "no one reads them post-graduation" claim generalizes.** Documentation usage is task-triggered: consulted during active development, then substantially dropped. Low-level design and decision documentation are among the least-consulted types post-build. **The user's lived experience is empirically grounded beyond their projects.** (Garousi & Garousi 2013, 2014 confirm parallel finding on architectural-artifacts utility profile.)

**P1 — Forward & Lethbridge (2002) confirms the user's "good for agent context" observation.** Outdated documentation retains value for historical-rationale queries. The asymmetric value (human dropoff + agent retention) is documented in pre-AI literature; AI agents extend the retention-value tail.

**P1 — Gupta et al. (2026) directly challenges flat-corpus-delivery for LLM consumption.** A recency window of 3–5 prior ADR records is the optimal context for LLM-based ADR tasks; all-history delivery degrades quality relative to windowed delivery. **This is the strongest direct empirical evidence for structured-traversal-over-flat-delivery the cycle has surfaced.** The flat-document corpus form is documented to be worse than windowed delivery for the methodology's primary agent consumer.

**P1 — Volpini et al. (2026) on navigation affordances.** JSON-LD with navigation affordances achieves +29.6% retrieval accuracy over plain text. **The gain mechanism is navigational scaffolding more than schema richness.** This is consequential — it means full JSON-LD ontology is not required; typed-link affordances at the plain-JSON level capture most of the gain.

**P1 — GraphReader (EMNLP 2024) on graph-structured navigation.** Graph-structured navigation outperforms GPT-4-128k on long-context tasks with a 4k window. **Supports agent-emergent graph construction, not a persisted graph database.** The substrate need not be a stored graph artifact; it can be a graph-shape the agent constructs on-demand from plain-text source. (Tradeoff: session-fragility — agent-emergent topology is session-local.)

### 2.2 P2 findings — architectural constraints from negative cases

**P2 — Dual-maintenance staleness is the default outcome of any two-layer system without single-source derivation.** The mitigation is ARCHITECTURAL, not disciplinary. The user's "graph behind human-friendly format" hypothesis MUST be implemented as surface-derived-from-substrate, or it will fail by dual-maintenance regardless of practitioner discipline. **Load-bearing constraint for the cycle.**

**P2 — Comprehensiveness traps (arc42; C4 model).** Both arc42 and C4 are the closest documented architectural analogs to the practitioner's hypothesis, and BOTH exhibit the same failure mode the user reports for ADRs: template-driven comprehensiveness and atomicity-without-overview produce the felt-overwhelm. **The methodology's amendment must avoid replicating the failure modes of its best-documented prior art.**

**P2 — Context-replacement zoom is worse than monolithic viewing.** The architecture must implement *focus+context* (drill-in keeps surrounding context visible), not *replace-context* (drill-in shows only the detail). Cockburn, Karlson, Bederson (2008) document this empirically. **Implication for cycle: multi-resolution surface generation must preserve context at drill-in, not just zoom-and-replace.**

**P2 — Over-confidence in incomplete overviews (Cockburn 2008).** Surfaces must signal their own incompleteness, or readers form over-confident mental models from partial views. **Implication for cycle: the user-facing surface must visibly indicate "this is the overview; substrate has additional detail at [link]" — not silently elide.**

**P2 — Agent-emergent topology is session-fragile.** Trade-off named for GraphReader-style construction. **Implication: provenance-critical relationships (supersedes, motivates) should be declared in the substrate, not inferred per-session.**

### 2.3 Tests against the practitioner's working hypothesis

The hypothesis: *graph (dense, provenance-rich) as agent-facing substrate; human-friendly format as user-facing surface.*

| Hypothesis claim | Lit-review verdict |
|---|---|
| Graph form is dense and provenance-rich | **Supported** — Volpini 2026 (+29.6%); de Boer 2024 (Architecture Knowledge Graphs at ~100-ADR scale) |
| Graph form is auditable | **Supported** — JSON-LD with typed edges provides verifiable provenance chains; full RDF infrastructure not required |
| Plugin-native (no external dependencies) | **Supported with qualification** — plain-JSON with typed links is plugin-native; full JSON-LD ontology is borderline (libraries exist but add weight); RDF/SPARQL stack is NOT plugin-native |
| Human-friendly format derived from substrate | **Supported with load-bearing constraint** — derivation is architecturally required, not optional, to avoid dual-maintenance staleness |
| Multi-resolution viewability via the surface | **Supported with architecture qualification** — Shneiderman 1996 is foundational; Cockburn 2008 requires focus+context not replace-context; no direct empirical study on documentation-corpus navigation specifically (analogical transfer from HCI interface tasks) |

**Hypothesis verdict:** Supported with material qualifications. The graph-substrate + derived-surface architecture is empirically grounded; the implementation choices (which JSON form; which surface generation) need design decisions but the structural shape is validated.

### 2.4 Loop 5 spike-target revision (watch-item from research-design-review-020.md)

**Original Loop 5 spike target:** Prototype a JSON-linked representation of the Cycle 019 ADRs + Essay-Outline 018; test whether user-facing surface and agent-facing substrate can be derived from the same source.

**Revised spike target (per lit-review recommendation):**

Prototype a **plain-JSON structured-record format with typed links** for the Cycle 019 5-ADR-to-1-ADR-plus-substrate compression case:
- Typed links: `supersedes`, `implements`, `motivates`, `applies-pattern` (subset of the JSON-LD relationship vocabulary — not the full ontology)
- Derived `summary` field per record (for surface generation)
- Single-source-derivation: the user-facing surface (compressed thematic view) is generated from the substrate; not maintained in parallel
- Focus+context surface generation (per Cockburn 2008): drill-in keeps surrounding context
- Surface signals its own incompleteness (per Cockburn 2008)
- Test the C4-model-analog viewing pattern: substrate → multiple computed views at different resolutions

**Out of scope for the spike:** full JSON-LD ontology; RDF/SPARQL; agent-emergent topology construction (session-fragility risk for provenance-critical relationships).

**YAML frontmatter is the fallback** if the typed-link JSON schema proves too complex in practice.

### 2.5 What changed about the cycle's direction

Loop 2 evidence narrows the design space:
1. **Substrate form**: plain-JSON with typed links is the recommended candidate. Not full JSON-LD; not RDF; not pure markdown frontmatter (which loses typed-link semantics); not agent-emergent (session-fragile).
2. **Surface form**: derived-from-substrate is architecturally required, not optional. Multi-resolution surface with focus+context (not replace-context). Surface signals incompleteness.
3. **The cycle's potential amendment** is now sketchable in concrete form: **substrate-and-surface separation as a methodology-level architectural commitment**, with the substrate being plain-JSON typed-link records and the surface being computed views (multiple resolutions; focus+context preserved).

### 2.6 Patch-Switching Criterion verdict (Loop 2 → Loop 3 decision)

**Marginal yield this loop:** Very high.
- 5 P1 findings (Lethbridge confirms read-rate-decay; Forward & Lethbridge confirms agent-retention asymmetry; Gupta 2026 challenges flat-corpus-delivery for LLMs; Volpini 2026 on navigation-affordance gain; GraphReader on graph-navigation-outperforming-long-context).
- 5 P2 findings (dual-maintenance constraint; comprehensiveness-trap warning; focus+context not replace-context; signal-incompleteness; session-fragility tradeoff).
- Spike target sharpened to a concrete prototype with typed-link schema vocabulary.
- Practitioner's hypothesis tested and supported with material qualifications (architecture matters; implementation-form choices need decisions).

**Specific question for next loop (Loop 3 — why graduation specifically?):** What is graduation's structural character that makes it the felt-pain anchor (vs. mid-cycle)? Brooks' onboarding cost; cognitive load at synthesis moments; "holistic-vs-task-triggered" reading patterns at the moment task-driven affordances are absent.

**Practitioner expected observation (next loop) — to elicit:** What would change the reading is evidence that graduation-pain is NOT structurally unique (i.e., the felt-pain occurs equally at mid-cycle moments and "graduation" is just where it's named) — that would shift the cycle from a graduation-scoped amendment to a methodology-wide one.

**Recommendation: CONTINUE-this-patch → switch to Loop 3.** Loop 2 left one named question (graduation-pain's structural character) that has direct literature paths. Loop 3 is scoped (Brooks + cognitive-load-at-synthesis + holistic-vs-task-triggered reading) and bounded (one targeted lit-review).

**Alternative considered: SWITCH-to-synthesis (Essay-Outline production).** Rejected because Loop 3's question is consequential for the amendment's scoping (cycle-wide vs. graduation-scoped). Without Loop 3, the Essay-Outline would have to scope-qualify the amendment's reach — preferable to scope correctly from evidence.

## Loop 3: Graduation-pain structural character (lit-review) — 2026-05-22

**Method:** Dispatched rdd:lit-reviewer; narrowly scoped to four questions Loop 2 left open. Full report at `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md`.

### 3.1 The verdict (lit-review's central finding)

> **Graduation-pain is not structurally unique — it is the most acute case of a methodology-wide pattern.**

The structural mechanism is **Sweller's element interactivity** (1988, 2010): high element interactivity requires simultaneous processing of cross-referential corpus elements that cannot be understood in isolation. The mechanism operates at every holistic-synthesis moment: mid-cycle gate reviews; architectural evaluation sessions (Rukmono et al. 2025); entry-moment onboarding (Dagenais et al. 2010; Steinmacher et al. 2015); methodology graduation. **The differentiator across these moments is corpus scope, not mechanism type.** Graduation has the widest simultaneous corpus access; mid-cycle moments are bounded to artifacts relevant to a current decision. **Quantitative difference, not categorical.**

**SCOPE QUALIFICATION:** No direct empirical study compares mid-cycle gate-review friction to graduation overwhelm. Rukmono et al. (2025) find shared structural drivers across architectural-explanation contexts without reporting cost differences. The "most acute case" claim rests on corpus-scope logic, not direct measurement.

### 3.2 P1 findings supporting the verdict

**P1 — Chandler & Sweller (1992) Experiment 2 directly explains the user's gate-conversation friction.** Mutually-referring separated text segments incur a documented split-attention penalty. The user's example ("invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing") involves at minimum three interacting elements that must be simultaneously resolved — a high-interactivity reading condition at every gate moment, not only at graduation. **The friction is empirically documented as a cognitive-load failure mode of cross-referential vocabulary, not as a methodology choice.**

**P1 — Shneiderman 1996 + Tufte 1983/1990 identify the structural remedy.** Overview-first navigation that **co-locates cross-references with context rather than requiring cold identifier lookup.** The user's "graph + multi-resolution viz" hypothesis is structurally aligned with this remedy direction. The substrate-and-surface architecture should co-locate context with cross-references at the surface layer (not require the reader to mentally resolve identifier references).

**P1 — Sweller's element interactivity + van Merriënboer & Kester (2008) "pre-cached structural map".** A pre-cached structural map (overview scaffold) reduces synthesis-moment load. **The methodology's user-facing surface should serve as a pre-cached structural map** — the reader arrives with the overview already loaded; specific element lookups become focus+context drill-ins rather than cold reads.

**P1 — Dagenais et al. (2010) on newcomer documentation needs.** Newcomers need an overview-before-detail landscape map; task-triggered consultation is the lower-cost mode. This generalizes to ANY moment of holistic engagement (graduation; mid-cycle gates with cross-references; architectural review). **The overview-first pattern is the empirically-supported intervention for every high-element-interactivity reading moment, not graduation-specific.**

### 3.3 Implication for amendment scope

**Methodology-wide.** A graduation-scoped amendment would leave mid-cycle gate-review friction unresolved. The substrate architecture must operate across the whole lifecycle to address element-interactivity wherever it fires.

The graduation moment may warrant an additive operational procedure (thematic consolidation scaffolding, per Loop 1.6 threshold answer), but the **architectural commitment is methodology-wide**.

### 3.4 What's left? Loop 4 + Loop 5 decisions

**Loop 4 (cross-cycle topology) — SKIP.** Loop 1 already produced strong topology findings on Cycle 019's 5 ADRs (the structural compression pattern). Cross-cycle topology would add breadth but is the same pattern across more samples. The amendment-scope is now empirically grounded as methodology-wide, so cross-cycle topology evidence is not load-bearing for the central argument. **Decision: not warranted.**

**Loop 5 (substrate spike) — RUN.** Per ADR-087 Validation-Spike Decision: the cycle is at risk of producing a structural commitment (substrate-and-surface separation as methodology-wide architecture) that DECIDE / ARCHITECT / BUILD will need to operationalize. A tightly-scoped spike that prototypes the typed-link JSON substrate on the Cycle 019 5-ADR sample, demonstrates audit-substance preservation through derivation, and tests focus+context surface generation **moves validation earlier** (per the user's telos: "no thinking required at BUILD" → empirical grounding at RESEARCH). The lit-review evidence supports the substrate form abstractly; the spike demonstrates it concretely on the methodology's actual corpus.

**Decision: run Loop 5 spike before synthesis.**

### 3.5 Patch-Switching Criterion verdict (Loop 3 → Loop 5)

**Marginal yield this loop:** High.
- 4 P1 findings (Chandler & Sweller split-attention as documented friction mechanism; Shneiderman + Tufte as remedy direction; pre-cached structural map per van Merriënboer & Kester; Dagenais overview-before-detail generalization).
- Verdict on amendment scope (methodology-wide) with empirical evidence.
- Loop 4 / Loop 5 decisions resolved.

**Specific question for next loop (Loop 5 spike):** Can plain-JSON typed-link substrate + derived surface preserve audit-substance + support focus+context multi-resolution viewing on the Cycle 019 5-ADR sample? What failure modes emerge during prototyping?

**Practitioner expected observation (next loop) — to elicit at Loop 5 close:** What would change the reading is evidence that (a) typed-link schema cannot preserve audit-substance through derivation (would require schema redesign or alternative substrate form), (b) focus+context surface generation has implementation problems that change the design space, (c) the 5-ADR sample is uniquely well-suited to the substrate form and a different cycle's ADRs would fail (would force scope-qualification).

**Recommendation: CONTINUE-this-patch → switch to Loop 5 (spike).** Loop 3 closed the amendment-scope question with strong evidence. Loop 5 is the empirical-validation step before synthesis.

## Loop 5: Substrate-and-surface spike — 2026-05-22

**Method:** Dispatched rdd:spike-runner; prototype built and demolished per ADR-087 + spike-rules. Full report at `docs/essays/research-logs/spike-020-substrate-surface-prototype.md`. Scratch directory deleted post-spike (the spike-runner ran into a session limit at the cleanup step; the orchestrator completed `rm -rf ./scratch/spike-020-substrate-surface/` afterward — recorded for audit trail).

### 5.1 Spike question and what was built

**Question:** Can a plain-JSON typed-link substrate + derived computed surface preserve audit-substance + support focus+context multi-resolution viewing on the Cycle 019 5-ADR sample?

**Built:** `substrate.json` (6 records — Pattern + 5 ADRs) with typed links + audit-substance blocks; `derive_surface.py` (Python; pure stdlib) generating 7 Markdown surface files (1 overview, 6 drill-ins). 5-ADR source = 546 lines; substrate = 268 lines (49% compression); surface = 535 lines with navigation affordances the source does not provide.

### 5.2 The architecture is supported (core finding)

The substrate-and-surface separation **works for the overview + drill-in navigation problem.** Single-source derivation; no parallel hand-maintained content; surface readable; multi-resolution gain real (overview is materially easier to skim than flat 5-ADR directory listing). Plain-JSON is plugin-native; no external dependencies; no graph database. **The practitioner's working hypothesis is supported by empirical demonstration on the cycle's actual sample.**

### 5.3 But: the spike surfaced six design constraints that the methodology amendment must address

These are NOT design-changing in the sense of invalidating the architecture; they are design constraints that DECIDE / ARCHITECT must encode in any methodology amendment that commits the architecture.

**Constraint 1 — Schema must be extensible, not fixed.** Starting 4 typed-link types covered roughly half the relationships the 5 ADRs needed. 6 new types surfaced during authoring (`applied-by`, `parallel-to`, `shares-structural-limit-with`, `continues-discussion-of`, `cross-project-evidence`, `references`). Any pre-committed schema under-covers the corpus. Amendment must specify discipline (typed links + note text required) rather than fixed type vocabulary.

**Constraint 2 — Per-type record schemas, not universal.** The five-field audit-substance block (commitment / warrants / rejected-alternatives / graduation-trigger / provenance) fit ADRs but stretched uncomfortably for the Pattern record. Forcing universal shape produces arc42-style comprehensiveness trap (Loop 2 Q5). Amendment must specify per-type schemas (Pattern, ADR, Invariant, Vocabulary-term, Scenario each have different minimal field sets).

**Constraint 3 — Compression-loss at sub-argument level is real.** The flat schema lost ADR-094's signal-evaluation step (mechanism specification, no field for it), ADR-097's Target 2/Target 3 sub-decisions (compressed into top-level commitment), ADR-098's reflexive-application argument (placed in warrants but structurally distinct from empirical warrants). **Lossy compression at the sub-argument level.** Amendment must either (a) allow nested fields for sub-substance, OR (b) accept substrate is a compressed index, not faithful encoding.

**Constraint 4 — Authority question must be resolved explicitly.** Substrate canonical (ADRs derived) preserves single-source-of-truth strictly but forces structured-record authoring instead of prose. Source ADRs canonical (substrate derived) preserves prose authoring but requires interpretive maintenance — and that maintenance is translation, not mechanical extraction. **Amendment must name the authority direction; it cannot be defaulted.**

**Constraint 5 — Note discipline is required, not optional.** Cross-reference resolution depends on every non-trivial link having note text. Absence is silent failure — the link type alone (`references`) does not carry semantic payload. Amendment must specify note-required discipline; schema validation must fail records with untyped or unnotated links.

**Constraint 6 — Substrate-maintenance overhead must be accounted for, not assumed free.** The spike authoring at 5 ADRs is tractable; at ~100 ADRs (full RDD corpus) the maintenance cost is substantial. Amendment must include the substrate-authoring workflow as part of the methodology toolchain, not as a one-off transformation.

### 5.4 Specific spike-surfaced finding the lit-review did not predict

**Sub-argument structure within Decision sections** is first-class content the flat schema cannot hold. ADR-097's Target 2 + Target 3 are sub-decisions with their own commitment-and-rationale shapes; the substrate flattened them into the top-level commitment, losing their independent status. This is a methodology-internal finding — the lit-review's evidence on schema design (Volpini 2026; GraphReader 2024) did not predict this because their corpora (general ADR examples) did not have the rich sub-decision structure that Cycle 019's reflexive-methodology ADRs have. **The methodology's own corpus is more complex than the literature anticipates.**

### 5.5 What the spike did NOT change

- The architecture itself: substrate (plain-JSON typed-link records) + surface (derived computed views) is empirically supported on the cycle's actual sample.
- The amendment-scope conclusion: methodology-wide (per Loop 3). The spike did not produce evidence to narrow this.
- The dual-maintenance staleness constraint (Loop 2): single-source derivation is architecturally required; the spike demonstrated it works.
- The focus+context requirement (Loop 2, Cockburn 2008): the "Surrounding records" footer pattern operationalized it.

### 5.6 Patch-Switching Criterion verdict (Loop 5 → synthesis)

**Marginal yield this loop:** High and empirically grounded.
- 1 P1 finding: architecture supported by demonstration on cycle's actual sample.
- 6 P1 design constraints surfaced (extensible schema; per-type records; sub-argument compression-loss; authority resolution; note discipline; maintenance overhead).
- 1 spike-internal finding the lit-review did not predict (sub-argument structure complexity).
- No design-changing failures (failures that would invalidate the architecture).

**Specific question for next phase (Essay-Outline production):** none for additional research loops. The cycle has sufficient evidence to synthesize. The six design constraints become Essay-Outline content the methodology amendment must address; they are not open research questions.

**Practitioner expected observation (post-synthesis):** the Essay-Outline's central argument (substrate-and-surface separation as methodology-wide architectural commitment) will be evaluated at the epistemic gate. What would change the reading at the gate is the user identifying a constraint the spike missed or a scope-of-claim the cycle has not honored.

**Recommendation: SWITCH-to-synthesis (Essay-Outline production).** The cycle's research loops have produced:
- Loop 1: topology hypothesis confirmed structurally (5 ADRs apply 1 Calibration-with-Graduation-Trigger Pattern at 5 workflow points; compression preserves audit-substance IF substrate is auditable).
- Loop 2: substrate-and-surface architecture empirically grounded (Volpini 2026; GraphReader 2024); 5 architectural constraints from negative cases (dual-maintenance; comprehensiveness traps; focus+context; signal-incompleteness; session-fragility).
- Loop 3: amendment scope is methodology-wide (Sweller element interactivity; Chandler & Sweller split-attention; Shneiderman + Tufte as remedy direction).
- Loop 5: architecture supported by demonstration on cycle sample; 6 design constraints DECIDE / ARCHITECT must address.

Continuing research would produce diminishing returns. The remaining work is composition: synthesizing the four loops + design constraints into an Essay-Outline that argues for the methodology-wide substrate-and-surface separation while honoring the constraints the spike surfaced.

**Decision: enter Step 4 (Essay-Outline production).**

## Grounding loops 4 + 4b (post-gate, per susceptibility snapshot recommendation) — 2026-05-23

The susceptibility snapshot at the research → discover boundary (`.rdd/audits/susceptibility-snapshot-020-research.md`) returned a moderate framing-adoption signal naming two specific grounding actions. The practitioner endorsed pursuing grounding before advancing (gate response 2026-05-23). Two tight in-context analyses:

### Loop 4 — Cross-cycle topology examination

**Question:** Does the Cycle 019 5-ADR-pattern-clustering (5 ADRs applying 1 underlying Calibration-with-Graduation-Trigger Pattern at 5 workflow points) recur in other cycles' ADR sets, or is it anomalous?

**Method:** Direct read of Cycle 018 (3 ADRs: 091–093) and Cycle 017 (11 ADRs: 080–090) ADR sets, examining for the same workflow-point + calibration-mechanism + tier + audit-bearing-artifact + graduation-trigger clustering.

**Cycle 018 examination (3 ADRs):**
- ADR-091 dual-mode BUILD — workflow point: BUILD entry; mechanism: mode declaration in cycle-status; tier: methodology-vocabulary.
- ADR-092 Essay-Outline as RESEARCH artifact — workflow point: RESEARCH artifact production; mechanism: structural decomposition (4 sections); tier: Skill-Structure.
- ADR-093 argument-auditor graph traversal — workflow point: argument-audit dispatch; mechanism: graph-traversal verification; tier: Skill-Structure.

**Verdict on Cycle 018:** The three ADRs operate at DIFFERENT layer concerns (BUILD entry / RESEARCH artifact / audit dispatch) with DIFFERENT mechanisms (mode declaration / structural decomposition / boundary verification). Any unifying pattern would be at "methodology workflow improvement" abstraction — broad enough to absorb everything. **Cycle 018 does not exhibit the Cycle 019 clustering.**

**Cycle 017 examination (11 ADRs):**
- ADRs 080–081: scope-adaptive enforcement + grandfathered migration (paired structural commitment for adopting new structural commitments).
- ADR-082: question-isolation protocol (RESEARCH entry mechanism).
- ADR-083: cognitive economy criterion (human-facing artifact admissibility) — **calibration pattern**.
- ADR-084: agent context content placement (placement patterns).
- ADR-085: infrastructure relocation (filesystem-level).
- ADR-086: AI-as-orienter NON-adoption (explicit rejection).
- ADR-087: validation-spikes in research (RESEARCH method addition).
- ADRs 088–089: corrective amendments to prior ADRs (064, 067 — meta-amendments).
- ADR-090: in-progress phase role shift (cycle-status format change).

**Verdict on Cycle 017:** Heterogeneous ADR set. SOME ADRs apply calibration patterns (083 most clearly); most do other things (paired commitments, protocols, placement, rejection, method addition, corrective amendments, format changes). **Cycle 017 does not exhibit the Cycle 019 clustering.**

**Loop 4 finding:** Cycle 019's 5-ADR-cluster-applying-one-pattern is **anomalous, not characteristic**. The Calibration-with-Graduation-Trigger Pattern itself exists at the methodology-level (083 in Cycle 017; 091 in Cycle 018; 094–098 in Cycle 019 all apply variants), but the multi-ADR clustering AT the same level applying the SAME pattern at multiple workflow points is unusual.

**Implication for the cycle's commitment:**
- C1 (within-cycle topology) stands — Loop 1 demonstrated the Cycle 019 clustering directly.
- C2 (methodology-wide via Sweller) stands — supported by literature, not cross-cycle topology evidence.
- C3 (substrate-and-surface as methodology-wide architectural commitment) requires more nuance. The cross-cycle topology evidence does NOT support the implicit claim that 5-ADR-clustering is a recurring pattern the methodology must address. Cycle 019 may have surfaced a specific structural artifact of methodology-reflexive cycles (cycles investigating the methodology itself); other cycles produce more heterogeneous ADR sets that the substrate-and-surface architecture would still benefit but with less acute need.
- **This finding strengthens the F-P1 alternative reading**: the prior six ADRs (064, 083, 084, 085, 092, 095) were COMPLETE answers to different problems. Cycle 019 happened to consolidate around one pattern (which the substrate-and-surface architecture addresses); other cycles addressed different problems with their ADRs. Cycle 020's amendment is a NEW architectural move addressing a problem Cycle 019 acutely surfaced, not a completion of a prior trajectory.

### Loop 4b — Gate-conversation-tooling alternative analysis

**Question:** Can gate-conversation-tooling improvements (auto-resolve identifier references; inline excerpts at gate prompts; better cross-reference rendering) address the gate-conversation-friction the cycle is framed around, without requiring substrate-and-surface architectural commitment?

**Method:** Sketch what improved gate-prompt rendering would look like on the user's specific friction example.

**The user's example:** *"invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing — what would you need to believe for the converse to be true?"*

**Improved gate-prompt rendering (Tier-2 conversational tooling):** the orchestrator's gate-prompt-construction layer auto-resolves identifier references inline:

> *"Invariant 9 (the methodology must support per-cycle and per-layer calibration with empirical grounding as load-bearing filter) together with ADR-014 §C.4 (Worth-the-Calories Quality Gate's cost-benefit analysis at decision moments) implies the NL constraint is load-bearing — what would you need to believe for the converse to be true?"*

This is achievable at the skill-text + orchestrator-rendering level. Plugin-native; no architectural change required. Addresses the **specific** gate-friction example.

**Does it satisfy ALL the user's stated needs?**

| User-stated need | Gate-tooling addresses? |
|---|---|
| Make RDD user-friendly at gates | **YES** (specifically reduces split-attention per Chandler & Sweller 1992) |
| Still enabling for agentic flows | YES (agent context unchanged) |
| Multi-resolution viewability (user's "favorite" feature per Step 1.4) | **NO** (gate-tooling doesn't produce overview → drill-in navigation) |
| Graduation-phase consolidation (user's lived pain anchor per Step 1.2) | **NO** (gate-tooling doesn't address graduation moment) |
| Agent-corpus-consumption optimization (Gupta 2026 recency-window) | **NO** (gate-tooling doesn't change how agents traverse the corpus) |

**Loop 4b finding:** Gate-conversation-tooling is **necessary but not sufficient**. It addresses the gate-friction specifically and well; it does NOT address multi-resolution viewing, graduation consolidation, or agent-corpus-consumption optimization. Both gate-tooling AND substrate-and-surface separation are warranted — they are **complementary**, not competing.

**Implication for the cycle's commitment:**
- F-P2's user response ("skip was warranted — broader architectural amendment is right scope") was based on the agent's framing of "architectural amendment vs. localized tooling." The grounding investigation reveals: the two are COMPLEMENTARY. Gate-tooling should ship as part of the methodology amendment; substrate-and-surface separation is still needed for the broader needs.
- The cycle's central commitment (C3) is **refined**, not invalidated: substrate-and-surface separation + complementary gate-conversation-tooling improvements as a joint methodology amendment.

### Combined implication for Essay-Outline revisions

1. **C3 refinement:** acknowledge gate-conversation-tooling as a complementary commitment, not absent from the amendment.
2. **C5 acknowledgment:** the cross-cycle topology evidence strengthens the F-P1 alternative reading; the convergent-vs-alternative-reading remains held open at DECIDE, but the alternative reading now has stronger empirical support.
3. **Section 9 META:** add Loop 4 and Loop 4b findings as feed-forward signals to DISCOVER + DECIDE.
4. **C7 caveat:** the cross-cycle topology evidence specifically strengthens the kitchen-sink risk; the pattern's diagnostic value at the topology level (within-cycle compression) is supported, but the pattern's recurrence at the cross-cycle level is not.

Re-audit will be mandatory after these revisions per the re-audit-after-revision rule.




**Recommendation:** **CONTINUE-this-patch → SWITCH-to-Loop-2.** Loop 1 has produced strong structural findings that compression is possible and consolidation-only is insufficient. The next-loop question (substrate forms; plugin-native candidates; negative cases) is well-formed and has direct literature paths. Switching to Loop 2 (substrate lit-review) is indicated.


### User reframing at plan-presentation moment (verbatim)

> I'll clarify -- I've used RDD repeatedly in a work context and often I let RDD corpuses stay in the codebase. I attempt to graduate them by removing the artifact trail and consolidating ADRs thematically where possible. But overall I think they lose value being so fine grained. No one reads them. They're good for agent context which is important. Documentation questions are hard to answer - who's the audience when? We've attempted to address that in several ways here but just trying to flag my frustrations with the amount of information the user is given throughout RDD. RDD is about understanding -- I think we're somewhat successful building good solutions with RDD. The question here is how to make it user-friendly and also still enabling for agentic flows.

### What this reframes

The cycle's question, as the user has now sharpened it:

> *How can the methodology be user-friendly AND still enabling for agentic flows — at the same time, on the same corpus, without forcing the user to read what only the agent benefits from?*

This is the **audience-bifurcation question** in plain language. It is structurally wider than "topology + compaction" but the original sub-questions remain inside it: topology compression and substrate-for-detail are now framed as two moves the methodology might make to serve the bifurcation, not ends in themselves.

### Load-bearing user-evidence the cycle should treat as primary data

1. **Existing user-practice:** thematic consolidation of ADRs at graduation. The user has done this in real work contexts. The methodology does not currently scaffold it. Why does the user reach for thematic consolidation? What does it preserve? What does it lose? This is empirical evidence that exists *in the user's practice* but not yet *in the methodology*.
2. **"No one reads them" post-graduation.** Fine-grained ADRs have bifurcated consumers: agents continue, humans stop. If true at the scale the user reports, the audit-substance defense of fine ADRs is delivering value to one audience only. The literature on documentation read-rate decay and post-handoff consumption should be able to triangulate this claim.
3. **Partial-answer pattern across prior ADRs.** ADR-064 (centered-vs-infrastructure framing), ADR-083 (cognitive economy human-facing), ADR-084 (agent context placement), ADR-085 (rdd infrastructure relocation), ADR-092 (essay-outline form), ADR-095 (agent outcome test) all chip at the audience question. The user is reporting that frustration persists despite these moves. The cycle should examine the pattern: are the partial answers converging on something the methodology has not yet named, or pulling in different directions?

### Revised loops

**Loop 1 — Topology examination + graduation-practice as evidence (direct corpus analysis).**

Two empirical objects:
- The 5 Cycle 019 ADRs (094–098) and Essay-Outline 018. Can they compress thematically without losing audit-substance?
- The user's described graduation practice (thematic consolidation). What does it preserve? What does it lose? Can the methodology scaffold it?

Both empirical objects together test whether the topology hypothesis holds and what thematic consolidation actually looks like as a move.

Method: direct read + analysis. No subagent dispatch.

**Loop 2 — Agent-readable substrate vs. human-readable surface (lit-review).**

Sharpened from prior framing. The substrate-question becomes: what literature speaks to bifurcating documentation by audience — where one form (e.g., fine-grained, machine-navigable) serves agents and a different form (e.g., compressed, plain-language, human-readable) serves humans? Candidates:

- Literate programming and computed documentation (Knuth lineage; auto-generated docs from structured sources)
- Dual-view / dual-channel systems (developer-facing vs. operator-facing docs in DevOps; spec-vs-marketing-doc distinction)
- Knowledge graphs for design intent (KG candidate from user)
- Fitness functions / executable architecture (Ford et al.)
- RAG-over-corpus + human-summary pattern (recent agent-tooling literature)
- ADR-as-code / architecture comment systems

Method: dispatch lit-reviewer.

**Loop 3 — Why graduation specifically? Post-handoff read-rate decay (lit-review).**

Anchored in user's empirical claim ("no one reads them" post-graduation). Lit-review on:
- Documentation read-rate decay over time
- Onboarding load for accumulated decision records
- Knowledge transfer cost at handoff (Brooks; Bacchelli & Bird 2013 — already in corpus)
- Why holistic synthesis costs more than incremental consumption (cognitive load at synthesis moments; Bilalic et al. 2008 — already in corpus)
- Whether "no one reads them" generalizes or is project-specific

Method: dispatch lit-reviewer.

**Loop 4 (optional) — Cross-cycle topology examination.**

If Loop 1 surfaces a clear topology pattern in Cycle 019's 5 ADRs, examine whether the pattern holds across prior cycles (Cycle 017's ADRs, Cycle 018's ADRs). Is "5 middle-of-the-road ADRs" a Cycle 019 anomaly or a recurring pattern that signals a methodology-level granularity calibration issue?

Method: direct corpus analysis.

**Loop 5 (optional) — Substrate spike on a candidate plugin-native representation.**

User has rejected plexus as exploratory baseline and proposed a specific direction:

> "I'm not sure plexus would be a good baseline. I'd be more interested in a json linked list sort of approach. Something any agent could parse."

This is recorded as a **candidate substrate direction**, not adopted as the methodology answer. Per ADR-082 bracketing discipline, the JSON-linked-list candidate is research input that Loop 2 examines alongside other plugin-native candidates (markdown frontmatter with structured fields, computed-view auto-generation, dual-view rendering, agent-emergent-in-context graph constructions). Loop 2's lit-review evidence determines whether JSON-linked is the right candidate or one of several.

**If a spike survives Loop 1–3 evidence**, the spike question becomes:

> *"Prototype a JSON-linked representation of the Cycle 019 ADRs (094–098) + Essay-Outline 018. Test whether (a) the user-facing surface (compressed thematic view) and (b) the agent-facing substrate (full linked detail) can both be derived from the same source — preserving audit-substance, reducing user-facing corpus weight, and maintaining agent capability."*

This is a substantive test of the audience-bifurcation move at corpus scale.

Method: spike-runner, plugin-native tools only (no external MCP/database). Plexus is not used.

### Cross-cutting constraint (user-imposed)

**RDD is a public-facing plugin.** Any structural mechanism the cycle proposes must be implementable with no MCP / external-database dependencies. Plexus (and any similar tool) may be used in research as exploration but cannot appear in the methodology spec as required infrastructure. The compaction substrate, if one is proposed, must be plugin-native: markdown conventions, structured frontmatter, agent-constructed-from-corpus, or comparable. This constraint feeds into Loop 2 (substrate lit-review should weight plugin-native implementations) and Loop 5 (plexus is exploratory only).

### Patch-switching posture

The expanded cycle has five potential loops. Patch-switching is invoked at each loop end. Pre-commitment: no more than three loops in the first pass; expansion only on signal. Loop 1 alone may resolve the topology sub-question and supply enough graduation-practice evidence to advance to Loop 2. Loop 2 is the central lit-review patch. Loop 3 is empirical-grounding for the user-evidence claim. Loops 4–5 are explicitly conditional.


