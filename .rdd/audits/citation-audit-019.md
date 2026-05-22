# Citation Audit Report — Cycle 019

**Audited document:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md`
**Evidence trail:** `docs/essays/research-logs/research-log.md` (Loops 1, 2, 4)
**Lit-review source:** `docs/essays/research-logs/lit-review-019-methodology-overhead.md`
**Date:** 2026-05-15
**Auditor:** citation-audit skill (claude-sonnet-4-6)

---

## Summary

- **Total references checked:** 29 (23 external; 6 internal corpus)
- **Verified:** 21
- **Issues found:** 11 (2 P1, 5 P2, 4 P3)

---

## Section 1 — External Source Verification

### 1.1 Bacchelli & Bird 2013 — VERIFIED

**Claim:** "Bacchelli & Bird 2013 ICSE study of 2,500 code reviews at Microsoft — the primary documented benefit of modern code review is knowledge transfer, team awareness, and alternative solution generation, NOT defect detection."

**Finding:** The paper exists at the stated venue (ICSE 2013, pp. 712–721, IEEE/ACM). Title, authors, and finding are confirmed. The knowledge-transfer-over-defect-detection finding is the headline result. The "2,500 code reviews" figure used in the Essay-Outline body is not the Bacchelli & Bird study's own data — it is the SmartBear 2011 white paper figure (SmartBear studied 2,500 reviews across multiple organizations). Bacchelli & Bird studied Microsoft's code review system using interviews, observations, and survey/review comment classification. The 2,500 figure is cited separately in the lit-review (§2.2) as the SmartBear study. The Essay-Outline conflates the two in the argument-graph at W3.2: "Bacchelli & Bird 2013 ICSE study of 2,500 code reviews at Microsoft" (line 46, 119).

**Severity: P1 — Must Fix.** The 2,500-review figure belongs to the SmartBear white paper, not Bacchelli & Bird. The Bacchelli & Bird study does not claim to analyze 2,500 reviews; it used mixed methods (interviews, observations, manual classification of review comments). Attributing SmartBear's sample size to Bacchelli & Bird is a factual error. The load-bearing claim (knowledge transfer > defect detection) is correctly attributed; only the sample-size attachment is wrong.

**Recommendation:** Remove "of 2,500 code reviews" from the Bacchelli & Bird attribution in both the argument-graph (E3.2.1) and Section 4 (W3.2). If the SmartBear finding (review effectiveness degrading above 400 LOC/90 minutes) is cited, attribute it separately to SmartBear (2011).

---

### 1.2 Madej et al. 2023 — WRONG LEAD AUTHOR (P1)

**Claim:** Essay-Outline References: "Madej, J., et al. (2023). Iterative review and convergent error correction in LLM-assisted workflows. (Cycle 019 lit-review reference)." In the argument-graph (E3.1.1): "Madej et al. 2023."

**Finding:** The actual NeurIPS 2023 paper cited is "Self-Refine: Iterative Refinement with Self-Feedback" by Aman Madaan, Niket Tandon, Prakhar Gupta, et al. (arXiv:2303.17651). The lead author is **Aman Madaan**, not "Madej, J." The title in the References section ("Iterative review and convergent error correction in LLM-assisted workflows") is a fabricated descriptive title that does not match the paper's actual title. The lit-review (§2.3) correctly identifies it as "Madej, A. et al. (2023). Self-Refine: Iterative Refinement with Self-Feedback. arXiv:2303.17651" — but even in the lit-review the author's name is rendered "Madej, A." rather than "Madaan, A."

The paper's actual title is "Self-Refine: Iterative Refinement with Self-Feedback." The content attributed to it (diminishing returns beginning after 1–2 rounds; iterative LLM self-feedback with a quality ceiling) is broadly consistent with the paper's findings. However, the paper does NOT primarily characterize diminishing returns after 1–2 rounds — it demonstrates consistent improvement across tasks using GPT-4 class models, without characterizing a round-count ceiling. The lit-review's characterization ("diminishing returns beginning after the first 1–2 rounds") is an inference the lit-reviewer drew from the paper, not a direct finding. The Self-Refine paper does not report round-count experiments with diminishing-returns analysis.

**Severity: P1 — Must Fix.** Two errors: (1) The lead author is Madaan not Madej. (2) The title in the References is fabricated. The underlying claim about diminishing returns after 1–2 rounds is not directly from Self-Refine — it is a lit-reviewer inference combined with adjacent code-review literature. Both the author name and the title must be corrected.

**Recommendation:** Fix the author to "Madaan, A., Tandon, N., et al. (2023). Self-Refine: Iterative Refinement with Self-Feedback. arXiv:2303.17651. NeurIPS 2023." The claim about diminishing returns should note that Self-Refine demonstrates improvement across tasks; the diminishing-returns characterization is from the broader code-review diminishing-returns literature, not directly from Self-Refine. Consider whether the claim needs a scope qualification.

---

### 1.3 Zanker et al. 2019 — WRONG LEAD AUTHOR (P2)

**Claim:** Essay-Outline References: "Zanker, J., et al. (2019). Early prototyping and design fixation. (Cycle 019 lit-review reference)." The lit-review (§3.4) lists: "Zanker et al. (2019). Fixation on premature concept choices: A pitfall of early prototyping? Procedia CIRP, 84."

**Finding:** Web search confirms the paper exists in Procedia CIRP 84 (2019) at ScienceDirect (DOI: S2212827119308935). However, the lead author is **Achim Gerstenberg**, not "Zanker" — confirmed by ResearchGate and the second search refining the author list (Gerstenberg, Achim; Sjöman, Heikki; Steinert, Martin). The name "Zanker" does not appear in the author list. The correct citation is Gerstenberg, A. et al. (2019).

The title is partially correct in the lit-review ("Fixation on premature concept choices: A pitfall of early prototyping?") but the References entry in the Essay-Outline reduces it to a loose descriptor ("Early prototyping and design fixation"). The underlying claim (early prototyping can increase fixation by committing practitioners to an initial design direction) is consistent with the paper's topic.

**Severity: P2 — Should Fix.** The author name is wrong. The lead author is Gerstenberg, not Zanker. This is an unverifiable citation as rendered in the Essay-Outline's References. The claim itself is plausible given the paper's confirmed existence and topic. The title in the References section should be the actual title.

**Recommendation:** Correct to "Gerstenberg, A., Sjöman, H., & Steinert, M. (2019). Fixation on premature concept choices: A pitfall of early prototyping? Procedia CIRP, 84, 33–37."

---

### 1.4 Cockburn 2004 — TITLE MISMATCH (P2)

**Claim:** Essay-Outline References: "Cockburn, A. (2004). Crystal Clear: A Human-Powered Methodology for Small Teams. Addison-Wesley." In-text: "Cockburn 2004."

**Finding:** The book "Crystal Clear: A Human-Powered Methodology for Small Teams" (Addison-Wesley, 2004) exists and is correctly attributed. However, the lit-review's sources table (row 6) identifies the source as "Agile Software Development: The Cooperative Game" (2004), not Crystal Clear. These are two distinct Cockburn books: Crystal Clear (2004, ISBN 9780201699470) focuses specifically on the Crystal Clear methodology; Agile Software Development: The Cooperative Game is a broader work whose 2nd edition appeared in 2006 (the 1st edition was 2001).

The Essay-Outline consistently cites the Crystal methodology-fit framework (team size, criticality) and "barely sufficient methodology" — content that is in Crystal Clear (2004). The lit-review's sources table row 6, however, calls it "Agile Software Development: The Cooperative Game" (2004), which is the wrong title for that ISBN and publication year. The Crystal Clear attribution in the Essay-Outline's References is the correct book for the cited content.

**Severity: P2** for an internal inconsistency between the lit-review sources table and the Essay-Outline's References: the lit-review sources table misidentifies the book title. The Essay-Outline's References is correct. The argument-graph content (Crystal methodology-fit, barely sufficient methodology, team-size/criticality calibration) is consistent with Crystal Clear.

**Recommendation:** No change needed in the Essay-Outline's References. Flag for the lit-review record: the sources table row 6 should read "Crystal Clear: A Human-Powered Methodology for Small Teams" not "Agile Software Development: The Cooperative Game."

---

### 1.5 Liu et al. 2024 — VERIFIED WITH AUTHOR CLARIFICATION (P3)

**Claim:** "Liu et al. 2024 — LLMs cannot reliably self-correct without external feedback." Essay-Outline References: "Liu, X., et al. (2024). Critical survey of LLM self-correction limitations. (arXiv preprint as cited in Cycle 019 lit-review.)"

**Finding:** The paper is "When Can LLMs Actually Correct Their Own Mistakes? A Critical Survey of Self-Correction of LLMs" published in TACL 2024, available through MIT Press. The lead author is **Ryo Kamoi**, not "Liu, X." — confirmed by ACL Anthology (aclanthology.org/2024.tacl-1.78/). The lit-review correctly identifies it as "Liu, Y. et al. (2024). When can LLMs actually correct their own mistakes?" and the full paper reference in the lit-review cites the correct URL. The "Liu, X." in the Essay-Outline's References is a different rendering of a different author name.

The key finding ("LLMs cannot reliably self-correct without external feedback") is accurately captured. The attribution of "TACL" is correct.

**Severity: P3.** The paper exists and the claim is accurate. The lead author attribution "Liu, X." in the References is incorrect — the lead author is Kamoi, R. The lit-review's in-text reference "Liu, Y. et al." is also not the lead author name; neither matches "Kamoi." The References entry title ("Critical survey of LLM self-correction limitations") is a paraphrase, not the actual title.

**Recommendation:** Correct to "Kamoi, R., Zhang, Y., et al. (2024). When can LLMs actually correct their own mistakes? A critical survey of self-correction of LLMs. Transactions of the Association for Computational Linguistics, 12, 1417–1440."

---

### 1.6 Paulsen et al. 2025 — VERIFIED WITH TITLE NOTE (P3)

**Claim:** "Paulsen et al. 2025 — LLM effective context consumption falls up to 99% below nominal window limits on complex tasks."

**Finding:** The paper "Context Is What You Need: The Maximum Effective Context Window for Real World Limits of LLMs" by Norman Paulsen exists (arXiv:2509.21361, September 2025). The 99% gap finding is confirmed. The lit-review cites it as "Paulsen, N. et al. (2025). Effective context window research (MECW). Emergent literature." The Essay-Outline References renders it as "Paulsen, R., et al. (2025)" — initials "R." vs "N." for Norman. The paper appears to be single- or few-authored with Paulsen as lead; the full author list requires the paper itself to confirm.

**Severity: P3.** The first initial discrepancy (R. vs N.) is minor; the finding is confirmed. The Reference entry could include the arXiv ID (2509.21361) to make it fully citable.

**Recommendation:** Correct the initial to "Paulsen, N." and add the arXiv ID: "arXiv:2509.21361."

---

### 1.7 arXiv 2026 — ADR generation context strategies — VERIFIED (P3)

**Claim:** "(arXiv 2026) Context strategies for automated ADR generation." Essay-Outline body: "arXiv 2026 on context strategies for automated ADR generation — semantic relevance of retrieved context matters more than completeness."

**Finding:** arXiv:2604.03826 confirmed. Title: "Context Matters: Evaluating Context Strategies for Automated ADR Generation Using LLMs." Authors: Aviral Gupta, Rudra Dhar, Daniel Feitosa, Karthik Vaidhyanathan. Submitted April 4, 2026. The key finding (context-enriched RAG with a small recency window outperforms full-history retrieval; semantic relevance over completeness) is confirmed. The Essay-Outline's description of the finding ("semantic relevance of retrieved context matters more than completeness") is accurate.

**Severity: P3.** The citation is loose ("arXiv 2026") with no arXiv ID in the Essay-Outline's References entry. The lit-review's references section correctly supplies the ID. The Essay-Outline should include the ID for traceability.

**Recommendation:** Expand the References entry to: "Gupta, A., Dhar, R., Feitosa, D., & Vaidhyanathan, K. (2026). Context matters: Evaluating context strategies for automated ADR generation using LLMs. arXiv:2604.03826."

---

### 1.8 Zheng et al. 2024 — VERIFIED WITH YEAR NOTE

**Claim:** "Zheng, L., et al. (2024). Judging LLM-as-a-judge with MT-Bench and Chatbot Arena. NeurIPS 2023 Datasets and Benchmarks Track."

**Finding:** The paper exists (arXiv:2306.05685). Authors: Lianmin Zheng, Wei-Lin Chiang, et al. Published at NeurIPS 2023 Datasets and Benchmarks Track. The year discrepancy — the Essay-Outline dates it 2024 in the author-year citation while the References entry reads "NeurIPS 2023 Datasets and Benchmarks Track" — is because the paper was posted 2023 but indexed in some venues as 2024. The 80% agreement finding is confirmed.

**Severity: P3.** Minor year ambiguity in the author-year citation vs. the References entry. The correct conference year is NeurIPS 2023; the paper may have appeared in proceedings published in 2024. The claim content is accurate.

**Recommendation:** Standardize to "Zheng et al. (2023)" in-text, with "NeurIPS 2023" in the References, or note the arXiv preprint date.

---

### 1.9 Rahman & Cysneiros 2024 — VERIFIED

**Claim:** "Rahman & Cysneiros 2024 — agile methods generate MORE requirements-related defects than waterfall, not fewer."

**Finding:** The paper "An Empirical Study of the Impact of Waterfall and Agile Methods on Numbers of Requirements-Related Defects" by Anzira Rahman, Luiz Marcio Cysneiros, and Daniel M. Berry was published at ACM SAC 2024 (doi:10.1145/3605098.3635901). The finding is confirmed. Note the Essay-Outline cites this as "Rahman & Cysneiros 2024" — there are three authors (Rahman, Cysneiros, Berry), but two-author short form is acceptable for a "&" citation.

**Severity:** None. Citation is sound.

---

### 1.10 Pirolli & Card 1999 — VERIFIED

**Claim:** "Pirolli & Card 1999 — information foraging's patch-switching criterion."

**Finding:** The paper "Information Foraging" by Peter Pirolli and Stuart Card was published in Psychological Review, 106(4), 643–675, 1999. Confirmed via APA PsycNet and the act-r.psy.cmu.edu technical report. The patch-switching mechanism (time allocation based on information scent and opportunity cost) is the paper's core contribution. Citation is accurate.

**Severity:** None.

---

### 1.11 Cockburn 2004 Crystal Clear — VERIFIED (see 1.4 above)

---

### 1.12 Fowler 1999 / 2015 YAGNI — VERIFIED

**Claim:** "Fowler 1999/2015 YAGNI / cost-of-carry."

**Finding:** Fowler's Refactoring (1999, Addison-Wesley) introduces "speculative generality" as a code smell. Fowler's YAGNI bliki essay (martinfowler.com/bliki/Yagni.html) is correctly dated as an ongoing post with substantive update circa 2015. The "cost of delay" and "cost of carry" terminology is confirmed in the YAGNI bliki. The scope caveat in the Essay-Outline (YAGNI is "scoped to code capabilities, not methodology artifacts") is accurately rendered. Citation is accurate.

**Severity:** None.

---

### 1.13 Beck 1999 — VERIFIED

**Claim:** "Beck 1999 — Extreme Programming Explained."

**Finding:** Beck, K. (1999). Extreme Programming Explained: Embrace Change. Addison-Wesley. Confirmed. YAGNI's origins in XP and the "do the simplest thing that could possibly work" principle are associated with Beck. Citation is accurate.

**Severity:** None.

---

### 1.14 Simon 1996 — VERIFIED

**Claim:** "Simon 1996 — The Sciences of the Artificial (3rd ed.) — satisficing."

**Finding:** Simon, H.A. (1996). The Sciences of the Artificial (3rd ed.). MIT Press. Confirmed. Satisficing as a navigational criterion is a central concept. Citation is accurate.

**Severity:** None.

---

### 1.15 Boehm 1981 — VERIFIED (claim scope noted)

**Claim:** "Boehm 1981 — Software Engineering Economics."

**Finding:** Boehm, B.W. (1981). Software Engineering Economics. Prentice-Hall. Confirmed. The Essay-Outline does not directly cite Boehm in the argument-graph (it appears only in the References and is not a load-bearing citation in the outline's six claims). The lit-review uses Boehm extensively. Citation exists; scope of claim is appropriately limited.

**Severity:** None.

---

### 1.16 Bossavit 2012 — VERIFIED

**Claim:** "Bossavit 2012 — The Leprechauns of Software Engineering."

**Finding:** Bossavit, L. (2012). The Leprechauns of Software Engineering. Leanpub (self-published). Confirmed. Appears in References but not in the argument-graph's six claims — the Essay-Outline uses the Boehm critique directionally in Section 2 prose but does not cite Bossavit in the Argument-Graph or Citation-Embedded Outline.

**Severity:** None.

---

### 1.17 Fagan 1976 — VERIFIED (not used in argument-graph)

**Claim:** "Fagan, M.E. (1976). Design and code inspections."

**Finding:** The paper exists (IBM Systems Journal, 15(3), 182–211). Appears in the References but is not cited in the argument-graph or the Citation-Embedded Outline's six sections. It is background in the lit-review; the Essay-Outline carries it in References without attaching it to any specific claim.

**Severity:** None, but see Section 4 (chain-of-citation) for context.

---

### 1.18 Fowler 2025 — VERIFIED

**Claim:** "Fowler 2025 — Tackling complex tasks: specs vs context documents. martinfowler.com."

**Finding:** The article exists at martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html. The spec-vs-context-document distinction is confirmed as described in the search results. The References title ("Tackling complex tasks: specs vs context documents") differs slightly from the actual article title ("Understanding Spec-Driven Development: Kiro, spec-kit, and Tessl") but the cited distinction and the URL match. The claim content is accurate.

**Severity: P3.** The title in the References is a paraphrase of the content rather than the actual article title.

**Recommendation:** Correct to: "Fowler, M. (2025). Understanding spec-driven development: Kiro, spec-kit, and Tessl. martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html."

---

### 1.19 Thoughtworks 2025 — VERIFIED

**Claim:** "Thoughtworks 2025 — Technology Radar (Volume on Spec-Driven Development)."

**Finding:** Thoughtworks Technology Radar Vol. 33 (November 2025) confirmed. Spec-driven development is in the "Assess" ring. The critique (workflows remain elaborate and opinionated; 1,300-line date-display specification) is consistent with the Radar's actual content. The lit-review attributes this to the Thoughtworks blog post ("Spec-driven development: Unpacking one of 2025's key new engineering practices") rather than the Radar PDF itself; both exist at Thoughtworks. The Essay-Outline's References entry ("Thoughtworks 2025. Technology Radar (Volume on Spec-Driven Development). Thoughtworks.") is loose but points to the right source family.

**Severity:** None for the claim content. The References entry could be more specific about which Thoughtworks document (Radar Vol. 33 vs. the associated blog post).

---

### 1.20 Gero & Kan 2011 — VENUE MISMATCH (P2)

**Claim:** Essay-Outline References: "Gero, J.S., & Kan, J.W.T. (2011). Studying designers' behavior using design protocols. In Studying Designers (DTRS 8)."

**Finding:** The verified paper is "Fixation and Commitment While Designing and its Measurement" by Gero and Kan, published in the Journal of Creative Behavior, 45(2), 108–131 (2011) — confirmed by Wiley Online Library. The Essay-Outline's References entry places it in "Studying Designers (DTRS 8)" — a different venue. There is also a 2011 paper by Gero, Kan, and Pourmohamadi ("Analysing Design Protocols: Development of Methods and Tools") presented at DTRS8, but that paper is about protocol analysis methods, not design fixation. The load-bearing claim in the Essay-Outline (design fixation measurable through linkography of protocol; fixation and commitment as design risk) maps to the Journal of Creative Behavior paper, not the DTRS8 paper.

The lit-review (§3.4 and References) correctly identifies this as "Journal of Creative Behavior, 45(2), 108–131."

**Severity: P2.** The Essay-Outline's References entry has the wrong venue — DTRS 8 rather than Journal of Creative Behavior. The lit-review's reference is correct; the Essay-Outline's reference diverges. The claim content is correctly attributed to the right paper; only the venue is wrong in the Essay-Outline References.

**Recommendation:** Correct to: "Gero, J.S., & Kan, J.W.T. (2011). Fixation and commitment while designing and its measurement. The Journal of Creative Behavior, 45(2), 108–131."

---

### 1.21 Standish Group 2014 — CLAIM ACCURACY NOTE (P2)

**Claim:** Essay-Outline References: "Standish Group (2014). The CHAOS report: feature usage measurements."

**Finding:** The Standish Group CHAOS reports exist across 2002–2015. The specific 2014 CHAOS report on feature usage is referenced in the lit-review (§1.1) as reporting "approximately 45% of features in software applications are rarely or never used." However, web search reveals the most commonly cited Standish figure is 64% (rarely or never used) from earlier CHAOS reports, not 45%. The 45% figure is in circulation (LinkedIn article: "Why 45% of all software features in production are NEVER Used") but the primary CHAOS report statistic is 64%. The 2014 edition is identified as reporting "80% of features have low to no value" in one source.

The Essay-Outline does not directly cite the 45% figure in its argument-graph — the Standish Group appears only in the References without appearing in the Citation-Embedded Outline's six sections. The lit-review cites it for the Branch A "speculative generality" discussion. Since the Standish figure is not a load-bearing claim in the Essay-Outline's six conclusions, this is informational.

**Severity: P2** for the lit-review's rendering (45% vs. the more commonly cited 64%), which the Essay-Outline inherits via its References. Since Standish does not anchor any of the Essay-Outline's six conclusions, this is P2 for the lit-review record, P3 for the Essay-Outline.

**Recommendation:** The Standish citation is not load-bearing in the Essay-Outline. If included in the References for completeness, note: the specific percentage cited (45%) may reflect the 2014 report's framing; the 64% figure from earlier reports is more widely cited. Verify against the specific 2014 CHAOS report before including.

---

### 1.22 Cross 2011 and Lawson 2006 — VERIFIED

**Claim:** "Cross 2011 — Design Thinking: Understanding How Designers Think and Work. Berg." "Lawson 2006 — How Designers Think (4th ed.). Architectural Press."

**Finding:** Both books are established design cognition texts. Cross (2011) Berg Publishers confirmed. Lawson (2006, 4th ed., Architectural Press/Elsevier) confirmed. The satisficing and expert-vs-novice design findings attributed to these sources are within the known scope of both works. Citations are accurate.

**Severity:** None.

---

### 1.23 Goel & Pirolli 1992 — VERIFIED

**Claim:** "Goel & Pirolli 1992 — The structure of design problem spaces. Cognitive Science, 16(3)."

**Finding:** Confirmed via Wiley Online Library (doi:10.1207/s15516709cog1603_3). Eight invariants of design problem-solving across disciplines. The claim content is consistent.

**Severity:** None.

---

## Section 2 — Internal Corpus Reference Verification

### 2.1 domain-model.md:984 — VERIFIED

**Claim:** "(Cycle 017, future-cycle candidate) Does RDD over-engineer?" at domain-model.md:984.

**Finding:** Line 984 confirmed. Text reads: "(Cycle 017, future-cycle candidate) Does RDD over-engineer? Does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs? Critique of the methodology's structural posture, not of any specific artifact; deserves a dedicated cycle with its own constraint-removal protocol, lit-review, and audit cycle."

**Severity:** None.

---

### 2.2 domain-model.md:926 — VERIFIED (quote accurate)

**Claim:** "When does documentation fatigue signal 'time to graduate' versus 'the methodology is too heavy for this problem'? Partial answer: ... whether the work has shifted from identity-forming to feature-extending. This is a felt phase transition, not a metric."

**Finding:** Line 926 confirmed. The quotation in the Essay-Outline at E6.2.1 and Section 7 (W6.2) is accurate and matches the line text verbatim.

**Severity:** None.

---

### 2.3 domain-model.md:31 — VERIFIED (Invariant 4)

**Claim:** References entry: "RDD Domain Model (Invariant 4 at line 31)."

**Finding:** Line 31 confirmed as Invariant 4: "Epistemic cost must be productive, not merely brief." This invariant is not cited in the Essay-Outline's argument-graph or Citation-Embedded Outline — it appears only in the References section. The line number is accurate.

**Severity:** None. The reference is accurate but unused in the body of the argument. See Section 4 for chain-of-citation observations.

---

### 2.4 Reflection 005 — VERIFIED (quote accurate)

**Claim:** "Reflection 005 §'RDD as a Deep Work Tool'" with the quoted text: "RDD is not a permanent methodology that owns a project's documentation. It is a deep work tool — something you reach for when a problem is complex enough to warrant structured thinking, and put away when the knowledge has been absorbed."

**Finding:** File exists at `docs/essays/reflections/005-roadmap-field-guide-and-document-sizing.md`. Section "RDD as a Deep Work Tool" confirmed. The quoted text is accurate.

**Severity:** None.

---

### 2.5 ADR-014, ADR-025, ADR-082, ADR-083, ADR-091 — VERIFIED (existence)

**Claim:** References cite all five ADRs at their named paths.

**Finding:** All five files exist at the claimed paths:
- `docs/decisions/adr-014-worth-the-calories-quality-gate.md` ✓
- `docs/decisions/adr-025-add-conformance-audit-with-graduation.md` ✓
- `docs/decisions/adr-082-question-isolation-protocol.md` ✓
- `docs/decisions/adr-083-cognitive-economy-criterion.md` ✓
- `docs/decisions/adr-091-dual-mode-build.md` ✓

**Severity:** None.

---

### 2.6 Cycle 018 cycle-status archive — VERIFIED (with claim scope note)

**Claim:** "(Cycle 018 cycle-status archive 2026-05-14) ~14 specialist subagent dispatches, R1→R4 audit rounds, both-form dogfooded production; cycle shipped two load-bearing ADRs (ADR-092, ADR-093) plus skill-text amendments and fixture tests."

**Finding:** File exists at `docs/cycle-archive/cycle-018-outlines-as-research-artifacts-and-cress-audit-status.md`. The cycle completion date (2026-05-14), both-form production, ADR-092 and ADR-093, R1–R4 argument-audit rounds, auto-mode BUILD, and fixture tests are all confirmed. The "~14 specialist subagent dispatches" count is plausible from the cycle archive (multiple phases each with subagent dispatches) but is not an explicit count in the archive text. It is a characterization from the research log (Loop 1, Layer C research plan).

**Claim about DECIDE gate (E3.3.1):** "the most consequential framing catch (prose-essay §7's trio vs. Loop C's trio) was caught by user pushback at the DECIDE gate, NOT by R1-R3 audit rounds (which all ran clean before the gate)."

**Finding:** The cycle-status archive (Phase-exit state for DECIDE) confirms: "The Context trio was swapped to prose-form §7's articulation... Gate conversation produced the cycle's largest single revision." The R1-R3 running clean is confirmed ("Argument-audit ran four rounds (R1-R4); R3 surfaced an audit-subagent silent-fallback (delivered inline rather than via Write — file reconstructed at R4 surfacing); all rounds closed clean" — the "closed clean" refers to issue resolution, and the gate conversation catch is described separately). This is accurately characterized.

**Severity:** None on the key claims. The "~14 subagent dispatches" approximation is drawn from the research log and is presented as approximate.

---

### 2.7 Reflection 016 — VERIFIED

**Claim:** "Reflection 016 §'Side-question worth its own cycle: does RDD over-engineer?'"

**Finding:** File exists at `docs/essays/reflections/016-initial-handoff-and-the-audience-at-the-margin.md`. Section heading "Side-question worth its own cycle: does RDD over-engineer?" confirmed. The framing text is confirmed.

**Severity:** None.

---

## Section 3 — Quote and Claim Alignment

### 3.1 Bacchelli & Bird: "2,500 code reviews" attribution (P1 — see 1.1 above)

Already reported. The 2,500 figure is from SmartBear (2011), not Bacchelli & Bird (2013).

---

### 3.2 Madaan (Self-Refine): diminishing-returns claim scope (P2)

**Claim:** E3.1.1: "Madej et al. 2023 — Largest gains in rounds 1–2; rounds 3–5 productive for critical content; over-refinement past 5 rearranges errors without removing them."

**Finding:** The Self-Refine paper (Madaan et al. 2023) demonstrates iterative LLM self-feedback improves output across 7 tasks. It does not characterize a round-count ceiling of 1–2 rounds or describe over-refinement past 5 rounds as a failure mode. The specific round-count claims (rounds 1–2 as largest gain; over-refinement past 5) are inferences drawn by the lit-reviewer from the convergence of self-refinement research with the broader code-review diminishing-returns literature. The Essay-Outline attributes them directly to "Madej et al. 2023" without noting this intermediation.

**Severity: P2.** The claim is directionally supported but is over-attributed to Self-Refine alone. The round-count characterization is the lit-reviewer's synthesis of multiple sources, not a direct Self-Refine finding.

**Recommendation:** Qualify the claim or attribute it to the broader iterative-review literature, citing Self-Refine as one data point and the code-review diminishing-returns literature (Jureczko et al. 2020; SmartBear 2011) alongside it.

---

### 3.3 Fowler 2025: title paraphrase in References (P3 — see 1.18 above)

Already reported.

---

### 3.4 Gero & Kan 2011: venue mismatch in References (P2 — see 1.20 above)

Already reported.

---

## Section 4 — Chain-of-Citation Findings

### 4.1 Provisional citations presented as verified sources (P2)

**Observation:** The Essay-Outline's References section explicitly marks several citations as "(Cycle 019 lit-review reference)":
- Madej et al. 2023
- Paulsen et al. 2025
- Rahman & Cysneiros 2024
- Zanker et al. 2019

This labeling is honest — it flags that these citations are mediated through the lit-review summary rather than primary-source consultation. However, the argument-graph and Citation-Embedded Outline cite these sources without the "(Cycle 019 lit-review reference)" qualifier, presenting them as if they were directly verified. For example, E3.1.1 reads "Madej et al. 2023" without noting the lit-review intermediation; E4.1.1 reads "Paulsen et al. 2025" without qualification.

**Severity: P2.** The transparency is in the References but absent in the citation-embedded claims. A reader of the argument-graph would not know which claims are lit-review-chained vs. directly sourced. This asymmetry between the References labels and the in-text usage understates the epistemic uncertainty at the claim level.

**Recommendation:** Either (a) carry the "(Cycle 019 lit-review reference)" qualifier into the in-text citation at E3.1.1, E3.1.2, E4.1.1, etc., or (b) treat the lit-review as the proximate source and cite it explicitly at those claims, with the primary source as background. Option (b) is more epistemically honest for a citation-audited artifact.

---

### 4.2 Sources that should be cited directly (P3)

**Observation:** Several sources cited in the Essay-Outline are well-established foundational works (Pirolli & Card 1999; Simon 1996; Bacchelli & Bird 2013; Beck 1999; Cockburn 2004; Gero & Kan 2011; Cross 2011; Lawson 2006) that the lit-reviewer would have consulted directly via their primary publication. These are appropriate to cite as primary sources without noting lit-review intermediation. The chain-of-citation concern applies only to the newer or more obscure sources (Madaan 2023; Paulsen 2025; Rahman & Cysneiros 2024; Zanker/Gerstenberg 2019; arXiv 2026) where the lit-reviewer's identification is the only link.

**Severity: P3.** Informational. The Essay-Outline correctly treats classic sources as directly citable and marks the newer/less-accessible ones as lit-review references in the References section.

---

### 4.3 Fagan 1976 and Boehm 1981 in References without body citation (P3)

**Observation:** Fagan (1976) and Boehm (1981) appear in the References section but are not cited anywhere in the argument-graph or the Citation-Embedded Outline's six sections. Both are substantive in the lit-review's analysis. Their absence from the Essay-Outline's body suggests they informed the loop analysis but did not anchor any of the six conclusions or the eight warrant chains.

**Severity: P3.** The References section is honest in including background sources, but carrying uncited References entries into a citation-audited document creates audit noise. Consider removing Fagan and Boehm from the References (since they anchor no claim in the body) or adding a note that they are background sources that informed the loop analysis without anchoring any conclusion.

---

## Section 5 — Missing Seminal Works

### 5.1 McConnell 2004 Code Complete (P3)

**Observation:** McConnell's Code Complete (2004, Microsoft Press) is a standard reference for the cost-of-defects-by-phase discussion and for the upfront-vs-emergent design debate. It synthesizes Boehm's curve and adds empirical grounding. The lit-review does not include it; the Essay-Outline's Branch A coverage relies on Boehm (1981) and Bossavit (2012) without the intermediate synthesis McConnell provides. For an essay on whether RDD over-engineers, McConnell's treatment of when upfront design pays off is a relevant omission.

**Severity: P3.** Adding McConnell would strengthen Branch A's evidence base but is not a gap that weakens the current conclusions.

---

### 5.2 Royce 1970 and the waterfall critique literature (P3)

**Observation:** Royce (1970) is the source-text for the waterfall model that all methodology comparisons implicitly reference. The Essay-Outline uses "waterfall vs. agile" through Rahman & Cysneiros (2024) and Boehm (1981) without citing Royce. This is standard in methodology papers that treat Royce as assumed background. Not a gap that affects the conclusions.

**Severity: P3.** Informational only.

---

### 5.3 ACL 2025 LLM-as-judge multilingual reliability study (P3)

**Claim in Essay-Outline References:** "(ACL 2025) Recent literature on LLM-as-judge reliability across domains. (Cycle 019 lit-review reference.)"

**Finding:** The lit-review (§2.4) cites "Zheng et al. 2024; MT-Bench; ACL 2025 multilingual reliability study" but does not identify a specific paper for the ACL 2025 entry — it is a category reference with no author, title, or DOI. The Essay-Outline's References entry similarly provides no identification beyond "(ACL 2025)." This is an unverifiable citation — it may exist, but without author/title/arXiv ID it cannot be confirmed.

**Severity: P3.** The ACL 2025 LLM-as-judge claim (60–68% agreement in expert domains) is directionally plausible given the Zheng et al. NeurIPS 2023 findings, but the specific paper is unidentified. The load-bearing claim it supports (LLM judges drop to 60–68% in expert domains) does not anchor any of the six conclusions C1–C6 directly — it supports W3 in the argument-graph background. If the claim is retained, an identifiable citation is needed.

**Recommendation:** Either identify the specific ACL 2025 paper (author, title, URL) or remove the citation and attribute the expert-domain reliability drop to the broader LLM-as-judge literature (Zheng et al. 2023 as anchor).

---

## Summary

**Findings by severity:**

| Severity | Count | Issues |
|----------|-------|--------|
| P1 — Must Fix | 2 | 1.1 (Bacchelli & Bird 2,500-review figure misattributed from SmartBear); 1.2 (Madaan "Self-Refine" lead author rendered as "Madej, J." with a fabricated title) |
| P2 — Should Fix | 5 | 1.3 (Zanker/Gerstenberg lead author wrong); 1.4 (Cockburn title mismatch in lit-review sources table); 1.20 (Gero & Kan venue wrong in Essay-Outline References); 1.21 (Standish 45% figure uncertain); 4.1 (provisional citations not flagged at claim level) |
| P3 — Consider | 4 | 1.5 (Liu et al. lead author Kamoi not Liu/X.); 1.6 (Paulsen initial R vs N; arXiv ID missing); 1.7 (arXiv 2026 ID missing in References); 1.18 (Fowler 2025 title paraphrase); 5.3 (ACL 2025 unidentified) |

**Readiness verdict:**

The Essay-Outline has two P1 errors that must be corrected before argument-audit dispatch. The Bacchelli & Bird 2,500-review figure is attributing SmartBear's study sample to a different paper — this is a factual error in a claim that is load-bearing for W3.2 (solo-developer audit infrastructure calibration). The Madaan/Madej author confusion with a fabricated title means the References entry is non-auditable as written; the underlying paper exists and its finding is directionally usable, but the attribution is wrong.

The five P2 issues are correctible without changing any conclusion: the Zanker/Gerstenberg author fix is a name correction; the Gero & Kan venue fix corrects the References entry to match the lit-review's correct venue; the chain-of-citation transparency issue (4.1) is a presentation fix that adds epistemic precision without changing claims.

The four P3 items are housekeeping. None affects the soundness of conclusions C1–C6.

**Recommendation:** Fix the two P1 errors and the five P2 items, then dispatch to argument-audit. The essay's factual claims about the literature are sound at the conclusion level; the errors are attribution-level, not claim-level.
