#!/bin/sh

while IFS= read -r line; do
    if [[ ${line:0:1} != "#" ]]; 
    then 
        library=$(echo $line | cut -d ";" -f 1);
        type=$(echo $line | cut -d ";" -f 2);
        echo "Creating collections for library $library of type $type"
        python3 /plex-auto-genres.py --library "$library" --type "$type";
        echo "Adding posters for collections in library $library of type $type"
        python3 /plex-auto-genres.py --library "$library" --type "$type" --set-posters;
        echo;
    fi
done < /config/libraries.txt

echo "Done generating collections"