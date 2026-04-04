## Literature Review: Why Pair Programming Works — Cognitive Benefits and Psychological Costs

**Date:** 2026-04-03
**Method:** Systematic literature search across ACM Digital Library, IEEE Xplore, ScienceDirect, PubMed/PMC, Springer, and arXiv. Search terms included: "pair programming cognitive benefits", "pair programming learning mechanisms", "pair programming psychological safety", "pair programming imposter syndrome", "pair programming power dynamics", "collaborative software development knowledge transfer", "driver navigator pair programming cognitive load", and combinations thereof. Supplemented with targeted retrieval of primary papers identified from systematic reviews.

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Cockburn, A. & Williams, L. | The Costs and Benefits of Pair Programming | 2001 | *Extreme Programming Examined* (Addison-Wesley) | Foundational cost-benefit study; cognitive and psychological outcomes |
| 2 | Williams, L., Kessler, R. R., Cunningham, W., & Jeffries, R. | Strengthening the Case for Pair Programming | 2000 | *IEEE Software*, 17(4), 19–25 | Quality, productivity, confidence outcomes in student study |
| 3 | Hannay, J. E., Dybå, T., Arisholm, E., & Sjøberg, D. I. K. | The Effectiveness of Pair Programming: A Meta-Analysis | 2009 | *Information and Software Technology*, 51(7) | Definitive quality and effort meta-analysis across 18 studies |
| 4 | Bryant, S., Romero, P., & du Boulay, B. | Pair Programming and the Mysterious Role of the Navigator | 2008 | *International Journal of Human-Computer Studies*, 66(7) | Empirical study of what driver/navigator roles actually do |
| 5 | Plonka, L., Sharp, H., van der Linden, J., & Dittrich, Y. | Knowledge Transfer in Pair Programming: An In-Depth Analysis | 2015 | *International Journal of Human-Computer Studies*, 73 | Six teaching strategies; novice-expert asymmetry; impediments to transfer |
| 6 | Salleh, N., Mendes, E., & Grundy, J. | Empirical Studies of Pair Programming for CS/SE Teaching in Higher Education: A Systematic Literature Review | 2011 | *IEEE Transactions on Software Engineering*, 37(4), 509–525 | 74-paper synthesis; 14 compatibility factors; skill level as dominant variable |
| 7 | Xu, F. & Correia, A.-P. | Adopting Distributed Pair Programming as an Effective Team Learning Activity: A Systematic Review | 2023 | *Journal of Computing in Higher Education*, PMC9930723 | 23-study review 2010–2020; cognitive, social, and team effectiveness model |
| 8 | Valoý, M. | Psychological Aspects of Pair Programming | 2023 | *EASE 2023*, arXiv:2306.07421 | Mixed-methods study; 35 students, 612 motivation inventories; intrinsic motivation by role |
| 9 | Andersen, Tkalich, Moe, Šmite, Söderbom, Hast, & Stray | Integrating Pair Programming as a Work Practice | 2025 | arXiv:2506.19511 | Industrial single-case study; adoption barriers; social exhaustion; power asymmetry |
| 10 | Flor, N. V. & Hutchins, E. L. | Analysing Distributed Cognition in Software Teams | 1992 | *Empirical Studies of Programmers: Fourth Workshop* | Foundational distributed cognition framing; verbal/non-verbal coordination |
| 11 | Zhong, B., Wang, Q., & Chen, J. | The Impact of Social Factors on Pair Programming in a Primary School | 2016 | *Computers in Human Behavior*, 64 | Gender outcomes; partnership quality as variable |
| 12 | Welter, A., Schneider, N., Dick, T., Weis, K., Tinnes, C., Wyrich, M., & Apel, S. | From Developer Pairs to AI Copilots: A Comparative Study on Knowledge Transfer | 2025 | arXiv:2506.04785 | Human-human vs. human-AI knowledge transfer; scrutiny differences; episode length |
| 13 | Lyu, et al. | Will Your Next Pair Programming Partner Be Human? An Empirical Evaluation of Generative AI as a Collaborative Teammate | 2025 | *ACM Learning @ Scale*, doi:10.1145/3698205.3729544 | Semester-long comparison; AI strengths and limits vs. human partners |
| 14 | Bryant, S. (Freudenberg) | Desirable Pair Programming Behaviours — Tag Team; Undesirable Pair Programming Behaviours — The Thrasher and The Divider | 2013 | Blog posts; summary of PhD findings (University of Sussex) | Behavioral taxonomy of pairing dynamics; power struggle manifestations |
| 15 | Nosek, J. T. | The Case for Collaborative Programming | 1998 | *Communications of the ACM*, 41(3), 105–108 | Early experiment; 40% speed improvement; confidence and enjoyment findings |
| 16 | Mei, Y., Ping, H., & Shen, M. | The Effect of Self-Efficacy and Pair Programming Experience in Learning Results | 2024 | arXiv:2410.15558 (CHI-framed study) | Self-efficacy predicts outcomes; prior pairing experience does not |
| 17 | Fowler, M. & Melnica, L. (eds.) | On Pair Programming | 2019 (updated) | martinfowler.com | Practitioner synthesis; power dynamics taxonomy; Brené Brown and Susan Cain citations |
| 18 | Vanhanen, J. & Lassenius, C. | Effects of Pair Programming at the Development Team Level | 2007 | *Journal of Systems and Software* | Longitudinal professional study; initial skepticism → advocacy pattern |

---

### Synthesis

#### 1. Cognitive Mechanisms: What Pair Programming Actually Does to Thinking

The empirical literature converged on a picture significantly more interesting — and more contested — than the folk account of "one catches the other's bugs."

**The distributed cognition frame.** Flor and Hutchins (1992) established the foundational framing: pair programming distributes cognitive work across two agents and the external artifacts they share. Their key observation was that the verbal and non-verbal coordination between programmers expands the search space of alternatives considered. Two minds don't simply do twice the checking; they traverse a broader problem landscape than either would reach alone, because each partner's utterances activate associations in the other's memory that solo reasoning would not surface.

**The verbalization mechanism.** A competing but compatible explanation locates the effect in forced externalization. Several researchers (summarized in Xu & Correia, 2023, and Bryant et al., 2008) note that the apparent gains of pair programming may owe less to having a second pair of eyes than to the sheer volume of verbal reasoning the pairing context compels. Speaking a problem aloud converts implicit cognition into inspectable propositions, which reveals gaps, contradictions, and unstated assumptions. This is consistent with the cognitive psychology literature on think-aloud protocols and Vygotsky's private speech hypothesis: articulated reasoning has different properties from internal reasoning. The Xu & Correia (2023) review explicitly grounds pair programming in social constructivism and cognitive apprenticeship theory — knowledge is constructed through dialogue, not just transmitted.

**Challenging the driver/navigator cognitive division-of-labor model.** The most provocative empirical challenge to received wisdom comes from Bryant, Romero, and du Boulay (2008), whose observation study of commercial programmers directly contradicts the standard model. The standard model holds that the driver operates tactically (writing code) while the navigator operates strategically (higher abstraction, architectural awareness). Bryant et al. found no evidence for this division. In their data:

- Syntax discussion was rare and not concentrated in either role.
- Both partners contributed new information equally across subtasks, regardless of which role they occupied.
- Abstraction levels in speech were statistically indistinguishable between driver and navigator — both spoke predominantly at an "intermediate" level about code chunks and areas.
- Role switching happened frequently and fluidly, with minimal conversational overhead.

Bryant's alternative model — the "cognitive tag team" — proposes that the value comes from the dynamic itself: partners alternate bearing the cognitive-plus-physical load of driving, which reduces the multitasking penalty that falls on the solo driver who must simultaneously compose code, track strategy, and self-monitor. The navigator's function is not strategic surveillance from a higher perch; it is "cognitive off-load" — maintaining the shared mental model while the driver executes, so that neither partner must hold everything at once.

Bryant further identifies "intermediate-level conversation" as a kind of cognitive glue: talk about code chunks mediates between low-level syntax and high-level architecture, externalizing the programmer's mental model into shared verbal space. This externalization creates what she calls "additional cognitive thinking space" — the working memory of the pair exceeds the working memory of either individual because the shared verbal context holds state that would otherwise need to be held internally.

**The Hannay meta-analysis.** Hannay, Dybå, Arisholm, and Sjøberg (2009) synthesized 18 controlled experiments and found: a small significant positive overall effect on quality; a medium positive effect on speed (pairs finish faster); and a medium negative effect on effort (pairs consume more person-hours per task). Critically, the quality benefit was concentrated in complex tasks, while the speed benefit appeared for simple tasks. This suggests the cognitive mechanism is not uniform: for complex problems, the expanded alternative-space and error-detection effects dominate; for simple problems, mutual accountability and sustained focus dominate. The meta-analysis also flagged significant between-study variance and signs of publication bias, appropriately tempering confidence in the aggregate figures.

---

#### 2. Psychological Costs: The Barriers That the Literature Largely Underresearched

This is the domain where the empirical literature is thinnest. Most psychological work exists in qualitative studies, practitioner literature, and isolated constructs rather than programmatic research programs.

**Vulnerability and ego threat.** Fowler and Melnica (2019) synthesize practitioner observations into a pointed claim: pairing requires vulnerability of a specific kind — exposing not just what you know but what you don't know, in real time, to another professional. The "10x engineer" mythology that pervades software culture makes this a particular identity threat. Programmers have often built self-concept around exceptional individual competence; pairing makes competence gaps continuously visible. Tom Howlett's formulation — "To pair requires vulnerability. It means sharing all that you know and all that you don't know" — captures a dynamic that the quantitative research rarely measures but that practitioners consistently name.

**Imposter syndrome activation.** Andersen et al. (2025) document that developers in professional settings hesitate to initiate pairing sessions out of fear of exposing competence gaps and potential rejection from peers. This is imposter syndrome operating as an avoidance mechanism: the anticipated judgment of a peer causes pre-emptive disengagement before pairing even begins. Valoý (2023) found this particularly acute for junior developers in navigator roles who reported finding it difficult to contribute meaningfully when the driver's code exceeded their current comprehension. The Xu & Correia (2023) review identifies "actual skill level" and "perceived skill" as separate variables with independent effects — you can be competent and still be impaired by low self-assessment.

**The knowledge gap and cognitive strain.** Plonka et al. (2015) found that in novice-expert pairings, the domain knowledge asymmetry could be so severe that the junior developer fails to follow what the senior is doing. Rather than scaffolding the junior, this produces cognitive overload — the junior must simultaneously process new technical content, maintain social engagement, and contribute visibly, all under time pressure driven by organizational rather than educational pacing. Crucially, Plonka et al. observe that "novice articulation, reflection and exploration are not seen" in these sessions — the junior is passive, which means cognitive apprenticeship theory's expected learning mechanisms (the apprentice practicing and making errors that the master can correct) are not actually firing. The junior is watching, not doing.

**Introversion and social exhaustion.** Andersen et al. (2025) document a rarely-discussed cost: pairing is persistently social in a way that depletes introverted developers. One participant reported being "60-70% introvert" and that the social aspect was "wearing me out." This is not a pathology; it is a genuine cognitive-energetic cost of continuous social engagement. Teams that do not structure recovery time into pairing practices will experience burnout as a consequence. The Fowler-Melnica synthesis corroborates this, noting that "most people also need some time on their own throughout the day, especially more introverted folks."

**Power dynamics in formal and informal hierarchies.** The practitioner literature (Fowler & Melnica, 2019; Sarah Mei cited therein) and the industrial research (Andersen et al., 2025) converge on identifying a taxonomy of hierarchies that operate inside pairing sessions: formal hierarchy (manager-report relationships); informal seniority (years of experience); demographic hierarchies (gender, race, educational background). These hierarchies manifest behaviorally in keyboard monopolization, persistent teacher positioning by the senior partner, and dismissal of junior suggestions without genuine engagement. Andersen et al. (2025) document that experienced developers sometimes frame pairing with junior partners as inefficient and ineffective, creating a social dynamic where the junior is being tolerated rather than collaborated with — the exact inverse of productive mentoring.

**Bryant's behavioral taxonomy of dysfunction.** Freudenberg/Bryant's (2013) direct observation work identified two archetypal failure modes. "The Thrasher" is a power struggle: partners cannot agree on approach, fight over keyboard control, and write/delete each other's code. The data show novice pairs exhibit nearly twice the suggestion-and-counter-suggestion of expert pairs, suggesting that insecurity about one's own solutions drives this antagonism. "The Divider" is disengagement formalized: partners split the task and work separately, nominally "pairing" while actually working solo. This failure mode is particularly insidious because it looks like collaboration while preserving the knowledge silos that pairing is meant to dissolve.

**Gender dynamics.** A strand of research specifically examines gender asymmetry in pairing. Zhong, Wang, and Chen (2016) found that girls became more productive and confident in pair programming, but observed no significant effect of gender pairing composition — suggesting that the individual effects are real but pair gender composition matters less than relationship quality. The remote pair programming research (arXiv:2110.01962) found that when developers perceived their partner as a woman, they deleted more characters in the code window and used fewer informal verbal expressions — suggestive of the stereotype threat literature's predictions that perceived performance surveillance from a higher-status group impairs performance and alters behavior. Research confirms that the stereotypically male image of computer science leads women to rate themselves as less competent than men at equal performance levels — a pre-existing imposter syndrome amplified by collaboration's visibility.

---

#### 3. What Is Lost When AI-Assisted Solo Development Replaces Pairing

This is the newest research domain, with most empirical work appearing between 2023 and 2025. The findings are preliminary but directionally consistent.

**Knowledge transfer: similar frequency, reduced depth.** Welter et al. (2025) conducted the most direct comparison: developer pairs solving a task collaboratively versus individual developers using GitHub Copilot. They extended an existing knowledge transfer framework and used a semi-automated evaluation pipeline. The headline finding is surprising: the frequency of successful knowledge transfer episodes was similar across both settings. But the structure of those episodes differed markedly. A human-human knowledge transfer episode averaged 14.4 utterances; a human-AI episode averaged 9.4 utterances. The conversations were shorter and, by inference, shallower. The study also found that developers accepted Copilot's suggestions with less scrutiny than suggestions from human partners. The social pressure to evaluate and respond to a peer's reasoning — the cognitive mechanism that Bryant et al. identified as central to pairing's value — is absent with AI. You can dismiss Copilot without interpersonal consequence.

**The scrutiny deficit.** This last point has compounding effects. In human pairing, the navigator's suggestions are challenged and negotiated — that challenge is itself a learning event for both parties. The driver must articulate why they prefer a different approach; the navigator must respond to counter-arguments. With Copilot, the suggestions arrive without a human advocate, reducing the social cost of non-engagement. This removes one of the central accountability mechanisms that produces both code quality and knowledge building.

**What remains.** Lyu et al. (2025) found in a semester-long classroom study that students using AI-assisted pair programming demonstrated higher assignment scores than solo AI users and comparable performance to human-human pairs on objective measures. However, their qualitative data revealed a meaningful division: students turned to AI for syntax clarification and conceptual lookup; they turned to human partners for idea exchange and "bouncing ideas off" each other. The relational, generative function of human pairing — the emergent reasoning that comes from two minds genuinely surprising each other — was reported as distinctively human. AI excelled at retrieval; humans excelled at co-construction.

**AI changes the psychological dynamic of pairing.** The vulnerability cost of pairing is substantially reduced with AI. Copilot cannot judge you, cannot remember your mistakes, cannot form impressions of your competence. This reduces the psychological barrier to seeking help and exposing uncertainty. Research found that AI-assisted programming improved intrinsic motivation and reduced programming anxiety compared to individual programming (Xu & Correia, 2023 review; the 2024-2025 quasi-experimental study with 234 students). But the same mechanism that reduces psychological cost may also reduce psychological benefit: the ego investment that makes pairing hard is also what makes it powerful. Being seen struggling by a peer, and persisting anyway, is a mechanism of confidence-building that AI cannot replicate.

**Social learning and motivation.** Multiple reviews identify that human pairing produced measurable effects on retention and persistence in computer science programs — effects attributed to social connection and mutual accountability (Xu & Correia, 2023). The Xu & Correia review also names "pair pressure" and "pair relaying" as positive team dynamics: partners motivate each other's engagement and exchange knowledge through explanation. These are inherently social mechanisms. AI can provide some motivational scaffolding (reducing anxiety, providing encouragement), but it cannot create the social obligation that makes a developer keep working because they don't want to let a colleague down.

---

#### 4. How Pairing Dynamics Change When Tools or AI Mediate the Interaction

**AI in pair programming vs. AI replacing pair programming.** The research distinguishes two distinct use patterns. In AI-augmented pair programming (human pair + AI tool), Lyu et al. (2025) found that students spontaneously reorganized their workflow: one partner used conversational ChatGPT while the other used inline Copilot completions, then converged. This created new collaborative structures rather than erasing old ones. Multi-screen setups replaced the single-keyboard model; simultaneous task streams became possible. AI mediation changed the mechanics of driver/navigator without eliminating the dyad.

In AI-replacing pair programming (solo developer + AI), the dyad disappears and so do the social mechanisms. The shorter knowledge transfer episodes (Welter et al., 2025) and the reduced scrutiny of suggestions are the measurable signatures of that disappearance.

**Remote distributed pairing.** The COVID-19 period produced research on distributed pair programming that is relevant here. Xu & Correia's (2023) review found that technology mediation (especially specialized IDE plugins like SCEPPSys) was a significant variable: VR environments doubled bug detection rates, and visual representations of co-presence benefited novice programmers disproportionately. The quality of the communication channel matters for whether the collaborative cognitive mechanisms fire. Screen share with voice is sufficient for most pairing tasks; tools that increase awareness of the partner's attention and actions improve outcomes further.

**The GitHub Copilot "pair programmer" framing.** The branding of GitHub Copilot as an "AI pair programmer" is contested by the research. Werler et al. (2025) and multiple other studies find that it functions more like a sophisticated autocomplete than a collaborative partner: it generates suggestions without understanding the developer's reasoning context, without asking clarifying questions, without modeling the developer's knowledge state. Plonka et al.'s (2015) six teaching strategies — which include scaffolded hints, asking questions to prompt reflection, and graduated challenge — require a model of the learner's current state. Copilot has no such model. The "pair programmer" metaphor is marketing; the research literature treats it as a tool that produces some of pairing's outputs (faster code generation, reduced defects on some dimensions) while eliminating most of pairing's mechanisms.

---

### Key Findings

- The central cognitive mechanism of pair programming is not error-catching but **forced verbalization**: the requirement to articulate reasoning aloud converts implicit cognition into inspectable propositions, expands working memory via shared verbal context, and surfaces unstated assumptions. (Bryant et al., 2008; Flor & Hutchins, 1992; Xu & Correia, 2023)

- The driver/navigator division of cognitive labor — driver tactical, navigator strategic — is **not supported by direct observation** of experienced commercial programmers. Both roles operate at similar abstraction levels; the value lies in fluid role-switching that distributes cognitive load across the pair. (Bryant et al., 2008)

- Pair programming produces **a small-to-medium quality improvement and a speed improvement for simple tasks, at the cost of ~15% more person-hours overall**. The quality benefit is larger for complex tasks. Between-study variance is high and publication bias is present. (Hannay et al., 2009; Cockburn & Williams, 2001)

- The primary **psychological barrier** to pairing is ego threat: software culture's mythology of the exceptional individual makes exposing knowledge gaps to a peer an identity-level risk. This produces avoidance behavior before pairing begins and disengagement (particularly of the junior partner) once it starts. (Andersen et al., 2025; Fowler & Melnica, 2019; Plonka et al., 2015)

- In novice-expert pairs, **the junior partner often fails to achieve productive learning**: the pace is driven by business priorities rather than educational sequencing, novice articulation and reflection are suppressed, and cognitive overload prevents the apprenticeship mechanisms from activating. (Plonka et al., 2015)

- **Gender hierarchies suppress contribution**: perceived female partners receive fewer informal utterances and more character deletions from male-presenting partners, consistent with stereotype threat dynamics. Girls show productivity and confidence gains from pairing, suggesting the mechanism is social threat not capability. (Zhong et al., 2016; arXiv:2110.01962)

- **Human-AI knowledge transfer episodes are shorter** (9.4 vs. 14.4 utterances average) and characterized by reduced scrutiny of AI suggestions compared to human suggestions. The social cost of dismissing a human partner's idea is a key mechanism driving the deeper engagement in human-human pairing. (Welter et al., 2025)

- AI tools are **stronger at retrieval than co-construction**: students use AI for syntax and lookup but turn to human partners for idea exchange, surprise, and emergent reasoning. The distinctively human contribution to pairing is generative, not informational. (Lyu et al., 2025)

- AI-assisted pairing **reduces psychological cost and anxiety** but may also reduce psychological benefit: the visibility of struggling in front of a peer, which is the primary source of imposter syndrome activation, is also the primary mechanism of confidence-building through persistence. (Xu & Correia, 2023; Andersen et al., 2025)

- **Self-efficacy predicts pair programming outcomes** more strongly than prior pair programming experience — meaning that pairing's learning benefits depend partly on the learner's pre-existing belief in their capability, and that low-self-efficacy learners are at risk of getting less from pairing even when paired well. (Mei et al., 2024)

---

### Limitations

**Methodological heterogeneity.** The pair programming literature is split between student-subject studies (dominant, but low external validity for professional contexts) and professional/industrial studies (rarer, but harder to control). Most quantitative findings come from CS higher education settings; generalization to professional software teams requires caution.

**Imposter syndrome is studied obliquely.** No study located in this search directly operationalizes imposter syndrome in pair programming contexts. The concept appears as a practitioner account and as a construct inferred from self-efficacy and perceived-skill research, but no controlled study has measured imposter syndrome activation and its behavioral consequences during pairing sessions. This is a genuine gap.

**Power dynamics lack longitudinal measurement.** The social dynamics literature (gender, seniority, race) is largely cross-sectional. How power imbalances evolve over repeated pairing relationships — whether they attenuate with familiarity or calcify into fixed roles — is not well studied.

**AI comparison studies are very recent.** The Welter et al. (2025) and Lyu et al. (2025) studies are preprints or very recent publications; replication is needed before treating their findings as settled. The field is moving fast enough that the research may not have caught up to current AI capability levels.

**The "what is lost" question is not directly studied.** Most AI comparison research asks "does AI produce equivalent outputs?" rather than "which specific mechanisms disappear?" The mechanistic question — which components of human-human pairing's value proposition are absent in human-AI pairing — remains largely inferential, derived from mechanism theories built on the human-only research rather than measured directly in comparative studies.

**No research on cumulative skill formation.** The longitudinal effects of pairing on career-scale professional development are unmeasured. Whether years of pairing produce different kinds of developers than years of solo work — and what is lost when a generation trains primarily with AI assistants — is a question the current literature cannot answer.

---

*Sources consulted:*

- [Xu & Correia (2023) — PMC Systematic Review](https://pmc.ncbi.nlm.nih.gov/articles/PMC9930723/)
- [Hannay et al. (2009) — Meta-Analysis, ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0950584909000123)
- [Bryant, Romero & du Boulay (2008) — Navigator Role, ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1071581907000456)
- [Plonka et al. (2015) — Knowledge Transfer, ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1071581914001207)
- [Valoý (2023) — Psychological Aspects, arXiv](https://arxiv.org/abs/2306.07421)
- [Andersen et al. (2025) — Integrating PP as Work Practice, arXiv](https://arxiv.org/html/2506.19511v1)
- [Welter et al. (2025) — Developer Pairs to AI Copilots, arXiv](https://arxiv.org/abs/2506.04785)
- [Lyu et al. (2025) — GenAI as Collaborative Teammate, ACM L@S](https://arxiv.org/html/2505.08119)
- [Freudenberg/Bryant (2013) — Tag Team and Dysfunctional Behaviors, Blog](https://salfreudenberg.wordpress.com/2013/08/31/an-alternative-take-on-the-driver-and-navigator-roles-in-pair-programming/)
- [Fowler & Melnica (2019) — On Pair Programming, martinfowler.com](https://martinfowler.com/articles/on-pair-programming.html)
- [Zhong, Wang & Chen (2016) — Social Factors, Computers in Human Behavior](https://www.sciencedirect.com/science/article/abs/pii/S0747563216305064)
- [Mei, Ping & Shen (2024) — Self-Efficacy and PP Experience, arXiv](https://arxiv.org/html/2410.15558)
- [Cockburn & Williams (2001) — Costs and Benefits, Collaboration @ NCSU](https://collaboration.csc.ncsu.edu/laurie/Papers/XPSardinia.PDF)
- [Williams et al. (2000) — Strengthening the Case, IEEE Software](https://www.semanticscholar.org/paper/Strengthening-the-Case-for-Pair-Programming-Williams-Kessler/53370a9549890cce5a18324ba4575112e6e6ee82)
- [Salleh, Mendes & Grundy (2011) — SLR, IEEE TSE](https://research.monash.edu/en/publications/empirical-studies-of-pair-programming-for-csse-teaching-in-higher/)
