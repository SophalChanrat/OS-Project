#!/bin/bash

# Unicode icons
DIR="\U1F4C1"
FILE="\U1F4C4"
EXEC="\U1F7E2"
ERROR="\U274C"
TITLE="\U1F4C2"

echo -e "\n$TITLE **DIRECTORY CONTENTS** $TITLE\n"

echo "Enter the directory path:"
read dir

if [ -d "$dir" ]; then
	for item in "$dir"/*; do
		if [ -d "$item" ]; then
			echo -e "$DIR [DIR] $(basename "$item")"
		elif [ -x "$item" ]; then
			echo -e "$EXEC [EXEC] $(basename "$item")"
		else
			echo -e "$FILE  [FILE] $(basename "$item")"
		fi
	done
else
	echo -e "$ERROR Directory not found!"
fi
