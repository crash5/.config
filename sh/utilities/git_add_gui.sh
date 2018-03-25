#!/usr/bin/env bash

# Use external diff or merge tool for git interactive add (git add -p)
# To use:
#  1. move script under $PATH
#  2. create git alias for the script: git config --global alias.addgui '!git_add_gui.sh'

# TODO: take care of temporary files on error or interrupt
# TODO: add option to use merge tool with parameters like WORK_TREE_VERSION INDEX_VERSION and OUTPUT_FILE
# TODO: use patch instead of file copying

# Called with parameters: WORK_TREE_VERSION INDEX_VERSION
DIFF_TOOL="c:/Program Files/Beyond Compare 4/BCompare.exe"

# handle space in path and file names
IFS=$'\n'

isGitRepository()
{
    REPOSITORY_ROOT_PATH="$(git rev-parse --show-toplevel 2>/dev/null)"
    local RETURN_CODE=$?
    return ${RETURN_CODE}
}

# param 1: output array
# param 2: list of files and folders to process
createFileList() {
    local FILES_AND_FOLDERS=("${@:2}") # everything after 1. parameter

    local WORKING_FOLDER="${GIT_PREFIX}" # directory from where git alias called, empty if run from repository root
    if [[ ! -z ${WORKING_FOLDER} ]]; then
        # Prepend subdirectory to items if run from a repository subdirectory
        FILES_AND_FOLDERS=("${FILES_AND_FOLDERS[@]/#/${WORKING_FOLDER}}")
    fi

    local -n OUTPUT_ARRAY_REFERENCE="$1"
    for ITEM in "${FILES_AND_FOLDERS[@]}"; do
        local CHANGED_FILES=($(git diff --name-only -- "$ITEM"))

        for FILE in "${CHANGED_FILES[@]}"; do
            OUTPUT_ARRAY_REFERENCE+=("${FILE}")
        done
    done
}

# param 1: source file
# param 2: destination file
copyFileModes() {
    $(chmod --reference="$1" "$2")
    $(chown --reference="$1" "$2")
}

processFile() {
    local FILE="$1"
    local FILE_NAME=$(basename $FILE)

    local WORK_TREE_VERSION="$TEMPORARY_DIRECTORY/$FILE_NAME"
    cp --preserve=all "${FILE}" "${WORK_TREE_VERSION}"

    TEMP_FILE="$(git checkout-index --temp $FILE | cut -f1)"
    local INDEX_VERSION="$TEMP_FILE"

    copyFileModes "${WORK_TREE_VERSION}" "${INDEX_VERSION}"

    "$DIFF_TOOL" "$WORK_TREE_VERSION" "$INDEX_VERSION"

    mv "$FILE" "$WORK_TREE_VERSION"
    mv "$INDEX_VERSION" "$FILE"
    git add "$FILE"
    mv "$WORK_TREE_VERSION" "$FILE"
}

# main
if ! isGitRepository; then
    echo "Not a git repository. Exiting..."
    exit 1
fi

COMMAND_LINE_ARGUMENT_COUNT=$#
if [ ${COMMAND_LINE_ARGUMENT_COUNT} = 0 ]; then
    MODIFIED_FILES=($(git diff --name-only))
else
    MODIFIED_FILES=()
    createFileList MODIFIED_FILES "$@"
fi

TEMPORARY_DIRECTORY="$(mktemp -d)"

for FILE in "${MODIFIED_FILES[@]}"; do
    echo "Run: ${DIFF_TOOL} for ${FILE}"
    processFile "${FILE}"
done

rm -rf "$TEMPORARY_DIRECTORY"
