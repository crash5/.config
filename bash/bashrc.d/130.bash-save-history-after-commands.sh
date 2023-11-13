# if [[ ${PROMPT_COMMAND} != *"history -n"* ]]; then
#     export PROMPT_COMMAND="history -n;${PROMPT_COMMAND}"
# fi

if [[ ${PROMPT_COMMAND} != *"history -a"* ]]; then
    export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"
fi

if [[ ${PROMPT_COMMAND} != *"/bash/bash-history-"* ]]; then
    export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(HISTTIMEFORMAT='' history 1)" >> "$XDG_STATE_HOME"/bash/bash-history-$(date "+%Y-%m-%d").log; fi;'"${PROMPT_COMMAND}"
fi
