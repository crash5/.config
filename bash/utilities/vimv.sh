#!/bin/bash

# Lists the current directory's files in Vim, so you can edit it and save to rename them
# USAGE: vimv [file1 file2]
# https://github.com/thameera/vimv


# Usage info
if [[ $# -eq 0 ]] || [[ ${1} == '-h' ]]; then
    echo "Usage: $(basename $0) <file names>..."
    exit 0
fi


# Methods
check_for_changes() {
    declare -gA files_to_rename
    for ((i=0; i < ${#source_files[@]}; ++i)); do
        if [[ -n "${destination_files[i]}" ]] && [[ "${source_files[i]}" != "${destination_files[i]}" ]]; then
            files_to_rename["${source_files[i]}"]="${destination_files[i]}"
        fi
    done
}

exit_if_no_changes() {
    if [[ ${#files_to_rename[@]} -eq 0 ]]; then
        echo "No changes. Exiting..."
        exit 0
    fi
}

ask_before_operation() {
    echo "Changes (${#files_to_rename[@]}):"
    do_operation print_operation

    read -r -p "Are you sure you wish to continue? [y/N] "
    if [[ "$REPLY" != "y" ]]; then
        echo "Do nothing. Exiting..."
        exit 0
    fi
}

do_operation() {
    for source_file in "${!files_to_rename[@]}"; do
        local destination_file="${files_to_rename[${source_file}]}"
        ($1 "${source_file}" "${destination_file}")
    done
}


# Operations
print_operation() {
    local -r source_file="${1}"
    local -r destination_file="${2}"
    echo "${source_file} => ${destination_file}"
}

rename_operation() {
    local -r source_file="${1}"
    local -r destination_file="${2}"

    mkdir -p "$(dirname "${destination_file}")"

    if git ls-files --error-unmatch "${source_file}" > /dev/null 2>&1; then
        local -r file_in_git=true
    fi

    ${file_in_git:+git} mv "${source_file}" "${destination_file}"
}


# main

declare -r DESTINATION_FILENAMES_FILE="$(mktemp --tmpdir vimv.XXX)"
declare -r EDITOR="${EDITOR:-vi}"

trap '{ rm -f "${DESTINATION_FILENAMES_FILE}" ; exit ; }' EXIT
trap '{ echo -e "\nERROR: changes: ${DESTINATION_FILENAMES_FILE}" ; trap EXIT ; exit 255 ; }' SIGINT SIGTERM

source_files=( "$@" )

printf "%s\n" "${source_files[@]}" > "${DESTINATION_FILENAMES_FILE}"

"${EDITOR}" "${DESTINATION_FILENAMES_FILE}"

# Read destination filenames into array
IFS=$'\r\n' GLOBIGNORE='*' command eval  'destination_files=($(cat "${DESTINATION_FILENAMES_FILE}"))'


check_for_changes

exit_if_no_changes

ask_before_operation

do_operation rename_operation

