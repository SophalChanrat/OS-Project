disk_usage(){
	read -p "Enter the directory path: " dir
	du -ah "$dir"
	echo "$(date) - $(whoami) - Checked disk usage of $dir" >> "$LOG_FILE"
}
