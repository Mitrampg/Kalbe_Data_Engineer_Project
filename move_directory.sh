#!/bin/bash

# Variabel path dan name_of_directory
path="/Users/mitrampg/hdfs/data/data1"
name_of_directory="data1"
target_dir="$path/$name_of_directory"
log_file="$target_dir/move_log.txt"

# Variabel tambahan
filename_excel="daily_market_price.xlsx"
source_dir="/Users/mitrampg/local/data/market"

# Fungsi untuk memeriksa dan membuat direktori
check_and_create_directory() {
  if [ -d "$1" ]; then
    echo "Directory $1 exists!"
    return 0
  else
    echo "Directory $1 does not exist!"
    mkdir -p "$1"
    if [ $? -eq 0 ]; then
      echo "Directory $1 created successfully."
      return 0
    else
      echo "Failed to create directory $1."
      return 1
    fi
  fi
}

# Fungsi untuk memindahkan file dan log
move_file_and_log() {
  if [ -f "$source_dir/$filename_excel" ]; then
    cp "$source_dir/$filename_excel" "$target_dir"
    if [ $? -eq 0 ]; then
      echo "File Moved Successfully"
      echo "File Moved Successfully" > "$log_file"
    else
      echo "Failed to move $filename_excel."
    fi
  else
    echo "File $filename_excel does not exist in source directory."
  fi
}

# Main script
check_and_create_directory "$target_dir" && move_file_and_log
chmod +x $(basename $0)


