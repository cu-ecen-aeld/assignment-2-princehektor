#!/bin/sh
# writer script for assignment 1

set -e

writefile=$1
writestr=$2

#Check if file location is specified
if [ -z $writefile ]
then
    echo "write file path not specified"
    exit 1
fi

#check if search string is specified
if [ -z $writestr ]
then
    echo "write search string not specified"
    exit 1
fi

if test -e $writefile
then
    echo $writestr > $writefile
else
    touch $writefile
    if test -e $writefile
    then
        echo $writestr > $writefile
    else
        echo "File could not be created"
    fi
fi
