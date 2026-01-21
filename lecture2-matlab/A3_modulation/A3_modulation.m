% A3: Modulation by multiplication (2 figures only)
% Output:
%   A3_baseband.png  (time + spectrum in one figure)
%   A3_passband.png  (time + spectrum in one figure)
%
% Student: <Name>
% Student ID: <ID>

clear; close all; clc;

%% 1) Time vector
Fs = 20000;
T  = 0.1;
t  = 0:1/Fs:T-1/Fs;

%% 2) Baseband and carrier
fm = 100;        % message frequency [Hz]
fc = 2000;       % carrier frequency [Hz]

m = sin(2*pi*fm*t);      % baseband
c = cos(2*pi*fc*t);      % carrier

%% 3) Modulated (passband)
s = m .* c;

%% Helper: FFT (single-sided magnitude)
function [f1, mag1] = fft_mag_single(x, Fs)
    N = length(x);
    X = fft(x);
    halfN = floor(N/2) + 1;          % DC..Nyquist
    f1 = (0:halfN-1) * (Fs/N);
    mag1 = abs(X(1:halfN));
end

%% Helper: remove axes toolbar in exported images
function remove_axes_toolbar()
    try
        ax = gca;
        if isprop(ax, "Toolbar") && ~isempty(ax.Toolbar)
            ax.Toolbar.Visible = "off";
        end
    catch
    end
    try
        set(gcf, 'ToolBar', 'none');
    catch
    end
end

%% =========================
% Figure 1: BASEBAND (time + spectrum)
%% =========================
[f_m, mag_m] = fft_mag_single(m, Fs);

figure;

% (Top) time domain
subplot(2,1,1);
plot(t*1000, m, 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Baseband m(t) (Time Domain)');
xlim([0 50]);  % show first 50 ms (clean view)

% (Bottom) spectrum
subplot(2,1,2);
plot(f_m, mag_m, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Baseband m(t) (Spectrum)');
xlim([0 1000]);

% Remove toolbar from both subplots then export
subplot(2,1,1); remove_axes_toolbar();
subplot(2,1,2); remove_axes_toolbar();
exportgraphics(gcf, 'A3_baseband.png', 'Resolution', 200);

%% =========================
% Figure 2: PASSBAND (time + spectrum)
%% =========================
[f_s, mag_s] = fft_mag_single(s, Fs);

figure;

% (Top) passband time domain (zoom first 5 ms)
subplot(2,1,1);
idx = (t <= 0.005);
plot(t(idx)*1000, s(idx), 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Passband s(t) = m(t)\cdot cos(2\pi f_c t) (Time, 0–5 ms)');

% (Bottom) passband spectrum
subplot(2,1,2);
plot(f_s, mag_s, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Passband s(t) (Spectrum)');
xlim([0 5000]);

% Mark expected sidebands at fc±fm (1900, 2100 Hz)
hold on;
targets = [fc-fm, fc+fm];
for k = 1:numel(targets)
    [~, ii] = min(abs(f_s - targets(k)));
    plot(f_s(ii), mag_s(ii), 'o', 'MarkerSize', 7, 'LineWidth', 1.5);
    text(f_s(ii)+30, mag_s(ii), sprintf('%d Hz', round(targets(k))));
end
hold off;

% Remove toolbar then export
subplot(2,1,1); remove_axes_toolbar();
subplot(2,1,2); remove_axes_toolbar();
exportgraphics(gcf, 'A3_passband.png', 'Resolution', 200);

