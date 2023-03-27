#!/bin/bash
while :
do
    printf "Enter a positive number between 20 and 30 inclusive: "
    read num

    case $num in
        *[!0-9]*) echo "$num is not a positive number"
                continue
                ;;
        *) ;;
    esac

    if (( num < 20 ))
    then
        printf "%d is too low\n" "$num" >&2
        continue
    elif (( num > 30 ))
    then
        printf "%d is too high\n" "$num" >&2
        continue
    else
        printf "You entered %d\n" "$num"
        break
    fi
done