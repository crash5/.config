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
