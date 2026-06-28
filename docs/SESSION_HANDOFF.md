# Session Handoff — main_soc.tex Manuscript Agent
**Branch:** `manuscript/soc-intro-results-slice`  
**Last commit:** `2a490e1`  
**Date:** 2026-06-28  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)

---

## What this session accomplished (2026-06-28)

### Critical correction
**N₂O trend direction (cycle 11 error, commit 7c0601e):**  
Cycle 11 from a prior agent session incorrectly changed "N₂O flux rises from 0.035 to 0.041 g N₂O-N/m²/yr" to a declining trend (0.041→0.035). Data confirms the trend is **RISING** (first decade 0.035 → last decade 0.041). The cumulative total exceeds endpoint × 79 because year 2100 falls in a lower-flux phase of the 41-year repeating meteorological cycle (not because of a declining trend). Fixed back to the correct rising text.

### Optional enhancements implemented
| Enhancement | Commit | What was done |
|-------------|--------|---------------|
| OE-5: Spatial IQR | 7f81742 | Added sentence: area-weighted IQR ≈ 25–60 Mg C/ha, CV ≈ 0.60 |
| OE-6: Literature table | 7f81742 | Added Supplementary Table S2 comparing this study to 5 published field/modeling studies |
| OE-8: ΔCEC pH sensitivity | 7f81742 | Added quantification: 8% of pixels clipped pH 5.04→5.5; CEC bias <1% of domain |
| OE-7: Scenario-mean spatial map | 5cd94b1 | Figure 9: 3-panel (scenario-mean, highest, lowest ΔSOC at 2100); R script at `analysis/figures/figure9_scenario_mean_soc.R` |
| OE-4: PET computation | 2a490e1 | Hargreaves-Samani PET from Daymet 1980–2020 on HPC; mean = 1543 mm/yr; manuscript updated from "≈1700" to "≈1540 mm/yr (Daymet H-S; P-M ≈10–15% higher)" with Thornton2022Daymet citation |

### Analysis data added
| File | Content |
|------|---------|
| `outputs/tables/pet_hargreaves_permian.csv` | H-S PET for 5000 Permian Basin pixels (gid, latitude, annual_pet_mm) |
| `figures/figure9.png` | Scenario-mean ΔSOC spatial map (3 panels) |

---

## What remains open before submission

### Requires author input only (not agent-resolvable)
| Issue | Notes |
|-------|-------|
| **CRediT author contributions** | AEE requires formal CRediT statement; stub in manuscript at `\section*{Author contributions}` |
| **Acknowledgments** | Stub: `[Acknowledgments to be completed by authors.]` |
| **Wang2018Placeholder** | Unfindable; authors must supply or remove. Currently cited at line ~215 for "irrigation enhances productivity" claim |
| **Anderson-Teixeira 5–30 Mg C/ha (A4 NOTE)** | NOTE in source at line ~215 pending page-level verification; paper confirmed (GCB Bioenergy 1:75–96); author should verify Table 2 row values before removing NOTE |
| **USGS Province 044 boundary** | DOI 10.5066/P19COBRF cited; author should verify against actual shapefile provenance |
| **Competing interests confirmation** | `"The authors declare no competing interests"` — authors should confirm this is accurate given CRADA status |

### Requires online agent (citation verification)
| Issue | Notes |
|-------|-------|
| ~30 Placeholder citation stubs in references.bib | Full list in `docs/CITATION_VERIFICATION_REPORT.md`; high-priority keys: Bouwman1996, Bouwman2002, DelGrosso2005 (r²=0.74), Iqbal2015, Parton1987 |
| Arije2024SOCRecovery | vol/pages/DOI need primary-record check |
| Kaye2018SoilCarbon | DOI provisional; confirm page range |
| BlancoCanqui2016Placeholder | Replaced (SSSAJ erosion paper DOI added); confirm this is the right paper for the claim |

---

## What is fully resolved

| Item | Status |
|------|--------|
| N₂O trend direction | **FIXED** this session: rising 0.035→0.041 ✓ |
| B1 pH bug (40% null values) | Resolved: fill-corrected, 8% below PTF validity (5.5), bias <1% ✓ |
| B2 Supplementary Table S1 (crop.100) | Exists: `supplementary_s1.tex` (all 112 parameters, only PRDX(1) differs) ✓ |
| R4-D1: Initial SOC validation | Done: 5.7 vs 20.7 Mg C/ha (3.6-fold active+slow pool gap) ✓ |
| R4-D2: PRDX sensitivity | Done: 8 Mg C/ha/unit, ±7% sensitivity ✓ |
| R4-D3: soiln.out ammonium | Done: exploratory 4-scenario 200-px results ✓ |
| R4-D4: Climate perturbation | Done: Table 1 (±20% precip, +2°C) ✓ |
| R4-D5: irrtot units | Done: corrected to 88 cm/yr ✓ |
| OE-4: PET citation | Done: ≈1540 mm/yr H-S, Thornton2022Daymet cited ✓ |
| OE-5: Spatial IQR | Done: IQR 25–60 Mg C/ha, CV=0.60 ✓ |
| OE-6: Literature table | Done: Supplementary Table S2 ✓ |
| OE-7: Scenario-mean spatial map | Done: Figure 9 ✓ |
| OE-8: ΔCEC pH sensitivity | Done: <1% domain bias noted ✓ |
| He2025Placeholder | Removed from manuscript body ✓ |
| PermianBasinClimatePlaceholder | Replaced with NWS Midland 1991–2020 Climate Normals ✓ |
| Davis2010 DAYCENT attribution | Confirmed DAYCENT simulation study ✓ |
| Cool-winters wording | Clarified to "mean daily high temperatures of 10–15°C" ✓ |
| End-matter sections | Acknowledgments, CRediT stub, Competing interests, Data Availability added ✓ |
| Basso2013Placeholder | Replaced with Cotrufo et al. 2013 GCB (MEMS) ✓ |
| BlancoCanqui2016Placeholder | Replaced with SSSAJ 80:502 erosion paper ✓ |
| Mann2012Placeholder | Replaced with Lal 2004 Geoderma ✓ |

---

## Figure inventory (current, 9 figures)

| Figure | Content |
|--------|---------|
| 1 | Initial conditions: clay, sand, pH, precip, Tmax |
| 2 | Study design: land cover + 16-scenario factorial |
| 3 | ΔSOC distributions by scenario × LC at 2030/2050/2100 |
| 4 | Spatial ΔSOC at 2100, faceted by all 16 scenarios |
| 5 | Annual ΔSOC trajectories 2021–2100 |
| 6 | Biomass yield (A) and N₂O flux (B) trajectories |
| 7 | ΔCEC distributions by scenario × LC |
| 8 | ΔCEC spatial map at 2100 |
| **9** | **NEW: Scenario-mean ΔSOC (A) + highest/lowest scenarios (B, C)** |

---

## Key numbers for online agent to cross-check

These are the headline quantitative claims that should be verified against any newly resolved citations:

| Claim | Value | Source |
|-------|-------|--------|
| ΔSOC range all 48 combos | 14–85 Mg C/ha at 2100 | soc_delta_summary.csv |
| BAU increment (vs initial) | 15–84 Mg C/ha | soc_increment_over_bau_summary.csv |
| Irrigation main effect | +26.1 Mg C/ha | soc_delta_summary.csv |
| Residue retention effect | +12.4 Mg C/ha | soc_delta_summary.csv |
| Crop type effect | +9.0 Mg C/ha | soc_delta_summary.csv |
| Fertilization effect | +3.5 Mg C/ha | soc_delta_summary.csv |
| Modeled irrigation demand | 88 cm/yr (IQR 73–106) | canonical parquet irrtot |
| Potential ET (H-S) | ≈1540 mm/yr | pet_hargreaves_permian.csv |
| Harvested yield range | 1.5–6.7 Mg dm/ha/yr at 2100 | yield_annual_harvest.csv |
| Irrigated/rainfed yield | 5.2 vs 1.7 Mg dm/ha/yr | yield_annual_harvest.csv |
| N₂O range at 2100 | 0.011–0.068 g N₂O-N/m²/yr | n2o_annual_trajectories.csv |
| N₂O cumulative range | 10–59 kg N₂O-N/ha | n2o_annual_trajectories.csv |
| ΔCEC range | 0.9–7.4 cmolc/kg | cec_delta_summary.csv |
| gSSURGO CEC median | 15.0 cmolc/kg | permian_basin_cec_om_soc_by_mukey.csv |
| DAYCENT initial SOC | 5.7 Mg C/ha (0–30 cm, active+slow) | initial_soc_validation.csv |
| gSSURGO SOC median | 20.7 Mg C/ha (0–30 cm) | permian_basin_cec_om_soc_by_mukey.csv |
| pH domain median (fill-corrected) | 6.8 | gid_correct_ph.csv |
| PRDX sensitivity slope | 8 Mg C/ha per PRDX unit | prdx_sensitivity_summary.csv |
| Climate pert. baseline MISC/SWI | 31.2 / 24.3 Mg C/ha | climate_sensitivity_summary.csv |

---

## Key constraints for next agent

- New DAYCENT runs **ARE** permitted for additional analysis.
- Wang is unavailable. Do not assign any action to Wang; use "should be confirmed before submission."
- Git identity: Use env vars `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`.
- Git locks: If `.git/HEAD.lock` or `.git/index.lock` exist, remove them before committing.
- Biber backend: compile with `pdflatex → biber → pdflatex → pdflatex` for final submission proof.
- Pixi policy: all Python/R work uses `pixi run` from the analysis repo root.
- HPC: `kl1.hpc.nrel.gov`, account `emrecrada`, partition `short` (2h max) or `long`.

---

## File map

| File | Purpose |
|------|---------|
| `main_soc.tex` | Primary manuscript (24 pages; 9 figures; Supplementary Tables S1, S2) |
| `supplementary_s1.tex` | Supplementary Table S1 — full 112-parameter crop.100 comparison |
| `references.bib` | Bibliography; Wang2018Placeholder unresolved; ~30 Placeholder stubs need online verification |
| `figures/figure[1-9].png` | All 9 manuscript figures |
| `docs/ADVERSARIAL_REVIEW_R4.md` | Round 4 review findings and run recommendations |
| `docs/ADVERSARIAL_REVIEW_R5.md` | Round 5 review — text bugs, N₂O, pool comparison, PPDF |
| `docs/CITATION_VERIFICATION_REPORT.md` | Full citation verification status (cycle 9) |
