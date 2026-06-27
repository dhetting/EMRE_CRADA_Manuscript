# Analysis Agent Handoff: Data and Output Requests for main_soc.tex

**Manuscript:** `main_soc.tex` (branch `manuscript/soc-intro-results-slice`)  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)  
**Prepared by:** Manuscript agent, cycle 8, 2026-06-27  
**For:** Analysis agent with access to DAYCENT output archive, input data files, and parameter files

**Constraint:** No new DAYCENT runs are possible. Wang is unavailable. All requests target data that already exist in the archive (output files, parameter files, input databases).

Each section below states exactly what the manuscript needs, what file or variable to extract it from, and what format to return. If a requested file or variable does not exist, say so explicitly — the manuscript agent will handle the text response.

---

## Previously Resolved (do not re-raise)

The following were addressed by the analysis agent's prior update:

- **R1 ✓** CO₂ forcing: disabled (CO₂ Systems = -1 in all schedule files). Documented in manuscript.
- **R2 ✓ partial** PRDX(1) values: disclosed in manuscript (MISC = 3.5, SG3 = 2.75). **Supp Table S1 still needed** — see A2 below.
- **R3 ✓** Management schedule: dates, rates, events documented in manuscript Methods.
- **R4 ✓** Factorial effects: main effects quantified (+26.1, +12.4, +9.0, +3.5 Mg C/ha) and in manuscript.
- **R5 ✓** Barren-land: documented as <0.1%, range noted separately.
- **R6 ✓** Layer-specific SOC: validated depth fractions from 182,575-pixel full-basin re-runs.
- **R7 ✓** Biomass yield: restored from `agcacc`, 1.5–6.7 Mg d.m. ha⁻¹ yr⁻¹ in manuscript.
- **R8 ✓** BAU controls: in manuscript (shrubland +0.95, cropland −1.25, barren +0.64 Mg C/ha at 2100).
- **R11 ✓** N₂O trajectories: cumulative (10–59 kg N₂O-N/ha) and annual endpoint (0.011–0.068 g N m⁻² yr⁻¹) in manuscript.
- Daymet citation updated, Davis2010 corrected, `\nocite{*}` removed, 5 stub bib entries added.

---

## Open Requests — Priority Order

### A1 (BLOCKING) — Fix pH extraction and recompute all CEC values

**Why blocking:** The gSSURGO `ph1to1h2o` values in the H5 resource file show ~40% of pixels with pH < 5.5. Permian Basin soils are predominantly alkaline to neutral (Figure 1 shows ~5.5–9.1 range); the sub-5.5 fraction is almost certainly an encoding or extraction error. All ΔCEC values in the manuscript are computed using these pH values and are therefore systematically biased for ~40% of the domain.

**What to do:**
1. Identify the source of the pH < 5.5 values in `DAYCENT_DATA.h5` (or equivalent). Is it:
   - A unit mismatch (e.g., pH × 10 stored as integer, then read without dividing)?
   - A fill-value (e.g., −9999) treated as a real pH?
   - A spatial join error (wrong map units assigned)?
2. Re-extract `ph1to1h2o` from the authoritative gSSURGO source for the study domain (182,575 pixels, EPSG:32614).
3. Report the corrected pixel pH distribution: mean, median, IQR, fraction >8.5, fraction <5.5 (should be near zero).
4. Recompute all ΔCEC values using corrected per-pixel pH and the PTF `CEC_OM = 30 × pH` (cmolc/kg OM), clipped to the valid PTF range [5.5, 8.5].
5. Return corrected ΔCEC ranges for:
   - All 48 scenario–land-cover combinations (min, max, mean at year 2100)
   - Harvest scenarios only (min–max)
   - No-harvest scenarios only (min–max)
   - Scenario means: harvest mean, no-harvest mean
   - Fraction of pixels where PTF is extrapolated (pH > 8.5)

**Return format:** Replace the current ΔCEC range (0.9–6.6 cmolc/kg) with corrected values. Provide a note on the encoding error found (1–2 sentences for inclusion in the manuscript or supplementary methods).

---

### A2 (BLOCKING) — Full crop.100 parameter table for Supplementary Table S1

**Why needed:** Both the Results (line 166) and Conclusions (line 293) cite "Supplementary Table S1 for full parameter listing" of DAYCENT crop.100 entries. This table does not exist. Without it:
- The "all remaining parameters identical" claim is unverifiable.
- The submission has a broken supplementary reference.

**What to do:**
1. Open `crop.100` from the DAYCENT parameter directory used for these runs.
2. Extract the full entries for **MISC** (miscanthus) and **SG3** (or SWI — switchgrass, whichever key is used in the schedule files).
3. List every parameter name, value for MISC, value for SG3, and a brief description.
4. Flag any parameters that differ between MISC and SG3 beyond PRDX(1).

**If other parameters differ:** The manuscript's claim "all remaining crop.100 parameters were held identical between the two entries in this simulation archive" (lines 166, 293) must be revised. Report which parameters differ and by how much — the manuscript agent will update the text.

**Return format:** A table suitable for LaTeX (`tabular` or `longtable`) with columns: Parameter | MISC value | SG3 value | Description | Notes (e.g., "differs", "DAYCENT default", "Wang 2017 calibration").

---

### A3 (MAJOR) — Confirm agcacc extraction method

**Why needed:** The manuscript states biomass yield comes from DAYCENT `agcacc` (g C m⁻² yr⁻¹, carbon fraction 0.45) and a `yield_annual_harvest.csv` file is referenced in an internal NOTE. However, `agcacc` in DAYCENT is typically a **running cumulative** above-ground carbon accumulated since simulation start — not an annual rate. If the yield calculation used `agcacc` directly as a rate, the values would be the cumulative total to that year, not the annual flux.

**What to do:**
1. Confirm whether `agcacc` in the `harvest_*.h5` files is:
   - An annual rate (g C m⁻² yr⁻¹ for that year), or
   - A cumulative sum (g C m⁻² accumulated since year 1).
2. If cumulative: confirm that `yield_annual_harvest.csv` was correctly computed as `agcacc(t) − agcacc(t−1)` divided by 0.45, then unit-converted.
3. Provide the calculation snippet (pseudocode or actual Python/R code) used to produce the yield values.
4. Confirm the resulting annual yield range matches the manuscript's stated 1.5–6.7 Mg d.m. ha⁻¹ yr⁻¹.

**Return format:** One paragraph describing the extraction, suitable for addition to the manuscript Methods section.

---

### A4 (MAJOR) — Verify Anderson-Teixeira 5–30 Mg C/ha cumulative range

**Why needed:** Line 187 of the manuscript cites "cumulative SOC gains of approximately 5–30 Mg C/ha over 5–20 years" from AndersonTeixeira2009SOC (GCB Bioenergy 1:75–96) and Gelfand2013MarginalLands. An existing NOTE (lines 188–193) flags that this range "should be verified against the source table before final submission." If the range is wrong, the comparison to our 79-year projections is invalid.

**What to do:**
1. Access Anderson-Teixeira et al. 2009, GCB Bioenergy 1:75–96, Table 2 (or the relevant results table).
2. Identify which rows correspond to perennial grasses (miscanthus, switchgrass) or equivalent crops over 5–20 years.
3. Report the actual SOC gain range from those rows (Mg C/ha, depth interval if specified, number of years).
4. Confirm or correct the "5–30 Mg C/ha" range.

**Return format:** The verified range and the source rows (crop, years, SOC, depth), as a one-sentence update to the manuscript.

---

### A5 (MAJOR) — Explain early-year N₂O elevation driving cumulative discrepancy

**Why needed:** The manuscript states cumulative N₂O-N over 2021–2100 is 10–59 kg N₂O-N ha⁻¹. Back-calculating from endpoint annual flux (0.011–0.068 g N m⁻² yr⁻¹ = 0.11–0.68 kg/ha/yr) × 79 years gives 8.7–53.7 kg/ha — 10–15% lower than the stated cumulative totals. This suggests higher early-year flux.

**What to do:**
1. From the annual N₂O trajectory data (yearly_*.h5 or equivalent), compute the mean N₂O-N flux for years 2021–2030 vs. 2070–2100 across scenarios.
2. Confirm whether early-year flux is elevated (consistent with nitrogen cycling through newly establishing root systems).
3. Provide one sentence suitable for inclusion in the N₂O section explaining the discrepancy.

**Return format:** Early-year vs. late-year flux values (Mg N₂O-N ha⁻¹ yr⁻¹, mean across scenarios) and an explanatory sentence.

---

### R9 (OPEN FROM PRIOR HANDOFF) — Initial SOC validation: DAYCENT 2021 vs. gSSURGO

**Status:** Not performed. Disclosed in limitations (Conclusions line 297).

**What to do (if possible):**
1. Extract DAYCENT simulated SOC at 0–30 cm at year 2021 (end of spin-up/historical baseline) — requires per-layer output (already available from the full-basin re-runs that generated depth fractions).
2. Compare to gSSURGO Valu1 `soc0_30` field (g C m⁻², convert to Mg C/ha by ÷ 100) at the same 1-km pixel grid.
3. Report: mean bias, RMSE, Pearson r, fraction within ±20%, breakdown by land cover.

**If per-layer 2021 SOC data is available:** This validation should be performed and reported in Supplementary Information. The Conclusions limitations item (1) can then be updated to note that initial SOC validation was performed and cite the supplementary.

**If not available:** Confirm explicitly; no manuscript change needed beyond the current limitations statement.

---

## Citation Verification Pass (deferred, low priority for this agent)

Lines 300–345 of `main_soc.tex` contain a TODO block listing 41+ Placeholder citation stubs that must be replaced with verified bibliographic data before AEE submission. The most critical (cited for specific quantitative claims) are:

- `DelGrosso2005Placeholder` — DAYCENT N₂O r²=0.74 national validation
- `Parton1987Placeholder` — DAYCENT SOM pool parameterization
- `NRCSgSSURGOPlaceholder` — gSSURGO database citation
- `NASCDLPlaceholder` — NASS CDL citation
- `BradyWeilSoilsPlaceholder` — CEC_OM = 30 × pH coefficient source

If the analysis agent has access to the project's bibliography sources, resolving these stubs would eliminate the final pre-submission blocker.

---

## Context for Analysis Agent

**Spatial domain:** 182,575 km² Permian Basin, 1-km grid, EPSG:32614. Three land covers: shrubland (158,852 pixels), rainfed cropland (23,609 pixels), barren (114 pixels).

**Scenario structure:** 16 scenarios = 2 crops (MISC, SG3/SWI) × 2 fertilization levels × 2 irrigation regimes × 2 harvest regimes. 48 total scenario–land-cover combinations.

**Simulation period:** 2021–2100 (79 years). DAYCENT version: DDcentEVI revision 279. Meteorological forcing: Daymet V4 R1 daily data (1980–2020) repeated periodically.

**Canonical results file:** `results_05_07_2025.csv`

**Key DAYCENT output variables:**
- `somtc` — total SOC (g C m⁻²) per layer per year
- `N2Oflux` — annual N₂O flux (g N m⁻² yr⁻¹)
- `irrtot` — annual irrigation total (cm H₂O)
- `agcacc` — above-ground C accumulated (confirm: cumulative or annual rate?)
- Per-layer SOM pools: `som1c`, `som2c`, `metabc`, `strmac` (layers 0–10 and 10–30 cm)

**Data files of interest:**
- `DAYCENT_DATA.h5` (or equivalent H5 resource file) — gSSURGO inputs including `ph1to1h2o`
- `harvest_*.h5` — agcacc output for harvested scenarios
- `yearly_*.h5` — annual N₂O flux trajectories
- `crop.100` — DAYCENT crop parameter file
- `results_05_07_2025.csv` — canonical scenario-mean results
