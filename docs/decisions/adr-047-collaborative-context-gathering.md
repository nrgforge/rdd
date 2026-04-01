# ADR-047: Collaborative Context-Gathering as Review Entry Point

**Status:** Accepted

## Context

The CRDM model (Essay 010) shows that review orientation — establishing context before evaluating code — accounts for ~27% of cognitive effort and is essential for effective analysis. In context-reconstructive mode (ADR-044), no RDD artifact trail exists. The reviewer must build orientation from available sources.

The product discovery conversation established that context-gathering is collaborative: the reviewer provides breadcrumbs (ticket URLs, MR links, relevant docs, discussion threads) and the agent follows them (fetching via CLI tools like `gh`/`glab`, MCP services like Atlassian, or reading pasted content). The reviewer knows *what* to fetch; the agent *can* fetch and synthesize.

The zone of proximal development governs this step: the agent accelerates the reviewer's path to understanding without doing the understanding for them. The agent synthesizes raw context into questions; the reviewer engages with those questions to build their mental model.

## Decision

Context-reconstructive review begins with a collaborative context-gathering step:

1. **The reviewer provides pointers.** The skill prompts: "What context do I need? Share ticket URLs, MR links, relevant docs, or paste discussion threads." The reviewer provides what they have.

2. **The agent fetches and reads.** Using available tools (CLI, MCP, or reading pasted content), the agent gathers the raw context. It does not require any specific tool — it works with whatever is available.

3. **The agent synthesizes orientation.** From the gathered context, the agent produces a brief orientation summary: what the change is, why it exists (as far as can be determined), what constraints or goals shaped the approach, and what assumptions appear to be in play.

4. **The reviewer validates or corrects.** The reviewer confirms, adjusts, or extends the orientation. This is the grounding move — the reviewer's engagement with the synthesis ensures the orientation reflects reality, not just the agent's interpretation. If the reviewer's correction is substantial — the agent's orientation missed the core goal or constraint — the agent re-synthesizes orientation before proceeding to step 5.

5. **The agent surfaces questions.** Based on the validated orientation and the code changes, the agent produces review questions. This step is the same in both modes — the modes differ only in how orientation is achieved.

**Rejected alternative:** Fully automated context-gathering (the agent independently discovers relevant tickets, docs, etc.). Rejected because: (1) the agent cannot reliably determine what context is relevant without the reviewer's domain knowledge; (2) automated discovery risks information overload — the reviewer's selection of breadcrumbs is itself an epistemic act that focuses attention.

**Rejected alternative:** Reviewer-only context-gathering (no agent assistance). Rejected because: (1) manual fetching and reading is time-consuming; (2) the agent's synthesis capability genuinely helps the reviewer reach orientation faster — this is the legitimate role of AI in the zone of proximal development.

## Consequences

**Positive:**
- The reviewer directs the context-gathering, keeping it relevant and focused
- The agent accelerates orientation without replacing the reviewer's judgment
- Works with whatever tools are available — no hard dependency on specific CLI tools or MCP services

**Negative:**
- Requires reviewer effort upfront (providing breadcrumbs) — this is intentional but may feel slow compared to "point an agent at the MR"
- Quality of orientation depends on the quality of breadcrumbs the reviewer provides

**Neutral:**
- In corpus-grounded mode, this step is replaced by artifact reading — the provenance chain provides the breadcrumbs automatically
