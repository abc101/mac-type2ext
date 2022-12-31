#!/bin/bash

# For white space in directories and files 
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

while read -r line; do
    temp=$line/*
    for file in $temp
        do
        type=$(GetFileInfo -t "$file")
        type=${type:1:4}
        printf "ℹ️ [Info] File name:\t%s ----- Type:%s" "$file" $type
        echo
        if [[ "$file" == *"."* ]]; then
            printf "   ☑️[Skip] File extension exist:\t%s" "$file"
            echo
        else
            new="${file}.${type}"
            printf "   ✅[Copy] New file name:\t%s" $new
            cp "$file" "$new"
            echo
        fi
    done 
done < dir-list.txt
