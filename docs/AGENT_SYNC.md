# Agent Sync

repo: copilot-agent-workflow-toolkit
branch: main
base_branch: main
autonomy_tier: 1
profile: toolkit-development
current_milestone: harden workflow toolkit from external audit
current_slice: validate live Copilot CLI hook payload aliases after local install
slice_status: completed
last_validation: targeted hook alias tests pass; full gate blocked by missing `agent_workflow` module in this repo baseline
next_slice: restore/align `agent_workflow` module wiring used by `test_repo.sh` validation commands

## Blocked items

- Full `pixi run test` gate fails at `python -m agent_workflow ...` because module `agent_workflow` is not present in this repository.

## Scope increase requests

- None.

## Candidate backlog

- Validate model names against the user-visible Copilot model picker in the deployed enterprise account.
- Add richer multi-repo coordination only after single-repo profile workflows stabilize.

## Review findings

- Open blockers: command-policy bypasses, missing CI/lint, stale sync state, missing intermediate profile, and missing bootstrap/reconcile/scaffold capabilities from the May 2026 audit.
- Required follow-up: validate patched hooks against real Copilot CLI hook payloads after install.
- Non-blocking backlog: multi-repo coordinator, richer release automation.
- Source of truth: `docs/review_register.md`.

## Files in scope

- `src/copilot_agent_workflow/`
- `scripts/`
- `tests/`
- `.github/`
- `agents/`
- `skills/`
- `templates/`
- `docs/`
- `README.md`
- `MEMORY.md`
- `pixi.toml`
- `test_repo.sh`

## Files out of scope

- Target downstream project source code.
- External research artifacts unrelated to this toolkit hardening slice.

## Targeted tests

```bash
pixi run test
```

## Full gate

```bash
pixi install --locked
pixi run test
```

## Protected surfaces

- Command policy hook behavior.
- Profile permission semantics.
- Install/prepare/profile CLI contracts.
- Pixi-first validation contract.
- Agent/skill template synchronization.

## Last agent decision

- Execute one bounded regression slice for live Copilot CLI hook payload alias compatibility (`toolArguments`, `arguments`, and `name` aliases).

## Next agent action

- Resolve missing `agent_workflow` module path/import contract so full Pixi validation gate can run end to end.

## External context

- requires_external_research: false
- external_research_status: not_required  # not_required | required_missing | ready | blocked
- required_ai_context_artifacts:
  - none
- ai_context_artifacts_used:
  - none
- external_research_prompt:
  - none

## Caveman context

- compressed_context_available: false
- compressed_context_files_used:
  - none
- verbose_fallback_files_used:
  - none
