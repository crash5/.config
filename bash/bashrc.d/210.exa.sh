if program_exists exa; then
    alias ll='exa --long --group-directories-first --all --all --git'
    alias llt='exa --long --group-directories-first --all --git --tree -I.git'
    alias llts='exa --group-directories-first --all --tree -I.git'
    alias llsd='ll -s date'
fi
