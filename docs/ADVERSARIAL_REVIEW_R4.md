# Round 4 Adversarial Review — main_soc.tex
**Reviewer role:** Independent AEE referee  
**Branch:** `manuscript/soc-intro-results-slice`  
**Manuscript state reviewed:** Post-cycle-9 (citation verification) + cycles 16–17 (pH fix, Supp Table S1, output documentation)  
**Date:** 2026-06-27  
**Cycle:** 10  
**New DAYCENT runs:** NOW PERMITTED — removed as a limiter on recommendations

---

## What Was Resolved Since R3

| Item | Status | Where fixed |
|------|--------|-------------|
| B1: pH extraction bug | RESOLVED | cycle 16: null values filled from project_points.csv medians; CEC range updated to 0.9–7.4 |
| B2: Supp Table S1 | RESOLVED | cycle 16: `supplementary_s1.tex` created; 112 parameters inspected; only PRDX(1) differs |
| A3: agcacc documentation | RESOLVED | cycle 17: line 163 documents agcacc as annual accumulator with reset per harvest event |
| m3: Fig 6 "40-year" | RESOLVED | cycle 16/17: caption now reads "41-year repeating meteorological cycle" |
| Fig 1 "DAYMET" | RESOLVED | caption reads "Daymet climatological means" |
| VerhoefPlaceholder2006 | RESOLVED (this cycle) | replaced with Miller2008SoilBio (SBB 40:2553, DOI 10.1016/j.soilbio.2008.06.024) |

---

## Executive Verdict

The manuscript has improved substantially over four cycles. The two prior blocking issues (B1, B2) are now resolved, the Supplementary Table S1 confirms the single-parameter claim, and the agcacc extraction is documented. However, six issues require new DAYCENT runs or analysis — with new runs now permitted, these should be addressed before submission. Two systematic citation errors remain. Several structural omissions would draw referee questions.

---

## Disposition Summary

| ID | Severity | Status | Action |
|----|----------|--------|--------|
| R4-D1 | BLOCKING (new) | Open | Initial SOC validation — new DAYCENT run required |
| R4-D2 | MAJOR (new) | Open | PRDX(1) sensitivity analysis — new runs required |
| R4-D5 | MAJOR (new) | Open | Irrigation demand 3.4 cm/yr seems implausibly low — verify with water balance |
| R4-V1 | MAJOR | Open | pH lower bound after B1 fix — pixels below PTF validity (5.5) not reported |
| R4-V2 | MAJOR | Open | "Davis2010 = DAYCENT Illinois simulation" is incorrect; Jarecki2020 is Ontario not Illinois |
| M4 | MAJOR (carried) | Open (NOTE in text) | Anderson-Teixeira 5–30 Mg C/ha range not page-verified |
| M5 | MAJOR (carried) | Open | Cumulative N₂O 10–15% above endpoint back-calculation — no explanation in text |
| R4-D3 | MAJOR (new) | Open | soiln.out not enabled — soil nitrogen balance cannot be closed |
| R4-D4 | MAJOR (new) | Open | No climate uncertainty bounds — new perturbation runs recommended |
| R4-P1 | MINOR | Fixed this cycle | VerhoefPlaceholder2006 replaced with Miller2008SoilBio |
| R4-P2 | MINOR | Fixed this cycle | Jarecki2020 geographic error corrected ("Illinois" → "humid temperate") |
| R4-P3 | MINOR | Fixed this cycle | CO₂/C4 sentence — now notes C4 CO₂ response is limited |
| R4-P4 | MINOR | Fixed this cycle | m7 — early-year SOC added to Conclusions limitation (5) |
| R4-P5 | MINOR | Fixed this cycle | "consistently show" → "consistently indicate" |
| R4-P6 | MINOR | Fixed this cycle | Supp table note: explicit statement that all 112 params compared |
| R4-m1 | MINOR | Open | Harvest-N₂O citation (Word comment) — added ButterbachBahl2013; verify adequacy |
| R4-m2 | MINOR | Open | "approximately 25% higher yield" vs. 27% PRDX(1) ratio — clarify these are different quantities |
| R4-m3 | MINOR | Open | Title "soil health outcomes" overpromises scope |
| R4-m4 | MINOR | Open | CRediT author contributions statement absent (AEE requirement) |
| R4-m5 | MINOR | Open | "cool winters that average 10–15°C" — verify stat type (mean vs. high T); needs citation |
| R4-m6 | MINOR | Open | PPDF descriptions in supplementary table (30°C, 45°C) need DAYCENT manual verification |
| He2025 | PENDING | Open | No matching paper found; citation still in text |
| PermianBasinClimate | PENDING | Open | Stub; no citation supplied |
| EatonSalinity | PENDING | Open | Stub; no citation supplied |
| WangDAYCENTArchive | PENDING | Open | Stub; no citation supplied |

---

## BLOCKING / HIGH PRIORITY — New DAYCENT Runs Now Permitted

### R4-D1 (BLOCKING) — Initial SOC validation against gSSURGO

**Location:** Conclusions line 301, limitation (1)

**Finding:** The manuscript discloses that DAYCENT initial SOC (end of spin-up, year 2021) was not validated against gSSURGO observed values. With new DAYCENT runs now permitted, this is directly actionable.

**Why blocking:** If DAYCENT spin-up SOC systematically deviates from gSSURGO values (e.g., 20–40% bias, as is common in unvalidated spin-ups), all ΔSOC projections are offset by the initial bias. The reviewer will ask for this validation.

**What to do:** Extract DAYCENT simulated SOC at 0–30 cm at year 2021 (end of spin-up; per-layer output from the full-basin re-runs that generated depth fractions). Compare to gSSURGO Valu1 `soc0_30` at the same pixel grid. Report mean bias, RMSE, Pearson r, and fraction within ±20%, by land cover. If bias is <20% and spatially unstructured, state this and update limitation (1). If bias is large or spatially structured (e.g., systematic underestimation in shrubland), the DAYCENT spin-up parameterization may need adjustment before projections can be trusted.

**Manuscript update after validation:** If validation is acceptable, update Conclusions limitation (1) to say "initial SOC validation was performed (see Supplementary)." If not acceptable, revise the DAYCENT parameterization and rerun — this is now permitted.

---

### R4-D2 (MAJOR) — PRDX(1) sensitivity analysis

**Location:** Lines 174, 203, 297 (single-parameter difference)

**Finding:** The entire miscanthus–switchgrass SOC gap (+9.0 Mg C/ha main effect) is driven by one parameter, PRDX(1) = 3.5 vs. 2.75. No site-specific calibration was performed for the Permian Basin. A referee will ask: what if the true PRDX(1) for miscanthus in semi-arid conditions is different?

**What to do:** Run 3 additional MISC scenarios varying PRDX(1): {3.0, 3.25, 3.75}. For each, report the ΔSOC at year 2100 for the shrubland rainfed-harvested case (the most representative scenario). Compute the SOC sensitivity: (ΔSOC change)/(PRDX(1) change). Report as a one-paragraph sensitivity analysis and add a figure panel or supplementary table.

**Manuscript update:** Add one sentence to the parameterization limitation section: "A sensitivity analysis varying PRDX(1) by ±X% produced SOC changes of ±Y Mg C/ha, suggesting [high/low] sensitivity to this parameter."

---

### R4-D5 (MAJOR) — Irrigation demand of 3.4 cm/yr appears implausibly low

**Location:** Line 236

**Finding:** The manuscript states mean modeled irrigation demand of 3.4 cm/yr (interquartile range 2.8–4.0 cm/yr) from DAYCENT `irrtot` for irrigated scenarios. For a semi-arid region with ~330 mm annual precipitation and potential evapotranspiration ~1800 mm/yr, perennial grass water demand substantially exceeds precipitation. Even with adaptive root architecture, supplemental irrigation well above 34 mm/yr is expected in a model triggered at 50% PAWC depletion.

**Potential explanations (must be verified):**
1. `irrtot` may be in units other than cm water per year — check the DAYCENT output documentation
2. `irrtot` may be cumulative since 2021, not annual at year 2100 — if so, divide by 79 to get annual rate (giving ~0.43 mm/yr, even less plausible)
3. gSSURGO PAWC values for these coarse/caliche soils may be very low, so the 50% trigger refills only a small amount per event; many small events summing to 34 mm/yr is possible if per-event replenishment is ~2–3 mm and events occur ~10–15 times/year
4. The model may be under-applying irrigation due to the growing-season window in the schedule files

**What to do:** (a) Confirm `irrtot` units from DAYCENT documentation; (b) extract mean per-event irrigation amount from the model; (c) check gSSURGO PAWC values for the domain; (d) compute a simple water-balance check: annual precipitation + modeled irrigation vs. ET estimate. If the balance does not close reasonably, the irrigation module behavior needs investigation.

**Manuscript update:** If 3.4 cm/yr is confirmed correct, add one sentence explaining why it is plausible (e.g., coarse soils with low PAWC result in small per-event replenishment). If the value is wrong, correct it and the corresponding text.

---

## MAJOR — Data Verification Required

### R4-V1 (MAJOR) — pH lower bound after B1 fix

**Location:** Lines 275, 276–279 (NOTE and prose)

**Finding:** After the B1 pH fix, the text reports that per-pixel pH (fill-corrected) ranges from 4.5 to 8.6, with median 7.0. The PTF is defined as valid for pH 5.5–8.5. The text reports only 11 pixels exceeding the upper bound (pH > 8.5), but does not report how many pixels fall below the lower bound (pH < 5.5). A minimum of 4.5 means at least some pixels are below the PTF validity floor.

**Issue:** For pixels with pH < 5.5, the PTF `CEC_OM = 30 × pH` extrapolates below the calibration range, producing CEC_OM values below the minimum validated by temperate soil studies. Permian Basin soils should not have pH 4.5 in most areas — this may indicate residual outliers not caught by the median-fill correction.

**What to do:** Report the number/fraction of pixels with pH < 5.5 after the B1 fix. If there are more than a handful, investigate whether these are legitimate gSSURGO values (e.g., acidic soil series in the eastern margin of the basin) or remaining encoding artifacts. Apply the same PTF clipping to pH 5.5 on the low end as was done for the high end.

**Manuscript update:** Add "and only N pixels (X% of domain) fall below the lower PTF validity bound (pH 5.5); for these pixels, CEC_OM was computed at the clipped value of pH 5.5." to the pH disclosure sentence at line 275.

---

### R4-V2 (MAJOR) — Citation mismatch: Jarecki2020 is Ontario, not Illinois; Davis2010 is field data, not DAYCENT

**Location:** Line 195

**Finding (fixed this cycle):** Two errors were present:
1. Jarecki et al. 2020 (Land 9:509) modeled SOC sequestration in southern **Ontario, Canada**, not Illinois. The manuscript attributed "Illinois conditions" to this citation. Fixed to "humid temperate conditions."
2. Davis et al. 2010 (Ecosystems 13:144) is a **field biogeochemical measurement** paper from the Energy Farm in Champaign, IL. While it includes some DAYCENT runs alongside field data, it is primarily a measurement study. The sentence says "DayCent simulations report…" which may overclaim the DAYCENT component of Davis2010.

**Remaining action:** Verify that Davis2010 (Ecosystems 13:144) actually reports DAYCENT-simulated SOC accumulation rates of ~0.9–1.0 Mg C/ha/yr from the model, not just field-measured rates. If Davis2010 reports field measurements (not DAYCENT), the sentence should say "Field measurements and DayCent simulations report…" and cite the papers separately for the appropriate evidence type.

---

### R4-V3 (MINOR) — PPDF parameter descriptions in supplementary table

**Location:** `supplementary_s1.tex` lines 43–44

**Finding:** The supplementary table lists PPDF(1) = 30.0 (described as "Minimum temperature for growth (°C)") and PPDF(2) = 45.0 (described as "Optimum temperature for growth (°C)"). A minimum growth temperature of 30°C would mean neither crop grows below 30°C — implausible for the Permian Basin where winter temperatures are well below 30°C. DAYCENT's PPDF parameters define a growth-response curve; the semantics (maximum production temp, optimum temp, or a degree-day base) need confirmation from the DAYCENT `crop.100` manual.

**What to do:** Check the DAYCENT documentation for PPDF parameter definitions. Update the "Description" column accordingly. If the values are misinterpreted (e.g., if 30 and 45 refer to Fahrenheit, or to heat-unit thresholds rather than absolute minimum/optimum temps), update descriptions. This does not affect results but would mislead readers relying on the supplementary table.

---

## MAJOR — Carried from R3 (Analysis Agent Required)

### M4 (MAJOR, carried) — Anderson-Teixeira 5–30 Mg C/ha range not page-verified

**Location:** Lines 195–201 (NOTE remains in manuscript)

The NOTE at lines 199–201 flags this for verification before final submission. Now that new DAYCENT runs are permitted, fetch the Anderson-Teixeira 2009 (GCB Bioenergy 1:75–96) Table 2 and verify the "5–30 Mg C/ha over 5–20 years" range against actual tabulated values for perennial grasses. Update the NOTE to state either "verified: range confirmed" or correct the values.

---

### M5 (MAJOR, carried) — Cumulative N₂O 10–15% above endpoint-rate back-calculation

**Location:** N₂O section; NOTE at line 241

Cumulative N₂O-N (10–59 kg N₂O-N/ha) is 10–15% above what endpoint-rate × 79 years would give (8.7–53.7 kg/ha). This implies elevated early-year flux. The manuscript has not yet explained this. The analysis agent should confirm the early-year vs. late-year flux from the annual trajectory data and add one sentence to the N₂O section.

---

## MAJOR — New Analysis Recommendations (New Runs Permitted)

### R4-D3 (MAJOR) — Enable soiln.out for nitrogen balance

The manuscript notes (lines 283–288) that soil ammonium and nitrate by layer were not enabled. Now that new runs are permitted, enable `soiln.out` in the 4–8 most representative scenarios (e.g., fertilized and unfertilized × irrigated and rainfed for the dominant land cover) and add a soil nitrogen balance section. This converts a stated limitation into a result.

---

### R4-D4 (MAJOR) — Climate perturbation sensitivity

The manuscript uses periodically repeated 1980–2020 climatology with no secular trend. The Permian Basin is projected to warm >2°C by 2100 under moderate scenarios. Run the 4 most-likely deployment scenarios (rainfed harvested MISC and SWI on shrubland) with:
- Precipitation −20%
- Precipitation +20%
- Temperature +2°C uniform shift

Apply to the Daymet daily files before input to DAYCENT. Report ΔSOC at 2100 under each perturbation. Add one figure panel or supplementary table. This directly addresses a major limitation the manuscript acknowledges but cannot currently quantify.

---

### R4-D6 (MODERATE) — Update Figure 1 with aridity index (PET/P)

Word comment at line 123–125 (Choi, 2025-03-13): "We should replace annual average precipitation with aridity index (PET/P) in Figure 1."

Compute PET using Thornthwaite or Penman-Monteith from Daymet temperature and radiation data, and compute PET/P per pixel. Replace the precipitation panel in Figure 1 with this aridity index. This provides a more informative summary of water availability across the domain and directly addresses the reviewer comment.

---

## MINOR Issues

### R4-m1 — Harvest reduces N₂O: citation adequacy

**Location:** Line 249

Word comment asks "Citation needed for harvest reducing N2O." The sentence "Harvesting removes a significant portion of the organic residues, limiting the denitrification substrate and modeled N₂O production" now cites ButterbachBahl2013Placeholder. ButterbachBahl2013 covers N₂O processes broadly but does not specifically show harvest reduces N₂O. A more direct cite — e.g., a study comparing harvested vs. residue-retained N₂O flux in bioenergy crops — would be stronger. Consider Chen et al. 2019 (already in bib: Renewable and Sustainable Energy Reviews 108:303) which covers nitrogen fertilization and yield under miscanthus and switchgrass, or a meta-analysis of residue retention and N₂O.

---

### R4-m2 — "25% higher yield" vs. 27% PRDX(1) ratio

**Location:** Line 230

The text says "miscanthus scenarios produce approximately 25% higher yield than switchgrass, attributable to the higher PRDX(1) productivity parameter." PRDX(1) ratio is 3.5/2.75 = 1.273 = 27.3%. The 25% yield figure is the actual modeled output, which differs from the parameter ratio due to water limitation effects. The text should clarify: "Miscanthus scenarios produce approximately 25% higher yield than switchgrass under equivalent management — slightly less than the 27% PRDX(1) slope ratio, reflecting partial water limitation of above-ground productivity." Currently a reader might infer the yield ratio should equal the parameter ratio, creating confusion.

---

### R4-m3 — Title scope

**Location:** Line 36

The title "Soil health outcomes and carbon dynamics under land-use change to perennial biofuel crops in the Permian Basin" implies broad soil health assessment. The paper covers SOC, CEC (derived from SOC), and N₂O only; aggregate stability, microbial biomass, and water-holding capacity are explicitly excluded (line 108). The title could more precisely read "Soil organic carbon, cation exchange capacity, and N₂O dynamics under land-use change to perennial biofuel crops in the Permian Basin" — though this is a judgment call for the authors.

---

### R4-m4 — CRediT author contributions statement absent

**Location:** End of manuscript

AEE requires an author contributions statement in CRediT format. This must be added before submission.

---

### R4-m5 — "cool winters that average 10–15°C"

**Location:** Line 96

In the Permian Basin (Midland, TX), average January temperature is ~7–9°C (mean of daily max and min). Daily maxima in January are ~12–14°C; daily minima are near 0°C. "Averaging 10–15°C" in winter likely refers to mean daily highs. Clarify whether this is mean temperature or mean maximum temperature, and cite a source (PermianBasinClimatePlaceholder is still a stub — this is also a stub resolution issue).

---

## Previously Resolved Minor Items

- m3: Fig 6 "41-year" ✓
- m6: boundary NOTE "Wang should confirm" removed ✓  
- Fig 1 "Daymet" capitalization ✓
- m7: early-year SOC added to Conclusions limitation (5) ✓ (this cycle)

---

## Summary: Directly-Fixable Edits Applied This Cycle

| # | Location | Change |
|---|----------|--------|
| F1 | Line 167 | Added C4/CO₂ sentence: C4 grasses have limited CO₂ response due to C4 CCM |
| F2 | Line 195 | "DAYCENT simulations for Illinois conditions" → "DayCent simulations under humid temperate conditions" (Jarecki2020 is Ontario, not Illinois) |
| F3 | Line 249 | VerhoefPlaceholder2006 → Miller2008SoilBio (SBB 40:2553); added ButterbachBahl2013 for harvest-N₂O sentence |
| F4 | Line 293 | "consistently show" → "consistently indicate" |
| F5 | Line 301 | Limitation (5): extended to include "early-year SOC accumulation rates may not reflect realistic establishment dynamics" |
| F6 | supplementary_s1.tex | Note now states: "All 112 parameters were compared; only PRDX(1) differs" |
| F7 | references.bib | Added Miller2008SoilBio (verified @article); updated VerhoefPlaceholder2006 stub comment |

---

## Recommended New DAYCENT Runs — Priority Order

| Priority | Run | Rationale |
|----------|-----|-----------|
| 1 (BLOCKING) | Initial SOC validation (year 2021 SOC vs. gSSURGO) | Required for submission; validates spin-up |
| 2 (MAJOR) | PRDX(1) sensitivity: MISC at 3.0, 3.25, 3.75 | Quantifies sensitivity to the single differentiating parameter |
| 3 (MAJOR) | Verify irrigation demand (irrtot unit check + water balance) | 3.4 cm/yr may be incorrect or needs explanation |
| 4 (MAJOR) | Climate perturbation: ±20% precip, +2°C T on 4 key scenarios | First quantitative climate uncertainty |
| 5 (MAJOR) | Enable soiln.out in subset of scenarios | Closes nitrogen balance; converts limitation to result |
| 6 (MODERATE) | 2-year establishment fallow phase before perennial crop | More realistic early-year dynamics |
| 7 (MODERATE) | Aridity index (PET/P) for Figure 1 (Daymet data processing only, no new DAYCENT needed) | Directly addresses Choi reviewer comment |
