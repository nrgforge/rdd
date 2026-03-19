# ADR-024: Adopt Document Sizing Heuristics

**Status:** Proposed

## Context

The RDD artifact corpus contains documents ranging from 712 words (ORIENTATION.md) to 6,969 words (system-design.md). Essay 005 identifies convergent evidence from cognitive science (Cowan's 3-5 chunk working memory limit), reading comprehension research (reading contracts, purpose clarity), and LLM performance data (lost-in-the-middle recall degradation) that governs when documents should be split and how sections should be structured.

The user's experience running ~5 RDD cycles on team deliverables confirmed the sizing problem empirically: handoff recipients found the artifact volume "a lot to take in."

## Decision

Adopt five cascading document sizing heuristics as the governing framework for all RDD artifact structure:

1. **Purpose Test** — A document should serve one purpose for one audience. When purposes diverge, split. (From Baker's Every Page is Page One)
2. **3-5 Concept Rule** — Each section should require holding no more than 3-5 concepts simultaneously. Restructure sections that exceed this. (From Cowan)
3. **~5,000 Word Guideline** — Documents read end-to-end by agents should aim to stay in the neighborhood of 5,000 words (~6,500 tokens). This is approximate and directional, not a hard ceiling. (From LLM lost-in-the-middle research)
4. **Read Contract** — Reference material (consulted by section) can be longer than narrative material (read end-to-end). Access pattern determines appropriate length. (From reading comprehension research)
5. **Position-Sensitive Placement** — Critical information at beginning and end of documents agents consume. Nothing important in the middle third. (From LLM recall patterns)

The heuristics cascade in priority order: Purpose Test first, then Concept Rule, then Word Guideline, then Read Contract, then Position-Sensitive Placement.

New artifacts (roadmap, field guide) must be designed within these constraints from the start. Existing artifacts are evaluated but not necessarily split — the decision about whether and how to decompose system-design.md requires judgment about its actual access patterns.

## Consequences

**Positive:**
- Research-backed framework replaces ad hoc decisions about document length
- Agents process documents more effectively within heuristic bounds
- Handoff recipients face manageable document sizes
- New artifacts designed within constraints from the start

**Negative:**
- Splitting documents creates more files to navigate (mitigation: orientation document routes readers)
- The ~5,000 word guideline is derived from retrieval-task research, not direct document-comprehension studies — the evidence is directional, not precise
- Retroactive application to system-design.md requires careful analysis, not mechanical splitting

**Neutral:**
- domain-model.md (9,100 tokens) passes the Read Contract despite exceeding the Word Guideline — it is reference material consulted by lookup
- scenarios.md (7,300 tokens) passes similarly — consulted per scenario group
- The heuristics are tools for judgment, not rules for compliance
