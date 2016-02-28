#!/bin/bash

RR="1*2="
ANS="2"

while read -p "$RR>" INPUT
do
	if [[ "$ANS" == "$INPUT" ]]
	then
		R1=`strings /dev/urandom| tr -d '\r\t\n[:punct:][:alpha:] ' | head -c2`
		R2=`strings /dev/urandom| tr -d '\r\t\n[:punct:][:alpha:] ' | head -c1`
		RR="$R1*$R2="
		ANS=`expr $R1 '*' $R2`
	else
		continue
	fi
done
