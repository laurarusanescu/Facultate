#!/bin/bash

users=$(who | awk '{print $1}')

for user in $users; do
	info=$(w -h "$user" | awk '/'"$user"'/{print $2, $3}')
	username=${info%% *}
	ip=${info#* }

	echo "$username - $ip"
done
