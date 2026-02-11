# SNR Effect on ASK Demodulation (MATLAB)

## Objective
Investigate how varying SNR affects demodulation performance of an ASK (OOK) communication system.

## Method
1. Generate random binary message bits (0/1)
2. Modulate using ASK (OOK): bit=1 -> carrier, bit=0 -> 0
3. Add AWGN at SNR = 10, 5, 0, -5 dB
4. Coherent demodulation: multiply by carrier + low-pass filter
5. Threshold decision and compute BER

## Results
BER values are printed in MATLAB Command Window for each SNR.
As SNR decreases, the received signal becomes more distorted and BER increases.

## Files
- `snr_ask_demod_experiment.m` : main MATLAB script
- `results/` : screenshots of plots (optional)
