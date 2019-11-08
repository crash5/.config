#!/bin/bash

if [ "$1" == "" ]; then
    echo "Usage: $0 <pattern> [file]"
    exit 1
fi

#grep -n --color=always $2 "$1" `find .` 2>/dev/null
grep -R -n --color=always --exclude-dir=.git $2 "$1" 2>/dev/null
