#!/bin/bash

#takes in id of user that the wall belongs to 


if [ "$#" -eq 1 ]; then
	id="$1"
	if [ -d "/home/ranya/Desktop/Users/$id" ]; then
		cat /home/ranya/Desktop/Users/$id/wall.txt
		echo "end_of_file"
		exit 0
	else
		echo "user does not exist"
	fi
else
	echo "Incorrect number of arguements, $# given but only 1 required"
	exit 1
fi




