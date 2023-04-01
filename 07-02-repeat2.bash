_repeat()
{
    _REPEAT=
    while [[ ${#_REPEAT} -lt $2 ]]
    do
        _REPEAT=$_REPEAT$_REPEAT
    done
    _REPEAT=${_REPEAT:0:$2}
}

repeat()
{
    _repeat "$@"
    printf "%s\n" "$_REPEAT"
}