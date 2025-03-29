log_file="script.log"
read -p "Enter Directory path: " dir
read -p "Enter the file name or extension (eg. *.txt): " file

if [ -d "$dir" ]; then
        find "$dir" -type f -name "$file"
        echo "Search for $file in $dir" >> script.sh
        echo "$(date) - search for a file $file in $dir " >> "$log_file"
else
        echo "Directory does not exist."
        echo "$(date) - failed to search for a $file in $dir " >> "$log_file"
fi

