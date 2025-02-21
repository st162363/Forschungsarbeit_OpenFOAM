#!/bin/bash
# Skript zur Extraktion aller relevanten Residuen aus log.simpleFoam für gnuplot

# Prüfen, ob die Logdatei existiert
if [ ! -f log.simpleFoam ]; then
  echo "Die Datei log.simpleFoam wurde nicht gefunden."
  exit 1
fi

# Extrahiert die Residuen für Ux, Uy, Uz, p, k und epsilon und speichert sie in separaten Dateien
grep 'Solving for Ux' log.simpleFoam | awk '{print NR, $8}' > residuals_Ux.dat
grep 'Solving for Uy' log.simpleFoam | awk '{print NR, $8}' > residuals_Uy.dat
grep 'Solving for Uz' log.simpleFoam | awk '{print NR, $8}' > residuals_Uz.dat
grep 'GAMG:  Solving for p,' log.simpleFoam | awk '{print NR, $8}' > residuals_p.dat
grep 'Solving for k' log.simpleFoam | awk '{print NR, $8}' > residuals_k.dat
grep 'Solving for epsilon' log.simpleFoam | awk '{print NR, $8}' > residuals_epsilon.dat

# Erklärung:
# Die jeweiligen grep-Befehle suchen in log.simpleFoam nach den relevanten Größen und
# awk speichert die Iterationsnummer (NR) und das entsprechende Residuum in separaten Dateien.

echo "Residuen wurden extrahiert und in .dat-Dateien gespeichert."
