clc; clear; close all;

%% Parameters
fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/fs:1;              % Time vector (1 second)
f_signal = 5;              % Signal frequency (Hz)
amplitude = 1;             % Signal amplitude
noise_std = 0.5;           % Noise standard deviation
cutoff_frequency = 10;     % Low-pass cutoff frequency (Hz)

%% Generate Original Signal
original_signal = amplitude * sin(2*pi*f_signal*t);

%% Add Gaussian White Noise
noise = noise_std * randn(size(t));
noisy_signal = original_signal + noise;

%% Calculate SNR before filtering
signal_power = mean(original_signal.^2);
noise_power  = mean(noise.^2);
SNR_before = 10*log10(signal_power / noise_power);

%% Design Butterworth Low-Pass Filter
[b,a] = butter(4, cutoff_frequency/(fs/2), 'low');

%% Filter Signal
filtered_signal = filtfilt(b, a, noisy_signal);

%% Estimate residual noise after filtering
residual_noise = filtered_signal - original_signal;
residual_noise_power = mean(residual_noise.^2);
SNR_after = 10*log10(signal_power / residual_noise_power);

%% ------------------ PLOTS ------------------

figure;
plot(t, original_signal, 'LineWidth', 1.5);
grid on;
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
plot(t, noisy_signal);
grid on;
title(sprintf('Noisy Signal (SNR = %.2f dB)', SNR_before));
xlabel('Time (s)');
ylabel('Amplitude');

figure;
plot(t, filtered_signal, 'LineWidth', 1.5);
grid on;
title(sprintf('Filtered Signal (SNR = %.2f dB)', SNR_after));
xlabel('Time (s)');
ylabel('Amplitude');

%% Summary in Command Window
fprintf('\n---- Noise Removal Experiment Summary ----\n');
fprintf('Signal Frequency: %.2f Hz\n', f_signal);
fprintf('Noise Std Dev: %.2f\n', noise_std);
fprintf('Cutoff Frequency: %.2f Hz\n', cutoff_frequency);
fprintf('SNR before filtering: %.2f dB\n', SNR_before);
fprintf('SNR after filtering:  %.2f dB\n', SNR_after);
fprintf('------------------------------------------\n');
