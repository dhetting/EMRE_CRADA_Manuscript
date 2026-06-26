# Adversarial Peer Review — Internal Pre-Submission Draft
**Manuscript:** "Soil health outcomes and carbon dynamics under land-use change to perennial biofuel crops in the Permian Basin"  
**File:** `main_soc.tex` (branch `manuscript/soc-intro-results-slice`)  
**Review date:** 2026-06-26  
**Reviewer:** AI adversarial review agent  
**Target venue:** Agriculture, Ecosystems & Environment (AEE), Elsevier

---

## 1. Executive Verdict

The manuscript presents a technically coherent but incompletely substantiated regional-scale DAYCENT simulation study. The central contribution — first-of-kind 1 km resolution soil health projections for perennial biofuel crops across the Permian Basin — is defensible in scope but is not yet fully reliable as submitted. The two highest-risk issues are: **(1)** a confirmed unit mismatch between Figures 3–5 (axes in Mg CO₂e ha⁻¹) and all manuscript text (Mg C ha⁻¹), which renders every quantitative comparison between figure and prose ambiguous; and **(2)** multiple remaining `Placeholder` citation keys that include at least one confirmed wrong paper (`Hastings2018Placeholder`, replaced in cycle 6 with `Fu2022MiscanthusSOC` but requiring Wang's sign-off). Substantive analytical gaps also exist: baseline SOC values are never reported, the N mineralization estimate method is not described and the stated values (1.2–3.7 kg N ha⁻¹) appear anomalously small by approximately three orders of magnitude relative to the reported ΔSOC, and no statistical uncertainty is quantified. The manuscript must resolve the figure units, report baseline SOC, verify the N-stock numbers, and replace all remaining stub citations before submission.

---

## 2. Prioritized Findings Table

| # | Severity | Location | Issue | Why it matters | Recommended fix |
|---|----------|----------|-------|---------------|----------------|
| 1 | **Blocking** | Figs 3, 4, 5 | Axes in Mg CO₂e ha⁻¹; text in Mg C ha⁻¹ | Every quantitative comparison between figure and prose is ambiguous | Regenerate figures with Mg C ha⁻¹ axes |
| 2 | **Blocking** | Figs 3, 4, 5 | Figure 6 biomass yield panel shows near-zero or negative values for all 16 scenarios | Harvested scenarios should show positive above-ground yield (~400–1500 g m⁻² yr⁻¹ for miscanthus) | Wang must investigate figure generation bug and regenerate |
| 3 | **Blocking** | §Soil N, line ~270 | ΔN_organic stated as 1.2–3.7 kg N ha⁻¹; likely should be Mg N ha⁻¹ (or values are otherwise off by ~10³) | Unit or calculation error propagates through N mineralization estimate | Verify against DAYCENT output variable (e.g., `somtc`, `orgn`) |
| 4 | **Blocking** | Throughout | 20+ `Placeholder` bib entries remain stubs; `WangDAYCENTArchivePlaceholder` is an internal archive not suitable for citation | Uncitable references will block editorial review | Replace all stubs; archive needs a data release DOI or SI reference |
| 5 | **Major** | §Methods / §Results | Baseline SOC never reported | Readers cannot assess whether 14–85 Mg C ha⁻¹ represents a large or small fractional gain | Add a sentence or table reporting mean baseline SOC by land cover at 0–105 cm depth |
| 6 | **Major** | §Soil N, ~line 270 | N mineralization method not described; stated 0.4–1.1 kg N ha⁻¹ yr⁻¹ appears derived from C:N ratios rather than from DAYCENT mineral N output | Readers cannot evaluate or reproduce the estimate | Describe calculation explicitly; confirm whether DAYCENT's `minerl` or equivalent output was used |
| 7 | **Major** | Line 75 | "Arid lands cover 45% of Earth's land surface" — citation is Lal 2004a (dryland ecosystems) which covers all drylands, not strictly arid lands | Factual imprecision likely sourced from conflating dryland categories | Change "Arid lands" to "Drylands (arid and semi-arid lands)" and verify the 45% figure against the cited source |
| 8 | **Major** | Line 75 | "store 15% of global SOC" — drylands typically cited as storing 30–40% of global SOC | Understates the global significance of dryland carbon pools; reversal of the sentence's rhetorical purpose | Verify against Lal 2004a and Schimel 2010; likely should be ~30–40% for all drylands |
| 9 | **Major** | §SOC accum., ~line 168 | r² = 0.74 for DAYCENT N₂O national-scale validation (DelGrosso 2005) is cited but not confirmed from primary source | This is the primary model credibility claim for nitrogen cycling | Access Del Grosso et al. 2005 STR 83:9–24 and confirm the exact statistic |
| 10 | **Major** | Introduction | No explicit novelty statement | AEE reviewers expect a clear statement of what is new | Add one sentence: "No prior study has applied DAYCENT at 1 km resolution to quantify soil health outcomes under perennial biofuel land-use change across the Permian Basin." |
| 11 | **Major** | §SOC accum., ~line 168 | "mean across the 48 scenario–land-cover combinations: 0.47 Mg C ha⁻¹ yr⁻¹" — averaging across land covers with very different pixel counts (shrubland 158,852 km², cropland 23,609 km², barren 114 km²) is not area-weighted | Barren land scenarios carry the same weight as shrubland, distorting the average | Report separately by land cover, or use area-weighted mean and say so |
| 12 | **Moderate** | Fig 7 | Visual inspection suggests some shrubland scenario means at 2100 exceed 5.0 cmolc/kg (stated maximum) | Stated numerical range appears inconsistent with figure | Verify against `soc_delta_summary.csv` |
| 13 | **Moderate** | §SOC para 3 (line ~190) | "Switchgrass produces more fine-root biomass than miscanthus, yet its total below-ground biomass is about half that of miscanthus" — counterintuitive and citation is `Chimento2015Placeholder` (stub) | Unverified quantitative claim; counterintuitive to readers | Replace stub citation; clarify rhizome vs. root contribution |
| 14 | **Moderate** | §Crop param. (line ~129) | DAYCENT validated at r²=0.74 for N₂O nationally, but "no independent SOC validation against Permian Basin field measurements was conducted" — this is buried in one sentence | The limitation is more serious than its placement suggests | Elevate to a prominent limitation paragraph or box |
| 15 | **Moderate** | §Mgmt. scenarios (line ~124) | "Fertilizer rates...taken directly from the DAYCENT schedule files" cited as `WangDAYCENTArchivePlaceholder` | Internal archive is not a citeable source; rates are not independently verifiable | Report rate values directly in text and cite the calibration paper (WangDou2017DAYCENT) |
| 16 | **Moderate** | §Intro para 2 (line ~78) | "Their deep root systems build SOC while above-ground biomass supports bioenergy production" cites Zeri2013 and VanLoocke2012 — both are water-use efficiency papers, not SOC-building papers | Weak citation–claim fit | Cite Gelfand2013 or Anderson-Teixeira2009 for the SOC claim |
| 17 | **Moderate** | §Analytical workflow (~line 141) | "DAYCENT takes climate data, soil information, vegetation parameters, and land-management practices as inputs and produces net primary production, soil organic carbon dynamics, nitrogen mineralization, leaching, and trace-gas fluxes as outputs" cites DelGrosso2005 and DelGrosso2006 but the primary model description paper is Parton 1998 (already in bib) | Missing canonical model citation at the primary description sentence | Add `\citet{Parton1998DAYCENT}` to the list of citations here |
| 18 | **Moderate** | Figure 6 caption | "biomass yield (harvested scenarios only, 8 of 16 scenarios)" but figure appears to show all 16 | Caption does not match figure content | Fix caption or figure |
| 19 | **Minor** | §Analytical workflow (~line 143) | The historical cotton baseline (tillage transitions, fertilization stages, residue fractions) is described in specific detail but sourced only to `WangDAYCENTArchivePlaceholder` | Non-reproducible from a published source | Either cite a published cotton-baseline parameterization paper or move the detail to SI |
| 20 | **Minor** | Abstract | Final sentence: "provide a regional map to guide land-use planning" — vague | Strengthened by naming the winning combination explicitly | Replace: "...and show that irrigated, residue-retaining miscanthus on shrubland produces the largest soil-health gain." |
| 21 | **Minor** | §Results intro (~line 152) | Results opening sentence conflates "outperforms in biomass yield" with "outperforms in SOC" — these are separate claims | Could be read as one supporting the other | Split into two sentences with separate hedges |
| 22 | **Optional** | §Soil N (~line 252) | "Harvesting removes a significant portion of the organic residues, limiting the denitrification substrate and thus retaining more nitrogen in plant-available mineral forms." — "significant portion" is vague | Precision expected in AEE | Specify the fraction or cite a measurement |

---

## 3. Blocking Issues

### B1 — Figure unit mismatch (Figs 3, 4, 5)
All three SOC output figures display axes labelled "Mg CO₂e ha⁻¹" while the manuscript text uses "Mg C ha⁻¹" throughout. The conversion factor is 44/12 ≈ 3.667. Numeric cross-check: the stated maximum mean ΔSOC of 85 Mg C ha⁻¹ × 3.667 = 312 Mg CO₂e ha⁻¹, consistent with the highest shrubland scenario visible in Figure 3. The numbers are therefore internally consistent, but the unit mismatch makes every quantitative comparison ambiguous without reader-performed conversion. For AEE (a soil science journal) the standard unit is Mg C ha⁻¹; CO₂e units imply a climate framing outside the paper's declared scope. Wang must regenerate Figures 3, 4, and 5 with Mg C ha⁻¹ axes before submission.

### B2 — Figure 6 biomass yield panel appears blank
The left panel of Figure 6 shows all 16 scenarios clustered at or below zero on the biomass yield axis (g m⁻² yr⁻¹). Harvested miscanthus scenarios should show positive values in the range of approximately 400–1500 g m⁻² yr⁻¹; harvested switchgrass 200–800 g m⁻² yr⁻¹; unharvested scenarios should show zero yield by definition. The near-zero and negative values across all scenarios suggest either: (a) the wrong column was plotted, (b) a sign inversion in the calculation, or (c) unharvested scenarios are being plotted in a panel intended for harvested-only data. The caption states "harvested scenarios only, 8 of 16 scenarios" but the figure appears to show all 16 scenario rows. This must be investigated and regenerated before submission.

### B3 — Soil organic nitrogen values appear anomalously small
The manuscript reports "the change in soil organic N in the top 30 cm ranges from 1.2 to 3.7 kg N ha⁻¹ across scenarios" (§Soil nitrogen storage). These values are internally inconsistent with the reported ΔSOC. A rough order-of-magnitude check: if ΔSOC at 105 cm is 14–85 Mg C ha⁻¹, and approximately 20–40% of new SOC is deposited in the top 30 cm, then ΔSOC(0–30 cm) ≈ 3–34 Mg C ha⁻¹. At C:N ratios of 8–11 (active and slow pools), the implied ΔN_organic(0–30 cm) ≈ 270–4,250 kg N ha⁻¹ (0.27–4.25 Mg N ha⁻¹). The stated 1.2–3.7 kg N ha⁻¹ is three orders of magnitude smaller. Either the values should be in Mg N ha⁻¹ (i.e., a units error), the calculation references only a tiny fraction of the SOC-associated N, or the values come from an output variable that tracks something other than cumulative organic N change. The N mineralization estimate of 0.4–1.1 kg N ha⁻¹ yr⁻¹ — which the manuscript derives from this stock estimate — may carry the same error. Wang must verify these numbers against the DAYCENT output files before submission.

### B4 — Unciteable internal archive
`WangDAYCENTArchivePlaceholder` is cited at lines 124 and 143 for the fertilization schedule parameters and the historical cotton baseline protocol. An internal model archive is not a peer-reviewable citation. These specific parameter values must either be (a) published in a prior Wang et al. paper already in the reference list, (b) moved to a data release with a DOI, or (c) described fully in a numbered Supplementary Information section with a citation to that SI.

---

## 4. Major Technical and Methodological Issues

**Missing baseline SOC.** The manuscript never reports starting SOC values by land cover. Without this, readers cannot evaluate whether 14–85 Mg C ha⁻¹ represents a realistic fractional increase (e.g., doubling or tripling of existing stock) or an implausible one. AEE reviewers will request this immediately. Add a sentence such as: "At the start of the land-use-change simulation (year 2021), mean SOC (0–105 cm) across pixels was X ± Y Mg C ha⁻¹ for shrubland, Z ± W Mg C ha⁻¹ for rainfed cropland, and P ± Q Mg C ha⁻¹ for barren land."

**No uncertainty quantification.** All results are presented as means and spatial percentile distributions (from pixel-to-pixel variability), but no uncertainty from model parameters, initial conditions, or spin-up assumptions is reported. DAYCENT is a deterministic model, so the spatial spread in Figures 3–5 reflects variability in initial soil and climate conditions across pixels, not model uncertainty. This distinction is not made. At minimum, the manuscript should state that parameter uncertainty is not quantified and recommend sensitivity analysis as future work.

**Climate stationarity.** Cycling 1980–2020 DAYMET data through 2100 is an acknowledged limitation but the direction of bias is not discussed. The Permian Basin is expected to warm and dry under most climate projections, which would tend to reduce SOC accumulation and biomass productivity relative to the modeled values. The limitation block should be expanded to state the expected direction of bias.

**Crop parameterization is switchgrass-based for miscanthus.** The NOTE at line ~180 (currently a LaTeX comment only) acknowledges that the MISC crop type uses a warm-season grass (G2/switchgrass-based) DAYCENT parameterization rather than a dedicated miscanthus calibration. This is a non-trivial limitation: all mechanistic explanations for the miscanthus–switchgrass SOC gap (lignin content, root turnover, decomposition rate) are literature-sourced but not captured in the parameterization difference. The modeled gap may therefore be an artifact of non-miscanthus-specific parameter differences rather than true biological differences. This limitation exists only in a LaTeX comment; it must appear in the manuscript body.

**No explicit novelty statement.** The introduction contextualizes the work but never states what makes this study the first or different from prior work. AEE reviewers expect this. Suggested addition at the end of the last introductory paragraph: "No prior published study has applied DAYCENT at 1 km resolution to simulate soil health outcomes across the Permian Basin under land-use change to perennial biofuel crops."

**N₂O attribution claim requires qualification.** The manuscript states that irrigation "can moderate N₂O flux by maintaining more uniform soil moisture conditions that reduce the anaerobic microsites where denitrification is concentrated." This mechanism is valid under some conditions but irrigation can also increase N₂O under saturated conditions by enhancing denitrification. The cited Groffman2009Placeholder and Zhu2013Placeholder are stubs; the claim should be hedged and backed by verified references.

---

## 5. Citation and Bibliography Audit

### 5a. Confirmed errors

| Key | Location | Issue | Status |
|-----|----------|-------|--------|
| `Hastings2018Placeholder` | Lines ~178, ~189 | Confirmed mismatch: original entry was about Latin American tropical forest regeneration (Science Advances 4(8) eaat2616), not miscanthus. Replaced in cycle 6 with `Fu2022MiscanthusSOC`. | **Resolved** — replaced; Wang should confirm `Fu2022MiscanthusSOC` covers the intended claims |
| `WangDAYCENTArchivePlaceholder` | Lines 124, 143 | Internal model archive; not a publishable citation | **Blocking** — needs data release DOI or SI reference |
| `Davis2012MiscanthusEcosystems` | Line 129 | DOI 10.1007/s10021-011-9503-6 could not be confirmed via search; may be wrong DOI or same paper as Davis2010 | **Unresolved** — manual verification required |
| `Arije2024SOCRecovery` | Line 75 | Journal listed as "Journal of Arid Environments or related journal" — exact bibliographic details unverified | **Requires verification** |

### 5b. Probable errors requiring manual verification

| Key | Location | Claim supported | Issue |
|-----|----------|----------------|-------|
| `Lal2001SoilSequestration` | Line 75 | "restoring SOC is a central strategy for improving soil productivity" | Stub; unknown exact paper |
| `Scharlemann2014GlobalSoilCarbon` | Line 75 | Cited alongside SOC restoration strategy — Scharlemann 2014 is about global soil C stocks, not restoration as a strategy; weak citation-claim fit | Verify topical fit |
| `Xu2024Placeholder` | Lines 178, 189 | Miscanthus root habit and below-ground biomass | Stub; unknown paper |
| `Chimento2015Placeholder` | Line 190 | Switchgrass produces more fine-root biomass than miscanthus, but total below-ground biomass is half | Stub; claim is counterintuitive and needs primary source |
| `Martani2021Placeholder` | Line 190 | Same claim as Chimento 2015 | Stub |
| `DelGrosso2005Placeholder` | Lines 129, 141 | r² = 0.74 for DAYCENT N₂O national validation | **Confirmed paper** (STR 83:9–24); specific r² value not yet confirmed from full text |
| `Jarecki2020Placeholder` | Lines 141, 168, 170 | DAYCENT validation and Illinois miscanthus rates | Stub; cited for both methods and quantitative comparison |
| `PermianBasinClimatePlaceholder` | Line 95 | Climate description (temperature, precipitation) | Stub |
| `EatonSalinityPlaceholder` | Line 95 | Saline soil challenges | Stub |

### 5c. Weak citation–claim fit (citations exist but fit is poor)

| Key | Location | Issue |
|-----|----------|-------|
| `Zeri2013WUE`, `VanLoocke2012WUE` | Line 78 | Cited for "deep root systems build SOC" — both are water-use efficiency papers | Cite `AndersonTeixeira2009SOC` or `Gelfand2013MarginalLands` instead |
| `Lal2004aDrylandEcosystems`, `Schimel2010Drylands` | Line 75 | Cited for "arid lands cover 45%…store 15% of global SOC" — Lal 2004a is about drylands broadly; the 45% and 15% figures need verification against actual cited-paper text | Verify exact figures |

### 5d. Factual claim verification

**"Arid lands cover 45% of Earth's land surface"**: Lal (2004a) covers *dryland ecosystems* broadly. The ~45% figure is consistent with estimates for all drylands (hyper-arid + arid + semi-arid + dry sub-humid), not strictly "arid lands." The manuscript should say "Drylands" or qualify the 45% figure.

**"store 15% of global SOC"**: Multiple sources estimate drylands storing 30–40% of global SOC in total (organic + inorganic). The 15% figure for organic SOC in strictly arid soils may be defensible but requires explicit verification against Lal 2004a and Schimel 2010.

**r² = 0.74 for DAYCENT N₂O**: Del Grosso et al. (2005) Soil & Tillage Research 83:9–24 is confirmed as a real paper. The specific r² statistic requires access to the full paper.

---

## 6. Math, Notation, and Technical Exposition

**CEC pedotransfer function.** The PTF is stated in Figure 7 caption as CEC_OM = 30 × pH (cmol_c kg⁻¹ OM) and CEC_clay = 25 cmol_c kg⁻¹. The parameter 30 is dimensionless (cmol_c per kg OM per pH unit) and should be written as 30 cmol_c kg⁻¹ OM pH⁻¹ to make the dimensional analysis explicit. Also, pH appears in the formula as a scalar — this is physically meaningful only if pH is on a log scale as usual (dimensionless), in which case the "per pH unit" interpretation needs a brief explanation. No uncertainty interval is given for the 30 coefficient.

**C:N ratios.** The manuscript cites active pool C:N ≈ 8:1 and slow pool ≈ 11:1 as "CENTURY 5 parameterization defaults." The NOTE comment in the LaTeX source acknowledges these may differ from the original Parton 1987 paper and from the values in Wang's calibrated `fix.100`. This discrepancy must be resolved before submission; if the model used different C:N values, the N mineralization calculation derived from the 8:1 ratio is wrong.

**N mineralization calculation.** The manuscript derives a plant-available N benefit from the estimated ΔN_organic and active-pool turnover time. This calculation is not shown. Provide the formula:

> N_min ≈ ΔN_active / τ_active

where ΔN_active = f_active × ΔN_organic and τ_active ≈ 2 yr. State what fraction f_active is assumed to be, and justify it.

**Pixel-area weighting.** The manuscript repeatedly reports "mean across pixels" without specifying whether these are arithmetic or area-weighted means. At 1 km resolution all pixels have equal area, so arithmetic = area-weighted — but this should be stated explicitly once.

---

## 7. Structure and Flow

**Introduction is missing a gap statement.** The introduction follows the pattern: global context → miscanthus/switchgrass advantages → Permian Basin context. It never states what has *not* been done before. Add a gap statement in the final paragraph.

**Limitation boxes are buried in Methods.** Three limitation blocks (`\textbf{Limitation: ...}`) appear in the Methods section and a fourth (parameter transfer) is currently only in a LaTeX comment, not in manuscript text. AEE papers commonly consolidate limitations in a dedicated subsection at the end of Results and Discussion, or as explicit paragraphs in Discussion. The current approach disperses them where readers are less likely to apply them when interpreting results.

**Soil nitrogen dynamics section conflates two topics.** §Soil nitrogen dynamics covers (a) N₂O flux (a gas-phase output) and (b) soil organic N storage and N mineralization potential (solid-phase). These are mechanistically separate and the section title covers both imprecisely. Either split into two subsections ("Soil N₂O flux" and "Soil organic nitrogen storage") or restructure to clearly separate them.

**Conclusions repeat the abstract.** The first two sentences of Conclusions are near-verbatim restatements of abstract sentences 3 and 5 ("Across all 48 scenario–land-cover combinations…" and "SOC gains translate…"). AEE reviewers expect Conclusions to synthesize beyond the abstract, not repeat it.

**Results opening sentence is undifferentiated.** "Miscanthus outperforms switchgrass in SOC accumulation, CEC gain, biomass yield, and soil nitrogen cycling in every scenario." — listing four outcome dimensions in one sentence without any quantitative anchor is a weak opening. Replace with the most striking single finding followed by a cross-reference to the key figure.

---

## 8. Sentence-Level and Prose Issues

**Line 75:** "Establishing high-biomass vegetation in these regions enhances net primary productivity and helps replenish SOC, and field studies show that transitioning barren land and shrubland to higher-biomass vegetation (such as grasslands or perennial crops) increases SOC and improves soil fertility \citep{Arije2024SOCRecovery}."
— The phrase "helps replenish SOC" is vague. The first clause overlaps with the second. Suggested rewrite: "Field studies show that transitioning barren land and shrubland to higher-biomass vegetation increases SOC and improves soil fertility \citep{Arije2024SOCRecovery}, with net primary productivity gains as the proximate driver."

**Line 78:** "Their deep root systems build SOC while above-ground biomass supports bioenergy production \citep{Zeri2013WUE,VanLoocke2012WUE,Gelfand2013MarginalLands}."
— Vague mechanism; citations are mostly WUE papers. Rewrite: "Their deep, high-turnover root systems transfer organic carbon to mineral soil horizons, building SOC while above-ground biomass supports bioenergy production \citep{Gelfand2013MarginalLands,AndersonTeixeira2009SOC}."

**Line 88:** "their year-round ground cover reduces soil erosion and preserves the organic matter that supports soil fertility \citep{Ferrarini2022Placeholder,Smeets2009Performance}."
— `Ferrarini2022Placeholder` is a stub; `Smeets2009Performance` is about bioenergy performance, not erosion. Verify both citations.

**Line 95:** "Annual rainfall remains low, around 300–355 mm (12–14 inches), and falls sporadically, mainly in late spring and early summer, contributing to frequent drought conditions."
— The parenthetical Fahrenheit equivalent was removed earlier in this session; confirm Fahrenheit is fully absent.

**Line 129:** "DAYCENT has been validated against measured N₂O flux data at national scale, with model-to-measurement agreement of r² = 0.74."
— This sentence is the primary credibility claim for the N cycling module. It currently appears mid-paragraph after a discussion of crop parameterization. Move to the Analytical workflow section where the model is introduced, so the validation credential appears where readers are evaluating model trustworthiness.

**Line 152 (Results opening):** "Miscanthus outperforms switchgrass in SOC accumulation, CEC gain, biomass yield, and soil nitrogen cycling in every scenario. Moisture availability is the primary differentiating factor: irrigated scenarios produce greater SOC accumulation and higher biomass productivity than rainfed counterparts across all three starting land covers."
— Combining a crop comparison with a management comparison in the same paragraph creates a flat list of conclusions rather than a narrative. These belong as separate topic sentences of separate paragraphs.

**Line 165:** "SOC rises in all scenarios (Figs. 3 and 4), consistent with prior reports…"
— Should state the mechanism, not just consistency with prior reports. Why does SOC rise in all scenarios? Because all scenarios replace lower-productivity baseline land covers with high-biomass perennial systems. State this explicitly.

---

## 9. Tables and Figures

| Figure | Status | Issues |
|--------|--------|--------|
| Fig 1 | ✓ Acceptable | Five-panel initial conditions. Caption accurate. A Word comment (preserved as LaTeX comment) requests replacement of precipitation with aridity index (PET/P) — worth considering for AEE reviewers given the paper's emphasis on moisture limitation |
| Fig 2 | ✓ Acceptable | Starting land cover + factorial design. Caption accurate. Fine print says "DAYCENT rev279" — verify this is the correct model version cited in Methods |
| Fig 3 | ✗ **Blocking** | x-axis in Mg CO₂e ha⁻¹; text in Mg C ha⁻¹. Caption note added (cycle 5) but figure must be regenerated |
| Fig 4 | ✗ **Blocking** | Color scale in Mg CO₂e ha⁻¹; text in Mg C ha⁻¹. Caption note added (cycle 5) but figure must be regenerated |
| Fig 5 | ✗ **Blocking** | y-axis in Mg CO₂e ha⁻¹; text in Mg C ha⁻¹. Caption note added (cycle 5) but figure must be regenerated |
| Fig 6 | ✗ **Blocking** | Biomass yield panel near-zero/negative for all scenarios. Caption claims "harvested only (8 of 16)" but appears to show all 16 rows. N₂O panel values appear consistent with reported text values (0.11–0.73 kg N₂O-N ha⁻¹ yr⁻¹). Must be regenerated |
| Fig 7 | ⚠ Verify | ΔCEC 0–30 cm. Caption and point geometry correct. Some shrubland scenario means at 2100 visually exceed the stated 5.0 cmolc/kg maximum — verify against data |
| Fig 8 | ✓ Acceptable | Spatial ΔCEC at 2100. Color scale capped at 99th percentile (10.33 cmolc/kg) as stated in caption. Caption note about all three land covers combined. |

**Additional figure recommended:** A map or table showing baseline SOC by land cover (year 2021 initial conditions) would anchor all the ΔSOC comparisons and is likely to be requested at review.

**Cross-reference check:** Figure 6 is referenced in §Biomass yield and §Soil nitrogen dynamics. Figure 7 is referenced in §Cation exchange capacity. Figure 8 is referenced in same section. All eight figures are referenced in the main text. No orphaned figures.

---

## 10. Recommended Revision Plan

### Must-fix before any submission

1. Regenerate Figures 3, 4, 5 with Mg C ha⁻¹ axes (blocking; entire quantitative narrative is ambiguous until resolved).
2. Investigate and fix Figure 6 biomass yield panel (blocking; review will fail immediately).
3. Verify the ΔN_organic values (1.2–3.7 kg N ha⁻¹) against DAYCENT output and correct units or calculation (blocking; probable error).
4. Replace `WangDAYCENTArchivePlaceholder` with a data release DOI or SI section reference (blocking; unciteable).
5. Report baseline SOC by land cover in §Study area or §Results opening.
6. Add an explicit novelty gap statement to the Introduction.
7. Move the MISC parameterization limitation from LaTeX comment into manuscript prose (§Discussion or a Limitations paragraph).

### Fix before final submission

8. Verify r² = 0.74 from Del Grosso et al. 2005 full text; confirm exact statistic.
9. Correct "arid lands 45%…15% SOC" to "drylands" and verify figures against Lal 2004a.
10. Replace all remaining `Placeholder` stub citations: prioritize `Xu2024`, `Chimento2015`, `Martani2021`, `Jarecki2020`, `PermianBasinClimatePlaceholder`, `EatonSalinityPlaceholder`, `Lal2001`, `Davis2012` DOI check.
11. Verify C:N ratios (8:1, 11:1) against Wang's actual `fix.100` parameter file.
12. Describe the N mineralization calculation explicitly in the text.
13. Move the r² = 0.74 validation sentence from §Crop parameterization to §Analytical workflow.
14. Split §Soil nitrogen dynamics into two subsections (N₂O flux; N storage and mineralization).
15. Fix Conclusions to not repeat the abstract verbatim.
16. Verify Figure 7 ΔCEC maximum against `soc_delta_summary.csv`.
17. Replace `Zeri2013WUE`/`VanLoocke2012WUE` at line 78 with SOC-focused citations.
18. Verify `Arije2024SOCRecovery` full bibliographic details.
19. Confirm DAYCENT model version in Figure 2 ("rev279") matches what is stated or implied in Methods.
20. Address Word comments: replace precipitation with aridity index in Figure 1 (panel 4) for better alignment with the moisture-limitation narrative.

### Optional improvements

21. Add an area-weighted mean ΔSOC (rather than arithmetic mean across 48 combinations) given the vast difference in pixel counts between land covers.
22. Add a brief paragraph on future directions: climate change sensitivity, site-specific calibration, economic feasibility.
23. Report Gelfand 2013 values explicitly in the abstract or key results sentence for direct context.

---

## 11. Residual Uncertainty

The following items could not be resolved from the supplied files or available web sources. These are explicitly marked unverifiable and must not be assumed correct without primary-source confirmation.

| Item | Why unresolvable here |
|------|----------------------|
| r² = 0.74 for DAYCENT N₂O validation (DelGrosso 2005) | Full text of STR 83:9–24 not retrieved; could not confirm the exact statistic |
| Exact figures from Lal 2004a (45%, 15%) | Full text not retrieved; multiple Lal 2004 papers; figures may refer to different dryland classifications |
| `Davis2012MiscanthusEcosystems` DOI and volume/pages | Could not confirm from web search; possible DOI mismatch |
| `Arije2024SOCRecovery` journal, volume, pages, DOI | Full bibliographic record not confirmed |
| `Xu2024Placeholder` — identity and content | Unknown paper |
| `Chimento2015Placeholder` and `Martani2021Placeholder` — whether switchgrass total below-ground biomass is "about half" that of miscanthus | Counterintuitive claim, primary sources not confirmed |
| `Jarecki2020Placeholder` — identity and content | Cited for both DAYCENT validation and Illinois miscanthus rates |
| Wang `fix.100` C:N values for active and slow pools | Internal archive not accessible; may differ from manuscript-cited values |
| ΔN_organic (1.2–3.7 kg N ha⁻¹) source | Could not determine whether from DAYCENT output variable or manual C:N calculation; possible unit error |
| Baseline SOC values by land cover | Analysis repo not mounted; `soc_delta_summary.csv` not accessible |
| Fu2022MiscanthusSOC full author list and volume/pages | DOI 10.1111/gcbb.12987 confirmed via web search; full record not retrieved |
