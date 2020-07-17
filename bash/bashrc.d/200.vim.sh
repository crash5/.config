vip() {
    if [[ $# == 0 ]]; then vim <(fc -s); else vim <("$@"); fi
}

vipq() {
    if [[ $# == 0 ]]; then vim -q <(fc -s); else vim -q <("$@"); fi
}

via() {
    if [[ $# == 0 ]]; then vim $(fc -s); else vim $("$@"); fi
}
