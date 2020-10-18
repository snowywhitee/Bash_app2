#!/bin/bash

PIDs="$(ps -aux | awk '{print $2}')"
> 4output.txt

echo "PID : PPID : ART"
for PID in $PIDs; do
	if [[ -d /proc/"$PID" ]]; then
		parent="$(cat /proc/"$PID"/stat | awk '{print $4}')"
		sum_exec_runtime=$(cat /proc/"$PID"/sched | awk '{if ($1 == "se.sum_exec_runtime") print $3}')
		nr_switches=$(cat /proc/"$PID"/sched | awk '{if ($1 == "nr_switches") print $3}')
		ART=$(echo "scale=2; $sum_exec_runtime / $nr_switches" | bc)
		echo "$PID $parent $ART" >> 4output.txt
	fi
done
tmp="$(sort -n --key=2 4output.txt)"
echo -e "$tmp" > 4output.txt
cat 4output.txt
