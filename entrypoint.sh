#!/bin/sh

# setup initial config file
if [ ! -f /config/libraries.txt ]
then
    echo "#example; remove the \"#\" at the beggining :" >> /config/libraries.txt
    echo "#Library Name;Type" >> /config/libraries.txt
    echo "#TV Shows;standard-tv" >> /config/libraries.txt
fi

# generate collections once on container start to ensure it works
/generate-collections.sh

# start crond in foreground
exec crond -f