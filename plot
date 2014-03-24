#!/bin/sh
for file in $1/*.dat; do
gnuplot << EOF
unset label
set terminal png size 400,300
set output "$(echo $file | sed s/\.dat//g).png"
set autoscale
plot "$file" using 1:2 with lines title "Function", \
     '' using 1:3 with lines title "Expected"
EOF
done