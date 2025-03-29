#!/bin/bash
log_file="script.log"
echo "Enter the file or directory to backup;"
read source

echo "Enter the backup destination:"
read destination

if [ -e "$source" ]; then
	cp -r "$source" "$destination"
	echo "Backup successfully!"
	echo "$(date) - Backup Completed for '$source' to '$destination' " >> "$log_file"
else
	echo "Source file/directory not found!"
	echo "$(date) - failed to backup for $source to $destination ">> "$log_file"
fi
