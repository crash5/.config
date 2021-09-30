#!/usr/bin/env bash

declare -rA apps=(
    [vim]="vim/vim-appimage"
    [flameshot]="flameshot-org/flameshot"
    [vifm]="vifm/vifm"
)


# Methods

# Download latest appimage for a project
#
# param 1: github ns/project name (eg: "vim/vim-appimage")
# return: downloaded file name (eg: "GVim-v8.2.2576.glibc2.15-x86_64.AppImage")
function download() {
    local -r project="${1}"

    local -r LATEST_RELEASE_LINK="https://api.github.com/repos/${project}/releases/latest"
    local -r DOWNLOAD_PATTERN='https://github.com/[^/]+/[^/]+/releases/download/[^}]*\.AppImage'

    local -r download_link=$(curl -s ${LATEST_RELEASE_LINK} | grep -Eo ${DOWNLOAD_PATTERN} | uniq)
    curl -O -J -L -s "${download_link}"

    local -r file_name="${download_link##*/}"
    echo "${file_name}"
}

# main
for key in "${!apps[@]}"; do
    value=${apps[$key]}
    echo "Download: ${key} (${value})"
    file_name=$(download ${value})
    chmod u+x "${file_name}"
    echo "Create symlink: ${key} -> ${file_name}"
    ln -s -f "${file_name}" "${key}"
done
