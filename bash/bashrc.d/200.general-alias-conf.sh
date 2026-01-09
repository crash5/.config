# vim: foldmethod=marker

# General {{{
[ -f /usr/lib/mc/mc-wrapper.sh ] && alias mc='. /usr/lib/mc/mc-wrapper.sh -x'

if program_exists vifm; then
    alias mc='vifm'
fi

if program_exists bat; then
    alias cat='bat -p'
fi
# }}}

# ripgrep {{{
rgg() {
    local search_for=$1
    rg --files-with-matches "${search_for}" --no-messages | \
        fzf --query "${search_for}" --disabled --multi \
            --bind "change:reload:rg --files-with-matches {q} || true" \
            --preview-window right:wrap:nohidden \
            --preview "rg --color=always --line-number --context 3 {q} {}"
}

rgv() {
    local search_for=$1
    rgg "${search_for}" | xargs --no-run-if-empty --open-tty vim
}
# }}}

# ls, file listing {{{
if program_exists eza; then
    alias ll='eza --group-directories-first --long --all --all --git --classify --time-style long-iso'
    alias lld='ll --only-dirs'
    alias llsd='ll --sort date'

    alias llt='eza --group-directories-first --long --all --git --tree -I.git'
    alias llt2='llt -L 2'
    alias llt3='llt -L 3'
    alias llt4='llt -L 4'
    alias lltd='llt --only-dirs'

    alias llts='eza --group-directories-first --all --tree -I.git'
    alias llts2='llts -L 2'
    alias llts3='llts -L 3'
    alias llts4='llts -L 4'
    alias lltsd='llts --only-dirs'
fi
# }}}

# cd, mkdir, directory handling {{{
cd() {
    if [ $# -eq 0 ]; then
        # no arguments
        builtin cd
    elif [ -d "$1" ]; then
        # argument is a directory
        builtin cd "$1"
    elif [ "$1" == "-" ]; then
        # previous directory
        builtin cd -
    else
        # another argument type
        builtin cd "$(dirname $1)"
    fi
}
# }}}

# git {{{
if program_exists git; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    export GIT_COMPLETION_SHOW_ALL=1
    export GIT_COMPLETION_SHOW_ALL_COMMANDS=1

    g() {
        if [[ $# == 0 ]]; then git st; else git "$@"; fi
    }

    function_exists __git_wrap__git_main || { function_exists _completion_loader && _completion_loader git ; }
    function_exists __git_wrap__git_main && complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
fi
# }}}

# vim, neovim {{{
alias vi=nvim
alias vis='nvim -S'

vii() {
    if [ "$#" -gt 0 ]; then
        find "$@" | fzf --multi | xargs --no-run-if-empty --open-tty vim
    else
        fzf --multi | xargs --no-run-if-empty --open-tty vim
    fi
}

vip() {
    if [[ $# == 0 ]]; then vi <(fc -s); else vi <("$@"); fi
}

vipq() {
    if [[ $# == 0 ]]; then vi -q <(fc -s); else vi -q <("$@"); fi
}

via() {
    if [[ $# == 0 ]]; then vi $(fc -s); else vi $("$@"); fi
}
# }}}

# fzf {{{
# usage: _fzf_setup_completion path|dir|var|alias|host COMMANDS...
if function_exists _fzf_setup_completion; then
    path_completion_apps=(bcompare mc)

    for i in "${path_completion_apps[@]}"; do
        if program_exists "$i"; then
            _fzf_setup_completion path "$i"
        fi
    done
fi

if program_exists fzf; then
    export FZF_DEFAULT_OPTS="
        --preview 'cat {}'
        --preview-window hidden
        --bind 'f4:execute(vim {})'
        --bind 'ctrl-a:select-all'
        --bind 'f3:toggle-preview'
        --bind 'shift-left:preview-page-up'
        --bind 'shift-right:preview-page-down'"
fi
# }}}

# Docker, Helm, Kubectl {{{

if program_exists podman; then
    alias d='podman'
    if function_exists _completion_loader; then
        complete -F  __start_podman d
    fi
fi

if program_exists docker; then
    alias d='docker'
    if function_exists _completion_loader; then
        _completion_loader docker
        complete -F __start_docker d
    fi
fi

if program_exists helm3; then
    alias h='helm3'

    source <(helm3 completion bash)
    complete -o default -F __start_helm h
elif program_exists helm; then
    alias h='helm'

    source <(helm completion bash)
    complete -o default -F __start_helm h
fi

if program_exists kubectl; then
    alias k='kubectl'

    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi
# }}}

