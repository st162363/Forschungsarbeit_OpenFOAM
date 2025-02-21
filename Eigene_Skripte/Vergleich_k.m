% MATLAB-Skript zum Vergleich der turbulenten kinetischen Energie fuer die Faelle CP1 und CP3
% hier, durch Auskommentieren der Simulationen mit fixedValue, unter der Inlet-Bedingung zeroGradient

% Schritt 1: Datei und Tabellenblatt definieren
filePath = 'C:\Users\anton\Documents\Studium\Forschungsarbeit\Auswertung\Auswertung_Simulationen.xlsx';
dnsSheetName_1 = 'pc12_pg_wl1'; % DNS-Daten Fall CP1
%simSheetName_1_1 = 'Export_Data_CP1_1'; % k-epsilon (inlet fixedValue)
simSheetName_1_2 = 'Export_Data_CP1_2'; % k-epsilon (inlet zeroGradient)
%simSheetName_1_3 = 'Export_Data_CP1_3'; % k-omega-SST (inlet fixedValue)
simSheetName_1_4 = 'Export_Data_CP1_4'; % k-omega-SST (inlet zeroGradient)
simSheetName_1_5 = 'Export_Data_CP1_5'; % k-omega-SST (ohne Wandfunktionen) (inlet zeroGradient)
%simSheetName_1_6 = 'Export_Data_CP1_6'; % k-omega-SST (ohne Wandfunktionen) (inlet fixedValue)
%simSheetName_1_7 = 'Export_Data_CP1_7'; % Launder-Sharma-k-epsilon (inlet fixedValue)
simSheetName_1_8 = 'Export_Data_CP1_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)
dnsSheetName_3 = 'pc12_pg_wl3'; % DNS-Daten Fall CP3
%simSheetName_3_1 = 'Export_Data_CP3_1'; % k-epsilon (inlet fixedValue)
simSheetName_3_2 = 'Export_Data_CP3_2'; % k-epsilon (inlet zeroGradient)
%simSheetName_3_3 = 'Export_Data_CP3_3'; % k-omega-SST (inlet fixedValue)
simSheetName_3_4 = 'Export_Data_CP3_4'; % k-omega-SST (inlet zeroGradient)
simSheetName_3_5 = 'Export_Data_CP3_5'; % k-omega-SST (ohne Wandfunktionen) (inlet zeroGradient)
%simSheetName_3_6 = 'Export_Data_CP3_6'; % k-omega-SST (ohne Wandfunktionen) (inlet fixedValue)
%simSheetName_3_7 = 'Export_Data_CP3_7'; % Launder-Sharma-k-epsilon (inlet fixedValue)
simSheetName_3_8 = 'Export_Data_CP3_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)

% Schritt 2: DNS-Daten importieren
dns_y_delta_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_rms_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'E6:E102'); % u_rms (DNS)
dns_v_rms_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'F6:F102'); % v_rms (DNS)
dns_w_rms_1 = readmatrix(filePath, 'Sheet', dnsSheetName_1, 'Range', 'G6:G102'); % w_rms (DNS)
dns_y_delta_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'C6:C102'); % Werte von y/delta
dns_u_rms_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'E6:E102'); % u_rms (DNS)
dns_v_rms_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'F6:F102'); % v_rms (DNS)
dns_w_rms_3 = readmatrix(filePath, 'Sheet', dnsSheetName_3, 'Range', 'G6:G102'); % w_rms (DNS)

% Schritt 3: Berechnung von k fuer die DNS-Daten
dns_k_1 = 0.5 * (dns_u_rms_1.^2 + dns_v_rms_1.^2 + dns_w_rms_1.^2); % k aus RMS-Werten berechnen
dns_k_3 = 0.5 * (dns_u_rms_3.^2 + dns_v_rms_3.^2 + dns_w_rms_3.^2); % k aus RMS-Werten berechnen

% Schritt 4: Simulationsdaten importieren
sim_y = readmatrix(filePath, 'Sheet', simSheetName_3_1, 'Range', 'AA2:AA1002');   % y-Werte
%sim_k_1_1 = readmatrix(filePath, 'Sheet', simSheetName_1_1, 'Range', 'N2:N1002');  % k-Werte
sim_k_1_2 = readmatrix(filePath, 'Sheet', simSheetName_1_2, 'Range', 'N2:N1002');  % k-Werte
%sim_k_1_3 = readmatrix(filePath, 'Sheet', simSheetName_1_3, 'Range', 'M2:M1002');  % k-Werte
sim_k_1_5 = readmatrix(filePath, 'Sheet', simSheetName_1_5, 'Range', 'M2:M1002');  % k-Werte
%sim_k_1_6 = readmatrix(filePath, 'Sheet', simSheetName_1_6, 'Range', 'M2:M1002');  % k-Werte
%sim_k_1_7 = readmatrix(filePath, 'Sheet', simSheetName_1_7, 'Range', 'N2:N1002');  % k-Werte
sim_k_1_8 = readmatrix(filePath, 'Sheet', simSheetName_1_8, 'Range', 'N2:N1002');  % k-Werte
sim_k_1_4 = readmatrix(filePath, 'Sheet', simSheetName_1_4, 'Range', 'M2:M1002');  % k-Werte
%sim_k_3_1 = readmatrix(filePath, 'Sheet', simSheetName_3_1, 'Range', 'N2:N1002');  % k-Werte
sim_k_3_2 = readmatrix(filePath, 'Sheet', simSheetName_3_2, 'Range', 'N2:N1002');  % k-Werte
%sim_k_3_3 = readmatrix(filePath, 'Sheet', simSheetName_3_3, 'Range', 'M2:M1002');  % k-Werte
sim_k_3_4 = readmatrix(filePath, 'Sheet', simSheetName_3_4, 'Range', 'M2:M1002');  % k-Werte
sim_k_3_5 = readmatrix(filePath, 'Sheet', simSheetName_3_5, 'Range', 'M2:M1002');  % k-Werte
%sim_k_3_6 = readmatrix(filePath, 'Sheet', simSheetName_3_6, 'Range', 'M2:M1002');  % k-Werte
%sim_k_3_7 = readmatrix(filePath, 'Sheet', simSheetName_3_7, 'Range', 'N2:N1002');  % k-Werte
sim_k_3_8 = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'N2:N1002');  % k-Werte

% Schritt 5: Definition von u_tau
u_tau_f_1 = 0.0444; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_f_3 = 0.0462; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_m_1 = 0.0237; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531
u_tau_m_3 = 0.00531; % Berechnete Werte: CP1: 0.0237, CP2: 0.0147, CP3: 0.00531

% Schritt 6: Normierung der Simulationsdaten
delta = 0.05; % Kanalhalbdicke in Metern
sim_y_delta = sim_y / delta; % Normierte y-Werte
%sim_k_norm_1_1 = sim_k_1_1 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
sim_k_norm_1_2 = sim_k_1_2 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
%sim_k_norm_1_3 = sim_k_1_3 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
sim_k_norm_1_4 = sim_k_1_4 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
sim_k_norm_1_5 = sim_k_1_5 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
%sim_k_norm_1_6 = sim_k_1_6 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
%sim_k_norm_1_7 = sim_k_1_7 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
sim_k_norm_1_8 = sim_k_1_8 / (u_tau_f_1^2); % Normierte turbulente kinetische Energie
%sim_k_norm_3_1 = sim_k_3_1 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
sim_k_norm_3_2 = sim_k_3_2 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
%sim_k_norm_3_3 = sim_k_3_3 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
sim_k_norm_3_4 = sim_k_3_4 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
sim_k_norm_3_5 = sim_k_3_5 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
%sim_k_norm_3_6 = sim_k_3_6 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
%sim_k_norm_3_7 = sim_k_3_7 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie
sim_k_norm_3_8 = sim_k_3_8 / (u_tau_f_3^2); % Normierte turbulente kinetische Energie

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

% Schritt 7: Plot der turbulenten kinetischen Energie CP1
figure;
hold on;
plot(dns_y_delta_1, dns_k_1, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS k');
%plot(sim_y_delta, sim_k_norm_1_1, '-', 'LineWidth', 1.5, 'Color', color1, 'DisplayName', 'Simulation k, k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_1_2, '--', 'LineWidth', 1.5, 'Color', color1_light, 'DisplayName', 'Simulation k, k-epsilon (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_1_3, '-', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation k, k-omega-SST (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_1_4, '--', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation k, k-omega-SST (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_1_6, '-', 'LineWidth', 1.5, 'Color', color4, 'DisplayName', 'Simulation k, k-omega-SST ohne Wandfunktionen (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_1_5, '--', 'LineWidth', 1.5, 'Color', color4_light, 'DisplayName', 'Simulation k, k-omega-SST ohne Wandfunktionen (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_1_7, '-', 'LineWidth', 1.5, 'Color', color5, 'DisplayName', 'Simulation k, Launder-Sharma-k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_1_8, '--', 'LineWidth', 1.5, 'Color', color5_light, 'DisplayName', 'Simulation k, Launder-Sharma-k-epsilon (inlet zeroGradient)');
hold off;
xlabel('y / \delta');
ylabel('k');
title('Vergleich der turbulenten kinetischen Energie fuer CP1');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_turbulente_kinetische_Energie_CP1_zeroGradient.png');

% Schritt 8: Plot der turbulenten kinetischen Energie CP3
figure;
hold on;
plot(dns_y_delta_3, dns_k_3, '-', 'LineWidth', 3, 'Color', color0, 'DisplayName', 'DNS k');
%plot(sim_y_delta, sim_k_norm_3_1, '-', 'LineWidth', 1.5, 'Color', color1, 'DisplayName', 'Simulation k, k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_3_2, '--', 'LineWidth', 1.5, 'Color', color1_light, 'DisplayName', 'Simulation k, k-epsilon (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_3_3, '-', 'LineWidth', 1.5, 'Color', color2, 'DisplayName', 'Simulation k, k-omega-SST (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_3_4, '--', 'LineWidth', 1.5, 'Color', color2_light, 'DisplayName', 'Simulation k, k-omega-SST (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_3_6, '-', 'LineWidth', 1.5, 'Color', color4, 'DisplayName', 'Simulation k, k-omega-SST ohne Wandfunktionen (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_3_5, '--', 'LineWidth', 1.5, 'Color', color4_light, 'DisplayName', 'Simulation k, k-omega-SST ohne Wandfunktionen (inlet zeroGradient)');
%plot(sim_y_delta, sim_k_norm_3_7, '-', 'LineWidth', 1.5, 'Color', color5, 'DisplayName', 'Simulation k, Launder-Sharma-k-epsilon (inlet fixedValue)');
plot(sim_y_delta, sim_k_norm_3_8, '--', 'LineWidth', 1.5, 'Color', color5_light, 'DisplayName', 'Simulation k, Launder-Sharma-k-epsilon (inlet zeroGradient)');
hold off;
xlabel('y / \delta');
ylabel('k');
title('Vergleich der turbulenten kinetischen Energie fuer CP3');
legend('show');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_turbulente_kinetische_Energie_CP3_zeroGradient.png');
