## Literature Review: Under What Conditions Does Agent Pre-Triage With an Inspectable Record Preserve the Principal's Authority Rather Than Erode It?

**Date:** 2026-09-04
**Method:** Systematic literature search (targeted, three bounded literatures)
**Cycle:** RDD 020 BUILD WP-I — named grounding action for ADR-100's Conditional Acceptance

---

### 1. Methodology

**Purpose and constraint.** ADR-100 (Pre-Triage and Plain-Language Presentation at Practitioner-Facing Moments) holds Conditional Acceptance with no RESEARCH-phase trail; its own §Scope, tier, and grounding names three literatures as the grounding action for the Conditional period: management by exception, escalation and hand-off in human-automation teaming, and triage in human-AI decision systems. This review runs that grounding action. Per the task brief, any recommendation this review surfaces is carried to Cycle 021's DECIDE, not applied in BUILD. This document does not amend ADR-100.

**Search strategy.** Eighteen targeted web searches were run across the three named literatures plus adjacent supporting bodies of work needed to answer the specific question (meaning-of-control philosophy, automation-complacency psychology, and one direct real-world analogue — SRE alerting practice — that shares ADR-100's own problem shape: what must interrupt a person versus what may be logged). Searches targeted, per literature: (1) the origin and leadership-research operationalization of management by exception (Bittel; Bass; Judge & Piccolo meta-analysis; Billings' aviation automation, which names MBE and "management by consent" as automation modes and bridges literatures 1 and 2); (2) function allocation and levels-of-automation taxonomies (Fitts; Sheridan & Verplank; Parasuraman, Sheridan & Wickens; Endsley & Kaber; Kaber & Endsley on adaptive automation), automation bias/complacency, and the alarm-fatigue failure case (Woods; Cvach; Sendelbach & Funk), plus the SRE alerting-philosophy analogue; (3) learning-to-defer and selective prediction (Madras, Pitassi & Zemel; Mozannar & Sontag; El-Yaniv & Wiener; Geifman & El-Yaniv), the triage-as-optimization framing (Raghu et al.), AI-assisted content moderation as the deployed triage case (Gorwa, Binns & Katzenbach), and the principal-agent framing of AI-to-human delegation (Guggenberger et al.), which is the literature's most direct engagement with the question's own vocabulary. Meaningful-human-control philosophy (Santoni de Sio & van den Hoven) was added as a cross-cutting frame because it supplies the two conditions — tracking and tracing — that the research question's "preserve authority / erode it" distinction turns out to need.

**Filtering decisions.** Grey literature on AI-to-human escalation design (vendor blogs on chatbot handoff, agentic-AI escalation triggers) surfaced consistently and converges with the peer-reviewed findings on confidence, disagreement, and irreversibility as escalation triggers. It is not cited as authority — none of it is peer-reviewed, several sources are vendor marketing for escalation products — but its convergence with Mozannar & Sontag (2020) and Raghu et al. (2019) is noted in the synthesis as corroboration, not as an independent source of weight. Two 2026 arXiv preprints on disagreement-based multi-agent routing were found and are not cited as sources; they are unreviewed and the peer-reviewed learning-to-defer literature already supports the same point with more rigor.

**What was not findable.** No literature in any of the three searched bodies addresses a three-way disposition scheme (resolve / carry forward / pivot) as a named construct. Levels-of-automation taxonomies are graded (Sheridan & Verplank's ten levels; Parasuraman et al.'s four stages) but none names a "held open, not yet decided" middle category distinct from both full automation and full human decision the way ADR-100's "carry forward" does. This is recorded as a gap in §9, not resolved by synthesis.

**Coverage confidence.** Management by exception's organizational and leadership-research core (Bittel; Bass; Judge & Piccolo) is well-established and independently verified; confidence is high. Function allocation and levels-of-automation are foundational human factors literature with strong replication across decades; confidence is high. Alarm fatigue is an extensively documented empirical literature in patient safety; confidence is high. Learning-to-defer and selective prediction are active, rigorous machine-learning subfields with clear theoretical results; confidence is high on the theory, moderate on how well it transfers to a non-statistical, single-instance triage task like ADR-100's (these methods assume a trained, calibrated model over many instances; an LLM orchestrator triaging qualitative findings is a much less quantified setting). The principal-agent AI-delegation literature is thin — one directly on-point paper (Guggenberger et al. 2023) was found, not a mature subfield; confidence is moderate. Content moderation as a deployed triage case is well-documented at the governance-critique level (Gorwa et al.) but the review did not find peer-reviewed empirical studies of moderator outcomes under different triage-transparency regimes; confidence is moderate.

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Bittel, L. R. | Management by Exception: Systematizing and Simplifying the Managerial Job | 1964 | McGraw-Hill | Names and systematizes MBE in general management theory |
| 2 | Bass, B. M. | Leadership and Performance Beyond Expectations | 1985 | Free Press | Origin of active/passive MBE within transactional leadership |
| 3 | Judge, T. A., & Piccolo, R. F. | Transformational and Transactional Leadership: A Meta-Analytic Test of Their Relative Validity | 2004 | Journal of Applied Psychology, 89(5), 755–768 | Empirical test: MBE (active and passive) inconsistently related to leadership outcomes |
| 4 | Billings, C. E. | Aviation Automation: The Search for a Human-Centered Approach | 1997 | Lawrence Erlbaum Associates | Names "management by consent" vs. "management by exception" as automation modes; human-centered automation principles (inspectability, predictability) |
| 5 | Fitts, P. M. (Ed.) | Human Engineering for an Effective Air-Navigation and Traffic-Control System | 1951 | National Research Council, Committee on Aviation Psychology | Origin of function allocation (MABA-MABA); static, capability-based allocation |
| 6 | Sheridan, T. B., & Verplank, W. L. | Human and Computer Control of Undersea Teleoperators | 1978 | MIT Man-Machine Systems Laboratory | Ten-level graded automation taxonomy; origin of "levels of automation" |
| 7 | Parasuraman, R., Sheridan, T. B., & Wickens, C. D. | A Model for Types and Levels of Human Interaction with Automation | 2000 | IEEE Trans. Systems, Man, and Cybernetics—Part A, 30(3), 286–297 | Four-stage model; identifies analysis/decision-selection automation as highest-risk to automate |
| 8 | Endsley, M. R., & Kaber, D. B. | Level of Automation Effects on Performance, Situation Awareness and Workload in a Dynamic Control Task | 1999 | Ergonomics, 42(3), 462–492 | Intermediate levels of automation preserve situation awareness better than full automation |
| 9 | Kaber, D. B., & Endsley, M. R. | The Effects of Level of Automation and Adaptive Automation on Human Performance, Situation Awareness and Workload in a Dynamic Control Task | 2004 | Theoretical Issues in Ergonomics Science, 5(2), 113–153 | Adaptive (conditional, dynamically-reallocated) automation outperforms any single fixed level |
| 10 | Woods, D. D. | The Alarm Problem and Directed Attention in Dynamic Fault Management | 1995 | Ergonomics, 38(11), 2371–2393 | Alarm volume degrades directed attention independent of individual-alarm correctness |
| 11 | Cvach, M. | Monitor Alarm Fatigue: An Integrative Review | 2012 | Biomedical Instrumentation & Technology, 46(4), 268–277 | Up to 171 alarms/bed/day; over-escalation causes habituation and disabling |
| 12 | Sendelbach, S., & Funk, M. | Alarm Fatigue: A Patient Safety Concern | 2013 | AACN Advanced Critical Care, 24(4), 378–386 | 72–99% of clinical alarms false/non-actionable; the named failure case's core statistic |
| 13 | Parasuraman, R., & Manzey, D. H. | Complacency and Bias in Human Use of Automation: An Attentional Integration | 2010 | Human Factors, 52(3), 381–410 | Vigilance on a checking task degrades as trust in a usually-reliable filter increases |
| 14 | Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.) | Site Reliability Engineering: How Google Runs Production Systems (Ch. 6, "Monitoring Distributed Systems") | 2016 | O'Reilly Media | Deployed real-world analogue: symptom-based, actionable-only paging vs. log-only |
| 15 | Madras, D., Pitassi, T., & Zemel, R. | Predict Responsibly: Improving Fairness and Accuracy by Learning to Defer | 2018 | NeurIPS 2018 (arXiv:1711.06664) | Formalizes triage as joint optimization of automated decision + deferral |
| 16 | Mozannar, H., & Sontag, D. | Consistent Estimators for Learning to Defer to an Expert | 2020 | ICML 2020, PMLR 119 | Bayes-optimal deferral rule is a calibrated-confidence comparison, not a content rule |
| 17 | Raghu, M., Blumer, K., Corrado, G., Kleinberg, J., Obermeyer, Z., & Mullainathan, S. | The Algorithmic Automation Problem: Prediction, Triage, and Human Effort | 2019 | arXiv:1903.12220 | Triage as resource allocation; uncertainty/disagreement heuristics yield large gains |
| 18 | El-Yaniv, R., & Wiener, Y. | On the Foundations of Noise-free Selective Classification | 2010 | Journal of Machine Learning Research, 11, 1605–1641 | Formal risk-coverage tradeoff for abstention/deferral, tunable to a target error rate |
| 19 | Geifman, Y., & El-Yaniv, R. | SelectiveNet: A Deep Neural Network with an Integrated Reject Option | 2019 | ICML 2019, PMLR 97 | Practical instantiation of the risk-coverage tradeoff in a trainable system |
| 20 | Gorwa, R., Binns, R., & Katzenbach, C. | Algorithmic Content Moderation: Technical and Political Challenges in the Automation of Platform Governance | 2020 | Big Data & Society, 7(1) | Deployed AI-triage-plus-human-review case; opacity in triage voids accountability even with human review |
| 21 | Guggenberger, T., Lämmermann, L., Urbach, N., Walter, A. M., & Hofmann, P. | Task Delegation from AI to Humans: A Principal-Agent Perspective | 2023 | ICIS 2023 Proceedings | Direct principal-agent framing of AI filtering what a human sees; classical PAT monitoring mechanisms found insufficient |
| 22 | Santoni de Sio, F., & van den Hoven, J. | Meaningful Human Control over Autonomous Systems: A Philosophical Account | 2018 | Frontiers in Robotics and AI, 5, Article 15 | Tracking/tracing conditions for control to remain meaningful under automation |

---

### 3. Literature Map

The three literatures sit at increasing levels of formalization and decreasing institutional maturity, and they connect through two bridge points found in the search rather than assumed in advance.

```
Management by Exception (organizational control, 1903/1964; leadership, 1985/2004)
        │
        │  Billings (1997): aviation automation names MBE and "management by
        │  consent" as automation modes — the bridge from leadership theory
        │  to human-automation teaming.
        ▼
Escalation & Hand-off in Human-Automation Teaming (function allocation 1951;
levels of automation 1978/2000; adaptive automation 1999/2004; alarm fatigue
1995/2012/2013; automation complacency 2010; SRE alerting practice 2016)
        │
        │  Parasuraman, Sheridan & Wickens (2000): the "analysis/decision-
        │  selection" automation stage is exactly what pre-triage does —
        │  the bridge from teaming theory to content-selection risk, which
        │  triage-in-human-AI-decisions treats formally.
        ▼
Triage in Human-AI Decision Systems (learning-to-defer 2018/2020; selective
prediction 2010/2019; triage-as-optimization 2019; content moderation 2020;
principal-agent AI delegation 2023)
```

Management by exception supplies the *type* of escalation rule (deviation-from-standard) and a documented caution that the mechanism, taken alone, has weak empirical support for improving outcomes (Judge & Piccolo 2004). Human-automation teaming supplies the *structural* vocabulary for why content-selection automation is the highest-risk stage to automate and names the volume failure mode (alarm fatigue) that is the mirror image of the under-escalation failure ADR-100 is built to avoid. Human-AI triage supplies *formal* escalation criteria (confidence, disagreement, calibrated risk-coverage tradeoffs) and the sharpest available conceptual match to the research question's own terms (principal, agent, authority). Meaningful-human-control philosophy (Santoni de Sio & van den Hoven 2018) sits outside the three named literatures but is the frame the synthesis in §5 uses to state the answer, because none of the three literatures on its own defines what "preserving authority" formally means — this one does.

---

### 4. Per-Literature Findings

#### 4.1 Management by Exception

Management by exception names the practice of reserving a manager's or leader's attention for deviations from an established standard, leaving in-tolerance operation to run without intervention. Bittel (1964) coined and systematized the term for general management practice; the concept traces conceptually to Taylor's *Shop Management* (1903), which argued for focusing supervisory attention on significant deviations rather than continuous oversight of all operations (attribution via secondary source, not independently checked against Taylor's original text this session).

In leadership research, Bass (1985) placed MBE inside the transactional leadership dimension of the full-range leadership model, later split into two variants and operationalized through the Multifactor Leadership Questionnaire: *active* MBE (the leader monitors continuously and intervenes before a deviation becomes a crisis) and *passive* MBE (the leader waits for a deviation to surface on its own before intervening, sometimes glossed "if it ain't broke, don't fix it"). This distinction matters directly for ADR-100: rule 1's "resolve" disposition, run every practitioner-facing moment with the agent checking its own output as it goes, is structurally active MBE; a design that deferred triage entirely to the next isolated-snapshot boundary (part of rejected alternative D, and in a weaker form the isolated-reader cadence ADR-100 already has) is structurally closer to passive MBE.

Judge and Piccolo's meta-analysis (2004; 626 correlations, 87 sources) is the empirical caution this literature contributes: contingent reward and transformational leadership had strong, consistent relations to leadership-effectiveness criteria; MBE, active and passive combined, was **inconsistently related** to those criteria. This does not show MBE-shaped escalation is harmful — it shows that the mechanism's structural shape (act on the routine, escalate the exception) is not self-validating. Whether it helps or hurts turns on how well the standard/criterion for "deviation" is calibrated and on factors the meta-analysis's leadership frame doesn't capture (an inspectable record, an independent check) — precisely the two conditions Billings' aviation-automation work names next.

Billings (1997) is the strongest single finding in this literature for ADR-100's specific mechanism, because it names MBE as one of two automation modes on the flight deck and contrasts it with "management by consent" (MBC): under MBE, automation acts autonomously and alerts the pilot only when something falls outside tolerance; under MBC, automation proposes and the pilot must explicitly approve before it acts. This maps cleanly onto ADR-100's own disposition scheme — "resolve" is MBE (agent acts, logs, no consultation absent deviation); "pivot" is MBC (agent proposes, practitioner rules). Billings' human-centered automation principles require that automation remain *predictable* and *inspectable* to the human it operates alongside, and warn that MBE-mode automation, when its criteria for "exception" are miscalibrated or its resolutions are not visible, erodes the operator's mode awareness — the operator loses track of what the automation has been doing on its own, which degrades their ability to intervene competently when it matters. This is the aviation-automation-literature version of the risk ADR-100's own Consequences section names for rule 1: "a pivot hidden under 'resolve' mid-phase is caught late."

#### 4.2 Escalation and Hand-off in Human-Automation Teaming

Function allocation begins with Fitts (1951): a static, capability-based assignment of tasks to whichever party — human or machine — is "better at" them (the MABA-MABA list). This is a fixed allocation, not a per-instance triage decision, and the literature (per search summaries of later commentary) now treats the Fitts list as outdated for exactly that reason: it doesn't scale to systems where the right allocation varies case by case, which is ADR-100's actual situation (findings vary in whether they're a pivot).

Sheridan and Verplank (1978) supplied the graded alternative: a ten-level taxonomy running from full manual control to full autonomy, with intermediate levels differentiated by *when* the human is informed and *whether* they can act before or only after the automation does. Parasuraman, Sheridan and Wickens (2000) generalized this into a four-stage model — information acquisition, information analysis, decision/action selection, action implementation — and argued the level of automation should be set independently per stage, because the stages carry different risk. Their central finding for this review: automating *information acquisition* and *action implementation* is comparatively low-risk; automating *analysis* and *decision/action selection* — i.e., deciding what gets surfaced to the human and how it's framed — is the highest-risk stage to automate, because it shapes what the human even perceives as a decision to make. Pre-triage, as ADR-100 itself names in §Where the isolation lives, is exactly this stage: content selection. The model's design guidance is not "don't automate this stage" but "this is the stage that most needs an independent check," which is a direct, literature-grounded argument for placing a check on the triage record specifically (as rule 5 plus the isolated snapshot already do) rather than only checking outcomes.

Kaber and Endsley (1999, 2004) add the dynamic dimension: intermediate levels of automation better preserve situation awareness than full automation, but the best-performing fixed level is not the level that best preserves situation awareness, and — the 2004 paper's central result — *adaptive* automation (dynamically reallocating the level of automation over time, in response to workload or performance signals) outperforms any single fixed level on the combined measure. This is directly relevant to the choice ADR-100 frames as binary in rejected alternative D (in-context triage always, versus isolated triage always): the adaptive-automation literature's finding is that neither extreme is generally optimal, and a conditional, signal-triggered reallocation between them typically beats both.

Alarm fatigue is the failure case the task brief names, and it documents the mirror-image harm to the one ADR-100 addresses. Sendelbach and Funk (2013) report 72–99% of clinical alarms are false or non-actionable; Cvach (2012) reports up to 171 alarms per monitored bed per day. Woods (1995) supplies the mechanism: dynamic fault management depends on *directed attention*, a scarce resource, and a system that doesn't discriminate signal from noise degrades the human's ability to direct attention to what matters — regardless of whether any single alarm, taken alone, was "correct" to fire. The behavioral endpoint, replicated across the alarm-fatigue literature, is habituation: clinicians stop responding to alarms, or disable them outright, including the true positives. This is the volume-side failure that Adjudication Load (ADR-100's own motivating concept) names for the practitioner's case, and it is direct support for treating the *rate* of escalation, not only its accuracy, as something ADR-100's mechanism must bound — which rule 7 (one screen, one ruling) addresses as presentation but which no rule in ADR-100 currently bounds as a resolve-disposition rate.

Parasuraman and Manzey's review (2010) supplies a caution specific to ADR-100's own graduation-trigger design. Automation complacency — reduced monitoring of an automated aid that is usually reliable — is well replicated and is not overcome by simple practice; it worsens as trust in the aid increases, which happens precisely as the aid's track record improves. ADR-100's graduation trigger names a "Relaxation" path: if snapshots find the triage clean across two to four cycles, the snapshot brief's triage evaluation is reduced to a spot check. The complacency literature's finding is that this is exactly the condition under which the checking party's own vigilance is most likely to degrade — not a reason the mechanism is wrong, but a specific, named risk in one clause of ADR-100's own design that the literature flags and that this review did not go looking for; it surfaced from the search.

The SRE alerting-philosophy literature (Beyer et al. 2016, Ch. 6) is not one of the three named literatures but is the closest deployed real-world analogue to ADR-100's own domain: a software/process team deciding what must interrupt an on-call human versus what may be logged. Its rule: page (interrupt a human) only for symptom-based, actionable, imminent-or-active user-impacting conditions; log everything else to a dashboard without paging. The criterion is a compound of *actionability* and *urgency*, not magnitude of deviation alone. This is included because it names, in a domain adjacent to software engineering process rather than clinical or leadership settings, a second axis — urgency/actionability — that management by exception's single deviation-from-standard axis does not separately name, and that bears directly on whether ADR-100's content-class pivot criterion needs a second dimension.

#### 4.3 Triage in Human-AI Decision Systems

Learning-to-defer formalizes triage as a joint optimization: which instances an automated system decides, and which it defers to a human or expert, learned from where the automated system is weak relative to the human (Madras, Pitassi & Zemel 2018). Mozannar and Sontag (2020) prove that the Bayes-optimal deferral rule takes a specific, intuitive form: defer exactly when the estimated probability the human/expert is correct exceeds the model's own confidence in its best answer. The escalation trigger this literature validates is a **calibrated confidence comparison** — a different axis from ADR-100's pivot criterion, which is purely content-class ("changes what gets built, for whom, or why"). ADR-100 does not currently ask whether the triaging agent is confident in its own disposition of a given finding; this literature says that question is, in the formal optimum, at least as important as what the finding is about.

Raghu et al. (2019) reframe triage explicitly as a resource-allocation problem — which instances to hand to the algorithm versus reserve for human effort — and show that simple heuristics keyed to model uncertainty or human-model disagreement produce large performance gains over both full automation and full human review, even in heavily studied medical-prediction settings. This is independent, triage-specific corroboration (not just a formal proof) for disagreement and uncertainty as first-class escalation signals.

Selective prediction (El-Yaniv & Wiener 2010; Geifman & El-Yaniv 2019) supplies a formal vocabulary this review borrows for evaluating ADR-100's own graduation trigger: the risk-coverage tradeoff. A system that abstains on low-confidence cases can guarantee an arbitrarily low error rate on the cases it does resolve, at the cost of resolving fewer cases outright (lower coverage), and the tradeoff is tunable to a target risk level rather than fixed. Read against ADR-100, the "harm" and "reliance" directions in the graduation trigger are, in this vocabulary, a risk-coverage evaluation of the resolve disposition specifically — and the field's standard practice is to report the tradeoff as a curve across many instances, not as a verdict from three boundaries. This is a methodological observation, not a rule change; it belongs in the "moves" category of §7 as a suggestion for *how* future cycles evaluate the graduation trigger, not what the trigger's threshold should be.

Content moderation (Gorwa, Binns & Katzenbach 2020) is the deployed case that most resembles ADR-100's actual configuration — an automated system filters, a human formally reviews the output. The paper's central governance critique is that opacity at the triage stage voids accountability even when a human genuinely reviews what reaches them, because the human is reviewing the automated system's *selected subset*, not the space of cases that existed before filtering; a human "in the loop" over an opaque filter is not meaningfully in the loop over the filtering decision itself. This is strong, independent corroboration that ADR-100's rule 5 (a written, not implied, record) is necessary — and the paper's critique is aimed precisely at systems that lack what rule 5 provides.

The principal-agent framing (Guggenberger et al. 2023) is the literature's most direct engagement with the research question's own vocabulary: it studies AI-to-human delegation as an inversion of classical principal-agent theory, where the agent (the AI) decides what reaches the principal (the human) rather than the reverse. Its finding is a caution, not an endorsement: classical PAT mechanisms for controlling agent behavior — monitoring, incentive alignment, screening — assume the principal has an independent channel through which to observe the agent, and that assumption breaks when the agent itself controls the channel of observation. An inspectable record is a monitoring channel, but if only the party under audit produces and characterizes that record, the channel is not independent in the sense classical PAT requires. This converges exactly with ADR-100's own diagnosis in §Where the isolation lives ("pre-triage is content selection by the party whose selection is under audit") and is direct support for why the check must be run by a genuinely separate reader (the isolated snapshot), not by the orchestrator's own account of its own triage.

Santoni de Sio and van den Hoven (2018), while not one of the three named literatures, supplies the two conditions the synthesis in §5 uses to answer the research question directly: **tracking** (the automated system's behavior remains responsive to the human principal's actual reasons, not the agent's invented ones) and **tracing** (a chain of accountability leads back to an informed human who can be held responsible for what happened). Control can remain meaningful even when most of the work is automated, provided both conditions hold.

---

### 5. Cross-Literature Synthesis

**The direct answer to the research question.** Read together, the three literatures converge on a two-condition answer, matching Santoni de Sio and van den Hoven's tracking/tracing frame closely enough that this review adopts it as the organizing structure rather than inventing a fourth frame:

Pre-triage preserves the principal's authority when **(1) tracking** holds — the disposition criterion is anchored to the principal's own stated concern, not the agent's invention (management by exception's deviation-from-standard, applied to a standard the practitioner set; Parasuraman/Sheridan/Wickens's warning that the decision-selection stage is the one that most needs to stay answerable to human reasons) — **and (2) tracing** holds — an inspectable, independently-produced-and-read record exists and is actually read by a party that does not share the triaging agent's incentives or blind spots (Billings' inspectability principle; Guggenberger et al.'s point that a monitoring channel controlled by the audited party is not independent; Gorwa et al.'s critique of unaccountable filtering). Neither condition alone suffices. Tracking without tracing is Billings' warning: an agent faithfully applying the practitioner's own criterion can still miscalibrate silently, and Judge and Piccolo's meta-analysis shows the mechanism's shape doesn't self-correct that. Tracing without tracking is the alarm-fatigue failure inverted: a fully logged, fully auditable system that escalates on the wrong criterion just produces an accurately-recorded stream of either useless interruptions (alarm fatigue) or missed pivots (silent erosion) — the record makes the failure legible after the fact but doesn't prevent it.

Pre-triage erodes authority when either condition fails silently: when the criterion drifts from the practitioner's actual concern without them noticing (tracking failure — this is what rule 2's own gloss on Invariant 0 exists to prevent, and what ADR-100 itself reports happening at three boundaries before the ADR existed), or when the record exists but isn't read by a genuinely independent party, or is read by a party whose vigilance has degraded because the filter has been reliable so far (tracing failure — Parasuraman & Manzey's complacency finding, aimed specifically at ADR-100's own Relaxation clause).

**On the escalation rule.** All three literatures converge on a content-class trigger as necessary (management by exception's variance-from-standard; the alarm literature's insistence that only actionable, meaningful deviations should interrupt; content moderation's practice of flagging policy-relevant cases) but not one of the three treats a content-class trigger as sufficient on its own. Each supplies an additional axis ADR-100's current pivot criterion does not name:

- **Confidence/disagreement** (learning-to-defer; selective prediction; Raghu et al.'s uncertainty heuristics): escalate not only on what a finding is about, but on how confident the triaging agent is that its disposition of it is correct, and whether the finding reflects an unresolved disagreement rather than a clean call.
- **Irreversibility/actionability** (the SRE alerting analogue; general escalation-design convention converging across the grey literature, though that convergence is not independently weighted here): escalate on cost-of-being-wrong, not only on category of content — a low-content-magnitude finding that is nonetheless expensive or impossible to undo later is a different risk than a high-content-magnitude finding that is cheap to correct downstream.
- **Rate** (alarm fatigue; Woods 1995): the escalation rule must also bound how often it fires, because a rule that escalates accurately but too often degrades the human's ability to direct attention to what matters, independent of any individual escalation's correctness — this is a volume constraint on the rule as a whole, not a property of any individual disposition decision.

**On rejected alternative D.** No literature reviewed recommends the binary ADR-100 frames (in-context triage always, versus isolated triage always). The adaptive-automation literature (Kaber & Endsley 2004) is the most direct evidence against treating this as a binary choice at all: a fixed allocation, whichever one is chosen, is generally beaten by a conditional, signal-triggered reallocation. Applied to ADR-100's own choice, this suggests a third option the ADR's rejected-alternatives list does not name in this form: keep in-context triage as the default (rules 1–5 as specified) but trigger an isolated-context triage pass — not merely an isolated *check* of the record after the fact, but isolated triage of the specific finding — when a signal fires (low confidence in the disposition, human-agent disagreement about the disposition, or a finding whose resolve-disposition would be costly or impossible to reverse). This is weaker than full alternative D (which the ADR's own record shows was correctly rejected on cost grounds — the cycle's evidence that the compound of orchestrator-triage-plus-isolated-reader caught errors at all three boundaries is real and this review does not contest it) and stronger than the status quo, which triggers isolation only on a fixed phase-boundary cadence regardless of any signal about a specific finding.

---

### 6. Mapping Findings onto ADR-100's Mechanism

**(a) The three-disposition scheme and the pivot criterion.** The resolve/pivot poles have direct precedent — Billings' MBE/MBC distinction is structurally the same split, and the graded-automation literature (Sheridan & Verplank; Parasuraman et al.) validates a multi-level, non-binary disposition scheme as more descriptively accurate than an all-or-nothing allocation. The pivot criterion's content-class shape ("changes what gets built, for whom, or why") is the type of criterion all three literatures endorse as a necessary axis. It is not, in any of the three literatures, treated as a *sufficient* axis on its own — each adds either a confidence/disagreement dimension (literature 3) or an urgency/irreversibility dimension (literature 2's SRE analogue) that rule 2 does not currently state. The "carry forward" disposition has no direct precedent in any of the three literatures reviewed; this is a genuine gap, not a finding against it.

**(b) The isolated reader at the next phase boundary.** Strongly supported in principle: Parasuraman, Sheridan and Wickens name the decision-selection stage as the one most needing independent check; Guggenberger et al. name the specific mechanism (a monitoring channel controlled by the audited party is not independent) that this design avoids by routing the check through a separately-run snapshot; Gorwa et al.'s critique of unaccountable filtering is answered exactly by having an independent party read the record. The literature's caution is about *cadence*, not existence: automation-complacency findings (Parasuraman & Manzey 2010) predict that a check run once per phase boundary, on a mechanism with a strengthening track record, is precisely the profile in which an independent reader's own vigilance is most at risk of degrading — a caution that applies with particular force to ADR-100's own Relaxation clause, which proposes loosening scrutiny exactly when the track record looks clean.

**(c) The framing-class rule (findings that name an alternative are never silently resolved).** The most convergently supported single rule in this review. Content moderation's opacity critique (Gorwa et al.), selective prediction's abstain-on-ambiguous-cases logic, and management by exception's own core concept (an alternative reading the artifact didn't choose is, close to definitionally, the kind of deviation MBE says must surface) all point the same direction. No literature reviewed here recommends narrowing or weakening this rule.

**(d) Rejected alternative D (isolated triage at every practitioner-facing moment).** Not recommended in the all-or-nothing form ADR-100 rejects it in, and the ADR's grounds for rejecting it that form (latency cost; the in-cycle record showing the existing compound mechanism caught all three boundary errors) are not contradicted by anything found. What the literature adds is that the binary framing itself is narrower than the adaptive-automation literature's own finding: a *conditional* escalation of the triage function — isolated triage of a specific finding, triggered by low confidence, disagreement, or irreversibility, layered on top of the existing default — is a design point between "isolated never except at phase boundaries" and "isolated always" that Kaber and Endsley's evidence favors over either extreme, and that ADR-100's current rejected-alternatives list does not name in this graduated form.

---

### 7. Recommendations

These are surfaced for Cycle 021's DECIDE. None is applied here; ADR-100 is unamended by this review.

**Confirms**

1. The content-class pivot criterion (rule 2) as the primary, necessary escalation axis. *(Bittel 1964; Bass 1985; Billings 1997; Parasuraman, Sheridan & Wickens 2000)*
2. A written, independently-read record (rule 5, plus the isolated-snapshot check) as a necessary condition for the mechanism's legitimacy, not an optional strengthening of it. *(Billings 1997; Parasuraman, Sheridan & Wickens 2000; Gorwa, Binns & Katzenbach 2020; Guggenberger et al. 2023)*
3. The framing-class rule (rule 4) exactly as specified — never silently resolved. *(Gorwa, Binns & Katzenbach 2020; El-Yaniv & Wiener 2010; the MBE concept itself)*
4. The rejection of alternative D in its all-or-nothing form, on the grounds ADR-100 already gives. *(Kaber & Endsley 2004, read as evidence against binary framings generally, not as an endorsement of the status quo specifically)*

**Tightens**

5. The pivot criterion (rule 2) should incorporate a confidence/disagreement axis alongside the content-class axis: a finding the triaging agent is not confident it has correctly dispositioned should default toward carry-forward or pivot, independent of whether its content class looks resolvable. *(Mozannar & Sontag 2020; Raghu et al. 2019; Madras, Pitassi & Zemel 2018)*
6. The pivot criterion should incorporate an irreversibility/actionability axis: a finding whose resolve-disposition would be costly or impossible to undo later should escalate even at low content magnitude. *(Beyer et al. 2016, SRE alerting philosophy, offered as a real-world analogue rather than a peer-reviewed finding; convergent but independently unweighted support from grey literature on AI escalation design)*

**Adds**

7. A rate/volume safeguard on the resolve disposition itself: the mechanism should bound or monitor how often "resolve" fires, not only whether each instance was correct, because over-escalation and over-resolution are symmetric failure modes and the alarm-fatigue literature shows accuracy of individual decisions does not prevent volume-driven habituation. No current ADR-100 rule addresses this; rule 7 addresses reading-load presentation, not resolve-disposition rate. *(Woods 1995; Cvach 2012; Sendelbach & Funk 2013)*
8. A complacency safeguard on the isolated reader: the Relaxation path in the graduation trigger, which reduces snapshot scrutiny after a clean track record, runs against the specific mechanism the automation-complacency literature documents (vigilance degrades as trust in a reliable filter increases). An intermittent or unpredictable audit schedule, rather than a monotonic decay to spot-check, would better preserve the check's power if this literature's finding transfers to this setting. *(Parasuraman & Manzey 2010)*

**Moves**

9. A qualified, partial version of alternative D: rather than the current binary (in-context triage with a fixed-cadence isolated check vs. isolated triage at every moment), a conditional escalation of the triage function itself — routing a specific finding to isolated-context triage when a signal fires (low disposition confidence, human-agent disagreement, or high irreversibility) — is the form the adaptive-automation literature favors over either fixed extreme. This is not full alternative D and does not contradict the ADR's cost-based rejection of that; it is a third design point the current rejected-alternatives list does not name. *(Kaber & Endsley 2004)*
10. A methodological note for evaluating the graduation trigger: report the harm/reliance evidence as a risk-coverage tradeoff (accuracy of "resolve" as a function of how much gets resolved) across a larger sample of boundaries, rather than as a verdict from three or four boundaries. This changes how future cycles evaluate the existing trigger, not the trigger's substance. *(El-Yaniv & Wiener 2010; Geifman & El-Yaniv 2019)*

---

### 8. Key Findings

- **Management by exception's structural shape does not self-validate.** Judge and Piccolo's meta-analysis (2004) found MBE (active and passive) inconsistently related to leadership outcomes, in contrast to contingent reward and transformational leadership. The mechanism's value depends on calibration and independent checking, not on the mechanism's shape alone. (Judge & Piccolo 2004)
- **Billings (1997) names the exact mechanism ADR-100 specifies, twenty-nine years earlier, in a different domain.** "Management by exception" (act and log; alert only on deviation) versus "management by consent" (propose and wait for approval) is the aviation-automation-literature version of ADR-100's resolve/pivot split, complete with the same inspectability requirement rule 5 encodes.
- **The stage ADR-100 calls pre-triage is, in human-automation-teaming vocabulary, the highest-risk stage to automate.** Parasuraman, Sheridan and Wickens (2000) identify analysis and decision/action selection — deciding what reaches a human and how it's framed — as riskier to automate than information acquisition or action execution, which is a direct argument for why this specific stage needs an independent check, not an argument against automating it at all.
- **Adaptive automation beats any fixed level, including both of ADR-100's named extremes.** Kaber and Endsley (2004) found that a single fixed level of automation, whichever one, underperforms conditional reallocation. Applied to ADR-100's own choice between in-context triage and rejected alternative D, this favors a signal-triggered middle path over either fixed extreme.
- **Alarm fatigue is the harm ADR-100 is designed to avoid, running in the opposite direction.** 72–99% of clinical alarms are false or non-actionable (Sendelbach & Funk 2013); the harm is not any single false alarm but habituation from volume, including to true positives (Woods 1995). This supports treating escalation rate, not just escalation accuracy, as something the mechanism must bound.
- **The formally optimal escalation rule in learning-to-defer is a confidence comparison, not a content rule.** Mozannar and Sontag (2020) show the Bayes-optimal deferral rule defers when estimated human accuracy exceeds the model's own confidence — an axis orthogonal to ADR-100's current content-class pivot criterion.
- **Content moderation's central governance critique is answered exactly by ADR-100's rule 5.** Gorwa, Binns and Katzenbach (2020) find that opacity at the triage stage voids the accountability of downstream human review, because a human reviewing a filtered subset is not meaningfully reviewing the filtering decision. A written, independently-read record is what closes this gap.
- **Classical principal-agent monitoring mechanisms don't transfer cleanly to AI-to-human delegation.** Guggenberger et al. (2023) find that PAT's usual remedies (monitoring, screening, incentive alignment) assume the principal has an independent observation channel — an assumption that breaks when the agent controls the channel, which is precisely ADR-100's own diagnosis in §Where the isolation lives.
- **Preserving authority requires two conditions together, not one.** Adopting Santoni de Sio and van den Hoven's (2018) tracking/tracing frame: the criterion must stay anchored to the practitioner's actual concern (tracking), and an independent, actually-read record must exist (tracing). Either alone is insufficient, and ADR-100's own in-cycle record — three boundaries where in-context triage erred and an isolated reader caught it — is evidence for tracing working, not evidence that tracking has been solved.
- **No literature reviewed validates or invalidates the "carry forward" disposition as a distinct category.** None of the three literatures names a middle disposition between full automation and full deferral; this is a gap in what the review can say about rule 1, not a finding against it.

---

### 9. Limitations

**Scope was bounded by design, not by search exhaustion.** The task specified three literatures and one question; this review did not attempt the fuller coverage a RESEARCH-phase essay-outline would (per ADR-100's own §Scope, the grounding action is "a targeted lit-review or spike... not a blocking research loop"). Deeper subfields adjacent to all three — e.g., the full sociotechnical-systems literature on incident command and escalation in high-reliability organizations (Weick and Sutcliffe's work was not searched), or the broader AI-safety literature on scalable oversight and amplification, which overlaps with but is distinct from learning-to-defer — were not searched and may bear on the question.

**The learning-to-defer and selective-prediction literatures assume a statistical setting this review did not verify transfers to ADR-100's actual use.** Those methods are proven for a trained classifier making many independent instance-level predictions with a calibratable confidence signal. ADR-100's triage is a single LLM orchestrator making qualitative dispositions of individual findings within one cycle; whether "confidence" in that setting behaves anything like the calibrated probability these theorems assume was not established, and the review flags this as an open transfer question rather than asserting it.

**The principal-agent AI-delegation literature is thin.** One directly on-point paper (Guggenberger et al. 2023) was found; this is not a mature subfield with independent replication, and the finding should be weighted accordingly — corroborating rather than load-bearing on its own.

**Grey literature on AI escalation design was found and excluded from the evidence base, not from the narrative.** Multiple vendor and practitioner sources converge with the peer-reviewed literature on confidence, novelty, and irreversibility as escalation triggers, and this convergence is noted in §5 and §7 as directional corroboration. None of it was independently weighted as a citation-quality source, per the instruction to prioritize peer-reviewed work; a reader should not treat the "Tightens" recommendation on irreversibility (§7.6) as resting on the same evidentiary footing as the "Confirms" recommendations, which rest on peer-reviewed or well-established primary sources.

**Some attributions were not independently verified this session.** Taylor's *Shop Management* (1903) as the conceptual root of MBE is reported via a secondary encyclopedic summary, not checked against Taylor's original text. This is flagged rather than treated as load-bearing; the argument in §4.1 and §5 does not depend on the Taylor attribution being exact.

**No direct empirical study of ADR-100's own mechanism exists, and none could exist yet.** Every finding in this review is a transfer from an adjacent domain (leadership, aviation, clinical alarms, machine learning, content moderation, software incident response) to RDD's specific practitioner-facing gate structure. The in-cycle boundary record ADR-100 itself carries (three-then-four instances across Cycle 020's own gates) remains the only direct evidence about this specific mechanism; this review supplies context for interpreting that record, not a replacement for it.

---

### Sources

1. Bittel, L. R. (1964). *Management by Exception: Systematizing and Simplifying the Managerial Job.* McGraw-Hill.

2. Bass, B. M. (1985). *Leadership and Performance Beyond Expectations.* Free Press.

3. Judge, T. A., & Piccolo, R. F. (2004). Transformational and transactional leadership: A meta-analytic test of their relative validity. *Journal of Applied Psychology, 89*(5), 755–768.

4. Billings, C. E. (1997). *Aviation Automation: The Search for a Human-Centered Approach.* Lawrence Erlbaum Associates.

5. Fitts, P. M. (Ed.). (1951). *Human Engineering for an Effective Air-Navigation and Traffic-Control System.* National Research Council, Committee on Aviation Psychology.

6. Sheridan, T. B., & Verplank, W. L. (1978). *Human and Computer Control of Undersea Teleoperators.* MIT Man-Machine Systems Laboratory.

7. Parasuraman, R., Sheridan, T. B., & Wickens, C. D. (2000). A model for types and levels of human interaction with automation. *IEEE Transactions on Systems, Man, and Cybernetics—Part A: Systems and Humans, 30*(3), 286–297.

8. Endsley, M. R., & Kaber, D. B. (1999). Level of automation effects on performance, situation awareness and workload in a dynamic control task. *Ergonomics, 42*(3), 462–492.

9. Kaber, D. B., & Endsley, M. R. (2004). The effects of level of automation and adaptive automation on human performance, situation awareness and workload in a dynamic control task. *Theoretical Issues in Ergonomics Science, 5*(2), 113–153.

10. Woods, D. D. (1995). The alarm problem and directed attention in dynamic fault management. *Ergonomics, 38*(11), 2371–2393. https://doi.org/10.1080/00140139508925274

11. Cvach, M. (2012). Monitor alarm fatigue: An integrative review. *Biomedical Instrumentation & Technology, 46*(4), 268–277.

12. Sendelbach, S., & Funk, M. (2013). Alarm fatigue: A patient safety concern. *AACN Advanced Critical Care, 24*(4), 378–386.

13. Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors, 52*(3), 381–410.

14. Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.). (2016). *Site Reliability Engineering: How Google Runs Production Systems.* O'Reilly Media. (Ch. 6, "Monitoring Distributed Systems.")

15. Madras, D., Pitassi, T., & Zemel, R. (2018). Predict responsibly: Improving fairness and accuracy by learning to defer. *Advances in Neural Information Processing Systems 31 (NeurIPS 2018).* arXiv:1711.06664.

16. Mozannar, H., & Sontag, D. (2020). Consistent estimators for learning to defer to an expert. *Proceedings of the 37th International Conference on Machine Learning (ICML 2020)*, PMLR 119.

17. Raghu, M., Blumer, K., Corrado, G., Kleinberg, J., Obermeyer, Z., & Mullainathan, S. (2019). The algorithmic automation problem: Prediction, triage, and human effort. arXiv:1903.12220.

18. El-Yaniv, R., & Wiener, Y. (2010). On the foundations of noise-free selective classification. *Journal of Machine Learning Research, 11*, 1605–1641.

19. Geifman, Y., & El-Yaniv, R. (2019). SelectiveNet: A deep neural network with an integrated reject option. *Proceedings of the 36th International Conference on Machine Learning (ICML 2019)*, PMLR 97.

20. Gorwa, R., Binns, R., & Katzenbach, C. (2020). Algorithmic content moderation: Technical and political challenges in the automation of platform governance. *Big Data & Society, 7*(1). https://doi.org/10.1177/2053951719897945

21. Guggenberger, T., Lämmermann, L., Urbach, N., Walter, A. M., & Hofmann, P. (2023). Task delegation from AI to humans: A principal-agent perspective. *Proceedings of the 44th International Conference on Information Systems (ICIS 2023).*

22. Santoni de Sio, F., & van den Hoven, J. (2018). Meaningful human control over autonomous systems: A philosophical account. *Frontiers in Robotics and AI, 5*, Article 15.

**Unverified attributions (flagged per task instruction, not independently confirmed this session):**

- Taylor, F. W. (1903). *Shop Management.* Cited in §4.1 as the conceptual root of management by exception, via a secondary encyclopedic summary rather than direct verification against the original text.
