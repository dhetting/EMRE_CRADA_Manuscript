# Engineering Manifest

## Purpose

Define the authoritative plan for producing a submission-ready journal manuscript from the current repository draft.

## Autonomy profile

- Profile: set by `config/agent_policy.yaml`
- Current milestone: manuscript positioning and narrative hardening for publication
- Current slice: documentation realignment to repository purpose and SOC-forward direction

## Non-negotiable constraints

- Use repo-local Pixi.
- Do not add compatibility shims unless explicitly requested.
- Do not weaken tests.
- Do not invent new functionality.
- Scope increases require formal request and approval.
- Do not invent scientific results, fabricated citations, or unsupported claims.

## Protected surfaces

- Manuscript claims in `main.tex`
- Citation mapping in `references.bib`
- Figure-to-claim consistency for files under `figures/`
- Canonical project direction in `README.md`, `MEMORY.md`, and `docs/AGENT_SYNC.md`

## Priority queue

### P0 — Safety / validation / repo integrity

- [ ] Preserve scientific integrity: no fabricated numbers, no fabricated references, and explicit placeholders where evidence is incomplete.
- [ ] Reconcile manuscript comments/questions into explicit tracked tasks so unresolved scientific issues are visible.

### P1 — Current required milestone

- [ ] Reframe manuscript around soil health with SOC as the primary narrative outcome.
- [ ] Convert current net GHG emphasis into supporting context that complements SOC interpretation.
- [ ] Produce a submission-oriented manuscript status map (complete/incomplete sections, unresolved claims, required evidence).

### P2 — Hardening

- [ ] Resolve unfinished prose and inline questions in introduction, results, and conclusions.
- [ ] Verify placeholder citations and ensure each major claim is supported by evidence.
- [ ] Ensure methods/results/discussion flow is coherent for journal review.

### P3 — Documentation and examples

- [ ] Keep repository docs aligned with manuscript progress and publication objective.
- [ ] Maintain a clear SOC-first roadmap in `docs/AGENT_SYNC.md`.

## Completed work

- Updated repository documentation to state manuscript purpose and SOC-forward direction.
- Reworked the manuscript introduction and results lead to foreground SOC recovery as the primary narrative.

## Deferred backlog

Use `docs/scope_backlog.md` for out-of-scope opportunities.
