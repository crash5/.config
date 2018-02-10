shopt -s checkwinsize
shopt -s histappend

export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

###############################################################################
# aliasok
# az alias ideiglenes tiltásához: \parancs. Pl: \df
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -i'
alias ll='ls -lahF --color=always --group-directories-first'
alias cb='cd $OLDPWD'
alias ..='cd ..'
alias df='df -h'
#alias du='du -hsL'
alias vi='vim'
alias openports='netstat -nape --inet'
alias fwhat='find / -name'
alias fwho='find / -user'
alias finf='grep -rl . -e'
alias shareonhttp='python -m SimpleHTTPServer'
alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias rl='readlink -m'

###############################################################################
# sorduplazas hanyagolasa a historyban, nelegyen history
export HISTCONTROL=ignoreboth
#export HISTFILE=/dev/null
#export HISTSIZE=1000
#export HISTFILESIZE=1000

###############################################################################
# nyelv beállítás
export LC_ALL=en_GB.UTF-8

###############################################################################
# prompt H/h - host, u - user, w - workdir, t - 15:00:00
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    #root
    #PS1='\[\033]0;${PWD}\007\]\n\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]$(__git_ps1 "(%s)")\$ '
    #user
    PS1='\[\033]0;\w\007\]\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]$(__git_ps1 "(%s) ")\$ '
else
    PS1='\[\033]0;${PWD}\007\]\n\u@\h:\w $(__git_ps1 "(%s)")\$ '
fi
unset color_prompt

export PS1
export GIT_PS1_SHOWDIRTYSTATE=1
bind Space:magic-space

###############################################################################
# default editor
EDITOR='mcedit'
VISUAL=$EDITOR
export EDITOR VISUAL

export PATH=$PATH:~/bin
export WINEDEBUG=-all
export BC_ENV_ARGS=~/.bcrc

ENV=$HOME/.bashrc
BASH_ENV=$ENV
export TERM=xterm-256color

###############################################################################
# jogok uj fajloknak (user, group, other)
# 1=x, 2=w, 4=r
# a jog az umask 7-ből való kivonásával jön ki: 7-0=7, 7-7=0, 7-7=0 (700)
umask 077  # csak en (700)
#umask u=rwx,g=r,o=r # 744 = umask 066
#umask 002 # mindenki olvashatja, csoport irhatja is (775)
#umask 022 # mindenki csak olvashatja (755)
