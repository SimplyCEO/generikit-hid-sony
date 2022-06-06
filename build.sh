#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
RESET_COLOUR="\e[0m"
DEPENDENCIES="dependencies.txt"

x=0;
n=$(cat "$DEPENDENCIES" | wc -l)

# Check if headers are installed
if [ -d /lib/modules/$(uname -r)/build ]; then
	# Check which package manager is installed, to install the dependencies
	if ! [ "$1" == "skip" ]; then
		if type pacman &>/dev/null; then
			sudo pacman -S --needed gcc make wget --noconfirm
		elif type dpkg &>/dev/null; then
			sudo apt-get install gcc make wget -y
		elif type yum &>/dev/null; then # THIS ONE I AM NOT SURE
			sudo yum -y install gcc make wget
		elif type dnf &>/dev/null; then # NEITHER THIS ONE
				sudo dnf install gcc make wget -y
		else
			printf "$YELLOW""Warning! Your package manager were not found. Skipping...""$RESET_COLOUR""\n"
		fi
	fi

	if [ $n -gt 0 ]; then
		for i in n; do
			x=$((x+1))
			URL=$(cat "$DEPENDENCIES" | sed -n "$x"p)
			printf "$GREEN""[URL]:$URL""$RESET_COLOUR""\n"
			wget -o- "$URL"
			printf "$RESET_COLOUR""\n"
		done
	fi
else
	printf "$RED""Error! Headers are not installed! Exiting...""$RESET_COLOUR""\n"
fi