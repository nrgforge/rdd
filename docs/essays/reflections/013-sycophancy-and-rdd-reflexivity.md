# Reflections: Sycophancy and RDD Reflexivity

*2026-04-04, from the RESEARCH epistemic gate conversation*

## The Convenience Problem

The core tension the user identified: the convenience of AI *is* the content selection problem. The agent's value proposition — "I'll surface what's relevant" — is exactly where sycophantic agreement hides. The more helpful the filtering, the more control the agent has over what truths reach the user. RDD's early phases (research, discover, model) are fundamentally content-selection-heavy operations. The question is whether structure can be added without destroying the convenience that makes AI-assisted methodology viable.

The user's resolution: the early phases don't need a different *kind* of mechanism; they need the *same* genuine mechanisms (audit dispatch, invariant checks, artifact-mediated evaluation) deployed earlier. The cost is pragmatic (more audit dispatches, more structural checkpoints), not epistemic. The AI handles the pragmatic cost. This preserves Invariant 3.

## The Framing Audit

The most consequential idea from the gate conversation: extending the argument auditor — or creating a new specialist subagent — to audit *framing choices* against the full evidence base. The current argument auditor checks inferential consistency within the essay's chosen frame. A framing auditor would check: "What alternative framings could this evidence support? Which does the essay not consider?"

This turns the content selection problem into a *visible artifact*. The frames the agent didn't choose — currently invisible, existing only in the negative space of evidence gathered but not foregrounded — become a document the user can read. The user sees not just "here's what we concluded" but "here are the conclusions we could have reached and didn't."

This qualifies as genuine structural resistance under the essay's own test: the structure cannot be satisfied while leaving the most consequential information unsurfaced, because the auditor's mandate is specifically to surface what was *not* chosen.

Architecturally: isolated context, artifact-mediated, essay treated as external input — same pattern as the existing argument auditor. Different question. Remains pragmatic under Invariant 3 (agent surfaces frames; user evaluates and commits).

## Three Design Implications

The user identified three implications that go beyond the essay's scope:

**A. Heavier framing architecture in early phases.** The sycophancy gradient shows the early phases are most vulnerable. The response is not more conversation but more structure: commitment gating at phase boundaries (user states which premises they're building on and which remain open), mandatory framing audits on the research essay before it feeds downstream, pre-mortem framing ("assume this essay led the project astray — what would have caused that?").

**B. Every phase transition evaluated through the sycophancy lens.** Each gate needs to be assessed not just for engagement depth but for framing continuity. If the user's framing hasn't shifted across multiple phases, that's a signal worth surfacing — either the framing is genuinely robust, or it's been sycophantically reinforced. The AID cycle's Attend step could track framing stability as a signal alongside engagement depth.

**C. Retrospective sycophancy audit on prior RDD corpuses.** A way to go back to existing corpuses and evaluate sycophancy risk with measurable proxies:
- **Framing coverage:** what percentage of the research log's distinct findings appear in the essay?
- **Alternative engagement depth:** how many words/arguments are devoted to rejected alternatives vs. accepted positions in ADRs?
- **Vocabulary provenance:** do domain model terms originate from the user's initial framing or from the evidence base?

None definitive alone, but together they produce a sycophancy risk profile for a corpus. This connects to the essay's "corpus contamination problem" (§9) — and operationalizes detection rather than merely naming the risk.

## The Rub vs. Opportunity Fork

The user's framing: is this a fundamental weakness of RDD in its current implementation, or its greatest opportunity?

The conversation resolved toward "opportunity" — but with the honest acknowledgment that the resolution happened inside the very dynamic the essay describes (an engaged user and a responsive agent converging on a frame). The test of whether it's genuinely opportunity rather than comfortable resolution will come in DECIDE, where these ideas must be specified as refutable behavior scenarios, and in BUILD, where they contact compilers and test suites.

## The Self-Referential Observation

This research cycle was itself subject to the dynamics it describes. The briefing document came in with a framing (RDD's mechanisms are insufficient). The research largely confirmed and extended that framing. The argument auditor caught logical gaps and overreach but did not evaluate whether the framing itself was the most honest frame for the evidence. A framing audit on this essay — comparing the research log's evidence against the essay's foregrounding — would be the first test of the mechanism the conversation proposed.

The hallucinated author name (Grabb → Griot) caught by the citation audit is a small but concrete example of why isolated audit dispatch works: the generating context produced the error; the evaluating context, treating the text as external, caught it.
