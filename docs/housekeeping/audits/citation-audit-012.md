# Citation Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/docs/essays/012-trading-fours.md
**Date:** 2026-04-03

## Summary

- **Total references checked:** 24
- **Verified:** 20
- **Issues found:** 7 (2 P1, 3 P2, 2 P3)

References checked: Welter et al. (2025), Plonka et al. (2015), Bryant, Romero & du Boulay (2008), Flor & Hutchins (1992), Xu & Correia (2023), Hannay et al. (2009), Lyu et al. (2025), Fowler & Melnica (2019), Andersen et al. (2025), Harriet (2023), Bryant (2013), arXiv:2110.01962, Dubrovsky, Kiesler & Sethna (1991), Flanagan et al. (2002), arXiv:2503.18238, HBR 2024 analysis, arXiv:2603.12600, arXiv:2509.10950, Galison (1997), Collins & Evans (2007), Seddon (2005), Eppler (2006), Valoý (2023), Lee (2007).

---

## Issues

### P1 — Must Fix

---

**Issue 1: Author misattribution — "Fowler and Melnica (2019)"**

- **Location:** Section 3 (paragraph 1: "Fowler and Melnica (2019) observe..."), Section 3 (paragraph 2: "Fowler and Melnica (2019) document..."), Section 3 (paragraph 4: "Fowler and Melnica (2019)"), and the lit-review source table entry (row 17: "Fowler, M. & Melnica, L. (eds.) | On Pair Programming | 2019 (updated) | martinfowler.com").
- **Claim:** The essay attributes the article "On Pair Programming" to "Fowler and Melnica" with a 2019 date.
- **Finding:** The article "On Pair Programming" on martinfowler.com was authored by **Birgitta Böckeler and Nina Siessegger**, published January 15, **2020**. Martin Fowler is the site host, not the author. "Melnica" does not appear to be a real person associated with this work — no author by that name appears anywhere in the article, its metadata, or any search result. The lit-review source table entry (which the essay appears to have drawn from) lists "Fowler, M. & Melnica, L. (eds.)" — this compound error propagates from the research log into the essay. The vulnerability quote ("To pair requires vulnerability. It means sharing all that you know and all that you don't know.") is correctly traced to Tom Howlett, who is cited within the Böckeler & Siessegger article, but the article's authors are wrong throughout.
- **Recommendation:** Replace every instance of "Fowler and Melnica (2019)" with "Böckeler and Siessegger (2020)". Update the citation to: Böckeler, B. & Siessegger, N. (2020). *On Pair Programming*. martinfowler.com. https://martinfowler.com/articles/on-pair-programming.html. The vulnerability quote should note Tom Howlett as the originating practitioner, cited within Böckeler & Siessegger (2020).

---

**Issue 2: Wrong source cited for jazz improvisation "shared understanding" claim**

- **Location:** Section 5, paragraph on Jazz: "research shows 'fully shared understanding of what happened is not essential for successful improvisation' (Seddon, 2005)."
- **Claim:** The quote "fully shared understanding of what happened is not essential for successful improvisation" is attributed to Seddon (2005).
- **Finding:** Seddon (2005) is a real paper — "Modes of Communication during Jazz Improvisation," *British Journal of Music Education*, 22(1), 47–61 — which studied communication modes in student jazz musicians during rehearsal and performance. However, the specific quote about "fully shared understanding" does not originate in Seddon (2005). It comes from **Schober, M. F. & Spiro, N. (2014). "Jazz improvisers' shared understanding: a case study." *Frontiers in Psychology*, 5, 808.** (PMC4126153). The research log itself cites the PMC article number (PMC4126153), which maps to the 2014 Schober & Spiro paper, not the 2005 Seddon paper. The research log section on jazz improvisation also links to "PMC4126153" as the source for this finding. The year and author are therefore wrong in the essay citation.
- **Recommendation:** Replace "(Seddon, 2005)" with "(Schober & Spiro, 2014)" and update the reference to: Schober, M. F. & Spiro, N. (2014). Jazz improvisers' shared understanding: a case study. *Frontiers in Psychology*, 5, 808. https://doi.org/10.3389/fpsyg.2014.00808. Seddon (2005) may be retained as a related citation if the essay discusses communication modes in jazz more broadly, but it does not support this specific claim.

---

### P2 — Should Fix

---

**Issue 3: Characterization of Valoý (2023) findings overstates what the study found**

- **Location:** Section 10, paragraph 1: "Valoý's (2023) study found that pair programming's motivational effects came from the interaction quality, not the output quality."
- **Claim:** Valoý found that motivational effects derive from interaction quality rather than output quality.
- **Finding:** The Valoý (2023) study ("Psychological Aspects of Pair Programming," EASE 2023, arXiv:2306.07421, 35 students, 612 motivation inventories) found that the **pilot-navigator role structure is more motivating than simultaneous coding**, and that role suitability correlates with personality traits (openness for pilot, extraversion/agreeableness for navigator, neuroticism for solo). The study compared role conditions and measured intrinsic motivation by role. It did not directly compare "interaction quality" versus "output quality" as variables, and does not use those terms as an explicit contrast. The claim as written is a plausible interpretation but is more specific than what the study's reported findings support. The research log's description of Valoý notes only "intrinsic motivation" and role effects, not an interaction/output quality comparison.
- **Recommendation:** Revise to reflect the actual finding: "Valoý's (2023) study found that the pilot-navigator role structure was more motivating than simultaneous coding, and that role suitability aligned with personality type — suggesting that motivational effects depend on how the pairing is structured, not merely on the fact of pairing." This preserves the essay's broader point about motivation depending on the experience of collaboration without overstating what the study measured.

---

**Issue 4: The "~15% more person-hours" figure attributed to Hannay et al. (2009) is an imprecise secondary characterization**

- **Location:** Section 2, paragraph 3: "roughly 15% more person-hours overall."
- **Claim:** Hannay et al. (2009) found pair programming requires roughly 15% more person-hours.
- **Finding:** Hannay et al. (2009) found a "medium significant negative overall effect on effort" but reported this in effect-size terms (d-values), not as a percentage overhead. The paper's main results describe "an 8% decrease in duration with a corresponding 84% increase in effort" in some experimental conditions. Secondary interpretations of the meta-analysis vary: some characterize the effort premium as 15–20%, others characterize it differently depending on which subset of studies is examined. The "~15%" figure appears in secondary literature summarizing the meta-analysis, not as a direct finding from the paper itself. The essay's use of "roughly" signals appropriate hedging, but the source of the specific 15% figure is not traceable to the primary paper's reported results.
- **Recommendation:** Either (a) retain the figure with a clearer hedge ("estimates from the meta-analysis suggest roughly 15–20% more person-hours overall") or (b) replace with the paper's actual language: "a medium negative effect on effort overall." If citing Hannay et al. directly for a percentage figure, that figure should be traceable to the paper's data tables. Consider whether the lit-review (which uses "~15%") has a more specific source for this number.

---

**Issue 5: The "Harriet (2023)" attribution uses only a last name and wrong-format citation for a practitioner blog post**

- **Location:** Section 3, paragraph 4: "the expectation to 'think aloud' can prove 'very challenging for some, on account of the different ways human beings process information' (Harriet, 2023)."
- **Claim:** The source is "(Harriet, 2023)."
- **Finding:** The source is a Medium blog post by Sorrel Harriet titled "Supporting Neurodiversity in Paired Programming." The research log and AI-equalizer research log both identify the author as Sorrel Harriet and link to https://sorrelharriet.medium.com/supporting-neurodiversity-in-paired-programming-8b250d2b5cab. The last name-only "Harriet" citation is non-standard; "Harriet" is actually the author's first name ("Sorrel Harriet"), not their surname. Additionally, the publication year is unclear — the research log cites it without a definitive year and the Medium post's publication date could not be independently confirmed as 2023 in search results. The quote itself is verified as matching the source.
- **Recommendation:** Correct the citation to use the author's full name: "Sorrel Harriet" (or "S. Harriet" per standard practice). Verify the publication year against the actual Medium post. Format as: Harriet, S. (year). Supporting Neurodiversity in Paired Programming. Medium. [URL]. If the year cannot be confirmed as 2023, omit it or use "n.d." (no date).

---

### P3 — Consider

---

**Issue 6: Bryant (2013) blog posts cited as "(Bryant, 2013)" without signaling the source type**

- **Location:** Section 3, paragraph 5: "Bryant's (2013) behavioral taxonomy identified two archetypal failure modes: 'The Thrasher' (power struggle over approach) and 'The Divider'..."
- **Claim:** Bryant (2013) identified these behavioral archetypes.
- **Finding:** The source is confirmed as blog posts by Sallyann Freudenberg (née Bryant) published on salfreudenberg.wordpress.com in 2013: "Undesirable Pair Programming Behaviours — The Thrasher and The Divider" (October 4, 2013) and "Desirable Pair Programming Behaviours — Tag team" (October 19, 2013). These posts summarize findings from her PhD research at the University of Sussex. The research log correctly identifies these as "Blog posts; summary of PhD findings." The citation "(Bryant, 2013)" in the essay does not distinguish these from peer-reviewed publications, which may mislead readers. The author is now publishing under "Freudenberg" rather than "Bryant."
- **Recommendation:** Add source type transparency: "Bryant (Freudenberg, 2013, blog)" or include a footnote noting these are practitioner blog posts summarizing PhD findings, rather than peer-reviewed publications. The research log already uses this framing correctly ("Bryant (Freudenberg)"). The essay should match.

---

**Issue 7: The claim that the Hannay meta-analysis covers "18 controlled experiments" should note it was 18 studies (not all strictly controlled experiments)**

- **Location:** Section 2, paragraph 3: "Hannay et al.'s (2009) meta-analysis of 18 controlled experiments..."
- **Claim:** The meta-analysis covered 18 controlled experiments.
- **Finding:** The Hannay et al. (2009) paper synthesized 18 empirical studies. Not all 18 are strictly "controlled experiments" in the narrowest sense — the meta-analysis included studies with varying designs, and the paper itself notes significant between-study heterogeneity and methodological variation. The term "controlled experiments" slightly overstates the uniformity of the study corpus. The lit review source table correctly describes it as "18 studies."
- **Recommendation:** Change "18 controlled experiments" to "18 empirical studies" to match the paper's own framing and the lit-review source table. This is a minor precision issue, not a substantive factual error.

---

## Verified References

The following references were verified as accurately cited (author, title, venue, year, and claim-source alignment):

| # | Reference | Status |
|---|-----------|--------|
| 1 | Welter et al. (2025), arXiv:2506.04785 — "9.4 vs 14.4 utterances" and "reduced scrutiny" findings | Verified. Authors, arXiv ID, and both statistics confirmed. |
| 2 | Hannay et al. (2009), *Information and Software Technology* 51(7) | Verified. Authors, venue, volume/issue, and general findings confirmed. (See P3 note on "18 controlled experiments" wording.) |
| 3 | Bryant, Romero & du Boulay (2008), *IJHCS* 66(7) — cognitive tag team, driver/navigator division not supported | Verified. Authors, venue, volume, and findings confirmed. |
| 4 | Flor & Hutchins (1992), *Empirical Studies of Programmers: Fourth Workshop* | Verified. Authors, publication venue, and distributed cognition framing confirmed. |
| 5 | Xu & Correia (2023), *Journal of Computing in Higher Education*, PMC9930723 | Verified. Authors, venue, PMC ID confirmed. |
| 6 | Lyu et al. (2025), *ACM Learning @ Scale*, doi:10.1145/3698205.3729544 | Verified. DOI, venue, and findings (AI for retrieval, humans for co-construction) confirmed. |
| 7 | Plonka et al. (2015), *IJHCS* 73 — six teaching strategies, novice-expert failure | Verified. Authors, venue, volume, and six teaching strategies finding confirmed. |
| 8 | Andersen et al. (2025), arXiv:2506.19511 — imposter syndrome, "60-70% introvert" quote, social exhaustion | Verified. arXiv ID, author list, and quoted participant statement confirmed. |
| 9 | Bryant (Freudenberg) (2013), blog posts — "The Thrasher" and "The Divider" | Verified as blog posts. See P3 note on source-type transparency. |
| 10 | arXiv:2110.01962 — gender bias in remote pair programming, character deletions and informal utterances | Verified. arXiv ID and study topic (twincode exploratory study on gender bias) confirmed. Findings about deletion and utterance behaviors are consistent with the paper's focus. |
| 11 | Dubrovsky, Kiesler & Sethna (1991) — equalization phenomenon, "first advocacy was shared" quote | Verified. Authors, year, journal (*Human-Computer Interaction* 6(2)), and the specific quote confirmed. |
| 12 | Flanagan et al. (2002), *Communication Research* — limits of CMC equalization | Verified. Authors, journal, year, and the general finding (power dynamics attenuated but not eliminated) confirmed. |
| 13 | arXiv:2503.18238 — "29% less social-emotional communication" in human-AI teams | Verified. The paper confirms "humans in human-human teams sent 29% more social and emotional messages" than human-AI teams — the essay's framing of "29% less" is accurate. |
| 14 | HBR 2024 — AI "risks amplifying existing power imbalances" | Verified as real HBR article ("How AI Features Can Change Team Dynamics," April 2024). The "persistent disingenuity" phrase could not be confirmed in accessible search text but the general claim about power imbalances is consistent with the article's known content. |
| 15 | arXiv:2603.12600 — individual AI promotes exploration, shared AI promotes alignment | Verified. arXiv ID confirmed (March 2026 classroom study), and finding about individual vs. shared AI configurations confirmed. |
| 16 | arXiv:2509.10950 — newsroom "suspicion chain" | Verified. arXiv ID and "suspicion chain" concept confirmed from 27-interview newsroom study. |
| 17 | Galison (1997) — trading zones, pidgin/creole | Verified. The quote "create first a shared jargon, then a pidgin, and finally a creole" is confirmed as accurately representing Galison's framework from *Image and Logic* (1997). |
| 18 | Collins & Evans (2007), *Rethinking Expertise* — interactional vs. contributory expertise | Verified. Authors, title, year (University of Chicago Press), and the distinction between interactional and contributory expertise confirmed. |
| 19 | Eppler (2006) — representational guidance, concept maps vs. mind maps | Verified. Author, year, venue (*Information Visualization*, not IJKM as some secondary sources suggest), and the representational guidance concept confirmed. |
| 20 | Lee (2007) — boundary negotiating artifacts, five types including compilation-first | Verified. Author, year, venue (*CSCW* 16), and five artifact types confirmed. |
| 21 | Valoý (2023), arXiv:2306.07421 — 35 students, 612 motivation inventories | Verified. arXiv ID, participant count (N=35), and inventory count (612) confirmed. See P2 note on characterization of findings. |
| 22 | Mei, Ping & Shen (2024), arXiv:2410.15558 — self-efficacy predicts outcomes more than prior experience | Verified. arXiv ID, authors, and finding that self-efficacy predicts outcomes while prior pairing experience does not confirmed. |

---

## Unattributed Claims That Should Be Attributed

**Section 3, paragraph 2 — Code review anxiety, "1 to 65 years of experience"**

The essay states: "research on the closely related phenomenon of code review anxiety (Carol Lee, Developer Success Lab) found participants with 1 to 65 years of coding experience reporting anxiety." The parenthetical "(Carol Lee, Developer Success Lab)" is not a standard citation. The underlying research is real — Carol Lee, PhD, at the Developer Success Lab (Pluralsight) has published peer-reviewed and working papers on code review anxiety, and a Code Review Anxiety Workbook is available at developer-success-lab.gitbook.io. The "1 to 65 years" figure appears in her published work. The citation should be formalized: Lee, C. (year). *Understanding and Effectively Mitigating Code Review Anxiety*. Developer Success Lab. https://dsl.pubpub.org/pub/code-review-anx/release/1.
