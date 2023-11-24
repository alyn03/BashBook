#!/bin/bash

client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"
server_pipe="/home/ranya/Desktop/Users/Pipes/server"

#check if server pipe exists, otherwise create using mkfifo
if [ ! -e "$server_pipe" ]; then
	mkfifo "$server_pipe"
fi

while true; do
	echo "Server side"

	temp=$(cat "$server_pipe")
	

	IFS=' ' #setting space as delimiter   (internal field separator)
	read -ra messagelist <<<"$temp" #reading str as an array as tokens separated by IFS  
  
	cmd="${messagelist[0]}"
	id="${messagelist[1]}"
	args="${messagelist[2]}"
	echo "command: $cmd, id: $id, args: $args"

	
	case "$cmd" in 
		"create")
		#acquire
		#echo $(./acquire.sh c1)
		echo "create"
		./create.sh $id
		#echo "$res" > $client_pipe
		#./create.sh "$id" > $client_pipe
		test=$(<$client_pipe)
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

