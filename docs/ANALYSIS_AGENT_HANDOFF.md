# Analysis Agent Handoff: Data and Output Requests for main_soc.tex

**Manuscript:** `main_soc.tex` (branch `manuscript/soc-intro-results-slice`)  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)  
**Last updated:** 2026-06-28 (commit c5792c7)  
**For:** Analysis agent with access to DAYCENT output archive, input data files, and parameter files

**Constraint:** New DAYCENT runs ARE permitted for additional analysis. Wang is unavailable — do not assign action to Wang. All prior blocking requests have been resolved; only one data-dependent item remains open.

---

## Previously Resolved — Do Not Re-Raise

All items below are complete. Associated manuscript text and supplementary tables have been written and committed.

| Request | Resolution |
|---------|------------|
| **R1** CO₂ forcing disabled | Confirmed (CO₂ Systems = −1 in all schedule files). In manuscript Methods. |
| **R2/A2** Full crop.100 Supplementary Table S1 | `supplementary_s1.tex` exists: all 112 parameters for MISC and SG3. Only PRDX(1) differs (3.5 vs 2.75). Cited in manuscript. |
| **R3** Management schedule | Fully documented in Methods (dates, rates, events, BAU). |
| **R4** Factorial main effects | +26.1, +12.4, +9.0, +3.5 Mg C/ha confirmed and in manuscript. |
| **R5** Barren-land fraction | <0.1%, documented. |
| **R6** Layer-specific SOC depth fractions | Validated from 182,575-pixel full-basin re-runs. |
| **R7/A3** Biomass yield from `agcacc` | 1.5–6.7 Mg d.m. ha⁻¹ yr⁻¹ in manuscript. Extraction method confirmed: `agcacc` is annual accumulator resetting after each harvest; converted via carbon fraction 0.45. |
| **R8** BAU controls | Shrubland +0.95, cropland −1.25, barren +0.64 Mg C/ha at 2100. In manuscript. |
| **R9** Initial SOC validation | DAYCENT 2021 initial SOC = 5.7 Mg C/ha (active+slow pools, 0–30 cm) vs. gSSURGO median 20.7 Mg C/ha. 3.6-fold gap explained by passive pool exclusion. Documented in manuscript Discussion. |
| **R11** N₂O trajectories | Cumulative 10–59 kg N₂O-N/ha; annual endpoint 0.011–0.068 g N m⁻² yr⁻¹. In manuscript. |
| **A1** pH extraction bug (B1) | Fill-corrected: 8% of pixels below PTF validity floor (pH 5.5), clipped; CEC bias <1% of domain. ΔCEC values corrected to 0.9–7.4 cmolc/kg. In manuscript. |
| **A5** N₂O cumulative discrepancy | Resolved: cumulative exceeds endpoint×79 because year 2100 falls in a lower-flux phase of the 41-year repeating meteorological cycle (not a declining trend). Rising trend (0.035→0.041 g N₂O-N m⁻² yr⁻¹) confirmed in manuscript. |
| **A6 / OE-4** PET from Daymet | Hargreaves-Samani PET computed on HPC from Daymet 1980–2020 for 5000 Permian Basin pixels: spatial mean = 1543 mm/yr. Manuscript updated from "≈1700" to "≈1540 mm/yr (Daymet H-S; P-M ≈10–15% higher)." Thornton2022Daymet cited. Results in `outputs/tables/pet_hargreaves_permian.csv`. |
| **OE-5** Spatial IQR | Area-weighted IQR ≈ 25–60 Mg C/ha, CV ≈ 0.60. In manuscript. |
| **OE-6** Literature table (Supp S2) | `supplementary_s2.tex` exists: comparison to 5 published field/modeling studies. |
| **OE-7** Scenario-mean spatial map | Figure 9: 3-panel (scenario-mean, highest, lowest ΔSOC at 2100). R script at `analysis/figures/figure9_scenario_mean_soc.R`. |
| **OE-8** ΔCEC pH sensitivity | 8% of pixels clipped pH 5.04→5.5; CEC bias <1% of domain. In manuscript. |
| **R4-D2** PRDX sensitivity | 8 Mg C/ha per PRDX unit, ±7% sensitivity. In manuscript. |
| **R4-D3** soiln.out ammonium | Exploratory 4-scenario 200-pixel results completed. |
| **R4-D4** Climate perturbation | Table 1 (±20% precip, +2°C). In manuscript. |
| **R4-D5** irrtot units | Corrected to 88 cm/yr (IQR 73–106). In manuscript. |

---

## Citation Verification Status — Complete (No Action Needed)

All active citation keys in `main_soc.tex` have been verified against primary sources through the manuscript agent's citation verification session (commits bb13a1d → a3d0fa7). Key items:

- `DelGrosso2005Placeholder` — r²=0.74 CONFIRMED from EPA HERO.
- `WangDou2017DAYCENT` — CONFIRMED (DOI 10.1007/978-3-319-43394-3_15).
- `WangDou2020AgronomyJ` — CONFIRMED (DOI 10.1002/agj2.20390).
- `LiuGreaver2009Placeholder` — citation mismatch at line 174 FIXED: replaced with `AinsworthLong2005FACE` (Ainsworth & Long 2005, New Phytologist 165:351–371) for the C4 CO₂ response claim. LiuGreaver correctly retained at line 255 for N₂O from fertilizer.
- `AinsworthLong2005FACE` — ADDED to references.bib; DOI 10.1111/j.1469-8137.2004.01224.x confirmed.
- `BradyWeilSoilsPlaceholder` — book verified (ISBN 978-0133254488, Brady & Weil 15th ed. 2016); specific page for CEC_OM=30×pH requires physical book access (author item, not analysis agent item).
- `Johnson2007BiomassCropping` — DOI resolves to Soil and Tillage Research (PII S0167198706001450); title/author names not confirmable from open sources. Author must verify before submission.
- Uncited Placeholder stubs in references.bib — do not block submission; can be cleaned up in a future pass.

Full verification report: `docs/CITATION_VERIFICATION_REPORT.md`.

---

## One Remaining Open Request

### A4 — Verify Anderson-Teixeira 5–30 Mg C/ha cumulative range

**Status:** Still open. An existing NOTE in `main_soc.tex` (lines after line 210) flags this as pending.

**Why needed:** Line ~210 of the manuscript cites "cumulative SOC gains of approximately 5–30 Mg C/ha over 5–20 years" from `AndersonTeixeira2009SOC` (GCB Bioenergy 1:75–96). The NOTE flags that this range "should be verified against the source table before final submission." If the range is wrong, the comparison to this study's 79-year projections is invalid.

**What to do:**
1. Access Anderson-Teixeira et al. 2009, GCB Bioenergy 1:75–96, Table 2 (or the relevant results table).
2. Identify rows for perennial grasses (miscanthus, switchgrass, or equivalent crops) over 5–20 years.
3. Report the actual SOC gain range from those rows (Mg C/ha, depth interval if specified, number of years).
4. Confirm or correct the "5–30 Mg C/ha" range stated in the manuscript.

**Return format:** Verified range and source rows (crop, years, SOC Mg C/ha, depth), plus a one-sentence update to replace the NOTE in the manuscript.

**If full text is inaccessible:** Confirm explicitly so the NOTE can be flagged as a remaining author-verification item.

---

## Context for Analysis Agent

**Spatial domain:** 182,575 km², Permian Basin, 1-km grid, EPSG:32614. Three starting land covers: shrubland (158,852 px), rainfed cropland (23,609 px), barren (114 px).

**Scenario structure:** 16 scenarios = 2 crops (MISC, SG3/SWI) × 2 fertilization × 2 irrigation × 2 harvest. 48 total scenario–land-cover combinations.

**Simulation period:** 2021–2100 (79 years). DAYCENT DDcentEVI revision 279. Meteorological forcing: Daymet V4 R1 (1980–2020) repeated periodically.

**Canonical results file:** `results_05_07_2025.csv`

**Key numbers for cross-checking:**

| Claim | Value | Source |
|-------|-------|--------|
| ΔSOC range (all 48 combos) | 14–85 Mg C/ha at 2100 | soc_delta_summary.csv |
| Irrigation main effect | +26.1 Mg C/ha | soc_delta_summary.csv |
| Residue retention effect | +12.4 Mg C/ha | soc_delta_summary.csv |
| Crop type effect | +9.0 Mg C/ha | soc_delta_summary.csv |
| Fertilization effect | +3.5 Mg C/ha | soc_delta_summary.csv |
| Modeled irrigation demand | 88 cm/yr (IQR 73–106) | canonical parquet irrtot |
| Potential ET (H-S, Daymet) | ≈1540 mm/yr | pet_hargreaves_permian.csv |
| Harvested yield range | 1.5–6.7 Mg d.m. ha⁻¹ yr⁻¹ at 2100 | yield_annual_harvest.csv |
| Irrigated vs. rainfed yield | 5.2 vs. 1.7 Mg d.m. ha⁻¹ yr⁻¹ | yield_annual_harvest.csv |
| N₂O range at 2100 | 0.011–0.068 g N₂O-N m⁻² yr⁻¹ | n2o_annual_trajectories.csv |
| N₂O cumulative range | 10–59 kg N₂O-N ha⁻¹ | n2o_annual_trajectories.csv |
| ΔCEC range | 0.9–7.4 cmolc/kg | cec_delta_summary.csv |
| gSSURGO CEC median | 15.0 cmolc/kg | permian_basin_cec_om_soc_by_mukey.csv |
| DAYCENT initial SOC | 5.7 Mg C/ha (0–30 cm, active+slow) | initial_soc_validation.csv |
| gSSURGO SOC median | 20.7 Mg C/ha (0–30 cm) | permian_basin_cec_om_soc_by_mukey.csv |
| pH domain median (fill-corrected) | 6.8 | gid_correct_ph.csv |
| PRDX sensitivity slope | 8 Mg C/ha per PRDX unit | prdx_sensitivity_summary.csv |
| Climate pert. baseline MISC/SWI | 31.2 / 24.3 Mg C/ha | climate_sensitivity_summary.csv |

**Constraints:**
- Wang is unavailable. Do not assign any action to Wang.
- Git identity: use env vars `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`.
- HPC: `kl1.hpc.nrel.gov`, account `emrecrada`, partition `short` (2h max) or `long`.
- Pixi policy: all Python/R work uses `pixi run` from the analysis repo root.
