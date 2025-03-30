disk_usage(){
	read -p "Enter the directory path: " dir
	du -ah "$dir"
	echo "Checked disk usage of $dir on $(date)" >> "$LOG_FILE"
}
