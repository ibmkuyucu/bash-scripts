#!/bin/bash

isvalidip() #@ USAGE: isvalidip DOTTED-QUAD
{
    ip="$1"
    case $ip in
        "" | *[!0-9.]* | *[!0-9]) return 5 ;;
    esac
    
    if [[ "${ip//[0-9]/}" == "..." ]]
    then
        local first="${ip%%.*}"
        local last="${ip##*.}"
        local second="${ip%.*.*}" && second="${second#*.}"
        local third="${ip#*.*.}" && third="${third%.*}"
        [ ${first:-666} -le 255 ] || return 1
        [ ${second:-666} -le 255 ] || return 2
        [ ${third:-666} -le 255 ] || return 3
        [ ${last:-666} -le 255 ] || return 4
    else
        return 6
    fi
}