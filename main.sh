#!/bin/bash

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
		1) bash Features/list_file_dir.sh ;;
		2) bash Features/backup.sh ;;
		3) bash Features/count_file.sh ;;
		4) bash Features/disk_usage.sh ;;
		5) bash Features/search_file.sh ;;
		6) bash Features/compress.sh ;;
		7) echo "Exiting!"; exit 0 ;;
		*) echo "Invalid options. Please enter the existing options!" ;;
	esac
done
