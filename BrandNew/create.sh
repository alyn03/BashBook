#!/bin/bash

#Takes in 1 argument - id
#Creating a user

path="Users"

#needs access to client pipe, needs to be able send a response down it
client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"

#check if the user folder exists, else make it
if [ ! -d "/home/ranya/Desktop/Users" ]; then
	mkdir -p "/home/ranya/Desktop/Users"
fi

#checking for valid amount of inputs
if [ "$#" -eq 1 ]; then
	arg="$1" #for e.g. "Ranya"
	if [ -d "/home/ranya/Desktop/Users/$arg" ]; then #check if user folder already exists
		echo "nok: user already exists" #response
		exit 1 #exit, operation finished
	else
 		#create all the files needed for a user
		mkdir -p "$path/$arg" #creates a directory with the name of the argument
		touch "$path/$arg/wall.txt" #creates wall 
		touch "$path/$arg/friends.txt" #creates friends list
		echo "Start_Of_File" >> "$path/$arg/wall.txt" #add start of file to wall file
		echo "$arg" >> "$path/$arg/friends.txt" #add yourself - allows you to post on your own wall
		echo "ok: user created!"
		exit 0 #exit, operation finished
	fi
else
	echo "Usage: $0 <arg>" #wrong amount of args
	exit 1 #exit, operation failed
fi
