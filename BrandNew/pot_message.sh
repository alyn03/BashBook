#!/bin/bash

#takes in 3 arguements, sender, reciever and message

if [ "$#" -eq 3 ]; then
	sender="$1"
	receiver="$2"
	message="$3"
	if [ -d "/home/ranya/Desktop/Users/$sender" ]; then
		if [ -d "/home/ranya/Desktop/Users/$receiver" ]; then
			if  grep -q "$sender" "/home/ranya/Desktop/Users/$receiver/friends.txt" ; then
				echo "$sender: $message" >> "/home/ranya/Desktop/Users/$receiver/wall.txt"
				#echo "$message has been sent to $receiver"
				echo "Message sent"
				exit 0	
			
			else
				echo "Person not on friend's list"
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
	echo "Incorrect amount of arguements, $# given, while 3 are needed"
	exit 1
fi
