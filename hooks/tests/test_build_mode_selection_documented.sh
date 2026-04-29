#!/usr/bin/env bash
# ADR-091 (v0.8.5): The /rdd-build skill text must include a BUILD Mode
# Selection subsection documenting auto-mode and gated-mode as legitimate
# patterns with the four mode-selection axes. The orchestrator's
# cycle-status.md schema documentation must list `**BUILD mode:**` as an
# optional per-entry field.
#
# Skill-text-anchoring test (Skill-Structure Layer per ADR-065 + ADR-067).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_build_mode_selection_documented"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
BUILD_FILE="${PLUGIN_ROOT}/skills/build/SKILL.md"
RDD_FILE="${PLUGIN_ROOT}/skills/rdd/SKILL.md"

[[ -f "$BUILD_FILE" ]] || { fail "skills/build/SKILL.md not found"; report_summary; }
[[ -f "$RDD_FILE" ]] || { fail "skills/rdd/SKILL.md not found"; report_summary; }

BUILD="$(cat "$BUILD_FILE")"
RDD="$(cat "$RDD_FILE")"

# --- /rdd-build: BUILD Mode Selection subsection ---

# Section header exists
if grep -qE '^### BUILD Mode Selection' <<<"$BUILD"; then
    pass "/rdd-build has BUILD Mode Selection section"
else
    fail "/rdd-build missing BUILD Mode Selection section"
fi

# References ADR-091
if grep -q "ADR-091" <<<"$BUILD"; then
    pass "/rdd-build references ADR-091"
else
    fail "/rdd-build does not reference ADR-091"
fi

# Names both modes
for mode in 'Gated mode' 'Auto mode'; do
    if grep -qF "$mode" <<<"$BUILD"; then
        pass "/rdd-build names '$mode'"
    else
        fail "/rdd-build does not name '$mode'"
    fi
done

# Names the field that drives selection
if grep -qF '**BUILD mode:**' <<<"$BUILD"; then
    pass "/rdd-build references the **BUILD mode:** field"
else
    fail "/rdd-build does not reference **BUILD mode:** field"
fi

# Default is gated (safer choice)
if grep -qiE 'default.*gated|gated.*default|absence.*default.*gated' <<<"$BUILD"; then
    pass "/rdd-build documents gated as default mode"
else
    fail "/rdd-build does not document gated as default mode"
fi

# Names all four mode-selection axes
declare -a AXES=(
    'mechanical'
    'generative'
    'availability'
    'stake'
    'reversib'
    'catching'
    'teaching'
)
for axis in "${AXES[@]}"; do
    if grep -qiF "$axis" <<<"$BUILD"; then
        pass "/rdd-build names axis term '$axis'"
    else
        fail "/rdd-build does not name axis term '$axis'"
    fi
done

# Auto-mode failure modes are honestly named (scope-of-claim)
if grep -qiE 'design.alternative.*examination|design alternative|scoping.judgment' <<<"$BUILD"; then
    pass "/rdd-build names auto-mode failure modes"
else
    fail "/rdd-build does not name auto-mode failure modes"
fi

# Mid-phase shift mechanic is documented
if grep -qiE 'mid.phase shift|shift.*mid|mode.*can change' <<<"$BUILD"; then
    pass "/rdd-build documents mid-phase shift"
else
    fail "/rdd-build does not document mid-phase shift"
fi

# Section is positioned BEFORE Step 0 (mode is read at phase entry, before
# context gathering)
MODE_LINE="$(grep -nE '^### BUILD Mode Selection' <<<"$BUILD" | head -1 | cut -d: -f1)"
STEP0_LINE="$(grep -nE '^### Step 0:' <<<"$BUILD" | head -1 | cut -d: -f1)"
if [[ -n "$MODE_LINE" && -n "$STEP0_LINE" && "$MODE_LINE" -lt "$STEP0_LINE" ]]; then
    pass "BUILD Mode Selection precedes Step 0 (line $MODE_LINE < $STEP0_LINE)"
else
    fail "BUILD Mode Selection does not precede Step 0 (mode: '$MODE_LINE', step0: '$STEP0_LINE')"
fi

# --- /rdd orchestrator: cycle-status.md schema documents BUILD mode field ---

# Schema lists the BUILD mode field
if grep -qE '\*\*BUILD mode:\*\*' <<<"$RDD"; then
    pass "/rdd orchestrator schema lists **BUILD mode:** field"
else
    fail "/rdd orchestrator schema does not list **BUILD mode:** field"
fi

# Per-field documentation references ADR-091
if grep -qE 'ADR-091' <<<"$RDD"; then
    pass "/rdd orchestrator references ADR-091"
else
    fail "/rdd orchestrator does not reference ADR-091"
fi

# Documents both values (auto and gated)
if grep -qE 'BUILD mode.*auto|auto.*gated|gated.*auto' <<<"$RDD"; then
    pass "/rdd orchestrator documents auto/gated values"
else
    fail "/rdd orchestrator does not document auto/gated values"
fi

report_summary
