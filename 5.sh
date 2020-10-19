#!/bin/bash

#ps aux --sort -rss | sed '2'q
>5output.txt
if ! [[ -s "4output.txt" ]]; then
	echo "File 4output.txt can't be empty. Please run command 4 and try again"
	exit 1
fi

prev_parent=0
avg_art=0
children=0

cat 4output.txt | while read line; do
	cur_parent=$(echo "$line" | awk '{print $2}')
	cur_art=$(echo "$line" | awk '{print $3}')
	if [[ $cur_parent == $prev_parent ]]; then
		children=$(($children+1))
		avg_art=$(echo "scale=2; $avg_art + $cur_art" | bc)
	else
		avg_art=$(echo "scale=2; $avg_art / $children" | bc)
		echo "Average ART of PPID: $prev_parent is $avg_art" >> 5output.txt
		children=1
		avg_art=$cur_art
	fi
	echo "$line" >> 5output.txt
	prev_parent=$cur_parent
done
cat 5output.txt
