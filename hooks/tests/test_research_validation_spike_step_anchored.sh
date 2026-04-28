#!/usr/bin/env bash
# WP-C (ADR-087 §3): The /rdd-research skill text must include a
# validation-spike decision step at the research → discover gate.
# Skill-text-anchoring test (Skill-Structure Layer per ADR-065 + ADR-067).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_research_validation_spike_step_anchored"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SKILL_FILE="${PLUGIN_ROOT}/skills/research/SKILL.md"

if [[ ! -f "$SKILL_FILE" ]]; then
    fail "skills/research/SKILL.md not found at $SKILL_FILE"
    report_summary
fi

CONTENT="$(cat "$SKILL_FILE")"

# Validation-spike decision section header exists
if grep -qiE '^### .*[Vv]alidation[ -]?[Ss]pike' <<<"$CONTENT"; then
    pass "validation-spike decision section header exists"
else
    fail "validation-spike decision section header missing"
fi

# Section references ADR-087
if grep -qE 'ADR-087' <<<"$CONTENT"; then
    pass "section references ADR-087"
else
    fail "section does not reference ADR-087"
fi

# Section is positioned BEFORE the EPISTEMIC GATE — the gate's reflection-time
# prompt fires after the validation-spike decision. Compute line numbers.
SPIKE_LINE="$(grep -niE '^### .*[Vv]alidation[ -]?[Ss]pike' <<<"$CONTENT" | head -1 | cut -d: -f1)"
GATE_LINE="$(grep -nE '^### EPISTEMIC GATE' <<<"$CONTENT" | head -1 | cut -d: -f1)"

if [[ -n "$SPIKE_LINE" && -n "$GATE_LINE" && "$SPIKE_LINE" -lt "$GATE_LINE" ]]; then
    pass "validation-spike step is positioned before EPISTEMIC GATE (line $SPIKE_LINE < $GATE_LINE)"
else
    fail "validation-spike step not positioned before EPISTEMIC GATE (spike: '$SPIKE_LINE', gate: '$GATE_LINE')"
fi

# Felt-trigger question is named — interaction-grounding rationale
if grep -qiE 'interaction.grounding|ground.*research.*actual interaction|actual interaction' <<<"$CONTENT"; then
    pass "section names interaction-grounding rationale"
else
    fail "section does not name interaction-grounding rationale"
fi

# Felt-trigger question is named — possibility-space-pruning rationale
if grep -qiE 'possibility.space|prune|over.elaborat' <<<"$CONTENT"; then
    pass "section names possibility-space-pruning rationale"
else
    fail "section does not name possibility-space-pruning rationale"
fi

# Rationale-recording requirement (rejection with rationale must be visible)
if grep -qiE 'rationale|record.*decision|record.*rejection|record.*choice' <<<"$CONTENT"; then
    pass "section includes rationale-recording requirement"
else
    fail "section does not include rationale-recording requirement"
fi

# Section frames spikes as optional / felt-judgment (not mandatory).
# The skill text must NOT enforce prototyping (Invariant 8 — judgment-applied).
if grep -qiE 'optional|not mandatory|felt|judgment' <<<"$CONTENT"; then
    pass "section frames decision as optional / felt-judgment"
else
    fail "section does not frame decision as optional"
fi

# If a prototype is run, findings integrate into the essay before advance
if grep -qiE 'integrate.*essay|findings.*essay|essay.*update|update.*essay' <<<"$CONTENT"; then
    pass "section describes integrating spike findings into essay"
else
    fail "section does not describe integrating spike findings into essay"
fi

# The decision step is anchored at the research → discover gate moment
if grep -qiE 'research.*→.*discover|research.*to.*discover|discover gate' <<<"$CONTENT"; then
    pass "section is anchored at research → discover gate"
else
    fail "section is not anchored at research → discover gate"
fi

# Beck-port reframe carried as scope-of-claim — the section should not
# silently promote the Beck framing as verified.
if grep -qiE 'Beck.*port|conceptual frame|not.*verified|honest scope' <<<"$CONTENT"; then
    pass "section preserves Beck-port reframe scope-of-claim"
else
    fail "section does not preserve Beck-port reframe scope-of-claim"
fi

report_summary
