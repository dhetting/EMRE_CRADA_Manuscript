# Analysis Agent Handoff: Data and Output Requests for main_soc.tex

**Manuscript:** `main_soc.tex` (branch `manuscript/soc-intro-results-slice`)  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)  
**Prepared by:** Manuscript agent, cycle 7–8, 2026-06-26  
**For:** Analysis agent with access to DAYCENT output archive, input data files, and parameter files

Each section below states exactly what the manuscript needs, what file or variable to extract it from, and what format to return. If a requested file or variable does not exist, say so explicitly — the manuscript agent will handle the text response.

---

## R1 — CO₂ forcing schedule (Methods, one sentence)

**What the manuscript needs:** A single sentence stating what atmospheric CO₂ concentration or trajectory was used in the 2021–2100 DAYCENT simulations.

**Where to look:**
- `fix.100` global parameter file — look for the `CO2` or `ATMOS_CO2` parameter or equivalent
- Alternatively, the `.sch` schedule files may specify a CO₂ override per scenario

**Return format:** State the CO₂ schedule as one of:
1. Constant value (e.g., "415 ppm, representative of 2021 atmospheric CO₂")
2. Historical observed trajectory (Mauna Loa) through spin-up, then held constant at a specified value
3. SSP scenario trajectory (specify which SSP and source)
4. Not specified / default DAYCENT behavior (explain what the default is)

---

## R2 — Crop parameter table (Supplementary)

**What the manuscript needs:** A table of DAYCENT `crop.100` parameters for the MISC (miscanthus) and SWI (switchgrass) crop entries, suitable for a Supplementary Information table.

**Where to look:**
- `crop.100` in the DAYCENT parameter directory used for these runs
- Focus on parameters that differ from DAYCENT defaults or from the G2 (warm-season grass) base parameterization

**Return format:** A two-column table (MISC, SWI) listing:
- Parameter name as it appears in `crop.100`
- Value used for MISC
- Value used for SWI
- Brief description of what the parameter controls
- Source/provenance if known (Wang et al. 2017/2020 calibration, DAYCENT default, literature value)

Flag any parameters held at G2 defaults without Permian Basin-specific adjustment.

---

## R3 — Management schedule documentation (Supplementary)

**What the manuscript needs:** A table documenting the timing and magnitude of management events in each of the 16 scenarios, for inclusion in Supplementary Information.

**Where to look:**
- `.sch` schedule files — one per scenario (16 total), likely named by scenario combination
- Each `.sch` file specifies fertilizer application events (rate, timing), irrigation triggers, and harvest events

**Return format:** A table with one row per scenario (16 rows) and columns:
- Scenario ID (as used in the results CSV)
- Crop (MISC / SWI)
- Fertilization rate (kg N ha⁻¹ yr⁻¹) and application month/day
- Irrigation trigger (% AWC threshold)
- Harvest month/day (or "none" for no-harvest scenarios)
- Residue fraction retained post-harvest

---

## R4 — Factorial effect sizes from existing results (Results / Supplementary)

**What the manuscript needs:** Quantification of each management factor's main effect on ΔSOC at year 2100, to replace the verbal claim that "irrigation is the dominant modeled factor."

**Where to look:**
- `results_05_07_2025.csv` — this is the canonical results file referenced in the manuscript
- Need the scenario-mean ΔSOC at year 2100 by scenario and land cover

**Return format:**
1. The mean ΔSOC at 2100 for each of the 48 scenario–land-cover combinations (or a pivot table: 16 scenarios × 3 land covers)
2. Main effect of each factor computed as: mean ΔSOC when factor = high minus mean ΔSOC when factor = low, averaged across all other factor levels:
   - Irrigation effect: irrigated mean − rainfed mean (Mg C ha⁻¹)
   - Harvest effect: no-harvest mean − harvested mean (Mg C ha⁻¹)
   - Fertilization effect: fertilized mean − unfertilized mean (Mg C ha⁻¹)
   - Crop effect: MISC mean − SWI mean (Mg C ha⁻¹)
3. If possible, two-way interactions: irrigation × crop, and irrigation × harvest

This does not require new runs — it can be computed from the existing CSV.

---

## R5 — Barren-land exclusion from headline ranges (Results)

**What the manuscript needs:** The scenario-mean ΔSOC range (14 to 85 Mg C ha⁻¹) and area-weighted range (20 to 81 Mg C ha⁻¹) recomputed excluding barren-land pixels, so that headline numbers reflect the two ecologically meaningful land covers (shrubland and cropland) without the 114-pixel barren outlier.

**Where to look:**
- `results_05_07_2025.csv` — filter to rows where land cover ≠ barren

**Return format:**
- Min and max scenario-mean ΔSOC at 2100 across shrubland and cropland scenarios only (Mg C ha⁻¹)
- Area-weighted mean ΔSOC across shrubland and cropland only (using 158,852 km² and 23,609 km² weights)
- For comparison: the same stats including barren (to confirm the current manuscript numbers)
- The barren-land scenario-mean ΔSOC range separately (for reporting as an "illustrative" aside)

---

## R6 — Layer-specific ΔSOC at 0–30 cm (Methods / Results / CEC section)

**What the manuscript needs:** A defensible estimate of ΔSOC in the 0–30 cm interval to replace the current root-fraction proxy (0.70 × ΔSOC₀₋₁₀₅). This affects the CEC calculation and any depth-matched baseline comparison.

**Where to look:**
- DAYCENT `.lis` output files — look for per-layer SOC columns. In DayCent 4 `.lis` files these are typically labeled `somtc_1`, `somtc_2`, etc., or `som1c_1`, `som1c_2`, etc., one column per soil layer
- Layers 1–5 (0–2, 2–5, 5–10, 10–20, 20–30 cm) summed give the 0–30 cm total
- If `.lis` files do not have per-layer somtc columns, report that explicitly

**Return format:**
- If per-layer data exists: mean ΔSOC(0–30 cm) per scenario and land cover at years 2030, 2050, 2100 (same structure as the existing ΔSOC₀₋₁₀₅ table)
- The implied root-fraction (ΔSOC₀₋₃₀ / ΔSOC₀₋₁₀₅) per scenario — compare to the assumed 0.70 to assess whether the proxy was reasonable
- If per-layer data does not exist: confirm that the root-fraction method is the only available approach

---

## R7 — Biomass yield from harvested scenarios (Results)

**What the manuscript needs:** Biomass yield (Mg dry matter ha⁻¹ yr⁻¹) for harvested scenarios, to populate a results section on bioenergy productivity that was removed because the CSV yield columns are zero.

**Where to look:**
- `results_05_07_2025.csv` — check `yield_mean_*` columns: confirm whether they are truly zero for all rows, or only for no-harvest scenarios
- DAYCENT `.lis` output files — look for `crmvst` (crop material removed via harvest, g C m⁻²) or `crpval` (harvested carbon) for harvested scenarios
- The DAYCENT schedule files may also log harvest events with associated biomass quantities

**Return format:**
- Mean annual harvested biomass (Mg dry matter ha⁻¹ yr⁻¹) per harvested scenario and land cover at years 2030, 2050, 2100
- If extracting from `.lis`: confirm the variable name and units used (g C m⁻² → convert to Mg dry matter ha⁻¹ using carbon fraction ≈ 0.45)
- Confirm: are yield columns truly zero in the CSV for ALL rows, including harvested scenarios? Or only for no-harvest rows?

---

## R8 — BAU continuation scenario outputs (Results / Conclusions)

**What the manuscript needs:** ΔSOC trajectories for business-as-usual (BAU) land-cover continuations (no land-use change), to allow computing the incremental SOC effect attributable to land-use conversion. This is currently flagged as a blocking issue.

**Where to look:**
- DAYCENT run archive — look for runs labeled "BAU", "control", "continuation", or "baseline" for each of the three starting land covers (shrubland, cropland/cotton, barren)
- These would be runs from 2021–2100 maintaining the current land cover without converting to MISC or SWI

**Return format:**
- If BAU runs exist: scenario-mean ΔSOC (from 2021 initial conditions) per land cover at 2030, 2050, 2100, with pixel-level statistics (mean, 25th, 75th percentile)
- If BAU runs do not exist: confirm explicitly. The manuscript will then state that BAU comparison is not possible with current data and must be included as a named limitation.

---

## R9 — Initial SOC validation: DAYCENT 2021 vs. gSSURGO (Methods / Supplementary)

**What the manuscript needs:** A validation comparison of DAYCENT's simulated SOC at 0–30 cm in year 2021 (end of the historical baseline period) against gSSURGO observed values, to assess whether the model's starting conditions are realistic.

**Where to look:**
- DAYCENT output at year 2021 (or the last year of the historical baseline before 2021 LUC): somtc for layers 1–5 summed to 0–30 cm (requires R6 above)
- gSSURGO Valu1 table: `soc0_30` field (g C m⁻², convertible to Mg C ha⁻¹ by ÷ 100)
- Both are at 1-km pixel resolution; comparison is pixel-by-pixel

**Return format:**
- Mean bias: mean(DAYCENT₂₀₂₁ − gSSURGO) in Mg C ha⁻¹
- RMSE: root-mean-square error in Mg C ha⁻¹
- Pearson r between DAYCENT and gSSURGO across pixels
- Fraction of pixels where DAYCENT is within ±20% of gSSURGO
- Breakdown by land cover (shrubland vs. cropland vs. barren)
- If possible: a scatter plot (DAYCENT vs. gSSURGO, one point per pixel, colored by land cover)

Note: this depends on R6 for the 0–30 cm DAYCENT SOC; if per-layer data is unavailable, report that R9 is blocked by R6.

---

## R10 — pH exceedance fraction for CEC PTF validity (Methods / CEC section)

**What the manuscript needs:** The fraction of study-area pixels where soil pH exceeds 8.5 (the upper limit of the CEC pedotransfer function `CEC_OM = 30 × pH` per Brady & Weil). Above pH 8.5 the PTF extrapolates beyond calibration.

**Where to look:**
- gSSURGO per-pixel `ph1to1h2o` values (1:1 water ratio pH), at 1-km resolution
- Same spatial grid as the DAYCENT runs

**Return format:**
- Fraction (%) of pixels with pH > 8.5
- Mean pH of the exceedance pixels
- Estimated direction and approximate magnitude of CEC bias in exceedance pixels (qualitative or quantitative: how much does CEC_OM at pH 9.0 differ from the PTF value vs. a literature-based calcareous-soil value?)
- If pH data is available: a simple histogram of the pixel pH distribution

---

## R11 — N₂O cumulative flux trajectories (Results / Supplementary)

**What the manuscript needs:** Temporal N₂O trajectories and cumulative N₂O-N totals per scenario, to supplement the year-2100 endpoint values currently in the manuscript.

**Where to look:**
- DAYCENT `.lis` or annual summary files — look for `N2Oflux` (g N m⁻² yr⁻¹) per pixel per year, 2021–2100
- The existing results CSV may have only the year-2100 snapshot; annual values need the `.lis` files

**Return format:**
- Mean annual N₂O-N flux per scenario and land cover at years 2030, 2050, 2070, 2100
- Cumulative N₂O-N (sum of annual fluxes 2021–2100, kg N ha⁻¹) per scenario and land cover
- If annual `.lis` files are not archived: confirm that only the 2100 endpoint is available

---

## Priority order

If the analysis agent must triage, address in this order:

1. **R1** (CO₂ forcing) — one lookup, one sentence; low effort, blocks a methods gap
2. **R4** (factorial effects from CSV) — no new runs, uses existing data, substantiates "irrigation is dominant"
3. **R5** (barren-land exclusion from CSV) — no new runs, quick filter
4. **R2** (crop parameter table from crop.100) — no new runs, needed for reproducibility
5. **R3** (schedule documentation from .sch files) — no new runs, needed for reproducibility
6. **R6** (layer-specific SOC from .lis) — needed for CEC defensibility; high impact if available
7. **R7** (biomass yield from .lis) — restores missing results section if available
8. **R8** (BAU controls) — highest scientific impact, but requires existing runs or new runs
9. **R9** (SOC validation) — depends on R6
10. **R10** (pH exceedance) — from gSSURGO, moderate effort
11. **R11** (N₂O trajectories) — from .lis files, moderate effort if archived

---

## Context the analysis agent needs

**Spatial domain:** 182,575 km² Permian Basin, 1-km grid, EPSG:32614. Three land covers: shrubland (158,852 pixels), rainfed cropland (23,609 pixels), barren (114 pixels).

**Scenario structure:** 16 scenarios = 2 crops (MISC, SWI) × 2 fertilization levels (120 kg N ha⁻¹ yr⁻¹ vs. 0) × 2 irrigation regimes (50% AWC trigger vs. none) × 2 harvest regimes (biomass removed vs. retained). 48 total scenario–land-cover combinations.

**Simulation period:** 2021–2100 (79 years). Spin-up: 3150 BCE to 2020 CE for shrubland and barren; cropland additionally has a historical cotton baseline 1851–2020. Meteorological forcing: Daymet V4 R1 daily data (1980–2020) repeated periodically.

**DAYCENT version:** DDcentEVI revision 279.

**Canonical results file:** `results_05_07_2025.csv` — scenario-mean statistics per scenario–land-cover combination. Yield columns (`yield_mean_*`) are currently zero for all rows; this may be a postprocessing omission rather than a true zero.

**Key output variables needed:**
- `somtc` — total SOC (g C m⁻²) per layer per year
- `N2Oflux` — annual N₂O flux (g N m⁻² yr⁻¹)  
- `irrtot` — annual irrigation total (cm H₂O)
- `crmvst` — harvested crop material (g C m⁻²)
- Layer depth profile: 0–2, 2–5, 5–10, 10–20, 20–30, 30–45, 45–60, 60–75, 75–90, 90–105 cm (10 layers to root zone)

**Manuscript placeholder keys still needing real citations:** `PermianBasinClimatePlaceholder`, `EatonSalinityPlaceholder`, `WangDAYCENTArchivePlaceholder`, `BlancoCanaquisPlaceholder2011`, `VerhoefPlaceholder2006` — if Wang's archive includes any internal reports or data releases that could fill these, please provide the bibliographic details.

---

## What was already resolved (do not re-raise)

- N₂O units confirmed (g N₂O-N m⁻² yr⁻¹)
- Organic-N storage/mineralization section removed from manuscript
- Daymet citation updated to Thornton et al. 2022 V4 R1 (DOI 10.3334/ORNLDAAC/2129)
- Davis2012 corrected to Davis2010 (DOI 10.1007/s10021-009-9306-9)
- BAU language, invalid depth comparison, and "primary driver" overclaims removed from manuscript prose
- `\nocite{*}` removed
- Five undefined bib stubs added to allow compilation
