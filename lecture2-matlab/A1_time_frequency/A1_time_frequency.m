% A1: Time domain and frequency components (FFT)
% Student: <Name>
% Student ID: <ID>

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;              % sampling frequency [Hz]
T  = 0.05;               % 50 ms
t  = 0:1/Fs:T-1/Fs;

%% 2) Create Vin(t) in mV
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

%% 3) Plot time domain (first 10 ms)
t_ms = t * 1000;
idx = (t_ms <= 10);

figure;
plot(t_ms(idx), Vin(idx), 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude [mV]');
title('A1: Time Domain of V_{in}(t)');
exportgraphics(gcf, 'A1_time.png', 'Resolution', 200);

%% 4) FFT (single-sided magnitude)
N = length(Vin);
X = fft(Vin);

% Frequency axis (0..Fs)
f = (0:N-1) * (Fs/N);

% Single-sided 0..Fs/2
halfN = floor(N/2) + 1;
f1 = f(1:halfN);
X1 = X(1:halfN);

% Magnitude (not normalized, fine for peak locations)
mag = abs(X1);

figure;
plot(f1, mag, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A1: FFT Magnitude (Single-sided)');
xlim([0 1200]);

% Mark expected peaks
hold on;
pkFreqs = [500 600 700 800];
for k = 1:numel(pkFreqs)
    [~, ii] = min(abs(f1 - pkFreqs(k)));
    plot(f1(ii), mag(ii), 'o', 'MarkerSize', 7, 'LineWidth', 1.5);
    text(f1(ii)+10, mag(ii), sprintf('%d Hz', pkFreqs(k)));
end
hold off;

exportgraphics(gcf, 'A1_spectrum.png', 'Resolution', 200);

