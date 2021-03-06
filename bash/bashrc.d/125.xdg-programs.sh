export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker/"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export PSQLRC="$XDG_CONFIG_HOME/psql/psqlrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

export HISTFILE="$XDG_DATA_HOME/bash/history"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export PSQL_HISTORY="$XDG_DATA_HOME/psql/history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/history"


alias emacs="emacs -q --load $XDG_CONFIG_HOME/emacs/emacsrc"
alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias rtorrent="rtorrent -n -o import=$XDG_CONFIG_HOME/rtorrent/conf"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
