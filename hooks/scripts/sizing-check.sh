#!/bin/bash
# PostToolUse hook: flag documents exceeding sizing heuristics
# Fires on Write operations targeting docs/

# Claude Code delivers hook input via stdin, not as a command-line argument.
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi

# Only check files in docs/
if ! echo "$INPUT" | grep -q '"docs/'; then
  exit 0
fi

# Extract the file path from the input (best-effort parse)
FILE_PATH=$(echo "$INPUT" | grep -o '"docs/[^"]*"' | tr -d '"' | head -1)

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

WORD_COUNT=$(wc -w < "$FILE_PATH" | tr -d ' ')

# ~5000 word guideline for end-to-end readable documents
# Reference documents (domain model, field guide) are exempt per Read Contract heuristic
EXEMPT_PATTERNS="domain-model|field-guide|scenarios"

if echo "$FILE_PATH" | grep -qE "$EXEMPT_PATTERNS"; then
  exit 0
fi

if [ "$WORD_COUNT" -gt 5500 ]; then
  echo "SIZING NOTE: $FILE_PATH is approximately $WORD_COUNT words. The document sizing heuristic suggests ~5,000 words for end-to-end readable documents (ADR-024). Consider whether this document should be split (Purpose Test) or if it serves as reference material (Read Contract exemption)."
fi
