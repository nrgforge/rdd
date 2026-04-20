# Methodology Seams: What Gaps Between Artifacts Reveal About Methodology Design

*2026-04-17*

## Abstract

Seven open issues against the RDD plugin (v0.7.3) were investigated in a single batch cycle — an experimental format testing whether one RDD cycle can coherently tackle a collection of distinct issues at varying research depth. Five tracks received literature review: acceptance criteria traceability (#11, reconnaissance), ADR supersession workflow (#12, reconnaissance), pattern reuse without applicability check (#13, moderate), multi-cycle composition (#14, investigative), and research-phase solution-anchoring (#16, investigative). Two issues were deferred to live validation (#10) and direct fix (#15). The research was not themed in advance — the user explicitly cautioned against stretching for a common thread. A pattern emerged nonetheless: all seven issues involve boundaries where the methodology specifies the shape on each side but not the relationship between them. The cognitive literature explains why these boundaries are vulnerable: existing context narrows attention (Einstellung, selective accessibility, design fixation) before questioning mechanisms can trigger. The structural literature shows where explicit design is needed: criteria-scenario traceability, ADR lifecycle, and multi-cycle composition. The pattern is reported because the evidence supports it, not because it was assumed.

---

## 1. Introduction: Seven Issues and the Question of Coherence

RDD Cycle 016 began as a grab-bag: seven open GitHub issues ranging from a regex defect (#15) to a methodology-substantive question about multi-cycle composition (#14). The research-methods reviewer flagged the risk of forced unification and recommended the cross-cutting hypothesis (whether Issues #13 and #16 share a common mechanism) be answered provisionally before the per-track research ran, then tested against findings. This discipline — name the hypothesis, test it honestly, report the result — is the approach taken throughout.

The seven issues, grouped by research depth:

**No research required:** Issue #15 (PostToolUse dispatch regex defect — specification-execution gap class from Cycle 10) and Issue #10 (lifecycle composition in BUILD — ADR-071 shipped in Cycle 015; validated through this cycle's BUILD phase).

**Reconnaissance depth:** Issue #11 (cycle acceptance criteria traceability — when aggregate criteria hide between atomic scenarios) and Issue #12 (ADR supersession workflow — when historical records and current-state documents serve competing roles without explicit coordination).

**Investigative depth:** Issue #13 (pattern reuse without applicability check — the cognitive mechanism behind reuse failure), Issue #14 (multi-cycle composition — how the methodology handles concurrent, nested, and paused cycles), and Issue #16 (research-phase solution-anchoring — how existing artifacts narrow research before questions form).

---

## 2. Acceptance Criteria Traceability (#11)

### The gap

When a product-discovery acceptance criterion is an emergent property of multiple scenarios — "first real MCP consumer workflow via live MCP transport" — no mechanism in the methodology verifies it at the layer the criterion specifies. Each atomic scenario passes at boundary level. The aggregate criterion may not be verified at the integration layer it names. The cycle ships green; the criterion's satisfaction is assumed, not demonstrated.

### What the literature says

The failure mode is real, documented at the edges of multiple literatures, and unnamed. The closest existing formalism is DO-178C's distinction between High-Level Requirements (verified by integration tests) and Low-Level Requirements (verified by unit tests). DO-178C mandates that LLR passage does not constitute HLR verification — a separate integration-level test is required (RTCA 2011). The coverage-subsumption literature (Zhu et al. 1997) provides the formal basis: lower-criterion satisfaction does not imply higher-criterion satisfaction by definition. Sommerville's (2010) treatment of emergent properties establishes that properties observable only at system-integration level cannot be verified at component level.

In BDD/ATDD practice, the failure mode is recognized but unnamed. Gherkin scenarios carry no layer information; the layer is determined by step-definition implementation (Adzic 2020). The Pact documentation explicitly names "blurring CDC with higher-level functional testing layers" as an anti-pattern. The colloquial term across practitioner sources is "false confidence."

### When it matters

The literature converges on five conditions that push toward real failure: (1) the criterion specifies interaction behavior (live transport, real service), (2) the criterion specifies emergent behavior (performance, timing), (3) contracts are assumed rather than verified, (4) mocks encode assumptions that diverge from production, (5) the criterion is aggregate across multiple scenarios. The simplification is benign when behavior is genuinely decomposable, contracts are formally verified independently, and the test-layer/production-layer difference is known to be irrelevant.

### Implication for RDD

The methodology needs a construct analogous to DO-178C's HLR/LLR distinction: a separation between scenario-level verification and criterion-level verification, with an explicit requirement that each product-discovery acceptance criterion be traced to a test exercising it at the layer the criterion specifies. The DECIDE phase should produce this traceability; the BUILD phase should verify it.

---

## 3. ADR Supersession Workflow (#12)

### The gap

ADRs serve two roles without explicit coordination between them: historical record ("what was decided, when, why") and current input to system-design ("why the architecture looks this way"). When ADRs are amended to match shipped code, historical fidelity is lost. When they are not amended, provenance chains in system-design.md go stale. Neither outcome is acceptable; the methodology needs a lifecycle that preserves both.

### What practitioners say

The immutability consensus is unusually uniform. Nygard (2011), Fowler (2023), AWS Prescriptive Guidance (2023), Microsoft Azure Well-Architected (2026), and GDS (2022) all converge on the same rule: once accepted, the decision text is immutable. Change is expressed through supersession — a new ADR that replaces the old one, with the old ADR's status field updated to "Superseded." The status field is the only mutable site.

A documented minority position rejects immutability: "In theory, immutability is ideal. In practice, mutability has worked better for our teams. We insert the new info into the existing ADR, with a date stamp." This trades provenance traceability for navigational simplicity. For teams using ADRs as informal memory aids, this trade-off may be reasonable. For RDD, where system-design.md explicitly cites ADRs as provenance for architectural choices, the living-document approach introduces a specific risk: the provenance link can point to content that has silently changed meaning. If ADR-012's decision text is mutated to match what shipped, but system-design.md's provenance chain was written when ADR-012 said something else, the chain silently lies. Immutability serves RDD's provenance function; the living-document approach serves a different function.

The role separation Issue #12 proposes — ADRs as immutable historical record, system-design.md and ORIENTATION.md as current truth — is latent in established practice but nowhere formalized. GDS comes closest: "other documentation should be updated whenever a new ADR is accepted." That is one sentence, not a designed system. The triggering mechanism for synchronizing current-state documents on supersession is the genuine gap.

### Adjacent-field analogs

The IETF RFC process is the most relevant analog. Published RFCs are never modified after publication; corrections flow through a typed errata system. The IETF distinguishes three supersession mechanisms ADR practice lacks: Obsoletes (total replacement), Updates (partial modification — the old RFC remains partially valid), and Historic (deprecated technology, distinct from supersession). The IETF also publishes a periodic current-state index as a navigation artifact above the immutable corpus — structurally analogous to a maintained system-design.md.

### Costs

Costs are real and under-studied: navigation complexity grows with supersession chains, provenance chains in current-state documents go stale, per-correction overhead induces underuse (approximately 50% of open-source repositories with ADRs contain fewer than five records, consistent with high abandonment), and frozen context may mislead readers after organizational change. The provenance-chain staleness problem — system-design.md cites a superseded ADR — is the central cost this issue targets and is not treated as a distinct problem in any reviewed source.

### Implication for RDD

The methodology should formalize: (1) body immutability / status mutability for accepted ADRs, (2) a supersession workflow including the IETF-inspired Obsoletes/Updates distinction, (3) a triggering mechanism for updating downstream current-state documents when supersession occurs, and (4) a drift-resolution decision tree distinguishing implementation-level divergence from decision-level supersession.

---

## 4. Pattern Reuse and the Einstellung Effect (#13)

### The gap

During an RDD cycle, a working code pattern was reused in a context where a key assumption of the original did not hold. Three independent process points — scenario writing, fitness criteria, code review — all missed the mismatch. The information needed to prevent the failure was present in the artifact trail throughout the cycle.

### The mechanism: Einstellung, not just habit

The cognitive psychology literature identifies the operative mechanism as the **Einstellung effect** (Luchins 1942; Bilalic, McLeod & Gobet 2008, 2010): once a familiar pattern is activated, it does not merely compete with alternatives — it actively inhibits attention to the features that would reveal its inapplicability. Bilalic et al.'s 2008 eye-tracking study demonstrated this in chess experts: players who verbally reported searching for better solutions were, in their actual eye movements, continuing to attend only to features consistent with the already-activated solution. This is not satisficing (Simon 1956) — reaching for the first adequate option — but attentional suppression: the first-activated framework captures attention before deliberate search can proceed.

This explains the three-review-point failure. All three operated under the same activated frame. Additional review under the same frame produces the same omission. The satisficing and Einstellung accounts are complementary (satisficing explains the initial unchecked selection; Einstellung explains why subsequent review also missed it), but the intervention implications differ: satisficing suggests any forcing function to stop and compare would suffice; Einstellung suggests the forcing function must specifically shift the attentional frame.

### Mitigations

**Schema comparison** (Gentner, Loewenstein & Thompson 2003) is the best-evidenced intervention: requiring explicit comparison between the source case and at least one alternative forces structural mapping that spontaneous reuse bypasses. The study demonstrated transfer in a face-to-face negotiation task — above-average ecological validity for this literature. **Pre-mortem** (Klein 2007) provides a different mechanism: reframe the decision as already-failed and mandate failure-reason generation. Research by Mitchell, Russo and Pennington (cited in Klein 2007) found a 30% improvement in failure-reason *identification* — though whether improved identification translates to fewer undetected failures at the pattern-application stage is not empirically established in software-engineering contexts. The prompt for pattern reuse: "Assume this reused pattern caused a regression that passed code review. What assumption of the original context doesn't hold here?"

Checklists have mixed evidence. The fundamental limitation is that generic checklists do not target assumption-level questions about the specific pattern being applied.

### The cognitive-SE bridge

The software engineering antipatterns literature (Brown et al. 1998; Metz 2016) catalogs pattern misuse structurally — what went wrong — without modeling why experienced practitioners reliably fail to catch it. GoF's (1994/1995) "Applicability" sections contain the right information but create no forcing function for consulting it at application time. The bridge between the Einstellung account and the SE-observed failure modes is underdeveloped in either literature. Notably, expertise does not protect: Bilalic et al. demonstrated the Einstellung effect in experts, and it was stronger in high-surface-similarity scenarios. Expert pattern recognition — a domain asset — becomes a liability precisely in the Issue #13 scenario.

### Implication for RDD

The BUILD phase needs an **applicability check** at the point of pattern reuse: "What's different about the new context that might make this pattern wrong?" This should be a stewardship checkpoint trigger, not a checklist — triggered when the build process detects code being extended by analogy. The DECIDE phase should generate **preservation scenarios** alongside behavior scenarios: "What should this feature *not* change?" The ARCHITECT phase should decompose qualitative fitness claims ("transparent," "backward-compatible") into testable properties.

---

## 5. Multi-Cycle Composition (#14)

### The gap

The methodology's `cycle-status.md` represents a single active cycle, yet practice involves multiple cycles at different states: paused, mini-cycles, pre-hook cycles needing resumption. The single-cycle model produces hook-loop friction during active gates and leaves pre-enforcement cycles stranded. Demonstrated live during Cycle 015, where the Stop hook cascaded blocks between agent turns during an actively-in-progress gate conversation.

### Three paradigms, partial answers

The literature offers three paradigms with partial coverage of the problem.

**Durable workflow engines** (Temporal, Cadence, Airflow, Argo) treat nesting and concurrency as architectural features. Temporal's parent-child model uses isolated Event Histories with asynchronous Signal communication and a tripartite **Parent Close Policy** (TERMINATE / REQUEST_CANCEL / ABANDON) for coupling semantics. Airflow's SubDagOperator is the canonical failure case: pause state did not propagate from parent to sub-DAGs because they ran via a BackfillJob that ignored the `is_paused` field (Airflow PR #5283). Airflow deprecated nesting entirely in favor of flat TaskGroup — an instructive precedent for what happens when coupling semantics are not designed in.

**Hierarchical state machines** (Harel 1987; SCXML, W3C 2015; XState) provide formal abstractions: hierarchy (being in a substate entails being in the superstate), orthogonal regions (concurrent independent states), and the **history pseudostate** (restoring the previously active configuration on re-entry — shallow for one level, deep for recursive restoration). The history pseudostate is the formal model for "resume a cycle where it was paused."

**Schema evolution** (Protobuf, Flyway/Liquibase) handles the migration problem. Temporal's `patched()`/`getVersion` API is the industry standard: insert a marker in the execution's history at a branch point; new executions take the new path; existing ones replay the old. The "grandfathered rule" pattern (Microsoft Dynamics 365, Atlassian Connect) is well-precedented for pre-existing instances: active legacy rules continue under the old enforcement regime until explicitly upgraded.

### The in-progress gate case

BPMN's distinction between **interrupting and non-interrupting boundary events** maps the gate-in-progress friction precisely. The Stop hook currently operates as an interrupting boundary event — it cancels the activity when triggered. The gate-in-progress scenario calls for non-interrupting behavior — the gate conversation continues; enforcement is deferred. This makes the fix **primarily a hook-behavior change**: the Stop hook needs a non-interrupting predicate ("if the current cycle has an active gate conversation, defer enforcement"). A schema field (`In-progress gate: true`) is enabling infrastructure; the hook logic is the fix. Backward compatibility is preserved by treating the absent field as `false`.

### Scope-adaptive enforcement

"Scope-adaptive enforcement" is not a named design pattern. The patterns exist as compositions of general tools: Liquibase preconditions with `onFail: CONTINUE` (a migration step checks its own applicability and silently skips if not met), feature flag hierarchy (a parent flag disables all dependent flags), and OPA/Rego (policy-as-code with full access to context). Based on these precedents, a design judgment follows: smaller-scoped cycles likely need enforcement that gracefully recognizes its own inapplicability — composing existing primitives — rather than a fundamentally different enforcement architecture. The literature does not resolve whether this compositional approach is architecturally equivalent to a dedicated enforcement tier; this is a design judgment, not a finding.

### Graduation has no analog

RDD's graduation operation — folding knowledge into native docs, then dissolving the RDD scaffolding — has no direct equivalent in any reviewed system. Workflow "completion" is terminal with optional output. Graduation involves knowledge transfer to a different representational substrate followed by dissolution. Temporal's Continue-As-New carries state into a fresh execution but retains workflow identity; graduation dissolves it. This is genuinely novel.

### Implication for RDD

The methodology needs: (1) a multi-cycle schema in `cycle-status.md` supporting concurrent/nested/paused cycles with explicit coupling semantics, (2) a non-interrupting predicate in the Stop hook for in-progress gate conversations, (3) scope-adaptive enforcement using precondition-style applicability checks (not a separate enforcement tier), and (4) a migration strategy for pre-ADR-072 cycles using the grandfathered-rule pattern.

---

## 6. Research-Phase Anchoring (#16)

### The gap

When the research phase begins in a context where implementation artifacts already exist, the research unconsciously narrows to "how do we integrate with what exists?" rather than "what's the simplest way to solve the underlying need?" The existing artifacts become constraints in the solution space before the research can question whether they should be.

### Three simultaneous mechanisms

The behavioral-decision literature identifies at least three mechanisms operating simultaneously, with different intervention implications.

**Selective accessibility** (Strack & Mussweiler 1997): the existing artifact activates information consistent with it, so the research retrieves artifact-consistent considerations as its informational basis. This operates before deliberate reasoning. **Anchoring-and-adjustment** (Epley & Gilovich 2006): for self-generated anchors — critically, practitioners who co-designed the existing implementation — adjustment terminates at the first plausible value, not the accurate one. The practitioner is in a *stronger* anchoring condition than the experimenter-provided anchor studied in most lab research. **Pre-semantic priming** (Tulving & Schacter 1990; Bargh & Chartrand 1999): existing artifacts make solution categories available before the researcher is aware of the influence. This component is not accessible to instruction.

**Design fixation** (Jansson & Smith 1991; Chrysikou & Weisberg 2005) confirms in design research that instruction-based intervention fails to override prior-example influence at the analogical level. Participants reproduce analogical similarities from a prior example even when explicitly told to avoid its problematic features. This directly extends Essay 013's finding that the hard dimension of sycophancy is entangled at a level prompt instructions cannot reach.

### Why structural intervention is prioritized

The pre-registration movement provides the strongest evidence. Scheel, Schijen and Lakens (2021) found that 44% of Registered Reports yield significant results versus 96% of traditional publications — a comparison that reflects the compound effect of several methodological protections (including publication bias reduction, HARKing prevention, and question-formation constraint), consistent with pre-specification structurally constraining bias at the question-formation stage among other confounds. PRISMA-S requires peer-reviewed search strategies before execution, preventing the known literature from shaping the search terms that will retrieve it.

Counterfactual mindset induction (Galinsky & Moskowitz 2000) operates at a different intervention point: broadening the accessible solution space before specific judgments form ("imagine this implementation didn't exist — what problem would you be solving?"). This is an intervention at the information-gathering phase, not the judgment-correction phase.

Ecological validity is poor in the relevant condition. Expert judicial anchoring (Englich, Mussweiler & Strack 2006) — judges anchored by irrelevant, randomly generated numbers despite 10+ years of experience — is the more accurate analogy to the practitioner condition than standard lab anchoring studies. The practitioner with substantial prior investment in existing artifacts is in this high-investment condition, not the standard lab condition where most debiasing research is conducted.

### Implication for RDD

The research phase should adopt a structural intervention at the question-formation stage: research questions should be formed before the existing artifact corpus is consulted, with the question set treated as an artifact requiring external review (the research-methods-reviewer dispatch already serves this role). The existing Inversion Principle should be augmented with a constraint-removal prompt at research entry: "What if [key infrastructure component] weren't available? How would the problem be solved then?" — following the pre-registration model of specifying questions before consulting evidence.

---

## 7. Cross-Cutting: Do #13 and #16 Share a Mechanism? (X.1)

The provisional answer, formed before the per-track research ran, hypothesized that both issues share a common mechanism — existing-context gravity narrowing content selection — but require different intervention points because the mechanism activates at different pipeline stages.

The research strengthens this answer while adding nuance.

**The mechanism is the same family.** Selective accessibility, priming, functional fixedness, and Einstellung all involve existing context making certain information more available and other information less visible. At the BUILD end (#13), the specific pathway is **attentional inhibition** triggered by pattern recognition — fast, automatic, and pre-reflective. At the RESEARCH end (#16), the pathway is **question-scope entrenchment** operating at a deliberative level. These patterns are consistent with distinguishable empirical signatures — the BUILD case matches the attentional-suppression pattern from Bilalic et al.'s eye-tracking evidence (features present in the artifact trail but not attended to); the RESEARCH case matches the question-scope-limitation pattern from the pre-registration literature (questions that were not formulated) — though neither has been tested in software-development or research-phase contexts directly.

**The intervention types are probably the same; the intervention points differ.** Both tracks benefit from structural constraint (isolation from the anchoring context before the question forms or the pattern is applied). Track #16 requires question-isolation before artifact consultation. Track #13 requires applicability verification before pattern application. The structural approach (constrain the context) is the same; the pipeline stage where it fires is not. Shared mechanism does not imply unified procedural home — it implies the Inversion Principle needs reliable triggers at both stages.

The research-methods reviewer's pre-research recommendation to test this hypothesis, rather than assume it, proved valuable. The per-track findings could be read as supporting unification ("it's all anchoring") or separation ("attention inhibition is mechanistically distinct from question-scope entrenchment"). The honest report: the mechanism family is shared, the specific pathways are distinguishable, and the intervention design should treat them as the same *kind* of problem requiring different *placement* in the pipeline.

---

## 8. Issues Requiring No Research: #10 and #15

**Issue #10 (lifecycle composition in BUILD)** — ADR-071 shipped the proposed mitigations in Cycle 015. This cycle's BUILD phase will exercise those additions in practice. If the stewardship extensions function as specified — prompting for shared mutable state at module boundaries and lifecycle sequences in composable tests — the issue closes with field evidence. If rough spots surface, they become new evidence.

**Issue #15 (PostToolUse dispatch regex defect)** — The dispatch logger's regex requires plain-text `Output path:` lines; markdown-formatted variants (bold, backticked, list-item) fail to match, producing `expected_path: null` in the dispatch log. The compound check treats this as metadata-missing and blocks with a fabrication-suspicion message even when the dispatch was legitimate. The fix is a regex extension matching common markdown variants, validated against the seven test fixtures specified in the issue body. This is a specification-execution gap (the same failure-mode class as Cycle 10's WP-F findings) and requires no research — only implementation.

---

## 9. The Batch Cycle as Data for #14

This cycle is itself a live experiment in multi-cycle composition. The batch format — seven distinct issues at varying research depth in a single `cycle-status.md` — tests whether the single-cycle schema can hold a non-standard shape. Observations to date:

**The depth calibration worked.** Reconnaissance tracks (#11, #12) returned useful findings with lighter investment. Investigative tracks (#14, #16) warranted and received deeper treatment. The research-methods reviewer's recommendation to allocate depth explicitly before beginning — resisting the batch format's pressure toward equal treatment — proved correct.

**The question set was large but manageable.** Twenty-one questions across five tracks plus one pre-research question. The parallel lit-reviewer dispatch model (one agent per track, running concurrently) kept the research phase from becoming sequential bottleneck.

**The cross-track coherence check was necessary.** The reviewer flagged that Tracks #14 and #11 might produce incoherent recommendations. Post-research assessment: they are compatible. Scope-adaptive enforcement (#14) governs which checks fire; acceptance criteria traceability (#11) governs what gets verified when checks do fire.

**The unforced-theme discipline held.** The cross-cutting observation (methodology seams as a common pattern) emerged from the research rather than being imposed on it. The X.1 hypothesis was provisionally answered before the research, tested against findings, and refined — not assumed. The batch format did not force artificial coherence.

**What the batch format does not test:** multi-cycle nesting (this is one cycle, not nested cycles), pause/resume across sessions (this cycle ran continuously), or hook-state handling under concurrent cycles. These remain open questions for #14's eventual implementation.

---

## 10. Implications for the Methodology

The research across five tracks produces design recommendations at three levels, ordered by enforcement strength. The cognitive mechanism (Einstellung, anchoring) is likely causally prior — it is the reason seams go unnoticed — but it is the hardest to enforce structurally (Invariant 8). Structural and enforcement fixes are the first line of defense because they are verifiable and mechanically anchored. Cognitive-mechanism fixes are a second line — worth building because they address the root, but not the layer to rely on alone.

### First line: Artifact-boundary design (what the seams need)

- **DECIDE:** produce a cycle acceptance criteria table with layer-match verification targets (Issue #11). Formalize ADR body immutability, status mutability, and the supersession workflow with downstream document update triggers (Issue #12).
- **ARCHITECT:** decompose qualitative fitness claims into testable properties (Issue #13, contributing factor).
- **BUILD:** verify each acceptance criteria table entry at the specified layer (Issue #11). Add an applicability check at the point of pattern reuse (Issue #13). Generate preservation scenarios alongside behavior scenarios (Issue #13).

### First line: Structural-enforcement design (what the hooks need)

- **Stop hook:** non-interrupting predicate for in-progress gate conversations (Issue #14). Scope-adaptive enforcement using precondition-style applicability checks (Issue #14).
- **Dispatch logger:** regex extension for markdown-formatted `Output path:` lines (Issue #15).
- **Migration:** grandfathered-rule pattern for pre-ADR-072 cycles (Issue #14).
- **Multi-cycle schema:** concurrent/nested/paused cycle support in `cycle-status.md` with explicit coupling semantics (Issue #14).

### Second line: Cognitive-mechanism design (what the questioning needs)

These interventions address the root cause — existing context narrowing attention before structural checks fire — but operate conversationally and cannot be mechanically enforced to the same standard as artifact checks or hook predicates. They are the second line of defense: valuable when they trigger, but the methodology should not depend on them alone.

- **RESEARCH entry:** question-isolation protocol — form questions before consulting the artifact corpus, with external review of the question set (Issue #16, extending the existing research-methods-reviewer dispatch).
- **BUILD entry:** applicability-check protocol — when reusing a pattern, require explicit comparison with at least one structural alternative before application (Issue #13, operationalizing the Einstellung finding).
- **Inversion Principle:** augment with a constraint-removal prompt at research entry ("What if this didn't exist?") and an applicability prompt at BUILD pattern-reuse moments ("What assumption of the original doesn't hold here?"). These are the same kind of intervention (structural isolation from anchoring context) placed at different pipeline stages.

---

## References

Adzic, G. (2020). Specification by Example, 10 Years Later. gojko.net.

Bargh, J. A. & Chartrand, T. L. (1999). The Unbearable Automaticity of Being. *American Psychologist*, 54(7), 462-479.

Bilalic, M., McLeod, P. & Gobet, F. (2008). Why Good Thoughts Block Better Ones: The Mechanism of the Pernicious Einstellung Effect. *Cognition*, 108(3), 652-661.

Bilalic, M., McLeod, P. & Gobet, F. (2010). The Mechanism of the Einstellung (Set) Effect: A Pervasive Source of Cognitive Bias. *Current Directions in Psychological Science*, 19(2), 111-115.

Brown, W. J. et al. (1998). *AntiPatterns: Refactoring Software, Architectures, and Projects in Crisis*. Wiley.

Chrysikou, E. G. & Weisberg, R. W. (2005). Following the Wrong Footsteps: Fixation Effects of Pictorial Examples in a Design Problem-Solving Task. *Journal of Experimental Psychology: Learning, Memory, and Cognition*, 31(5), 1134-1148.

Englich, B., Mussweiler, T. & Strack, F. (2006). Playing Dice With Criminal Sentences: The Influence of Irrelevant Anchors on Experts' Judicial Decision Making. *Personality and Social Psychology Bulletin*, 32(2), 188-200.

Epley, N. & Gilovich, T. (2006). The Anchoring-and-Adjustment Heuristic: Why the Adjustments Are Insufficient. *Psychological Science*, 17(4), 311-318.

Fowler, M. (2023). Architecture Decision Record. martinfowler.com.

Galinsky, A. D. & Moskowitz, G. B. (2000). Counterfactuals as Behavioral Primes: Priming the Simulation Heuristic and Consideration of Alternatives. *Journal of Experimental Social Psychology*, 36(4), 384-409.

Gamma, E., Helm, R., Johnson, R. & Vlissides, J. (1994/1995). *Design Patterns: Elements of Reusable Object-Oriented Software*. Addison-Wesley.

Gentner, D. (1983). Structure-Mapping: A Theoretical Framework for Analogy. *Cognitive Science*, 7(2), 155-170.

Gentner, D., Loewenstein, J. & Thompson, L. (2003). Learning and Transfer: A General Role for Analogical Encoding. *Journal of Educational Psychology*, 95(2), 393-408.

Harel, D. (1987). Statecharts: A Visual Formalism for Complex Systems. *Science of Computer Programming*, 8(3), 231-274.

Jansson, D. G. & Smith, S. M. (1991). Design Fixation. *Design Studies*, 12(1), 3-11.

Klein, G. (2007). Performing a Project Premortem. *Harvard Business Review*, 85(9), 18-19.

Luchins, A. S. (1942). Mechanization in Problem Solving: The Effect of Einstellung. *Psychological Monographs*, 54(6), i-95.

Metz, S. (2016). The Wrong Abstraction. sandimetz.com.

Morewedge, C. K. et al. (2015). Debiasing Decisions: Improved Decision Making With a Single Training Intervention. *Policy Insights from Behavioral and Brain Sciences*, 2(1), 129-140.

Mussweiler, T., Strack, F. & Pfeiffer, T. (2000). Overcoming the Inevitable Anchoring Effect. *Personality and Social Psychology Bulletin*, 26(9), 1142-1150.

Nosek, B. A. et al. (2018). The Preregistration Revolution. *PNAS*, 115(11), 2600-2606.

Nygard, M. T. (2011). Documenting Architecture Decisions. Cognitect blog.

Scheel, A. M., Schijen, M. R. M. J. & Lakens, D. (2021). An Excess of Positive Results: Comparing the Standard Psychology Literature With Registered Reports. *Advances in Methods and Practices in Psychological Science*, 4(2).

RTCA. (2011). DO-178C: Software Considerations in Airborne Systems and Equipment Certification.

Simon, H. A. (1956). Rational Choice and the Structure of the Environment. *Psychological Review*, 63(2), 129-138.

Sommerville, I. (2010). *Software Engineering*, 9th ed. Addison-Wesley.

Strack, F. & Mussweiler, T. (1997). Explaining the Enigmatic Anchoring Effect: Mechanisms of Selective Accessibility. *Journal of Personality and Social Psychology*, 73(3), 437-446.

Tulving, E. & Schacter, D. L. (1990). Priming and Human Memory Systems. *Science*, 247(4940), 301-306.

Zhu, H. et al. (1997). Software Unit Test Coverage and Adequacy. *ACM Computing Surveys*, 29(4), 366-427.
