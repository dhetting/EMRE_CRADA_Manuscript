# Round 3 Adversarial Review — main_soc.tex
**Reviewer role:** Independent AEE referee  
**Branch:** `manuscript/soc-intro-results-slice`  
**Manuscript state reviewed:** Post-analysis-agent update (cycle 8 pre-commit)  
**Date:** 2026-06-27  
**Cycle:** 8 (prose fixes applied in this session before review was written)

---

## Executive Verdict

The analysis-agent update substantially improved the manuscript: factorial effects are quantified, BAU controls exist, biomass yield is restored, CEC depth fractions are validated. The manuscript is now scientifically credible in its core claims. However, two blocking issues remain that compromise reproducibility and could invalidate the CEC section entirely. Several major issues require either direct manuscript edits or analysis-agent action before AEE submission.

---

## Disposition Summary

| ID | Severity | Status | Action Required |
|----|----------|--------|-----------------|
| B1 | BLOCKING | Open | Analysis agent: fix pH extraction bug, recompute all CEC values |
| B2 | BLOCKING | Open | Analysis agent: provide Supp Table S1 (crop.100 parameters) |
| M1 | MAJOR | Fixed this session | Conclusions "all other parameters identical" hedged (line 293) |
| M2 | MAJOR | Open | Analysis agent: document agcacc extraction method (cumulative vs. annual) |
| M3 | MAJOR | Fixed this session | No-harvest depth fraction >1.0 explained in CEC results (line 265) |
| M4 | MAJOR | Open (NOTE remains) | Anderson-Teixeira 5–30 Mg C/ha range needs Table 2 verification |
| M5 | MAJOR | Open | Cumulative N₂O 10–15% above endpoint-rate back-calculation — needs explanation |
| M6 | MAJOR | Fixed this session | Fertilization yield vs. SOC apparent contradiction resolved (line 222) |
| m1 | MINOR | Fixed this session | "HARV ALL" clarified as above-ground only (line 155) |
| m2 | MINOR | Fixed this session | "productivity ceiling" → "productivity slope" (line 293) |
| m3 | MINOR | Open | 1980–2020 = 41-year cycle; Fig 6 caption says "40-year" |
| m4 | MINOR | Open | 41+ Placeholder citation stubs — none replaced yet |
| m5 | MINOR | Open | NOTE at line 100 still says "Wang should confirm" (boundary DOI) |
| m6 | MINOR | Fixed this session | "Wang should confirm" removed from boundary NOTE (line 110) |
| m7 | MINOR | Open | Early-year yield overestimate caveat not extended to early-year SOC in Conclusions |

---

## BLOCKING Issues

### B1 — pH extraction bug invalidates ~40% of CEC pixels

**Location:** Lines 267–275 (CEC caveat paragraph)

**Finding:** The manuscript discloses that approximately 40% of pixels have stored `ph1to1h2o` values below 5.5 in the H5 resource file, and these are clipped to pH = 5.5 in the PTF. The actual Permian Basin pH distribution (Figure 1) shows a range of approximately 5.5–9.1 with no expected sub-5.5 cluster. An ~40% frequency of pH < 5.5 is inconsistent with Permian Basin geochemistry (predominantly alkaline, caliche-bearing soils) and is almost certainly an encoding or extraction error in the gSSURGO H5 pipeline.

**Why it is blocking:** If ~40% of pH values are wrong (too low), then ΔCEC for those pixels is computed from pH ≈ 5.5 rather than the true pH of ~7–8. Using pH 5.5 instead of pH 7.5 underestimates CEC_OM by (7.5 − 5.5)/7.5 = 27%. The stated 0.9–6.6 cmolc/kg range is therefore systematically biased low for ~40% of the domain, and the overall range bounds are unreliable.

**Current text framing (inadequate):** The manuscript describes this as making CEC estimates "conservative (lower-bound)" relative to probable pH. This is wrong in direction for editorial purposes — it is not a conservatism choice, it is a data error that inflates the uncertainty and could be substantially wrong.

**Action required (analysis agent):**
1. Identify the encoding/extraction error in the gSSURGO H5 pipeline for `ph1to1h2o`.
2. Re-extract pH from the authoritative gSSURGO source for the study domain.
3. Recompute all ΔCEC values using corrected per-pixel pH.
4. Provide corrected ΔCEC range bounds, harvest/no-harvest sub-ranges, and pixel statistics for Figure 7 and 8.
5. Report the corrected pixel pH distribution (median, IQR, fraction >8.5) to replace the current "5.5 to 8.6" statement at line 275.

**If the 40% sub-5.5 fraction cannot be corrected:** The manuscript must explicitly state the pH distribution is corrupted in the data pipeline, the CEC values are unreliable, and the CEC section should be demoted to a methodological example rather than a result.

---

### B2 — Supplementary Table S1 not created

**Location:** Lines 166 and 293

**Finding:** Both the Results opener (line 166) and Conclusions (line 293) reference "Supplementary Table S1 for full parameter listing" of DAYCENT crop.100 parameters. This table does not exist anywhere in the manuscript or supporting files.

**Why it is blocking:** A citation to a non-existent supplementary table is a submission integrity failure. AEE reviewers will request the table. More importantly, the table is the evidence for (or against) the "all remaining parameters identical" claim. Without it, the claim is unverifiable, and the mechanistic discussion in the manuscript has no evidentiary grounding.

**Action required (analysis agent):**
1. Extract the full MISC and SG3 (or SWI) entries from `crop.100`.
2. Provide a complete two-column table (MISC, SG3) listing every parameter name, value, and description.
3. Flag any parameters that differ between the two crop entries.
4. If other parameters differ, the "all remaining parameters identical" claim (lines 166, 293) must be revised.

**Manuscript agent action after receiving data:** Create a LaTeX `supplementary.tex` file or appendix section containing Table S1.

---

## MAJOR Issues

### M1 — Conclusions "all other parameters identical" overclaim [FIXED]

**Location:** Line 293 (Conclusions)

**Original text:** "all other parameters are identical between the two crops"  
**Fixed text:** "all remaining `crop.100` parameters were held identical between the two entries in this simulation archive (Supplementary Table S1)"

The Conclusions had reverted to the pre-cycle-8 overclaim, dropping the hedge ("in this simulation archive") and the evidentiary reference (Supp Table S1) that the Results section correctly carried. Fixed in this session.

---

### M2 — agcacc yield extraction method undocumented

**Location:** Line 217 (NOTE), line 220 (Figure 6 caption), line 222 (biomass yield paragraph)

**Finding:** The manuscript states that yield comes from DAYCENT `agcacc` (g C m⁻² yr⁻¹) converted using carbon fraction = 0.45. However, `agcacc` in DAYCENT typically represents **accumulated** above-ground carbon (a running cumulative sum), not an annual rate. If `agcacc` is cumulative, the correct annual yield extraction is:

```
yield_annual(year t) = (agcacc(t) − agcacc(t−1)) / 0.45 × 100  [Mg d.m. ha⁻¹ yr⁻¹]
```

not `agcacc(t) / 0.45 × 100`.

The label "g C m⁻² yr⁻¹" in the Figure 6 caption suggests annual rates are being used directly, but the variable name `agcacc` implies otherwise. The `yield_annual_harvest.csv` referenced in the NOTE may already contain the differenced values, but this is not stated.

**Why it matters:** If `agcacc` is treated as an annual rate when it is actually cumulative, the stated yield range (1.5–6.7 Mg d.m. ha⁻¹ yr⁻¹) is wrong — it would be the cumulative yield over the simulation, which is an order of magnitude larger than plausible.

**Action required (analysis agent):**
1. Confirm whether `agcacc` in the harvest_*.h5 files is an annual rate or a running cumulative.
2. Confirm the exact calculation used to produce `yield_annual_harvest.csv`.
3. Provide a brief methodological statement suitable for inclusion in the Methods section.

**Manuscript action after receiving confirmation:** Add one sentence to the Management schedule section or Analytical workflow specifying the extraction method (e.g., "annual yield was computed as the year-on-year difference in `agcacc` divided by a carbon fraction of 0.45, then converted from g C m⁻² to Mg d.m. ha⁻¹").

---

### M3 — No-harvest depth fraction >1.0 not explained in CEC results [FIXED]

**Location:** Line 265 (CEC results paragraph)

The Methods section (line 135) explained the mechanism (surface residue → topsoil accumulation, deeper loss). The CEC results section failed to mention or explain it, leaving a fraction >1.0 unexplained for reviewers who read Results before Methods. Added a sentence in this session.

---

### M4 — Anderson-Teixeira 5–30 Mg C/ha range unverified

**Location:** Lines 187, 188–193 (NOTE)

**Finding:** The manuscript cites "cumulative SOC gains of approximately 5–30 Mg C/ha over 5–20 years" from AndersonTeixeira2009SOC and Gelfand2013MarginalLands. The NOTE already flags: "this range is consistent with the paper's Table 2 but should be verified against the source table before final submission."

Anderson-Teixeira et al. (2009, GCB Bioenergy 1:75–96) Table 2 spans diverse species and site conditions; the 5–30 Mg C/ha range may require more careful selection of the relevant rows (perennial grasses, first 5–20 years). The current NOTE indicates unresolved uncertainty in whether the cited range accurately represents the paper.

**Action required (analysis agent or manuscript author):**
1. Access Anderson-Teixeira 2009 (GCB Bioenergy 1:75–96), Table 2.
2. Confirm which rows (species, years, SOC depth) support the 5–30 Mg C/ha range.
3. Report the actual value range and conditions from Table 2.
4. Update manuscript accordingly (may need to narrow the range or specify conditions more precisely).

---

### M5 — Cumulative N₂O back-calculation discrepancy

**Location:** Line 232 (N₂O section)

**Finding:** The manuscript states cumulative N₂O-N over 2021–2100 ranges from 10 to 59 kg N₂O-N ha⁻¹. Back-calculating from the stated endpoint annual fluxes (0.011–0.068 g N m⁻² yr⁻¹ = 0.11–0.68 kg N₂O-N ha⁻¹ yr⁻¹) and the 79-year simulation duration gives 8.7–53.7 kg/ha — approximately 10–15% lower than the stated cumulative totals.

The discrepancy is physically consistent: early-year N₂O flux would be higher as nitrogen cycles through newly installed perennial root systems, pulling the cumulative total above what the 2100 endpoint rate × 79 years would predict. But the manuscript does not mention this, leaving the numbers as an apparent inconsistency.

**Action required:**
Add one sentence to the N₂O paragraph explaining that cumulative totals exceed endpoint-rate × years because early-year flux is elevated before the system reaches steady state (or whatever the actual mechanism is per the analysis agent's trajectory data).

---

### M6 — Fertilization yield–SOC apparent contradiction [FIXED]

**Location:** Line 222 (biomass yield paragraph)

Original text said fertilization has "negligible effect on yield" while the main effects table shows +3.5 Mg C/ha from fertilization. Fixed in this session by adding: "fertilization's +3.5 Mg C/ha SOC main effect operates primarily through stimulation of root biomass and rhizodeposition rather than harvestable above-ground biomass."

---

## MINOR Issues

### m1 — "HARV ALL" removes roots? [FIXED]

Line 155 said "remove all standing biomass on day 300 (HARV ALL)." Fixed to specify "above-ground biomass (HARV ALL; roots are not removed)" to prevent reviewer confusion about whether the harvest event depletes belowground carbon.

### m2 — "productivity ceiling" terminology [FIXED]

Line 293 referred to PRDX(1) as a "productivity ceiling." PRDX(1) is the slope of the productivity–aboveground C relationship in DAYCENT, not an absolute ceiling. Fixed to "productivity slope."

### m3 — 40-year vs. 41-year repeating climate cycle

**Location:** Line 220 (Figure 6 caption), line 232, abstract

1980–2020 inclusive = 41 years. The Figure 6 caption says "40-year repeating meteorological cycle." Should be corrected to "41-year" or "approximately 40-year" for consistency. The abstract and Methods say "1980–2020 meteorological forcing" without specifying the cycle length, which is correct; only the Figure 6 caption uses the "40-year" shorthand.

**Action:** Edit Figure 6 caption to read "approximately 41-year repeating meteorological cycle" or simply "the 1980–2020 repeating climate cycle."

### m4 — 41+ Placeholder citation stubs

Lines 319–345 (TODO block): All 41+ Placeholder keys remain unresolved. No Placeholder key has been replaced with a verified entry. This entire block must be completed before AEE submission. Deferred to analysis agent / citation pass.

### m5 — Early-year yield caveat not extended to early SOC

**Location:** Line 222, Conclusions line 297

The manuscript appropriately notes "DAYCENT begins from pre-established equilibrium states and does not simulate a crop establishment phase; early-year yield values may be overestimated." This caveat is not extended to early-year SOC accumulation rates, which might also be affected (inflated by the immediate transition from low-productivity baseline to full-productivity perennial). The Conclusions limitations list item (5) covers yield only.

**Suggested fix:** In Conclusions limitation (5), add "early-year SOC accumulation rates may similarly be overestimated during the crop establishment window."

### m6 — Boundary provenance NOTE still uses "Wang/Hettinger" [FIXED]

Line 110 NOTE said "Wang/Hettinger should confirm this matches the provenance metadata." Wang is unavailable. Fixed in this session to remove "Wang" reference; the NOTE now says "should be confirmed against this DOI before final submission."

### m7 — Figure 1 caption says "DAYMET" (capitalization inconsistency)

**Location:** Line 119 (Figure 1 caption)

The caption uses "DAYMET" while the manuscript body consistently uses "Daymet" (the product's official capitalization per ORNL DAAC). Minor but worth correcting for final submission.

---

## Issues Requiring Analysis Agent — Summary

See `docs/ANALYSIS_AGENT_HANDOFF.md` for full specifications.

| Priority | Issue | Data needed from analysis agent |
|----------|-------|--------------------------------|
| 1 (blocking) | B1: pH extraction bug | Corrected per-pixel pH distribution; recomputed ΔCEC values |
| 2 (blocking) | B2: Supp Table S1 | Full crop.100 parameter listing for MISC and SG3/SWI |
| 3 (major) | M2: agcacc method | Confirmation of cumulative vs. annual; extraction procedure statement |
| 4 (major) | M4: Anderson-Teixeira range | Table 2 row verification |
| 5 (major) | M5: N₂O cumulative discrepancy | Early-year flux trajectory confirmation |
| 6 (open from R2) | R9: Initial SOC validation | DAYCENT 2021 vs. gSSURGO 0–30 cm comparison |
