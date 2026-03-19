# Research Log: System Orientation Document

## Question 1: What form should a project orientation document take to give a new reader the big picture of a system across its RDD artifact corpus — bridging user-centered and technical perspectives in minimal words?

**Method:** Web search across architecture documentation frameworks (Arc42, C4 model, Simon Brown's Software Guidebook), documentation theory (Diátaxis, Every Page is Page One), and one-pager methodology.

**Findings:**

Six sources converge on a consistent set of principles:

1. **Arc42's Introduction and Goals section.** The entry-point section of a full architecture document. Contains three things: requirements overview ("short description of functional requirements, driving forces"), quality goals (top 3-5, not exhaustive), and stakeholders (roles/organizations with expectations). Guidance emphasizes "as short as possible" — this is orientation, not the full picture. The rest of arc42 provides depth; the intro provides direction.

2. **Simon Brown / C4 Model.** The system context diagram captures "what you can't get from the code": who uses the system, what external systems it interacts with, and what it does at the highest level. Brown's philosophy: "the code is the truth, but not the whole truth." Documentation should describe what code alone cannot convey — context, rationale, deployment, stakeholders. His minimal set: context diagram, container diagram, deployment, ADRs, lightweight guidebook. The guidebook is stored alongside code.

3. **Diátaxis framework.** Four documentation types: tutorials (learning by doing), how-to guides (practical goals), reference (facts), and explanation (context, background, "why"). The orientation document maps most closely to **explanation** — "joins things together, helps answer the question why." Uniquely, explanation "often needs to circle around its subject, approach it from different directions. It can contain opinions and take perspectives." This distinguishes it from reference (neutral, factual) and how-to (action-oriented).

4. **Every Page is Page One (Mark Baker).** Seven principles for documentation that works regardless of entry point: self-contained, narrowly focused, context-establishing, pattern-consistent, single-level, audience-specific, richly linked. The key insight: "topics must establish context for themselves" — a reader arriving without background needs to be oriented immediately. But the topic should be narrowly focused, not exhaustively comprehensive.

5. **One-pager methodology.** "The purpose of a one pager isn't to keep the documentation to one page — it's to keep the team all on one page." Amazon's variant: a press release plus FAQ that forces user-and-market focus. The constraint (one page) is a forcing function for ruthless prioritization of what matters, not a literal format requirement.

6. **Minimal technical documentation (Shekhar Gulati).** For onboarding, the essential components are: what the system does, constraints that shaped the design, architecture overview, and where to find deeper detail. The orientation document is not itself the deep detail — it's the map that points to it.

**Implications:**

The orientation document is Diátaxis "explanation" — not reference, not tutorial, not how-to. It circles the subject, establishes the "why," and connects the parts. It should follow the one-pager forcing function: ruthlessly prioritized, not exhaustive. And it should follow Every Page is Page One: self-contained, context-establishing, richly linked to the artifacts that contain depth.

The gap in the current RDD artifact corpus is clear: `product-discovery.md` is user-centered explanation, `system-design.md` is technical reference, `domain-model.md` is vocabulary reference, essays are research narratives, ADRs are decision records. None of them answer: "what is this system, who is it for, why does it exist, and where do I go to learn more?"

**Key design tension:** The document must bridge product-discovery language and system-design language without duplicating either. It is the Rosetta Stone between the two — but a Rosetta Stone is a single artifact, not a copy of both texts.
