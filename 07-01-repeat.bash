_repeat()
{
    _REPEAT=
    while [[ ${#_REPEAT} -lt $2 ]]
    do
        _REPEAT=$_REPEAT$1
    done
}