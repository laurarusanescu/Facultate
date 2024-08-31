#!/bin/bash

# Check if a file is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a text file as an argument."
  exit 1
fi

# Get the filename from the argument
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

# Create the directory for the dictionary files
mkdir -p words

# Loop through all lowercase and uppercase alphabets (a-z, A-Z)
for letter in {a..z}; do
  # Create a filename with the current letter (uppercase for consistency)
  dict_file="words/$(tr [a-z] [A-Z] <<< "$letter").txt"

  # Use grep to filter words starting with the current letter (case-insensitive)
  grep -iE "^[$letter]" "$filename" | sort | uniq > "$dict_file"
done

echo "Dictionary files created in 'words' directory."

