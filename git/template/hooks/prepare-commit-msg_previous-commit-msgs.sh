if [ ! -z "${COMMIT_SOURCE}" ]; then
    return
fi

TEMP=$(mktemp /tmp/git-msg-XXXXX)
trap "rm -f ${TEMP}" exit

SEPARATORLINE="# ------------------------ >8 ------------------------"
SEPARATORLINE_LINENO=$(sed -n "/^${SEPARATORLINE}/{=;q;}" "${COMMIT_MSG_FILE}")
# TODO: check for the success of separator finding

# lines before the separator and the separator line
head -n $((SEPARATORLINE_LINENO + 2)) "${COMMIT_MSG_FILE}" > "${TEMP}"

# previous commit messages
echo -e "#\n# Previous commits:" >> "${TEMP}"
git log \
    --graph \
    --pretty="%C(auto)%h %C(green)%cd%C(reset) | %C(cyan)%s%C(auto)%d [%C(bold blue)a:%an%C(reset),%C(blue)c:%cn%C(reset)]" \
    -10 \
    | sed 's/^\(.\)/# \1/g'  >> "${TEMP}"
echo -e "#" >> "${TEMP}"

# lines after the separator
tail -n +$((SEPARATORLINE_LINENO + 3)) "${COMMIT_MSG_FILE}" >> "${TEMP}"

cat "${TEMP}" > "${COMMIT_MSG_FILE}"
