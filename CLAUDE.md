# jev

Typed Python playground for JEV use cases. Package lives in `src/jev`, tests in `tests/`.

## Commands
- `uv sync` — install deps
- `uv run mypy src tests` — typecheck (strict)
- `uv run ruff check . && uv run ruff format --check .` — lint/format
- `uv run pytest` — tests

Run all three before committing. A hook formats, lints and typechecks each `.py` file after edits; fix what it reports.

## Type-safety rules
- mypy `strict` + `disallow_any_explicit`: no `Any`, no untyped defs, no bare `# type: ignore` (use `# type: ignore[code]` with a reason only if unavoidable).
- Model data at boundaries with Pydantic v2 (`strict=True`, `extra="forbid"`, prefer `frozen=True`). Never pass raw dicts around.
- Prefer `Literal`, `Enum`, `NewType` and discriminated unions over loose `str`/`int`.
- Use `typing.assert_never` for exhaustive matches.
- Add deps with `uv add <pkg>` (dev: `uv add --dev <pkg>`); commit `uv.lock`.
