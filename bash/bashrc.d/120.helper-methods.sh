function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}


program_exists() {
    which $1 >/dev/null 2>&1
    return $?
}
