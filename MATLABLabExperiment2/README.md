# Noise Addition and Removal using MATLAB
<img width="1123" height="752" alt="image" src="https://github.com/user-attachments/assets/850ae5fb-0a8b-401b-8b6e-f44b311f78e5" />

## Objective
To simulate adding Gaussian white noise to a sinusoidal signal and removing it using a low-pass Butterworth filter.

## Parameters
- Sampling Frequency: 1000 Hz
- Signal Frequency: 5 Hz
- Noise Standard Deviation: 0.5
- Cutoff Frequency: 10 Hz
<img width="1117" height="743" alt="image" src="https://github.com/user-attachments/assets/6993f02b-5281-4aa4-85b1-c97b1a195c26" />

## Observations
1. Noise increases signal distortion.
2. Low-pass filter removes high-frequency noise.
3. SNR improves after filtering.
4. Trade-off between noise reduction and signal distortion.
<img width="1157" height="751" alt="image" src="https://github.com/user-attachments/assets/71bad311-7ec6-4aeb-94e0-b48d6e323ad8" />

## Results
SNR before filtering: (see MATLAB output)
SNR after filtering:  (see MATLAB output)

## Conclusion
The Butterworth filter effectively reduces noise while preserving low-frequency signal components.
