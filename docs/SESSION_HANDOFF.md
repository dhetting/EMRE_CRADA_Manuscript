# Session Handoff — main_soc.tex Manuscript Agent
**Branch:** `manuscript/soc-intro-results-slice`  
**Last commit:** see `git log --oneline -3` (cycle 9 citation verification)  
**Date:** 2026-06-27  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)

---

## What was done this session (cycles 7–9)

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

## Cycle 10 additions — Round 4 Adversarial Review

See `docs/ADVERSARIAL_REVIEW_R4.md` for full findings. Summary:

**New DAYCENT runs are now permitted.** Key recommendations in priority order:
1. Initial SOC validation (year-2021 DAYCENT SOC vs. gSSURGO Valu1) — BLOCKING for submission
2. PRDX(1) sensitivity analysis (MISC at 3.0, 3.25, 3.75) — single parameter drives entire MISC/SWI SOC gap
3. Verify irrigation demand: `irrtot` = 3.4 cm/yr seems implausibly low for semi-arid irrigated perennial grass; verify units and water balance
4. Climate perturbation runs (±20% precip, +2°C) on 4 key scenarios
5. Enable `soiln.out` to close nitrogen balance

**Directly-fixed issues this cycle:**
- VerhoefPlaceholder2006 → Miller2008SoilBio (SBB 40:2553, DOI 10.1016/j.soilbio.2008.06.024)
- Jarecki2020 geographic error: "Illinois" → "humid temperate" (Jarecki2020 is Ontario, not Illinois)
- CO₂ limitation sentence: added that C4 grasses have limited CO₂ response (C4 CCM suppresses photorespiration)
- Conclusions limitation (5): extended to include "early-year SOC accumulation rates" (m7 resolved)
- "consistently show" → "consistently indicate" in Conclusions opener
- Supplementary table note: now explicitly states all 112 crop.100 parameters were compared; only PRDX(1) differs
- Harvest N₂O sentence: added ButterbachBahl2013 citation (Word comment resolved)
- Miller2008SoilBio added to references.bib as verified @article

**Still open (major, requires analysis):**
- pH lower bound after B1 fix: pH minimum 4.5; pixels below PTF validity (5.5) not yet reported
- Anderson-Teixeira 5–30 Mg C/ha: NOTE still in manuscript pending page-level verification (A4)
- Cumulative N₂O 10–15% above endpoint rate: no explanatory sentence yet (A5)
- Irrigation demand 3.4 cm/yr: verify units and water balance plausibility

---

## Cycle 9 additions — Citation Verification Pass

See `docs/CITATION_VERIFICATION_REPORT.md` for full details. Summary:

**Resolved in references.bib and manuscript:**
- Davis2009Placeholder → confirmed same paper as Davis2010Comparative; replaced in text (2 occurrences)
- Field2017Placeholder → confirmed mismatch; removed from manuscript (line 94, kept Kaye2018SoilCarbon)
- 11 body-only stubs converted to verified @article entries: DOdorico2012, Groffman2009, Zhu2013, Naorem2023, Joshi2023, Lal2001, Xu2024, Ferrarini2022, Laub2024, BlancoCanaquisPlaceholder2011
- BlancoCanqui2016 search found "Growing dedicated energy crops on marginal lands" (SSSAJ 80:845) — note this is a DIFFERENT paper from the bib entry (SSSAJ 80:502); bib entry kept as-is, needs author verification

**Still unresolved (5 stubs, require author input):**
- He2025Placeholder — no matching paper found; claim covered by Joshi2023 + Moukanni2022
- VerhoefPlaceholder2006 — no matching paper found; claim covered by Smith2008GHGMitigation
- PermianBasinClimatePlaceholder — needs NOAA/peer-reviewed climate source from Wang/Hettinger
- EatonSalinityPlaceholder — needs soil survey citation from Wang/Hettinger
- WangDAYCENTArchivePlaceholder — needs archive DOI from Wang

**Actions before submission (low effort):**
- Verify ~13 partially-confirmed bib entries (DOIs listed in CITATION_VERIFICATION_REPORT.md)
- Confirm Ferrarini2022 covers erosion/ground cover (second usage at line 89)
- Confirm Khanna2008 is intended citation for land suitability claim (or replace)

---

## Open major issues (needed before submission)

| ID | Issue | Priority | Who resolves |
|----|-------|----------|-------------|
| R4-D1 | Initial SOC validation (DAYCENT year-2021 vs. gSSURGO Valu1 0–30 cm) | BLOCKING | Analysis agent — run now possible |
| R4-D2 | PRDX(1) sensitivity: MISC at 3.0, 3.25, 3.75 to quantify SOC sensitivity | MAJOR | Analysis agent — new runs |
| R4-D5 | Irrigation demand 3.4 cm/yr implausibly low — verify `irrtot` units + water balance | MAJOR | Analysis agent |
| R4-V1 | pH lower bound after B1 fix: how many pixels below PTF validity (pH <5.5)? | MAJOR | Analysis agent |
| A4 | Anderson-Teixeira 5–30 Mg C/ha range not page-verified (NOTE in text) | MAJOR | Analysis agent |
| A5 | Cumulative N₂O 10–15% above endpoint back-calc — no explanation in text | MAJOR | Analysis agent → manuscript agent adds 1 sentence |
| R4-D3 | Enable soiln.out for soil nitrogen balance | MAJOR | Analysis agent — new runs |
| R4-D4 | Climate perturbation runs (±20% precip, +2°C) for uncertainty bounds | MAJOR | Analysis agent — new runs |
| A3 | agcacc method documented (line 163) | RESOLVED (cycle 17) | — |
| — | 4 UNRESOLVED citation stubs (He2025, PermianBasinClimate, EatonSalinity, WangDAYCENTArchive) | — | Author input required |
| R4-m4 | CRediT author contributions statement | MINOR | Authors |

---

## Minor issues (pre-submission polish)

- Figure 1 caption: "DAYMET" → "Daymet" (official capitalization)
- Figure 6 caption: "40-year repeating meteorological cycle" → "41-year" (1980–2020 inclusive = 41 years)
- Conclusions limitation (5): extend early-year overestimate caveat from yield to early-year SOC
- Permian Basin boundary provenance (`data/permian_basin_boundary_32614_1km.shp`) should be confirmed against USGS Province 044 DOI 10.5066/P19COBRF before submission

---

## Key constraints for next agent

- **New DAYCENT runs ARE now permitted.** Priority: initial SOC validation, PRDX(1) sensitivity, climate perturbation, soiln.out.
- **Wang is unavailable.** Do not assign any action to Wang; use "should be confirmed before submission."
- **Git identity:** Use env vars `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`.
- **Git locks (VirtioFS):** If `index.lock` or `HEAD.lock` exist, use `python3 -c "import os; os.rename('.git/index.lock', '.git/index.lock.bak')"` — `unlink` is not permitted.
- **Biber backend:** `biblatex` with `backend=biber`; compile with `pdflatex → biber → pdflatex → pdflatex`.

---

## File map

| File | Purpose |
|------|---------|
| `main_soc.tex` | Primary manuscript |
| `supplementary_s1.tex` | Supplementary Table S1 — full crop.100 parameter comparison (MISC vs. SG3) |
| `references.bib` | Bibliography; 4 unresolved stubs; Miller2008SoilBio added cycle 10 |
| `docs/ADVERSARIAL_REVIEW_R4.md` | Round 4 review findings (cycle 10) — new DAYCENT run recommendations |
| `docs/CITATION_VERIFICATION_REPORT.md` | Full citation verification status for all 51 keys (cycle 9) |
| `docs/ADVERSARIAL_REVIEW_R3.md` | Round 3 review findings (cycle 8) |
| `docs/ANALYSIS_AGENT_HANDOFF.md` | Precise data requests for analysis agent (update with R4-D1–D6 from R4 review) |
| `docs/ADVERSARIAL_REVIEW.md` | Earlier review cycles (rounds 1–2) |
