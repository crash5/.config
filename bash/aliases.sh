alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lahF --color=always --group-directories-first'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias -- -='cd -'
alias df='df -h'
#alias du='du -hsL'
alias vi='vim'
alias openports='netstat -nape --inet'
alias shareonhttp='python -m SimpleHTTPServer'
alias mc='. /usr/lib/mc/mc-wrapper.sh -x'
alias rl='readlink -m'
alias me="python3 -c 'import requests,pprint; pprint.pprint(requests.get(\"https://ifconfig.co/json\").json())'"
alias treeimpl='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias treeimplwogit='find . -not -path "./.git/*" | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias k='kubectl'
complete -o default -F __start_kubectl k

alias d='docker'
function_exists _completion_loader && _completion_loader docker
complete -F _docker d


g() {
    if [[ $# == 0 ]]; then git st; else git "$@"; fi
}
function_exists _completion_loader && _completion_loader git
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main  g

mkcd() {
    mkdir -p "${1:? need a directory}" && cd "${1}"
}

cdl() {
    cd "${1:? need a directory}" && ll
}

go() {
    docker run --rm -v "$(pwd)":/go golang:alpine go "$@"
}

