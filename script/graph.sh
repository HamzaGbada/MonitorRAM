#!/usr/bin/gnuplot 
#gnuplot
set xrange [0:20]
set yrange [0:400]
system 
plot [:] [0:system(" echo $(( $(grep MemTotal: /proc/meminfo | grep -Eo '[0-9]{1,10}') / 1024 )) ")] "file.dat" title "RAM evolution" linetype 7 linecolor 0 with linespoints
pause 1
reread
set autoscale
#pause -1
#quit
