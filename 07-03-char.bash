_char()
{
    var=$1

    while [ -n "$var" ]
    do
        temp=${var#?}
        char=${var%"$temp"}
        printf "%s - " $char
        var=$temp
    done
    printf "\n"
}

_revstr()
{
    var=$1
    revstr=

    while [ -n "$var" ]
    do
        temp=${var%?}
        revstr=$revstr${var#"$temp"}
        var=$temp
    done
    printf "%s\n" $revstr
}

to_upper()
{
    case $1 in
        a*) _UPR=A ;; b*) _UPR=B ;; c*) _UPR=C ;; d*) _UPR=D ;;
        e*) _UPR=E ;; f*) _UPR=F ;; g*) _UPR=G ;; h*) _UPR=H ;;
        i*) _UPR=I ;; j*) _UPR=J ;; k*) _UPR=K ;; l*) _UPR=L ;;
        m*) _UPR=M ;; n*) _UPR=N ;; o*) _UPR=O ;; p*) _UPR=P ;;
        q*) _UPR=Q ;; r*) _UPR=R ;; s*) _UPR=S ;; t*) _UPR=T ;;
        u*) _UPR=U ;; v*) _UPR=V ;; w*) _UPR=W ;; x*) _UPR=X ;;
        y*) _UPR=Y ;; z*) _UPR=Z ;; 
        *) _UPR=${1%${1#?}} ;;
    esac
}

_upword()
{
    local word=$1
    _UPWRD=
    while [ -n "$word" ]
    do
        to_upper $word
        _UPWRD=$_UPWRD"$_UPR"
        word=${word#?}
    done
}

_get_month()
{
    read monthname
    _upword $monthname

    case $_UPWRD in
        JAN*) month=1 ;; FEB*) month=2 ;; MAR*) month=3 ;;
        APR*) month=4 ;; MAY*) month=5 ;; JUN*) month=6 ;;
        JUL*) month=7 ;; AUG*) month=8 ;; SEP*) month=9 ;;
        OCT*) month=10 ;; NOV*) month=11 ;; DEC*) month=12 ;;
        [1-9] | 1[0-2]) month=$monthname ;;
        *) 
            echo "Invalid month: $monthname" >&2
            return 1 
        ;;
    esac
    printf "%s\n" "$month"
}

validname()
{
    case $1 in
        [!a-zA-Z_]* | *[!a-zA-Z0-9_]*) return 1 ;;
    esac
}

_insert_string()
{
    ## default insert location
    local insert_string_dflt=2

    ## container string
    local string=$1
    
    ## string to be inserted
    local i_string=$2

    ## insert location
    local i_pos=${3:-${insert_string_dflt:-2}}

    ## before and after strings
    local left right

    ## string to left of insert
    left=${string:0:$(( $i_pos - 1 ))}

    ## string to right of insert
    right=${string:$(( $i_pos - 1 ))}

    ## build new string
    _INSTR=$left$i_string$right
}

insert_string()
{
    _insert_string "$@" && printf "%s\n" "$_INSTR"
}

_overlay()
{
    local string=$1
    local o_str=$2
    local o_pos=$3
    local left right
    left=${string:0:o_pos-1}
    right=${string:o_pos+${#o_str}-1}
    _OVERLAY=$left$o_str$right
}

overlay()
{
    _overlay "$@" && printf "%s\n" "$_OVERLAY"
}

_trim()
{
    local trim_string
    _TRIM=$1
    trim_string=${_TRIM##*[!${2:- }]}
    _TRIM=${_TRIM%$trim_string}
    trim_string=${_TRIM%%[!${2:- }]*}
    _TRIM=${_TRIM#$trim_string}
}

trim()
{
    _trim "$@" && printf "%s\n" "$_TRIM" 
}

_index() #@ Store position of $2 in $1 in $_INDEX
{
    local idx
    case $1 in
        "") _INDEX=0; return 1 ;;
        ## extract up to beginning of the matching portion
        *"$2"*) 
            idx=${1%%"$2"*}
            ## the starting position is one more than the length
            _INDEX=$(( ${#idx} + 1 ))
            ;;
        *) _INDEX=0; return 1 ;;
    esac
}

index()
{
    _index "$@"
    printf "%d\n" "$_INDEX"
}