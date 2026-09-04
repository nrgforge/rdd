# Lit-Review 020 (Loop 3): Graduation-Pain Structural Character

*Date:* 2026-05-22
*Method:* Systematic literature search — four targeted research questions; 17 sources reviewed; Loop 2 Q6 findings treated as established background (not re-derived here).

---

## Synthesis

The literature does not support the claim that graduation-pain is structurally unique to the graduation moment. Instead, the evidence converges on a **class of high-element-interactivity synthesis moments** — onboarding, architectural handoffs, gate reviews, methodology graduation — that share the same structural cause: readers are required to hold and integrate multiple cross-referential elements simultaneously rather than consulting artifacts one-by-one for a narrow task. Brooks (1975/1995) named the knowledge-transfer cost at entry moments; Sweller (2010) and Chandler & Sweller (1992) supply the mechanism (element interactivity, split-attention effect); van Merriënboer & Sweller (2005) extend it to holistic-versus-part-task instruction. Empirical software-engineering work — Dagenais et al. (2010), Steinmacher et al. (2015), Rukmono et al. (2025) — confirms that architectural comprehension and newcomer onboarding are structurally hard for the same reasons: readers need decision rationale, system overview, and cross-artifact coherence simultaneously, not incrementally. The one structural asymmetry favoring graduation-pain as the acute case is **corpus completeness**: at graduation the entire accumulated corpus must be traversed holistically, whereas mid-cycle gate reviews are bounded by the artifacts relevant to the current decision. This asymmetry is real but matters most when the corpus has not been compacted; it is a **quantitative difference** (corpus breadth) rather than a categorical one (different structural mechanism).

---

## Four Research Questions and Findings

### Q1: Brooks' Onboarding Cost and Descendant Literature

**CONFIDENCE: HIGH** (primary source well-documented; descendant literature converges)

**Brooks (1975/1995).** In *The Mythical Man-Month* (1st ed. 1975; 20th anniversary ed. Addison-Wesley, 1995), Brooks identifies two structural causes of new-team-member cost: (1) the newcomer must acquire knowledge embedded in work that preceded them, consuming the time of existing team members; (2) communication channels grow super-linearly with team size, so each addition raises coordination overhead. The ramp-up period spans "several weeks or months" before a newcomer contributes positively. Brooks does not distinguish tacit from explicit knowledge in analytical terms, but the mechanism he describes is tacit-knowledge transfer: the knowledge that must move lives in team members' heads, not in formal documentation. Documentation reduces but does not eliminate this cost — the Wikipedia article on Brooks's Law cites the original 1995 text noting that a clear task specification reduces ramp-up time, implying incompletely specified work is the heavier cost driver.

**Dagenais, Ossher, Bellamy, Robillard, de Vries (2010).** "Moving into a new software project landscape." *Proceedings of ICSE 2010*, pp. 275–284. Grounded theory study with 18 newcomers across 18 IBM projects. Three primary factors influence integration quality: early experimentation, internalizing structures and cultures, and progress validation. The landscape metaphor is significant: the project environment has topology that newcomers must form a spatial-cognitive map of before they can navigate it effectively. The study does not compare mid-project consultation to entry-moment onboarding directly, but its design (all participants at the entry moment) implicitly treats initial landscape comprehension as qualitatively distinct from routine task consultation.

**Steinmacher, Graciotto Silva, Gerosa, Redmiles (2015).** Systematic literature review, 58 newcomer barriers to open source contribution, including: information overload (excessive documentation creating cognitive burden); spread documentation (guidance scattered across disconnected locations). Santos, Felizardo, Steinmacher, & Gerosa (2023) — a follow-on SLR on software solutions for newcomer onboarding — confirms that these barriers remain active in 2023, with solutions emphasizing contextual guidance (task-triggered) rather than corpus consolidation. *arXiv* 2408.15989.

**Implication for cycle.** Brooks and the descendant empirical literature treat entry-moment onboarding as a structurally heavy knowledge-transfer moment. The mechanism is corpus-breadth-plus-tacit-knowledge-density, not a property unique to any specific methodology type. RDD graduation is the methodology's analog of project onboarding: the same breadth-density structure obtains.

---

### Q2: Cognitive Load at Synthesis Moments — Holistic vs. Task-Triggered Reading

**CONFIDENCE: HIGH** (foundational CLT literature; mechanism well-established; direct application to documentation is inferential transfer, not direct experiment)

**Sweller (1988).** "Cognitive load during problem solving: Effects on learning." *Cognitive Science*, 12, 257–285. Establishes that working memory is limited in capacity and that tasks requiring simultaneous processing of multiple interacting elements produce high intrinsic cognitive load. The foundation for all subsequent element-interactivity claims.

**Sweller (2010).** "Element interactivity and intrinsic, extraneous, and germane cognitive load." *Educational Psychology Review*, 22(2), 123–138. DOI: 10.1007/s10648-010-9128-5. The key formalization: "Elements that interact cannot be processed and learned in isolation but must be simultaneously processed together if they are to be understood. The number of elements that must be simultaneously processed in this manner determines cognitive load." High element interactivity is the structural definition of what makes a task cognitively costly. A documentation corpus where each artifact cross-references others — where Artifact A cannot be understood without simultaneously holding Artifact B's content — is exactly the high-element-interactivity condition Sweller describes. *This is the mechanism for both graduation-pain and mid-cycle gate review pain.*

**Chandler & Sweller (1992).** "The split-attention effect as a factor in the design of instruction." *British Journal of Educational Psychology*, 62, 233–246. Empirical demonstration: when mutually-referring information sources are physically separated, readers must mentally integrate them before understanding is possible. This integration process consumes working memory capacity that would otherwise support learning/reasoning. Experiment 2 (separated text segments in psychology empirical reports) demonstrates the effect extends beyond text+diagram scenarios to *any* case where mutually-referring sources are not co-located. **Directly applicable to cross-referential documentation language** (e.g., "invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing") — the reader must fetch two remote referents and hold their semantic content simultaneously with the current proposition. Each such reference is an additional interacting element.

**van Merriënboer & Sweller (2005).** "Cognitive load theory and complex learning: Recent developments and future directions." *Educational Psychology Review*, 17(2), 147–177. DOI: 10.1007/s10648-005-3951-0. Establishes that complex learning tasks — those requiring coordination of multiple constituent skills — are structurally harder when approached holistically (all elements must be simultaneously active) than when task-triggered consultation is possible (only the relevant element is active). The whole-task condition is the high-load condition. A holistic synthesis moment (graduation, new-hire onboarding, architectural overview session) is a whole-task condition; task-triggered documentation consultation is a part-task condition.

**van Merriënboer & Kester (2008).** "Whole-task models in education." In *Handbook of Research on Educational Communications and Technology*, 3rd ed. The 4C/ID model proposes that holistic overview *precedes* detail acquisition for complex learning — not because overview reduces element interactivity, but because a structural map of the whole reduces the cognitive cost of integrating each part as it is encountered. This is the positive framing: holistic synthesis need not be the acute high-load case if a suitable overview scaffold is available. The implication for the cycle: an overview artifact reduces synthesis-moment load by pre-caching the structural map, so elements are retrieved into an existing schema rather than being assembled from scratch.

**Paas & van Merriënboer (1994).** "Instructional control of cognitive load in the training of complex cognitive tasks." *Educational Psychology Review*, 6, 351–372. Measurement of cognitive load and the variability effect. Supporting citation confirming the element-interactivity framework across the collaborative stream.

**SCOPE QUALIFICATION.** The CLT literature originates in instructional design, not software documentation. The transfer to documentation-corpus navigation is analogical: the structural conditions (high element interactivity; mutual reference requiring simultaneous processing) are present in both domains, but no experiment directly measures cognitive load during ADR corpus navigation. The mechanism is well-established; the domain-specific measurement is absent.

---

### Q3: Mid-Cycle vs. Graduation Overwhelm — Empirical Comparison

**CONFIDENCE: MEDIUM** (no direct experimental comparison found; evidence is pattern-convergent rather than direct)

No paper in the literature directly compares documentation-friction at mid-cycle gate moments vs. handoff/graduation moments on the same subjects or corpus. The empirical question has not been explicitly posed as a research question in the software engineering literature reviewed.

**What the literature does supply:**

**Rukmono, Zamfirov, Ochoa, Pex, & Chaudron (2025).** "An Explanation of Software Architecture Explanations." *Empirical Software Engineering* (Springer); arXiv 2503.08628. Semi-structured interviews, 17 professionals. Onboarding was expected as the dominant scenario for architecture explanations but appeared in only 4 of 8 explainee interviews. Other scenarios: architecture evaluation/audit, cross-team collaboration, client-facing explanations. The study identifies four distinct explanation contexts — onboarding, research/legacy-examination, solution-proposal, and architectural evaluation — each with structurally different explanation needs. *This is the closest empirical work to a direct comparison: Rukmono et al. find that all four contexts require decision rationale and cross-artifact coherence, but they do not report a difference in cognitive cost between contexts.* The explanation needs are structurally similar across contexts; the difference is in corpus scope — onboarding requires the widest corpus, and architectural evaluation is bounded to the evaluated scope. The structural driver (needing decision rationale + cross-artifact coherence) is the same across contexts.

**Dagenais et al. (2010)** (see Q1) treats entry-moment landscape comprehension as requiring overview-before-detail — a property that task-triggered mid-project consultation does not require. This is indirect evidence that the *scope* differs: the entry moment requires a complete landscape map; mid-project consultation requires a local map. The structural mechanism (element interactivity) is identical; the number of simultaneously active elements differs.

**Nogueira, Silva, & Conte (2026).** "One Size Fits All? An Empirical Comparison of ADR Templates regarding Comprehension, Usability, and Ease of Adoption." *arXiv* 2604.27333v1. Controlled experiment with 33 students comparing 5 ADR templates. Finds that structural minimalism (Nygard template) outperforms structural completeness (MADR) on comprehension score (median 0.8 vs. 0.7, Wilcoxon p=0.002, Cliff's Delta=0.64). The study does not compare corpus-level navigation with single-ADR reading, but the result is suggestive: even for a single ADR, completeness-oriented structure raises cognitive demand. Extrapolating to corpus scale: a 98-ADR corpus with MADR-style completeness per record compounds this effect across every record.

**Steinmacher et al. (2015) and Santos et al. (2023)** identify information overload and spread documentation as barrier categories that are most acute at project entry, not at mid-project task-triggered moments. This supports the view that corpus-breadth-at-entry is the high-load condition, while task-triggered consultation is the lower-load condition.

**Pattern conclusion.** The empirical literature does not supply a direct measurement that graduation-pain is categorically different from mid-cycle synthesis moments. It does supply consistent pattern-level evidence that: (a) the structural mechanism is the same across all synthesis moments (element interactivity at holistic corpus scope); (b) the scope of the corpus required is the differentiator — graduation requires the whole corpus simultaneously, while mid-cycle moments are bounded; (c) scope difference is quantitative (more elements simultaneously), not categorical (different mechanism). Graduation is the most acute case because it requires the widest simultaneous corpus access, but any moment requiring whole-corpus synthesis shares the mechanism.

**SCOPE QUALIFICATION.** This conclusion is inferential: it is derived from combining CLT mechanism evidence with contextual scope descriptions from empirical software engineering studies. No study has directly measured cognitive load at graduation vs. gate review on the same practitioner.

---

### Q4: Cross-Referential Vocabulary Friction in Technical Communication

**CONFIDENCE: HIGH** (split-attention effect is directly applicable; technical-communication specifics are inferential)

**Chandler & Sweller (1992)** (full citation above). The split-attention effect provides the clearest mechanism for cross-referential vocabulary friction. Experiment 2 specifically tests separated *text* segments — not text+diagrams — demonstrating that the cognitive penalty applies when "mutually referring segments of text are conventionally separated." The user's specific friction example — "invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing" — maps precisely to this condition: the reader must (a) retrieve "invariant 9" from one artifact, (b) retrieve "ADR-014 §C.4" from a second artifact, (c) hold both semantic contents in working memory simultaneously, and (d) evaluate the implication. Each identifier reference is a split-attention event.

**Sweller (2010)** formalizes the mechanism: each identifier reference that cannot be understood in isolation is an "interacting element." If resolving the implication requires simultaneously holding invariant 9, ADR-014 §C.4, and "the NL constraint" as active semantic contents, the intrinsic cognitive load is determined by the number of interacting elements — here, at minimum three. This is a high-interactivity condition by the theory's own definition.

**Knuth (1984).** "Literate Programming." *The Computer Journal*, 27(2), 97–111. (Relevant background on cross-reference as documentation mechanism.) Knuth's WEB system embeds cross-references at the source level, producing bidirectional indices automatically. The design intent is to minimize the cost of reference resolution by co-locating references and their targets as much as possible — a structural mitigation for split-attention cost. The implication: cross-referential density is not intrinsically friction-producing; it is friction-producing specifically when reference resolution requires navigating away from the current reading context. Knuth's design addresses this by making the reference resolution automatic and co-located.

**Shneiderman (1996).** "The eyes have it: A task by data type taxonomy for information visualizations." *Proceedings of the IEEE Symposium on Visual Languages*, pp. 336–343. The Visual Information-Seeking Mantra — "overview first, zoom and filter, then details-on-demand" — specifies the navigation affordance that minimizes cross-referential friction: the reader arrives at a detail via a structured traversal that retains context, rather than via a cold reference that requires simultaneously holding multiple remote contents. When the corpus affords this traversal (overview → relevant subset → detail), the cross-reference cost is reduced because the structural map is pre-cached. When the corpus does not afford it (flat list of N ADRs; cross-references only via identifier strings), each reference lookup is a cold traversal — maximum split-attention cost.

**Tufte (1983, 1990).** *The Visual Display of Quantitative Information* (1983); *Envisioning Information* (1990). Tufte's small-multiples principle is structurally relevant: small multiples work precisely because they allow comparative reading *without* cross-referential navigation — the reader holds multiple instances in simultaneous view. The principle generalizes: information density becomes friction (rather than efficiency) when density requires serial reference lookups rather than simultaneous visual comparison. ADR cross-references are serial reference lookups; a derived overview surface with multiple ADRs visible simultaneously is the small-multiples analog.

**Mayer (2001, 2009).** *Multimedia Learning*. Cambridge University Press. The spatial contiguity principle: people learn better when corresponding words and pictures are presented near each other rather than far apart. Operationally extends to text: when a cross-reference and its referent are not co-located, cognitive cost is incurred. Relevant to the user's friction: "ADR-014 §C.4" is a reference that requires navigating to a remote document — maximum spatial non-contiguity.

**LaToza & Myers (2010).** "Hard-to-answer questions about code." *PLATEAU Workshop, SPLASH 2010*. Empirically identifies that questions about code are hard to answer when they require integrating information across multiple artifacts or resolving causal chains across the codebase. The hardest questions are those requiring "global" answers — analogous to holistic synthesis — rather than local task-triggered lookups. While this paper addresses code rather than documentation, the mechanism (cross-artifact integration as difficulty driver) is identical.

**SCOPE QUALIFICATION.** The direct empirical link between cross-referential documentation vocabulary (identifier-dense prose like "invariant 9 + ADR-014 §C.4") and measurable cognitive cost has not been tested in a controlled experiment on software practitioners. The mechanism is well-established via split-attention theory and element-interactivity theory; the domain-specific measurement is absent.

---

## Verdict on the Cycle's Question

**Graduation-pain is not structurally unique; it is the most acute case of a pattern that operates at every holistic-synthesis moment in the methodology lifecycle.** The structural mechanism — high element interactivity requiring simultaneous processing of cross-referential corpus elements — is the same across all synthesis moments: entry-moment onboarding (Brooks 1975/1995; Dagenais et al. 2010), architectural review sessions (Rukmono et al. 2025), and methodology graduation. The differentiating factor is *corpus scope*: graduation requires the widest simultaneous corpus access (the entire accumulated artifact trail), whereas mid-cycle gate reviews are bounded to the artifacts relevant to the current decision. This makes graduation the highest-load instance quantitatively, not categorically. The split-attention effect (Chandler & Sweller 1992) and element-interactivity theory (Sweller 2010) provide the mechanism at both scales; neither theory predicts a qualitative threshold at graduation.

**SCOPE QUALIFICATION.** No direct empirical comparison of cognitive load at graduation vs. mid-cycle gate review in the same practitioner has been conducted. The verdict is derived by combining CLT mechanism evidence (high confidence) with contextual-scope descriptions from empirical software engineering studies (medium confidence as domain transfer). A direct measurement study would be required to confirm the quantitative difference in load between the two moment-types.

---

## Implication for the Cycle's Amendment Scope

The evidence supports a **methodology-wide amendment**, not a graduation-scoped one. If the structural mechanism (high element interactivity at synthesis moments) is the same at graduation and at mid-cycle gate reviews, then an amendment that only compacts the corpus at graduation leaves the gate-review friction unaddressed. The user's own friction example — "invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing" — is gate-conversation language, not graduation language, which already anticipated this conclusion before the research was conducted.

The Shneiderman (1996) mantra, van Merriënboer & Kester (2008) on pre-caching structural maps, and Chandler & Sweller (1992) on co-location all point to the same structural remedy: a substrate architecture that affords overview-first navigation and co-locates cross-references with their referents at the point of use. This remedy operates at any synthesis moment, not only at graduation. The argument for a graduation-scoped amendment would require evidence that mid-cycle synthesis moments are structurally different — not merely smaller in corpus scope. That evidence is absent.

**The alternative framing the evidence does not rule out:** graduation may warrant an additional, specific move (thematic consolidation scaffolding, as Loop 1 identified) that is not required at mid-cycle moments, because graduation is the moment when the scaffolding comes down and the corpus must be folded into native docs. This is a graduation-specific *operational move* that a methodology-wide substrate amendment does not itself provide. The amendment scope is methodology-wide; a graduation-specific operational procedure may be additive, not instead-of.

---

## References

1. **Brooks, F.P., Jr.** (1975/1995). *The Mythical Man-Month: Essays on Software Engineering* (Anniversary ed.). Addison-Wesley.

2. **Chandler, P., & Sweller, J.** (1992). The split-attention effect as a factor in the design of instruction. *British Journal of Educational Psychology*, 62, 233–246.

3. **Dagenais, B., Ossher, H., Bellamy, R.K.E., Robillard, M.P., & de Vries, J.P.** (2010). Moving into a new software project landscape. *Proceedings of the 32nd ACM/IEEE International Conference on Software Engineering (ICSE 2010)*, Vol. 1, pp. 275–284.

4. **Knuth, D.E.** (1984). Literate programming. *The Computer Journal*, 27(2), 97–111.

5. **LaToza, T.D., & Myers, B.A.** (2010). Hard-to-answer questions about code. *Proceedings of the PLATEAU Workshop, SPLASH 2010*.

6. **Mayer, R.E.** (2001/2009). *Multimedia Learning* (1st/2nd ed.). Cambridge University Press.

7. **Nogueira, F., Silva, N., & Conte, T.** (2026). One size fits all? An empirical comparison of ADR templates regarding comprehension, usability, and ease of adoption. *arXiv* 2604.27333v1.

8. **Paas, F.G.W.C., & van Merriënboer, J.J.G.** (1994). Instructional control of cognitive load in the training of complex cognitive tasks. *Educational Psychology Review*, 6, 351–372.

9. **Rukmono, S.A., Zamfirov, F., Ochoa, L., Pex, F., & Chaudron, M.R.V.** (2025). An explanation of software architecture explanations. *Empirical Software Engineering* (Springer); arXiv 2503.08628.

10. **Santos, I., Felizardo, K.R., Steinmacher, I., & Gerosa, M.A.** (2023). Software solutions for newcomers' onboarding in software projects: A systematic literature review. *arXiv* 2408.15989.

11. **Shneiderman, B.** (1996). The eyes have it: A task by data type taxonomy for information visualizations. *Proceedings of the IEEE Symposium on Visual Languages*, pp. 336–343.

12. **Steinmacher, I., Graciotto Silva, M.A., Gerosa, M.A., & Redmiles, D.F.** (2015). A systematic literature review on the barriers faced by newcomers to open source software projects. *Information and Software Technology*, 59, 67–85.

13. **Sweller, J.** (1988). Cognitive load during problem solving: Effects on learning. *Cognitive Science*, 12, 257–285.

14. **Sweller, J.** (2010). Element interactivity and intrinsic, extraneous, and germane cognitive load. *Educational Psychology Review*, 22(2), 123–138. DOI: 10.1007/s10648-010-9128-5.

15. **Tufte, E.R.** (1983). *The Visual Display of Quantitative Information*. Graphics Press. (1990). *Envisioning Information*. Graphics Press.

16. **van Merriënboer, J.J.G., & Sweller, J.** (2005). Cognitive load theory and complex learning: Recent developments and future directions. *Educational Psychology Review*, 17(2), 147–177. DOI: 10.1007/s10648-005-3951-0.

17. **van Merriënboer, J.J.G., & Kester, L.** (2008). Whole-task models in education. In *Handbook of Research on Educational Communications and Technology* (3rd ed.). Lawrence Erlbaum.

---

## Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Brooks | The Mythical Man-Month | 1975/1995 | Addison-Wesley | Q1 — onboarding cost mechanism |
| 2 | Chandler & Sweller | The split-attention effect as a factor in the design of instruction | 1992 | British Journal of Educational Psychology | Q2, Q4 — split-attention mechanism; cross-reference penalty |
| 3 | Dagenais, Ossher, Bellamy, Robillard, de Vries | Moving into a new software project landscape | 2010 | ICSE | Q1, Q3 — grounded theory of newcomer onboarding |
| 4 | Knuth | Literate programming | 1984 | The Computer Journal | Q4 — cross-reference design as mitigation |
| 5 | LaToza & Myers | Hard-to-answer questions about code | 2010 | PLATEAU/SPLASH | Q4 — cross-artifact integration as difficulty driver |
| 6 | Mayer | Multimedia Learning | 2001/2009 | Cambridge University Press | Q4 — spatial contiguity principle |
| 7 | Nogueira, Silva, & Conte | One size fits all? ADR template comparison | 2026 | arXiv 2604.27333 | Q3 — ADR comprehension; completeness vs. minimalism trade-off |
| 8 | Paas & van Merriënboer | Instructional control of cognitive load | 1994 | Educational Psychology Review | Q2 — supporting CLT citation |
| 9 | Rukmono, Zamfirov, Ochoa, Pex, & Chaudron | An explanation of software architecture explanations | 2025 | Empirical Software Engineering / arXiv | Q3 — multiple explanation contexts; empirical study |
| 10 | Santos, Felizardo, Steinmacher, & Gerosa | Newcomers' onboarding solutions: SLR | 2023 | arXiv 2408.15989 | Q1, Q3 — information overload; spread documentation |
| 11 | Shneiderman | The eyes have it | 1996 | IEEE Symposium on Visual Languages | Q4 — overview-first navigation affordance |
| 12 | Steinmacher et al. | Barriers faced by newcomers to OSS projects | 2015 | Information and Software Technology | Q1, Q3 — 58-barrier model; documentation overload |
| 13 | Sweller | Cognitive load during problem solving | 1988 | Cognitive Science | Q2 — foundational CLT |
| 14 | Sweller | Element interactivity and cognitive load | 2010 | Educational Psychology Review | Q2, Q4 — element-interactivity mechanism |
| 15 | Tufte | The Visual Display of Quantitative Information; Envisioning Information | 1983, 1990 | Graphics Press | Q4 — small multiples; density vs. friction |
| 16 | van Merriënboer & Sweller | CLT and complex learning | 2005 | Educational Psychology Review | Q2 — holistic vs. part-task; whole-task cognitive cost |
| 17 | van Merriënboer & Kester | Whole-task models in education | 2008 | Handbook of Research on Educational Communications | Q2 — overview scaffold reduces synthesis-moment load |

---

## Limitations

1. **No direct experimental measurement of graduation vs. gate-review cognitive load.** The Q3 verdict (methodology-wide pattern) is inferred from CLT mechanism evidence plus contextual-scope descriptions; it has not been confirmed by a direct empirical comparison in the software-methodology domain.

2. **CLT literature as domain transfer.** The cognitive load and split-attention literature originates in instructional design. Application to software documentation corpus navigation is structurally well-motivated but not directly tested in controlled experiments on practitioners navigating ADR corpora.

3. **Cross-referential vocabulary friction (Q4) lacks domain-specific measurement.** No controlled study measuring cognitive load during identifier-dense cross-referential prose in software documentation was found. The mechanism (split-attention at each identifier reference) is theoretically grounded; the domain-specific effect size is unknown.

4. **Rukmono et al. (2025) is a preprint.** Cited as forthcoming in *Empirical Software Engineering*; final peer-reviewed version not yet confirmed at time of search.

5. **Nogueira et al. (2026) is a preprint.** arXiv 2604.27333; not yet peer-reviewed.

6. **Loop 2 Q6 findings treated as background.** Lethbridge, Singer, & Forward (2003); Garousi & Garousi (2013/2014); Forward & Lethbridge (2002); and Gupta et al. (2026) on LLM ADR consumption are established background from Loop 2 and are not re-reviewed here. This review extends Q6 findings; it does not replace them.
