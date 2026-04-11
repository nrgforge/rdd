# ADR-060: Research Methods Subagent

**Status:** Proposed
**Extends:** ADR-032 (Extract Specialist Subagents from Phase Skills)

## Context

The Cycle 9 research identified that the most sycophancy-susceptible element in the pipeline may be the research questions themselves. If the user's questions presuppose a framing, the research will confirm it — the agent investigates what it is asked, not what it should have been asked. No current mechanism reviews research design before execution.

The spike experiment demonstrated that mandatory structural constraints improve analytical quality — both constraint types surfaced novel observations absent from unconstrained runs. Applying this principle to research design: structured review of the question set before investigation begins could catch confirmation bias in question framing, source selection bias, scope mismatches, and premature hypothesis-space narrowing.

The genuinely novel capability is **cross-cycle methodological pattern detection**: no current mechanism systematically reviews the methodology's own research habits across cycles. (The synthesis phase mines content and conceptual novelty across cycles, but not question-design patterns — recurring tendencies in how the user formulates research questions, not what the research found.) A user who consistently narrows too early, whose research questions consistently presuppose the preferred architecture, or whose source selection skews toward confirming literature — these are patterns visible only across cycles.

## Decision

Add a **Research Methods Subagent** to the specialist subagent roster (ADR-032). This is the eighth specialist subagent.

**Scope (narrowest useful first version):**
- Reads the research question set before the research phase begins
- Applies belief-mapping framing to each question: "What would the researcher need to believe for a different question to be more productive?"
- Flags questions that embed conclusions, presuppose architectures, or narrow the hypothesis space prematurely
- Produces a brief research design review artifact with flagged questions and suggested reformulations

**Cross-cycle pattern detection (deferred to second version):**
- Reads research question sets from prior cycles (stored in research logs)
- Identifies recurring patterns: consistent narrowing direction, preferred-architecture presupposition, source selection skew
- Reports cross-cycle patterns alongside single-cycle flags

**Invocation:** Dispatched by the orchestrator before `/rdd-research` begins its first research loop, and again before any research loop that follows a substantial essay revision (from framing audit findings, discovery feedback, reflection, or the user's own reframing). The research phase is the most vulnerable point in the Sycophancy Gradient and the only phase where the question→investigate→write→audit→revise loop can run multiple times before the pipeline advances — the Research Methods Subagent participates in each pass, not just the first. Runs on Sonnet. Produces an artifact at `./docs/housekeeping/audits/research-design-review-NNN.md`.

**Scope is a sequencing question, not a design question.** The narrow first version is sufficient to validate the concept. Cross-cycle detection is the high-value capability but requires the artifact trail infrastructure to read across cycles. Build narrow, expand if it works.

## Consequences

**Positive:**
- Addresses the earliest point in the Sycophancy Gradient — research questions are upstream of everything else
- Exploits Architectural Isolation (Self-Correction Blind Spot: a fresh context evaluates the questions as external input)
- Cross-cycle detection (when built) addresses a genuinely unserved need — no current mechanism has this capability
- Consistent with existing specialist subagent architecture (ADR-032) and Artifact-Mediated Communication (ADR-031)

**Negative:**
- Adds a pre-execution step to the research phase, increasing time-to-first-result. Mitigated: the review is lightweight (question set is typically 3-7 questions) and runs on Sonnet
- The narrow first version cannot detect cross-cycle patterns — the most valuable capability is deferred. Mitigated: even single-cycle question review catches embedded conclusions and premature narrowing
- The subagent reviews the questions but cannot review the unasked questions — what the user didn't think to investigate. Belief-mapping each question surfaces the question space adjacent to the existing framing, but does not address questions that require a fundamentally different framing to even formulate. The Corpus Contamination problem (Essay 013, §10) identifies this as a known gap: if the framing is sycophantically narrowed, belief-mapping within that framing generates adjacent questions that remain inside the narrow frame. The Research Methods Subagent addresses first-order narrowing; second-order framing capture remains an open problem

**Neutral:**
- The Research Methods Subagent is a Tier 1 unconditional mechanism (ADR-058) — it fires before every research phase regardless of context
- The artifact follows the existing Audit Artifact pattern (summary + prioritized issues + recommendations)
