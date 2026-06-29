# EMRE CRADA Analysis — Soil Health Outcomes Under Land-Use Change to Perennial Biofuel Crops in the Permian Basin

**Branch:** `manuscript/soc-intro-results-slice`  
**Target journal:** Agriculture, Ecosystems & Environment (AEE)  
**Status:** Near submission-ready (June 2026)

## What this repository contains

| File | Purpose |
|------|---------|
| `main_soc.tex` | Primary manuscript (LaTeX, ~25 pages, 9 figures) |
| `references.bib` | Bibliography (biblatex/biber backend) |
| `supplementary_s1.tex` | Supplementary Table S1: full DAYCENT crop.100 parameter comparison (MISC vs. SG3) |
| `figures/figure[1-9].png` | All 9 manuscript figures |
| `docs/` | Session handoffs, adversarial review logs, citation verification reports |

## Abstract summary

This study uses DAYCENT biogeochemical modeling at 1 km resolution to evaluate soil organic carbon (SOC), biomass yield, N₂O flux, and cation exchange capacity (CEC) responses to land-use change to miscanthus or switchgrass across the Permian Basin (western Texas / SE New Mexico) under 16 management scenarios × 3 starting land covers, simulated 2021–2100.

**Key findings:**
- Mean ΔSOC at 2100: 14–85 Mg C/ha across 48 scenario–land-cover combinations
- Irrigation is the dominant management driver (+26.1 Mg C/ha main effect)
- ΔCEC: 0.9–7.4 cmol_c/kg in the top 30 cm
- Climate perturbation sensitivity: ±20% precip → ±5–22% ΔSOC; +2°C → +4–14% ΔSOC

## Compiling

Compile with biber backend:

```bash
pdflatex main_soc
biber main_soc
pdflatex main_soc
pdflatex main_soc
```

## Data and analysis

Analysis code, canonical simulation outputs, and figure generation scripts are in the companion repository:  
[dhetting/EMRE_CRADA_Analysis](https://github.com/dhetting/EMRE_CRADA_Analysis)

## Pre-submission checklist

- [x] All active citations verified with primary sources
- [x] All DAYCENT numerical claims cross-checked against data tables
- [x] R4-D1 through R4-D4 sensitivity analyses complete and in manuscript
- [x] 10-round adversarial review complete (3 consecutive clean passes)
- [ ] CRediT author contributions statement (authors)
- [ ] Acknowledgments (authors)
- [ ] Competing interests confirmation (authors, given CRADA status)
- [ ] Johnson2007BiomassCropping title/author verification (authors)
