# Cycle 9 Handoff: HPC H5 Extraction Results

**Commits:** Analysis b7759b2 / Manuscript a4740b2
**Date:** 2026-06-26

---

## What was done

### HPC exploration and data extraction
- Confirmed H5 archive at `/kfs2/projects/emrecrada/runs/permian_basin_08_26_2023/`
  - `lis_{scenario}.h5`: somtc (aggregate), irrtot, volpac, strmac(2) — NO per-layer SOC
  - `yearly_{scenario}.h5`: N2Oflux, NOflux, CH4_oxid — annual, 2021–2100
- SLURM job 14635424 extracted:
  - `outputs/tables/n2o_annual_trajectories.csv` — 2560 rows (16sc × 2LC × 80yr)
  - `outputs/tables/soc_annual_trajectories.csv` — 3888 rows (16sc × 3LC × 81yr)
  - `outputs/tables/n2o_cumulative_summary.csv` — cumulative totals per scenario-LC

### Key results from extraction

**N2O (annual, 2021–2100):**
- Endpoint range at 2100: 0.011–0.068 g N₂O-N m⁻²/yr (shrubland + cultivated_rfd)
- Cumulative 2021–2100: 10–59 kg N₂O-N/ha
- Factor main effects on cumulative N₂O:
  - Fertilization: 42 vs 19 kg N₂O-N/ha (2.2× ratio)
  - Irrigation: 37 vs 25 kg N₂O-N/ha
  - Harvest: 32 vs 29 kg N₂O-N/ha (minimal)
  - Crop: 31 vs 30 kg N₂O-N/ha (negligible)

**SOC trajectory:**
- Annual resolution 2021–2100 now available (was: only 2030, 2050, 2100)
- Values match canonical CSV at 2030/2050/2100 checkpoints ✓

**Figures updated:**
- Figure 5: smooth annual SOC trajectories (80 points/line)
- Figure 6: annual N2O trajectories (replaces 2100-endpoint boxplots)

### Permanently confirmed blockers

| Item | Status | Reason |
|---|---|---|
| R6 (layer-specific SOC) | **BLOCKED** | H5 files have only aggregate `somtc`; DAYCENT was not configured for per-layer output |
| R7 (biomass yield/crmvst) | **BLOCKED** | `crmvst` not in any h5 output; not extractable from archive |
| R9 (SOC validation vs gSSURGO) | **BLOCKED** | Depends on R6 |
| CEC root-fraction validation | **BLOCKED** | Would require per-layer somtc (R6) |

The CEC section in the manuscript already has explicit caveats about the root-fraction proxy. No further action possible without re-running DAYCENT with per-layer output enabled.

---

## Still open for online agent

See `docs/CYCLE8_HANDOFF.md` priorities — unchanged. Citation verification pass is the top priority.

