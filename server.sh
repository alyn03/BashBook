#!/bin/bash

#initialise named pipe
server_pipe="/home/ranya/Desktop/Users/Pipes/server"

#check if server pipe exists, otherwise create using mkfifo
if [ ! -e "$server_pipe" ]; then
	mkfifo "$server_pipe"
fi

#infinite loop
while true; do
	echo "Server side" #checking where code exits upon error

	temp=$(cat "$server_pipe") #this holds the temporary value that is taken from the server pipe - sent in from a client
	

	IFS=' ' #setting space as delimiter   (internal field separator)
	read -ra messagelist <<<"$temp" #reading str as an array as tokens separated by IFS  

 	#seperating the elements into separate variables
	cmd="${messagelist[0]}"
	id="${messagelist[1]}"
	args1="${messagelist[2]}"
	args2="${messagelist[3]}"
	echo "command: $cmd, id: $id, args: $args1, $args2"

 	#now that we have the id of the current client being run, we can access their pipe
	client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"

 	#command ("cmd") will be 1 of 4 things create/post/display/add
  	#when you attempt to do an operation, you gain the lock for that operation
	case "$cmd" in 
		"create")
		#acquire
		echo $(./acquire.sh c1)
  		#call the bash script needed and give it the correct arg, send result down client pipe
		./create.sh "$id" > $client_pipe
		#release
		echo $(./release.sh)
			;;
		"add")
		echo $(./acquire.sh)
		./add_friend.sh "$id" "$args1" > $client_pipe
		echo $(./release.sh)
			;;
		"post")
		echo $(./acquire.sh)
		./post_message.sh "$id" "$args1" "$args2" > $client_pipe
		echo $(./release.sh)
			;;
		"display")
		echo $(./acquire.sh)
		./display_wall.sh "$id" > $client_pipe
		echo $(./release.sh)
			;;
		*)
			echo "Accepted Commands: {create/add/post/display}" > $client_pipe
			;;
	esac
done

