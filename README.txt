We have provided all of our bash scripts in the zip file.
Download all of these and place them in one directory altogether.
You will need to alter the pathways of our code if you wish to run it on your own computer.

You will need to create a sub-directory called "Users", our code will check for this pathway before doing any operations. If it's not found, it will manually create it for you. Mind you, you still need to alter the pathway.

Then, open your terminal.
First modify the user access by typing "chmod 755 /filename".
Then you may start a client-end terminal and a server-end terminal.
You can do this by opening 2 separate terminal windows and calling ./client.sh [User] and ./server.sh respectively.

Then, on client-side you can ask it to do one of the specified operations in the project instructions, create/add/post/display.
This should be reflected on the server-side window as we have implemented pipes between these two sides.

Finally, you should get a response on client-side.