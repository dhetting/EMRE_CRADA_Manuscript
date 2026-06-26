# Analysis Agent Handoff: Blocking Issues Requiring DAYCENT Re-runs or Postprocessing

**Manuscript:** `main_soc.tex` (branch `manuscript/soc-intro-results-slice`)  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)  
**Prepared by:** Manuscript agent, cycle 7, 2026-06-26  
**Status:** These issues cannot be resolved through prose editing alone. Each one requires either new DAYCENT runs, re-postprocessing of existing runs with different output configurations, or recovery of data files currently absent from the canonical results CSV (`results_05_07_2025.csv`).

---

## Priority 1 — Blocking (manuscript cannot be submitted without resolution)

### B1: No business-as-usual (BAU) continuation controls

**Problem:** The manuscript claims land-use conversion produces SOC gains, but no BAU control simulations (shrubland, barren land, or rainfed cotton continuing as-is from 2021–2100) were run. Without BAU controls, the reported ΔSOC values represent absolute change from initial conditions, not the incremental benefit attributable to land-use change. Any reviewer will demand this.

**What is needed:** Run DAYCENT from 2021–2100 for three BAU continuation scenarios:
1. Shrubland continuing as native shrubland (existing vegetation parameterization, no land-use change)
2. Barren land continuing as bare ground
3. Rainfed cropland continuing as dryland cotton under the same historical management schedule (no intensification)

The BAU ΔSOCs form the denominator for all incremental-change claims. The manuscript currently removes the "higher than BAU" language (cycle 7 fix) precisely because these runs don't exist. Once you have BAU runs, the result section can be rewritten to report ΔSOC_LUC = ΔSOC_perennial − ΔSOC_BAU.

**Files needed:** Existing crop.100, schedule files, soils.in, site files for the three BAU land covers. The BAU runs use the same spatial inputs as the 48 LUC scenarios; only the crop/schedule specification changes.

---

### B2: Layer-specific SOC output for proper 0–30 cm depth accounting

**Problem:** DAYCENT integrates SOC across all layers where root density is non-zero (0–105 cm in this parameterization). The current manuscript estimates 0–30 cm ΔSOC by multiplying total ΔSOC by 0.70, a root-density fraction extracted from `soils.in`. This is an approximation: it assumes SOC change is proportional to root density at every depth, which is not how DAYCENT's pool dynamics work. The CEC calculation and any depth-matched comparison to gSSURGO depend on having the correct 0–30 cm ΔSOC.

**What is needed:** Rerun DAYCENT postprocessing to extract layer-specific SOC from the `.lis` file (columns `somtc_1` through `somtc_N` for each layer) or, if `.lis` files were not archived, rerun DAYCENT with layer-specific SOC output enabled. Aggregate layers 1–5 (0–2, 2–5, 5–10, 10–20, 20–30 cm) to get ΔSOC(0–30 cm) directly.

Once you have ΔSOC(0–30 cm) per pixel per scenario, the CEC calculation and the baseline SOC comparison in the manuscript can both be corrected.

**Files needed:** Archived `.lis` output files (one per pixel per scenario), or rerun DAYCENT with `somtc` by-layer output enabled.

---

### B3: Biomass yield data recovery

**Problem:** The canonical results file (`results_05_07_2025.csv`) has all yield columns (`yield_mean_*`) set to zero for all rows. The yield data were either not extracted during postprocessing, not included in the output archive, or not produced by the DAYCENT run configuration for no-harvest scenarios (which is expected for no-harvest but not for harvested scenarios).

**What is needed:**
1. Check whether harvested scenarios produced non-zero `crmvst` or `cinput` values in the DAYCENT `.lis` files. If so, re-extract yield columns from the `.lis` archive.
2. If yield was never extracted, update the postprocessing pipeline (likely in `src/emre_analysis/`) to read the DAYCENT crop removal output variable.
3. Once yield data are recovered, the manuscript's biomass productivity section (currently absent due to zero yields) can be reinstated.

**Impact on manuscript:** Without yield data, the paper cannot quantify bioenergy output or report harvest-scenario biomass productivity. This is a significant gap for an AEE bioenergy paper.

---

### B4: Full crop parameter table with provenance

**Problem:** AEE reviewers will require a table of the DAYCENT `crop.100` parameter values for the MISC and SWI crop types used in this study, with source provenance for each parameter. The current manuscript cites `WangDou2017DAYCENT` and `WangDou2020AgronomyJ` for the parameter framework but provides no actual parameter values.

**What is needed:** Extract from `crop.100` all non-default parameters for `MISC` and `SWI` and create a supplementary table showing: parameter name, value used, base value (if from a G2 default), source (Wang et al. 2017/2020 calibration, DAYCENT developers, field measurement), and whether Permian Basin-specific adjustment was made. Flag parameters that were held at G2 defaults without validation.

This table should go in the Supplementary Information.

---

## Priority 2 — Major (required for scientific defensibility)

### M1: Initial SOC validation against gSSURGO at pixel scale

**Problem:** The manuscript has no validation of DAYCENT's 2021 simulated SOC against the gSSURGO observed SOC at pixel level. Without this, there is no evidence that the model is producing realistic starting conditions, and all projected ΔSOC values carry unquantified absolute bias.

**What is needed:** For each pixel, compare the DAYCENT simulated SOC at 0–30 cm in year 2021 (end of spin-up/historical baseline period) against the gSSURGO `soc0_30` Valu1 value. Report: mean bias (DAYCENT − gSSURGO), RMSE, correlation coefficient, and a spatial map of residuals. If bias exceeds ±20%, discuss the implications for ΔSOC projections.

**Note:** This requires the 0–30 cm layer-specific output from B2 above.

---

### M2: pH distribution audit for CEC PTF domain exceedance

**Problem:** The CEC pedotransfer function `CEC_OM = 30 × pH` is valid over pH 5.5–8.5 (Brady & Weil, Ch. 9). Figure 1 in the manuscript shows pH values reaching approximately 9.1 in the Permian Basin. At pH > 8.5, the PTF extrapolates beyond its calibration range and may substantially overestimate organic-matter CEC contribution (at high pH, OM surface charge is partly saturated).

**What is needed:**
1. From the gSSURGO `ph1to1h2o` per-pixel values, compute the fraction of pixels with pH > 8.5.
2. Estimate the CEC overestimation for those pixels (compare PTF extrapolation to literature values for calcareous alkaline soils, e.g., Sposito 1989 or Bohn et al. 2001).
3. Either (a) apply a cap at pH = 8.5 in the CEC calculation and recompute ΔCECs, or (b) add a quantitative statement in the manuscript about the fraction of pixels affected and the direction of bias.

---

### M3: CO₂ forcing schedule specification

**Problem:** The manuscript does not state what atmospheric CO₂ concentration schedule was used in the DAYCENT runs. DAYCENT's plant growth parameterization is sensitive to CO₂ (through photosynthesis and water-use efficiency), and the CO₂ forcing affects simulated SOC through NPP. Reviewers will ask.

**What is needed:** Check the `fix.100` or equivalent DAYCENT global parameter file for the CO₂ schedule used. Report whether runs used:
- Constant present-day CO₂ (~415 ppm, 2021 value)
- Historical observed CO₂ (Mauna Loa) through the spin-up period
- A projected future CO₂ trajectory (SSP scenario) for 2021–2100, or
- Some other specification

Add one sentence to the Methods section (Limitation: climate forcing design) stating the CO₂ schedule. This was flagged as missing in both adversarial reviews.

---

### M4: Paired factorial contrasts (not just directional rankings)

**Problem:** The manuscript describes which factor produces the "largest" SOC effect but does not quantify each factor's main effect or their interactions. The claim that irrigation is the "dominant modeled factor" is verbal rather than statistical. A factorial ANOVA or effect-size decomposition (e.g., partial η² per factor) would substantiate this.

**What is needed:** Using the scenario-mean ΔSOC values per pixel across the 48 combinations, compute:
1. Main effect sizes for crop type, fertilization, irrigation, and harvest regime
2. Two-way interaction terms (at minimum: crop × irrigation, fertilization × irrigation)
3. Report as a table in the Supplementary Information

This does not require new DAYCENT runs — it can be done from the existing `results_05_07_2025.csv` or its spatial equivalents.

---

### M5: Cumulative N₂O-N trajectories, not just 2100 endpoint

**Problem:** The manuscript reports only year-2100 N₂O flux values. AEE reviewers will want temporal trajectories (how does N₂O build or stabilize over the 79-year period?) and cumulative N₂O-N totals (g N m⁻² integrated 2021–2100), which are the quantity that matters for GHG accounting.

**What is needed:** From the DAYCENT `N2Oflux` annual output (which should be in the `.lis` or summary files), compute:
1. Mean annual N₂O-N flux by scenario and land cover at years 2030, 2050, 2070, 2100 (same time points as current Figure 3)
2. Cumulative N₂O-N (sum of annual fluxes 2021–2100) per scenario per pixel

Add a supplementary figure showing the temporal trajectory. This is analogous to what Figure 5 does for ΔSOC.

---

### M6: Area-weighted spatial summaries on eligible land area only

**Problem:** Barren land (114 km², 114 pixels) is included in all summary statistics and ranges. Because barren land is such a small fraction of the study area (0.06%) and lacks irrigation infrastructure, its inclusion in area-weighted means and scenario ranges creates misleading extreme values, particularly for irrigated barren-land scenarios.

**What is needed:**
1. Recompute area-weighted summary statistics excluding barren land from headline ranges
2. Report barren-land results separately (already flagged as "illustrative" in the manuscript, but this needs to be reflected in the numbers)
3. Consider whether to retain barren-land scenarios in the 48-combination count or move them to an appendix

This is a postprocessing task on the existing results CSV.

---

### M7: Full management schedule documentation (Supplementary)

**Problem:** The 16 scenarios are defined by combinations of fertilization rate (120 vs. 0 kg N ha⁻¹ yr⁻¹), irrigation trigger (50% AWC vs. none), and harvest regime (biomass removed vs. residues retained). However, the timing and distribution of management events within each growing season are not documented. A reviewer who wants to reproduce these results cannot do so without the `.sch` schedule files or an equivalent table.

**What is needed:** Create a Supplementary Table listing for each scenario: crop, fertilization rate and timing (month/day of application), irrigation trigger threshold and season, harvest date and residue fraction retained, and any inter-annual variation in the schedule. This can be extracted directly from the DAYCENT `.sch` files archived with the study.

---

### M8: Spatial input preparation workflow documentation

**Problem:** The manuscript does not describe how gSSURGO and Daymet spatial inputs were prepared for DAYCENT's per-pixel runs (regridding, gap-filling, CRS alignment, Valu1 table join). This is standard Methods content for a regional DAYCENT study and is currently absent.

**What is needed:** Add a Methods paragraph (or Supplementary section) describing:
1. How gSSURGO map units were aggregated/assigned to 1-km pixels (dominant component? area-weighted mean?)
2. How Daymet gridded weather was matched to the 1-km DAYCENT grid (bilinear interpolation? nearest-neighbor?)
3. CRS and datum: what projection was used (EPSG:32614 appears in the shapefile name), and how the 1-km raster was aligned
4. How missing gSSURGO values (if any) were handled

---

## Summary table

| ID   | Type          | Requires new runs? | Requires new postprocessing? | Manuscript impact |
|------|---------------|--------------------|------------------------------|--------------------|
| B1   | BAU controls  | YES (3 new runs)   | YES                          | Core results need reframing |
| B2   | Layer SOC     | Maybe (if .lis lost) | YES (re-extract from .lis) | CEC and baseline comparison |
| B3   | Yield recovery| NO                 | YES (re-extract from .lis)  | Missing results section |
| B4   | Param table   | NO                 | NO (from crop.100)          | Supplementary table |
| M1   | SOC validation| NO                 | YES (requires B2)           | Critical credibility check |
| M2   | pH audit      | NO                 | YES (from gSSURGO pH raster) | CEC validity quantification |
| M3   | CO₂ forcing   | NO                 | NO (from fix.100)           | One sentence in Methods |
| M4   | Factorial contrasts | NO           | YES (from existing CSV)     | Supplementary table |
| M5   | N₂O trajectories | NO              | YES (from .lis files)       | Supplementary figure |
| M6   | Barren-land stats | NO             | YES (filter existing CSV)   | Headline ranges change |
| M7   | Schedule docs | NO                 | NO (from .sch files)        | Supplementary table |
| M8   | Spatial workflow | NO              | NO (document existing code) | Methods paragraph |

---

## Files to locate before starting

- `results_05_07_2025.csv` — canonical results (exists, yield columns are zero)
- `.lis` output files (one per pixel per scenario) — check `data/` or `output/` directories
- `crop.100` — DAYCENT crop parameters for MISC and SWI
- `fix.100` — global parameters including CO₂ forcing schedule
- `.sch` schedule files for each of the 16 management scenarios
- `soils.in` or equivalent per-pixel soil parameter inputs
- gSSURGO `ph1to1h2o` raster (pixel-level pH values, EPSG:32614)
- `data/permian_basin_boundary_32614_1km.shp` — confirm matches `PermianBasinBoundaryUSGS` (DOI 10.5066/P19COBRF)
- `src/emre_analysis/cec.py` — existing CEC postprocessing (see NOTE at lines 282–288 of main_soc.tex for context on the original organic-N calculation issue)

---

## What was already fixed in manuscript cycles 1–7 (do not re-raise)

- N₂O unit errors — resolved (g N₂O-N m⁻² yr⁻¹ confirmed from DAYCENT docs)
- Organic-N storage/mineralization section — removed (see NOTE at lines 282–288 of main_soc.tex)
- Em dashes in body prose — removed
- C:N NOTE comment bug — fixed
- `\nocite{*}` — removed (cycle 7)
- Daymet citation → Thornton2022Daymet (V4 R1) — done (cycle 7)
- Davis2012 → Davis2010Comparative — done (cycle 7)
- Five undefined bib keys → stubs added (cycle 7)
- BAU language removed from conclusions — done (cycle 7)
- Invalid 0–105 cm vs 0–30 cm depth comparison — removed, NOTE added (cycle 7)
- "primary driver" softened to "dominant modeled factor in this factorial design" — done (cycle 7)
- Irrigation N₂O mechanism hedged — done (cycle 7)
- "retaining nitrogen in plant-available mineral forms" overclaim — removed (cycle 7)
- No-harvest ≠ bioenergy production clarified — added (cycle 7)
- Miscanthus–switchgrass SOC gap parameterization caveat — added (cycles 4–5)
- Figure 6 biomass yield note — added ("Biomass yield is not included in this dataset")
