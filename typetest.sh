#!/bin/bash

RR='a'
while read -N1 -p "$RR>" INPUT
do
	echo ""
	if [[ "$RR" == "$INPUT" ]]
	then
		RR=`strings /dev/urandom | tr -d '\r\t\n[:punct:][:upper:] ' | head -c1`
	elif [[ "$INPUT" == "Q" ]]
	then
		exit
	else
		continue
	fi
done
