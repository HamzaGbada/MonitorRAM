#!/usr/bin/gnuplot 
set terminal wxt size 800,600 enhanced
set title "RAM Usage Evolution"
set xlabel "Time (seconds)"
set ylabel "RAM Used (MB)"
set grid
set autoscale x
set autoscale y
set style line 1 lc rgb 'blue' lt 1 lw 2 pt 7 ps 1
while (1) {
  if (system("test -s file.dat && echo 1 || echo 0") eq "1") {
    plot "file.dat" using 1:2 title "RAM evolution" with linespoints ls 1
  }
  pause 1
  reread
}
