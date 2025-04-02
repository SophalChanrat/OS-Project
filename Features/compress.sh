#!/bin/bash
log_file="script.log"
compress(){
  read -p "Enter the file or directory to compress: " fileName
  read -p "Enter the destination path for the compress file: " destination
  if [[ -z "$fileName" ]];
    then
   	echo "Error no file provide"
	exit 1
  fi

  [[ -z "$destination" ]] && destination="."

  if [[ ! -e "$fileName" ]];
    then
	echo "Error: $fileName does not exist"
	echo "$(date) - $(whoami) - failed to compress ${fileName},${extension}" >> "$log_file"
 	exit 1
  fi
  echo "Select a compression type (Press Enter for defualt compression): "
  echo "1) ZIP"
  echo "2) TAR.GZ"
  echo "3) TAR.BZ2"
  echo "4) TAR.XZ"
  read -p "Enter your choice (1-4): " choice
  if [[ -z "$choice" ]]; then
    choice=2
  fi
  temp=$(mktemp -d)
  cp -r "$fileName" "$temp/"
  item_name=$(basename "$fileName")
  success=0
  case $choice in
	1)
	  zip_path="${destination}/${item_name}.zip"
 	  zip -r "$zip_path" "$temp/$item_name" && success=1
	  ;;
	2)
	  tar_path="${destination}/${item_name}.tar.gz"
	  tar -czf "$tar_path" -C "$temp" "$item_name" && success=1
  	  ;;
	3)
	  tar_path="${destination}/${item_name}.tar.bz2"
	  tar -cjf "$tar_path" -C "$temp" "$item_name" && success=1
	  ;;
	4)
	  tar_path="${destination}/${item_name}.tar.xz"
	  tar -cJf "$tar_path" -C "$temp" "$item_name" && success=1
	  ;;
	*)
	  echo "invalid input"
	  rm -rf "$temp"
	  return 1
	  ;;

  esac
  rm -rf "$temp"
  
  if [[ $success -eq 1 ]]; then
     case $choice in
	1) ext="zip" ;;
	2) ext="tar.gz" ;;
	3) ext="tar.bz2" ;;
	4) ext="tar.xz" ;;
      esac
      echo "Compression completed: ${item_name}.${ext}"
      echo "$(date) - $(whoami) - compression completed: ${item_name}.${ext}" >> "$log_file"
  else
     echo "Compression failed"
  fi
}

compress
