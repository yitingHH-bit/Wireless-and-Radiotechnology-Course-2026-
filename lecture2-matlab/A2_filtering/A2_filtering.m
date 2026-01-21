
% A2: Filtering a multi-tone signal (2 figures only)
% Student: <Name>
% Student ID: <ID>

clear; close all; clc;

%% 1) Time vector
Fs = 10000;
T  = 0.2;                 % better frequency resolution
t  = 0:1/Fs:T-1/Fs;

%% 2) Create Vin(t)
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

%% Helper: FFT magnitude (single-sided)
function [f1, mag1] = fft_mag_single(x, Fs)
    N = length(x);
    X = fft(x);
    halfN = floor(N/2) + 1;          % DC..Nyquist
    f1 = (0:halfN-1) * (Fs/N);
    mag1 = abs(X(1:halfN));
end

%% Helper: remove axes toolbar from exported image
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

%% 3) FFT BEFORE filtering (save A2_before.png)
[f_before, mag_before] = fft_mag_single(Vin, Fs);

figure;
plot(f_before, mag_before, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A2: Spectrum BEFORE filtering');
xlim([0 1200]);
remove_axes_toolbar();
exportgraphics(gcf, 'A2_before.png', 'Resolution', 200);

%% 4) Choose ONE filter case to demonstrate (example: extract ~500 Hz)
% Allowed filter types: LPF/HPF/BPF/BSF
% Here we use Butterworth LPF + filtfilt (engineering baseline)

order = 6;
Fc = 550;                               % cutoff between 500 and 600
[b, a] = butter(order, Fc/(Fs/2), 'low');% LPF
y = filtfilt(b, a, Vin);                % zero-phase filtering

%% 5) FFT AFTER filtering (save A2_after.png)
[f_after, mag_after] = fft_mag_single(y, Fs);

figure;
plot(f_after, mag_after, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A2: Spectrum AFTER filtering (LPF, target ~500 Hz)');
xlim([0 1200]);
remove_axes_toolbar();
exportgraphics(gcf, 'A2_after.png', 'Resolution', 200);
