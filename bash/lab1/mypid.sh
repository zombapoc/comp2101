#!/bin/bash
#
# Display my process ID
# source in front, run it in my current shell, this is needed for variables
# allows you to put a script with definitions, setup stuff, to include in another
# script. everything run in the first is run in the second. Separates and compartmentalizes

echo $$
