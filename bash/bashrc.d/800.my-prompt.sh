function setMyPrompt()
{
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local RED="\[\033[0;31m\]"
    local PURPLE="\[\033[0;35m\]"
    local YELLOW="\[\033[0;33m\]"
    local BROWN="\[\033[0;33m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local LIGHT_BLUE="\[\033[1;34m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local LIGHT_CYAN="\[\033[1;36m\]"
    local LIGHT_RED="\[\033[1;31m\]"
    local LIGHT_PURPLE="\[\033[1;35m\]"
    local LIGHT_YELLOW="\[\033[1;33m\]"
    local WHITE="\[\033[1;37m\]"
    local RESTORE="\[\033[0m\]"

    local windowTitle="\[\e]0;\u@\h: \w\a\]"
    local chrootLocation="${debian_chroot}"
    local newLine="\n"
    local returnCode="[\$?]"
    local userAndHost="\u@\h"
    local path="\w"
    local gitPrompt='$(__git_ps1 "(%s) " 2>/dev/null)'
    local virtualEnvName='${VIRTUAL_ENV:+($(basename "${VIRTUAL_ENV}")) }'
    local tail="\\$"

    export PS1="${windowTitle}${newLine}${returnCode} ${virtualEnvName}${chrootLocation:+${RED}${chrootLocation} }${LIGHT_GREEN}${userAndHost} ${MSYSTEM:+${PURPLE}${MSYSTEM} }${LIGHT_BLUE}${path} ${YELLOW}${gitPrompt}${RESTORE}${tail} "
}

setMyPrompt
