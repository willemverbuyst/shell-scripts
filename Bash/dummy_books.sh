#!/bin/bash

# script to generate csv file with dummy data
# data is generated for: 
# - title 
# - language
# - author
# - year
# - has been read or not

NEW_FILE="./backend/database/dummy_data/books.csv"
touch $NEW_FILE

echo "\"book_title\"|\"book_language\"|\"book_author\"|\"book_year\"|\"book_read\"" > $NEW_FILE

WORDS=/usr/share/dict/words

for i in {1..53}
do
  TITLE_PART1=$(shuf -n1 "$WORDS")
  TITLE_PART2=$(shuf -n1 "$WORDS")

  AUTHOR_FIRSTNAME=$(echo "abcdefghijklmnopqrstuvwxyz" | fold -w1 | shuf -n1)
  AUTHOR_LASTNAME=$(shuf -n1 "$WORDS")

  LANGUAGES=("EN" "NL" "ES" "FR")
  NUMBER_OF_LANGUAGES=${#LANGUAGES[@]}
  LANGUAGE_INDEX=$(($RANDOM % $NUMBER_OF_LANGUAGES))
  LANGUAGE=${LANGUAGES[$LANGUAGE_INDEX]}

  YEARS=(2000 2001 2002 2003 2004 2005)
  NUMBER_OF_YEARS=${#YEARS[@]}
  YEARS_INDEX=$(($RANDOM % $NUMBER_OF_YEARS))
  YEAR=${YEARS[$YEARS_INDEX]}

  READ=$(($RANDOM%2)) 
  
  echo "\"${TITLE_PART1^} ${TITLE_PART2^}\"|\"${LANGUAGE}\"|\"${AUTHOR_FIRSTNAME^}. ${AUTHOR_LASTNAME^}\"|${YEAR}|${READ}" >> $NEW_FILE
done

exit 0