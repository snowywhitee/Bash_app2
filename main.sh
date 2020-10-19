
#!/bin/bash

function main_menu {
	while true; do
		echo -e "\033[1;33mPossible commands list:"
		echo -e "1) Count processes"
		echo -e "2) List of all processes started from /sbin/"
		echo -e "3) Find PID of the last started process"
		echo -e "4) PID | PPID | AvgTimeRunning (ART)"
		echo -e "5) 4th command + Additional info about children"
		echo -e "6) The most memory consuming process (top)"
		echo -e "7) Find 3 processes, reading the most bytes for 1 minute from the start up"
		echo -e "   PID | Strings | Volume"
		echo -e "8) Exit\033[0m"
		read -r -p "Enter the command number: " choice
		case "$choice" in
			"1")
				sh 1.sh
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
				sh 7.sh
				;;
			"8")
				clear
				break
				;;
			*)
				echo -e "\n\033[31mUnknown command. Enter [1;7]\033[0m\n"
				;;
		esac
	done
}

main_menu
