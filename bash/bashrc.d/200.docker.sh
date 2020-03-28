if program_exists docker; then
    alias d='docker'
    if function_exists _completion_loader; then
        _completion_loader docker
        complete -F _docker d
    fi
fi
