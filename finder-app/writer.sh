#!/bin/bash

#make sure there are two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: writer.sh filename text"
    exit 1
fi

#if the file does not exist, create it (and the directory if necessary)
if [ ! -e "$1" ]; then
    mkdir -p "$(dirname "$1")"
    #if the directory creation fails, exit with a message
    if [ "$?" -ne 0 ]; then
        echo "Could not create directory for $1"
        exit 1
    fi
    touch "$1"
    #if touch fails, exit with a message
    if [ "$?" -ne 0 ]; then
        echo "Could not create $1"
        exit 1
    fi
fi

#write the text to the file
echo "$2" > "$1"
