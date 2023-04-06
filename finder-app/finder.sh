#!/bin/sh
# Finder script for assignment 1

set -e

filesdir=$1
searchstr=$2

#Check if file location is specified
if [ -z $filesdir ]
then
    echo "directory path not specified"
    exit 1
fi

#check if search string is specified
if [ -z $searchstr ]
then
    echo "search string not specified"
    exit 1
fi

if ! test -e $filesdir
then
    echo "$filesdir does not represent a path on the file system"
    exit 1
fi

file_count=$(grep -rl $searchstr $filesdir | wc -l)
line_count=$(grep -r $searchstr $filesdir | wc -l)

echo "The number of files are ${file_count} and the number of matching lines are ${line_count}"
