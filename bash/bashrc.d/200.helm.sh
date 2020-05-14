if program_exists helm; then
    alias h='helm'

    source <(helm completion bash)
    complete -o default -F __start_helm h
fi
