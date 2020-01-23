#!/usr/bin/gnuplot 
#gnuplot
set xrange [0:20]
set yrange [0:400]
plot [:] [0:8000] "file.dat" title "bonjour tout le monde" linetype 7 linecolor 0 with linespoints
pause 1
reread
set autoscale
#pause -1
#quit

