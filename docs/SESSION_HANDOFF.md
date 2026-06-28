# Session Handoff — main_soc.tex Manuscript Agent
**Branch:** `manuscript/soc-intro-results-slice`  
**Last commit:** `7f81742`  
**Date:** 2026-06-28  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)

---

## Current state (as of 2026-06-28 morning session)

The manuscript has gone through extensive adversarial review (10 rounds verified correct) and all major analysis tasks (R4-D1 through R4-D4) are complete. The following changes were made in this session on top of cycles 11-16 from a prior agent:

### Critical correction made this session
- **N₂O trend (cycle 11 error)**: Cycle 11 incorrectly reversed the N₂O trend to "declining 0.041→0.035". Data confirms the trend is RISING (first decade 0.035 → last decade 0.041 g/m²/yr). The cumulative exceeds endpoint×79 because year 2100 falls in a lower-flux phase of the 41-year repeating meteorological cycle, not because of a declining trend. **Fixed.**

### Optional enhancements implemented this session
- **OE-5**: Added 1 sentence on inter-pixel spatial variability (IQR 25–60 Mg C/ha, CV≈0.60)
- **OE-6**: Added Supplementary Table S2 — literature comparison of SOC accumulation studies
- **OE-8**: Quantified pH clipping bias as negligible (<1% domain-wide impact)

---

## What remains open before submission

### Requires author input (not agent-resolvable)
| Issue | Notes |
|-------|-------|
| CRediT author contributions | AEE requires formal CRediT statement; stubs in manuscript |
| Acknowledgments | Stub in place |
| EatonSalinityPlaceholder → NRCSgSSURGOPlaceholder | Cycle 13 substituted NRCSgSSURGO for soil-types citation; verify this is acceptable or supply a more targeted soils reference |
| Wang2018Placeholder | Still unfindable; authors must supply or remove |
| WangDAYCENTArchivePlaceholder | Removed from in-text citation in cycle 13; bib stub remains; should confirm removal is acceptable |
| A4: AndersonTeixeira 5–30 Mg C/ha | NOTE in source pending page-level verification (paywalled); author should verify from Table 2 of GCB Bioenergy 1:75–96 |
| USGS Province 044 boundary | DOI 10.5066/P19COBRF cited; author should verify against actual shapefile provenance |

### Requires HPC computation (agent-executable with user authorization)
| Item | Description | Effort |
|------|-------------|--------|
| OE-4: PET ≈1700 mm/yr | Compute from Daymet 1980–2020 using Hargreaves-Samani or FAO-56; add citation + value. HPC job ~30 min | Medium |
| OE-7: Scenario-mean ΔSOC spatial map | Modify figure4 R script to produce scenario-mean map instead of all-16-scenarios facet. Already have data. | Medium |

---

## What has been resolved

| Item | Status |
|------|--------|
| B1 pH bug | Resolved — fill corrected, 8% below 5.5, capped at 5.5, bias <1% |
| B2 Supplementary Table S1 | Exists — supplementary_s1.tex has full 112-parameter comparison |
| R4-D1 Initial SOC validation | Done — 5.7 vs 20.7 Mg C/ha, 3.6-fold active+slow pool comparison |
| R4-D2 PRDX sensitivity | Done — 8 Mg C/ha/PRDX unit, ±7% sensitivity |
| R4-D3 soiln.out | Done — exploratory ammonium results in manuscript |
| R4-D4 Climate perturbation | Done — Table 1 with ±20% precip and +2°C results |
| R4-D5 irrtot units | Done — corrected to 88 cm/yr |
| R4-V1 pH lower bound | Done — 14,626 (8%) below 5.5, clipped |
| All 10-round adversarial review | Done — commits 6dd5d9a, 04af60e |
| He2025Placeholder | Removed from manuscript |
| PermianBasinClimatePlaceholder | Replaced with NWS Midland 1991–2020 Climate Normals |
| Davis2010 DAYCENT attribution | Confirmed — Davis2010 is a DAYCENT simulation study |
| Davis2010 author list | Fixed — 7-author list corrected |
| N₂O direction text | Fixed (rising 0.035→0.041, not declining) |
| Cool winters wording | Clarified to "mean daily high temperatures of 10–15°C" |
| Data Availability, Competing Interests sections | Added as stubs |

---

## Key constraints for next agent

- New DAYCENT runs are permitted.
- Wang is unavailable. Do not assign any action to Wang; use "should be confirmed before submission."
- Git identity: Use env vars `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`.
- Git locks: If `index.lock` or `HEAD.lock` exist, remove `.git/HEAD.lock` first.
- Biber backend: compile with `pdflatex → biber → pdflatex → pdflatex`.

---

## File map

| File | Purpose |
|------|---------|
| `main_soc.tex` | Primary manuscript (23 pages; includes Supplementary Tables S1, S2) |
| `supplementary_s1.tex` | Supplementary Table S1 — full crop.100 parameter comparison (MISC vs. SG3) |
| `references.bib` | Bibliography; Wang2018Placeholder still unresolved; ~30 Placeholder stubs need online verification |
| `docs/ADVERSARIAL_REVIEW_R4.md` | Round 4 review — run recommendations |
| `docs/ADVERSARIAL_REVIEW_R5.md` | Round 5 review — text bugs, N₂O, pool comparison, PPDF |
| `docs/CITATION_VERIFICATION_REPORT.md` | Full citation verification status (cycle 9) |
