#!/bin/bash

#Takes in 1 argument - id
#Creating a user

path="Users" #variable that holds the pathway

if [ "$#" -eq 1 ]; then #one and only 1 arg
	arg="$1" #set the argument to variable arg
	if [ -d "/home/ranya/Desktop/Users/$arg" ]; then #check if user folder already exists
		echo "User already exists" #if it's found that means it was previously created
	else 
 		#user doesn't exist
		mkdir -p "$path/$arg" #creates a directory with the name of the argument
		touch "$path/$arg/wall.txt" #creates a file called wall.txt
		touch "$path/$arg/friends.txt" #creates a file called friends.txt
		echo "Start_Of_File" >> "$path/$arg/wall.txt" #adds "Start_Of_File" to the wall.txt
		echo "$arg" >> "$path/$arg/friends.txt" #adds yourself to your own friends.txt, this allows you to write on your own wall
		echo "User created successfully"
	fi
else
	echo "Usage: $0 <arg>" #wrong amount of args given
	exit 1 #failed
fi
