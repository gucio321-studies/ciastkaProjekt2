#!/usr/bin/env gnuplot

set terminal png
set output 'Au.png'
set grid
set xlabel "Temperatura [K]"
set ylabel "C [J/(mol K)]"
set grid
set title "Zależność ciepła właściwego od temperatury dla złota"
set key box
set key top left

mu = 196.97 # [g/mol]

Na=6.02214076e23 # Avogadro's number [1/mol]
kb=1.380649e-23 # Boltzmann constant [J/K]
cfon(x) = 3*Na*kb*4*pi**4/5 * (x/thetaD)**3 + g*x

fit cfon(x) 'Au.dat' using 1:($2*mu) via thetaD, g

plot "Au.dat" using 1:(mu*$2) with points pt 7 ps 1 title "Punkty pomiarowe dla złota", \
cfon(x)
