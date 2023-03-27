#!/bin/bash

read passwd
if [ ${#passwd} -lt 8 ]
then
    printf "Password is too short: %d characters\n" "${#passwd}" >&2
    exit 1
fi