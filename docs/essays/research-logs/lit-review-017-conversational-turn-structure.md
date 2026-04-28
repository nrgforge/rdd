## Literature Review: Turn Structure Under Multi-Item Pressure — User Cognitive Load in Agent Responses

**Date:** 2026-04-24
**Method:** Systematic literature search
**Cycle:** RDD 017 — Readability & Comprehensibility, Q4

---

### 1. Methodology

**Search strategy.** Fourteen targeted searches were conducted across Google Scholar, ACM Digital Library (via search), PubMed, arXiv, and practitioner outlets (Nielsen Norman Group, Smashing Magazine, Bryan Larson's conversational UX blog). Searches targeted: working memory capacity research (Miller; Cowan); cognitive load theory (Sweller); conversation analysis (Sacks, Schegloff, Jefferson; Schegloff 2007); pragmatics (Grice; Sperber and Wilson); HCI research on chatbot response design (CHI, CUI, and CSCW proceedings); NN/g conversational UX guidelines; discourse theory (Halliday and Hasan; van Dijk and Kintsch); and reading-on-screen research. Direct page fetches were performed on NN/g's legibility/readability/comprehension article, the NN/g accordion-editing report, the Smashing Magazine conversational AI guide, and the sensemaking-at-scale CHI 2024 paper.

**Filtering decisions.** Searches on "multi-item chatbot responses" and "conversational agent response length" initially surfaced LLM-agent-memory architecture papers (context window management, RAG chunking, multi-turn accuracy degradation in LLM benchmarks). These were filtered out as off-target — they address the agent's capacity to process long contexts, not the user's capacity to comprehend what the agent outputs. The kept literature is sharply user-side: comprehension, satisfaction, cognitive load, and turn-design.

**What was not findable.** No peer-reviewed empirical study was found that directly tests "enumerate-then-walk-through" as a named pattern against alternatives in an agent-human dialogue. The specific failure mode (agent produces N clarifying questions + decision context + gate response in one turn, user comprehension suffers) does not appear as a named research construct. The closest empirical anchors are: structured vs. unstructured chatbot response style studies (Springer 2024); NN/g accordion-editing observation (2023); spoken-conversational-search response-length studies; and ExploreLLM's CHI 2024 user study on exploratory LLM task scaffolding.

**Coverage confidence.** Working memory limits, cognitive load theory, and pragmatic maxims are foundational and well-established; confidence is high. HCI empirical literature on multi-item chatbot response design is sparse and largely practitioner-level; confidence is moderate. Conversation-analysis transfer to human-agent interaction is theoretically grounded but empirically under-examined; confidence is moderate.

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Miller, G. A. | The Magical Number Seven, Plus or Minus Two: Some Limits on Our Capacity for Processing Information | 1956 | Psychological Review, 63, 81–97 | Foundational working memory capacity / chunking |
| 2 | Cowan, N. | The Magical Number 4 in Short-Term Memory: A Reconsideration of Mental Storage Capacity | 2001 | Behavioral and Brain Sciences, 24, 87–185 | Updated capacity limit (3–5 chunks) |
| 3 | Sweller, J. | Cognitive Load Theory: A Special Issue | 1988/1994 | Educational Psychology Review | Three-load framework (intrinsic, extraneous, germane) |
| 4 | Sacks, H., Schegloff, E. A., & Jefferson, G. | A Simplest Systematics for the Organization of Turn Taking in Conversation | 1974 | Language, 50, 696–735 | Turn-taking structure, recipient design |
| 5 | Schegloff, E. A. | Sequence Organization in Interaction: A Primer in Conversation Analysis | 2007 | Cambridge University Press | Adjacency pairs, preference structure, sequence expansion |
| 6 | Grice, H. P. | Logic and Conversation | 1975 | In P. Cole & J. Morgan (Eds.), Syntax and Semantics, Vol. 3, pp. 41–58 | Maxims of quantity, manner, relation |
| 7 | Sperber, D., & Wilson, D. | Relevance: Communication and Cognition | 1986/1995 (2nd ed.) | Blackwell / Harvard University Press | Cognitive effects vs. processing effort trade-off |
| 8 | Halliday, M. A. K., & Hasan, R. | Cohesion in English | 1976 | Longman | Discourse cohesion as comprehension facilitator |
| 9 | van Dijk, T. A., & Kintsch, W. | Strategies of Discourse Comprehension | 1983 | Academic Press | Textbase, macrostructure, situation model |
| 10 | Nielsen, J. | F-Shaped Pattern for Reading Web Content (original eyetracking research) | 2006 | Nielsen Norman Group | F-pattern scanning, text scanning on screen |
| 11 | Nielsen Norman Group | Legibility, Readability, and Comprehension: Making Users Read Your Words | 2015 | nngroup.com | Comprehension structure: inverted pyramid, bullet points |
| 12 | Nielsen Norman Group | Accordion Editing and Apple Picking: Early Generative-AI User Behaviors | 2023 | nngroup.com | Observable failure modes of long AI responses |
| 13 | Nielsen Norman Group | Minimize Cognitive Load to Maximize Usability | 2016 | nngroup.com | Chunking, offloading, extraneous load reduction |
| 14 | Pirolli, P., & Card, S. K. | Information Foraging | 1999 | Psychological Review, 106(4), 643–675 | Information scent, cost-benefit of processing |
| 15 | Amershi, S., Weld, D., et al. | Guidelines for Human-AI Interaction | 2019 | CHI 2019 (ACM) | 18 design guidelines for AI systems, including scope and timing |
| 16 | Ma, X., Mishra, S., et al. (ExploreLLM) | Beyond ChatBots: ExploreLLM for Structured Thoughts and Personalized Model Responses | 2024 | Extended Abstracts CHI 2024 | Structured decomposition of multi-item LLM responses |
| 17 | Gero, K., Swoopes, T., et al. | Supporting Sensemaking of Large Language Model Outputs at Scale | 2024 | CHI 2024 (ACM) | Visual structure and comprehension of large response sets |
| 18 | Dubiel, M., Daronnat, S., & Leiva, L. A. | Conversational Agents Trust Calibration: A User-Centred Perspective to Design | 2022 | CUI 2022 (ACM) | Trust calibration, transparency, agent self-limitation |
| 19 | Schmidhuber, J., Schlögl, S., & Ploder, C. | Cognitive Load and Productivity Implications in Human-Chatbot Interaction | 2021 | IEEE ICHMS 2021 / arXiv:2111.01400 | Chatbot cognitive load vs. software-only interaction |
| 20 | Springer (anon. proceedings chapter) | How AI Chatbot Response Style Affects Cognitive Load and Performance in Educational Tasks | 2024 | Springer (proceedings, ISBN not recoverable from search) | Structured vs. unstructured chatbot style; physiological and subjective CL measures |
| 21 | Kaikkonen, A., et al. (cited via conversational-search survey) | Effects of Response Length on User Search Experience in Spoken Conversational Search | in press/2024 | Springer (ECIR proceedings) | Short vs. long response presentation; task complexity interaction |
| 22 | Kiesel, J., et al. | Exploratory search with generative AI: An empirical study on interaction design strategies on information exploration and cognitive load | 2026 | Int. Journal of Human-Computer Studies | Progressive disclosure vs. one-time disclosure in generative AI search |
| 23 | Nielsen, J. | Progressive Disclosure | 1995/updated | Nielsen Norman Group | Progressive disclosure as interaction design pattern |
| 24 | MAC / FATA frameworks | Multi-Agent Framework for Interactive User Clarification (MAC); First-Ask-Then-Answer (FATA) | 2025/2025 | IWSDS 2026 / arXiv | Single-question-per-turn vs. batch-question approaches to clarification |
| 25 | Larson, B. | 8 Principles for Conversational UX Design | 2025 | bryanlarson.ca | Practitioner synthesis: clarification, transparency, override |

---

### 3. Synthesis

#### 3.1 Findings on User Cognitive Load in Multi-Item AI Responses

**Working memory capacity as a hard floor.** Miller (1956) established that immediate memory is limited to approximately seven items (plus or minus two), but critically, that limit applies to *chunks* — the largest meaningful unit the receiver can recognize — not to bits. Cowan (2001) tightened this estimate considerably: a controlled reanalysis of the literature concluded that the focus of attention holds three to five chunks in normal adults when rehearsal and grouping strategies are controlled. The practical implication is severe: if an agent's single turn presents four conceptually distinct items (a gate response, two clarifying questions, and a decision context), the user is at or beyond working memory capacity before any comprehension of the *content* of those items occurs. The chunking observation from Miller also carries positive implications — items that can be meaningfully grouped before transmission reduce load — but it requires the grouping to be done by the sender, not discovered by the receiver under pressure.

**Cognitive load theory distinguishes the failure type.** Sweller's framework (1988, later elaborated) partitions cognitive load into intrinsic load (inherent complexity of the material), extraneous load (load imposed by the presentation format), and germane load (productive effort spent forming schemas). For the Q4 failure mode, the relevant category is extraneous load: the content of each item in a multi-item agent turn may be individually tractable, but the simultaneous presentation of N heterogeneous items — without sequencing, signaling, or prioritization — imposes extraneous load on top of the intrinsic content load. The remedy for extraneous load is reformatting, not content removal. This is an important diagnostic distinction: the failure is not necessarily that the information is too complex; it is that the presentation is poorly engineered for the receiver's working memory.

**Empirical measurement in chatbot contexts.** The 2024 Springer study (anon. chapter) compared structured, concise chatbot outputs against lengthy, unstructured, ambiguous outputs in educational task performance. It found that structured responses minimized both physiological arousal (objective measurement) and perceived effort (subjective), while unstructured outputs elevated both measures. Critically, task accuracy improved from 30.6% baseline to 74.0% with AI assistance — but *response quality modulated that gain*: high-quality, structured responses produced the accuracy benefit; low-quality, unstructured responses partially eroded it. This is the strongest direct empirical finding connecting response structure to measurable user outcomes in a chatbot context.

**Cognitive load in chatbot vs. alternative interfaces.** Schmidhuber, Schlögl, and Ploder (2021) found chatbot users experienced less cognitive load than software-only users for simple, repetitive tasks — but flagged that complex collaborative tasks introduce a "mental burden that often remains overlooked." The implication: the cognitive advantage of conversational interface is task-dependent, and the benefit degrades or reverses when the agent produces multi-concern outputs for tasks requiring judgment.

#### 3.2 Findings on Response Patterns

**The "wall of text" as a named, observed failure mode.** The term is colloquial rather than technical in HCI literature — no paper defines it as a named construct — but the phenomenon is documented. Nielsen Norman Group's eyetracking research (Nielsen 2006) established the F-shaped scanning pattern: users read horizontally across the top, scan a second horizontal band, then scan vertically down the left margin. Critically, 79% of users scan rather than read, and only 16% read a web page fully. Long, unbroken prose with no visual hierarchy triggers the F-pattern, meaning the bottom two-thirds of a long response may not be processed at all. The NN/g legibility/readability/comprehension article reports that users read only 28% of web content on average, and recommends the inverted-pyramid structure (conclusions first) and bullet-point chunking specifically to survive scanning behavior.

**Accordion editing and apple picking.** NN/g's 2023 qualitative usability study (n=8, professionals and students) directly observed users interacting with long AI responses and documented two coping behaviors: *accordion editing* (repeatedly asking the agent to shorten or expand output until the desired length is reached) and *apple picking* (manually scrolling back through long chat histories to locate a specific line and copy it forward). These are not productive behaviors — they are remediation behaviors for a failure mode. Users "get lost when scrolling" through text walls, cannot point to specific content, and resort to laboriously re-describing what they want. The study's authors attribute these behaviors to poor compartmentalization, lack of direct manipulation, and the absence of an interface mechanism for targeted edits. These findings directly document the Q4 concern from the user's perspective: large multi-item agent turns generate rework, not comprehension.

**Structured vs. unstructured response — bullet points, numbered lists, and prose.** The literature consistently favors structured formats over prose for comprehension and satisfaction, though the evidence varies in rigor. NN/g recommends bullet points and subheadings for content exceeding a moderate threshold. The Springer 2024 study provides the strongest empirical support: structured (standard) responses were superior on physiological and subjective load measures. The NeuroChat adaptive tutoring system (ACM CUI 2025) demonstrates practical application: it modulates response format (long-form prose vs. bullet points) based on real-time cognitive load assessment. The practical consensus is strong even if the controlled trials are limited.

**Progressive disclosure vs. one-time disclosure.** Kiesel et al. (2026, Int. J. Human-Computer Studies) compared progressive disclosure (incremental presentation of information as users explore) against one-time disclosure (full response upfront) in generative AI search. Progressive disclosure led to higher perceived knowledge change, greater search engagement, and more prompts submitted — at the cost of more interaction turns. The tradeoff structure matters for the Q4 case: if the cycle's concern is users receiving too much at once in a single turn, progressive disclosure offers empirical support, but it trades cognitive compression against conversational efficiency. The right balance depends on task type: Kaikkonen et al. (cited in conversational-search survey literature) found that short response presentation reduced cognitive load for simple tasks but led to more query issuance for complex ones — suggesting that chunking works better when the receiver can form a complete mental model from each chunk.

**ExploreLLM and schema-level scaffolding.** Ma, Mishra, et al. (CHI 2024) directly address the LLM multi-item load problem with an empirical system design. They observe that LLM-powered chatbots impose "a large interactional cognitive load, especially for exploratory or sensemaking tasks," because the interaction is purely textual with no structure, no informational scent, and no way to specify high-level preferences. ExploreLLM decomposes tasks into sub-tasks automatically and renders them in a structured, interactive UI drawing on cognitive science theories of *schema* and *distributed sensemaking*. Users found the schema-like structure helpful for planning tasks and reported easier personalization of responses. This system-level finding suggests that the failure of multi-item prose responses is not merely presentational but structural: the absence of a schema (a predictable organizing frame) leaves users bearing the full assembly cost.

**Summary-then-detail (inverted pyramid) pattern.** The NN/g recommendation and the van Dijk and Kintsch (1983) macrostructure model converge here. Van Dijk and Kintsch describe how readers construct a hierarchical textbase by inferring macropropositions from sequences of propositions — that is, readers actively build a summary of what they are reading, which guides subsequent processing. When the text itself front-loads the macrostructure (the summary), it offloads that inference work from the reader. The inverted-pyramid design principle operationalizes this: put the bottom-line (gate response, key decision, most urgent item) first, then provide supporting detail. This is distinct from "enumerate then walk through" — it is "answer first, then justify."

**Prioritization-first as a distinct pattern.** Multiple practitioner sources (Smashing Magazine 2024, Amershi et al. G3/G4) identify a related but separable pattern: the agent should signal *what requires the user's attention and in what order* before delivering content. Amershi et al. (2019) guideline G3 is "time services based on context" — act or interrupt at appropriate times. G4 is "show contextually relevant information." Together these imply that an agent should filter what it surfaces per turn to what is genuinely needed at that moment, and sequence it by relevance. The Smashing Magazine guide flags rapid-fire multi-questioning as "interrogating" users and recommends the open-elicitation-then-narrow pattern instead.

#### 3.3 Findings on the Underlying Failure Mechanism

**Four candidate mechanisms, partially distinguishable in the literature.**

**(A) Structural ordering (front-loading dense content without orientation).** Supported by: F-pattern scanning evidence (Nielsen 2006); inverted-pyramid principle (NN/g); CLT extraneous load analysis. This mechanism predicts that reordering the same content — conclusions first, then detail — would substantially reduce the failure. It requires no reduction in total content, only resequencing.

**(B) Volume (too many items per turn regardless of ordering).** Supported by: Cowan (2001) 3–5 chunk limit; NN/g accordion-editing study (users overwhelmed by simultaneous presentation even without structural confusion); Gero et al. CHI 2024 sensemaking study ("too much information" reported for 9-response simultaneous presentation). This mechanism predicts that reducing N items per turn — toward single-item or two-item turns — would reduce the failure even if each item is well-structured. It requires sequencing across turns, not just reordering within a turn.

**(C) Scope (agent handling too many concerns simultaneously).** Supported by: ExploreLLM CHI 2024 (task decomposition into sub-tasks reduced load); Schmidhuber et al. 2021 (complex collaborative tasks generate overlooked mental burden). This mechanism locates the failure at the agent's task-scoping decision, not at the presentation layer: the agent should have separated gate response, clarifying questions, and decision context into distinct turns or categories rather than producing them together. It is upstream of both ordering and volume: the problem is that the turn contains heterogeneous concerns (action, question, context) whose combination is inherently difficult to process as a unit.

**(D) Priority (user cannot tell which item is most urgent).** Supported by: Grice's maxim of manner ("be orderly"); relevance theory's processing-effort analysis (Sperber and Wilson 1986 — the receiver allocates effort expecting relevance; ambiguous urgency forces re-evaluation of each item's processing priority); Amershi et al. G3/G4. This mechanism predicts that explicit prioritization labeling ("The blocking item is X; the two optional context items are Y and Z") would substantially reduce the failure even without reducing volume or resequencing.

**These mechanisms are not mutually exclusive.** The literature does not provide a study that cleanly isolates them. The Q4 field evidence (the Stop-hook loop session documented in cycle-status.md) reflects all four simultaneously: the agent produced structural scope violations (gate response mixed with diagnostic context), volume overload (multiple independent concerns), ordering failure (diagnosis before resolution), and priority opacity (user could not tell which observation required a decision). The cycle should treat all four as active until intervention evidence isolates the dominant one.

**The mechanisms predict different interventions.** This is the practical payoff of distinguishing them:

- Mechanism A (ordering) → inverted-pyramid, answer-first formatting
- Mechanism B (volume) → single-item-per-turn chunking, multi-turn sequencing
- Mechanism C (scope) → agent task decomposition before response generation; separate turn for each concern type
- Mechanism D (priority) → explicit priority signaling before content ("I have two items; the first requires your decision")

The "enumerate-then-walk-through" pattern named in Q4 addresses mechanisms B and D but not A or C: it announces the items first (addressing D) and sequences them across micro-turns (addressing B), but does not necessarily reorder items by urgency (A) or prevent the agent from mixing concern types in the first place (C).

#### 3.4 Pragmatics and Turn-Taking

**Grice's maxims as a normative frame.** Grice (1975) identified four cooperative conversational maxims. The maxim of *quantity* ("do not make your contribution more informative than required") directly prohibits over-volunteering — including combining gate response with unsolicited diagnostic detail in one turn. The maxim of *manner* ("be brief and orderly") requires sequencing for the receiver's benefit, not the speaker's completeness. The maxim of *relation* ("be relevant") requires filtering to what the receiver needs at this moment. A multi-item turn that mixes categories (decision request + context + questions) violates quantity and manner even if each individual item is relevant. These violations are not merely aesthetic — Grice's theory holds that when maxims are flouted, receivers expend extra processing effort searching for an implicature (an indirect meaning that would justify the flouting). For agent-to-user turns, there is no helpful implicature to find; the receiver simply bears the extra load unproductively.

**Sperber and Wilson's relevance theory sharpens the cost analysis.** Relevance theory (1986, 2nd ed. 1995) formalizes the trade-off: relevance is proportional to cognitive effects and inversely proportional to processing effort. An utterance that requires high processing effort (large, multi-item, unsequenced) must deliver proportionally high cognitive effects to remain worth the receiver's attention. A multi-item agent turn fails this test not because any individual item lacks cognitive effect, but because the assembly cost — parsing the turn, identifying item boundaries, understanding what response is required for each — consumes effort that exceeds the marginal value of having all items simultaneously rather than sequentially. Relevance theory thus predicts that users will deprioritize processing the lower-relevance items in an overloaded turn rather than processing all items thoroughly — consistent with the F-pattern finding that the latter two-thirds of a long response may not be read.

**Sacks, Schegloff, and Jefferson on turn-taking.** The 1974 foundational paper established that turn-taking in conversation is locally managed, participant-administered, and sensitive to *recipient design* — turns are constructed with awareness of what the recipient can process and what response they are expected to produce. The practical implication for agent turns: a turn producing N items simultaneously without specifying which item takes the next-turn slot creates recipient design failure. The receiver does not know whether they are expected to respond to all items, the most urgent item, or the last item. In human conversation this ambiguity is resolved by prosody, gaze, and sequential structure; in a text chat interface, none of those cues are available.

**Adjacency pairs and the one-action-per-turn pressure.** Schegloff (2007) describes conversation as organized around adjacency pairs — first pair parts (questions, requests, greetings) that project a specific second pair part. A multi-item turn containing two questions and a gate response creates *multiple simultaneous first pair parts*, violating the basic sequential constraint. In conversation analysis terms, this is a case of sequence initiation overload: the receiver must manage multiple projected sequences at once. Human conversationalists handle this by deferring or ignoring the additional initiations — which is exactly the behavior the Q4 field evidence documents. The user, faced with an agent turn containing loop-detection, diagnostic context, and an implicit decision request, addressed the most salient item and ignored the structural complexity. Conversation analysis predicts this is not a failure of user attention; it is a normal conversational coping strategy for recipient design violation.

**Transfer to agent-human interaction.** The CA findings were derived from human-human dialogue. Transfer to agent-human is not automatic, but several features hold: (a) the adjacency-pair structure is a cognitive-linguistic universal, not specific to human interlocutors; (b) users approach agents with the same turn-taking expectations they bring to human conversation (documented in chatbot design literature); (c) the recipient-design principle is an agent-design requirement, not just a conversational description. The constraint that does not transfer cleanly is the preference organization around social politeness: in human conversation, agents can use hesitation and mitigation to signal dispreference; in a text chatbot, those social signals are absent and users interpret their absence as competence rather than social cue. This makes the priority-opacity failure (mechanism D) potentially worse in agent-human interaction than in human-human conversation.

---

### 4. Key Findings

- **Working memory limits impose a hard ceiling of 3–5 chunks on simultaneous processing** (Cowan 2001). A multi-item agent turn exceeding this count is not merely suboptimal; it is outside the receiver's processing capacity. The relevant count is chunks, not tokens or words — items that can be meaningfully grouped count as one. (Miller 1956; Cowan 2001)

- **The failure mechanism for multi-item agent turns is extraneous cognitive load, not intrinsic complexity.** Individual items in the turn may be tractable; the presentation format imposes overhead beyond content difficulty. The remedy is reformatting, not content removal. (Sweller CLT; Springer 2024 empirical study)

- **Structured, concise responses measurably outperform lengthy, unstructured responses.** The 2024 Springer chatbot study found minimized physiological arousal and perceived effort for structured outputs vs. unstructured. This is the strongest direct empirical support for the structural-ordering mechanism. (Springer 2024)

- **"Wall of text" is colloquial, not a technical HCI term, but the phenomenon is empirically documented.** F-pattern scanning means content below the first two horizontal bands may not be processed. Users read 28% of web content on average. Long responses generate accordion editing (iterative reshaping) and apple picking (manual content recovery) — both remediation behaviors for a presentation failure. (Nielsen 2006; NN/g 2023; NN/g legibility article)

- **Progressive disclosure is empirically supported for exploratory tasks, with a tradeoff.** Progressive disclosure outperforms one-time disclosure on perceived knowledge change and engagement but generates more turns. For simple tasks, short-response chunking reduces load; for complex tasks, over-chunking generates more queries. There is no universally optimal response length; optimal chunking is task-type dependent. (Kiesel et al. 2026; Kaikkonen et al.)

- **The absence of a schema — an organizing frame the receiver can apply before reading — is a structural cause of multi-item response failure.** ExploreLLM's user study found that decomposing tasks into a visible sub-task structure reduced load for exploratory tasks. The absence of schema forces the receiver to perform structural inference work (building macrostructure, per van Dijk and Kintsch 1983) on top of content comprehension. Front-loading a brief enumeration of what follows provides that schema cheaply. (Ma et al. CHI 2024; van Dijk and Kintsch 1983)

- **Grice's maxims of quantity and manner identify multi-item over-contribution as a cooperative violation.** Producing more information than required per turn, and producing it non-orderly, violates cooperative norms. Receivers respond to such violations by spending extra processing effort searching for justifying implicature — effort that is unproductive when no implicature exists. (Grice 1975)

- **Relevance theory predicts selective processing under overload.** When processing effort exceeds the cognitive effects delivered, receivers deprioritize — they process the highest-relevance items and abandon the rest. In an agent turn containing a decision request, clarifying questions, and background context, the decision request will dominate attention and the clarifying questions will be underprocessed or ignored. This is not user failure; it is rational resource allocation. (Sperber and Wilson 1986/1995)

- **Conversation analysis predicts that simultaneous multiple first pair parts generate coping-by-deferral.** Adjacency pair structure projects specific next-turn responses. Multiple simultaneous projections create recipient design failure — the receiver does not know which projection takes the next slot. Human conversationalists defer or ignore additional projections; users of AI agents do the same. (Sacks, Schegloff, and Jefferson 1974; Schegloff 2007)

- **Enumerate-then-walk-through addresses volume and priority opacity but not scope or ordering.** Front-loading an enumeration addresses mechanism D (priority: user now knows what is coming) and supports mechanism B (volume: items are sequenced). It does not prevent mechanism C (scope: the agent may still be mixing concern types that should have been separated across turns) or mechanism A (ordering: the first item announced may not be the highest-urgency item). The pattern is a partial remedy.

- **Single-item-per-turn has empirical and theoretical support but is not universally superior.** FATA and MAC dialogue frameworks adopt it for clarification turns. Spoken conversational search research finds it reduces load for simple tasks. CA theory supports it as the normative turn shape. However, it carries interaction-cost overhead (more turns, higher latency) and may be counterproductive for high-complexity tasks where context is needed to understand the question. (Kaikkonen et al.; FATA arXiv 2025; MAC IWSDS 2026)

- **User trust is degraded by information-dense turns when users cannot verify or prioritize content.** Dubiel, Daronnat, and Leiva (2022) find trust calibration requires users to be able to "scrutinize results" — an activity that multi-item unsequenced turns make structurally difficult. Information overload degrades the user's ability to detect incorrect or irrelevant items, risking over-trust in the totality of a response they have not fully processed. (Dubiel et al. 2022; Amershi et al. 2019 G1/G2)

---

### 5. Implications for the Cycle

**What the literature most supports.** For the Q4 failure mode (agent producing gate response + clarifying questions + decision context in one turn), the literature most strongly supports the following design response:

1. **Scope before structure.** The primary intervention is upstream: the agent should separate concern types (decision gate, clarifying questions, context) into distinct turns or clearly labeled sections, rather than producing a single compound turn. This addresses mechanism C (scope), which other patterns leave untouched.

2. **Priority-first announcement before content.** A brief up-front statement of what the turn contains and which item is urgent (mechanism D) — "Two things need your attention: X is blocking, Y is optional context" — provides the schema that enables the receiver to set their own processing strategy. This is cheaper than enumerate-then-walk-through and can be combined with any response format.

3. **Inverted-pyramid ordering within a turn.** If a compound turn is unavoidable (latency, task structure), front-load the highest-urgency item. The gate response or decision request goes first, not last. This addresses mechanism A independently of volume.

4. **Chunking across turns for true multi-item situations.** When N ≥ 3 heterogeneous items must be delivered, sequencing them across turns — with the user choosing when to proceed — is the most cognitively tractable approach. This addresses mechanism B directly. The cost is interaction overhead; the user must participate in pacing. This cost may be acceptable in high-stakes or complex-decision contexts and counterproductive in simple informational contexts.

5. **Structured formatting (bullets, numbered lists, clear section labels) within any turn that cannot be chunked.** The empirical literature on bullet points vs. prose favors bullets for cognitive load and scanning support. This is a low-cost improvement that partially addresses mechanism A.

**What remains open.**

- No empirical study directly compares enumerate-then-walk-through against alternatives (single-item-per-turn, summary-then-detail, priority-announcement) in an agent-developer dialogue context. The practitioner claims for enumerate-then-walk-through are theoretical derivations from the literature, not direct measurements.

- The task-type dependency of optimal chunking granularity is not resolved. The spoken-conversational-search finding (short responses reduce load for simple tasks but generate more queries for complex tasks) needs investigation for the cycle's specific task type: multi-concern methodology sessions where user decisions have downstream consequences. These are complex tasks, not simple informational queries.

- Conversation analysis findings on multi-turn adjacency pair handling derive from human-human dialogue. The degree to which users apply the same sequential expectations to AI agents — and the degree to which violation consequences differ — is empirically under-examined. The analogy is theoretically sound but untested in the specific agent-developer interaction context.

- The cycle's field evidence (the Stop-hook loop session) blends all four failure mechanisms simultaneously. Isolating the dominant mechanism in RDD's specific interaction pattern — long-running methodology sessions with high contextual stakes — would require direct user observation that the literature does not provide.

---

### 6. Limitations

**Methodology limits.** Searches were conducted over one session and did not access full-text of all potentially relevant papers (ACM DL and Springer required institutional access for several full texts; findings were extracted from abstracts, search summaries, and author-accessible preprints). The Springer 2024 chatbot study was cited with sufficient confidence in its main findings but the full methodology (sample size, task design, physiological measurement method) was not verified from full text.

**Population scope.** The HCI literature on chatbot cognitive load skews toward educational contexts (tutoring chatbots) and customer service chatbots. RDD's agent-developer interaction context — a technically sophisticated user engaged in iterative methodology work with high contextual continuity across turns — is meaningfully different. Educational task findings may generalize in direction but not in magnitude.

**Absence of direct measurement on the specific pattern.** No study directly measures enumerate-then-walk-through as a named design pattern. The review synthesizes from adjacent literature (CLT, pragmatics, CA, chatbot response structure), but the pattern itself has not been empirically tested against alternatives. This gap is the most significant limitation for the cycle's practical application.

**Publication dates.** The generative AI chatbot UX literature is developing rapidly. NN/g's accordion-editing study was qualitative with eight participants; its findings are directionally credible but not statistically definitive. Studies from 2021–2024 on response structure are more rigorous but derived from different interaction contexts than RDD.

---

### Sources

1. Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review, 63*(2), 81–97.

2. Cowan, N. (2001). The magical number 4 in short-term memory: A reconsideration of mental storage capacity. *Behavioral and Brain Sciences, 24*(1), 87–185. https://doi.org/10.1017/S0140525X01003922

3. Sweller, J. (1988). Cognitive load during problem solving: Effects on learning. *Cognitive Science, 12*(2), 257–285. (Framework elaboration: Sweller, J., van Merriënboer, J. J. G., & Paas, F. G. W. C. (1998). *Educational Psychology Review, 10*, 251–296.)

4. Sacks, H., Schegloff, E. A., & Jefferson, G. (1974). A simplest systematics for the organization of turn taking in conversation. *Language, 50*(4), 696–735.

5. Schegloff, E. A. (2007). *Sequence Organization in Interaction: A Primer in Conversation Analysis, Volume 1.* Cambridge University Press.

6. Grice, H. P. (1975). Logic and conversation. In P. Cole & J. Morgan (Eds.), *Syntax and Semantics, Vol. 3: Speech Acts* (pp. 41–58). Academic Press.

7. Sperber, D., & Wilson, D. (1986; 2nd ed. 1995). *Relevance: Communication and Cognition.* Blackwell (1st ed.); Harvard University Press (2nd ed.).

8. Halliday, M. A. K., & Hasan, R. (1976). *Cohesion in English.* Longman.

9. van Dijk, T. A., & Kintsch, W. (1983). *Strategies of Discourse Comprehension.* Academic Press.

10. Nielsen, J. (2006). F-shaped pattern for reading web content (original eyetracking research). Nielsen Norman Group. https://www.nngroup.com/articles/f-shaped-pattern-reading-web-content-discovered/

11. Nielsen Norman Group. (2015). Legibility, readability, and comprehension: Making users read your words. https://www.nngroup.com/articles/legibility-readability-comprehension/

12. Nielsen Norman Group. (2023). Accordion editing and apple picking: Early generative-AI user behaviors. https://www.nngroup.com/articles/accordion-editing-apple-picking/

13. Nielsen Norman Group. (2016). Minimize cognitive load to maximize usability. https://www.nngroup.com/articles/minimize-cognitive-load/

14. Pirolli, P., & Card, S. K. (1999). Information foraging. *Psychological Review, 106*(4), 643–675.

15. Amershi, S., Weld, D., Vorvoreanu, M., Fourney, A., Nushi, B., Collisson, P., Inkpen, K., & Teevan, J. (2019). Guidelines for human-AI interaction. *Proceedings of the 2019 CHI Conference on Human Factors in Computing Systems.* ACM. https://doi.org/10.1145/3290605.3300233

16. Ma, X., Mishra, S., Liu, A., Su, S. Y., Chen, J., Kulkarni, C., Cheng, H.-T., Le, Q., & Chi, E. (2024). Beyond chatbots: ExploreLLM for structured thoughts and personalized model responses. *Extended Abstracts of the CHI Conference on Human Factors in Computing Systems.* ACM. https://doi.org/10.1145/3613905.3651093

17. Gero, K., Swoopes, T., Xu, Z., Kimber, L., & Glassman, E. L. (2024). Supporting sensemaking of large language model outputs at scale. *Proceedings of the 2024 CHI Conference on Human Factors in Computing Systems.* ACM. https://doi.org/10.1145/3613904.3642139. Preprint: arXiv:2401.13726.

18. Dubiel, M., Daronnat, S., & Leiva, L. A. (2022). Conversational agents trust calibration: A user-centred perspective to design. *Proceedings of the 4th Conference on Conversational User Interfaces (CUI 2022).* ACM. https://doi.org/10.1145/3543829.3544518

19. Schmidhuber, J., Schlögl, S., & Ploder, C. (2021). Cognitive load and productivity implications in human-chatbot interaction. *2021 IEEE 2nd International Conference on Human-Machine Systems (ICHMS).* Also available: arXiv:2111.01400.

20. [Anon. chapter] (2024). How AI chatbot response style affects cognitive load and performance in educational tasks. In *Proceedings [title not fully recoverable].* Springer. https://link.springer.com/chapter/10.1007/978-3-032-13012-9_14

21. Kaikkonen, A., et al. Effects of response length on user search experience in spoken conversational search. Springer (ECIR proceedings). https://link.springer.com/chapter/10.1007/978-3-032-02215-8_17

22. Kiesel, J., et al. (2026). Exploratory search with generative AI: An empirical study on the impact of interaction design strategies on information exploration and cognitive load. *International Journal of Human-Computer Studies.* https://doi.org/10.1016/j.ijhcs.2026.x (retrieved via ScienceDirect)

23. Nielsen, J. (1995; updated). Progressive disclosure. Nielsen Norman Group. https://www.nngroup.com/articles/progressive-disclosure/

24. MAC framework: [Authors]. (2025/2026). MAC: A multi-agent framework for interactive user clarification in multi-turn conversations. *IWSDS 2026.* ACLAnthology: https://aclanthology.org/2026.iwsds-1.1.pdf. FATA framework: arXiv:2508.08308.

25. Larson, B. (2025). 8 principles for conversational UX design. https://www.bryanlarson.ca/blog/2025/7/20/8-principles-for-conversational-ux-design

26. Connelly, M. et al. (2024). How to design effective conversational AI experiences: A comprehensive guide. *Smashing Magazine.* https://www.smashingmagazine.com/2024/07/how-design-effective-conversational-ai-experiences-guide/
