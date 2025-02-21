% MATLAB-Skript zum Vergleich der mittleren Geschwindigkeit zwischen der Inlet-Bedingung fixedValue und zeroGradient fuer die Faelle CP1 und CP3
% durch Auskommentieren der Simulationen mit fixedValue, koennen (wie beim MATLAB-Skript zum Vergleich von k) 
% nur die Simulationen mit Inlet-Bedingung zeroGradient dargestellt werden

% Schritt 1: Datei und Tabellenblatt definieren
filePath = 'C:\Users\anton\Documents\Studium\Forschungsarbeit\Auswertung\Auswertung_Simulationen.xlsx';
dnsSheetName_1 = 'pc12_pg_wl1'; % DNS-Daten Fall CP1
simSheetName_1_0 = 'Export_Data_CP1_0'; % laminare Berechnung
simSheetName_1_1 = 'Export_Data_CP1_1'; % k-epsilon (inlet fixedValue)
simSheetName_1_2 = 'Export_Data_CP1_2'; % k-epsilon (inlet zeroGradient)
simSheetName_1_3 = 'Export_Data_CP1_3'; % k-omega-SST (inlet fixedValue)
simSheetName_1_4 = 'Export_Data_CP1_4'; % k-omega-SST (inlet zeroGradient)
simSheetName_1_5 = 'Export_Data_CP1_5'; % k-omega-SST (ohne Wandfunktionen) (inlet zeroGradient)
simSheetName_1_6 = 'Export_Data_CP1_6'; % k-omega-SST (ohne Wandfunktionen) (inlet fixedValue)
simSheetName_1_7 = 'Export_Data_CP1_7'; % Launder-Sharma-k-epsilon (inlet fixedValue)
simSheetName_1_8 = 'Export_Data_CP1_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)
dnsSheetName_3 = 'pc12_pg_wl3'; % DNS-Daten Fall CP3
simSheetName_3_1 = 'Export_Data_CP3_1'; % k-epsilon (inlet fixedValue)
simSheetName_3_2 = 'Export_Data_CP3_2'; % k-epsilon (inlet zeroGradient)
simSheetName_3_3 = 'Export_Data_CP3_3'; % k-omega-SST (inlet fixedValue)
simSheetName_3_4 = 'Export_Data_CP3_4'; % k-omega-SST (inlet zeroGradient)
simSheetName_3_5 = 'Export_Data_CP3_5'; % k-omega-SST (ohne Wandfunktionen) (inlet zeroGradient)
simSheetName_3_6 = 'Export_Data_CP3_6'; % k-omega-SST (ohne Wandfunktionen) (inlet fixedValue)
simSheetName_3_7 = 'Export_Data_CP3_7'; % Launder-Sharma-k-epsilon (inlet fixedValue)
simSheetName_3_8 = 'Export_Data_CP3_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)

% Schritt 2: DNS-Daten importieren
dns_y_delta_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_mean_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'D6:D102'); % Werte fuer u_mean
dns_y_delta_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_mean_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'D6:D102'); % Werte fuer u_mean

% Schritt 3: Simulationsdaten importieren
sim_y = readmatrix(filePath, 'Sheet', simSheetName_3_1, 'Range', 'AA2:AA1002');   % y-Werte
sim_u_mean_1_0 = readmatrix(filePath, 'Sheet', simSheetName_1_0, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_1 = readmatrix(filePath, 'Sheet', simSheetName_1_1, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_2 = readmatrix(filePath, 'Sheet', simSheetName_1_2, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_3 = readmatrix(filePath, 'Sheet', simSheetName_1_3, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_5 = readmatrix(filePath, 'Sheet', simSheetName_1_5, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_6 = readmatrix(filePath, 'Sheet', simSheetName_1_6, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_7 = readmatrix(filePath, 'Sheet', simSheetName_1_7, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_8 = readmatrix(filePath, 'Sheet', simSheetName_1_8, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_1_4 = readmatrix(filePath, 'Sheet', simSheetName_1_4, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_1 = readmatrix(filePath, 'Sheet', simSheetName_3_1, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_2 = readmatrix(filePath, 'Sheet', simSheetName_3_2, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_3 = readmatrix(filePath, 'Sheet', simSheetName_3_3, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_4 = readmatrix(filePath, 'Sheet', simSheetName_3_4, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_5 = readmatrix(filePath, 'Sheet', simSheetName_3_5, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_6 = readmatrix(filePath, 'Sheet', simSheetName_3_6, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_7 = readmatrix(filePath, 'Sheet', simSheetName_3_7, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_u_mean_3_8 = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'D2:D1002');  % U0_mean-Werte

% Schritt 4: Definition von u_tau
u_tau_f_1 = 0.0444; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_f_3 = 0.0462; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_m_1 = 0.0237; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531
u_tau_m_3 = 0.00531; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531

% Schritt 5: Normierung der Simulationsdaten
delta = 0.05; % Kanalhalbdicke in Metern
sim_y_delta = sim_y / delta; % Normierte y-Werte
Uw_1 = 0.54; % Wandgeschwindigkeit in m/s
Uw_3 = 0.9; % Wandgeschwindigkeit in m/s
sim_U_mean_norm_1_0 = sim_u_mean_1_0 / (Uw_1 / dns_u_mean_1(end)); % Normierte Geschwindigkeitswerte (durch Uw)
sim_U_mean_norm_1_1 = sim_u_mean_1_1 / u_tau_f_1; % Normierte Geschwindigkeitswerte (durch u_tau_f)
sim_U_mean_norm_1_2 = sim_u_mean_1_2 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_3 = sim_u_mean_1_3 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_4 = sim_u_mean_1_4 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_5 = sim_u_mean_1_5 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_6 = sim_u_mean_1_6 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_7 = sim_u_mean_1_7 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_1_8 = sim_u_mean_1_8 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_1 = sim_u_mean_3_1 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_2 = sim_u_mean_3_2 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_3 = sim_u_mean_3_3 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_4 = sim_u_mean_3_4 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_5 = sim_u_mean_3_5 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_6 = sim_u_mean_3_6 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_7 = sim_u_mean_3_7 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_8 = sim_u_mean_3_8 / u_tau_f_3; % Normierte Geschwindigkeitswerte

% Hauptfarben
color0 = [0, 0, 0]; % Schwarz
color1 = [0, 0.4470, 0.7410]; % Blau
color2 = [0.8500, 0.3250, 0.0980]; % Rot
color3 = [0.9290, 0.6940, 0.1250]; % Gelb
color4 = [0.4660, 0.6740, 0.1880]; % Gruen
color5 = [0.4940, 0.1840, 0.5560]; % Violett
% Helle Varianten
color1_light = [0.678, 0.847, 0.902]; % Hellblau
color2_light = [0.941, 0.502, 0.502]; % Hellrot 
color2_very_light = [0.976, 0.729, 0.729]; % Sehr helles Rot
color4_light = [0.698, 0.867, 0.621]; % Hellgruen 
color5_light = [0.741, 0.537, 0.820]; % Hellviolett 

% Schritt 6: Plot der mittleren Geschwindigkeit CP1
figure;
hold on;
plot(dns_y_delta_1, dns_u_mean_1, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS u_{mean}');
plot(sim_y_delta, sim_U_mean_norm_1_0, '-', 'LineWidth', 1.5, 'Color', color3, 'DisplayName', 'Simulation u_{mean}, laminare Berechnung');
plot(sim_y_delta, sim_U_mean_norm_1_1, '-', 'LineWidth', 1.5, 'Color', color1, 'DisplayName', 'Simulation u_{mean}, k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_1_2, '--', 'LineWidth', 1.5, 'Color', color1_light, 'DisplayName', 'Simulation u_{mean}, k-epsilon (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_1_3, '-', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation u_{mean}, k-omega-SST (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_1_4, '--', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation u_{mean}, k-omega-SST (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_1_6, '-', 'LineWidth', 1.5, 'Color', color4, 'DisplayName', 'Simulation u_{mean}, k-omega-SST ohne Wandfunktionen (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_1_5, '--', 'LineWidth', 1.5, 'Color', color4_light, 'DisplayName', 'Simulation u_{mean}, k-omega-SST ohne Wandfunktionen (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_1_7, '-', 'LineWidth', 1.5, 'Color', color5, 'DisplayName', 'Simulation u_{mean}, Launder-Sharma-k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_1_8, '--', 'LineWidth', 1.5, 'Color', color5_light, 'DisplayName', 'Simulation u_{mean}, Launder-Sharma-k-epsilon (inlet zeroGradient)');
hold off;
xlabel('y / \delta');
ylabel('u_{mean}');
title('Vergleich der mittleren Geschwindigkeit fuer CP1');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlere_Geschwindigkeiten_CP1.png');

% Schritt 7: Plot der mittleren Geschwindigkeit CP3
figure;
hold on;
plot(dns_y_delta_3, dns_u_mean_3, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS u_{mean}');
plot(sim_y_delta, sim_U_mean_norm_3_1, '-', 'LineWidth', 1.5, 'Color', color1, 'DisplayName', 'Simulation u_{mean}, k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_3_2, '--', 'LineWidth', 1.5, 'Color', color1_light, 'DisplayName', 'Simulation u_{mean}, k-epsilon (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_3_3, '-', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation u_{mean}, k-omega-SST (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_3_4, '--', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation u_{mean}, k-omega-SST (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_3_6, '-', 'LineWidth', 1.5, 'Color', color4, 'DisplayName', 'Simulation u_{mean}, k-omega-SST ohne Wandfunktionen (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_3_5, '--', 'LineWidth', 1.5, 'Color', color4_light, 'DisplayName', 'Simulation u_{mean}, k-omega-SST ohne Wandfunktionen (inlet zeroGradient)');
plot(sim_y_delta, sim_U_mean_norm_3_7, '-', 'LineWidth', 1.5, 'Color', color5, 'DisplayName', 'Simulation u_{mean}, Launder-Sharma-k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_U_mean_norm_3_8, '--', 'LineWidth', 1.5, 'Color', color5_light, 'DisplayName', 'Simulation u_{mean}, Launder-Sharma-k-epsilon (inlet zeroGradient)');
hold off;
xlabel('y / \delta');
ylabel('u_{mean}');
title('Vergleich der mittleren Geschwindigkeit fuer CP3');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlere_Geschwindigkeiten_CP3.png');
