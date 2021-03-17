export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_COMPLETION_SHOW_ALL=1

if program_exists git; then
    g() {
        if [[ $# == 0 ]]; then git st; else git "$@"; fi
    }

    function_exists __git_wrap__git_main || { function_exists _completion_loader && _completion_loader git ; }
    function_exists __git_wrap__git_main && complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
fi
