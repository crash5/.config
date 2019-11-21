alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lahF --color=always --group-directories-first'
alias ..='cd ..'
alias -- -='cd -'
alias df='df -h'
#alias du='du -hsL'
alias vi='vim'
alias openports='netstat -nape --inet'
alias finf='grep -rl . -e'
alias shareonhttp='python -m SimpleHTTPServer'
alias mc='. /usr/lib/mc/mc-wrapper.sh -x'
alias rl='readlink -m'
alias me="python3 -c 'import requests,pprint; pprint.pprint(requests.get(\"https://ifconfig.co/json\").json())'"
alias treeimpl='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias treeimplwogit='find . -not -path "./.git/*" | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias g='_f() { if [[ $# == 0 ]]; then git st; else git "$@"; fi }; _f'
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main  g

alias k='kubectl'
complete -o default -F __start_kubectl k

