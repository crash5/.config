mkcd() {
    mkdir -p "${1:? need a directory}" && cd "${1}"
}
