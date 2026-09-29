#!/bin/bash
# PostToolUse: format, lint and typecheck an edited .py file. Exit 2 feeds errors back to Claude.
set -uo pipefail
file=$(jq -r '.tool_input.file_path // empty')
[[ "$file" == *.py && -f "$file" ]] || exit 0
cd "$CLAUDE_PROJECT_DIR"
uv run --quiet ruff format --quiet "$file"
out=$(uv run --quiet ruff check --fix --quiet "$file" 2>&1; uv run --quiet mypy "$file" 2>&1 | grep -v '^Success')
if [ -n "$out" ]; then
  echo "$out" >&2
  exit 2
fi
