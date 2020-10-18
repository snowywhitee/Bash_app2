#!/bin/bash

number="$(ps aux | sed -n 's/'"$1"'/user/p' | wc -l)"
echo -e "\033[32mNumber of processes: "$number"\033[0m\n"
