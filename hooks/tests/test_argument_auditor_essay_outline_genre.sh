#!/usr/bin/env bash
# ADR-093 (v0.8.6 / Cycle 018 WP-B): The argument-auditor agent definition
# must encode Essay-Outline as the fourth named genre, with the Process
# step specifying pyramid graph-traversal (per ADR-093 §2) and expansion-
# fidelity verification (per ADR-093 §3) across the three boundaries plus
# reverse-direction. The output template must include the pyramid coverage
# map and expansion-fidelity findings subsections with Discrimination Test
# routing on Boundary 1 / Boundary 2 P1 findings (per ADR-092 §6). META
# audit-time review must be specified.
#
# Skill-text-anchoring test (Skill-Structure Layer per ADR-065 + ADR-067 +
# ADR-093 §5).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_argument_auditor_essay_outline_genre"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
AUDITOR_FILE="${PLUGIN_ROOT}/agents/argument-auditor.md"

[[ -f "$AUDITOR_FILE" ]] || { fail "agents/argument-auditor.md not found"; report_summary; }

AUDITOR="$(cat "$AUDITOR_FILE")"

# --- ADR references ---

for adr in 'ADR-092' 'ADR-093'; do
    if grep -qF "$adr" <<<"$AUDITOR"; then
        pass "argument-auditor references $adr"
    else
        fail "argument-auditor does not reference $adr"
    fi
done

# --- Four named genres ---

declare -a GENRES=(
    'Essay-Outline'
    'Research essays'
    'ADRs'
    'Synthesis outlines'
)
for genre in "${GENRES[@]}"; do
    if grep -qF "$genre" <<<"$AUDITOR"; then
        pass "argument-auditor names genre '$genre'"
    else
        fail "argument-auditor does not name genre '$genre'"
    fi
done

# --- Essay-Outline Process step ---

# Process step heading or anchor
if grep -qiE 'Essay-Outline Genre.*Pyramid Graph-Traversal|Pyramid Graph-Traversal' <<<"$AUDITOR"; then
    pass "argument-auditor contains a Pyramid Graph-Traversal Process step"
else
    fail "argument-auditor does not contain a Pyramid Graph-Traversal Process step"
fi

# Four tiers named
for tier in 'Tier 1' 'Tier 2' 'Tier 3' 'Tier 4'; do
    if grep -qF "$tier" <<<"$AUDITOR"; then
        pass "argument-auditor names '$tier' in the pyramid traversal"
    else
        fail "argument-auditor does not name '$tier' in the pyramid traversal"
    fi
done

# --- Expansion-fidelity verification — three boundaries + reverse-direction ---

for boundary in 'Boundary 1' 'Boundary 2' 'Boundary 3' 'Reverse Boundary 1' 'Reverse Boundary 2'; do
    if grep -qF "$boundary" <<<"$AUDITOR"; then
        pass "argument-auditor names '$boundary'"
    else
        fail "argument-auditor does not name '$boundary'"
    fi
done

# --- Discrimination Test routing field — inline in Boundary 1 / 2 P1 findings ---

for routing in 'scope-suspect' 'discipline-suspect'; do
    if grep -qF "$routing" <<<"$AUDITOR"; then
        pass "argument-auditor specifies Discrimination Test routing '$routing'"
    else
        fail "argument-auditor does not specify Discrimination Test routing '$routing'"
    fi
done

# The routing field must reference ADR-092 §6 (the source of the discrimination)
if grep -qE 'ADR-092 §6|ADR-092 .6' <<<"$AUDITOR"; then
    pass "argument-auditor routing references ADR-092 §6"
else
    fail "argument-auditor routing does not reference ADR-092 §6"
fi

# --- META audit-time review ---

if grep -qiE 'META audit-time review|META anchor.*audit' <<<"$AUDITOR"; then
    pass "argument-auditor specifies META audit-time review"
else
    fail "argument-auditor does not specify META audit-time review"
fi

# META misclassification severity (P2)
if grep -qiE 'P2 misclassification' <<<"$AUDITOR"; then
    pass "argument-auditor specifies P2 misclassification for META anchor with developmental content"
else
    fail "argument-auditor does not specify P2 misclassification for META anchor with developmental content"
fi

# --- Boundary 3 citation-auditor coordination ---

if grep -qiE 'citation-auditor' <<<"$AUDITOR"; then
    pass "argument-auditor specifies citation-auditor coordination on Boundary 3"
else
    fail "argument-auditor does not specify citation-auditor coordination on Boundary 3"
fi

# Boundary 3 severity: P2 normally, P1 when citation-auditor absent (escalation)
if grep -qiE 'escalate.*P1|P1.*citation-auditor.*absent|citation-auditor has not yet run' <<<"$AUDITOR"; then
    pass "argument-auditor specifies escalation path when citation-auditor is absent"
else
    fail "argument-auditor does not specify escalation path when citation-auditor is absent"
fi

# --- Output template extensions ---

if grep -qiE 'Pyramid Coverage Map' <<<"$AUDITOR"; then
    pass "argument-auditor output template includes Pyramid Coverage Map"
else
    fail "argument-auditor output template does not include Pyramid Coverage Map"
fi

if grep -qiE 'Expansion-Fidelity Findings' <<<"$AUDITOR"; then
    pass "argument-auditor output template includes Expansion-Fidelity Findings"
else
    fail "argument-auditor output template does not include Expansion-Fidelity Findings"
fi

# --- Structured-bullet identifier conventions ---

for ident in 'C1' 'W1.1' 'E1.1.1'; do
    if grep -qF "$ident" <<<"$AUDITOR"; then
        pass "argument-auditor references Argument-Graph identifier '$ident'"
    else
        fail "argument-auditor does not reference Argument-Graph identifier '$ident'"
    fi
done

# --- Backward compatibility: existing five within-document verifications still listed ---

declare -a VERIFICATIONS=(
    'Logical soundness'
    'Hidden assumptions'
    'Scope accuracy'
    'Internal consistency'
    'Terminology consistency'
)
for v in "${VERIFICATIONS[@]}"; do
    if grep -qF "$v" <<<"$AUDITOR"; then
        pass "argument-auditor retains existing verification '$v'"
    else
        fail "argument-auditor missing existing verification '$v' (backward-compatibility regression)"
    fi
done

# --- Framing audit still runs (two-section output preserved) ---

if grep -qiE 'Framing [Aa]udit' <<<"$AUDITOR"; then
    pass "argument-auditor retains Framing Audit section"
else
    fail "argument-auditor missing Framing Audit section"
fi

report_summary
