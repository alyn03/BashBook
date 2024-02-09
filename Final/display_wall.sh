#!/bin/bash

#takes in id of user that the wall belongs to 

if [ "$#" -eq 1 ]; then #check if there are the correct amount of arguements
	id="$1" #arguement given is the user who will have their wall displayed
	if [ -d "/home/ranya/Desktop/Users/$id" ]; then #check if the user exists
		echo "wall display"
		exit 0
	else
		echo "User does not exist"
	fi
else
	echo "Incorrect number of arguements, $# given but only 1 required"
	exit 1
fi



