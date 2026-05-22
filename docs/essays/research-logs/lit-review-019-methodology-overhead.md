## Literature Review: Where in RDD's Process, If Anywhere, Does Elaboration Accumulate Beyond What Practitioners Find Valuable — and What Mechanism Best Accounts for It?

**Date:** 2026-05-15
**Cycle:** 019 — Does RDD Over-Engineer?
**Method:** Systematic literature search across five investigation branches (A–E) calibrated by Loop 1 C3 pre-pass gaps
**Practitioner referent (B1 specification):** Primary — the cycle's user as solo developer-researcher. Secondary — practitioners of comparable specification-intensive or artifact-intensive methodologies (XP, BDD, spec-driven development, BMAD), used as proxy population where literature does not address single-practitioner contexts. Tertiary — RDD practitioners as a population (cardinality one; treated cautiously).
**Scope exclusions per Loop 1:** Branch C's deep-work-tool framing (Reflection 005 — strongly covered); human-facing artifact admissibility (ADR-083 — strongly covered). These topics appear only if literature surfaces findings that update the prior partial answers.

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Fowler, M. | *Refactoring: Improving the Design of Existing Code* (speculative generality; YAGNI bliki) | 1999 / 2015 | Addison-Wesley; martinfowler.com | Branch A — upfront design cost taxonomy |
| 2 | Beck, K. | *Extreme Programming Explained: Embrace Change* | 1999 | Addison-Wesley | Branch A — cost-of-change curve; YAGNI origins |
| 3 | Boehm, B. | *Software Engineering Economics* (defect cost-by-phase) | 1981 | Prentice-Hall | Branch A — upfront design argument; empirical critique |
| 4 | Boehm, B. & Basili, V. | "Software Defect Reduction Top 10 List" | 2001 | IEEE Computer | Branch A — inspection vs. design phase cost |
| 5 | Bossavit, L. | *The Leprechauns of Software Engineering* | 2012 | Self-published / leanpub | Branch A — critique of Boehm's empirical basis |
| 6 | Cockburn, A. | *Agile Software Development: The Cooperative Game* | 2004 | Addison-Wesley | Branch A — Crystal methodology-fit; barely sufficient methodology |
| 7 | Standish Group | *CHAOS Report* (feature usage statistics) | 2002–2015 | Standish Group | Branch A — 45% features rarely/never used finding |
| 8 | Fagan, M.E. | "Design and Code Inspections to Reduce Errors in Program Development" | 1976 | IBM Systems Journal | Branch B — inspection cost-effectiveness baseline |
| 9 | Bacchelli, A. & Bird, C. | "Expectations, Outcomes, and Challenges of Modern Code Review" | 2013 | ICSE | Branch B — code review outcomes; what review actually delivers |
| 10 | SmartBear Software | "11 Best Practices for Peer Code Review" (2500-review study) | 2011 | SmartBear white paper | Branch B — optimal review size; attention-degradation thresholds |
| 11 | Jureczko, M. et al. | "Code Review Effectiveness: An Empirical Study on Selected Factors" | 2020 | IET Software | Branch B — review factors and quality outcomes |
| 12 | Madej, A. et al. | *Self-Refine: Iterative Refinement with Self-Feedback for LLMs* | 2023 | NeurIPS | Branch B — LLM self-correction; diminishing returns structure |
| 13 | Liu, Y. et al. | "When Can LLMs Actually Correct Their Own Mistakes?" | 2024 | TACL | Branch B — LLM self-correction limits; over-refinement failure mode |
| 14 | Zheng, L. et al. (MT-Bench / Chatbot Arena team) | LLM-as-a-Judge reliability and ensemble approaches | 2024 | arXiv / ACL | Branch B — LLM-as-judge cost-reliability frontier |
| 15 | Cross, N. | *Design Thinking: Understanding How Designers Think and Work* | 2011 | Berg | Branch D — satisficing; co-evolution of problem/solution space |
| 16 | Goel, V. & Pirolli, P. | "The Structure of Design Problem Spaces" | 1992 | Cognitive Science, 16(3) | Branch D — design problem phases; expert vs. novice |
| 17 | Pirolli, P. & Card, S. | "Information Foraging" | 1999 | Psychological Review | Branch D — cost-benefit patch selection; information scent |
| 18 | Simon, H.A. | *The Sciences of the Artificial* (3rd ed.) | 1996 | MIT Press | Branch D — satisficing; design as ill-structured problem |
| 19 | Lawson, B. | *How Designers Think* (4th ed.) | 2006 | Architectural Press | Branch D — expert/novice design exploration; problem framing |
| 20 | Gero, J.S. & Kan, J.W.T. | "Fixation and Commitment While Designing" | 2011 | Journal of Creative Behavior | Branch D — design fixation; premature commitment |
| 21 | Zanker et al. | "Fixation on Premature Concept Choices: A Pitfall of Early Prototyping?" | 2019 | Procedia CIRP | Branch D — early design commitment risk |
| 22 | Thoughtworks | "Spec-Driven Development: Unpacking One of 2025's Key Engineering Practices" (Tech Radar Vol. 33) | 2025 | Thoughtworks Technology Radar | Branches A, E — SDD critique; bias toward heavy upfront specification |
| 23 | Osmani, A. | *Beyond Vibe Coding: From Coder to AI-Era Developer* | 2025 | O'Reilly | Branches A, E — structured vs. unstructured AI development |
| 24 | Redmonk / Stephens, R. | "Vibe Coding vs. Spec-Driven Development" | 2025 | Redmonk blog | Branch A — comparative methodology framing |
| 25 | Paulsen, N. et al. | Context window effective performance research ("MECW") | 2025 | Emergent literature | Branch E — effective context vs. advertised context |
| 26 | Anthropic Engineering | "Effective Context Engineering for AI Agents" | 2025 | anthropic.com/engineering | Branch E — structured vs. narrative context for agents |
| 27 | Strengholt, P. / Adolfi.dev | LLM-generated ADR effectiveness studies | 2024–2025 | Medium / blog | Branch E — ADR consumption by AI agents |
| 28 | arXiv:2604.03826 | "Context Matters: Evaluating Context Strategies for Automated ADR Generation Using LLMs" | 2026 | arXiv | Branch E — context strategies for ADR-consuming agents |
| 29 | Highsmith, J. | *Agile Software Development Ecosystems* | 2002 | Addison-Wesley | Branch A — agile vs. heavyweight process comparison |
| 30 | SEI / CMMI Team | "Performance Results of CMMI-Based Process Improvement" | 2010 | SEI Technical Report | Branch A — process maturity and quality empirical data |
| 31 | Micro Focus / HPE | "Agile and DevOps Reduce the Cost of a Defect Compared to Waterfall" | 2018 | Industry study | Branch A — waterfall vs. agile defect cost comparison |
| 32 | Rahman, A. & Cysneiros, L. | "An Empirical Study from a Quality Perspective on the Impact of Waterfall/Agile" | 2024 | ACM SAC | Branch A — requirements-related defects by methodology |

---

### Synthesis

#### Section 1 — Branch A Findings: Early-Phase-Chain Calibration

**1.1 The YAGNI / speculative generality framework: mechanism without calibration threshold**

The cleanest articulation of what the driving question is asking about Branch A comes from Fowler's canonical treatment. YAGNI (Beck 1999, Fowler's bliki 2015) names two cost components of speculative elaboration: cost of delay (the value of other work not done while speculative features are built) and cost of carry (the ongoing complexity cost of features that remain in the system and are never used). Fowler names "speculative generality" as a code smell in *Refactoring* (1999): design elements built to support hypothetical future requirements that never arrive. The Standish Group's recurring finding — approximately 45% of features in software applications are rarely or never used — is the empirical anchor most frequently cited for the economic case.

These frameworks are well-established. What they do not settle is the question this cycle needs answered: does upfront *process* (RESEARCH → DISCOVER → MODEL → DECIDE as a chain) generate the same kind of speculative cost as upfront *code features*, or is the mechanism different? Fowler's YAGNI analysis is explicitly scoped to capabilities built into software; he specifically exempts refactoring and work that makes code more malleable from YAGNI's stricture. Whether methodology artifacts (ADRs, domain models, scenarios, research logs) are analogous to speculative code features or to refactoring work (which improves malleability without building presumptive capability) is not addressed in the literature.

The closest analogical literature is process-cost research, treated below.

**1.2 Boehm's cost-of-defects-by-phase: the argument and its empirical grounding**

Boehm's 1976 formulation — that defects found in later phases cost an order of magnitude more than defects found in requirements — is the foundational argument for upfront design investment. Boehm & Basili (2001) present it as one of the top-ten empirical findings in software defect reduction. The mechanism: defects that crystallize early in requirements or architecture propagate through all downstream phases; finding them later requires undoing all that propagation.

However, this argument carries a significant empirical caveat that the cycle should not suppress. Bossavit (2012) examines the underlying data in *The Leprechauns of Software Engineering* and finds the evidentiary basis for the 10x-100x cost escalation claim is weak: the studies are from the 1970s–80s, involve specific large-scale government and military projects, and the methodology does not generalize to the range of contemporary development contexts. Slashdot's 2003 retrospective discussion and the TechWell 2013 analysis both note that the cost-escalation curve's empirical foundation is project-context-specific. The argument survives as a heuristic but its claimed empirical magnitude is contested.

The RDD-specific implication: if Boehm's argument supports investing in early-phase chain elaboration, the argument's empirical basis is strong enough to be directionally correct (early-phase defect-finding does tend to be cheaper) but not precise enough to calibrate how much early-phase elaboration is warranted. The curve justifies *some* upfront process; it does not calibrate *how much*.

**1.3 Lightweight vs. heavyweight methodology calibration: Cockburn's Crystal framework**

Cockburn (2004) is the field's most explicit treatment of methodology calibration to project properties. Crystal is a family of methodologies scaled by team size and criticality: Crystal Clear (teams of 2–6), Yellow (10–20), Orange (20–50), and beyond toward Red and Maroon for life-critical large-scale work. The core principle: "the smaller and safer the project, the lighter the process should be."

The "barely sufficient methodology" pattern in XP (Cockburn 2004, Highsmith 2002) operationalizes this: use the minimum process that prevents the failure modes you actually face. The field's conventional wisdom is that methodology overhead is warranted by team size, coordination cost, and reversibility risk. For a solo developer working on a self-authoring methodology (RDD's actual context), Crystal Clear's lightest process is the relevant comparator — and Crystal Clear produces very little written artifact (it relies on co-location, osmotic communication, and direct conversation rather than documentation).

This finding is substantively significant for the driving question. The secondary practitioner referent (B1 specification) is comparable-methodology practitioners, and the Crystal Clear comparator population for a solo developer would use almost no upfront documentation. RDD's early-phase chain is structurally heavier than what Crystal Clear would prescribe for a project of equivalent team size. The "mismatch" hypothesis (Branch C) has purchase here: Crystal's calibration framework would predict that a solo developer applying RDD's full early-phase chain to most problems is over-calibrated to the project's actual coordination and reversibility risks.

Cockburn's framework also surfaces the exception: where the work is high-criticality (life-critical, identity-forming, genuinely novel), heavier process is warranted even for small teams. RDD's Reflection 005 framing (deep-work-tool for identity-forming work) is the methodology's own implementation of this exception. The field converges on this principle.

**1.4 Empirical agile vs. waterfall comparisons: what method weight actually produces**

The empirical literature on waterfall vs. agile methodology outcomes (Rahman & Cysneiros 2024; Micro Focus 2018; multiple systematic reviews) shows mixed but directionally consistent findings:

- Agile methodologies tend to produce lower cost and schedule variance than waterfall.
- Waterfall tends to produce higher defect counts per thousand lines of code in some studies (7 KLOC vs. 4 KLOC for agile in one frequently-cited comparison).
- However, Rahman & Cysneiros (2024, ACM SAC) find the *opposite* for requirements-related defects specifically: agile methods as practiced can produce *more* requirements-related defects than waterfall, not fewer. The mechanism is that agile's deliberate deferral of requirements precision creates defects that emerge later.

This empirical divergence is directly relevant to Branch A's mechanism question. The literature does not uniformly support the hypothesis that upfront elaboration drives over-engineering. For requirements-related defects specifically, upfront specification reduces defect counts. The over-engineering hypothesis requires a more precise claim: not that all upfront elaboration is wasteful, but that the elaboration RDD produces in the early-phase chain *exceeds the defect-prevention value it delivers* for the stake level of the work. The literature does not provide data at this level of granularity for single-practitioner research-methodology workloads.

**1.5 CMMI process maturity: does more process produce better outcomes?**

The SEI's CMMI empirical research (SEI 2010) shows that higher process maturity (CMMI Levels 3–5) correlates with better quality outcomes, reduced defect density, and lower schedule variance at organizational scale. Each higher CMMI level reduces development effort and diseconomy of scale.

The limitation for this cycle: CMMI's empirical basis is large-scale organizational software development (teams of 20–500+). The findings do not transfer cleanly to solo-developer or small-team contexts. The mechanism in CMMI's data is primarily coordination and integration overhead reduction: mature processes help large teams coordinate without defects propagating through organizational seams. A solo developer has no inter-team integration seams; the CMMI argument's mechanism does not apply.

**1.6 Organizational/process alternatives to the early-phase chain (B-P3 scope)**

The structured-alternatives list for Artifact 1 was weighted toward technical alternatives. The literature surfaces three organizational/process alternatives worth naming:

*XP's on-site customer:* The empirical literature on XP's on-site customer practice (ResearchGate 2021, case study) shows that continuous stakeholder presence shifts assumption-surfacing from upfront documentation to ongoing conversation. The on-site customer practice does not eliminate assumption-surfacing work — it disperses it into conversation rather than concentrating it into phases. The quality of assumption-surfacing depends on the quality of the conversation, not the completeness of any document. For a solo developer-researcher, the on-site customer pattern collapses (the developer *is* the customer); the RDD equivalent is the practitioner-as-both-architect-and-user, which is precisely the reflexivity problem Cycle 019 is examining.

*Lean startup's customer development:* Ries's lean startup (2011) and Blank's customer development method replace upfront discovery documentation with iteration: build a minimal product, learn from customer behavior, update the model. The mechanism is empirical rather than analytical — assumptions are tested by building, not by elaborating them before building. For software methodology work (RDD's workload), "build and observe" is available as a validation mechanism (ship a cycle, observe the practitioner's experience, update). The graduation lifecycle partially implements this: observed behavior (did the cycle earn its cost?) triggers methodology adjustment. The research phase's elaboration is the opposite posture — assumption-surfacing before building rather than after.

*Whiteboarding / narrative design sessions:* Game development and product design communities use facilitated narrative design sessions (war games, stakeholder inhabitation, scenario walkthroughs) as assumption-surfacing mechanisms that produce no written artifacts. The findings from these sessions are retained in participants' shared mental models, not in documents. This alternative has lower process-tax but higher participant-availability requirements and degrades across session boundaries (shared mental models are not persistent).

The field's position on these alternatives is consistent: they are appropriate substitutes for upfront documentation under conditions of high stakeholder availability, co-location, and iterative product cycles. They perform poorly under conditions of solo work, asynchronous collaboration, and knowledge that must survive session boundaries. RDD's context (solo developer, asynchronous with itself across sessions, knowledge that must survive months) is precisely the context where conversational alternatives underperform.

---

#### Section 2 — Branch B Findings: Audit-Infrastructure Cost

**2.1 Fagan inspections: the empirical foundation for structured review**

Fagan's 1976 IBM Systems Journal paper established the empirical case for structured code inspection: IBM reported 80–90% defect detection rates from Fagan inspections, with savings of up to 25% in development resources. A later study (Doolan 1991, IDA Linköping) found a payback factor of approximately 30 for every hour invested in inspection. The defect-finding rate in the pre-test phase is orders of magnitude cheaper per defect than finding the same defects in post-deployment testing.

The mechanism Fagan identifies: inspection's value comes from finding defects before they propagate into downstream artifacts. A defect in a requirements document caught in requirements inspection costs nothing downstream; the same defect found in production testing costs all the propagation work to undo. This mechanism is exactly what RDD's audit infrastructure is designed to exploit: catching sycophancy-induced framing-adoption in RESEARCH before it propagates into DISCOVER, MODEL, DECIDE, and BUILD.

Fagan's empirical work is the strongest single citation supporting Branch B's audit infrastructure as potentially earning its cost. But the analogy requires care: Fagan's inspections are applied to code artifacts with ground truth (the code is correct or not); RDD's audits are applied to research artifacts where "correctness" is a matter of framing quality, epistemic honesty, and argument structure — a substantially less determinate target.

**2.2 Modern code review research: what review actually delivers**

Bacchelli & Bird (2013, ICSE) is the landmark empirical study of modern tool-based code review at Microsoft. Their headline finding reverses the conventional expectation: while finding defects remains the primary *stated* motivation for code review, the primary *actual* benefits documented are knowledge transfer, increased team awareness, and creation of alternative solutions. Defect-finding is less prominent in outcomes than in intentions. Reviewers spend significant time on code comprehension rather than defect identification.

The SmartBear study (2500 code reviews across multiple organizations) adds a quantitative threshold: review effectiveness degrades sharply above 400 lines of code per session and above 90 minutes of review time. Defect density falls faster than linearly as review size grows.

For Branch B's question — whether RDD's audit infrastructure earns its cost — the Bacchelli & Bird finding is cuts in two directions simultaneously. First, review delivers value beyond defect-finding: knowledge transfer and shared understanding may be the primary product of RDD's audit rounds, not just defect detection. This supports the audit infrastructure as valuable even if its defect-detection rate is imprecise. Second, the knowledge-transfer value accrues to *team awareness* in the Bacchelli & Bird study — a mechanism that does not translate to solo-developer or agent-to-agent contexts where there is no team whose awareness is being built.

**2.3 Diminishing returns in iterative review rounds**

The literature on iterative refinement patterns is consistent across both human review cycles and LLM-based review cycles:

*Human review:* The broader code review literature (Jureczko et al. 2020; iterative self-refinement review data) shows the pattern: the largest quality improvements occur in the first 1–2 review rounds. Later rounds yield smaller improvements. The relationship is not zero after round 2 — for high-criticality content (security-sensitive code, published documents, proofs), 3–5 rounds are productive. But the marginal gain per round falls sharply.

*LLM self-refinement (Madej et al. 2023, NeurIPS):* The Self-Refine paper establishes that iterative LLM self-feedback improves output quality, with diminishing returns beginning after the first 1–2 rounds. The mechanism: each refinement round activates latent knowledge the model already possessed but failed to retrieve during initial generation. The model is not learning from refinement; it is accessing what it already knew. This creates a quality ceiling: when the model's own blind spots prevent it from identifying errors, iteration rearranges errors without removing them.

*LLM self-correction limits (Liu et al. 2024, TACL):* The critical survey finding is that LLMs cannot reliably correct their own mistakes without external feedback. Self-correction succeeds when the evaluator has different blind spots than the generator (i.e., when the critic is architecturally isolated from the generator). This is precisely the rationale for RDD's architectural-isolation mechanism (dispatching separate context-isolated subagents as auditors). The Liu et al. finding supports the *design* of RDD's audit infrastructure — isolated auditors rather than self-review — but does not calibrate how many rounds of isolated review are productive before diminishing returns dominate.

**2.4 LLM-as-judge cost and reliability**

The emerging literature on LLM-as-judge evaluation (Zheng et al. 2024; MT-Bench; ACL 2025 multilingual reliability study) shows:

- State-of-the-art LLM judges (GPT-4o class) achieve correlation with human judgments exceeding 80% on well-structured instruction-following and code tasks.
- In expert knowledge domains, agreement between LLM judges and subject-matter experts drops to 60–68%.
- Ensemble approaches (voting across multiple LLM judges) improve reliability but cannot correct systematic shared biases; minority-veto arrangements improve true-negative rates.
- The cost of multi-LLM ensemble evaluation scales quadratically with ensemble size.

The RDD-specific implication: RDD's audit infrastructure uses specialist subagents dispatched in isolated contexts — this is structurally similar to an ensemble of specialized judges rather than a single judge. The reliability finding supports the architecture (ensembles outperform single judges), but the quadratic cost scaling is a genuine concern. Cycle 018's approximately 14 specialist subagent dispatches, if extended to larger ensembles or more rounds, would scale costs rapidly. The literature does not provide a precise cost-vs-reliability frontier for the kind of qualitative research-artifact evaluation RDD's auditors perform; this is genuinely thin territory.

**2.5 Coverage gap: audit-infrastructure cost research specific to methodology artifacts**

The intersection of (a) iterative audit rounds, (b) applied to research/design artifacts rather than code, (c) in single-agent or solo-developer contexts, (d) using LLM-based specialist auditors is not directly addressed in any source found. The closest analogues are:

- Fagan inspections (code artifacts, human inspectors, organizational contexts)
- LLM self-refinement research (LLM-produced text, self-feedback, no external auditor)
- LLM-as-judge research (LLM evaluators, calibrated against human judgments on well-defined tasks)

None of these map cleanly to RDD's Branch B question. This is the most genuine empirical gap across the five branches: the field does not have research on the cost-effectiveness of iterative multi-round LLM-specialist-auditor review of qualitative research artifacts. Branch B's question remains largely open from the literature.

---

#### Section 3 — Branch D Findings: Possibility-Space Navigation

**3.1 The structure of design problem spaces (Goel & Pirolli 1992)**

Goel & Pirolli's protocol study (Cognitive Science 1992) analyzed verbal protocols from instructional designers, architects, and mechanical engineers, identifying eight invariants of design problem-solving across disciplines. The key structural finding: design problem-solving has distinct phases — problem structuring, preliminary design, refinement, and detailing. Problem structuring is itself a discovery process; what appears as a well-structured problem only emerges through the problem-solving process.

This finding inverts a common assumption: problem space elaboration is not unnecessary overhead added before solving, but constitutive of the problem-finding process. You cannot "start narrower" to avoid possibility-space elaboration in design without risking that you are solving the wrong, pre-structured problem.

The RDD implication: if the methodology's early-phase chain is understood as a problem-structuring mechanism (rather than a problem-answering mechanism), the elaboration it produces is not speculative generality in the code-smell sense but constitutive design work. This does not settle the cost question, but it changes the nature of the question: the question is not "how do we eliminate possibility-space elaboration?" but "when has the problem been structured sufficiently to begin implementation?"

**3.2 Satisficing vs. optimizing in design (Cross 2011; Simon 1996)**

Cross (2011) cites Simon's (1996) satisficing principle as central to design cognition: designers generate "fairly quickly a satisfactory solution" rather than attempting prolonged analysis to identify the optimal solution. The key phrase from Cross: "producing any one of what might well be a large range of satisfactory solutions rather than attempting to generate the one hypothetically-optimum solution."

The implication for RDD's possibility-space critique: if RDD's research phase opens a wide possibility space, the navigation criterion is satisficing, not optimizing. The practitioner does not need to have examined the full space — they need to have examined enough to feel confident they have identified a satisfactory direction. The over-engineering critique against possibility-space elaboration would need to show that RDD's RESEARCH phase elaborates the space *past the satisficing point*, not just that a satisfactory direction could have been found sooner. This is a meaningful distinction: the critique's precision needs to be "RDD over-elaborates the possibility space before satisficing" rather than "RDD elaborates the possibility space at all."

**3.3 Expert vs. novice design navigation (Lawson 2006; Goel & Pirolli 1992)**

The expert/novice design literature consistently finds that:
- Novice designers adopt depth-first search strategies: they commit early to a sub-solution and elaborate it.
- Expert designers adopt breadth-first strategies: they explore the possibility space before committing to a direction.

Lawson (2006) finds specifically that expert designers "know how to frame a problem" and that "students of design often devote too much of their time to unimportant parts of the problem." The failure mode for novice designers is not over-exploration but premature commitment — they commit too early to a framing and miss alternatives.

This finding cuts against the over-engineering critique of possibility-space elaboration. Expert design behavior involves *more* early-phase exploration, not less. If RDD's early-phase chain models expert design behavior (breadth-first problem-structuring), its possibility-space elaboration is calibrated to expert practice. The critique would need to be more specific: not that early-phase exploration is wrong, but that RDD's *particular form* of early-phase exploration (written artifacts, specialist subagent audits, iterative review) is heavier than what expert practice requires.

**3.4 Design fixation: the opposite risk (Gero & Kan 2011; Zanker et al. 2019)**

The design fixation literature (Gero & Kan 2011; Zanker et al. 2019) identifies a failure mode opposite to over-exploration: premature commitment to a particular design direction, which limits the space searched and produces solutions that are locally optimal but globally suboptimal. Fixation is measurable through protocol analysis (linkography of the design session).

Zanker et al. (2019) find that early prototyping can *increase* fixation by committing practitioners to an initial design direction before the possibility space has been adequately explored. This finding is relevant to RDD's alternatives: the spec-driven development alternatives (type-driven design, BDD with executable specs) produce early-phase artifacts that could induce fixation — the spec becomes the commitment point. RDD's research-first approach, which delays commitment by elaborating the possibility space before specifying, may be the design-fixation-prevention mechanism that justifies its apparent overhead.

**3.5 Information foraging and patch navigation (Pirolli & Card 1999)**

Pirolli & Card's information foraging theory models how people navigate information patches — when to stay in the current information patch (continue exploring) vs. leave for a different patch (switch contexts). The mechanism: practitioners use "information scent" (proximal cues about the value and cost of information sources) to decide whether continued exploration of the current patch is worth the opportunity cost of not moving to a different patch.

Applied to RDD's early-phase chain: the question "when has RESEARCH done enough?" is an information-patch-switching question. The practitioner (or agent acting on behalf of the practitioner) needs a satisfactory signal — information scent strong enough to commit to a direction. RDD's scope-setting mechanism (cycle entry framing, driving question) provides some signal, but the methodology does not have an explicit "patch-switching criterion" that says "exploration is sufficient when X." This gap (noted in the Loop 1 C3 pre-pass for Branch D) is confirmed by the foraging literature: the absence of a patch-switching criterion creates a systematic risk of over-foraging (elaborating past the point of diminishing informational return).

---

#### Section 4 — Branch E Findings: Agent-Facing Artifact Layer

**4.1 Spec-driven development: the industry's current answer to agent-consumed artifacts**

The spec-driven development discourse (Thoughtworks Tech Radar 2025; Osmani 2025; Fowler 2025 on SDD tools; Thoughtworks Medium 2025) is the most directly relevant current practitioner literature for Branch E's question about agent-facing artifacts.

SDD emerged in 2024–2025 as the industry's response to three failure modes in LLM-assisted coding: intent drift (underspecified prompts lead agents to make reasonable but wrong defaults), context decay (agents forget earlier decisions as codebases grow), and unverifiable output (without acceptance criteria, there is no way to know whether agent output is correct). The SDD solution: write specifications before code, use specifications as agent context, verify agent output against specifications.

The critique Thoughtworks (2025 Tech Radar, Vol. 33) surfaces is precisely the Branch E question: SDD workflows "remain elaborate and opinionated" and show "a bias toward heavy up-front specification and big-bang releases." Thoughtworks places SDD in the "Assess" ring (not "Adopt"), citing concerns about proportionality. The concrete data point: a single date-display feature in GitHub Spec Kit produced 8 files and approximately 1,300 lines of specification. For a 2-hour task, specification overhead can exceed the task's implementation time.

This finding lands directly on the Branch E mechanism question: agent-consumed specifications can accumulate elaboration independent of the elaboration they prevent in agent output. The specification is a process-tax artifact; its cost is borne before implementation, and that cost is not offset by equivalent implementation time savings when the task is small.

**4.2 Structured vs. narrative artifacts for agent consumption**

Anthropic Engineering's (2025) analysis of effective context engineering for AI agents finds that structure matters: "the strongest agents are not the ones that see the most, but rather the ones that see the right things, in the right form, at the right time." Structured artifacts (with explicit section delineation, XML tagging, or Markdown headers) outperform undifferentiated narrative prose for agent task performance.

However, Paulsen et al. (2025) find that effective context often falls far below advertised context window limits — by up to 99% on complex tasks. A model that handles simple retrieval at 5,000 tokens may fail at complex sorting or summarization at 400–1,200 tokens. The implication: large specification artifacts are not consumed equally across the context window. Sections deep in a long specification may be effectively invisible to the agent, making specification length a poor proxy for specification effectiveness.

For RDD's agent-facing artifact layer (ADRs, scenarios, domain models, system designs, audit reports), this finding suggests that artifact length does not scale linearly with agent-consumed value. A 30KB ADR is not ten times as effective as a 3KB ADR for agent consumption purposes; it may be less effective if critical information is diluted across more content.

**4.3 ADR effectiveness for agent consumption**

The 2026 arXiv paper (Context Matters: Evaluating Context Strategies for Automated ADR Generation, arXiv:2604.03826) examines how different context-provision strategies affect LLM generation of ADRs. The key finding: context-enriched RAG (retrieving semantically relevant context rather than concatenating all available context) significantly outperforms standard retrieval. The mechanism: the relevance of retrieved context matters more than its completeness.

Two agent-facing ADR studies (Adolfi.dev 2024; Strengholt/Piethein Medium 2025) examine LLM-generated and LLM-consumed ADRs in practice. The finding from the consumption side: agents reading ADRs to inform architectural decisions benefit from the decision rationale captured in ADRs — the "why" behind decisions allows agents to evaluate whether new decisions contradict prior reasoning. But the value is in the *decision rationale*, not in the total volume of ADR content.

The implication for RDD: RDD's ADRs are currently long (3KB–30KB per ADR, 93 ADRs as of Cycle 018). If the agent-consumed value of each ADR is primarily its decision rationale, the current ADR length may represent process-tax that exceeds what the agent-consumption use case requires. The Branch E mechanism for over-engineering in the agent-facing layer is not elaboration of decisions but elaboration *around* decisions: context, alternatives, discussion, and implications that may not be retrieved or consumed effectively by downstream agents.

**4.4 The "specification vs. context documents" distinction**

Fowler's 2025 analysis of SDD tools ("Understanding Spec-Driven Development: Kiro, spec-kit, and Tessl") draws a distinction that is directly useful for Branch E: specifications (relevant to tasks that create or change particular functionality) differ from context documents (relevant across all AI coding sessions). Context documents — rules files, high-level architectural descriptions, domain models — are the background agent context; specifications are task-specific.

RDD's artifact corpus contains both: the domain model, system design, and CLAUDE.md files function as context documents (persistent background); ADRs and scenarios function as specifications (decision-specific). The over-engineering critique in Branch E may be more precisely targeted: the *specification* artifacts (ADRs) may be over-elaborated for their consumption use case (agent reads ADR to evaluate new decision), while the *context document* artifacts (domain model, system design) serve a different function and should be evaluated separately.

---

#### Section 5 — Organizational/Process Alternatives to the Early-Phase Chain (B-P3 Carryover)

**5.1 XP on-site customer: assumption-surfacing through pairing rather than documentation**

XP's on-site customer practice (Beck 1999; empirical case study at ResearchGate 2021) shifts assumption-surfacing from document production to continuous conversation. The on-site customer owns user story articulation, acceptance criteria, and quality control. No product discovery document is produced; the customer's presence provides continuous assumption-correction.

The empirical finding from the case study: on-site customer practice reduces requirements-related defects and improves responsiveness to stakeholder needs, but introduces dependencies on customer availability. When the customer is unavailable (offshore, part-time, or — as in RDD's solo context — the same person as the developer), the mechanism degrades toward unrecorded assumptions.

**5.2 Architecture review boards and design review sessions**

Organizational architecture review boards (ARBs) serve as decision-gatekeeping mechanisms for architectural decisions. Unlike RDD's ADR process, ARBs are synchronous social structures: proposed architectural changes are presented to a group; the group's review is the quality gate. ARBs produce meeting records rather than detailed decision-rationale documents.

The literature on ARBs (primarily organizational rather than empirical) suggests they perform well for coordination in multi-team organizations but poorly for single-developer or small-team contexts: the overhead of preparing and facilitating review exceeds the value when the "audience" of the review is small. For RDD's solo-developer primary referent, an ARB-equivalent is a solo reflective practice (which is what the research phase's structured-alternatives prompt already approximates).

**5.3 Narrative design sessions without written artifacts**

Game development's narrative design sessions and product organizations' facilitated workshops (war games, stakeholder inhabitation, future-press-release scenarios) produce assumption-surfacing through roleplay and discussion, not written artifacts. The findings are retained as shared mental models. No systematic empirical literature on the relative defect-prevention value of these sessions vs. written discovery exists; the practice is described primarily in practitioner literature.

The key limitation for RDD's context: shared mental models degrade across time and session boundaries. A solo practitioner's mental model of a design decision made in a narrative session three months ago is unreliable. RDD's written artifacts (domain model, ADRs, research log) function partly as external memory — session-persistent knowledge that survives the practitioner's natural forgetting. For solo work with long temporal gaps between sessions, the "no written artifacts" alternative has a specific, unmet cost.

---

#### Section 6 — Cross-Branch Synthesis

**6.1 Convergent findings across branches**

Three findings converge across multiple branches:

*The proportionality principle:* Across Branch A (Crystal's barely-sufficient methodology), Branch B (SmartBear's review-size thresholds; Bacchelli & Bird's knowledge-transfer vs. defect-finding distinction), and Branch D (Simon's satisficing principle), the literature consistently frames the question not as "is elaboration good or bad?" but "does the elaboration match the stakes?" Cockburn's Crystal framework, YAGNI's cost-of-carry calculation, and Pirolli & Card's patch-switching criterion are all proportionality mechanisms. The literature does not say "elaborate less"; it says "elaborate enough for the stakes, then stop." RDD's question, precisely stated, is whether its process has a patch-switching criterion that stops elaboration at the right point.

*Isolation-vs-self-correction:* Branch B's finding from Liu et al. (2024) and the LLM-as-judge literature converges with Branch D's design fixation research (Gero & Kan 2011): both show that self-evaluation has systematic blind spots. Liu et al. show LLMs cannot reliably self-correct without external feedback; Gero & Kan show designers exhibit fixation when left to self-evaluate. RDD's architectural-isolation mechanism (specialist subagents in isolated contexts) is the methodology's response to this; the literature supports the *design rationale* for isolation even where it does not calibrate the *frequency* or *number of rounds* warranted.

*Specification overhead scales non-linearly with task size:* The SDD literature (Thoughtworks 2025; the 1,300-line date-display example) and the context window research (Paulsen et al. 2025) both show that specification overhead does not scale proportionally to task complexity. A small task can generate disproportionate specification overhead; a large task's specification overhead may be amortized more effectively. If RDD's early-phase chain is a fixed-cost startup per cycle, short cycles on simple problems bear a disproportionate overhead. Longer cycles on complex problems are better calibrated. This is the structural finding most directly answering the driving question's "where does elaboration accumulate" framing: it accumulates at the *beginning* of short cycles.

**6.2 Divergent findings across branches**

*Expert vs. novice framing of early-phase elaboration:* The design cognition literature (Lawson 2006; Goel & Pirolli 1992) frames upfront design exploration as expert behavior. The XP/agile literature (Beck 1999; Highsmith 2002) frames the same upfront elaboration as overhead to be stripped to the barely-sufficient minimum. These two frameworks give opposite valences to the same behavior. The resolution in the literature is context-dependent: high-criticality, ill-structured problems warrant expert breadth-first exploration; well-structured, lower-criticality problems warrant barely-sufficient process. The question for RDD is whether its problems are systematically on the ill-structured, high-criticality end (which justifies the early-phase chain) or the well-structured, lower-criticality end (which would make the chain over-calibrated).

*Process cost vs. defect prevention:* Boehm's (1981) framework supports upfront elaboration by showing defect-propagation costs across phases; the agile/XP literature (Beck 1999; Highsmith 2002) challenges the same data as project-context-specific and not generalizable to iterative, small-scale development. Bossavit (2012) sharpens this challenge by examining the empirical basis. The literature does not resolve this divergence; it is genuinely contested.

**6.3 The Branch A/B separability question (B2 carryover)**

The R2 audit flagged that Branches A (early-phase chain) and B (audit infrastructure) may not be separable in practice. The literature supports this concern at a structural level: the Fagan inspection literature shows that inspection overhead is a fixed cost per artifact; more artifacts (produced by a fuller early-phase chain) generate more inspection work. A reduced early-phase chain would naturally reduce audit-infrastructure cost as a second-order effect.

However, the literature also supports treating them as analytically separable: the Bacchelli & Bird finding (code review delivers knowledge transfer, not just defect-finding) and the Liu et al. LLM-correction finding (isolation is necessary for self-correction effectiveness) address the *design rationale* for audit infrastructure independent of the artifact count. Even a lighter early-phase chain that produced fewer artifacts would benefit from isolated review of those artifacts. The separability question is: could the audit infrastructure earn its cost if the early-phase chain were lighter? The literature's answer is conditional yes — isolation-based review has value independent of artifact count — but the cost would be proportionately lower.

---

#### Section 7 — Equal-Weight Framing Audit (Finding 9 Carryover)

**7.1 Did the literature surface asymmetric evidence?**

The search produced substantive evidence for both the over-engineering hypothesis and the methodology-mismatch hypothesis.

*Evidence leaning toward the over-engineering hypothesis:*
- Thoughtworks' (2025) SDD critique — a bias toward heavy upfront specification — is direct evidence that the over-engineering pattern exists in methodologies comparable to RDD. The 1,300-line date-display specification is a concrete data point.
- The iterative-refinement diminishing-returns literature (Madej et al. 2023; iterative review data) shows that the R1→R2→R3→R4 pattern RDD uses has a theoretical basis but also a documented ceiling where further iteration does not improve outcomes and may degrade them through over-refinement.
- YAGNI's cost-of-carry mechanism applies to methodology artifacts if they are treated as required reading for downstream agents: a 93-ADR corpus of which 20 ADRs are directly relevant to the current cycle carries an ongoing cognitive and token cost for the 73 ADRs that are not.

*Evidence leaning toward the methodology-mismatch hypothesis:*
- Cockburn's Crystal framework predicts that lighter process is warranted for smaller teams and lower-criticality work — but heavier process (including documentation-intensive early-phase chains) is warranted for high-criticality, ill-structured, novel problems. RDD's design target (novel, identity-forming, methodological work) sits in the quadrant where Crystal would prescribe heavier process.
- The design cognition literature (Lawson 2006; Goel & Pirolli 1992) shows that expert designers conduct more upfront problem-structuring, not less. The early-phase chain models expert design behavior.
- The design fixation literature (Gero & Kan 2011) shows that the alternative — committing early to a direction — introduces its own systematic failure mode (fixation). RDD's possibility-space elaboration may prevent fixation more effectively than any of the lighter-process alternatives.
- Liu et al. (2024) and Pirolli & Card (1999) support the architectural isolation design of the audit infrastructure even if they don't calibrate its round count.

**7.2 Asymmetry in the literature's own framing**

The literature does not treat either hypothesis as null. The agile/XP literature and the design cognition literature represent genuinely distinct traditions with different priors about process weight, and neither is treated as settled. Cockburn explicitly resists the null treatment of lightweight methodology, writing Crystal's framework as a calibration problem, not a universal prescription. Similarly, Boehm's upfront-investment argument persists in the literature despite Bossavit's (2012) empirical critique.

The one area where the literature's framing is somewhat asymmetric: the SDD critique literature (Thoughtworks 2025; Osmani 2025; Redmonk 2025) is primarily practitioner-facing discourse, produced in response to observed failures of under-specified AI development (vibe coding). This literature defaults toward "more specification is better than less" because its reference failure mode is under-specification, not over-specification. It acknowledges the over-specification failure mode but treats it as secondary. A cycle that takes this literature's framing at face value would lean toward supporting RDD's specification-heavy posture without adequate examination of the over-specification failure mode. The Finding 9 carryover flag is warranted: this literature should be used for its evidence about agent-consumed artifact quality, not for its meta-framing of the specification-vs-no-specification question.

**7.3 What the equal-weight framing audit finds**

The literature review, taken as a whole, does not strongly favor either hypothesis. It provides:

- Support for the over-engineering hypothesis on *specific mechanisms* (specification overhead scales non-linearly with task size; iterative review has diminishing returns after 2 rounds; agent-consumed artifacts are not consumed linearly with their length)
- Support for the methodology-mismatch hypothesis on *structural grounds* (Crystal framework calibrates heavier process to higher-criticality work; expert design behavior involves more upfront exploration; design fixation is the failure mode of the alternative)

Both hypotheses are live. The literature does not settle which mechanism is primary for RDD's specific context (solo-developer, research-methodology workload, cross-session knowledge persistence requirement). This is the appropriate finding for a literature review at Loop 2: the question is calibrated, both hypotheses are grounded, and the corpus reflexive analysis (Loop 4) is the appropriate next step to test the mechanisms against RDD's actual artifact evidence.

---

### Key Findings

- YAGNI's cost-of-carry mechanism (Fowler 1999/2015) applies to methodology artifacts if they function as required reading for downstream processes. The mechanism is real but requires specificity: it applies to artifacts that accumulate ongoing cognitive cost, not to artifacts that are used once and retired. ADRs that downstream agents must load repeatedly accumulate cost; a research log entry read once does not. (Fowler 1999; Boehm & Basili 2001)

- Cockburn's Crystal framework (2004) predicts that a solo developer working on well-understood problems should use the lightest possible process. For novel, ill-structured, identity-forming problems — RDD's stated target domain — Crystal would prescribe heavier process. The over-engineering hypothesis requires showing that RDD's cycles are systematically applied to problems that do not meet the "novel, ill-structured, identity-forming" threshold.

- Boehm's (1981) cost-of-defects-by-phase argument supports upfront design investment, but Bossavit (2012) establishes that its empirical magnitude is contested and project-context-specific. The argument is directionally sound for high-stakes projects; its calibration for solo-developer methodology research is uncertain.

- Bacchelli & Bird (2013) find that modern code review's primary documented benefit is knowledge transfer and team awareness, not defect detection. For RDD's audit infrastructure in a solo-developer context, the knowledge-transfer mechanism does not apply; the remaining justification for multi-round review is defect-detection, which must be weighed against the diminishing-returns pattern documented by the iterative refinement literature.

- Iterative refinement reaches diminishing returns after 1–2 rounds (Madej et al. 2023; code review literature; SmartBear 2011). For content where quality is critical (proofs, security-sensitive code, published writing), 3–5 rounds are productive. The R1→R2→R3→R4 pattern in RDD's audit infrastructure is within the range the literature considers potentially productive for high-criticality content, but near the ceiling where continued iteration yields marginal gain.

- Liu et al. (2024) establish that LLMs cannot reliably self-correct without external feedback, supporting the architectural-isolation rationale for RDD's specialist subagent dispatch. The design rationale is sound; the round count is not calibrated by the literature.

- Design experts conduct more upfront problem-structuring, not less (Lawson 2006; Goel & Pirolli 1992). Novices commit too early and over-elaborate selected sub-solutions. RDD's early-phase chain models expert design behavior. The over-engineering critique, if valid, requires showing not that early-phase exploration is wrong but that RDD's particular form of exploration is heavier than what expert practice requires for the problem type.

- Design fixation (Gero & Kan 2011; Zanker et al. 2019) is the failure mode of lighter-process alternatives: early commitment to a direction limits the possibility space and produces locally optimal but globally suboptimal solutions. RDD's early-phase chain may function primarily as a fixation-prevention mechanism. This does not make its cost zero, but it makes the comparison to lighter-process alternatives non-trivial.

- Thoughtworks' 2025 critique of SDD shows that specification overhead does not scale proportionally with task size. A 1,300-line specification for a simple date-display feature is the concrete data point. If RDD's early-phase chain is approximately fixed-cost per cycle, short cycles on simple problems are more over-calibrated than long cycles on complex problems. This is the strongest finding for "where elaboration accumulates": at the beginning of short cycles.

- Paulsen et al.'s (2025) effective context research shows that LLMs effectively consume far less context than their nominal window limits. Artifact length does not scale linearly with agent-consumed value. A 30KB ADR is not proportionally more valuable to a downstream agent than a 3KB ADR if the agent's effective consumption window is much smaller.

- SDD's spec-vs-context-document distinction (Fowler 2025) provides a useful framing for RDD's Branch E: specifications (task-specific) differ from context documents (session-persistent background). RDD's artifact corpus contains both; over-engineering critiques should specify which layer is implicated.

---

### Limitations

**What the search found thinly or not at all:**

- *Branch B's specific intersection:* Iterative multi-round LLM specialist-auditor review of qualitative research artifacts (not code, not structured Q&A benchmarks) in single-developer contexts has no direct empirical literature. The nearest analogues (Fagan inspections, LLM-as-judge, self-refinement) each cover partial aspects but do not map cleanly. This remains the most genuinely open empirical question.

- *Solo-developer methodology overhead empirical data:* The methodology comparison literature (waterfall vs. agile; Crystal calibration) is almost entirely team-scale. Solo-developer methodology overhead has no dedicated empirical literature. The Crystal Clear framework is the nearest approximation, but it is prescriptive rather than empirical at the solo-developer scale.

- *RDD-specific or comparable-practitioner survey data:* There are no surveys of practitioners using RDD or comparable research-first methodology pipelines reporting their experienced overhead vs. value. The secondary referent population (comparable-methodology practitioners) can be approximated from SDD practitioner discourse, but this is recent (2024–2026), practitioner-authored, and not peer-reviewed.

- *Mechanism specificity for methodology artifacts as YAGNI targets:* Fowler's YAGNI analysis (1999/2015) is scoped to code capabilities. The field has not developed a parallel analysis for methodology artifacts (ADRs, scenarios, domain models). Whether methodology artifacts should be evaluated under YAGNI's cost-of-delay and cost-of-carry framework, or under a different framework (external memory, session-persistent knowledge, fixation prevention), is not settled in the literature.

- *Quantitative cost data for research-phase elaboration:* Token counts, time costs, and opportunity costs for methodology research phases are not measured in the literature. The SDD data point (1,300 lines for a simple feature) is the closest available, but it is an outlier case and not a comparative study.

---

### References

Bacchelli, A. & Bird, C. (2013). Expectations, outcomes, and challenges of modern code review. *Proceedings of ICSE 2013*, pp. 712–721. ACM. [https://dl.acm.org/doi/10.5555/2486788.2486882](https://dl.acm.org/doi/10.5555/2486788.2486882)

Beck, K. (1999). *Extreme Programming Explained: Embrace Change*. Addison-Wesley.

Boehm, B. (1981). *Software Engineering Economics*. Prentice-Hall.

Boehm, B. & Basili, V. (2001). Software defect reduction top 10 list. *IEEE Computer*, 34(1), 135–137. [https://www.cs.cmu.edu/afs/cs/academic/class/17654-f01/www/refs/BB.pdf](https://www.cs.cmu.edu/afs/cs/academic/class/17654-f01/www/refs/BB.pdf)

Bossavit, L. (2012). *The Leprechauns of Software Engineering*. Leanpub.

Cockburn, A. (2004). *Agile Software Development: The Cooperative Game*. Addison-Wesley.

Cross, N. (2011). *Design Thinking: Understanding How Designers Think and Work*. Berg.

Fagan, M.E. (1976). Design and code inspections to reduce errors in program development. *IBM Systems Journal*, 15(3), 182–211. [https://www.semanticscholar.org/paper/Design-and-Code-Inspections-to-Reduce-Errors-in-Fagan/fe02f66911c6331a81d01f9cf4fdce05b6b2aca3](https://www.semanticscholar.org/paper/Design-and-Code-Inspections-to-Reduce-Errors-in-Fagan/fe02f66911c6331a81d01f9cf4fdce05b6b2aca3)

Fowler, M. (1999). *Refactoring: Improving the Design of Existing Code*. Addison-Wesley.

Fowler, M. (2015). Yagni. *martinfowler.com/bliki*. [https://martinfowler.com/bliki/Yagni.html](https://martinfowler.com/bliki/Yagni.html)

Fowler, M. (2025). Understanding spec-driven development: Kiro, spec-kit, and Tessl. *martinfowler.com/articles/exploring-gen-ai*. [https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html)

Gero, J.S. & Kan, J.W.T. (2011). Fixation and commitment while designing and its measurement. *Journal of Creative Behavior*, 45(2), 108–131. [https://johngero.com/publications/2011/10GeroFixationJnlCreatveBehavior.pdf](https://johngero.com/publications/2011/10GeroFixationJnlCreatveBehavior.pdf)

Goel, V. & Pirolli, P. (1992). The structure of design problem spaces. *Cognitive Science*, 16(3), 395–429. [https://onlinelibrary.wiley.com/doi/abs/10.1207/s15516709cog1603_3](https://onlinelibrary.wiley.com/doi/abs/10.1207/s15516709cog1603_3)

Highsmith, J. (2002). *Agile Software Development Ecosystems*. Addison-Wesley.

Jureczko, M. et al. (2020). Code review effectiveness: An empirical study on selected factors. *IET Software*. [https://ietresearch.onlinelibrary.wiley.com/doi/full/10.1049/iet-sen.2020.0134](https://ietresearch.onlinelibrary.wiley.com/doi/full/10.1049/iet-sen.2020.0134)

Lawson, B. (2006). *How Designers Think* (4th ed.). Architectural Press.

Liu, Y. et al. (2024). When can LLMs actually correct their own mistakes? A critical survey. *Transactions of the Association for Computational Linguistics*. [https://aclanthology.org/2024.tacl-1.78.pdf](https://aclanthology.org/2024.tacl-1.78.pdf)

Madej, A. et al. (2023). Self-refine: Iterative refinement with self-feedback. *arXiv:2303.17651*. [https://arxiv.org/abs/2303.17651](https://arxiv.org/abs/2303.17651)

Micro Focus / HPE. (2018). Agile and DevOps reduce the cost of a defect compared to Waterfall. Industry study. [https://www.microfocus.com/en-us/assets/application-delivery-management/study-agile-and-devops-reduces-volume-cost-and-impact-of-production-defects-wp](https://www.microfocus.com/en-us/assets/application-delivery-management/study-agile-and-devops-reduces-volume-cost-and-impact-of-production-defects-wp)

Osmani, A. (2025). *Beyond Vibe Coding: From Coder to AI-Era Developer*. O'Reilly. [https://beyond.addy.ie/](https://beyond.addy.ie/)

Paulsen, N. et al. (2025). Effective context window research (MECW). Emergent literature. Referenced via [https://atlan.com/know/llm-context-window-limitations/](https://atlan.com/know/llm-context-window-limitations/)

Pirolli, P. & Card, S. (1999). Information foraging. *Psychological Review*, 106(4), 643–675. [https://act-r.psy.cmu.edu/wordpress/wp-content/uploads/2012/12/280uir-1999-05-pirolli.pdf](https://act-r.psy.cmu.edu/wordpress/wp-content/uploads/2012/12/280uir-1999-05-pirolli.pdf)

Rahman, A. & Cysneiros, L. (2024). An empirical study on the impact of waterfall and agile methods on numbers of requirements-related defects. *Proceedings of ACM SAC 2024*. [https://dl.acm.org/doi/10.1145/3605098.3635901](https://dl.acm.org/doi/10.1145/3605098.3635901)

SEI / CMMI Team. (2010). Performance results of CMMI-based process improvement. SEI Technical Report. [https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=8065](https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=8065)

Simon, H.A. (1996). *The Sciences of the Artificial* (3rd ed.). MIT Press.

SmartBear Software. (2011). 11 best practices for peer code review. White paper. [https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/)

Standish Group. (2002–2015). CHAOS Report. Standish Group.

Thoughtworks. (2025). Spec-driven development: Unpacking one of 2025's key new engineering practices. Technology Radar Vol. 33. [https://www.thoughtworks.com/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices](https://www.thoughtworks.com/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices)

Zanker, C. et al. (2019). Fixation on premature concept choices: A pitfall of early prototyping? *Procedia CIRP*, 84. [https://www.sciencedirect.com/science/article/pii/S2212827119308935](https://www.sciencedirect.com/science/article/pii/S2212827119308935)

Zheng, L. et al. (2024). LLM-as-a-judge: Reliability and ensemble approaches. Referenced via [https://www.emergentmind.com/topics/llm-as-a-judge-evaluations](https://www.emergentmind.com/topics/llm-as-a-judge-evaluations)
