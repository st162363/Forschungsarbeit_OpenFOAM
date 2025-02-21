# gnuplot-Skript zur gleichzeitigen Darstellung der Residuenkurven für alle Variablen
# und Speicherung der Residuenkurven als PNG

# Datenquellen
datafile_Ux = "residuals_Ux.dat"
datafile_Uy = "residuals_Uy.dat"
datafile_Uz = "residuals_Uz.dat"
datafile_p = "residuals_p.dat"
datafile_k = "residuals_k.dat"
datafile_epsilon = "residuals_epsilon.dat"

# Aktualisierungsintervall für die Live-Anzeige (in Sekunden)
refresh_time = 2

# Konfiguration der Grafik und der PNG-Erstellung
set terminal pngcairo
set output "residuals_plot.png"
set xlabel "Iteration"
set ylabel "Residual"
set logscale y
set title "Residuen der Simulation"
set grid

# Kontinuierliche Schleife zur Darstellung aller Residuen
plot_loop:
  plot datafile_Ux using 1:2 with lines title "Residual Ux", \
       datafile_Uy using 1:2 with lines title "Residual Uy", \
       datafile_Uz using 1:2 with lines title "Residual Uz", \
       datafile_p using 1:2 with lines title "Residual p", \
       datafile_k using 1:2 with lines title "Residual k", \
       datafile_epsilon using 1:2 with lines title "Residual epsilon"
  pause refresh_time
  reread

unset output  # Schließt die Datei "residuals_plot.png"

