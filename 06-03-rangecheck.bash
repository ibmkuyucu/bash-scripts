rangecheck() #@ USAGE: rangecheck int [low [high]]
    if [ "$1" -lt ${2:-10} ]
    then
        return 1
    elif [ "$1" -gt ${3:-20} ]
    then
        return 2
    else
        return 0
    fi