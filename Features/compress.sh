#!/bin/bash

compress(){

  local input_file="$1"
  local output_file="$2"

  if [[ -z "$input_file" ]];
    then
   	echo "Usag: $0 <file_or_directory> [output_name]"
	exit 1
  fi
  if [[ -f "$input_file" ]];
    then
	  if [[ -z "$output_file" ]];
   	     then
		output_file="${input_file##*/}.tar.gz"
	     fi
  elif [[ -d "$input_file" ]];
     then
	  if [[ -z "$output_file" ]];
	     then
		output_file="${input_file##*/}.zip"
	     fi
  fi

  if [[ ! -e "$input_file" ]];
    then
	echo "Error: $input_file does not exist"
 	exit 1
  fi

  case "$output_file" in
	*.tar.gz) tar -czvf "$output_file" "$input_file";;
	*.tar.bz2) tar -cjvf "$output_file" "$input_file";;
	*.tar.xz) tar -cJvf "$output_file" "$input_file";;
	*.zip) zip -r "$output_file" "$input_file";;
	*.tar) tar -cvf "$output_file" "$input_file";;
	*)
  		echo "Unsupported format"
		exit 1
		;;
  esac

  echo "Compresstion completed: $output_file"
}


compress "$1" "$2"

