## Literature Review: ADR Supersession Workflow — Historical Fidelity vs. Current-State Accuracy

**Date:** 2026-04-15
**Method:** Systematic literature search — practitioner sources, standards documentation, academic AKM literature, adjacent-field process documentation
**Cycle:** RDD 016, Track #12

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| S1 | Nygard, M.T. | "Documenting Architecture Decisions" | 2011 | Cognitect blog | Original ADR proposal; defines immutability and supersession |
| S2 | Tyree, J. & Akerman, A. | "Architecture Decisions: Demystifying Architecture" | 2005 | IEEE Software 22(2) | Template with status field; earliest practitioner formalization |
| S3 | ThoughtWorks | "Lightweight Architecture Decision Records" | 2020 | Technology Radar (Adopt ring) | Practitioner endorsement; storage guidance |
| S4 | AWS | "ADR Process" (Prescriptive Guidance) | 2023 | AWS Documentation | Most detailed practitioner lifecycle model; immutability after acceptance |
| S5 | Microsoft | "Maintain an Architecture Decision Record" | 2026 | Azure Well-Architected Framework | Append-only log; confidence field; supplemental document linking |
| S6 | Fowler, M. | "Architecture Decision Record" (bliki) | 2023 | martinfowler.com | Endorses supersession over amendment; status-driven lifecycle |
| S7 | GDS | "Documenting Architecture Decisions" | 2022 | GDS Way | ADR as versioned artifact; supplemental wiki/RFC system; limited in-flight mutability |
| S8 | Google Cloud | "Architecture Decision Records Overview" | 2024 | Cloud Architecture Center | Revisit-with-history approach; no explicit supersession protocol |
| S9 | Marques, A. | "Implementing a Workflow for Your Architecture Decision Records" | 2019 | Medium | Amendment vs. supersession distinction; custom status taxonomy |
| S10 | Zdun, U. et al. | "Sustainable Architectural Design Decisions" | 2013 | InfoQ / IEEE Software | Y-statement format; sustainability criteria; traceability across artifacts |
| S11 | Jansen, A. & Bosch, J. | "Software Architecture as a Set of Architectural Design Decisions" | 2005 | WICSA Proceedings | Knowledge vaporization concept; decisions as first-class architecture |
| S12 | Capilla, R., Jansen, A., et al. | "10 Years of Software Architecture Knowledge Management: Practice and Future" | 2016 | Journal of Systems and Software 116 | Empirical barriers to AKM adoption; cost of capture |
| S13 | Zimmermann, O. et al. | "Markdown Architectural Decision Records: Format and Tool Support" | 2018 | CEUR Workshop Proceedings Vol-2072 | MADR template; Y-statement derivation; tooling overview |
| S14 | IETF | RFC 2026: "The Internet Standards Process — Revision 3" | 1996 | IETF BCP 9 | Definitive RFC supersession process; Historic status; Obsoletes/Updates distinction |
| S15 | RFC Editor | "Status and Type of RFC Errata" | ongoing | rfc-editor.org | Errata taxonomy; how corrections work without modifying published RFCs |
| S16 | W3C | "Obsoleting and Rescinding W3C Specifications" | 2023 | w3c.github.io/guide | Three-category supersession (Superseded, Obsolete, Rescinded); reversible governance |
| S17 | W3C | "Version Management in W3C Technical Reports" | 2022 | w3c.github.io/guide | URL and status-section discipline for multi-version navigation |
| S18 | Stripe | "APIs as Infrastructure: Future-Proofing Stripe with Versioning" | 2018 | Stripe Engineering Blog | Date-based versioning; version-change modules; pinning vs. current |
| S19 | InfoQ / Zimmermann et al. | "Has Your Architectural Decision Record Lost Its Purpose?" | 2023 | InfoQ | ADR scope creep; separate logs for non-architectural decisions |
| S20 | npryce / adr-tools | adr-tools: `adr new -s N` command | 2022 | GitHub (npryce/adr-tools) | Supersession as tooling primitive; bidirectional status updates |
| S21 | Avgeriou, P. et al. | "Architecture Knowledge Management Tools — 11 Years On" | 2023 | JSS Papers / Medium | Tool ecosystem survey; adoption gaps persist |

---

### Synthesis

#### 12.1 — ADR Mutability: What Practitioners Say

The practitioner consensus on ADR mutability is unusually firm for a community that otherwise produces heterogeneous advice. All major sources — Nygard (S1), Fowler (S6), AWS (S4), Microsoft (S5), and GDS (S7) — converge on the same structural rule: once an ADR is **accepted**, its decision text is immutable. Change is expressed by creating a new ADR that supersedes the old one, not by editing the old one.

Nygard's 2011 original is the locus classicus. His five-field template (Title, Status, Context, Decision, Consequences) treats the numbered identifier as permanently assigned — "numbers will not be reused" — and prescribes keeping superseded records intact: "If a decision is reversed, we will keep the old one around, but mark it as superseded. It's still relevant to know that it *was* the decision, but is *no longer* the decision" (S1). He does not articulate explicit field-level mutability rules, but the implication is clear: the Status field is the only thing that changes on an accepted ADR.

AWS Prescriptive Guidance (S4) is the most systematic in spelling this out: "When the team accepts an ADR, it becomes immutable. If new insights require a different decision, the team proposes a new ADR." It further states that "the team should treat ADRs as immutable documents after the team accepts or rejects them." The lifecycle diagram in S4 shows that the old ADR's Status field is set to **Superseded** only after the new ADR has itself been accepted — meaning the Status field remains the single permitted mutation site on any accepted record.

Tyree and Akerman (S2) are a partial exception. Their 2005 template included a Status field with values like "pending," "decided," and "approved" but did not theorize about post-acceptance immutability. Their template focused on capturing decisions, not governing their lifecycle. The status field they defined has become standard, but the immutability norm was codified later by the Nygard/adr-tools community.

The GDS guidance (S7) introduces a nuanced pre-acceptance exception: teams may edit a draft ADR during implementation if clarifications or new consequences emerge, *provided* implementation of the original decision has not yet begun. Once implementation starts, a new ADR is required. This is the only mainstream source that explicitly permits bounded amendment rather than demanding pure supersession from the first keystroke.

The Marques workflow article (S9) formalizes the **amendment vs. supersession** distinction that most sources conflate. Supersession replaces a decision wholesale; amendment improves or refines one. Both are expressed through new ADR files (not edits to the original), and both result in bidirectional status links. Custom status values — including "amended" as a distinct value from "superseded" — are supported by tooling like ADRGen.

**Summary for 12.1:** The immutable field in all established ADR practice is the accepted decision text. The **Status** field is explicitly designed to be mutable (Proposed → Accepted → Superseded/Deprecated). All other fields — Context, Decision, Consequences — are treated as immutable after acceptance, with the exception of GDS's narrow pre-implementation editing window. There is no mainstream practitioner who sanctions retroactive editing of the decision rationale.

---

#### 12.2 — Role Separation: ADRs as History vs. Current-State Documents

The role separation that Issue #12 proposes — ADRs as immutable historical record, separate current-state documents (system-design, ORIENTATION) as current truth — is **partially present** in existing methodology but is nowhere formalized as an explicit architectural principle. The literature gestures at it repeatedly but treats it as implementation detail rather than doctrine.

The clearest articulation comes from GDS (S7): "An ADR isn't a complete description of a software system or architecture. Some teams use requests for comment (RFCs), wikis, team manuals, or other collaboration tools to document their architecture, and these should be updated whenever a new ADR is accepted." This establishes the dual-document model: ADR as decision-event record, other documents as current-state mirrors. The triggering mechanism — "updated whenever a new ADR is accepted" — is exactly the supersession workflow Issue #12 is trying to formalize.

Microsoft's Azure Well-Architected (S5) makes a related point: "Avoid making decision records design guides. If more justification or design ideation is available, provide a link to a document as supplemental material, but the decision must be clear and stand alone without that material." This is role separation in the negative — ADRs should *not* be current-state documents — but it does not specify which document becomes the current-state anchor.

Fowler (S6) says simply: "If there's supporting material, link to it." The supporting material (architecture docs, RFCs, diagrams) is the current-state layer; the ADR is the decision-event layer. The link is unidirectional in Fowler's framing: ADR links to supporting material, not the reverse.

The AWS architecture blog (S18 / AWS best practices) inverts the direction slightly: it recommends keeping a separate design document for exploring alternatives and referencing those from within the ADR. Again, two-tier, but the second tier is a design exploration artifact, not a current-state architecture document.

The academic AKM literature (Zdun et al., S10; Jansen & Bosch, S11) frames the distinction in terms of **traceability**: decisions should maintain explicit links to requirements, architecture, and code at multiple abstraction levels. This implies that current-state documents (architecture views, component models) should link *to* decisions, creating bidirectional provenance. But neither source specifies what happens to those provenance links when a decision is superseded — the traceability problem is identified, not solved.

The InfoQ "lost its purpose" article (S19) argues for a third category: important non-architectural decisions that should have their *own* decision log, separate from the ADR corpus. This adds another dimension: not just historical-vs-current, but architectural-vs-non-architectural. It suggests that role separation is necessary across two axes simultaneously.

**Summary for 12.2:** The role separation Issue #12 proposes is latent in established methodology — GDS comes closest to stating it explicitly. But no source treats it as a first-class architectural decision about documentation architecture. The mainstream position is: ADRs are historical (immutable), other documents are current-state (mutable), and the update trigger is ADR acceptance/supersession. The *mechanism* for keeping current-state documents synchronized on supersession is nowhere systematically specified. That is the genuine gap this issue is trying to close.

---

#### 12.3 — Adjacent-Field Supersession Workflows

**The IETF RFC Process (S14, S15)**

The IETF RFC model is the most directly analogous to the ADR problem and the most instructive for understanding how to handle immutability at scale.

Published RFCs are never modified after assignment of an RFC number. RFC 2026 states this explicitly: "Once an RFC is published, it is never changed." Corrections are handled through a separate errata system (S15) that creates a typed annotation (Verified or Held-for-Update) attached to the original document — the original remains unchanged, but the errata record acknowledges the error. This is analogous to ADR annotation without ADR mutation.

The IETF distinguishes three supersession mechanisms that do not exist in ADR practice:
1. **Obsoletes** — a new RFC entirely replaces a previous one. The old RFC is preserved but its header links to the replacement. Current-state readers following the Datatracker link see the new RFC; historians can still read the old one.
2. **Updates** — a new RFC *partially* modifies a previous one. The old RFC is preserved and remains partially valid; the Updates header in the new RFC specifies which sections are affected. This is granular supersession that ADR practice has no equivalent for.
3. **Historic** — a status designation applied to RFCs whose technology is deprecated. This is a separate status track from supersession: an RFC can be superseded (replaced by something better) without becoming Historic (deprecated technology).

The IETF also publishes a periodic "Internet Official Protocol Standards" RFC that provides a current-state index of all active standards. This is the current-state navigation layer sitting above the immutable historical corpus — the closest analog in the ADR world would be an `ARCHITECTURE.md` or `system-design.md` that maintains the current architectural picture while ADRs remain frozen.

**Mapping to ADR:** The Obsoletes/Updates distinction maps usefully. Most ADR supersessions are "Obsoletes" — total replacement. But some supersessions are partial: a new ADR may change one consequence of a previous decision while leaving the rest intact. ADR tooling does not currently distinguish these cases. The IETF's "Updates" mechanism suggests a partial-supersession annotation that ADR practice lacks. The IETF's periodic current-state index maps directly to the role of system-design.md — but in the IETF model, the index is an explicit, regularly-published artifact, not an informal side document.

**Where the analogy breaks:** RFCs are public standards documents with legal and interoperability implications; their immutability is partly enforced by citation integrity across the global internet. ADRs are internal team artifacts where the cost of immutability is lower and the benefit of editability (correcting early mistakes before downstream citation) is higher. The errata system's four-tier status structure (Reported, Verified, Held-for-Document-Update, Rejected) would be over-engineering for most ADR contexts.

**The W3C Specification Process (S16, S17)**

W3C maintains a three-category supersession taxonomy — Superseded (newer version recommended), Obsolete (unsuitable for ongoing use), and Rescinded (withdrawn entirely with patent implications) — that is more granular than anything in ADR practice. The key distinction is that Superseded and Obsolete are reversible governance decisions, while Rescinding is permanent and carries IP consequences.

W3C's URL management approach (S17) is directly applicable: a specification's canonical URL always resolves to the current Recommendation; dated URLs resolve to specific historical snapshots. This provides "Latest Version" and "Previous Version" pointers — a structural mechanism for current-state accuracy without touching the historical record. In ADR terms, this would be analogous to maintaining a `CURRENT_ARCHITECTURE.md` that always reflects the latest accepted state, while individual ADR files serve as the dated/numbered snapshots.

**Where the analogy breaks:** W3C specs are versioned documents in the usual sense — HTML 4.0 and HTML 5 are recognized as discrete versions of the same specification. ADRs are event records (a decision made at a point in time) rather than versioned documents. The W3C "supersedes the previous version" model assumes that the successor document covers the same scope as the predecessor. ADR supersession often involves scope change — the new ADR may address a narrower or broader architectural concern than the one it supersedes.

**API Versioning — Stripe (S18)**

Stripe's date-based API versioning model provides a different lens: the "current version" is what new consumers get by default; old versions are preserved for existing consumers who are pinned to them. The mechanism is version-change modules — self-contained code units that transform old-format responses to new-format responses. No old version is deleted; it is preserved and served to pinned consumers indefinitely.

The Stripe model addresses a problem that ADR practice does not: *concurrent consumption* of historical and current versions by different audiences. Existing API consumers need the old behavior; new consumers get the current behavior. ADRs do not typically have this problem — there is usually one canonical "current architecture" for a given system, not multiple concurrent versions being served to different consumers.

**Where the analogy breaks:** Stripe's versioning preserves behavioral compatibility across versions; ADR supersession is not about compatibility but about epistemic currency. The version-pinning mechanism has no ADR analog. However, the "walking back through time by applying version-change modules" architecture is conceptually similar to reconstructing architectural history by traversing a supersession chain — both are append-only log structures read in reverse.

**Summary for 12.3:** The IETF's Obsoletes/Updates/Historic taxonomy is the most structurally useful analog. It provides the distinction between total and partial supersession that ADR practice lacks, and the periodic current-state index is a direct analog to system-design.md. W3C's URL management and "Latest Version" pointer discipline provides a clean model for serving current-state readers without modifying the historical corpus. Stripe's model is less applicable because it addresses concurrent version consumption across external consumers rather than the internal epistemic currency problem.

---

#### 12.4 — Costs of ADR Immutability

This question has received the least systematic attention in the literature. Most sources assert immutability as a best practice without accounting for its costs. The costs are documented, but diffusely, mostly in practitioner reflections.

**Navigation complexity grows with the supersession chain.** As ADR collections age, the supersession graph can become difficult to traverse. Readers encountering ADR-012 (Superseded by ADR-031, which was Superseded by ADR-047) must traverse multiple documents to reconstruct current architectural state. No mainstream ADR tooling renders this chain visually or provides a "latest in chain" shortcut. The adr-tools `supersede` command (S20) creates bidirectional links but does not aggregate chain endpoints. This is a well-known practitioner complaint, noted in multiple practitioner blog posts, that the tooling ecosystem has not addressed.

**Provenance chains in current-state documents go stale.** When system-design.md cites ADR-012 to justify a current architectural choice, and ADR-012 is then superseded by ADR-031, the citation in system-design.md now points to the historical record rather than the current decision. If the reader does not notice the Superseded status, they will misread the provenance chain. This is the precise tension Issue #12 identifies — and the literature contains no prescribed remedy. The GDS guidance (S7) says other documents "should be updated when a new ADR is accepted" but does not specify a mechanism for ensuring this happens. No source audits whether it actually happens in practice.

**Immutability encourages ADR proliferation.** Since you cannot edit an ADR, every refinement requires a new one. Zdun et al. (S10) note that "capturing significant decisions and their rationale is difficult and often neglected because doing so requires considerable effort." Immutability increases the effort of correction: you cannot fix a decision you slightly misstated without creating a new ADR. Over time, this creates a large collection of mostly-superseded records whose historical value is debatable.

**The "never get read" problem.** Capilla et al. (S12) report that a major barrier to AKM adoption is that "architects are not likely to document their decisions and rationale, despite the well-established benefits of doing so." A 2023 study of open-source repositories found that approximately 50% of repos with ADRs contain fewer than five records, suggesting high abandonment rates after initial adoption. The immutability norm may contribute: if a team knows that writing an ADR creates a permanent artifact they cannot correct, they may write fewer, vaguer ADRs to reduce the risk of being permanently wrong. This is a form of anticipatory friction.

**Reader confusion from stale context.** Microsoft's Azure guidance (S5) notes: "Always include context and rationale. A record without justification loses its value over time as stakeholders can't evaluate whether the decision still applies when circumstances change." But if context is immutable, it may also become misleading — an ADR written in the context of a startup with three engineers still reads as authoritative rationale when the organization has five hundred engineers and a different deployment model. The context that made the decision sensible has changed; the ADR does not change with it; but the supersession mechanism does not require the new ADR to explain what changed in context, only what changed in the decision.

**The "living document" counter-position.** One practitioner source (referenced in the AWS search results and ctaverna.github.io) explicitly rejects immutability on pragmatic grounds: "In theory, immutability is ideal. In practice, mutability has worked better for our teams. We insert the new info into the existing ADR, with a date stamp, and a note that the info arrived after the decision." This living-document approach trades historical purity for navigational simplicity — one document reflects the current state of thinking on a decision, with a visible changelog. It is a minority position in the practitioner literature, but it is a documented one. The GDS position (S7) partially endorses a variant: pre-implementation editing is permitted.

**Summary for 12.4:** The costs of immutability are: (1) supersession chain navigation complexity with no tooling support for resolution; (2) stale provenance citations in current-state documents with no prescribed update trigger; (3) higher per-correction overhead leading to underuse or over-vagueness in ADR writing; (4) frozen context that may mislead readers in changed organizational conditions; (5) a documented counter-position that living documents work better in practice for some teams. The costs are real and recognized but have not been systematically studied or measured.

---

### Key Findings

- **Nygard (S1) establishes immutability as default but specifies only Status as the explicitly mutable field.** The norm against editing decision text post-acceptance is a community interpretation of his framing, codified later by tooling conventions. He does not distinguish partial from total supersession.

- **AWS Prescriptive Guidance (S4) is the most systematic formalization of the supersession workflow.** Accepted ADRs are immutable; new ADRs supersede old ones; the old ADR's Status is updated to Superseded only after the new ADR is accepted. The old ADR's decision text is never touched.

- **GDS (S7) is the only mainstream source that explicitly models the dual-document architecture.** ADRs are the historical record; wikis, RFCs, and team manuals are the current-state layer; the update trigger is ADR acceptance. This is the closest existing statement of the role separation Issue #12 proposes.

- **The IETF's Obsoletes/Updates/Historic taxonomy (S14) provides the most structurally complete supersession model in any adjacent field.** The "Updates" mechanism for partial supersession has no ADR equivalent. The periodic current-state index (the Official Protocol Standards RFC) is a direct analog to a maintained system-design.md.

- **W3C's "Latest Version" URL discipline (S16, S17) provides a clean mechanism for current-state navigation without historical mutation.** The canonical URL resolves to current; dated URLs resolve to snapshots. This is a structural pattern applicable to ADR collections via a maintained index document.

- **The amendment/supersession distinction (Marques, S9) is underspecified in mainstream practice.** Most sources conflate the two. Amendment (refinement of a decision) and supersession (replacement of a decision) are structurally different and warrant different status annotations and different effects on provenance chains.

- **Immutability costs are real but unmeasured.** Stale provenance citations in current-state documents are the most operationally significant cost. No source prescribes a mechanism for ensuring that system-design.md is updated when an ADR it cites is superseded.

- **Knowledge vaporization (Jansen & Bosch, S11; Capilla et al., S12) is the motivating problem for AKM, but immutability creates its own vaporization risk.** If context changes silently while decision text is frozen, readers may reach incorrect conclusions from technically accurate historical records.

- **Tooling supports supersession as a primitive (adr-tools `-s` flag, MADR status field) but does not support supersession chain resolution, partial supersession, or automated current-state document updates.** This is a gap in the tooling ecosystem that corresponds to the gap in the methodology.

---

### Limitations

**Academic literature on ADR immutability specifically is sparse.** The AKM academic literature (Jansen, Bosch, Capilla, Kruchten, Zdun) focuses on decision capture and traceability, not on the immutability/amendment debate. The immutability norm is a practitioner convention, not an academically validated principle. There is no controlled study comparing immutable-ADR teams with living-document teams on outcomes.

**The empirical studies that exist focus on ADR adoption, not ADR supersession.** The open-source repository MSR studies measure how many ADRs exist and how many are abandoned, but not how supersession chains affect reader comprehension or whether current-state documents are updated when decisions change.

**The Tyree and Akerman (S2) paper could not be fully retrieved.** Access to the IEEE Software paywalled article was indirect; the template fields are documented through secondary sources. The paper's full discussion of decision lifecycle may contain material not captured here.

**Capilla et al. (S12) full text could not be retrieved.** The 2016 JSS paper on ten years of AKM practice is paywalled; findings are reconstructed from the abstract and secondary citations. The six barriers to AKM adoption are known at summary level only.

**Adjacent-field analogy has limits.** The IETF and W3C comparisons are illuminating but imprecise. RFC immutability is partly a legal and citation-integrity requirement; ADR immutability is a workflow convention. The Stripe API versioning model addresses a concurrent-consumer problem that does not arise in single-team ADR practice. These differences should temper how directly any adjacent-field workflow is imported.

**No source directly addresses the provenance-chain staleness problem.** The specific scenario — system-design.md cites ADR-012 to justify current architecture; ADR-012 is superseded; the citation becomes misleading — is not treated as a distinct problem in any reviewed source. It is the central operational cost that Issue #12 is designed to solve, and the literature confirms it is a gap, not an addressed problem.
