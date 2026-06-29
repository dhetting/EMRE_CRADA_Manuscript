#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-check}"

if [[ "${MODE}" == "--help" || "${MODE}" == "-h" ]]; then
  cat <<'USAGE'
Usage:
  ./test_repo.sh [check|--check-only]
  ./test_repo.sh --fix
  ./test_repo.sh --ci

This toolkit is Pixi-first. When pixi.toml is present, validation runs through
repo-local Pixi instead of bare Python.
USAGE
  exit 0
fi

if [[ -f pixi.toml && -z "${CAW_RUNNING_UNDER_PIXI:-}" ]]; then
  if ! command -v pixi >/dev/null 2>&1; then
    echo "pixi is required for this repo. Install pixi, then rerun ./test_repo.sh." >&2
    exit 127
  fi
  exec pixi run env CAW_RUNNING_UNDER_PIXI=1 bash test_repo.sh "${MODE}"
fi

if [[ "${MODE}" == "--ci" || "${MODE}" == "--check-only" ]]; then
  MODE="check"
fi

if [[ "${MODE}" == "--fix" ]]; then
  echo ">>> Ruff format"
  ruff format src tests
  echo ">>> Ruff check --fix"
  ruff check --fix src tests
  MODE="check"
fi

if [[ "${MODE}" != "check" ]]; then
  echo "Unknown mode: ${MODE}" >&2
  exit 2
fi

PYTHON_BIN="${PYTHON_BIN:-python}"

echo ">>> Python version"
"${PYTHON_BIN}" -V

echo ">>> Ruff format --check"
ruff format --check src tests

echo ">>> Ruff check"
ruff check src tests

echo ">>> Compile source and tests"
"${PYTHON_BIN}" -m compileall -q src tests

echo ">>> Unit tests"
PYTHONPATH=src "${PYTHON_BIN}" -m unittest discover -s tests -p 'test_*.py'

echo ">>> Validate required template files"
PYTHONPATH=src "${PYTHON_BIN}" -m agent_workflow validate-toolkit --source .

echo ">>> Validate toolkit sync file"
PYTHONPATH=src "${PYTHON_BIN}" -m agent_workflow validate-sync --repo .

echo ">>> Toolkit validation complete"
