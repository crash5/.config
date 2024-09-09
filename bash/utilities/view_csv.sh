if [ -z "$1" ]; then echo "Usage: view_csv <file.csv>"
    else cat "$1" | column -s, -t | less -F -S -X -K
fi
