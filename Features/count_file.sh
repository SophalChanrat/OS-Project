#!/bin/bash

log_file="script.log"

count_files() {
    read -p "Enter directory path: " dir
    if [ -d "$dir" ]; then
        count=$(find "$dir" -type f | wc -l)
        echo "Number of files: $count"
        echo "$(date) - Counted $count files in $dir" >> "$log_file"
    else
        echo "Error: Directory does not exist."
        echo "$(date) failed to count file in $dir " >> "$log_file"
    fi
}

count_files
