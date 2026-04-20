## Literature Review: Cycle Acceptance Criteria Traceability — Verification of Aggregate and Emergent Acceptance Criteria

**Date:** 2026-04-15
**Method:** Systematic literature search
**Cycle:** RDD Cycle 016, Track #11

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Sommerville, I. | *Software Engineering*, 9th ed., Ch. 10 (System Dependability) | 2010 | Addison-Wesley | Defines emergent properties and establishes why they cannot be verified at component level |
| 2 | Zhu, H. et al. | "Software Unit Test Coverage and Adequacy" | 1997 | ACM Computing Surveys | Founds test adequacy hierarchy, defines subsumption between coverage criteria |
| 3 | Staats, M. et al. | "Coverage Metrics for Requirements-Based Testing: Evaluation of Effectiveness" | 2010 | NASA/NFM Symposium (NTRS-20100018531) | Proposes requirements-level coverage metrics (Requirements Coverage, Antecedent Coverage, UFC) distinct from code coverage |
| 4 | Adzic, G. | *Specification by Example: How Successful Teams Deliver the Right Software* | 2011 | Manning | Foundational BDD/SbE text; addresses how examples become acceptance criteria |
| 5 | Adzic, G. | "Specification by Example, 10 Years Later" | 2020 | gojko.net | Retrospective on SbE failure modes; identifies conflation of collaboration with test automation |
| 6 | Crispin, L. & Gregory, J. | *Agile Testing: A Practical Guide for Testers and Agile Teams* | 2009 | Addison-Wesley | Introduces Agile Testing Quadrants (Q1–Q4); distinguishes technology-facing from business-facing tests across levels |
| 7 | North, D. | "Whose Domain Is It Anyway?" and BDD blog posts | 2011 | dannorth.net | Identifies brittleness as a recurring BDD failure mode; notes acceptance criterion grouping problems |
| 8 | Fowler, M. | "Bliki: Test Pyramid" | 2012 | martinfowler.com | Establishes test pyramid; distinguishes scope at each layer; notes pyramid conflates two distinct integration concerns |
| 9 | Fowler, M. | "The Practical Test Pyramid" | 2018 | martinfowler.com | Extends pyramid; emphasizes testing observable behavior at appropriate scope; does not name level-mismatch failure mode explicitly |
| 10 | Knott, A. (Automation Panda) | "BDD 101: Unit, Integration, and End-to-End Tests" | 2017 | automationpanda.com | Asserts BDD frameworks are not for unit tests; names "cardinal rule" (one scenario, one behavior); discusses test-level appropriateness |
| 11 | Pinheiro, F.A.C. | "Requirements Traceability" (Ch. 5 in *Perspectives on Software Requirements*) | 2004 | Kluwer Academic | Academic survey of traceability types; establishes bidirectional traceability and vertical/horizontal traceability concepts |
| 12 | IEEE | *IEEE 830-1998: Recommended Practice for Software Requirements Specifications* (superseded by ISO/IEC/IEEE 29148:2011) | 1998/2011 | IEEE Standards | Defines verifiability as a mandatory SRS property; does not address emergent/aggregate criteria |
| 13 | RTCA | *DO-178C: Software Considerations in Airborne Systems and Equipment Certification* | 2011 | RTCA | Mandates bidirectional traceability HLR↔LLR↔code↔test; explicit distinction between HLR (integration-level) and LLR (unit-level) verification |
| 14 | Haugen, N. et al. | "Detecting Emergence in Engineered Systems: A Literature Review and Synthesis Approach" | 2023 | Systems Engineering (Wiley/INCOSE) | Systematic review of V&V for emergent behavior; finds field immature; confirms emergent properties cannot be attributed to individual components |
| 15 | Marchetti, E. et al. | "A Systematic Map on Verification and Validation of Emergent Behavior in Software Engineering Research" | 2020 | Future Generation Computer Systems (ScienceDirect) | Maps V&V techniques for emergent behavior; no unified framework; confirms runtime/interaction-level verification gap |
| 16 | ISO/IEC/IEEE 29119 | *Software and Systems Engineering — Software Testing* (Parts 1–4) | 2013–2021 | IEEE/ISO | Process standard covering all test levels; classifies test types by level but does not address cross-level criterion verification |
| 17 | Pact Foundation | *Pact Consumer-Driven Contract Testing Documentation* | ongoing | docs.pact.io | Defines contract testing as boundary-level verification; explicitly distinguishes contract scope from business-logic/integration scope |
| 18 | Rose, S. et al. | "Specification by Example / BDD community discourse" | 2020 | Various (via Adzic retrospective) | Notes GWT has become synonymous with test automation while losing collaborative intent; "our BDDs are broken" |

---

### Synthesis

#### 11.1 — How requirements-traceability literature handles aggregate/emergent acceptance criteria

The requirements-traceability literature is extensive on the mechanics of tracing atomic requirements to test cases but thin on the problem of aggregate or emergent criteria that no single test case captures.

The foundational work — IEEE 830 (now ISO/IEC/IEEE 29148), Pinheiro's survey, and industry traceability tooling — defines traceability as a bidirectional mapping from requirement to design to code to test case. This machinery assumes a one-to-one or many-to-one correspondence between requirements and test cases. The dominant formalism is the Requirements Traceability Matrix (RTM), which exposes gaps (requirements with no linked test case) and orphans (test cases with no linked requirement). The RTM is well-suited to atomic, independently testable requirements. It provides no native mechanism for representing a requirement that is satisfied only when multiple test cases compose at a specific system layer.

The most sophisticated treatment of this structural gap appears in safety-critical literature. DO-178C explicitly distinguishes High-Level Requirements (HLRs), which describe behavior at the integration/subsystem level, from Low-Level Requirements (LLRs), which describe behavior implementable without further decomposition. DO-178C mandates that HLRs be verified by integration tests and LLRs by unit tests, and that traceability be maintained across both levels. The standard recognizes that a LLR passing its test does not constitute verification of the HLR from which it was derived — verification of the HLR requires a separate integration test. This is the closest formal analog in the literature to the failure mode RDD Issue #11 identifies: the standard names the two levels explicitly and requires both to have independent, layer-appropriate tests.

Outside safety-critical literature, this distinction collapses. General agile traceability practice treats acceptance criteria as features or stories and maps them to whatever test cases exist, without auditing whether those test cases exercise the criterion at the layer the criterion specifies.

The NASA work by Staats et al. (2010) is notable for proposing requirements-level coverage metrics — coverage defined on the requirement structure itself (formalized as LTL properties) rather than on code. Their metrics form a subsumption hierarchy: a test suite satisfying UFC (Unique First Cause) coverage outperforms one satisfying mere Requirements Coverage. This is significant because it operationalizes the intuition that "test exists" is insufficient; the question is whether the test exercises the requirement in the way the requirement specifies. However, the Staats work operates on formal specifications (LTL) and does not address prose acceptance criteria or the layer-mismatch problem specifically.

**Term closest to the failure mode in this literature:** "Incomplete vertical traceability" — a test exists but verifies a lower-level artifact than the criterion it is claimed to satisfy. DO-178C operationalizes this by distinguishing HLR and LLR test obligations. No general-purpose agile framework provides an equivalent construct.

#### 11.2 — BDD/ATDD recognized failure modes around layer substitution

The BDD/ATDD literature recognizes related failure modes but does not name the specific pattern precisely.

The foundational tension is that BDD scenarios are written in business language to describe *behavior*, but they are executed at whatever test layer the step definitions happen to wire to. The scenario's Gherkin text carries no information about which layer it exercises. A scenario reading "Given a live MCP transport, When a consumer workflow executes..." can be automated against a unit test with a stubbed transport; nothing in the BDD toolchain flags this as a scope violation.

Adzic (2011, 2020) identifies several related failure modes: teams conflating BDD with test automation rather than collaborative specification; the GWT formula becoming a cargo-cult producing green tests that do not verify collaborative understanding; and "formula over substance" where the structure of scenarios substitutes for genuine dialogue about behavior. These are communicative failures rather than layer-mismatch failures, but they create the precondition: if the scenario is written without explicit layering intent, the automator chooses the layer, and the criterion is silent about whether that choice is correct.

North (2011) identifies brittleness as the recurring BDD failure mode and notes that grouping acceptance criteria incorrectly is a common root cause. He does not name layer-substitution as such.

Knott / Automation Panda (2017) provides the clearest statement of the norm being violated: BDD frameworks "shine at integration and end-to-end levels" and are not for unit tests. The "cardinal rule" (one scenario, one behavior) is violated when a scenario describes a composed integration behavior but is executed at unit scope. However, Knott presents this as guidance on appropriate use, not as a named failure mode.

The contract testing literature (Pact documentation) comes closest to explicitly naming the scope problem: "contract tests are not the place to verify internal business logic." This is a specific assertion that the test-level determines what can legitimately be claimed verified. Verifying a "live integration" criterion with a contract test (boundary-level mock) is explicitly out of scope. The Pact documentation uses the term "blurring CDC with other higher-level functional testing layers" as an anti-pattern.

**The failure mode is recognized but unnamed in the BDD/ATDD literature.** The closest framing: scenarios or acceptance tests exercised at the wrong pyramid layer produce "false confidence" (a term used colloquially in multiple sources, including the DZone article on TDD false confidence) without a technical guarantee that the criterion's actual behavioral specification is satisfied. No canonical term equivalent to DO-178C's HLR/LLR distinction exists in agile testing literature for this scenario.

#### 11.3 — "Scenario-level coverage implies criterion-level coverage" as a named failure mode

This failure mode is not named as such in the testing literature. It is, however, inferable from multiple convergent lines of evidence.

The academic coverage-adequacy literature (Zhu 1997, Staats 2010) establishes that coverage criteria form subsumption hierarchies: criterion A subsumes criterion B if every test suite satisfying A also satisfies B. The important corollary is that subsumption does not flow upward: satisfying a lower criterion does not imply satisfying a higher one. In the context of RDD Issue #11: satisfying scenario-level coverage (each atomic Gherkin scenario passes) does not, by formal definition of subsumption, imply satisfying a criterion that is expressed at a higher level of composition unless a specific test exists that targets the higher-level criterion at the appropriate layer.

Sommerville's treatment of emergent properties provides the systems-engineering basis for why this is not merely a bookkeeping problem. Emergent properties — reliability, performance, safety, and analogously "first real MCP consumer workflow via live MCP transport" — are "a consequence of the relationships between system components and can only be assessed and measured once the components have been integrated into a system." They cannot, by definition, be verified at component level. A test that passes at component level does not and cannot constitute verification of a property that is only observable at the interaction layer.

The practical consequence, described colloquially in multiple sources: "Integration testing exposes how code modules behave when they meet in the real system — where silent breaks turn into system crashes and assumptions in one part collide with reality in another." Individual functions passing unit tests and integration tests with mocked services can pass while the actual workflow fails when deployed to real infrastructure.

The DZone article on false confidence from TDD names a specific mechanical instance: a stub configured to return a value causes VerifyAllExpectations to fall through to a green bar without actually exercising the system under test. The test is green; the criterion is unverified. This is a micro-instance of the macro-pattern Issue #11 names.

**Closest existing terminology:**
- "False confidence" (colloquial; used in testing blogs and practitioner discourse)
- "Incomplete vertical traceability" (implied by DO-178C's HLR/LLR distinction; not a coined term)
- "Coverage subsumption failure" (inferable from the academic coverage hierarchy; not a named failure mode in BDD literature)
- "Wrong level" or "wrong abstraction level" (used descriptively in testing guidance; not a formal term)

The literature does not have a single canonical term for the specific pattern: a criterion specifying integration-level behavior, satisfied by a test operating at unit or stub-boundary level, producing a green result that does not constitute verification of the criterion at the layer it specifies.

#### 11.4 — Under what conditions does scenario-level coverage falsely satisfy criterion-level coverage and produce real failures vs. benign simplification

The emergent-properties and integration-testing literature converges on a set of conditions that separate consequential from benign cases.

**Conditions where false satisfaction is benign:**

The test pyramid's core assumption (Fowler, Cohn) is that most behavior can be verified at lower levels, with integration and E2E tests reserved for composition verification. For many atomic behavioral criteria — "user can log in," "cart totals update correctly" — a lower-layer test genuinely does verify the criterion because the behavior is fully determined within the component. If the criterion names behavior that does not depend on inter-component communication, timing, live transport, or environmental state, the lower-layer test may be a valid proxy. Fowler's guidance: "If a higher-level test gives you more confidence that your application works correctly, you should have it" — but the inverse is also stated: if a lower-level test covers the same ground, the higher-level test is redundant.

**Conditions where false satisfaction produces real failures:**

The literature identifies the following factors that push toward real failure:

1. **The criterion specifies interaction behavior.** When the criterion names a live transport, a real service, or component composition ("first real MCP consumer workflow via live MCP transport"), any test that stubs the transport cannot verify the criterion. The stub defines its own behavior; it does not observe the real interaction. Integration failures at the transport layer — serialization mismatches, protocol errors, timing, backpressure — are systematically invisible at stub level.

2. **The criterion specifies emergent behavior.** Sommerville's taxonomy: reliability, performance, safety, and security are emergent properties. These cannot be decomposed to component verification. A performance criterion ("workflow completes within N seconds") is not satisfied by a unit test that uses a mock transport, because transport latency is absent from the mock.

3. **Contract boundaries are assumed rather than verified.** The Pact documentation makes this explicit: contract tests verify that the consumer code behaves correctly when the provider responds according to the contract, but the contract itself can be wrong. If no integration test exercises the real provider with the real protocol, the contract's validity is assumed, not verified.

4. **Mocks encode assumptions that diverge from production.** The well-documented mock-divergence failure mode: a mock is configured with an assumption about provider behavior; the provider is later updated; the mock is not updated; tests remain green; production fails. The failure is proportional to the lifetime of the divergence and the depth of the mismatch.

5. **The criterion is aggregate across multiple scenarios.** Where a criterion is satisfied only by the conjunction of multiple scenarios exercised together at a specific layer, no individual scenario's passage constitutes criterion verification. This is precisely the Issue #11 pattern.

**Conditions where benign simplification applies:**

The simplification is benign when: (a) all inter-component contracts are formally verified separately (consumer-driven contract testing closes this gap for API boundaries); (b) the criterion is genuinely decomposable into atomic behaviors each verifiable in isolation; or (c) the environment difference between test-layer and production-layer is known to be irrelevant to the criterion.

---

### Key Findings

- **Emergent properties cannot be verified at component level by definition.** Sommerville (2010) establishes this formally: emergent properties "can only be assessed and measured once the components have been integrated." This is the systems-engineering foundation for the Issue #11 failure mode. [Source: Sommerville, *Software Engineering* 9th ed., Ch. 10]

- **DO-178C formally separates HLR and LLR verification obligations.** The standard mandates that HLRs (integration-level requirements) be verified by integration tests, not unit tests. LLR test passage does not constitute HLR verification. This is the most rigorous existing formal analog to the RDD Issue #11 failure mode. [Source: RTCA DO-178C, Section 6.4; Parasoft DO-178C documentation]

- **The coverage-subsumption literature establishes that lower-criterion satisfaction does not imply higher-criterion satisfaction.** A test suite satisfying scenario-level coverage does not by formal definition satisfy a criterion requiring composition at a higher level. [Source: Zhu et al., ACM Computing Surveys, 1997; Staats et al., NASA/NFM 2010]

- **The BDD/ATDD literature recognizes layer misuse but does not name criterion-level substitution as a failure mode.** Gherkin scenarios carry no layer information; the layer is determined by step-definition implementation. The failure to match scenario intent to test layer is recognized as producing false confidence but lacks a canonical term. [Sources: Adzic 2020; Knott / Automation Panda 2017; Pact documentation]

- **Contract testing explicitly scopes its claims.** Pact documentation states contract tests are not for verifying business logic or integration behavior above the API boundary. "Blurring CDC with other higher-level functional testing layers" is named as an anti-pattern. This establishes that a contract test passing does not constitute verification of a criterion specifying live integration behavior. [Source: Pact docs, pact.io]

- **"False confidence" is the colloquial term for this failure mode in practitioner discourse.** The DZone article on TDD false confidence and the AI test generation analysis both describe test suites passing while failing to verify meaningful behavior. The term is informal and widely understood but not a canonical technical term. [Sources: DZone TDD false confidence article; DEV Community AI test generation analysis]

- **The systematic review of V&V for emergent behavior (Marchetti et al. 2020) finds the field immature.** "Only little validation and evaluation research has been conducted" on verifying emergent behavior across system levels. This confirms the gap Issue #11 names is real, under-theorized, and not resolved by existing methodology. [Source: Marchetti et al., Future Generation Computer Systems, ScienceDirect]

- **NASA's requirements-level coverage metrics (Staats 2010) distinguish requirement coverage from code coverage.** Satisfying UFC (Unique First Cause) requirements coverage — the strongest metric — requires tests that exercise requirements at the level the requirements specify, not merely tests that happen to execute relevant code paths. [Source: Staats et al., NTRS-20100018531]

---

### Limitations

**What the search did not find:**

1. **A canonical term for the specific failure mode** — criterion specifying integration-level behavior satisfied by a test at unit or stub-boundary level. The literature names related failure modes (false confidence, wrong level, HLR/LLR mismatch in DO-178C) but no single term covers the exact pattern across the BDD/requirements-traceability intersection.

2. **Empirical studies of how often this occurs in practice.** The Adzic (2020) survey covers adoption patterns but not specifically layer-mismatch rates. No study was found that measures the frequency with which passing acceptance test suites fail to verify the criterion at the intended layer.

3. **Mitigation strategies specifically for aggregate acceptance criteria in agile methodology.** DO-178C provides the most developed treatment (separate HLR/LLR verification obligations) but is not applicable to sprint-cadence development without significant adaptation. The BDD literature does not have an equivalent construct for multi-scenario aggregate criteria.

4. **Coverage of the specific MCP/transport-protocol domain.** No literature was found on acceptance criteria traceability specific to protocol-transport integration testing in the context of agent frameworks or tool-calling systems.

**Topics needing deeper investigation:**

- Whether Adzic's *Fifty Quick Ideas to Improve Your Tests* (2014) or *Humans vs. Computers* (2017) contains more specific treatment of layer-mismatch failure modes
- Whether the INCOSE Systems Engineering Body of Knowledge has more developed guidance on emergent property verification in software-intensive systems
- Whether the Integration Test patterns literature (particularly around "sociable" vs "solitary" tests — Fowler's terminology) has been applied to criterion-level traceability
- Whether any agile methodology (SAFe, Disciplined Agile, LeSS) has a formal construct for distinguishing scenario-level and criterion-level acceptance in test planning
