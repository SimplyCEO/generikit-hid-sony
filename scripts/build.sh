#!/bin/bash

# Terminal colours
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
RESET_COLOUR="\e[0m"

# Variables
DEPENDENCIES="dependencies.txt"
LINES=$(cat "$DEPENDENCIES" | wc -l)
ARGUMENTS="$@"
ARGUMENTS_ROW=$#
x=0

# If identified any error
function error()
{
	printf "$RED""ERROR: too few arguments in $0.""$RESET_COLOUR\n"
	return 1
}

# Support for generic PS3 Controller
function custom_hid_sony()
{
	echo TODO
}

# Enable monitor mode for TL-WN722N v2/3
function custom_8188eu()
{
	echo TODO
}

# Use a phone / Google Cardboard VR as a SteamVR
function custom_openvr()
{
	echo TODO
}

if [ $ARGUMENTS_ROW -eq 0 ]; then
	error
fi

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

	if [ $LINES -gt 0 ]; then
		x=0
		for i in $LINES; do
			x=$((x+1))
			URL=$(cat "$DEPENDENCIES" | sed -n "$x"p)
			printf "$GREEN""[URL]:$URL""$RESET_COLOUR""\n"
			wget -o- "$URL"
			printf "$RESET_COLOUR""\n"
		done
	fi
else
	printf "$RED""ERROR: Headers are not installed.""$RESET_COLOUR""\n"
fi