
#!/bin/bash

RED='\x1b[33m'
ENDRED='\x1b[0m'

function main_menu {
	while true; do
		echo "Possible commands list:"
		echo "1) Count processes"
		echo "2) List of all processes started from /sbin/"
		echo "3) Find PID of the last started process"
		echo "4) PID | PPID | AvgTimeRunning (ART)"
		echo "5) 4th command + Additional info about children"
		echo "6) The most memory consuming process (top)"
		echo "7) Find 3 processes, reading the most bytes for 1 minute from the start up"
		echo "   PID | Strings | Volume"
		echo "8) Exit"
		read -r -p "Enter the command number: " choice
		case "$choice" in
			"1")
				read -r -p "Enter the username: " user
				sh 1.sh $user
				;;
			"2")
				sh 2.sh
				;;
			"3")
				sh 3.sh
				;;
			"4")
				sh 4.sh
				;;
			"5")
				sh 5.sh
				;;
			"6")
				sh 6.sh
				;;
			"7")
				echo "7"
				;;
			"8")
				clear
				break
				;;
			*)
				echo -e "\n\033[33mUnknown command. Enter [1;7]\033[0m\n"
				;;
		esac
	done
}

main_menu
