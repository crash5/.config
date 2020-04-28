# attach to running tmux or create new with name 'default'
if [ -z "$TMUX" ] && [ ! -z "$(type -P tmux)" ]
then
    if [[ "$(</proc/sys/kernel/osrelease)" == *Microsoft* ]]; then
        tmux new-window -t default -c "$PWD"
    fi
    tmux attach -t default || tmux new -s default
fi
