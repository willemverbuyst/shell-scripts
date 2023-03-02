#!/bin/bash

# script to generate csv file with dummy data
# data is generated for:
# - initials of firstname plus lastname
# - number of books written

NEW_FILE="./backend/database/dummy_data/authors.csv"
touch $NEW_FILE

echo "\"author_name\"|\"author_books_written\"" > $NEW_FILE

WORDS=/usr/share/dict/words

for i in {1..27}
do
  AUTHOR_FIRSTNAME=$(echo "abcdefghijklmnopqrstuvwxyz" | fold -w1 | shuf -n1)
  AUTHOR_LASTNAME=$(shuf -n1 "$WORDS")

  NUMBER_OF_BOOKS_WRITTEN=$(( ( RANDOM % 100 )  + 1 ))
  
  echo "\"${AUTHOR_FIRSTNAME^}. ${AUTHOR_LASTNAME^}\"|${NUMBER_OF_BOOKS_WRITTEN}" >> $NEW_FILE
done

exit 0