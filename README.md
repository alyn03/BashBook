# "BashBook" - A Command Line Social Media Simulator

## Overview
This program is a cmd line social media-like platform through bash scripting.
This is our project for CT213.
Coded by Ashlyn Buckley and Ranya Praxmarer 

## Purpose
This project aims to create a rudimentary version of a Facebook-like social media platform that we can run on terminal. 

The program will allow you to: 
- Create "users"
- Add "users" (friends.txt)
- Post messages to someone's "wall" (wall.txt)
- Display your own "wall"

Named pipes are implemented to simulate requests being sent and we also incorporate a locking strategy in order to limit synchronisation issues and bolster the integrity of the operations.

## Instructions
Download all bash scripts and place them in one directory altogether.
Friendly reminder, you will need to alter the pathways to run it on your own computer.

Create a sub-directory called "Users", our code will check for this pathway before doing any operations. If it's not found, it will manually create it for you. Mind you, you still need to alter the pathway.

Then, open your terminal.
First modify the user access by typing "chmod 755 /`filename`".
Then you may start a client-end terminal and a server-end terminal.
You can do this by opening 2 separate terminal windows and calling ./client.sh `User` and ./server.sh respectively.

Then, on client-side you can ask it to do one of the specified operations in the project instructions, create/add/post/display.
This should be reflected on the server-side window through the implemented pipes between these two sides.

Finally, you should get a response on client-side.


