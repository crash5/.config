#!/usr/bin/env bash

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    echo "No XDG env. vars found. Using the defaults for the install."
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    . "$SCRIPT_DIR"/bash/profile.d/200.xdg-dirs.sh
fi

dirs=(
    "$XDG_BIN_HOME"
    "$XDG_CACHE_HOME"
    "$XDG_CONFIG_HOME"
    "$XDG_LIB_HOME"

    "$XDG_DATA_HOME/bash/history"
    "$XDG_DATA_HOME/git"
    "$XDG_DATA_HOME/vim"
    "$XDG_DATA_HOME/totalcommander"

    "$XDG_STATE_HOME/bash"
    "$XDG_STATE_HOME/less"
    "$XDG_STATE_HOME/python"
    "$XDG_STATE_HOME/sqlite3"

    "$XDG_STATE_HOME/vim/backup"
    "$XDG_STATE_HOME/vim/nvimundo"
    "$XDG_STATE_HOME/vim/swap"
    "$XDG_STATE_HOME/vim/views"
    "$XDG_STATE_HOME/vim/vimundo"
)

files=(
    "$XDG_STATE_HOME/sqlite3/sqlite_history"
    "$XDG_STATE_HOME/python/python_history"
)

for dir in "${dirs[@]}"; do
    mkdir -p "$dir"
    echo "made $dir"
done

for file in "${files[@]}"; do
    touch "$file"
    echo "touched $file"
done

for file in "$XDG_CONFIG_HOME/bash/utilities/"*.*; do
    base=$(basename $(basename "$file" .sh) .py)
    [[ -e "$XDG_BIN_HOME/$base" ]] || ln -s "$file" "$XDG_BIN_HOME/$base"
    echo "Added utility $base"
done
