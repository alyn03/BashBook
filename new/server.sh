#!/bin/bash

#initialising our named pipes
client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"
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
	args="${messagelist[2]}"
	echo "command: $cmd, id: $id, args: $args"

	#command ("cmd") will be 1 of 4 things create/post/display/add
	case "$cmd" in 
		"create")
		#acquire
		#echo $(./acquire.sh c1)
		echo "create"
  		#calling the bash script create.sh with the needed parameters
		./create.sh $id
		#echo "$res" > $client_pipe
		#./create.sh "$id" > $client_pipe
		test=$(<$client_pipe) #assigning the values in the client pipe to a temporary variable "test"
		echo "test: $test"
		exit
		#release
		#echo $(./release.sh)
			;;
		"add")
		#echo $(./acquire.sh)
		./add_friend.sh "$id" "$args" > $client_pipe
		#echo $(./release.sh)
			;;
		"post")
		#echo $(./acquire.sh)
		./post_message.sh "$id" "$arg1" "$arg2" > $client_pipe
		#echo $(./release.sh)
			;;
		"display")
		#echo $(./acquire.sh)
		./display_wall.sh "$id" > $client_pipe
		#echo $(./release.sh)
			;;
		*)
			echo "Accepted Commands: {create/add/post/display}" > $client_pipe
			;;
	esac
done

