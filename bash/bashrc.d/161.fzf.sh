# usage: _fzf_setup_completion path|dir|var|alias|host COMMANDS...

if function_exists _fzf_setup_completion; then
    path_completion_apps=(bcompare mc)

    for i in "${path_completion_apps[@]}"; do
        if program_exists "$i"; then
            _fzf_setup_completion path "$i"
        fi
    done
fi

export FZF_DEFAULT_OPTS="--bind 'f4:execute(vim {})'"

if program_exists fzf; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    source "${SCRIPT_DIR}"/161.fzf-key-bindings.bash
fi
