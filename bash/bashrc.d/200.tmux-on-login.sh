# attach to running tmux or create new with name 'default'
if [ -z "$TMUX" ] && [ ! -z "$(type -P tmux)" ]
then
    tmux new-window -t default -c "$PWD"
    tmux attach -t default || tmux new -s default
fi
