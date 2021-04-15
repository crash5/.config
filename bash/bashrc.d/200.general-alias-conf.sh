# vim: foldmethod=marker

# General {{{
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'
#alias du='du -hsL'

alias openports='netstat -nape --inet'

alias shareonhttp='python -m SimpleHTTPServer'
alias me="python3 -c 'import requests,pprint; pprint.pprint(requests.get(\"https://ifconfig.co/json\").json())'"

[ -f /usr/lib/mc/mc-wrapper.sh ] && alias mc='. /usr/lib/mc/mc-wrapper.sh -x'

alias rl='readlink -m'
alias treeimpl='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias treeimplwogit='find . -not -path "./.git/*" | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

if program_exists bat; then
    alias cat='bat -p'
fi
# }}}

# ripgrep {{{
alias rg="rg \
    --hidden \
    --smart-case \
    --follow \
    --binary \
    --search-zip \
    --no-ignore \
    --glob '!**/.git/**'"

rgg() {
    local search_for=$1
    rg --files-with-matches --smart-case "${search_for}" | \
        fzf --query "${search_for}" --disabled --multi \
            --bind "change:reload:rg --files-with-matches --smart-case {q} || true" \
            --preview-window right:wrap:nohidden \
            --preview "rg --smart-case --color=always --context 3 {q} {}"
}

rgv() {
    local search_for=$1
    rgg "${search_for}" | xargs --no-run-if-empty --open-tty vim
}
# }}}

# ls, file listing {{{
alias ll='ls -lahF --color=always --group-directories-first'
alias llsd='ls -lahF --color=always --group-directories-first --sort=time --reverse'

if program_exists exa; then
    alias ll='exa --long --group-directories-first --all --all --git'
    alias llt='exa --long --group-directories-first --all --git --tree -I.git'
    alias llts='exa --group-directories-first --all --tree -I.git'
    alias llsd='ll -s date'
fi
# }}}

# cd, mkdir, directory handling {{{
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias -- -='cd -'

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

mkdirr() {
    mkdir -p "${1:? need a directory}" && cd "${1}"
}
# }}}

# git {{{
if program_exists git; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    export GIT_COMPLETION_SHOW_ALL=1

    g() {
        if [[ $# == 0 ]]; then git st; else git "$@"; fi
    }

    function_exists __git_wrap__git_main || { function_exists _completion_loader && _completion_loader git ; }
    function_exists __git_wrap__git_main && complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
fi
# }}}

# vim, neovim {{{
alias vi='vim'
alias vis='vim -S'
vii() {
    if [ "$#" -gt 0 ]; then
        find "$@" | fzf --multi | xargs --no-run-if-empty --open-tty vim
    else
        fzf --multi | xargs --no-run-if-empty --open-tty vim
    fi
}

alias vin=nvim

vip() {
    if [[ $# == 0 ]]; then vim <(fc -s); else vim <("$@"); fi
}

vipq() {
    if [[ $# == 0 ]]; then vim -q <(fc -s); else vim -q <("$@"); fi
}

via() {
    if [[ $# == 0 ]]; then vim $(fc -s); else vim $("$@"); fi
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
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    source "${SCRIPT_DIR}"/161.fzf-key-bindings.bash
fi
# }}}

# Docker, Helm, Kubectl {{{
if program_exists docker; then
    alias d='docker'
    if function_exists _completion_loader; then
        _completion_loader docker
        complete -F _docker d
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

