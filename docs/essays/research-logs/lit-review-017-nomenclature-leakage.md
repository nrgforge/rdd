## Literature Review: Corpus-Internal Nomenclature Leakage into Durable Artifacts (Q1)

**Date:** 2026-04-24
**Method:** Systematic web-search literature review; primary-source verification via direct URL retrieval
**Cycle:** RDD 017 — Readability & Comprehensibility
**Briefing commitment honored:** Q1's framing is held open across three competing lenses — naming strategies, graduation ceremonies, and doc-code coupling — per the mandatory briefing. The review lets the literature determine which framing is most supported rather than anchoring to any one at the outset.

---

### 1. Methodology

**Searches conducted (2026-04-24):** Twelve targeted searches were run across six thematic clusters: (1) the Tan, Wagner & Treude EMSE paper on detecting outdated code element references; (2) Robert Martin's Stable Dependencies Principle and component coupling theory; (3) the Rosenbaum / InfoQ / Swimm continuous-documentation framework; (4) doc-code synchronization approaches including literate programming, doctest, and executable documentation; (5) link rot, citation rot, and reference decay in academic and software contexts; (6) ADR and RFC numbering practices, URI/identifier stability theory, and knowledge-graph identifier design.

**Primary sources retrieved directly:** arXiv preprint 2212.01479 (Tan, Wagner & Treude); InfoQ continuous-documentation article (Rosenbaum 2021); Swimm continuous-documentation manifesto (Rosenbaum 2021); Aghajani et al. ICSE 2019 full taxonomy via Academia.edu; Hata et al. ICSE 2019 summary; Xiao et al. EMSE 2023 abstract; Digital Humanities Quarterly reference-rot study (Coble & Karlin 2023); W3C Cool URIs guidance (Berners-Lee 1998); W3C Cool URIs for the Semantic Web (Sauermann & Cyganiak 2008); devlead.io Stable Dependencies Principle exposition; Donny Winston's opaque-identifier essay; Katariina Kari's knowledge-graph identifier requirements article.

**What was not findable:** No primary literature specifically addresses the "graduation ceremony" framing — the idea of a formal stripping of corpus-internal references when artifacts transition from a process corpus into a durable codebase context. This appears to be an RDD-specific design problem without established prior art. The Lethbridge, Singer & Forward (2003) paper was confirmed to exist and its findings summarized from secondary accounts; full text was not retrieved. The Neitsch/McGregor/Storey paper referenced in the orientation pass appears to be an incorrect citation — no matching paper was found under those authors.

**Framing structure:** The review evaluates three framings in sequence: naming strategies (Section 3), graduation ceremonies (Section 4), and doc-code coupling (Section 5), followed by cross-domain analogues (Section 6) and implications (Section 7).

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Tan, W. S., Wagner, M. & Treude, C. | Detecting Outdated Code Element References in Software Repository Documentation | 2024 | Empirical Software Engineering, 29(1), Art. 5 | Primary anchor: automated detection of dangling code-element references in documentation |
| 2 | Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G. & Lanza, M. | Software Documentation Issues Unveiled | 2019 | ICSE 2019 | Taxonomy of 162 documentation issue types; "up-to-dateness" as a major category |
| 3 | Hata, H., Treude, C., Kula, R. G. & Ishio, T. | 9.6 Million Links in Source Code Comments: Purpose, Evolution, and Decay | 2019 | ICSE 2019 | Large-scale empirical study of link decay in source code comments |
| 4 | Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T. & Matsumoto, K. | 18 Million Links in Commit Messages: Purpose, Evolution, and Decay | 2023 | EMSE, 28, Art. 91 | Comparative decay study; commit-message links decay worse than source-code links |
| 5 | Lethbridge, T. C., Singer, J. & Forward, A. | How Software Engineers Use Documentation: The State of the Practice | 2003 | IEEE Software, 20(6), 35–39 | Foundational: engineers frequently consult outdated documentation and adapt |
| 6 | Martin, R. C. | Agile Software Development: Principles, Patterns, and Practices (Stable Dependencies Principle) | 2002 | Prentice Hall | SDP: dependencies should point toward stability; coupling metric basis |
| 7 | Rosenbaum, O. | Shifting to Continuous Documentation as a New Approach for Code Knowledge | 2021 | InfoQ (June 2021) | Three-principle continuous-documentation framework; coupling docs to code as core mechanism |
| 8 | Rosenbaum, O. | What is Continuous Documentation? The manifesto | 2021 | Swimm blog (September 2021) | Swimm platform: live code-coupled docs with drift detection and auto-sync |
| 9 | Berners-Lee, T. | Cool URIs Don't Change | 1998 | W3C Style Note | Foundational principle: identifier stability requires excluding mutable semantic content |
| 10 | Sauermann, L. & Cyganiak, R. (with Ayers, D. & Völkel, M.) | Cool URIs for the Semantic Web | 2008 | W3C Interest Group Note | Hash-URI and 303-redirect patterns for stable resource identification |
| 11 | Coble, Z. & Karlin, J. | Reference Rot in the Digital Humanities Literature | 2023 | Digital Humanities Quarterly, 17(1) | 31% reference rot in DHQ; DOIs show 99.1% resolution success vs. plain URLs |
| 12 | Knuth, D. E. | Literate Programming | 1984 | The Computer Journal, 27(2), 97–111 | WEB system: tangle/weave as earliest systematic doc-code coupling approach |
| 13 | Kari, K. | Requirements for Identifiers to Build Strong Knowledge Graphs | 2023 | Medium (Katariina Kari) | Identifier design trade-offs: readability vs. stability vs. reproducibility |
| 14 | Winston, D. | On the Wisdom of Opaque Identifiers | 2022 | donnywinston.com | Opaque identifier rationale; failure modes of semantic names |
| 15 | IETF | RFC Series numbering practices | ongoing | IETF (rfc-editor.org) | Never-reuse, supersession-not-mutation practice for stable specification identifiers |
| 16 | joelparkerhenderson / ADR community | Architecture Decision Records — community practices | ongoing | adr.github.io; github.com/joelparkerhenderson | ADR immutability and sequential numbering as practitioner stable-ID pattern |

---

### 3. Findings on Naming Strategies

#### 3.1 The empirical baseline: how common are dangling references?

Tan, Wagner & Treude (2024) provide the most directly relevant empirical study. Their automated approach detects code element references — mentions of variable names, function names, and class names — that survive in documentation after all corresponding source-code instances have been deleted. Applied to over 3,000 GitHub projects, the study found that most projects contain at least one outdated code element reference at some point in their history. The mechanism driving this failure is structural: developers who delete or rename a code element have no automated signal that documentation elsewhere still refers to the old name. The approach uses regular expression matching rather than language-dependent parsing, which gives it breadth across documentation types (README files, wiki pages, inline comments) but also means it detects only exact-name survivors — indirect references (e.g., referencing a concept by its role rather than its identifier string) are outside its scope.

The broader taxonomy from Aghajani et al. (2019) contextualizes this finding. Their study of 878 documentation artifacts from four sources produced a taxonomy of 162 issue types organized into four categories. Within the "Information Content" category, "Up-to-dateness" accounted for 190 of 740 content-related artifacts — roughly 26% of all content issues. Sub-types under up-to-dateness include "stale code-element references," "outdated version information," "deprecated information," and "broken links." This distribution confirms that staleness of reference is a pervasive, not marginal, documentation failure mode.

#### 3.2 What naming alternatives does the literature support?

The literature does not offer a single dominant naming strategy for corpus-internal identifiers. Instead, it surfaces a spectrum with distinct trade-offs:

**Semantic naming (current RDD practice with WP-*, ADR-NNN, axis labels):** Human-readable, supports discoverability, but embeds mutable semantic content into the identifier string. Berners-Lee (1998) identifies exactly this failure mode in the URI context: identifiers that embed subject matter, status terms, organizational hierarchy, or mechanism details are vulnerable to becoming stale whenever the underlying categorization scheme changes. The principle — "leave information out" of identifiers — applies directly to corpus-internal naming. A label like "WP-014" embeds sequencing; a label like "ADR-070" embeds sequencing and implicitly assumes that the numbering space is stable and that number 70 refers to the same decision indefinitely.

**Opaque identifiers:** Winston (2022) and the knowledge-graph literature (Kari, 2023) argue for opaque identifiers (e.g., Wikidata-style Q-numbers, UUID-based IRIs) that carry no mutable semantic content. The advantage is longevity: an opaque identifier does not become wrong when the concept it refers to is renamed, reclassified, or reorganized. The disadvantage is that opaque identifiers require a separate resolution layer — a registry or indirection table that maps the opaque ID to a human-readable label. Kari (2023) notes that no single approach satisfies all three requirements of readability, reproducibility, and uniqueness simultaneously; the appropriate strategy depends on node type and how the identifier will be used. The opaque-identifier approach is standard in Linked Data (OBO Foundry PURLs, Wikidata, DOI system) but uncommon in software-project documentation practice.

**Monotone sequential numbers with immutability:** Both the IETF RFC series and the ADR community practice a middle path: sequential integers are assigned and never reused, but the artifact the number refers to is treated as immutable. Obsolescence is handled by issuing a new number that explicitly supersedes the old one, with a forward link. This is the ADR community's standard practice: "Once an ADR is accepted, it should never be reopened or changed — instead it should be superseded." The IETF formalizes this more strictly: RFC numbers are never reused; an RFC can be updated or obsoleted only by a new RFC with a new number. This practice makes the number a stable pointer even when the referred-to content is effectively dead — it still resolves to the original, with a supersession link to the replacement.

**Name-plus-registry indirection (URI/PURL pattern):** Sauermann & Cyganiak (2008) recommend that identifiers remain stable by decoupling the identifier string from the physical location of the resource. The 303-redirect pattern allows an identifier to remain constant while the underlying document is restructured. This approach requires infrastructure (a resolver or redirect table) but is the standard adopted for DOIs, PURLs, and ARKs in scholarly publishing — all of which were designed precisely to survive the institutional reorganizations that invalidate plain URLs.

#### 3.3 What the naming-strategy literature does not address

No source retrieved addresses the specific situation where corpus-internal identifiers (WP-IDs, ADR numbers, axis labels, invariant numbers) appear not just in cross-references within the corpus but in executable artifacts — source code, test files — that outlive the corpus itself. The Tan et al. (2024) study examines the inverse: documentation referencing code that has changed. The reverse direction (code or tests referencing documentation identifiers that have changed or disappeared) is not addressed in the empirical literature reviewed. This gap is the core of RDD's Issue #17 and is not solved by naming-strategy choice alone.

---

### 4. Findings on Graduation Ceremonies

#### 4.1 No established literature on the graduation-ceremony framing

A systematic search for literature on the concept of a formal ceremony or procedure that strips corpus-internal references when artifacts are promoted from a planning/documentation corpus into a codebase produced no relevant results. The term "graduation" in a documentation context does not appear in the software engineering literature reviewed. The closest concepts found are:

- **Docs-as-code CI/CD pipelines:** The docs-as-code community addresses promotion of documentation through build pipelines (markdownlint, link-checker, static-site generation), but the concern is rendering quality and broken external links — not stripping corpus-internal identifiers.
- **ADR supersession:** The ADR practice's immutability norm implicitly handles a version of graduation: once an ADR is committed, it does not change — a new ADR supersedes it. But this is corpus-internal handoff, not handoff from corpus to codebase.
- **Literate programming (Knuth 1984):** The WEB system's tangle/weave pipeline is the closest historical precedent for an artifact that transforms documentation into executable code as a formal step. Tangle strips narrative structure and produces compilable Pascal; weave produces typeset documentation. But this pipeline runs in the other direction from RDD's graduation concern: literate programming generates code *from* the documentation, whereas RDD graduation moves *references* from documentation into code. The literate programming literature does not address what happens when the documentation changes after code has been tangled from it.

#### 4.2 What the absence of literature implies

The absence of established literature on graduation ceremonies is itself informative. It suggests that the design problem RDD faces — artifacts that move from a corpus context into executable artifacts and then become decoupled from the corpus's evolution — is either novel or has not been studied systematically. Two candidate explanations:

1. **The problem is typically avoided by keeping documentation and code co-located.** The docs-as-code and continuous-documentation movements both recommend storing documentation in the same repository as code, which eliminates the "graduation" event entirely — documentation is already in the codebase. If RDD's documentation corpus were always co-located with the codebase it describes, the graduation problem would reduce to a synchronization problem (addressed in Section 5).

2. **The problem exists but is absorbed into "technical debt" without specific tooling.** Tan et al. (2024) observe that outdated documentation references accumulate silently because developers have no automated signal at the point of renaming or deletion. The graduation-ceremony framing names a specific intervention point (the promotion event) where that signal could be generated, but this appears to be an RDD-specific design contribution rather than a pattern drawn from prior literature.

#### 4.3 The closest practitioner pattern: pre-commit or pre-release scanning

The Swimm platform (Rosenbaum 2021) implements the closest functional analogue to a graduation check: its CI/CD integration flags documentation as "review required" when referenced code elements have changed, blocking merge until the documentation is updated. This is a continuous check rather than a point-in-time graduation ceremony, but it demonstrates the viability of automated scanning as an enforcement mechanism. Tan et al. (2024)'s approach — scanning documentation for references to code elements that no longer exist in source — could in principle be adapted as a pre-graduation scan. The tool is open-source; the adaptation would require applying it at the point of corpus-to-codebase promotion rather than continuously.

---

### 5. Findings on Doc-Code Coupling (Continuous Documentation)

#### 5.1 The three-principle framework

Rosenbaum (2021) proposes continuous documentation as a practice built on three principles: (1) always up-to-date, achieved through continuous verification analogous to CI; (2) created when best, meaning documentation is written immediately after code changes while context is fresh; (3) code-coupled, meaning documentation explicitly references specific source files, functions, and line numbers. The third principle is the one directly relevant to Q1: code-coupled documentation uses explicit references to code elements, which creates both the benefit (discoverability) and the risk (references become stale when code changes).

The Rosenbaum articles contain no citations to academic literature. The framework is presented as practitioner knowledge, grounded in product experience with the Swimm platform. Its principles are consistent with the academic literature (Tan et al. 2024 addresses exactly the failure mode that continuous verification aims to prevent) but the causal claims are not independently validated.

#### 5.2 Literate programming as the foundational precedent

Knuth (1984) introduced the WEB system to solve a specific coupling problem: programs written for human readers rather than compilers, with tangle producing executable code and weave producing documentation. The coupling in WEB is tight by design — both artifacts are derived from the same source. The failure mode Knuth did not fully anticipate is maintenance: when the WEB source changes, both tangled code and woven documentation change together, but cross-references from outside the WEB system (external documentation, tests, comments) can still refer to names that have been renamed within the WEB source. The literate programming community identifies documentation drift — the drift between specification and implementation over time — as the primary maintenance liability of the approach.

#### 5.3 What happens when code elements are renamed or deleted

Tan et al. (2024) directly address this failure mode. Their key finding — that most projects contain at least one outdated code element reference at some point in their history — holds across the full range of GitHub project sizes and types analyzed. The mechanism is straightforward: documentation refers to code elements by name; code elements are renamed or deleted; documentation is not updated. The tooling gap is that standard version-control workflows provide no diff-based alert to documentation maintainers when a referenced code element is removed. The Swimm platform's "review required" flag attempts to close this gap through code-path tracking, but Rosenbaum (2021) does not detail the mechanism for handling renamed (as opposed to deleted) elements.

Hata et al. (2019) find a parallel failure mode in the link domain: links embedded in source code comments decay at approximately 10% — nearly one in ten links in source code comments is dead. Xiao et al. (2023) find that commit-message links decay at higher rates (70% of distinct links suffer from decay), with inaccessible links increasing from 7–37% in source code comments to 34–43% in commit messages. These numbers establish the base-rate expectation: any documentation that relies on externally-resolved references (URLs, external system identifiers) will accumulate approximately 10–40% dead references over the lifetime of the codebase, depending on reference type and context.

#### 5.4 The Stable Dependencies Principle as a documentation-coupling frame

Martin (2002)'s Stable Dependencies Principle states that dependencies should point in the direction of increasing stability: volatile components should depend on stable components, never the reverse. Applied to documentation, the principle suggests that documentation artifacts should depend on stable code elements — stable public APIs, stable module names, stable interface contracts — rather than on volatile internals (implementation variable names, internal function names, private class members). Documentation that references volatile internals will accumulate outdated references faster than documentation that references stable surfaces.

This framing reframes the naming problem: the question is not only *how* to name corpus-internal identifiers but *which code surfaces* documentation should reference. A documentation strategy that restricts references to public, versioned APIs would accumulate far fewer dangling references than one that freely references internals — regardless of naming convention. Martin (2002) does not address documentation directly; this extension is the reviewer's inference, not a claim made in the source.

#### 5.5 The "up-to-dateness" issue category as practitioner signal

Aghajani et al. (2019) found that up-to-dateness issues account for 190 out of 740 content-related documentation artifacts — roughly one in four — in their cross-source sample. The specific sub-types include stale code-element references, outdated version information, deprecated information, and broken links. This distribution confirms that the failure mode is not rare or edge-case: it is routine across projects of varying scales and types. Lethbridge, Singer & Forward (2003) found that engineers frequently consult documentation they know to be outdated and adapt, using prior knowledge to interpret stale references. This finding suggests that the practical impact of stale references is partially absorbed by practitioner expertise — experienced engineers can navigate outdated documentation — but that this coping mechanism fails for new contributors, external stakeholders, and (most relevantly for RDD) AI agents that cannot apply the same interpretive repair.

---

### 6. Cross-Domain Analogues

#### 6.1 Reference rot and link rot in scholarly publishing

Coble & Karlin (2023) examined 226 articles in Digital Humanities Quarterly (2007–2019), finding that 31% of web-based citations no longer resolve correctly. DHQ showed relatively high rates comparable to journalism (39%) and library science (36%), and significantly higher than biomedical fields (12%). The study found that DOIs showed 99.1% resolution success, compared to substantially lower rates for plain URLs. This finding directly supports the opaque-identifier approach: DOIs succeed because they are resolved through an indirection layer (the DOI resolver) that decouples the identifier string from the physical location of the resource. When resources move, the resolver is updated; the DOI remains constant.

The mechanism generalizes: any identifier system that relies on the continued existence and location of the named resource at its original address will accumulate broken references. Any identifier system that introduces an indirection layer (DOI → resolver → current URL; ADR number → supersession chain → current decision) will accumulate broken references more slowly because the indirection layer can be updated without changing the identifier.

Berners-Lee's (1998) observation applies precisely: "URIs don't change: people change them." Organizational restructuring, tool migrations, and renaming decisions drive reference decay — not technical necessity. The failure is not inevitable but it is routine whenever identifier design does not account for organizational change.

#### 6.2 URI stability theory

Berners-Lee (1998) and Sauermann & Cyganiak (2008) articulate a design principle that translates directly to corpus-internal naming. Berners-Lee identifies specific categories of information that should not appear in identifiers because they change over time: author names, subject classification, status terms (draft, final), access levels, file extensions, software mechanisms, and domain subdivisions. All of these are analogous to corpus-internal identifier components: a WP number embeds a sequencing scheme; an ADR number embeds a decision index; an axis label embeds a conceptual taxonomy; an invariant number embeds a structural position. Any of these can change under corpus reorganization, methodology revision, or renumbering.

Sauermann & Cyganiak (2008) offer two concrete implementation patterns: hash URIs (fragment identifiers that are stable at the document level) and 303-redirect URIs (identifiers that resolve through a server-side redirect). Both patterns decouple the identifier from the physical artifact location. In a corpus context, the analogue would be a name registry or indirection table: corpus-internal identifiers map to display labels through a table that can be updated without changing the identifier strings embedded in code or tests.

#### 6.3 Knowledge graph identifier design

The knowledge-graph identifier literature (Kari, 2023; OBO Foundry; Wikidata practices) addresses the same trade-off in a different domain. Three competing requirements — readability (engineers should recognize the identifier), reproducibility (the same concept always gets the same identifier), and uniqueness (no two concepts share an identifier) — cannot all be simultaneously maximized. Natural-text identifiers maximize readability but fail on reproducibility (concept names evolve) and on uniqueness (polysemy). Hash-based identifiers (SHA-1 of content) maximize reproducibility and uniqueness but fail on readability. Sequential integers (like RFC numbers or ADR numbers) provide uniqueness and some readability but fail on reproducibility if the numbering scheme is reset or reorganized.

Winston (2022) argues specifically that semantic identifiers — those whose meaning is legible from the identifier string — are fragile because specialized terminology evolves and accumulates polysemy. The example given is "resolution" in lithography, which practitioners use to mean two different things. An identifier string that embeds "resolution" will eventually become ambiguous or wrong. The same failure mode applies to corpus labels like "approach-A" or "verbosity-axis": as the methodology evolves, these labels accumulate new meanings or lose their original precision.

#### 6.4 IETF RFC numbering as a mature practitioner solution

The IETF's RFC series is arguably the most successful large-scale practitioner solution to the identifier stability problem in technical specification corpora. Its key properties are: (1) numbers are assigned sequentially and never reused; (2) documents are immutable once published — a correction requires a new RFC; (3) supersession is explicit and bidirectional — the superseded RFC carries a forward link to its replacement, and the replacement carries a backward link; (4) status transitions (from Proposed Standard to Historic, for example) are tracked in the RFC Editor's metadata, not in the RFC number itself. This design means that a reference to RFC 1034 in any document will always resolve to the same artifact — the original DNS specification — regardless of subsequent supersession or obsolescence.

The ADR community has adopted a similar, lighter-weight version: sequential numbering, immutability, and explicit supersession links. The difference is that the ADR community relies on file-naming conventions and manual linking rather than a maintained registry. This makes ADR cross-references less reliable than RFC cross-references: if an ADR is renumbered (e.g., if the ADR directory is reorganized and files are renamed), cross-references from code or tests will break without any automated detection.

---

### 7. Implications for the Cycle

#### 7.1 Which framing(s) does the literature most support?

The three framings examined — naming strategies, graduation ceremonies, and doc-code coupling — are not mutually exclusive. The literature provides distinct but complementary support for each:

**Naming strategies framing:** Moderately supported. The literature confirms that semantic naming is fragile (Berners-Lee 1998; Winston 2022), that opaque identifiers are more durable (knowledge-graph literature; DOI evidence from Coble & Karlin 2023), and that the RFC/ADR immutability + sequential-numbering pattern is a mature practitioner solution. However, naming strategy alone does not address the core RDD failure mode — corpus-internal identifiers appearing in executable artifacts. A perfectly opaque identifier embedded in a test file is still a dangling reference if the registry it resolves through is not co-located with or accessible from the codebase. Naming strategy is a necessary but not sufficient fix.

**Graduation ceremonies framing:** Not supported by prior literature — no established practice exists. The absence is informative: the most natural resolution in the literature is to eliminate the graduation event by keeping documentation and code co-located (docs-as-code). If graduation is a hard requirement of RDD's architecture (i.e., the corpus and the codebase are intentionally separate artifacts with a defined promotion event), then RDD faces a genuine design gap that the graduation-ceremony framing correctly identifies but that the literature does not fill. The closest available mechanism is a pre-graduation scan modeled on Tan et al. (2024)'s approach — automated detection of corpus-internal identifier strings in candidate codebase artifacts before graduation is approved.

**Doc-code coupling framing:** Most strongly supported. This framing — that the issue is a synchronization problem between two evolving artifacts, not fundamentally a naming problem — receives the most consistent cross-source support. Tan et al. (2024) provide direct empirical evidence that documentation-to-code reference decay is pervasive. The continuous-documentation framework (Rosenbaum 2021) proposes continuous verification as the primary mitigation. The Swimm platform demonstrates a working implementation of that mitigation. The Stable Dependencies Principle (Martin 2002) provides a stability-theoretic grounding: documentation should reference stable surfaces, not volatile internals. The link-decay literature (Hata et al. 2019; Xiao et al. 2023) establishes base rates that make passive trust in reference stability untenable.

#### 7.2 The novel element: corpus-internal identifiers in executable artifacts

None of the literature reviewed addresses the specific RDD failure mode precisely: corpus-internal identifiers (WP numbers, ADR numbers, axis labels, invariant numbers) appearing in source code or test files as string literals or comments, where those identifiers become dangling references after corpus reorganization or methodology revision. The literature addresses: (a) code-element references in documentation (Tan et al. 2024); (b) URL references in comments and commit messages (Hata et al. 2019; Xiao et al. 2023); (c) identifier stability for URIs and scholarly citations. None of these is exactly the reverse case — documentation-identifier references in code.

This means RDD's graduation problem is genuinely novel in the empirical literature, and the design of a graduation check or scanning mechanism would be a methodological contribution. The tools and theoretical framework exist (Tan et al.'s approach can be inverted; continuous-documentation CI hooks could be adapted); the specific application has not been studied.

#### 7.3 What remains open

- **Should RDD adopt opaque identifiers for corpus-internal concepts?** The literature supports opacity for long-lived, cross-referenced identifiers. The cost is a maintained registry or resolution layer. Whether that cost is acceptable depends on the scale and longevity of RDD corpora — a question the literature cannot answer for RDD specifically.
- **Is the right intervention at naming, at graduation, or continuously?** The literature most supports continuous verification (docs-as-code, Swimm-style CI hooks) as the most reliable mechanism. A point-in-time graduation scan is a reasonable second-best if continuous verification is not feasible. Naming-strategy improvements reduce the rate of accumulation but do not eliminate it.
- **Does the Stable Dependencies Principle suggest a documentation-surface policy?** If RDD documentation is permitted to reference only stable code surfaces (versioned public APIs, stable module interfaces), the rate of dangling references would decrease. This policy would need to be defined and enforced — probably as a `rdd-conform` or `rdd-build` stewardship check.
- **The gap in the graduation-ceremony literature** suggests that developing and publishing a formal model of the graduation problem — artifact promotion from a process corpus to a durable codebase, with the associated reference-decoupling failure mode — would constitute novel practitioner research.

---

### 8. Limitations

**Graduation-ceremony literature gap:** No prior literature addresses corpus-to-codebase artifact promotion as a named design problem. Search terms were broad and varied; the absence is likely genuine rather than a search failure.

**Tan et al. (2024) access:** The full Springer paper (doi: 10.1007/s10664-023-10397-6) was not retrieved in full text due to access restrictions. Findings are drawn from the arXiv preprint (arXiv:2212.01479), the abstract, and secondary descriptions from the conference presentation and Singapore Management University repository page. Precision and recall metrics for the detection approach were not available in the retrieved materials.

**Martin (2002) primary text:** The Stable Dependencies Principle summary is drawn from secondary expositions (devlead.io, blog summaries of Clean Architecture). The original chapter in Agile Software Development (Prentice Hall, 2002) was not retrieved. The extension of SDP to documentation coupling is the reviewer's inference, not a claim made in Martin's primary text.

**Lethbridge, Singer & Forward (2003):** Findings are summarized from secondary accounts and conference abstracts. The full paper was not retrieved.

**Rosenbaum (2021) academic standing:** The continuous-documentation framework contains no citations to academic literature. It is practitioner knowledge from a product vendor. Claims about mechanism effectiveness are not independently validated in the academic literature reviewed.

**No adversarial literature on continuous documentation:** No study evaluating the failure modes or limitations of the continuous-documentation approach (e.g., false-positive drift alerts, performance cost of continuous scanning, breakdowns at scale) was retrieved. The approach may have failure modes not visible in the vendor literature.

---

### Sources

Full citation list for sources cited in this review:

1. Tan, W. S., Wagner, M. & Treude, C. (2024). Detecting Outdated Code Element References in Software Repository Documentation. *Empirical Software Engineering*, 29(1), Article 5. doi: 10.1007/s10664-023-10397-6. arXiv preprint: arXiv:2212.01479.

2. Aghajani, E., Nagy, C., Vega-Márquez, O. L., Linares-Vásquez, M., Moreno, L., Bavota, G. & Lanza, M. (2019). Software Documentation Issues Unveiled. *Proceedings of the 41st International Conference on Software Engineering (ICSE 2019)*. doi: 10.1109/ICSE.2019.00122.

3. Hata, H., Treude, C., Kula, R. G. & Ishio, T. (2019). 9.6 Million Links in Source Code Comments: Purpose, Evolution, and Decay. *Proceedings of the 41st International Conference on Software Engineering (ICSE 2019)*. arXiv: 1901.07440.

4. Xiao, T., Baltes, S., Hata, H., Treude, C., Kula, R. G., Ishio, T. & Matsumoto, K. (2023). 18 Million Links in Commit Messages: Purpose, Evolution, and Decay. *Empirical Software Engineering*, 28, Article 91. doi: 10.1007/s10664-023-10325-8. arXiv: 2305.16591.

5. Lethbridge, T. C., Singer, J. & Forward, A. (2003). How Software Engineers Use Documentation: The State of the Practice. *IEEE Software*, 20(6), 35–39. doi: 10.1109/MS.2003.1241364.

6. Martin, R. C. (2002). *Agile Software Development: Principles, Patterns, and Practices*. Prentice Hall. (Stable Dependencies Principle: Part III, Component Principles.)

7. Rosenbaum, O. (2021, June 3). Shifting to Continuous Documentation as a New Approach for Code Knowledge. *InfoQ*. https://www.infoq.com/articles/continuous-documentation/

8. Rosenbaum, O. (2021, September 29). What is Continuous Documentation? The manifesto. *Swimm Blog*. https://swimm.io/blog/what-is-continuous-documentation-manifesto-part-1

9. Berners-Lee, T. (1998). Cool URIs Don't Change. W3C Style Note. https://www.w3.org/Provider/Style/URI

10. Sauermann, L. & Cyganiak, R. (2008). Cool URIs for the Semantic Web. W3C Interest Group Note. https://www.w3.org/TR/cooluris/

11. Coble, Z. & Karlin, J. (2023). Reference Rot in the Digital Humanities Literature: An Analysis of Citations Containing Website Links in DHQ. *Digital Humanities Quarterly*, 17(1). https://www.digitalhumanities.org/dhq/vol/17/1/000662/000662.html

12. Knuth, D. E. (1984). Literate Programming. *The Computer Journal*, 27(2), 97–111.

13. Kari, K. (2023). Requirements for Identifiers to Build Strong Knowledge Graphs. *Medium*. https://medium.com/@katsi11/requirements-for-identifiers-to-build-strong-knowledge-graphs-0254c357db86

14. Winston, D. (2022). On the Wisdom of Opaque Identifiers. donnywinston.com. https://donnywinston.com/posts/on-the-wisdom-of-opaque-identifiers/

15. IETF (ongoing). RFC Series — numbering and immutability practices. https://www.ietf.org/process/rfcs/

16. ADR community. Architecture Decision Records — community practices and templates. https://adr.github.io/ ; https://github.com/joelparkerhenderson/architecture-decision-record
