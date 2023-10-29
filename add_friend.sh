#!/bin/bash

# Takes in 2 arguments - id for user and id for friend

if [ "$#" -eq 2 ]; then
	id="$1"
	friend="$2"
	if [ -d "/home/ranya/Desktop/Users/$id" ]; then
		if [ -d "/home/ranya/Desktop/Users/$friend" ]; then
			if ! grep -q "$friend" "/home/ranya/Desktop/Users/$id/friends.txt"; then
				echo "$friend" >> "/home/ranya/Desktop/Users/$id/friends.txt"
				echo "$id" >> "/home/ranya/Desktop/Users/$friend/friends.txt"
				echo "Friend added successfully"
				exit 0
			else
				echo "Friend already on friends list"
				exit 1
			fi
		else
			echo "Friend does not exist"
			exit 1
		fi
	else
		echo "User does not exist"
		exit 1
	fi
else
	echo "Incorrect number of arguments given, you had $# and you need 2"
fi

