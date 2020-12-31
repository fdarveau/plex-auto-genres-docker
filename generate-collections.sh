#!/bin/sh

while IFS= read -r line; do
    if [[ ${line:0:1} != "#" ]]; 
    then 
        echo "Processing $line";
        library=$(echo $line | cut -d ";" -f 1);
        type=$(echo $line | cut -d ";" -f 2);
        python3 /plex-auto-genres.py --library "$library" --type "$type";
        echo;
    fi
done < /config/libraries.txt