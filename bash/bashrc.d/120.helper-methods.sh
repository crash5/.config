function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
export -f function_exists

program_exists() {
    which $1 >/dev/null 2>&1
    return $?
}
export -f program_exists
