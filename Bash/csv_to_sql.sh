#!/bin/bash

# Based on: https://github.com/pavanchhatpar/csv-to-sql-converter

FILE_NAME="$(cd ../ && pwd)/dummy_data/$1"

cat $FILE_NAME > tmp.csv

NEW_FILE="$(cd ../ && pwd)/sql/$2"

TABLE=$3

COLUMNS="$(head --lines=1 tmp.csv | sed "s/|/,/g" | tr -d "\"\r\n")"

tail --lines=+2 tmp.csv | while read l ; do
VALUES=$(echo $l | sed "s/|/,/g" | sed "s/'/''/g" | tr -d "\r\n")

echo "INSERT INTO $TABLE ($COLUMNS) VALUES ($VALUES);"
done > $NEW_FILE

sed -i "s/\"/'/g" $NEW_FILE

rm tmp.csv

exit 0