%% communication_assignment.m
% Assignment: WiFi vs Bluetooth vs Cellular performance vs distance
% Using Friis transmission equation, compute:
% (1) Received power Pr (dB)
% (2) SINR (dB)
% (3) Channel capacity (shown in dB as 10*log10(C))
%
% Notes:
% - Pr is in W, converted to dB using 10log10(Pr)
% - SINR is linear, converted to dB using 10log10(SINR)
% - Capacity C is in bps, plotted as 10log10(C) to match "Capacity (dB)"

clear; close all; clc;

%% Common parameters
G_t = 1;                 % Tx antenna gain
G_r = 1;                 % Rx antenna gain
c   = 3e8;               % speed of light (m/s)
Pn  = 500e-6;            % noise power (W)

%% ===================== Task 1: WiFi =====================
f_wifi     = 2.4e9;      % IEEE 802.11b (Hz)
BW_wifi    = 22e6;       % Hz
d_wifi     = 1:5:100;    % m
P_t_wifi   = 100e-3;     % W
lamb_wifi  = c / f_wifi;

% Friis equation
Pr_wifi = P_t_wifi * G_t * G_r .* (lamb_wifi ./ (4*pi*d_wifi)).^2;

% SINR and capacity
SINR_wifi = Pr_wifi ./ Pn;
C_wifi    = BW_wifi .* log2(1 + SINR_wifi);

% Convert to dB
Pr_wifi_dB   = 10*log10(Pr_wifi);
SINR_wifi_dB = 10*log10(SINR_wifi);
C_wifi_dB    = 10*log10(C_wifi);

%% ===================== Task 2: Bluetooth =====================
f_bt     = 2.45e9;       % Hz
BW_bt    = 2e6;          % Hz
d_bt     = 0.5:0.5:10;   % m
P_t_bt   = 10e-3;        % W
lamb_bt  = c / f_bt;

Pr_bt = P_t_bt * G_t * G_r .* (lamb_bt ./ (4*pi*d_bt)).^2;
SINR_bt = Pr_bt ./ Pn;
C_bt    = BW_bt .* log2(1 + SINR_bt);

Pr_bt_dB   = 10*log10(Pr_bt);
SINR_bt_dB = 10*log10(SINR_bt);
C_bt_dB    = 10*log10(C_bt);

%% ===================== Task 3: Cellular =====================
f_cell     = 850e6;         % 2G GSM (Hz)
BW_cell    = 200e3;         % Hz
d_cell     = 100:100:5000;  % m
P_t_cell   = 40;            % W (given)
lamb_cell  = c / f_cell;

Pr_cell = P_t_cell * G_t * G_r .* (lamb_cell ./ (4*pi*d_cell)).^2;
SINR_cell = Pr_cell ./ Pn;
C_cell    = BW_cell .* log2(1 + SINR_cell);

Pr_cell_dB   = 10*log10(Pr_cell);
SINR_cell_dB = 10*log10(SINR_cell);
C_cell_dB    = 10*log10(C_cell);

%% ===================== Plot results (3x3 like example) =====================
figure('Color','w','Name','Wireless Performance');

% Row 1: Received power
subplot(3,3,1); plot(d_wifi, Pr_wifi_dB,'LineWidth',1.5); grid on;
title('WiFi'); ylabel('P_r (dB)'); xlabel('distance (m)');

subplot(3,3,2); plot(d_bt, Pr_bt_dB,'LineWidth',1.5); grid on;
title('Bluetooth'); ylabel('P_r (dB)'); xlabel('distance (m)');

subplot(3,3,3); plot(d_cell, Pr_cell_dB,'LineWidth',1.5); grid on;
title('Cellular'); ylabel('P_r (dB)'); xlabel('distance (m)');

% Row 2: SINR
subplot(3,3,4); plot(d_wifi, SINR_wifi_dB,'LineWidth',1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

subplot(3,3,5); plot(d_bt, SINR_bt_dB,'LineWidth',1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

subplot(3,3,6); plot(d_cell, SINR_cell_dB,'LineWidth',1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

% Row 3: Capacity
subplot(3,3,7); plot(d_wifi, C_wifi_dB,'LineWidth',1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

subplot(3,3,8); plot(d_bt, C_bt_dB,'LineWidth',1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

subplot(3,3,9); plot(d_cell, C_cell_dB,'LineWidth',1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

%% ===================== Task 4: Comparative Analysis =====================
% Distances are very different; use log scale on x-axis to compare in one plot.
figure('Color','w','Name','Comparison (WiFi vs BT vs Cellular)');

subplot(3,1,1);
semilogx(d_wifi, Pr_wifi_dB,'LineWidth',1.5); hold on;
semilogx(d_bt, Pr_bt_dB,'LineWidth',1.5);
semilogx(d_cell, Pr_cell_dB,'LineWidth',1.5);
grid on; title('Received Power Comparison'); ylabel('P_r (dB)');
legend('WiFi','Bluetooth','Cellular','Location','best');

subplot(3,1,2);
semilogx(d_wifi, SINR_wifi_dB,'LineWidth',1.5); hold on;
semilogx(d_bt, SINR_bt_dB,'LineWidth',1.5);
semilogx(d_cell, SINR_cell_dB,'LineWidth',1.5);
grid on; title('SINR Comparison'); ylabel('SINR (dB)');
legend('WiFi','Bluetooth','Cellular','Location','best');

subplot(3,1,3);
semilogx(d_wifi, C_wifi_dB,'LineWidth',1.5); hold on;
semilogx(d_bt, C_bt_dB,'LineWidth',1.5);
semilogx(d_cell, C_cell_dB,'LineWidth',1.5);
grid on; title('Capacity Comparison (10log10(bps))');
ylabel('Capacity (dB)'); xlabel('distance (m)');
legend('WiFi','Bluetooth','Cellular','Location','best');
