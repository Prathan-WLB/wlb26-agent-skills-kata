#!/usr/bin/env bash
# export-metadata.sh — Collect session metadata for test-design skill export
# Outputs: date, session duration, and token usage breakdown
# Reads Claude Code's JSONL session transcript from the current project directory.
# Prints "unavailable" for any value it cannot compute (e.g., jq missing, no session file).

set -euo pipefail

# --- 1. Date (wall-clock) ---
echo "=== Date ==="
date "+%Y-%m-%d"

# --- Shared setup ---
PROJECT_DIR="$HOME/.claude/projects/$(pwd | sed 's|/|-|g')"
SESSION_FILE=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | head -1 || true)

if ! command -v jq &>/dev/null; then
  echo "=== Duration ==="
  echo "unavailable (jq not installed)"
  echo "=== Tokens ==="
  echo "unavailable (jq not installed)"
  exit 0
fi

if [ -z "$SESSION_FILE" ]; then
  echo "=== Duration ==="
  echo "unavailable (no session file found)"
  echo "=== Tokens ==="
  echo "unavailable (no session file found)"
  exit 0
fi

# --- 2. Session duration ---
echo "=== Duration ==="
jq -rs '
  [.[] | .timestamp // empty] as $ts
  | ($ts | min) as $start
  | ($ts | max) as $end
  | (($end | fromdateiso8601) - ($start | fromdateiso8601)) as $secs
  | "\($secs | floor / 3600 | floor)h \(($secs | floor / 60 | floor) % 60)m \($secs | floor % 60)s (\($secs | floor)s total)"
' "$SESSION_FILE" 2>/dev/null || echo "unavailable (failed to parse session timestamps)"

# --- 3. Token usage breakdown ---
echo "=== Tokens ==="
jq -s '
  [.[] | .message.usage // empty
    | { input: (.input_tokens // 0),
        output: (.output_tokens // 0),
        cache_creation: (.cache_creation_input_tokens // 0),
        cache_read: (.cache_read_input_tokens // 0) }]
  | { input: (map(.input) | add),
      output: (map(.output) | add),
      cache_creation: (map(.cache_creation) | add),
      cache_read: (map(.cache_read) | add),
      total: (map(.input + .output + .cache_creation + .cache_read) | add) }
' "$SESSION_FILE" 2>/dev/null || echo "unavailable (failed to parse token usage)"
