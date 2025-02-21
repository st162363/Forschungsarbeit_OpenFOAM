% MATLAB-Skript zum Vergleich des Geschwindigkeitsprofils und der Druckverteilung fuer die Faelle CP1 und CP3

% Schritt 1: Datei und Tabellenblatt definieren
filePath = 'C:\Users\anton\Documents\Studium\Forschungsarbeit\Auswertung\Auswertung_Simulationen.xlsx';
simSheetName_1_8 = 'Export_Data_CP1_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)
simSheetName_3_8 = 'Export_Data_CP3_8'; % Launder-Sharma-k-epsilon (inlet zeroGradient)

% Schritt 2: Simulationsdaten importieren
sim_y = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'AA2:AA1002');   % y-Werte
sim_x = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'AE2:AE1002');   % x-Werte
sim_u_mean_1_8 = readmatrix(filePath, 'Sheet', simSheetName_1_8, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_p_mean_1_8 = readmatrix(filePath, 'Sheet', simSheetName_1_8, 'Range', 'AD2:AD1002');  % p_mean-Werte
sim_u_mean_3_8 = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'D2:D1002');  % U0_mean-Werte
sim_p_mean_3_8 = readmatrix(filePath, 'Sheet', simSheetName_3_8, 'Range', 'AD2:AD1002');  % p_mean-Werte

% Schritt 3: Berechnung von u_tau
u_tau_f_1 = 0.0444; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462
u_tau_f_3 = 0.0462; % Berechnete Werte: CP1: 0.0444, CP2: 0.0456, CP3: 0.0462

% Schritt 4: Normierung der Simulationsdaten
delta = 0.05; % Kanalhalbdicke in Metern
sim_y_delta = sim_y / delta; % Normierte y-Werte
L = 0.5; % Kanallaenge in Metern
sim_x_L = sim_x / L; % Normierte x-Werte
rho = 1.0; % Dichte Luft
Uw_1 = 0.54; % Wandgeschwindigkeit in m/s fuer CP1
Uw_3 = 0.9; % Wandgeschwindigkeit in m/s fuer CP3
sim_U_mean_norm_1_8 = sim_u_mean_1_8 / u_tau_f_1; % Normierte Geschwindigkeitswerte
sim_U_mean_norm_3_8 = sim_u_mean_3_8 / u_tau_f_3; % Normierte Geschwindigkeitswerte
sim_p_mean_norm_1_8 = sim_p_mean_1_8 / ((rho*(Uw_1^2)*L)/delta); % Normierte Druckwerte
sim_p_mean_norm_3_8 = sim_p_mean_3_8 / ((rho*(Uw_3^2)*L)/delta); % Normierte Druckwerte

% Hauptfarben
color0 = [0, 0, 0]; % Schwarz
color1 = [0, 0.4470, 0.7410]; % Blau
color2 = [0.8500, 0.3250, 0.0980]; % Rot

% Schritt 5: Plot der mittleren Geschwindigkeit CP1 und CP3
figure;
h1 = plotWithAnnotations(sim_y_delta, sim_U_mean_norm_1_8, color1, 'Simulation u_{mean}, Fall CP1');
h2 = plotWithAnnotations(sim_y_delta, sim_U_mean_norm_3_8, color2, 'Simulation u_{mean}, Fall CP3');
hold off;
xlabel('y / \delta');
ylabel('u_{mean}');
title('Vergleich der mittleren Geschwindigkeit zwischen CP1 und CP3');
legend([h1, h2], 'Location', 'best');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlere_Geschwindigkeiten_CP1_CP3.png');

% Schritt 6: Plot des mittleren Drucks CP1 und CP3
figure;
%hold on;
h1 = plotWithAnnotations(sim_x_L, sim_p_mean_norm_1_8, color1, 'Simulation p_{mean}, Fall CP1');
h2 = plotWithAnnotations(sim_x_L, sim_p_mean_norm_3_8, color2, 'Simulation p_{mean}, Fall CP3');
hold off;
xlabel('x / L');
ylabel('p_{mean}');
title('Vergleich des mittleren Drucks zwischen CP1 und CP3');
legend([h1, h2], 'Location', 'best');
grid on;

% Speichere den Plot
saveas(gcf, 'Vergleich_mittlerer_Druck_CP1_CP3.png');

% Lokale Funktion am Ende des Skripts
function h = plotWithAnnotations(x, y, color, label)
    h = plot(x, y, '-', 'LineWidth', 1.5, 'Color', color, 'DisplayName', label);
    hold on;
    % Maximalwert bestimmen
    [maxValue, maxIndex] = max(y);
    maxX = x(maxIndex);
    plot([0, maxX], [maxValue, maxValue], '--', 'Color', color, 'LineWidth', 1, 'HandleVisibility', 'off');
    text(maxX, maxValue, sprintf('Max: %.2f, x: %.2f', maxValue, maxX), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', color);
    % Endwert bestimmen
    endX = x(end);
    endValue = y(end);
    plot([0, endX], [endValue, endValue], '--', 'Color', color, 'LineWidth', 1, 'HandleVisibility', 'off');
    text(endX, endValue, sprintf('End: %.2f, x: %.2f', endValue, endX), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', color);
end

