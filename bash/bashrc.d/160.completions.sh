for file in "$XDG_CONFIG_HOME/bash/completions/"*; do
    if [ ! -z "$(type -P ${file##*/})" ]
    then
        source "${file}"
    fi
done

if program_exists minikube; then
    source <(minikube completion bash)
fi
