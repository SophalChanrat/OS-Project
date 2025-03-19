#!/bin/bash

echo "Enter the file or directory to backup;"
read source

echo "Enter the backup destination:"
read destination

if [ -e "$source" ]; then
	cp -r "$source" "$destination"
	echo "Backup successfully!"
else
	echo "Source file/directory not found!"
fi
