#!/bin/bash

# This script prints out a welcome mesage using variables and command substitution

export MYNAME="Mike DeBiasio"
mytitle="The Great"

planet=`hostname`
weekday=$(date +%A)

echo "Weclome to planet $planet, $mytitle $MYNAME!"
echo "Today is $weekday."