#!/bin/bash

for n in a b c d e
do
    while true
    do
        if [ $RANDOM -gt 20000 ]
        then
            printf "Bye"
            break 2 ## break out of both while and for loops
        elif [ $RANDOM -lt 10000 ]
        then
            printf "Quit inner loop\n"
            break ## break out of the while loop
        fi
    done
done
echo