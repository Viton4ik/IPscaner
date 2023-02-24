#!/bin/bash

# print a message
echo "What do you want to scan: subnet/ip"
read use

# if subnet is chosen
if [ "$use" = "subnet" ]; then

# waiting for if subnet is entered, for example: 192.168.0.1/24
echo "Enter subnet:"
read subnet

# waiting for if port is entered, for example: 22
echo "Enter port:"
read port

# scan ports using '-nmap -p'; '-sT' - scan TCP-ports only; '-oG res' - create a file with a result
nmap -p $port -sT $subnet -oG res 

# cat res - open the file; |grep open - filter the result by 'open'; >result - put results in a file 'result'
cat res |grep open >result
cat result

# if ip is chosen
else
echo "Enter IP:"
read IP

# -PE - ping, -oN - put results in a file 'resultip'
nmap -PE $IP -oN resultip

# print the result
cat resultip

# finalizing the cycle
fi
