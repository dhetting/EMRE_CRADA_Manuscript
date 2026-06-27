# Session Handoff — main_soc.tex Manuscript Agent
**Branch:** `manuscript/soc-intro-results-slice`  
**Last commit:** `ff873ff` (cycle 8 final)  
**Date:** 2026-06-27  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)

---

## What was done this session (cycles 7–8)

### Cycle 7 — Second adversarial review fixes
- Removed BAU claim and invalid depth-interval comparison from conclusions
- Softened "irrigation is primary driver" to "largest modeled SOC contrast"
- Removed intro overclaims ("simultaneously," bioenergy economic framing)
- Fixed N₂O irrigation direction claim (now conditional, not directional)
- Removed "retaining more nitrogen in plant-available mineral forms" from harvest section
- Removed `\nocite{*}`
- Fixed citation: `Davis2012MiscanthusEcosystems` → `Davis2010Comparative` everywhere
- Fixed citation: `Thornton2014Placeholder` → `Thornton2022Daymet` (DOI 10.3334/ORNLDAAC/2129)
- Added 5 stub bib entries for undefined keys to allow compilation

### Cycle 8 — Round 3 review and additional direct fixes
After the analysis agent updated the manuscript with new data (BAU controls, layer SOC, yield, factorial effects), performed a third adversarial review and applied all directly fixable issues:

- Abstract: yield ratio now explicit (5.2 vs. 1.7 Mg d.m. ha⁻¹ yr⁻¹, "approximately 3-fold")
- "arid lands" → "drylands" throughout
- Circular intro sentence removed; replaced with "candidates for SOC restoration and reduced erosion where water availability permits"
- PRDX(1) claim hedged: "all remaining crop.100 parameters were held identical between the two entries in this simulation archive (see Supplementary Table S1)"
- Stale depth-mismatch NOTE removed (layer SOC now validated)
- "Wang should verify" → "should be verified" (Wang unavailable)
- Stale N₂O NOTE (0.073 value) removed; confirmed 0.068 NOTE retained
- Stale Figure 6 Word comments removed
- Spatial input preparation paragraph added to Analytical workflow
- Initial SOC validation absence disclosed in Conclusions limitations
- BAU increment per-land-cover computation made explicit in prose
- Conclusions: "all other parameters identical" reinstated with hedge + Supp Table S1 reference
- "productivity ceiling" → "productivity slope" (PRDX(1) is a slope, not a cap)
- CEC results: no-harvest depth fraction >1.0 explained in body text
- Fertilization yield vs. SOC apparent contradiction resolved (routes through root biomass)
- `HARV ALL` clarified as above-ground only (roots not removed)
- Boundary NOTE: removed "Wang should confirm" (Wang unavailable)

**New docs committed:**
- `docs/ADVERSARIAL_REVIEW_R3.md` — structured round 3 review findings
- `docs/ANALYSIS_AGENT_HANDOFF.md` — updated priority list for analysis agent

---

## Current blocking issues (cannot submit without these)

### B1 — pH extraction bug invalidates ~40% of CEC pixels
The gSSURGO `ph1to1h2o` values in the H5 resource file show ~40% of pixels below pH 5.5. Permian Basin soils are predominantly alkaline; sub-5.5 pH at this frequency is almost certainly an encoding or extraction error (possible unit mismatch, fill-value misread, or spatial join error). All ΔCEC values in the manuscript (0.9–6.6 cmolc/kg) are computed using these pH values and are systematically biased for ~40% of the domain.

**Analysis agent must:** Identify and fix the encoding error, re-extract pH from the authoritative gSSURGO source, recompute all ΔCEC values, and return corrected range bounds. See `docs/ANALYSIS_AGENT_HANDOFF.md` → A1.

### B2 — Supplementary Table S1 does not exist
Both Results (line 166) and Conclusions (line 293) reference "Supplementary Table S1 for full parameter listing" of DAYCENT crop.100 entries. The table does not exist. Without it the "all remaining parameters identical" claim is unverifiable and the submission has a broken supplementary reference.

**Analysis agent must:** Extract full MISC and SG3 entries from `crop.100`, flag any parameters that differ beyond PRDX(1), and return a table suitable for LaTeX. See `docs/ANALYSIS_AGENT_HANDOFF.md` → A2.

---

## Open major issues (needed before submission)

| ID | Issue | Who resolves |
|----|-------|-------------|
| A3 | agcacc extraction method (cumulative vs. annual?) not documented in Methods | Analysis agent → manuscript agent adds one sentence |
| A4 | Anderson-Teixeira 5–30 Mg C/ha cumulative range not verified against Table 2 | Analysis agent verifies; manuscript agent updates |
| A5 | Cumulative N₂O 10–15% above endpoint-rate × 79yr — early-year elevation not explained | Analysis agent confirms trajectory; manuscript agent adds sentence |
| R9 | Initial SOC validation (DAYCENT 2021 vs. gSSURGO) not performed | Analysis agent performs if data available |
| — | 41+ Placeholder citation stubs in references.bib | Citation verification pass required |

---

## Minor issues (pre-submission polish)

- Figure 1 caption: "DAYMET" → "Daymet" (official capitalization)
- Figure 6 caption: "40-year repeating meteorological cycle" → "41-year" (1980–2020 inclusive = 41 years)
- Conclusions limitation (5): extend early-year overestimate caveat from yield to early-year SOC
- Permian Basin boundary provenance (`data/permian_basin_boundary_32614_1km.shp`) should be confirmed against USGS Province 044 DOI 10.5066/P19COBRF before submission

---

## Key constraints for next agent

- **No new DAYCENT runs are possible.** All analysis must use existing output files.
- **Wang is unavailable.** Do not assign any action to Wang; use "should be confirmed before submission."
- **Git identity:** Use env vars `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`.
- **Git locks (VirtioFS):** If `index.lock` or `HEAD.lock` exist, use `python3 -c "import os; os.rename('.git/index.lock', '.git/index.lock.bak')"` — `unlink` is not permitted.
- **Biber backend:** `biblatex` with `backend=biber`; compile with `pdflatex → biber → pdflatex → pdflatex`.

---

## File map

| File | Purpose |
|------|---------|
| `main_soc.tex` | Primary manuscript |
| `references.bib` | Bibliography (~920 lines; 41+ Placeholder stubs need real data) |
| `docs/ADVERSARIAL_REVIEW_R3.md` | Round 3 review findings (this session) |
| `docs/ANALYSIS_AGENT_HANDOFF.md` | Precise data requests for analysis agent (A1–A5, R9) |
| `docs/ADVERSARIAL_REVIEW.md` | Earlier review cycles (rounds 1–2) |
