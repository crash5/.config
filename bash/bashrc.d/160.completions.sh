for file in "$XDG_CONFIG_HOME/bash/completions/"*; do
    if [ ! -z "$(type -P ${file##*/})" ]
    then
        source "${file}"
    fi
done

if program_exists minikube; then
    source <(minikube completion bash)
fi

if program_exists kind; then
    source <(kind completion bash)
fi

if program_exists fzf; then
    source <(fzf --bash)
fi
