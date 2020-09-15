cdd() {
    cd "${1:? need a directory}" && ll
}

cds() {
    cd "${1:? need a directory}" && llsd
}

