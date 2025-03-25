read -p "Enter Diractory path: " dir
read -p "Enter the file name or extension (eg. *.txt): " file

if [ -d "$dir" ]; then
        find "$dir" -type f -name "$file"
        echo "Search for $file in $dir" >> script.sh
else
        echo "Diractory does not exist."
fi

