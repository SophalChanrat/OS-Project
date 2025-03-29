#!/bin/bash

log_action(){
	bash Features/log_file.sh "$1"
}

while true; do
	echo "=============================="
	echo "File & Directory Mangement"
	echo "=============================="
	echo "1. List all files"
	echo "2. Backup Files or Directories"
	echo "3. Count Files"
	echo "4. Display disk usage"
	echo "5. Search for a file"
	echo "6. Compress Files or Directories"
	echo "7. Exit"
	echo "=============================="
	echo "Enter your choice: "
	read choice

	case $choice in
		1) log_action "Listed files"; bash Features/list_file_dir.sh ;;
		2) log _action "Backup files"; bash Features/backup.sh ;;
		3) log_action "Counted files"; bash Features/count_file.sh ;;
		4) log _action "Checked disk usage"; bash Features/disk_usage.sh ;;
		5) log_action "Searched for a file"; bash Features/search_file.sh ;;
		6) log_action "Compressed files"; bash Features/compress.sh ;;
		7) log_action "Exited the program"; echo "Exiting!"; exit 0 ;;
		*) echo "Invalid options. Please enter the existing options!" ;;
	esac
done
