#!/bin/bash
# Install deps so typecheck/lint/tests work in Claude Code web sessions.
set -euo pipefail
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0
cd "$CLAUDE_PROJECT_DIR"
uv sync --frozen 2>/dev/null || uv sync
