#!/bin/bash

# this script is how to update git commands

#this would be better than blindly using $1
#should at least be checking is $1 has anything in it
#read -p "Update message? " message

git add -A
git commit -m "$1"
git push
