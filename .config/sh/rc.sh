# Requires the sourcing of xdg.sh prior to running

[ -z "$PS1" ] && return # If not running interactively, don't do anything

# Load Aliases and Functions
[ -f "$XDG_CONFIG_HOME"/sh/aliases.sh ] && . $XDG_CONFIG_HOME/sh/aliases.sh

export EDITOR="mcedit"
export VISUAL=$EDITOR
