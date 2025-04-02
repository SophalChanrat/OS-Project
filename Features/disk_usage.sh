#!/bin/bash

log_file="script.log"
read -p "Enter the directory path: " dir

if [ -d "$dir" ]; then
	du -ah "$dir"
	echo "$(date) - $(whoami) - Checked disk usage of $dir" >> "$log_file"
else
	echo "Error: directory does not exist!"
fi
