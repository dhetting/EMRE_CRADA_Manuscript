# Cycle 8 Handoff: Adversarial Review Round 2 Responses

**Manuscript:** `main_soc.tex`, branch `manuscript/soc-intro-results-slice`
**Commit:** 7b7b748 (cycle 8 — pushed)
**Prepared:** 2026-06-26 by analysis/manuscript agent
**For:** Online review agent, Wang (DAYCENT archive access), future analysis cycles

---

## 1. What cycle 8 fixed (from second adversarial review)

| Review item | Status | Action taken |
|---|---|---|
| R2-B1 (no BAU controls) | **RESOLVED** | BAU continuation runs exist (parquet `outputs/parquet/baseline_bau/`). BAU SOC drift at 2100: shrubland +0.95, cropland −1.25, barren +0.64 Mg C/ha. True LUC effect (SOC_perennial − SOC_BAU) = 15–84 Mg C/ha; stated in Results and Conclusions. Wrong sentence "no BAU runs" removed. |
| R1 (CO₂ forcing) | **RESOLVED** | CO₂ Systems = −1 in all schedule files → effects disabled. New paragraph in Methods: ambient-CO₂ assumption throughout 2021–2100. |
| R2-M4 (CO₂ unspecified) | **RESOLVED** | Same as R1. |
| R2-M5 (irrigation "primary driver") | **RESOLVED** | Quantitative factorial main effects added: irrigation +26.1, residue +12.4, crop +9.0, fert +3.5 Mg C/ha at 2100. |
| R2-B5 (MISC vs SWI provenance) | **PARTIALLY RESOLVED** | Single-parameter difference disclosed in body text: PRDX(1) = 3.5 (MISC) vs 2.75 (SG3/SWI); all other crop.100 params identical. Full crop param table needed for supplement (see R2 below). |
| R2-M8 (schedule underdocumented) | **PARTIALLY RESOLVED** | Management schedule paragraph added (day 131/161/300/330 events, HARV ALL vs SENM, BAU definition). Full supplementary table with all 16 schedules still needed. |
| R2-S1 (strong language) | **RESOLVED** | "outperform" → "compare favorably"; "restoring SOC" → "altering modeled soil-C outcomes". |
| R2-B4 (biofuel claims, no yield) | **PARTIALLY RESOLVED** | Intro no longer claims harvestable biomass; yield unavailability noted explicitly. |
| R2-M2 (pH > 8.5 exceedance) | **RESOLVED** | Only 11 pixels (0.006%) exceed pH 8.5; PTF domain concern is negligible. Added to CEC caveat paragraph. |
| R2-B2 (root-fraction proxy) | **PARTIALLY RESOLVED** | Explicit warning added that 0.70 root-fraction proxy is not verified; layer-specific DAYCENT output needed. CEC downgraded to "exploratory order-of-magnitude projection." |
| R2-B3 (depth mismatch) | **RESOLVED** | "Doubling to quadrupling" claim removed in prior cycle; depth-mismatch NOTE retained as comment. |
| R2-M11 (shrubland = restoration) | **RESOLVED** | Neutral "land-use conversion scenario" language throughout. |
| R2-Q3 (barren in headline ranges) | **RESOLVED** | Barren range (16–70) noted as "falls within the range of two dominant land covers"; headline range unchanged because barren is not the extremum. |
| R2-M3 (gSSURGO vs PTF method) | **PARTIALLY RESOLVED** | CEC caveat notes method comparability issue. |

---

## 2. Still blocked — requires online agent or HPC

### 2A. Requires internet access (online agent)

| Item | Issue | Status |
|---|---|---|
| R2-R1 | 5 undefined bib keys: `PermianBasinClimatePlaceholder`, `EatonSalinityPlaceholder`, `WangDAYCENTArchivePlaceholder`, `BlancoCanaquisPlaceholder2011`, `VerhoefPlaceholder2006` | Manuscript compiles but these produce undefined-citation warnings |
| R2-R2 | 47 `Placeholder` keys in references.bib — all stubs needing verified metadata | Full citation verification pass needed |
| R2-R3 | Davis2010 DOI confirmation: DOI 10.1007/s10021-009-9306-9 (Ecosystems 13:144–156) — verify before final submission | Low confidence on year/volume |
| R2-R4 | Daymet V4 R1 citation: manuscript uses `Thornton2022Daymet` — verify DOI 10.3334/ORNLDAAC/2129 and that this product covers 1980–2020 | Check actual product used |
| R2-B5 supplement | Crop parameter table for supplementary info: MISC (PRDX=3.5) vs SG3 (PRDX=2.75) vs G2 (PRDX=1.5), all other params | Can be auto-generated from crop.100 at `/Users/dhetting/Box Sync/2022-01-06_EM_LCA/manuscript/Yong Wang Final/regional/regional/crop.100` |

### 2B. Requires layer-specific DAYCENT .lis files (HPC — Wang)

| Item | Issue | What's needed |
|---|---|---|
| R6 (layer-specific SOC) | `somtc_1` through `somtc_10` per soil layer from DAYCENT .lis output files | Sum layers 1–5 (0–2, 2–5, 5–10, 10–20, 20–30 cm) for ΔSOC₀₋₃₀ |
| R2-B2 (CEC defensibility) | Without R6, the root-fraction proxy (0.70) cannot be validated | If R6 unavailable, CEC must remain an exploratory result with strong caveat (already done) |
| R9 (SOC validation) | DAYCENT 2021 SOC vs gSSURGO comparison | Blocked by R6 |
| R7 (biomass yield) | `crmvst` from .lis files for harvested scenarios | Check if .lis files are archived on HPC at `/projects/emrecrada/data/` |
| R11 (N₂O trajectories) | Annual N₂O flux 2021–2100 from .lis files | Check if annual .lis files are archived |

### 2C. Requires new DAYCENT runs (out of scope without authorization)

| Item | Status |
|---|---|
| R2-B5 sensitivity analysis | Requires re-running with perturbed PRDX — not authorized |
| R2-M1 (initial SOC validation) | Depends on R6 from existing runs; no new runs needed |
| BAU-adjusted N₂O | N₂O BAU exists in baseline_bau parquet for 2100 endpoint; cumulative trajectory unavailable |

---

## 3. Remaining structural concerns (acknowledged, not fully resolvable)

These are scientifically valid reviewer concerns that cannot be resolved without new data:

1. **R2-B2 (CEC root-fraction)**: Root density is not verified as a proxy for SOC vertical distribution. The 0.70 factor is an assumption. Until layer-specific DAYCENT output is retrieved and ΔSOC₀₋₃₀ is computed directly, the CEC result carries high parametric uncertainty. This is now disclosed explicitly in the manuscript.

2. **R2-M9 (spatial input documentation)**: CDL year used, gSSURGO aggregation method, resampling scheme, null-handling, projection, and pixel eligibility filters are not documented in the manuscript. Wang should provide this information for a supplement.

3. **R2-M7 (mechanisms not demonstrated)**: Mechanistic explanations (root C inputs, litter pathways) are supported by general literature but not shown from model diagnostics (pool-specific outputs not available from canonical CSV). Text now says "consistent with" rather than "explained by" where applicable.

4. **R2-F1 (Figure 2)**: Workflow schematic has large black borders and is hard to read. Needs rebuild as landscape schematic by Wang.

5. **R2-F2 (Figure 7)**: Scenario labels overlap in ΔCEC distribution plot. Needs visual redesign.

---

## 4. Key numbers for online agent (verified, do not re-derive)

| Metric | Value | Source |
|---|---|---|
| ΔSOC at 2100 (all 48 combos) | 14–85 Mg C/ha | `soc_delta_summary.csv` |
| BAU-relative ΔSOC at 2100 | 15–84 Mg C/ha | `soc_increment_over_bau_summary.csv` |
| BAU drift (shrubland) | +0.95 Mg C/ha | BAU parquet |
| Area-weighted ΔSOC | 20–81 Mg C/ha | computed (shrubland 87%) |
| Factorial main effects at 2100 | irri +26.1, res +12.4, crop +9.0, fert +3.5 Mg C/ha | computed from `soc_delta_summary.csv` |
| MISC vs SWI difference | PRDX(1): 3.5 vs 2.75; all other crop.100 params identical | `crop.100` L6334 vs L6221 |
| pH exceedance (>8.5) | 11 pixels = 0.006% of domain | parquet `ph1to1h2o` column |
| N₂O range (2100 endpoint) | 0.011–0.073 g N₂O-N m⁻² yr⁻¹ | canonical parquet |
| gSSURGO SOC baseline (0–30 cm) | median 20.7, IQR 13.9–35.7 Mg C/ha | `permian_basin_cec_om_soc_by_mukey.csv` |
| ΔCEC at 2100 | 1.0–5.0 cmolc/kg (exploratory proxy) | `cec_delta_summary.csv` |
| CO₂ forcing | DISABLED (CO₂ Systems = −1 in all .sch files) | schedule files in Box archive |
| Crop establishment | Day 131 (May 11); HARV ALL day 300; SENM day 300 + CULT TRANS day 330 | .sch files |
| Fertilization | 120 kg N/ha/yr on day 161 (fert scenarios) | .sch files (`12N`) |
| Irrigation | 50% AWC trigger, automatic | .sch files (`IRIG (1,0.5F,-1L)`) |

---

## 5. Instructions for online agent

### Priority 1: Citation verification
Verify every `*Placeholder` key in `references.bib`. For each:
1. Search for the paper by title/author/DOI
2. Confirm the specific claim in `main_soc.tex` that cites it
3. Replace the stub with verified BibTeX
4. Flag any claim that is not supported by the verified paper

Five keys are currently undefined and **block compilation warning resolution**:
- `PermianBasinClimatePlaceholder` — semi-arid climate stats for Permian Basin
- `EatonSalinityPlaceholder` — soil salinity / caliche for Permian Basin
- `WangDAYCENTArchivePlaceholder` — Wang's DAYCENT archive / internal report
- `BlancoCanaquisPlaceholder2011` — residue retention and soil aggregation
- `VerhoefPlaceholder2006` — cited for harvest reducing N₂O

### Priority 2: Figure 1 caption completion
The Figure 1 caption has a placeholder for panel descriptions. Complete it with accurate panel descriptions: soil pH, bulk density (from gSSURGO), CDL land cover, and Permian Basin boundary.

### Priority 3: CEC PTF citation
Confirm a published source for the PTF equation `CEC_OM = 30 × pH (cmolc/kg OM)`:
- Brady & Weil, "The Nature and Properties of Soils" — identify the edition and chapter/page that contains this coefficient
- If Brady & Weil does not contain this specific equation, suggest a verified alternative (e.g., Sposito, Bohn et al.)

### Priority 4: Davis 2010 verification
Verify: Davis SC, Parton WJ, Dohleman FG, et al. (2010) Comparative biogeochemical cycles of bioenergy crops reveal nitrogen-fixation and improve water quality. *Ecosystems* 13(1):144–156. DOI: 10.1007/s10021-009-9306-9. Confirm year (2010 vs 2012).

---

## 6. Files for online agent to inspect

- `/Users/dhetting/src/EMRE_CRADA_Manuscript/main_soc.tex` (branch `manuscript/soc-intro-results-slice`)
- `/Users/dhetting/src/EMRE_CRADA_Manuscript/references.bib`
- `/Users/dhetting/src/EMRE_CRADA_Manuscript/figures/figure[1-8].png`
- `/Users/dhetting/src/EMRE_CRADA_Analysis/outputs/tables/soc_delta_summary.csv`
- `/Users/dhetting/src/EMRE_CRADA_Analysis/outputs/tables/cec_delta_summary.csv`

