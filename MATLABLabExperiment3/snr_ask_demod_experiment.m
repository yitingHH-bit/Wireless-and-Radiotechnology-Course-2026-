clc; clear; close all;

%% Parameters
fs = 1000;                 % Sampling frequency (Hz)
t  = 0:1/fs:1;             % Time vector (1 second)
f_c = 50;                  % Carrier frequency (Hz)

SNR_list = [10 5 0 -5];    % SNR values in dB (given)

A = 1;                     % Carrier amplitude
lp_cutoff = 10;            % LPF cutoff for demod (Hz) - can tune
lp_order  = 4;             % Butterworth filter order

%% Generate binary message signal (0/1)
message_bits = randi([0 1], 1, length(t));

%% ASK Modulation (OOK): bit=1 -> carrier, bit=0 -> 0
carrier = A * cos(2*pi*f_c*t);
modulated = message_bits .* carrier;

%% Low-pass filter design (for demod)
[b,a] = butter(lp_order, lp_cutoff/(fs/2), 'low');

%% Prepare figure layout (one figure per SNR)
BER = zeros(size(SNR_list));

for i = 1:length(SNR_list)
    snr_db = SNR_list(i);

    %% Add AWGN to the modulated signal at given SNR
    received = awgn(modulated, snr_db, 'measured');

    %% Coherent demodulation
    % Multiply by carrier (mix down)
    mixed = received .* (2*cos(2*pi*f_c*t));  % factor 2 helps scaling

    % Low-pass filter to recover baseband
    baseband = filtfilt(b, a, mixed);

    %% Decision (threshold)
    % For OOK ASK, baseband should be near 0 (bit0) or positive (bit1)
    threshold = 0.25 * max(baseband);   % simple adaptive threshold
    detected_bits = baseband > threshold;

    %% BER
    BER(i) = mean(detected_bits ~= message_bits);

    %% Plotting
    figure('Name', sprintf('ASK Demodulation at SNR = %d dB', snr_db));

    subplot(3,1,1);
    plot(t, modulated);
    grid on;
    title('Original ASK Modulated Signal');
    xlabel('Time (s)'); ylabel('Amplitude');

    subplot(3,1,2);
    plot(t, received);
    grid on;
    title(sprintf('Received Signal with AWGN (SNR = %d dB)', snr_db));
    xlabel('Time (s)'); ylabel('Amplitude');

    subplot(3,1,3);
    plot(t, double(message_bits), 'LineWidth', 1.2); hold on;
    plot(t, double(detected_bits), '--', 'LineWidth', 1.0);
    grid on;
    ylim([-0.2 1.2]);
    title(sprintf('Demodulated Bits (BER = %.4f)', BER(i)));
    xlabel('Time (s)'); ylabel('Bit Value');
    legend('Original Bits','Detected Bits');
end

%% Print results table
fprintf('\n----- ASK Demodulation vs SNR Results -----\n');
for i = 1:length(SNR_list)
    fprintf('SNR = %4.0f dB  ->  BER = %.6f\n', SNR_list(i), BER(i));
end
fprintf('------------------------------------------\n');
