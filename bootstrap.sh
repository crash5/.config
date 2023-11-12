#!/usr/bin/env bash

if [[ -z "$XDG_CONFIG_HOME" ]]; then
	echo "Please source shrc first"
	exit
fi

dirs=(
	"$XDG_BIN_HOME"

	"$XDG_STATE_HOME/bash"
	"$XDG_STATE_HOME/less"
	"$XDG_STATE_HOME/python"
	"$XDG_STATE_HOME/sqlite3"

	"$XDG_DATA_HOME/vim/undo"
	"$XDG_DATA_HOME/vim/swap"
	"$XDG_DATA_HOME/vim/backup"
)

files=(
	"$XDG_SATE_HOME/sqlite3/sqlite_history"
	"$XDG_SATE_HOME/python/python_history"
)

for dir in "${dirs[@]}"; do
	mkdir -p $dir
	echo "made $dir"
done

for file in "${files[@]}"; do
	touch $file
	echo "touched $file"
done

for file in "$XDG_CONFIG_HOME/bash/utilities/"*.*; do
	base=$(basename $(basename "$file" .sh) .py)
	[[ -e "$XDG_BIN_HOME/$base" ]] || ln -s "$file" "$XDG_BIN_HOME/$base"
	echo "Added utility $base"
done
