#!/bin/bash

while true; do
	read -r -p "Enter the username: " choice
	getent passwd $choice > /dev/null 2&>1
	if ! [ $? -eq 0 ]; then
		echo "User doesn't exist! Try again"
		continue
	fi
	break
done

number="$(ps aux | sed -n 's/'"$choice"'/user/p' | wc -l)"
echo -e "Number of processes: "$number""
