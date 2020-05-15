if program_exists helm3; then
    alias h='helm3'

    source <(helm3 completion bash)
    complete -o default -F __start_helm h
elif program_exists helm; then
    alias h='helm'

    source <(helm completion bash)
    complete -o default -F __start_helm h
fi

