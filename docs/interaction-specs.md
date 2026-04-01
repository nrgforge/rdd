# Interaction Specifications

**Derived from:** product-discovery.md (stakeholder models)
**Complements:** scenarios.md (business-rule behavior)

*Note: This file was created during the code-review skill cycle (ADR-043 through ADR-047). Interaction specifications for prior features are not yet backfilled — this is a known gap per ADR-037's derivation method open question.*

---

## Stakeholder: Solo Developer-Researcher (as Reviewer)

**Super-Objective:** "I want the review process to help me understand AI-generated code well enough to own it, not just approve it"

### Task: Review own work package during build (corpus-grounded mode)

**Interaction mechanics:** After completing a scenario group during build and running stewardship checks, the practitioner invokes `/rdd-review`. The skill reads the work package's relevant ADRs, scenarios, and domain model entries. It surfaces review questions grounded in the provenance chain — questions about whether the implementation matches the decisions, whether assumptions hold, and whether the domain vocabulary is used consistently. The practitioner engages with the questions, potentially committing review fixes. The practitioner proceeds to the next scenario group when satisfied.

### Task: Review AI-generated code for ownership verification

**Interaction mechanics:** When AI has generated code (during build or outside it), the practitioner invokes `/rdd-review` to verify they understand what was generated. The skill orients using available RDD artifacts and surfaces questions about the AI-generated code's design intent, tradeoffs, and fit with existing architecture. The practitioner answers the questions — if they cannot, the review has surfaced an opacity gap. The practitioner decides whether to refactor, annotate, or accept the code based on their understanding.

---

## Stakeholder: Team Lead (as Reviewer)

**Super-Objective:** "I want to review a teammate's MR and actually be helpful — not just approve it or parrot AI-generated comments"

### Task: Review a teammate's MR (context-reconstructive mode)

**Interaction mechanics:** The team lead invokes `/rdd-review` and indicates they are reviewing a colleague's MR. The skill enters context-reconstructive mode and asks for breadcrumbs: ticket URL, MR link, relevant docs, or discussion threads. The team lead provides what they have. The agent fetches and synthesizes an orientation summary. The team lead validates or corrects the orientation. The agent surfaces review questions grounded in the validated context — questions about design fitness, assumption validity, reversibility of decisions, and alignment with team goals. The team lead engages with the questions, forming their own assessment. The team lead writes their own review comments in their own words.

### Task: Quick review under time pressure

**Interaction mechanics:** The team lead invokes `/rdd-review` and indicates they have limited time (e.g., 5 minutes). The skill adapts: it performs a faster context-gathering pass, produces a brief orientation, and surfaces 1-2 high-priority questions focused on the most consequential aspect of the change. The team lead engages with these questions. Even under time pressure, the review produces enough understanding for the team lead to discuss the MR with informed judgment.

### Task: Review within an RDD-scoped project the team lead owns

**Interaction mechanics:** When the team lead runs RDD through ARCHITECT and hands off BUILD, they may later review team members' implementations against the artifacts they produced. The skill enters corpus-grounded mode, reads the relevant work package's ADRs and scenarios (which the team lead wrote), and surfaces questions about whether the implementation matches the decisions. The team lead's deep familiarity with the artifacts makes this mode especially effective — they know the provenance chain because they built it.

---

## Stakeholder: Teammates / Collaborators (as Reviewer)

**Super-Objective:** "I want to review a colleague's MR without feeling like I'm just going through the motions"

### Task: Review a colleague's MR in an unfamiliar area

**Interaction mechanics:** The teammate invokes `/rdd-review` for a colleague's MR in a codebase area they are less familiar with. The skill enters context-reconstructive mode and asks for breadcrumbs. The teammate provides what they can find (ticket, docs). The agent synthesizes orientation. The teammate validates or corrects. The agent surfaces review questions — these serve a dual purpose: guiding the review AND teaching the teammate about this area of the codebase. By engaging with the questions, the teammate learns something about the system they didn't know before. The review is both a quality gate and a learning opportunity.

### Task: Review a colleague's MR using existing RDD artifacts

**Interaction mechanics:** The teammate is reviewing an MR in a project that uses RDD. They invoke `/rdd-review` in corpus-grounded mode. The skill reads the relevant artifacts, giving the teammate orientation they wouldn't otherwise have (the ADRs, scenarios, and domain model explain *why* things are the way they are). The teammate engages with review questions grounded in this context. The RDD artifact trail makes the teammate a more effective reviewer — they can evaluate the MR against decisions they didn't make but can now understand.

---

## Stakeholder: AI Agent (Orchestrator, executing review skill)

**Super-Objective:** "Scaffold the reviewer's understanding without substituting for their judgment"

### Task: Perform review orientation in corpus-grounded mode

**Interaction mechanics:** The agent reads the relevant slice of the RDD artifact corpus for the work package in scope. It synthesizes orientation context: what decisions were made and why (ADRs), what behavior was specified (scenarios), what vocabulary applies (domain model), and what architectural constraints exist (system design). It presents this as concise orientation, not as a full artifact dump.

### Task: Perform collaborative context-gathering in context-reconstructive mode

**Interaction mechanics:** The agent prompts for breadcrumbs. For each source the reviewer provides, the agent fetches using available tools (CLI, MCP) or asks the reviewer to paste content if tools are unavailable. The agent reads and synthesizes the gathered context into an orientation summary. It presents the summary for validation before proceeding to question generation.

### Task: Surface review questions

**Interaction mechanics:** Based on the validated orientation and the code changes under review, the agent generates questions a thoughtful senior reviewer would ask. Questions reference specific context (not generic). The number and depth of questions adapts to the reviewer's stated time budget. Mechanical findings (objective issues) are surfaced separately and labeled as such. The agent does not produce a merge verdict, severity ratings, or pre-written review comments.

### Task: Respect reviewer autonomy

**Interaction mechanics:** If the reviewer dismisses questions without engaging, the agent notes that the questions are designed to build understanding but does not compel engagement. If the reviewer asks the agent to write review comments for them, the agent declines — it can help the reviewer formulate thoughts, but the comments should be in the reviewer's own words. The agent scaffolds; the reviewer thinks.
