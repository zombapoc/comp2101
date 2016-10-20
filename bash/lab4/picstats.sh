#!/bin/bash
#
# displays how many regular files there are in the Pictures directory
# and how much disk space they use. It should also show the sizes
# and names of the 3 largest files

### Variables
directory=~/Pictures # default place in home, don't know what user, so use ~
countFilesToShow=3 # defaults to 3

### Functions
function usage {
    echo "Usage: $0 [-h|--help] [-c|--count countFilesToShow] [directoryToWorkOn]"
    echo "Count defaults to 3, Directory to defaults to ~/Pictures"
}

function error-message {
    echo "$@" >&2
}

### Command Line Processing 
# Help options
gotaDirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | -- help ) # show usage diagram,  if match this then
        usage
        exit 0
        ;; # if not, then count of files
    -c | --count ) # how many big files to display
        if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
            countFilesToShow=$2
            shift
        else
            error-message "Count requires a number, dumb dumb"
            exit 1
        ;; # also want dir names
    * ) # something not one of above, is directory name, in this case, we're just working on one
    # if no dir from cmdline, surely this one is it
        if [ $gotaDirectory = "no" ]; then
            directory=$1
            gotaDirectory="yes"
    # otherwise, this is some kind of cmdline junk we want to yell at user for
        else
            error-message "I don't know what '$1' is a directory, I already have $directory"
            exit 1
        ;;
    esac

### Main
echo -n "In the ~/Pictures directory, the number of files is "
find $directory -type f |wc -l

echo -n "Those files use "
du -sh $directory |awk '{print $1}' # s is summary for all dirs

echo "The $countFilesToShow largest files are:"
echo "========================"
du -h $directory/* |sort -h |tail -$countFilesToShow
