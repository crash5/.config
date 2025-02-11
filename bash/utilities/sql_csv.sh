if [ -z "$1" ]; then echo "Usage: sql_csv <file.csv>"
else
    sqlite3 :memory: -cmd ".import -csv ${1} t1" -cmd ".mode column"
fi

