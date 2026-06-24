# Decision Log

Record architecture, API, schema, workflow, validation, and dependency decisions that affect future development.

### 2026-06-24 — Reframe manuscript around soil health and SOC

- Context: The current draft in `main.tex` is organized primarily around net GHG outcomes, while the project publication goal now needs stronger soil health relevance and clearer scientific positioning for journal submission.
- Decision: Treat soil organic carbon (SOC) and soil health implications as the primary manuscript narrative. Keep net GHG results as a supporting systems metric integrated with, but secondary to, SOC-centered interpretation.
- Alternatives considered:
  - Keep net GHG as the lead narrative and add a short SOC subsection.
  - Split into two manuscripts (GHG-focused and SOC-focused).
- Consequences:
  - Section purpose statements, result ordering, and conclusion claims must be rewritten to center SOC.
  - Figure interpretation and discussion priorities must explicitly connect management scenarios to SOC response and soil-health implications.
  - Net GHG content remains in scope for completeness and policy relevance.
- Tests/docs updated:
  - `README.md`
  - `MEMORY.md`
  - `docs/ENGINEERING_MANIFEST.md`
  - `docs/AGENT_SYNC.md`
