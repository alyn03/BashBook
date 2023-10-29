#!/bin/bash

#Takes in 1 argument - id
#Creating a user

path="Users"

if [ "$#" -eq 1 ]; then
	arg="$1"
	if [ -d "/home/ranya/Desktop/Users/$arg" ]; then #check if user folder already exists
		echo "User already exists"
	else
		mkdir -p "$path/$arg"
		touch "$path/$arg/wall.txt" 
		touch "$path/$arg/friends.txt"
		echo "Start_Of_File" >> "$path/$arg/wall.txt"
		echo "$arg" >> "$path/$arg/friends.txt"
		echo "User created successfully"
	fi
else
	echo "Usage: $0 <arg>"
	exit 1
fi
