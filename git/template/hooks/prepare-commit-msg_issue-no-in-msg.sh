COMMIT_MESSAGE_FIRST_LINE=$(head -n1 ${1})
if [ -n "${COMMIT_MESSAGE_FIRST_LINE}" ]; then
	exit 0
fi
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
ISSUE_NUMBER=$(echo "${BRANCH_NAME}" | egrep -o '^[0-9]+')

if [ -n "${ISSUE_NUMBER}" ]; then
	echo -e "\n\nrefs #${ISSUE_NUMBER}" "$(cat "${1}")" > "${1}"
fi
