# Citation Audit Report

**Audited document:** `/Users/nategreen/Documents/Development/rdd/docs/essays/008-play-and-interaction-specification.md`
**Evidence trail:** `research-logs/research-log.md`, `research-logs/lit-review-interaction-specs.md`, `research-logs/lit-review-play-as-inquiry.md`
**Date:** 2026-03-25

---

## Summary

- **Total references checked:** 28
- **Verified:** 26
- **Issues found:** 5

---

## Issues

### P1 — Must Fix

#### Issue 1: Bateson citation year is ambiguous and potentially misleading

- **Location:** Section 3 ("Performance: Inhabitation as Discovery"), body text and Sources list
- **Claim:** The essay cites "Bateson, G. (1955). 'A Theory of Play and Fantasy'" both in the text (section 3) and in the Sources list.
- **Finding:** "A Theory of Play and Fantasy" was first presented in 1954 and published in 1955 in the A.P.A. Psychiatric Research Reports. It was later reprinted as an essay in *Steps to an Ecology of Mind* (1972, Chandler Publishing / Ballantine Books). The lit review file (`lit-review-play-as-inquiry.md`) lists the Bateson source as "Steps to an Ecology of Mind | 1972 | Chandler Publishing" — not the original 1955 paper. The essay cites the original 1955 date in text, but any reader who follows the citation expecting a standalone 1955 work will be looking for a conference proceedings paper that is far less accessible than the 1972 book, which is the standard citation form. More importantly, the two citation forms point to different documents, and the research log and lit review are inconsistent with the essay on which to use.
- **Recommendation:** Decide which source is being cited and be consistent across all files. If citing the collected essays volume (the standard scholarly form), use: Bateson, G. (1972). "A Theory of Play and Fantasy." In *Steps to an Ecology of Mind*. Ballantine Books. If citing the original paper, confirm access to the 1955 proceedings and note that the essay as reprinted in 1972 is the accessible form.

---

### P2 — Should Fix

#### Issue 2: Screenplay Pattern attribution date range and co-authorship

- **Location:** Section 2 ("The Interaction Specification Layer"), body text: "The Screenplay Pattern (Marcano & Palmer 2007-2009; Smart & Molak 2023)"; Sources list: "Marcano, A. & Palmer, A. (2007-2009). The Screenplay Pattern"
- **Claim:** The Screenplay Pattern is attributed to Marcano & Palmer across 2007-2009.
- **Finding:** Web search and the lit review establish a more precise genealogy. Kevin Lawrence's October 2007 AAFTT talk inspired Marcano. Marcano devised the "Roles-Goals-Tasks-Actions" model in 2007; JNarrate (the first Java implementation, co-developed with Andy Palmer) was built in 2008, not 2007. The pattern was further refined with Molak from 2012-2013 ("Journey Pattern"), and named "Screenplay Pattern" when Smart integrated it into Serenity BDD around 2015. The date "2007-2009" is defensible as a range but the Sources entry "The Screenplay Pattern" is not a citable document title — JNarrate and the work were unpublished/conference material. The 2016 InfoQ article by Molak, Marcano, Smart, and Palmer is the first formally citable written treatment.
- **Recommendation:** Adjust the Sources entry to be more precise. Options: (a) cite the 2016 InfoQ article as the primary published source for the pattern's architecture, while noting the 2007-2008 origins in text; or (b) use: Marcano, A. & Palmer, A. (2008-2009). JNarrate / Screenplay Pattern origins. AAFTT workshop / unpublished. The body text attribution "(Marcano & Palmer 2007-2009)" is acceptable as a historical note, but the Sources entry needs a citable form.

#### Issue 3: Boal publication year — the essay uses 1974, which is the Spanish edition

- **Location:** Section 3 ("Performance: Inhabitation as Discovery"), body text: "Boal's Forum Theatre (1974)"; Sources list: "Boal, A. (1974). *Theatre of the Oppressed*"
- **Claim:** Forum Theatre is documented in *Theatre of the Oppressed* (1974).
- **Finding:** The book was originally published in 1974 in Spanish as *Teatro del oprimido y otras poéticas políticas*. The English translation was published in 1979 (Pluto Press / Theatre Communications Group). The lit review (`lit-review-play-as-inquiry.md`) correctly notes "1974/1979 (English)" in its sources table. The essay's Sources list drops the English translation date, making it appear the English-language edition cited is from 1974.
- **Recommendation:** Update the Sources entry to: Boal, A. (1974/1979). *Theatre of the Oppressed*. Pluto Press. This matches the lit review's own citation and is the standard scholarly form for translated works.

#### Issue 4: Winnicott quote is slightly imprecise

- **Location:** Section 3 ("What Play Theory Claims About Knowing"), body text
- **Claim:** The essay quotes Winnicott: "It is in playing and only in playing that the individual is able to be creative and to use the whole personality, and it is only in being creative that the individual discovers the self."
- **Finding:** The verified text from *Playing and Reality* (confirmed via multiple sources including the MIT archive of the Tavistock edition and Goodreads quotes) reads: "It is in playing and only in playing that the individual **child or adult** is able to be creative and to use the whole personality, and it is only in being creative that the individual discovers the self." The phrase "child or adult" has been dropped from the essay's quotation.
- **Recommendation:** Restore the omitted phrase: "It is in playing and only in playing that the individual **child or adult** is able to be creative and to use the whole personality, and it is only in being creative that the individual discovers the self." The omission changes the scope of Winnicott's claim (he is explicitly extending it beyond child development to adults), which is material to how the essay uses the quote.

#### Issue 5: Deterding citation — title punctuation and characterization

- **Location:** Section 3, body text: "Deterding (2015) rightly notes that this raises the epistemic distance problem"; Sources list: "Deterding, S. (2015). 'A Manifesto, With Footnotes.' *Game Studies* 15(1)"
- **Claim:** Deterding's 2015 piece raises the "epistemic distance problem" — that a developer may struggle to subvert their own design.
- **Finding:** The article exists and the citation details are correct (Game Studies 15(1), 2015). The title in the Sources list uses "A Manifesto, With Footnotes" but the published title on the journal page is "A Manifesto, With Footnotes. A Review of Miguel Sicart's 'Play Matters'" — it is a review article, not a standalone manifesto. More substantively, the essay's characterization is somewhat imprecise: Deterding's critique is that Sicart's *appropriation rhetoric* is underspecified — the relationship between designed constraints and player agency is not clearly theorized. The "epistemic distance problem" framing is the essay's own gloss on Deterding's point; Deterding does not use that phrase. This is a reasonable interpretive move, but the Sources entry should make clear it is a review.
- **Recommendation:** Expand the Sources entry to reflect that this is a review article: Deterding, S. (2015). "A Manifesto, With Footnotes: A Review of Miguel Sicart's *Play Matters*." *Game Studies* 15(1). The characterization in text is acceptable as long as this is understood as an interpretation of Deterding's argument rather than a direct claim.

---

### P3 — Consider

#### Note A: Lawrence (2007) vocabulary — "Activities" vs. "Goals and Activities"

- **Location:** Section 2, body text: "he proposed that test automation should work at the Activities level (what users are trying to accomplish) rather than the Tasks level (what buttons they click)."
- **Finding:** The Lawrence article uses the vocabulary of "goals and activities" (not a strict two-level hierarchy of Activities vs. Tasks). The essay's framing collapses the nuance slightly — Lawrence's hierarchy is Goals → Activities → Tasks, with "Activities" as the middle level. The essay's characterization is directionally accurate and the distinction is minor, but the original article's terminology uses "tasks" to mean what Adzic calls "technical activity," not what Screenplay calls "Task." This vocabulary collision is a potential source of reader confusion.
- **Recommendation:** Consider a brief clarifying note when introducing Lawrence's vocabulary, acknowledging that "Tasks" in Lawrence's original usage corresponds to the technical/implementation level, not Screenplay's stable workflow step.

#### Note B: Sources list includes works not cited in body text

- **Location:** Sources list
- **Finding:** Several sources appear in the Sources list but are not cited in the essay body: Johnstone, K. (1979), Buxton, B. (2007), Dewey, J. (1934), Frayling, C. (1993), North, D. (2006), and Pruitt, J. & Grudin, J. (2003). These are present in the research log and lit reviews as background sources. All verified as real works with accurate publication details. Their inclusion in the essay's Sources list without in-text citation is a formatting inconsistency — they read as citations when they are bibliography entries.
- **Recommendation:** Either add in-text citations for these works or move them to a separate "Background Reading" section. This is a formatting/transparency matter, not an accuracy issue.

#### Note C: "Annett & Duncan 1967" journal name

- **Location:** Sources list: "Annett, J. & Duncan, K. D. (1967). 'Task Analysis and Training Design.' *Occupational Psychology*"
- **Finding:** Verified as real. The confirmed citation is: Annett, J., Duncan, K. D., Stammers, R. B., & Gray, M. J. (1971) — however the foundational 1967 paper is: Annett, J. & Duncan, K. D. (1967). "Task Analysis and Training Design." *Occupational Psychology*, 41, 211–221. The essay's citation is correct for the two-author 1967 paper.
- **Recommendation:** No change needed. Citation is accurate.

---

## Verified Sources (no issues)

The following sources were verified as real works with accurate author attributions and publication details:

| Source | Verification status |
|--------|-------------------|
| Huizinga, J. (1938). *Homo Ludens* | Verified. Published 1938. |
| Caillois, R. (1961). *Man, Play and Games* | Verified. Originally French (1958), English translation 1961, University of Illinois Press. |
| Sutton-Smith, B. (1997). *The Ambiguity of Play* | Verified. Harvard University Press. Adaptive variability claim confirmed. |
| Winnicott, D. W. (1971). *Playing and Reality* | Verified. Tavistock Publications. Quote exists but has minor omission (see Issue 4). |
| Gadamer, H.-G. (1960/1975). *Truth and Method* | Verified. German original 1960, English translation 1975. "Played by the event" characterization confirmed. |
| Sicart, M. (2014). *Play Matters* | Verified. MIT Press. |
| Schon, D. (1983). *The Reflective Practitioner* | Verified. Basic Books. "Situation talks back" confirmed. |
| Suchman, L. (1987). *Plans and Situated Actions* | Verified. Cambridge University Press. |
| de Certeau, M. (1984). *The Practice of Everyday Life* | Verified. University of California Press. |
| Boal, A. (1974). *Theatre of the Oppressed* | Verified. See Issue 3 re: translation date. |
| Spolin, V. (1963). *Improvisation for the Theater* | Verified. Northwestern University Press. "Point of concentration" confirmed. |
| Bruner, J. (1972). "Nature and Uses of Immaturity." *American Psychologist*, 27, 687–708 | Verified. Journal, volume, and page numbers confirmed. |
| Adzic, G. (2010). "How to implement UI testing without shooting yourself in the foot" | Verified. gojko.net article. Three-layer model confirmed. |
| Smart, J. F. & Molak, J. (2023). *BDD in Action*, 2nd Ed. Manning | Verified. Published May 2023, Manning. |
| Lawrence, K. (2007). "In Praise of Abstraction." AAFTT workshop | Verified. Posted October 2007 at developertesting.com as AAFTT follow-up. |
| Annett, J. & Duncan, K. D. (1967). "Task Analysis and Training Design." *Occupational Psychology* | Verified. Vol. 41, pp. 211–221. |
| Stanton, N. A. (2006). "Hierarchical Task Analysis." *Applied Ergonomics*, 37(1) | Verified. Pages 55–79. |
| Silva, T. R., Winckler, M., & Trætteberg, H. (2019). "Extending BDD for Assessing UI Design Artifacts." SEKE 2019 | Verified. HAL preprint hal-02879308 confirmed. SEKE 2019, Lisbon. |
| Molak, J., Marcano, A., Smart, J. F., & Palmer, A. (2016). "Beyond Page Objects." InfoQ | Verified. All four authors confirmed. |
| North, D. (2006). "Introducing BDD." *Better Software* | Verified. March 2006 issue. |
| Deterding, S. (2015). "A Manifesto, With Footnotes." *Game Studies* 15(1) | Verified. See Issue 5 re: title and characterization. |
| Frayling, C. (1993). "Research in Art and Design." *Royal College of Art Research Papers* | Verified. Vol. 1, No. 1, 1993/4. |
| Koskinen, I. et al. (2011). *Design Research Through Practice* | Verified. Morgan Kaufmann. |
| Johnstone, K. (1979). *Impro: Improvisation and the Theatre* | Verified. Faber and Faber. |
| Buxton, B. (2007). *Sketching User Experiences* | Verified. Morgan Kaufmann. |
| Pruitt, J. & Grudin, J. (2003). "Personas: Practice and Theory." DUX 2003 | Verified. ACM DL doi:10.1145/997078.997089. |
