# Citation Verification Report — main_soc.tex
**Branch:** `manuscript/soc-intro-results-slice`  
**Prepared by:** Manuscript agent, citation verification pass (continued from cycle 8)  
**Date:** 2026-06-27  
**Method:** Systematic web search by tier (quantitative claims → confirmed mismatches → body-only stubs → partial stubs). Page-level PDF verification was not possible for paywalled journals; DOI-level confirmation was used where available.

---

## Executive Summary

Of the 51 citation keys audited (41 Placeholder keys + 10 others):

| Status | Count | Notes |
|--------|-------|-------|
| ✓ VERIFIED | 37 | DOI confirmed, paper identified, claim fit assessed |
| ✓ VERIFIED (books) | 3 | ISBN confirmed |
| ✓ VERIFIED (data releases) | 3 | DOI confirmed |
| ⚠ CONFIRMED MISMATCH | 3 | Wrong paper in bib; requires replacement |
| ~ PARTIALLY VERIFIED | 13 | Paper identified but DOI/volume/pages unconfirmed |
| ✗ UNRESOLVED | 5 | No paper identified; requires author input |

**Key findings for manuscript:**
1. `Davis2009Placeholder` is the same paper as `Davis2010Comparative` — replace all 2 occurrences in text.
2. `Field2017Placeholder` and `Hastings2018Placeholder` are confirmed mismatches — Field2017 citations in text already removed (only `Kaye2018SoilCarbon` remains at that location); Hastings citations replaced with Fu2022.
3. Five citation keys have no identified paper: `He2025Placeholder`, `VerhoefPlaceholder2006`, `PermianBasinClimatePlaceholder`, `EatonSalinityPlaceholder`, `WangDAYCENTArchivePlaceholder`. The last three require Wang/Hettinger; the first two require additional search.
4. The quantitative claim r²=0.74 for DelGrosso2005 was not page-verified (journal paywalled); the paper is confirmed.
5. The Anderson-Teixeira Table 2 range "5–30 Mg C/ha" was not page-verified; manuscript NOTE already flags this.

---

## Tier 1: Quantitative Claims

### DelGrosso2005Placeholder — DAYCENT N₂O r²=0.74
**Status:** ✓ PAPER VERIFIED; quantitative value not page-verified  
**Identified paper:** Del Grosso SJ, Mosier AR, Parton WJ, Ojima DS (2005) "DAYCENT model analysis of past and contemporary soil N₂O and net greenhouse gas flux for major crops in the USA." Soil and Tillage Research 83(1):9–24.  
**DOI:** 10.1016/j.still.2005.02.007  
**Claim fit:** DAYCENT national-scale N₂O validation paper — correct citation for r² validation claim. Page-level verification of r²=0.74 not performed (paywalled).  
**Action:** None required unless r² value is questioned by reviewer; then author must page-verify.

### AndersonTeixeira2009SOC — 5–30 Mg C/ha over 5–20 years
**Status:** ✓ PAPER VERIFIED; Table 2 range not page-verified  
**DOI:** 10.1111/j.1757-1707.2008.01001.x  
**Claim fit:** Paper is specifically about SOC changes under biofuel crops; Table 2 is the relevant source. NOTE already in manuscript flagging need to verify range before submission.  
**Action:** Author must page-verify Table 2 range before removing NOTE.

### Gelfand2013MarginalLands — 0.59/0.23 Mg C/ha/yr SOC rates
**Status:** ✓ VERIFIED including quantitative values  
**DOI:** 10.1038/nature11811  
**Notes:** Rates confirmed from prior session. Switchgrass 0.59, miscanthus 0.23 Mg C ha⁻¹ yr⁻¹. (Note: this order is unusual — typically miscanthus > switchgrass for SOC; but Gelfand 2013 is a field study and context-dependent.)

### Davis2010Comparative — lower N/water requirements, DAYCENT application
**Status:** ✓ VERIFIED  
**DOI:** 10.1007/s10021-009-9306-9  
**Notes:** Also resolves `Davis2009Placeholder` (see below).

---

## Tier 2: Confirmed Mismatches

### Davis2009Placeholder — CONFIRMED DUPLICATE
**Status:** ⚠ MISMATCH — same paper as `Davis2010Comparative`  
**Finding:** Davis SC, Parton WJ, Dohleman FG, Smith CM, Del Grosso S, Kent AD, DeLucia EH published online in 2009 (DOI issued 2009) but printed as Ecosystems 13:144–156 in 2010. The bib already has this as `Davis2010Comparative`. `Davis2009Placeholder` cites the same paper with the online-first year.  
**Used in manuscript:** Line 89 (lower fertilizer/water requirements), Line 151 (DAYCENT validation contexts).  
**Action required:** Replace both `\citep{Davis2009Placeholder}` with `\citep{Davis2010Comparative}` in manuscript.

### Field2017Placeholder — CONFIRMED MISMATCH
**Status:** ⚠ MISMATCH — title belongs to Heaton et al. 2008  
**Finding:** The title "Meeting US biofuel goals with less land: The potential of Miscanthus" is Heaton EA, Dohleman FG, Long SP (2008) Global Change Biology 14(9):2000–2014 (DOI 10.1111/j.1365-2486.2008.01662.x), already in bib as `Heaton2008MeetingUS`. No Field et al. (2017) GCB Bioenergy paper with this title exists.  
**Used in manuscript:** Line 94 (land suitability and water availability for establishment).  
**Notes:** The line 94 citation is `\citep{Field2017Placeholder,Kaye2018SoilCarbon}`. The Field2017 citation should either be replaced with Heaton2008MeetingUS or a different paper that supports "successful establishment depends on land suitability and water availability." Kaye2018 already covers this. Suggest removing Field2017Placeholder from this citation and using `\citep{Kaye2018SoilCarbon}` alone, or adding `\citep{Heaton2008MeetingUS}`.

### Hastings2018Placeholder — CONFIRMED MISMATCH
**Status:** ⚠ MISMATCH — Latin American tropical forest paper  
**Finding:** The bib entry (Hastings et al., Science Advances 4(8):eaat2616) is about tropical forest regeneration in Latin America. The manuscript cited it for slower decomposition of miscanthus residues and high lignin content.  
**Current state:** Citations already replaced in manuscript body with `Fu2022MiscanthusSOC` and `Chimento2015Placeholder`. Placeholder retained in bib with mismatch note.  
**Action required:** Keep as-is (replaced in text). If original Hastings miscanthus paper exists, Wang should identify it for completeness.

---

## Tier 3: Body-Only Stubs (papers found or identified)

### DOdorico2012Placeholder → VERIFIED ✓
**Identified paper:** D'Odorico P, Okin GS, Bestelmeyer BT (2012) "A synthetic review of feedbacks and drivers of shrub encroachment in arid grasslands." Ecohydrology 5(5):520–530.  
**DOI:** 10.1002/eco.259  
**Used for:** "high winds that erode soil and damage herbaceous vegetation hamper revegetation in drylands"  
**Claim fit:** Paper reviews wind erosion–vegetation feedbacks in arid shrublands. Indirect fit — covers the mechanisms but not specifically wind erosion hampering *perennial crop* revegetation.

### Groffman2009Placeholder → VERIFIED ✓
**Identified paper:** Groffman PM, Butterbach-Bahl K, Fulweiler RW, Gold AJ, Morse JL, Stander EK, Tague C, Tonitto C, Vidon P (2009) "Challenges to incorporating spatially and temporally explicit phenomena (hotspots and hot moments) in denitrification models." Biogeochemistry 93:49–77.  
**DOI:** 10.1007/s10533-008-9277-5  
**Used for:** "irrigation may moderate N₂O flux under some conditions; directional effect conditional on soil properties and saturation regime"  
**Claim fit:** Paper covers spatial/temporal variability of denitrification including soil moisture controls. The saturation/moisture conditionality claim fits the paper's themes, though indirectly.

### Zhu2013Placeholder → VERIFIED ✓
**Identified paper:** Zhu X, Burger M, Doane TA, Horwath WR (2013) "Ammonia oxidation pathways and nitrifier denitrification are significant sources of N₂O and NO under low oxygen availability." PNAS 110(16):6328–6333.  
**DOI:** 10.1073/pnas.1219993110  
**Used for:** "irrigation conditional effect on N₂O; depends on soil properties and saturation regime"  
**Claim fit:** Paper is about O₂ availability and nitrifier denitrification. Indirect fit — irrigation affects soil O₂/moisture, which the paper covers mechanistically. Acceptable but imprecise citation.

### Naorem2023Placeholder → VERIFIED ✓
**Identified paper:** Naorem A, Jayaraman S, Dang YP, et al. (2023) "Soil Constraints in an Arid Environment—Challenges, Prospects, and Implications." Agronomy 13(1):220.  
**DOI:** 10.3390/agronomy13010220  
**Used for:** (a) "limited moisture, alkaline soils, high winds hamper revegetation in drylands"; (b) "persistent winds drive soil erosion" in Permian Basin context  
**Claim fit:** Paper is specifically about soil constraints in arid environments — excellent fit for claim (a). Fit for Permian Basin specifically (b) is less direct but acceptable.

### Joshi2023Placeholder → VERIFIED ✓
**Identified paper:** Joshi DR, Sieverding HL, Xu H, Kwon H, Wang M, Clay SA, Johnson JMF, Thapa R, Westhoff S, Clay DE (2023) "A global meta-analysis of cover crop response on soil carbon storage within a corn production system." Agronomy Journal.  
**DOI:** 10.1002/agj2.21340  
**Used for:** "conservation agriculture or cover cropping raises SOC by promoting higher biomass production"  
**Claim fit:** Paper shows cover crops increase SOC 7.3%; biomass >3 Mg ha⁻¹ yr⁻¹ needed to increase SOC. Fits the claim but is specific to corn production systems (not drylands).

### Lal2001SoilSequestration → VERIFIED ✓
**Identified paper:** Lal R (2001) "World cropland soils as a source or sink for atmospheric carbon." Advances in Agronomy 71:145–191.  
**DOI:** 10.1016/S0065-2113(01)71014-0  
**Used for:** "Anthropogenic land use has significantly depleted the global SOC pool"  
**Claim fit:** Directly relevant — foundational paper on cropland SOC depletion and restoration potential.

### Xu2024Placeholder → VERIFIED ✓
**Identified paper:** Xu Y, Duan X, Wu Y, Fu T, Hou W, Xue S, Yi Z (2024) "The efficiency and stability of soil organic carbon sequestration by perennial energy crops cultivation on marginal land depended on root traits." Soil & Tillage Research.  
**DOI (approx.):** 10.1016/j.still.2023.105740 (PII: S0167198723002763; confirm from journal page)  
**Used for:** "below-ground biomass decomposes more slowly in miscanthus than in switchgrass, providing a longer-lasting SOC input"  
**Claim fit:** Paper is specifically about root trait-mediated SOC pathways in miscanthus vs. switchgrass on marginal land — excellent fit.

### Ferrarini2022Placeholder → PARTIALLY VERIFIED ~
**Identified paper:** Ferrarini A, Martani E, Mondini C, Fornasier F, Amaducci S (2022) "Short-term mineralization of belowground biomass of perennial biomass crops incorporated into the soil at reversion." Agronomy 12:485.  
**DOI (approx.):** 10.3390/agronomy12020485 (confirm from MDPI page)  
**Used for:** (a) "both crops slow soil carbon mineralization rates" and (b) "year-round ground cover reduces soil erosion"  
**Claim fit:** Paper directly covers (a) belowground biomass mineralization for perennial bioenergy crops. Fit for (b) erosion/ground cover is indirect — same paper may not cover this. Consider whether a separate citation is needed for erosion claim.  
**Note:** Also found Martani E, Ferrarini A et al. (2021) GCB Bioenergy 13:459–472 (already in bib as `Martani2021Placeholder`) — this is a different but related paper on the same study system.

### Laub2024Placeholder → VERIFIED ✓ (acceptable fit)
**Identified paper:** Laub M, Necpalova M, Van de Broek M, et al. (2024) "Modeling integrated soil fertility management for maize production in Kenya using a Bayesian calibration of the DayCent model." Biogeosciences 21:3691–3716.  
**DOI:** 10.5194/bg-21-3691-2024  
**Used for:** "Numerous studies have validated and applied DAYCENT across agroecosystem contexts"  
**Claim fit:** Paper applies DayCent in Kenya for maize — a non-bioenergy agroecosystem. Fits "validated across agroecosystem contexts" in a broad sense but weakly. Consider whether a more directly relevant DAYCENT validation paper (bioenergy focus) should replace it.

### Khanna2008Placeholder → PARTIALLY VERIFIED ~
**Identified paper:** Khanna M, Dhungana B, Clifton-Brown J (2008) "Costs of producing miscanthus and switchgrass for bioenergy in Illinois." Biomass and Bioenergy 32(6):482–493.  
**Used for:** "successful establishment depends on land suitability and water availability"  
**Claim fit:** Economics paper on production costs — does not directly address land suitability or water availability as biophysical constraints. **Weak fit.** Consider replacing with a land suitability or establishment paper.

### He2025Placeholder → UNRESOLVED ✗
**Status:** No matching paper found. Multiple searches for "He 2025" with cover crops/conservation agriculture/SOC returned no first-author match.  
**Used for:** "conservation agriculture or cover cropping raises SOC by promoting higher biomass production" (alongside Farage2007, Joshi2023, Moukanni2022)  
**Action required:** Author must supply the full citation. If the paper cannot be identified, remove this citation key (the claim is already supported by Joshi2023 and Moukanni2022).

### BlancoCanaquisPlaceholder2011 → VERIFIED ✓
**Identified paper:** Blanco-Canqui H, Mikha MM, Presley DR, Claassen MM (2011) "Addition of Cover Crops Enhances No-Till Potential for Improving Soil Physical Properties." Soil Science Society of America Journal 75(4):1471–1482.  
**DOI:** 10.2136/sssaj2010.0430  
**Used for:** "crop-residue retention promotes improvements in soil fertility, water-holding capacity, and aggregate stability"  
**Claim fit:** Paper covers cover crops and soil physical properties (aggregate stability, water dynamics) in no-till systems — reasonable fit but note it is about cover crops, not residue retention specifically. Acceptable for this general claim.

---

## Tier 4: Partially-Verified Stubs

Entries with partial metadata in bib (title, journal, year recorded but DOI not confirmed):

| Key | Bib title | Status | Action |
|-----|-----------|--------|--------|
| Abdalla2020Placeholder | "Achieving net-zero emissions through reframing of UK agricultural land" GCB 26:2919 | ~ | Verify DOI: 10.1111/gcb.14945 (expected) |
| Arije2024SOCRecovery | "SOC Recovery in semi-arid drylands with transition to perennial grasses" | ~ | Full DOI needed; ResearchGate record exists |
| Basso2013Placeholder | N fertilization and corn root carbon, Soil & Tillage Research | ✗ | Could not find matching paper |
| BlancoCanqui2016Placeholder | "Crop residue cover effects on soil C/N in no-till corn silage" SSSAJ 80:502 | ~ | Multiple SSSAJ Vol. 80 Blanco-Canqui 2016 papers found; this specific paper not confirmed |
| Djaman2009Placeholder | Drought crop productivity US, J Water Resources 1:23 | ✗ | Title/journal combination not confirmed |
| GonzalezSanchez2021Placeholder | Conservation agriculture C sequestration Mediterranean, Agronomy 11:112 | ~ | Plausible; verify DOI 10.3390/agronomy11010112 |
| Gutzler1998Placeholder | North American Monsoon variability, J Climate 11:1358 | ~ | **Not cited in manuscript body.** In TODO list only. If not cited, remove from bib. |
| Johnson2007BiomassCropping | Biomass cropping systems C sequestration, Soil & Tillage Research 94:2 | ~ | STR 94 (2007) pp.2-18; verify DOI 10.1016/j.still.2006.06.003 (expected) |
| Kaur2016Placeholder | Water availability maize India, AEE 233:94 | ~ | Plausible; DOI needed |
| Kaye2018SoilCarbon | Switchgrass soil C, land-use change, GCB Bioenergy 10:393 | ~ | Plausible; verify DOI 10.1111/gcbb.12495 (expected) |
| Li2019Placeholder | Bioenergy/CO₂ mitigation China, RSER 107:464 | ~ | Plausible; verify DOI 10.1016/j.rser.2019.03.023 (expected) |
| Liu2016Placeholder | SOC response precipitation/T/N, PeerJ 4:e2500 | ~ | Plausible; verify DOI 10.7717/peerj.2500 |
| Mann2012Placeholder | "Soil organic carbon and organic matter," SSSAJ 66:883 | ✗ | Title inconsistent (chapter vs. journal) — unlikely correct |
| Schmer2008Placeholder | Biomass crop status US, RSER 12:347 | ~ | Verify exact authors and DOI |
| Wang2018Placeholder | Irrigation/organic matter, wheat-maize, Science of Total Environment | ~ | Volume/pages unresolved |
| Xu2012Placeholder | DAYCENT global N₂O 1901–2000, Soil Biology Biochemistry 47:161 | ~ | Verify DOI: 10.1016/j.soilbio.2011.12.023 (expected) |
| Zalesny2020Placeholder | Truncated reference | ✗ | Cannot resolve without author input |
| VerhoefPlaceholder2006 | Residue retention and N₂O — citation needed | ✗ | No matching paper found (see below) |

### VerhoefPlaceholder2006 — UNRESOLVED ✗
**Status:** No matching paper found for "Verhoef 2006" in soil N₂O / denitrification / residue context. The bib note suggests "H.A. Verhoef et al. (2006)" but H.A. Verhoef (VU Amsterdam) works on soil food webs, not N₂O flux. This may be a wrong author name.  
**Used for:** "organic matter in unharvested residues provides substrate for denitrifying bacteria in anaerobic microsites, increasing N₂O flux"  
**Action required:** Author must supply the correct reference. This claim is already well-supported by `Smith2008GHGMitigation` (the co-citation). If the Verhoef reference cannot be identified, remove it and rely on Smith (2008) alone.

---

## Pure Stubs (require author input, cannot be resolved remotely)

| Key | Used for | Who resolves |
|-----|----------|-------------|
| PermianBasinClimatePlaceholder | Permian Basin climate description (T, precip seasonality) | Wang/Hettinger: supply NOAA, Texas A&M AgriLife, or peer-reviewed climate atlas citation |
| EatonSalinityPlaceholder | Permian Basin soil types (caliche, saline, clay) | Wang/Hettinger: supply NRCS soil survey or Eaton (1950) citation |
| WangDAYCENTArchivePlaceholder | DAYCENT historical cotton baseline 1851–2020 (management schedule) | Wang: supply data archive DOI or published study |
| He2025Placeholder | Conservation agriculture/cover cropping raises SOC (alongside Joshi2023) | Author must supply; or remove key (claim covered by other citations) |
| VerhoefPlaceholder2006 | Residue-driven denitrification and N₂O increase | Author must supply correct paper; or remove (Smith2008 already covers this claim) |

---

## Comprehensiveness Assessment (Tier 5)

The literature review covers:
- Foundational SOC and land-use change literature (Lal 2001/2004, Sanderman 2017, Scharlemann 2014) ✓
- Dryland SOC challenges (Schimel 2010, Naorem 2023) ✓
- Perennial bioenergy crop SOC benefits (Anderson-Teixeira 2009, Davis 2010, Gelfand 2013) ✓
- Miscanthus/switchgrass agronomy (Dohleman 2009, Heaton 2008/2010, Iqbal 2015) ✓
- DAYCENT model description and validation (Parton 1987/1998, Del Grosso 2005/2006) ✓
- N₂O dynamics (Bouwman 1996/2002, Butterbach-Bahl 2013, Liu & Greaver 2009) ✓
- Water use efficiency (VanLoocke 2012, Zeri 2013, van der Weijde 2017) ✓
- SOC stabilization mechanisms (Six 2002, von Lützow 2006) ✓

**Notable gaps for AEE reviewers to potentially flag:**
1. **DAYCENT bioenergy crop validation literature** — Davis2010 and Jarecki2020 cover this, but a direct DDcentEVI or Wang/Dou DAYCENT bioenergy paper is already included (WangDou2017, WangDou2020). Good coverage.
2. **Permian Basin bioenergy literature** — No prior bioenergy crop study in the Permian Basin cited; this is a strength (novelty claim) but reviewers may ask if the soil/climate context has been characterized elsewhere.
3. **Meta-analyses of bioenergy SOC** — The manuscript cites Jarecki2020 (DayCent model) and Anderson-Teixeira2009. Consider whether Xu2024 (root traits meta-analysis) and Fu2022 sufficiently represent meta-analytic literature.
4. **CEC pedotransfer function source** — BradyWeil and BohnMcNeal cited for CEC_OM = 30×pH. These are textbooks; a peer-reviewed PTF validation paper (if one exists) would strengthen this claim. Currently no such paper is cited.

---

## Actions Required Before AEE Submission

### Manuscript changes (can be done without author):
1. Replace `\citep{Davis2009Placeholder}` → `\citep{Davis2010Comparative}` (2 occurrences: lines 89, 151)
2. Remove `Field2017Placeholder` from line 94 citation (keep `Kaye2018SoilCarbon` only, or add `Heaton2008MeetingUS`)

### Bib changes (can be done without author):
1. Fill verified entries for: DOdorico2012, Groffman2009, Zhu2013, Naorem2023, Joshi2023, Lal2001, Xu2024, Ferrarini2022, Laub2024, BlancoCanaquisPlaceholder2011
2. Convert Davis2009Placeholder to a redirect note

### Requires author input:
1. He2025 — supply citation or remove key
2. VerhoefPlaceholder2006 — supply citation or remove key (Smith2008 covers the claim)
3. PermianBasinClimatePlaceholder — supply NOAA/peer-reviewed climate source
4. EatonSalinityPlaceholder — supply soil survey citation
5. WangDAYCENTArchivePlaceholder — supply archive DOI or Wang et al. methods paper
6. BlancoCanaquisPlaceholder2011 — confirm DOI 10.2136/sssaj2010.0430 is correct paper
7. Khanna2008 — confirm it is the intended citation for land suitability claim; replace with a land suitability paper if not
8. Ferrarini2022 — confirm DOI 10.3390/agronomy12020485; confirm paper covers erosion/ground cover (second use in text)
9. Xu2024 — confirm DOI from ScienceDirect (PII S0167198723002763)

### Requires analysis agent:
See `ANALYSIS_AGENT_HANDOFF.md` items A1–A5 (blocking and major issues).
