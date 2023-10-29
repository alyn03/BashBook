#!/bin/bash


while true; do #creating an endless loop
	read -p "Enter a request: " request # reading in one of the 4 commands, then it jumps to whatever case was given
	case "$request" in 
		"create") 
		read -p "Enter a user name: " user #prompts the user to ask for id name, this is then passed in with the bash script that is called
		./create.sh "$user"
			;;
		"add")
		read -p "Enter a user name: " id #asks for id
		read -p "Enter a friend name: " friend #then, asks for friend
		./add_friend.sh "$id" "$friend" #passes both args in with the calling of the .sh file
			;;
		"post")
		read -p "Enter the senders name: " sender # "
		read -p "Enter the receivers name: " receiver # "
		read -p "Enter the message: " message # "
		./post_message.sh "$sender" "$receiver" "$message"
			;;
		"display")
		read -p "Enter users name: " user # "
		./display_wall.sh "$user" # "
			;;
		*)
			echo "Accepted Commands: {create/add/post/display}" #if they put in an incorrect case
			;;
	esac
done


