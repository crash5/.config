for file in "$XDG_CONFIG_HOME/bash/completions/"*; do
    if [ ! -z "$(type -P ${file##*/})" ]
    then
        source "${file}"
    fi
done
