# ADR-061: Framing Audit as Argument Auditor Extension

**Status:** Proposed
**Extends:** ADR-032 (Extract Specialist Subagents from Phase Skills)

## Context

The existing argument auditor asks: "Does the argument follow from the evidence? Are claims supported? Do conclusions overreach?" This is a logical consistency check — it evaluates what the artifact *says*.

The Framing Audit asks the complementary question: "What did the artifact choose *not* to say? What alternative framings did the evidence support that the artifact didn't pursue? What truths were available but not featured?" This is a Content Selection check — it evaluates the negative space.

The design question: new specialist subagent or extension of the argument auditor?

Arguments for a new subagent:
- The analytical act is distinct (logical consistency vs. content selection)
- Separate subagents can run in parallel
- Each has a clear, focused mandate

Arguments for extending the argument auditor:
- Both read the same inputs (artifact + evidence base)
- The framing audit needs the argument map the auditor already builds
- Fewer subagents means less dispatch complexity
- The argument auditor already produces an audit artifact — extending its template is simpler than creating a new artifact type

## Decision

Extend the argument auditor's scope to include **framing analysis** as a second audit pass within the same dispatch.

The argument auditor produces a two-section audit artifact:
1. **Argument audit** (existing): inferential chain verification, claim-evidence mapping, overreach detection
2. **Framing audit** (new): alternative framing identification, negative-space analysis, Content Selection visibility

The framing audit section asks three questions:
- **What alternative framings did the evidence support?** — identify 2-3 framings the artifact didn't choose, with evidence from the source material
- **What truths were available but not featured?** — identify findings from the evidence base that are absent or underrepresented in the artifact
- **What would change if the dominant framing were inverted?** — apply the Inversion Principle (belief-mapping form, per ADR-055) to the artifact's framing itself

The extended auditor reads the artifact *and* its source material (the full evidence base the artifact drew from). For essays, this means the research log and any source documents. For ADRs, this means the essay and prior ADRs.

**The framing audit is a Tier 1 unconditional mechanism (ADR-058).** It runs on every essay and on ADR sets. It is not subject to context-dependent relaxation.

## Consequences

**Positive:**
- Makes Content Selection visible as a durable, inspectable artifact — the negative space becomes a first-class output
- Leverages the argument auditor's existing infrastructure (same dispatch, same input reading, same artifact format)
- The three questions are specific enough to be actionable but open enough to surface unexpected findings
- The framing audit is the most direct mitigation of Content Selection — it turns the agent's invisible act of curation into a visible, reviewable artifact

**Negative:**
- Extending the argument auditor's scope increases its execution time. Mitigated: the framing audit can reuse the argument map built in the first pass; the marginal cost is the negative-space analysis, not a full re-read
- The framing audit is itself produced by an RLHF model subject to Content Selection. Mitigated: Architectural Isolation (the fresh context treats the artifact as external input); the audit asks specific structural questions that constrain Content Selection rather than leaving it unconstrained

**Neutral:**
- The combined audit artifact grows but remains a single file per dispatch — no change to the artifact trail structure
- The argument auditor subagent's system prompt needs amendment to include framing analysis instructions
- The subagent count remains at eight (not nine) because this extends an existing subagent rather than creating a new one
