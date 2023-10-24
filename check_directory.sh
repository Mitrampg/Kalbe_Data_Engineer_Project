#!/bin/bash

# Deklarasi variabel path dan name_of_directory
path="/Users/mitrampg/hdfs/data/data1"
name_of_directory="data1"

# Periksa apakah direktori ada dalam path
if [ -d "$path/$name_of_directory" ]; then
    echo "There is $name_of_directory Directory Exists"
else
    echo "$name_of_directory Directory Not Exists!!"

    # Buat direktori jika tidak ada
    mkdir -p "$path/$name_of_directory"
    if [ $? -eq 0 ]; then
        echo "Direktory $name_of_directory created successfully."
    else
        echo "Failed to create directory $name_of_directory."
    fi
fi

chmod +x check_directory.sh

