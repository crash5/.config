# if [[ ${PROMPT_COMMAND} != *"history -n"* ]]; then
#     export PROMPT_COMMAND="history -n;${PROMPT_COMMAND}"
# fi

if [[ ${PROMPT_COMMAND} != *"history -a"* ]]; then
    export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"
fi
