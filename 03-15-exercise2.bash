#!/bin/bash
while :
do
    printf "Enter a file name: "
    read file
    if [ -f $file ]
    then
        break
    else
        echo "$file is not an existing file."
        continue
    fi
done