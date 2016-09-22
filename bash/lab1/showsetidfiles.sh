#!/bin/bash
#
# show userid in /usr

# below first find is a HERE file, relies on cat above, 

# dash is for at least, without means exact


echo "SetUID files" # tells you what is going on
echo "------------"

find /usr -type f -executable -perm -4000 -ls

cat <<EOF


SetGID files
------------
EOF
find /usr -type f -executable -perm -2000 -ls
