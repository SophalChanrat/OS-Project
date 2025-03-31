#!/bin/bash
log_file="script.log"
echo -n  "Enter the file or directory path to backup:"
read source

echo -n  "Enter the backup destination path:"
read destination

if [ -e "$source" ]; then
	cp -r "$source" "$destination"
	echo "Backup successfully!"
	echo "$(date) - $(whoami) - Backup Completed for '$source' to '$destination' " >> "$log_file"
else
	echo "Source file/directory not found!"
	echo "$(date) - $(whoami) - failed to backup for $source to $destination ">> "$log_file"
fi
