clc; clear; close all;

%% Parameters (given)
B = 1e6;          % Bandwidth (Hz) = 1 MHz
R = 100;          % Resistance (ohms)
T = 300;          % Temperature (K)
k = 1.38e-23;     % Boltzmann constant (J/K)

%% Noise generation
n_samples = 10000;

% Sampling time based on bandwidth (as given in your instructions)
time = 0 : 1/B : (n_samples-1)/B;

% Thermal noise (RMS voltage over bandwidth B)
thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

%% Plot: Time domain
figure;
plot(time, thermal_noise);
grid on;
xlabel('Time (s)');
ylabel('Noise Voltage (V)');
title(sprintf('Thermal Noise (Time Domain) | B=%.0f Hz, R=%d \\Omega, T=%d K', B, R, T));

%% PSD analysis (Welch)
[psd, freq] = pwelch(thermal_noise, [], [], [], B);

figure;
semilogx(freq, 10*log10(psd));
grid on;
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density (Welch)');

%% Print some useful observations
noise_rms_measured = rms(thermal_noise);
noise_rms_theory   = sqrt(4*k*T*R*B);

fprintf('\n--- Thermal Noise Summary ---\n');
fprintf('B = %.2e Hz, R = %.2f ohm, T = %.2f K\n', B, R, T);
fprintf('Theoretical Vrms = %.3e V\n', noise_rms_theory);
fprintf('Measured    Vrms = %.3e V\n', noise_rms_measured);
fprintf('----------------------------\n');
