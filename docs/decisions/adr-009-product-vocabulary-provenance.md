# ADR-009: Product Vocabulary Provenance in Domain Model

**Status:** Proposed

## Context

Essay 002 §7.1 identifies that Product Vocabulary (user-facing language) and Domain Model vocabulary (system-facing language) serve different audiences but must be traceable to each other. Without explicit provenance, the gap between how users talk about the domain and how the system models it becomes invisible — a source of Product Debt. The domain model currently has no mechanism to record where system terms came from in user language.

## Decision

The domain model's Concepts table gains a **Product Origin** column that traces each system term to its Product Vocabulary source:

| Term | Definition | Related Terms | Product Origin |
|------|-----------|---------------|----------------|
| EnrollmentWindow | Time-bounded period when enrollments are accepted | ... | "Open enrollment crunch" (Benefits Admin) |

Rules:
- Every concept that has a user-facing origin must populate this column
- Infrastructure-only concepts (no direct user-facing equivalent) use "—" with a brief note
- Divergence between Product Vocabulary and system vocabulary is recorded, not resolved — it is a design signal per the User Mental Model definition in the domain model
- System concepts with multiple product origins list all sources (e.g., "Open enrollment crunch" (Benefits Admin), "Enrollment period" (HR Manager))
- The Product Vocabulary Table (ADR-007, section 5) is the source; the provenance column is the trace

The `/rdd-model` skill is updated to read the product discovery artifact alongside the essay when extracting vocabulary.

## Consequences

**Positive:**
- Makes vocabulary divergence visible and intentional rather than accidental
- Product stakeholders can trace any system term back to user language
- Supports the Conway alignment question (Open Question 4 in domain model): provenance makes it auditable whether system structure mirrors user mental models

**Negative:**
- Adds a column that must be maintained. Mitigated: the column is populated once during MODEL and updated only when product vocabulary changes

**Neutral:**
- Concepts without user-facing origins (pure infrastructure) are explicitly marked as such, which itself is informative — a system dominated by infrastructure concepts with no product origins may indicate Product Debt
