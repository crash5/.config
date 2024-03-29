alias ll='ls -lahF --color=always --group-directories-first'
alias llsd='ls -lahF --color=always --group-directories-first --sort=time --reverse'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'
alias -- -='cd -'

alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'
alias du='du -hsL'

alias rl='readlink -m'
alias treeimpl='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias treeimplwogit='find . -not -path "./.git/*" | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias openports='netstat -nape --inet'

alias shareonhttp='python -m SimpleHTTPServer'
alias me="python3 -c 'import requests,pprint; pprint.pprint(requests.get(\"https://ifconfig.co/json\").json())'"

alias p=less

alias rcmd="head -n -2 \"${BASH_SOURCE[0]}\" | xclip -i > /dev/null"
alias rcmdtmux="head -n -2 \"${BASH_SOURCE[0]}\" | tmux load-buffer -"
