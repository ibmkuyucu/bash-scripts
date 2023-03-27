#!/bin/bash

for (( i=0; i<=10; i++ ))
do
    (( $i == 5 )) && break
    printf "%d\n" "$i"
done