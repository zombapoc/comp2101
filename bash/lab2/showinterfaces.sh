#!/bin/bash

# Create an array using the output of ifconfig which has the names 
# of the network interfaces in it. Use those names to extract the ip 
# addresses of the interfaces, also using ifconfig output. Also parse 
# the output of route -n to display the ip address of the default gateway. 
# Name this script showinterfaces.sh.

interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

echo "Interface names found: ${interfacenames[@]}"
ips=(`ifconfig ${interfacenames[0]} | grep 'inet addr'|sed -e 's/ *inet addr://'| sed -e 's/ .*//'` `ifconfig ${interfacenames[1]} | grep 'inet addr'|sed -e 's/ *inet addr://'| sed -e 's/ .*//'`)
cat <<EOF
Interfaces ${interfacenames[0]} has address ${ips[0]}
Interfaces ${interfacenames[1]} has address ${ips[1]}

My default gateway is $gatewayip # take it from route -n
EOF