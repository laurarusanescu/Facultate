#!/bin/bash

if [ "$#" -lt 1]; then
        echo "Usage: <file> <dir1> <dir2> ...";
        exit 1
fi

fileName= "$1"
for dir in "$@"; do
        if [!-d "$dir" ]; then
                echo "Directory not found";
                continue
        fi
	for dir in $(find . -type d); do
		cd $dir
		for subdir in $(find . -type d); do
			cd $subdir
			for file in 'ls'; do
				if ["$fileName" = "$file"]; then
					sed -i.bck $file
				fi
			done
		done
	done
done

echo "Task completed.";
