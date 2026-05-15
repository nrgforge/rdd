#!/usr/bin/env bash
# ADR-092 + ADR-093 (v0.8.6 / Cycle 018 WP-A): The /rdd-research skill text
# must encode Essay-Outline as the canonical RESEARCH artifact form, with
# the four-section template (Abstract / Argument-Graph / Citation-Embedded
# Outline / References), Pyramid Refinement as structural property, the
# Argument-Graph format with MUST anchor + META reserved identifier, the
# Outline-Production Discipline production requirements, and the Outline-
# Coherence Signal stewardship guidance with Discrimination Test routing.
# The legacy filename pattern must be updated to essay-outline-NNN-<slug>.md.
#
# Skill-text-anchoring test (Skill-Structure Layer per ADR-065 + ADR-067).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_essay_outline_form_documented"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
RESEARCH_FILE="${PLUGIN_ROOT}/skills/research/SKILL.md"

[[ -f "$RESEARCH_FILE" ]] || { fail "skills/research/SKILL.md not found"; report_summary; }

RESEARCH="$(cat "$RESEARCH_FILE")"

# --- ADR references ---

for adr in 'ADR-092' 'ADR-093'; do
    if grep -qF "$adr" <<<"$RESEARCH"; then
        pass "/rdd-research references $adr"
    else
        fail "/rdd-research does not reference $adr"
    fi
done

# --- Form name appears at the top of the file (frontmatter description + intro) ---

if grep -qF 'Essay-Outline' <<<"$RESEARCH"; then
    pass "/rdd-research names Essay-Outline"
else
    fail "/rdd-research does not name Essay-Outline"
fi

# --- Four-section template — each named section present ---

declare -a SECTIONS=(
    'Abstract Section'
    'Argument-Graph Section'
    'Citation-Embedded Outline'
    'References'
)
for section in "${SECTIONS[@]}"; do
    if grep -qF "$section" <<<"$RESEARCH"; then
        pass "/rdd-research names section '$section'"
    else
        fail "/rdd-research does not name section '$section'"
    fi
done

# --- Pyramid Refinement is named as the structural property ---

if grep -qF 'Pyramid Refinement' <<<"$RESEARCH"; then
    pass "/rdd-research names Pyramid Refinement"
else
    fail "/rdd-research does not name Pyramid Refinement"
fi

# --- Argument-Graph format: MUST anchor + META reserved identifier ---

# MUST anchor convention is named
if grep -qE 'MUST anchor' <<<"$RESEARCH"; then
    pass "/rdd-research documents the MUST anchor convention"
else
    fail "/rdd-research does not document the MUST anchor convention"
fi

# META reserved identifier is named
if grep -qE '\bMETA\b' <<<"$RESEARCH"; then
    pass "/rdd-research documents the META reserved identifier"
else
    fail "/rdd-research does not document the META reserved identifier"
fi

# Structured-bullet hierarchy identifiers (C1, W1.1, E1.1.1)
for ident in 'C1' 'W1.1' 'E1.1.1'; do
    if grep -qF "$ident" <<<"$RESEARCH"; then
        pass "/rdd-research shows Argument-Graph identifier '$ident'"
    else
        fail "/rdd-research does not show Argument-Graph identifier '$ident'"
    fi
done

# --- Outline-Production Discipline is named ---

if grep -qF 'Outline-Production Discipline' <<<"$RESEARCH"; then
    pass "/rdd-research names Outline-Production Discipline"
else
    fail "/rdd-research does not name Outline-Production Discipline"
fi

# Discipline production requirements: Synthesis Bullets, CONFIDENCE-LEVEL tags, named meta-moves
for req in 'Synthesis Bullet' 'CONFIDENCE-LEVEL' 'PROVENANCE CORRECTION' 'SCOPE QUALIFICATION'; do
    if grep -qF "$req" <<<"$RESEARCH"; then
        pass "/rdd-research documents discipline element '$req'"
    else
        fail "/rdd-research does not document discipline element '$req'"
    fi
done

# --- Outline-Coherence Signal stewardship guidance ---

if grep -qF 'Outline-Coherence Signal' <<<"$RESEARCH"; then
    pass "/rdd-research names Outline-Coherence Signal"
else
    fail "/rdd-research does not name Outline-Coherence Signal"
fi

# Discrimination Test routing — scope-suspect and discipline-suspect
for routing in 'scope-suspect' 'discipline-suspect'; do
    if grep -qF "$routing" <<<"$RESEARCH"; then
        pass "/rdd-research documents Discrimination Test routing '$routing'"
    else
        fail "/rdd-research does not document Discrimination Test routing '$routing'"
    fi
done

# --- Filename pattern updated ---

if grep -qE 'essay-outline-NNN' <<<"$RESEARCH"; then
    pass "/rdd-research uses essay-outline-NNN-<slug>.md filename pattern"
else
    fail "/rdd-research does not use essay-outline-NNN-<slug>.md filename pattern"
fi

# Legacy "If you can't explain it clearly in prose..." line must be revised
if grep -qF "If you can't explain it clearly in prose, you don't understand it well enough" <<<"$RESEARCH"; then
    fail "/rdd-research retains the legacy prose-essay line ('If you can't explain it clearly in prose...') — must be revised per ADR-092 form change"
else
    pass "/rdd-research has revised the legacy prose-essay line"
fi

# --- Compliance test (a)/(b)/(c)/(d) terms are surfaced in the auditor route ---
# These compliance-test components are auditor-side per ADR-092 §3 and ADR-093 §3;
# the research skill references them in the Outline-Coherence Signal section.

if grep -qE 'expansion[ -]fidelity|expansion fidelity' <<<"$RESEARCH"; then
    pass "/rdd-research references expansion-fidelity verification"
else
    fail "/rdd-research does not reference expansion-fidelity verification"
fi

# --- Boundary terms ---

for boundary in 'Boundary 1' 'Boundary 2'; do
    if grep -qF "$boundary" <<<"$RESEARCH"; then
        pass "/rdd-research names '$boundary'"
    else
        fail "/rdd-research does not name '$boundary'"
    fi
done

report_summary
