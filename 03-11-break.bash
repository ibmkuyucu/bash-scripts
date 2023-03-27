#!/bin/bash

while :
do
    read x
    [ -z "$x" ] && break
    echo $x
done