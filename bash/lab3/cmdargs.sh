#!/bin/bash

# loop through the command line arguments
while [ $# -gt 0 ]; do

	# display each argument on its own line
	echo "$1"

	# each time through the loop, shift the arugments left
	# this decrements the arguemnt count for us
	shift
done

