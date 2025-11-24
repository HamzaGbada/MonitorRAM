#!/bin/bash

FILE1='script/value.sh'
FILE2='script/graph.sh'

if [ ! -x "$FILE1" ]
then
	chmod +x "$FILE1"
	echo "the first file became en mode executabe"
else
	echo " the first file is already executable"
fi

if [ ! -x "$FILE2" ]
then
        chmod +x "$FILE2"
        echo "the second file became en mode executabe"
else
        echo " the second file is already executable"
fi

# Create initial empty data file
touch file.dat

# Launch value.sh in background terminal
xterm -T "RAM Monitor - Data Collection" -e "cd '$PWD' && bash '$FILE1'; exec bash" &
sleep 2

# Launch graph.sh in foreground terminal
xterm -T "RAM Monitor - Live Graph" -geometry 120x40 -e "cd '$PWD' && gnuplot '$FILE2'; exec bash" 	
