## Measurement Data



# Wireless and Radiotechnology Course 2026 — Service Mode Cellular Measurements

## Objective
Explore and analyze cellular network parameters using smartphone service mode, and study how signal strength/quality changes with environment and network technology.

## Tools
- Smartphone with service mode access (Samsung: `*#0011#`; other Android: `*#*#4636#*#*`)
- (Optional) Speed test app (e.g., Ookla Speedtest) to correlate radio metrics with throughput and latency

## Parameters Observed
- Signal Strength: RSRP (dBm), 
- Signal Quality: RSRQ (dB), SNR/SINR (dB)
- Cell info: PCI, TAC, (Cell ID/ECGI if available)
- Carrier frequency: EARFCN / Band
- Bandwidth (MHz)

## Test Setup and Locations
Measurements were taken at multiple locations to compare:
- Indoors vs outdoors
- Near a window vs center of a building
- Different network technologies (3G/4G/5G) if supported

For each test point, the phone was kept stationary for ~10–20 seconds to allow values to stabilize, and parameters were recorded from ServiceMode.

## Measurement Data

| Point | Location/Condition | Tech | Band | BW (MHz) | EARFCN | Carrier (DL MHz) | PCI | TAC | RSRP (dBm) | RSRQ (dB) | SNR/SINR (dB) | Notes |
|------:|--------------------|------|------|---------:|-------:|-----------------:|----:|----:|-----------:|----------:|--------------:|------|
| A     | (fill)             | LTE  | 1    | 20       | 497    | ~2159.7          | 9   | 37922 | -85      | -9        | 9.6           | RRC=IDLE; NR not active |

### Frequency calculation
For LTE Band 1, downlink frequency is approximated by:
`f_DL ≈ 2110 MHz + 0.1 × EARFCN`.
For EARFCN 497: `f_DL ≈ 2159.7 MHz`.

## Observations and Analysis

### 1) Signal strength vs environment (RSRP)
- RSRP represents received reference-signal power. Less negative values indicate stronger coverage.
- Example from Point A: RSRP = -85 dBm indicates good LTE coverage (typically usable for stable data).

Expected trend:
- Outdoors or near a window → stronger (less negative) RSRP
- Deep indoors (walls, floors, concrete) → weaker RSRP due to attenuation

### 2) Signal quality (RSRQ, SNR/SINR) and interference/load
- RSRQ reflects quality and can degrade when interference increases or the cell is loaded.
- SNR/SINR indicates how clean the signal is compared to noise/interference. Higher values usually allow higher modulation and higher throughput.

Point A:
- RSRQ = -9 dB (fair/ok)
- SNR = 9.6 dB (moderate)
This suggests the link is usable, but quality is not extremely clean; throughput may be moderate depending on load.

### 3) How metrics affect performance
- Data speed:
  - Strong RSRP helps maintain connection, but high speed mainly requires good SINR/SNR (clean channel) and sufficient bandwidth.
- Network stability:
  - Poor RSRQ/SINR typically causes retransmissions, fluctuating throughput, and possible handovers.
- Connectivity reliability:
  - Very weak RSRP can lead to drops; low SINR can cause unstable data even when RSRP looks acceptable.

### 4) Technology notes (4G vs 5G)
In the captured screenshots, NR (5G) parameters are not active (`--`), meaning the device is currently operating on LTE only. `DCNR_RESTRICTION: TRUE` may indicate that 5G NSA dual-connectivity is restricted in this condition/operator policy or location.

## Conclusion
This experiment shows that smartphone service mode can provide detailed cellular metrics (RSRP, RSRQ, SNR, EARFCN, Bandwidth, PCI, TAC). Initial LTE results show good signal strength with moderate quality. Additional measurements across indoor/outdoor and network technologies will further demonstrate the impact of distance, obstructions, and interference/load on data speed, stability, and reliability.

## Files in this repository
- `screenshots/`: ServiceMode screenshots used for parameter extraction
- `data/measurements.csv`: Collected measurement table (editable)
