#!/bin/bash

FILE1='script/value.sh'
FILE2='script/graph.sh'

if [ ! -x $FILE1 ]
then
	chmod +x $FILE1
	echo "the first file became en mode executabe"
else
	echo " the first file is already executable"
fi

if [ ! -x $FILE2 ]
then
        chmod +x $FILE2
        echo "the second file became en mode executabe"
else
        echo " the second file is already executable"
fi

gnome-terminal -x ./$FILE1 && sleep 2 && gnome-terminal -x ./$FILE2 	
