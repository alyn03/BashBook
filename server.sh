#!/bin/bash


while true; do #creating an endless loop
	read -p "Enter a request: " request # reading in one of the 4 commands
	case "$request" in 
		"create") #
		read -p "Enter a user name: " user
		./create.sh "$user"
			;;
		"add")
		read -p "Enter a user name: " id
		read -p "Enter a friend name: " friend
		./add_friend.sh "$id" "$friend"
			;;
		"post")
		read -p "Enter the senders name: " sender
		read -p "Enter the receivers name: " receiver
		read -p "Enter the message: " message
		./post_message.sh "$sender" "$receiver" "$message"
			;;
		"display")
		read -p "Enter users name: " user
		./display_wall.sh "$user"
			;;
		*)
			echo "Accepted Commands: {create/add/post/display}"
			;;
	esac
done


