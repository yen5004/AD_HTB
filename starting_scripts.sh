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

