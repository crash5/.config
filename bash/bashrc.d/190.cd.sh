alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias -- -='cd -'

cd() {
    if [ $# -eq 0 ] ; then
        # no arguments
        builtin cd
    elif [ -d "$1" ] ; then
        # argument is a directory
        builtin cd "$1"
    elif [ "$1" == "-" ] ; then
        # previous directory
        builtin cd -
    else
        # another argument type
        builtin cd "$(dirname $1)"
    fi
}

mkcd() {
    mkdir -p "${1:? need a directory}" && cd "${1}"
}

cdd() {
    cd "${1:? need a directory}" && ll
}

cds() {
    cd "${1:? need a directory}" && llsd
}