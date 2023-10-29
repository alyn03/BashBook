#!/bin/bash

# Takes in 2 arguments - id for user and id for friend

if [ "$#" -eq 2 ]; then #2 and only 2 args
	id="$1" #1st arg
	friend="$2" #2nd arg
	if [ -d "/home/ranya/Desktop/Users/$id" ]; then #check if 1st user exists
		if [ -d "/home/ranya/Desktop/Users/$friend" ]; then #check if 2nd user exists
			if ! grep -q "$friend" "/home/ranya/Desktop/Users/$id/friends.txt"; then #checking if friend's value is already somewhere on the file
				echo "$friend" >> "/home/ranya/Desktop/Users/$id/friends.txt" #echo (print) the friend's value to the 1st user's friend list
				echo "$id" >> "/home/ranya/Desktop/Users/$friend/friends.txt" #printing the id's value to the 2nd user's list
    				#friends on facebook are synchronised, not the same as a follower
				echo "Friend added successfully"
				exit 0
			else
				echo "Friend already on friends list" #if the name was found on the file
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
	echo "Incorrect number of arguments given, you had $# and you need 2" #wrong amount of args
fi

