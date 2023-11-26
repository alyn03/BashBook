#!/bin/bash

#checks the number of arguements = 1
if [ "$#" -ne 1 ]; then
	echo "Incorrect number of arguments give, $# were give, only 1 needed"
	exit 1
fi
id="$1"
# Ensure that the client's directory to the client pipe and the client itself exists
if [ ! -e "/home/ranya/Desktop/Users/Pipes/$id" ]; then #if the client folder doesn't exist, then create it and a pipe for the client
    mkdir -p "/home/ranya/Desktop/Users/Pipes/$id" 
    mkfifo "/home/ranya/Desktop/Users/Pipes/$id/client"
fi

# Ensures that the server's directory exists
if [ ! -e "/home/ranya/Desktop/Users/Pipes/server" ]; then #if the server pipe folder doesn't exist, create it and a server pipe
    mkfifo "/home/ranya/Desktop/Users/Pipes/server"
fi

client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"
server_pipe="/home/ranya/Desktop/Users/Pipes/server"

#trap "rm -f $client_pipe" EXIT

while true; do 

	
	# Tell me a query
	#echo "before request"
	read -p "Enter request: " cmd args #enter which operation you want 
	#echo "after request"
	
	# Send it to server
	echo "$cmd $id $args" > $server_pipe
	#echo "after sending to server"
	
	# Read the content of the client pipe into variable content
	content=$(cat "$client_pipe") 
	#echo "after response"

 	# These are all the possible outcomes across all 4 operations
	case "$content" in
		"ok: user created!")
		echo "SUCCESS: User created!"
			;;
		"nok: user already exists")
		echo "ERROR: user already exists" 
			;;
		"wall display")
		tail -n +2 "/home/ranya/Desktop/Users/$id/wall.txt"
			;;
		"Friend already on friends list")
		echo "You are already buddies!"
			;;
		"Friend does not exist")
		echo "Are you sure your friend is on bashbooks?"
			;;
		"User does not exist")
		echo "I think you're a ghost..."
			;;
		"Person not on friend's list")
		echo "You are NOT buddies!"
			;;
		"Message sent")
		echo "Your friend should receiver your message shortly.."
			;;
		"Friend added successfully")
		echo "You're all set man, have fun!"
			;;
		*)
			echo "failed"
			;;
	esac
done
