% MATLAB-Skript zum Vergleich der mittleren Geschwindigkeit zwischen den verschiedenen Wandfunktionen fuer die Faelle CP1 und CP3
% gleiches Vorgehen, wie bei dem allgemeinen Vergleich der mittleren Geschwindigkeit

% Schritt 1: Datei und Tabellenblatt definieren
filePath = 'C:\Users\anton\Documents\Studium\Forschungsarbeit\Auswertung\Auswertung_Simulationen.xlsx';
dnsSheetName_1 = 'pc12_pg_wl1'; % DNS-Daten Fall CP1
simSheetName_1_4 = 'Export_Data_CP1_4'; % k-omega-SST - kqRWallFunction, nutkWallFunction (inlet zeroGradient)
simSheetName_1_10 = 'Export_Data_CP1_10'; % k-omega-SST - kLowReWallFunction, nutLowReWallFunction (inlet zeroGradient)
simSheetName_1_11 = 'Export_Data_CP1_11'; % k-omega-SST - kLowReWallFunction, nutUSpaldingWallFunction (inlet zeroGradient)
dnsSheetName_3 = 'pc12_pg_wl3'; % DNS-Daten Fall CP3
simSheetName_3_4 = 'Export_Data_CP3_4'; % k-omega-SST - kqRWallFunction, nutkWallFunction (inlet zeroGradient)
simSheetName_3_10 = 'Export_Data_CP3_10'; % k-omega-SST - kLowReWallFunction, nutLowReWallFunction (inlet zeroGradient)
simSheetName_3_11 = 'Export_Data_CP3_11'; % k-omega-SST - kLowReWallFunction, nutUSpaldingWallFunction (inlet zeroGradient)

% Schritt 2: DNS-Daten importieren
dns_y_delta_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_mean_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'D6:D102'); % Werte fuer u_mean
dns_y_delta_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_mean_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'D6:D102'); % Werte fuer u_mean

% Schritt 3: Simulationsdaten importieren
sim_y = readmatrix(filePath, 'Sheet', simSheetName_3_4, 'Range', 'AA2:AA1002');   % y-Werte
sim_u_mean_1_4 = readmatrix(filePath, 'Sheet', simSheetName_1_4, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_10 = readmatrix(filePath, 'Sheet', simSheetName_1_10, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_11 = readmatrix(filePath, 'Sheet', simSheetName_1_11, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_4 = readmatrix(filePath, 'Sheet', simSheetName_3_4, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_10 = readmatrix(filePath, 'Sheet', simSheetName_3_10, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_11 = readmatrix(filePath, 'Sheet', simSheetName_3_11, 'Range', 'D2:D1002');  % U0_mean-Werte

% Schritt 4: Definition von u_tau
u_tau_f_1 = 0.0444; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_f_3 = 0.0462; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_m_1 = 0.0237; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531
u_tau_m_3 = 0.00531; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531

% Schritt 5: Normierung der Simulationsdaten
delta = 0.05; % Kanalhalbdicke in Metern
sim_y_delta = sim_y / delta; % Normierte y-Werte
sim_U_mean_norm_1_4 = sim_u_mean_1_4 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_10 = sim_u_mean_1_10 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_11 = sim_u_mean_1_11 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_4 = sim_u_mean_3_4 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_10 = sim_u_mean_3_10 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_11 = sim_u_mean_3_11 / u_tau_f_3; % Normierte Geschwindigkeitswerte

% Hauptfarben
color0 = [0, 0, 0]; % Schwarz
color1 = [0, 0.4470, 0.7410]; % Blau
color2 = [0.8500, 0.3250, 0.0980]; % Rot
color3 = [0.9290, 0.6940, 0.1250]; % Gelb
color4 = [0.4660, 0.6740, 0.1880]; % Gruen
% Helle Varianten
color1_light = [0.678, 0.847, 0.902]; % Hellblau 
color2_light = [0.941, 0.502, 0.502]; % Hellrot 
color2_very_light = [0.976, 0.729, 0.729]; % Sehr helles Rot


% Schritt 6: Plot der mittleren Geschwindigkeit CP1
figure;
hold on;
plot(dns_y_delta_1, dns_u_mean_1, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS u_{mean}');
plot(sim_y_delta, sim_U_mean_norm_1_4, '--', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation, k-omega-SST - kqRWallFunction, nutkWallFunction');
plot(sim_y_delta, sim_U_mean_norm_1_10, ':', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation, k-omega-SST - kLowReWallFunction, nutLowReWallFunction');
plot(sim_y_delta, sim_U_mean_norm_1_11, '-.', 'LineWidth', 1.5, 'Color', color2_very_light, 'DisplayName', 'Simulation, k-omega-SST - kLowReWallFunction, nutUSpaldingWallFunction');
hold off;
xlabel('y / \delta');
ylabel('u_{mean}');
title('Vergleich der mittleren Geschwindigkeit fuer CP1');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlere_Geschwindigkeiten_Wandfunktionen_CP1.png');

% Schritt 7: Plot der mittleren Geschwindigkeit CP3
figure;
hold on;
plot(dns_y_delta_3, dns_u_mean_3, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS u_{mean}');
plot(sim_y_delta, sim_U_mean_norm_3_4, '--', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation, k-omega-SST - kqRWallFunction, nutkWallFunction');
plot(sim_y_delta, sim_U_mean_norm_3_10, ':', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation, k-omega-SST - kLowReWallFunction, nutLowReWallFunction');
plot(sim_y_delta, sim_U_mean_norm_3_11, '-.', 'LineWidth', 1.5, 'Color', color2_very_light, 'DisplayName', 'Simulation, k-omega-SST - kLowReWallFunction, nutUSpaldingWallFunction');
hold off;
xlabel('y / \delta');
ylabel('u_{mean}');
title('Vergleich der mittleren Geschwindigkeit fuer CP3');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlere_Geschwindigkeiten_Wandfunktionen_CP3.png');
