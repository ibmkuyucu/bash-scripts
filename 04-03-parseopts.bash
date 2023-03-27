#!/bin/bash

progname=${0##*/}

verbose=0
filename=

optstring=f:v

while getopts $optstring opt
do
    case $opt in
        f) filename=$OPTARG ;;
        v) verbose=$(( $verbose + 1 )) ;;
        *) exit 1 ;;
    esac
done

shift "$(( $OPTIND -1 ))"

if [ -n "$filename" ]
then
    if [ $verbose -gt 0 ]
    then
        printf "Filename is %s\n" "$filename"
    fi
else
    if [ $verbose -gt 0 ]
    then
        printf "No filename entered\n" >&2
    fi
    exit 1
fi

if [ -f "$filename" ]
then
    if [ $verbose -gt 0 ]
    then
        printf "Filename %s found\n" "$filename"
    fi
else
    if [ $verbose -gt 0 ]
    then
        printf "File, %s, does not exist\n" "$filename" >&2
    fi
    exit 2
fi

if [ $verbose -gt 0 ]
then
    printf "Number of arguments is %d\n" "$#"
fi