//post_message.sh


#!/bin/bash

#takes in 3 arguements, sender, reciever and message

if [ "$#" -eq 3 ]; then
	sender="$1"
	receiver="$2"
	message="$3"
	if [ -d "/home/ranya/Desktop/Users/$sender" ]; then
		if [ -d "/home/ranya/Desktop/Users/$receiver" ]; then
			if  grep -q "$sender" "/home/ranya/Desktop/Users/$receiver/friends.txt" ; then
				echo "$message" >> "/home/ranya/Desktop/Users/$receiver/wall.txt"
				echo "$message has been sent to $receiver"
				exit 0	
			
			else
				echo "Sender and receiver are not friends"
				exit 1
			fi
		else
			echo "receiver does not exist"
			exit 1
		fi
	else
		echo "sender does not exist"
		exit 1
	fi
else 
	echo "Incorrect amount of arguements, $# given, while 3 are needed"
	exit 1
fi
