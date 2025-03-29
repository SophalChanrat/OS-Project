#!/bin/bash
log_file="script.log"
compress(){
  read -p "Enter the file or directory to compress: " fileName

  if [[ -z "$fileName" ]];
    then
   	echo "Error no file provide"
	exit 1
  fi
  read -p "Enter teh compression format (zip, tar.gz, tar.bz2, tar.xz, tar): " extension
  extension=${extension:-tar.gz}

  if [[ ! -e "$fileName" ]];
    then
	echo "Error: $fileName does not exist"
	echo "$(date) - failed to compress ${fileName},${extension}" >> "$log_file"
 	exit 1
  fi
  temp="${fileName}_"
  cp -r "$fileName" "$temp"
  
  baseName=$(basename "$temp")

  case "$extension" in
	tar.gz) tar -czvf "${baseName}.tar.gz" "$temp";;
	tar.bz2) tar -cjvf "${baseName}.tar.bz2" "$temp";;
	tar.xz) tar -cJvf "${baseName}.tar.xz" "$temp";;
	zip) zip -r "${baseName}.zip" "$temp";;
	tar) tar -cvf "${baseName}.tar" "$temp";;
	*)
  		echo "Unsupported format"
		exit 1
		;;
  esac
  rm -r "$temp"

  echo "Compression completed: ${baseName}.${extension}"
  echo "$(date) - compression completed: ${baseName},${extension}" >> "$log_file"
}

compress
