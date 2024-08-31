#!/bin/bash

max=0
read n

while [[$n -ne 0]];
do
	echo"Read numbers until 0"
	read n
	if [[$n -gt $max]];
	then
		max = $((n + 0))
	fi
done
echo "The maximum number is: $max"
