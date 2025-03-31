#!/bin/bash

log_file="script.log"
read -p "Enter Directory path: " dir
read -p "Enter the file name or extension (eg. *.txt): " file

if [ -d "$dir" ]; then
        find "$dir" -type f -name "$file"
        echo "$(date) - $(whoami) - search for a file $file in $dir " >> "$log_file"
else
        echo "Directory does not exist."
        echo "$(date) - $(whoami) - failed to search for a $file in $dir " >> "$log_file"
fi

