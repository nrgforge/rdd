# ADR-029: Synthesis Can Re-Enter RESEARCH

**Status:** Proposed

## Context

ADR-012 positions synthesis as "an optional terminal phase." The current synthesis skill states: "Synthesis is the **terminal phase** of the RDD pipeline. There is no next phase." Essay 006 §9 identifies a case where this framing is incomplete.

When a writer tries to tell the story of an RDD cycle in a particular form and discovers that the material does not cohere — the "ingredients" of a recipe don't combine, a braided structure reveals that two strands don't illuminate each other, an explanation for a child reveals the writer cannot explain their own material — that incoherence is a finding. It reveals a gap in understanding that the build phase did not surface, because the build phase tests whether the software works, not whether the concepts hold together under a different structural logic.

Structural experiments (ADR-028) are the primary mechanism for this discovery. The act of trying on a form is itself a mode of inquiry (Writing as Inquiry). A failed experiment does not just fail — it diagnoses. And sometimes the diagnosis is: "We assumed a connection between X and Y that does not exist. That is a research question."

The devising tradition names this pattern: in ensemble-based theater, each realization of a score reveals something new about the material. The synthesis outline, understood as a score rather than a script, participates in the same logic: each realization is both a communicative act and a research act.

## Decision

Synthesis is usually terminal but can re-enter RESEARCH when structural experimentation surfaces new questions the pipeline has not addressed. The loop becomes:

```
RESEARCH → ... → BUILD → SYNTHESIS → RESEARCH (when warranted)
```

The re-entry is not mandatory. Most synthesis cycles will produce an outline and stop. The re-entry is triggered when:

1. A structural experiment reveals an incoherence — a connection assumed during the cycle does not hold under a different structural logic
2. The writer cannot explain the material to the audience the framing conversation identified — the explanation failure is diagnostic
3. The framing conversation surfaces a question that neither the essays, ADRs, nor code address

Re-entry is the writer's decision, not the agent's recommendation. The agent may observe that a structural experiment revealed incoherence, but the writer must articulate the research question. If the writer cannot state the question, the incoherence may be a framing problem (solvable within synthesis), not a research gap.

When re-entry occurs, the finding is recorded in the research log (as a new research question) and the pipeline loops back to RESEARCH at the relevant scope. The re-entry should be scoped narrowly — a specific research question at a specific scope, not a repeat of the entire cycle. The synthesis conversation may pause and resume after the research question is addressed (avoiding redoing journey review and novelty surfacing), or the writer may start a new synthesis conversation after the additional research is complete.

ADR-012 is amended on this specific point — its "terminal" designation is relaxed to "usually terminal." Synthesis remains optional and post-build; what changes is that "terminal" means "usually last," not "cannot loop."

## Consequences

**Positive:**
- Treats structural experimentation as a genuine discovery mechanism, not just a presentation exercise — what the telling reveals about the material matters
- Prevents the pipeline from certifying understanding that the synthesis conversation reveals to be incomplete
- Aligns with Writing as Inquiry — writing toward a conclusion, not up from one, means the writing may change the conclusion
- Makes the pipeline more epistemically honest: if the writer cannot coherently tell the story, something is not understood

**Negative:**
- Creates a potential infinite loop (SYNTHESIS → RESEARCH → ... → SYNTHESIS → RESEARCH) — mitigated by the re-entry being the writer's decision, not an automatic trigger, and by the natural diminishing returns of successive cycles
- Re-entry adds a full pipeline segment to the cycle's total cost — mitigated by scoping re-entry narrowly (a specific research question, not the entire cycle) and by allowing the synthesis conversation to resume rather than restart
- May feel like scope creep for writers who want synthesis to be a clean endpoint — mitigated by the "usually terminal" framing
- The re-entry criteria are judgment calls, not mechanical tests — the writer must articulate the research question, not just observe that a form didn't work

**Neutral:**
- The current synthesis skill's NEXT PHASE section needs updating to reflect that re-entry is possible
- The pipeline's cycle position diagram needs updating (synthesis points back to research with a conditional arrow)
- The domain model already records this: Synthesis "follows or re-enters" terminal Phase (domain model amendment #10)
