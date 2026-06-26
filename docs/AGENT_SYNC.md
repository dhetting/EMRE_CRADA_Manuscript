# Agent Sync

repo: EMRE_CRADA_Manuscript
branch: manuscript/soc-intro-results-slice
base_branch: main
autonomy_tier: 3
profile: autonomous
current_milestone: establish publication-focused manuscript roadmap with SOC-forward framing
current_slice: revise manuscript introduction and SOC-first results narrative
slice_status: completed
last_validation: targeted manuscript prose update completed; `git diff --check -- main.tex` passed and targeted searches confirmed the unfinished intro/SOC fragments were removed
next_slice: repair the remaining yield and N2O prose fragments so the results section stays SOC-first while removing the last placeholder sentences

## Blocked items

- None for documentation alignment slice.

## Scope increase requests

- None.

## Candidate backlog

- Add a dedicated manuscript claim-evidence traceability table linking each conclusion sentence to source figures/tables/citations.
- Evaluate whether some LCA-heavy material should move to supplementary information when SOC is the lead narrative.

## Review findings

- Manuscript-specific open issues are visible directly in `main.tex` comments and unfinished statements.
- Required follow-up: convert those unresolved manuscript comments into actionable writing/analysis tasks.
- Source of truth for milestone priorities: `docs/ENGINEERING_MANIFEST.md`.

## Files in scope

- `main.tex`
- `references.bib`
- `figures/`
- `docs/`
- `README.md`
- `MEMORY.md`

## Files out of scope

- New model reruns or new simulation outputs not already in the repository.
- Novel scientific claims without supporting evidence.

## Targeted tests

```bash
# Docs-only slice: no code-path tests required
```

## Full gate

```bash
# Not required for docs-only slice
```

## Protected surfaces

- Scientific claim accuracy.
- Citation integrity.
- Manuscript-to-documentation alignment on project goals.

## Last agent decision

- Align repository documentation with manuscript reality and formalize the SOC-forward publication direction.

## Next agent action

- Build a bounded manuscript editing slice focused on introduction framing and SOC-first results narrative.

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
  - `main.tex`
  - `README.md`
  - `docs/ENGINEERING_MANIFEST.md`
  - `MEMORY.md`
