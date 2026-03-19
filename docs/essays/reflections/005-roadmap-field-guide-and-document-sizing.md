# Reflections: Roadmap, Field Guide, and Document Sizing
*2026-03-12*

## The Handoff Problem Is Real and Felt

The user has run approximately 5 RDD cycles on team deliverables and experienced the document sizing problem firsthand at handoff. The sensation was "a lot to take in" — not that the docs were bad, but that the volume was high. ORIENTATION.md helped (routing function confirmed), but it doesn't reduce what sits behind it. This is the first empirical confirmation from practice that the sizing heuristics address a real, felt problem rather than a theoretical one. The research on working memory and reading contracts predicted this; the user's experience validates it.

## Purpose-in-Context as the Distinguishing Frame

The user reframed the roadmap/field guide distinction more crisply than the essay: the roadmap helps "conceptualize how the work gets done" (sequencing), while the field guide helps understand "the moving parts" (comprehension). This is a purpose-in-context framing — both serve Invariant 0, but one serves it at the planning level and the other at the understanding level. The essay's language ("sequencing enablement" vs. "understanding scaffolding") is more precise but less intuitive. The user's framing may better serve the product vocabulary.

## Link Rather Than Replace

The essay proposed replacing the Build Sequence section in system-design.md with a pointer to the roadmap. The user refined this: the system design should *link to* the roadmap for sequencing context. The distinction matters because it preserves the system design's ability to note hard dependencies and implied build logic inline, while the roadmap captures the broader strategic view. There's a design question here about how to communicate current state versus future state — the roadmap needs to make clear which parts represent hard dependencies (structural necessity) versus implied logic (suggested but not required) versus open choices (genuinely up to the developer).

## Open Question: Dependency Classification

The user's distinction between "implied logic" and "hard dependency" suggests the roadmap may need an explicit classification scheme for its dependency edges. A hard dependency (Module B literally cannot be built without Module A's interface) is different from an implied ordering (Module A is simpler and builds confidence) is different from a genuinely open choice (Modules C and D are independent). The roadmap's value depends on making this classification visible.

## RDD as a Deep Work Tool

The most significant framing shift in this cycle: RDD is not a permanent methodology that owns a project's documentation. It is a **deep work tool** — something you reach for when a problem is complex enough to warrant structured thinking, and put away when the knowledge has been absorbed. The lifecycle:

1. Identify a problem worth the investment
2. Scope RDD to that problem (subfolder in docs)
3. Run the cycles needed
4. Graduate the knowledge into the project's native docs
5. Archive the RDD artifacts

This reframes graduation from "stopping RDD" to "completing the integration." The project's native docs are the permanent home; RDD docs are the working space. A team using Confluence, Notion, or markdown READMEs doesn't adopt RDD's artifact structure permanently — they use RDD for the hard thinking, then fold the results into their existing system.

This also reframes documentation fatigue: if RDD artifacts feel burdensome, it's not a failure of the methodology — it's a signal that the work has moved past the point where RDD's structure adds value at that scope. Time to graduate and re-scope, not time to abandon discipline.

The "deep work tool" framing connects to Invariant 6 (scaffolding must fade) applied at the methodology level. RDD is scaffolding for understanding. Once the understanding is built and integrated, the scaffolding comes down — until the next problem warrants it.

## The Graduation Trigger Is a Phase Transition

The test for when to graduate is not a checklist or metric — it's a felt shift in the nature of the work. The project moves from "we're building and understanding what this is" (identity-forming) to "we know what this is, now we're working on features" (feature-extending). When you stop needing to discover the system and start extending it, the RDD scaffolding at that scope has done its job.

This distinguishes documentation fatigue that signals graduation from documentation fatigue that signals the methodology is too heavy. If you're still in discovery mode and the docs feel burdensome, RDD may be over-scoped for the problem. If you've crossed into feature work and the docs feel burdensome, it's time to graduate — fold the knowledge into stable docs and archive the RDD artifacts.
