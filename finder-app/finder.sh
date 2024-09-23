#!/bin/bash

#make sure there are two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: finder.sh directory pattern"
    exit 1
fi

#make sure the first argument is a directory
if [ ! -d "$1" ]; then
    echo "$1 is not a directory"
    exit 1
fi

#find files in the directory that contain the pattern
#if the line contains "Permission denied", ignore it
#store the number of matching lines in a variable
MATCHES=$(grep -r "$2" "$1" 2>/dev/null | grep -v "Permission denied" | wc -l)

#count the files in the directory
FILECOUNT=$(find "$1" -type f | wc -l)

#give the specified output
echo  "The number of files are $FILECOUNT and the number of matching lines are $MATCHES"