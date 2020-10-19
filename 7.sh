
#!/bin/bash
>7output.txt
>tmp
>tmp2

function processes {
	for process in $(ls -d /proc/[0-9]*); do
		if [[ -f "$process"/status ]]; then
			if [[ -f "$process"/io && -r "$process"/io ]]; then
				if [[ -f "$process"/cmdline && -r "$process"/cmdline ]]; then
					PID=$(cat "$process"/status | awk '{if ($1 == "Pid:") print $2}')
					bytes=$(cat "$process"/io | awk '{if ($1 == "rchar:") print $2}')
					cmd=$(cat "$process"/cmdline | tr -d '\0')
					echo "$PID:$bytes:"$cmd"" >> "$1"
				fi
			fi
		fi
	done
}

function compare {
	if [[ -f tmp && -f tmp2 ]]; then
		echo "Comparing.."
		for line in $(cat tmp); do
			PID=$(echo "$line" | awk -F ":" '{print $1}')
			bytes=$(echo "$line" | awk -F ":" '{print $2}')
			cmd=$(echo "$line" | awk -F ":" '{print $3}')
			bytes2=$(cat tmp2 | awk -F ":" -v PID="$PID" '{if ($1 == PID) print $2}')
			result_bytes=$(($bytes2-$bytes))
			echo "$PID:$cmd:$result_bytes" >> 7output.txt
		done
		echo "Sorting.."
	else
		echo "Something went wrong :("
	fi
}

re='(0|[1-9]|[1-9][0-9]+)$'
while true; do
	read -r -p "How much time to wait? sec " choice
	if ! [[ $choice =~ $re ]]; then
		echo "Must be positive int number. Try again"
		continue
	fi
	if (( $choice < 0)); then
		echo "Must be positive. Try again"
		continue
	fi
	break
done

processes tmp
echo "Waiting for $choice.."
sleep $choice
processes tmp2
compare tmp tmp2
echo "Top 3 processes PID:CMD:RCHAR :"
cat 7output.txt | sort -n --key=3 --field-separator=":" | tail -n 3
rm tmp tmp2
