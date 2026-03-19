# Reflections: Product Discovery in RDD
*2026-03-06*

## "Mr. Market" Product vs. "The Research Says" Product

The user articulated a distinction not present in the essay: there are two versions of "product thinking." The "Mr. Market" version starts from what the business wants to sell and works backward to users. The "research says" version starts from what users actually need and works forward to whether business value exists. RDD sits at the intersection — the Venn diagram where both are true — and surfaces it honestly when they aren't.

This framing is more precise than the essay's "agile optimizes for business delivery" formulation. The issue isn't that agile ignores users — it's that agile's product thinking defaults to the "Mr. Market" version when unstated. RDD's structural commitment to research-first means product thinking defaults to the "research says" version. The product discovery phase makes this default explicit.

## Time-to-Market as Compound Interest

The user identified a parallel to the maintenance cliff (essay 001): business treats speed as free — "ship fast, fix later." But the fixing-later carries compound interest on the product dimension, just as it does on the technical dimension. Ship a product that doesn't match user mental models, and users build workarounds, expectations calcify, product debt compounds, and the cost of course-correction grows exponentially.

This suggests a "product maintenance cliff" analogous to the technical one — the point where accumulated product debt makes iteration harder than starting over. The product discovery phase is the prevention mechanism, just as epistemic gates prevent the technical maintenance cliff.

## The Healthcare Example

The user noted the healthcare enrollment case was "just top of mind" and may not be the best example. The example works well enough to ground the argument, but it carries a risk: readers may interpret the essay as being about healthcare software rather than about a general structural gap. The essay should probably include a second, shorter example from a different domain to demonstrate generality. This is a revision consideration, not a blocker.

## Resolved: Where Does the Inversion Principle Live?

Research loop Q6 resolved this. The inversion principle lives at two levels: a cross-cutting principle in the orchestrator (alongside "stop at uncertainty") and a procedural step within `/rdd-product`. It is NOT an invariant — the existing invariants are about epistemic understanding, and adding a product-focused one would dilute that set. Instead, Invariant 0 should be amended to include "who it was built for and why," and the inversion principle becomes the mechanism serving that amended invariant.

## Product Maintenance Cliff — Empirically Grounded

Research loop Q5 confirmed the "product maintenance cliff" with Boehm's 10-100x cost multiplier, CB Insights failure data (42% cite no market need), and discovery ROI studies (2-3x cost for organizations that skip discovery). The concept is strong enough to be a named term in the domain model, parallel to the technical maintenance cliff.

## Inversion Principle at ARCHITECT

The user identified that the inversion principle is especially important at the ARCHITECT phase — module boundaries, responsibility allocations, and integration contracts are where product assumptions calcify most permanently. These are Boehm's architecture-breakers: expensive to reverse once committed. The essay has been updated to explicitly name ARCHITECT as a phase where the cross-cutting inversion principle applies, with the specific question: "Does this boundary serve the user's mental model, or just the developer's?"

## "Mr. Market" Framing Should Appear in the Essay

The user's distinction between "Mr. Market" product thinking (what business wants to sell) and "the research says" product thinking (what users need) is more precise than the essay's current formulation. The essay says "agile optimizes for business delivery" — the "Mr. Market" framing makes it concrete: there are two versions of product, and RDD's structural commitment is to the research-driven version. This framing should be incorporated in a revision pass if the essay is refined further.
