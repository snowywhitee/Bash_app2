#!/bin/bash

PIDs=$(ps aux | awk '{print $2}')

max=0
found_pid=0

for PID in $PIDs; do
	if [[ -d /proc/"$PID" ]]; then
		cur_page=$(cat /proc/"$PID"/statm | awk '{print $2}')
		if (($cur_page > $max)); then
			max=$cur_page
			found_pid=$PID
		fi
	fi
done
echo "PID: $found_pid"
