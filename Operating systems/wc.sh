#!/bin/bash

count_words() {
  local file="$1"
  wc -w < "$file"
}

max_word_count=0
file_with_max_words=""

for file in "$@"
do
  current_word_count=$(count_words "$file")

  if [[ $current_word_count -gt $max_word_count ]]
  then
    max_word_count=$current_word_count
    file_with_max_words="$file"
  fi
done

if [[ -n "$file_with_max_words" ]]
then
  echo "File '$file_with_max_words' has the most words ($max_word_count)"
else
  echo "GIve me FILEEES...please :)"
fi
