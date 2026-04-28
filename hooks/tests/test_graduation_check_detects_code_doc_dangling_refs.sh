#!/usr/bin/env bash
# WP-F (Issue #17): The graduation-check operation in /rdd-conform scans the
# codebase for corpus-internal identifier strings (WP-[A-Z], ADR-NNN, etc.)
# that would become dangling references after /rdd-graduate folds the RDD
# scaffolding into native docs. Modeled on Tan et al. 2024's detection tool
# in the reverse direction (code → doc rather than doc → code).
#
# Skill-text-anchoring test (Skill-Structure Layer per ADR-065 + ADR-067).
# The mechanism is structurally anchored at the moment of graduation per
# Invariant 8.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_graduation_check_detects_code_doc_dangling_refs"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CONFORM_FILE="${PLUGIN_ROOT}/skills/conform/SKILL.md"
GRADUATE_FILE="${PLUGIN_ROOT}/skills/graduate/SKILL.md"

if [[ ! -f "$CONFORM_FILE" ]]; then
    fail "skills/conform/SKILL.md not found at $CONFORM_FILE"
    report_summary
fi
if [[ ! -f "$GRADUATE_FILE" ]]; then
    fail "skills/graduate/SKILL.md not found at $GRADUATE_FILE"
    report_summary
fi

CONFORM="$(cat "$CONFORM_FILE")"
GRADUATE="$(cat "$GRADUATE_FILE")"

# --- /rdd-conform: graduation-check operation exists ---

# Operations table includes the graduation-check entry
if grep -qiE '\| \*\*[Gg]raduation[ -]?[Cc]heck' <<<"$CONFORM"; then
    pass "operations table includes Graduation Check"
else
    fail "operations table missing Graduation Check entry"
fi

# Operation section header exists
if grep -qiE '^## Operation [0-9]+:.*[Gg]raduation[ -]?[Cc]heck' <<<"$CONFORM"; then
    pass "Graduation Check operation section header exists"
else
    fail "Graduation Check operation section header missing"
fi

# References Issue #17
if grep -qE 'Issue #17|#17' <<<"$CONFORM"; then
    pass "operation references Issue #17"
else
    fail "operation does not reference Issue #17"
fi

# Names the patterns to scan for
declare -a PATTERNS=(
    "WP-"            # work package identifiers
    "ADR-"           # architecture decision record identifiers
    "Cycle"          # cycle identifiers
)
for pattern in "${PATTERNS[@]}"; do
    if grep -qF "$pattern" <<<"$CONFORM"; then
        pass "operation names pattern '$pattern'"
    else
        fail "operation does not name pattern '$pattern'"
    fi
done

# Reverse-direction framing (code → doc, not doc → code)
if grep -qiE 'code.*→.*doc|code.*->.*doc|reverse.*direction|code-side|in code|codebase' <<<"$CONFORM"; then
    pass "operation describes code → doc detection direction"
else
    fail "operation does not describe code → doc detection direction"
fi

# References Tan et al. 2024 as the prior art
if grep -qiE 'Tan.*2024|reverse.*Tan' <<<"$CONFORM"; then
    pass "operation references Tan et al. 2024 prior art"
else
    fail "operation does not reference Tan et al. 2024 prior art"
fi

# Produces a report with file:line locations
if grep -qiE 'file:line|file path.*line|with line numbers|each match' <<<"$CONFORM"; then
    pass "operation produces report with file:line locations"
else
    fail "operation does not describe file:line report format"
fi

# User reviews before graduation
if grep -qiE 'user review|review before|pre-graduation|before.*graduat' <<<"$CONFORM"; then
    pass "operation positions itself as pre-graduation review"
else
    fail "operation does not position as pre-graduation review"
fi

# --- /rdd-graduate: references the graduation-check operation ---

# Skill text references the pre-graduation scan
if grep -qiE 'pre-graduation scan|graduation[ -]?check|/rdd-conform.*graduation' <<<"$GRADUATE"; then
    pass "graduate skill references the pre-graduation scan"
else
    fail "graduate skill does not reference the pre-graduation scan"
fi

# Skill text positions the scan at a structurally anchored moment
# (before migration plan is approved — per Invariant 8 anchoring requirement)
if grep -qiE 'before.*migrat|recommended step|invariant 8|anchored' <<<"$GRADUATE"; then
    pass "graduate skill anchors the scan at a structural moment"
else
    fail "graduate skill does not anchor the scan structurally"
fi

# Skill text mentions the scan as recommended (not mandatory — Invariant 8
# disqualifies prototype-or-justified-rejection-style mandatory mechanisms)
if grep -qiE 'recommended|optional|advisable' <<<"$GRADUATE"; then
    pass "graduate skill frames scan as recommended (not mandatory)"
else
    fail "graduate skill does not frame scan as recommended"
fi

report_summary
