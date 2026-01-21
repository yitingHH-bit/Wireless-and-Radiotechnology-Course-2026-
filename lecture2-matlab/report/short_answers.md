# Short Answers (Lecture-2)

## Q1
Time domain shows how a signal changes with time (amplitude vs. time).
It helps us see waveform shape, duration, and timing (e.g., pulses, transients).
Frequency domain shows which sinusoidal frequencies are present and their strengths.
It helps us identify tones, harmonics, bandwidth, and noise distribution.
FFT converts sampled time-domain data into a frequency-domain representation.
Both describe the same signal but highlight different properties.

## Q2
RF receivers pick one desired signal while many other signals/noise exist in the band.
Filtering passes the wanted frequency range and suppresses out-of-band interference.
This improves SNR and reduces distortion from strong adjacent-channel signals.
Filters also protect later stages (mixer/ADC/amplifier) from overload or saturation.
In practice, filters enable channel selection and cleaner demodulation.

## Q3
Modulation shifts a low-frequency baseband message to a higher carrier frequency.
This makes wireless transmission practical (smaller antennas at higher frequencies).
It allows multiple users/channels to coexist by assigning different carrier frequencies.
Modulation also supports long-distance propagation and spectrum allocation.
In AM-style multiplication, information appears as sidebands around the carrier.

## Q4
The easiest filter to design was LPF or HPF because it needs only one cutoff frequency.
You can place the cutoff between two known tones (e.g., between 500 and 600 Hz).
This makes the design choice straightforward and intuitive.
Bandpass/bandstop need two cutoffs and careful bandwidth selection.
So LPF/HPF is the simplest “beginner engineering baseline”.

## Q5
After modulation by multiplication, new frequency components appear at fc ± fm.
For fm = 100 Hz and fc = 2000 Hz, peaks appear near 1900 Hz and 2100 Hz.
This is called frequency translation (sidebands around the carrier).
In a full (two-sided) spectrum, mirrored components also appear at negative frequencies.
In the single-sided FFT plot, we mainly observe the positive-frequency sidebands.
