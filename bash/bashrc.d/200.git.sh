if program_exists git; then
    g() {
        if [[ $# == 0 ]]; then git st; else git "$@"; fi
    }
    if function_exists _completion_loader; then
        _completion_loader git
        complete -o bashdefault -o default -o nospace -F __git_wrap__git_main  g
    fi
fi
