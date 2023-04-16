#!/bin/bash

RR="1+2="
ANS=3

while read -p "$RR" INPUT
do
	if [[ "$ANS" == "$INPUT" ]]
	then
		R1=$( shuf -n 1 99.txt )
		R2=$( shuf -n 1 19.txt )
		RR="$R1+$R2="
		ANS=$(( $R1 + $R2 ))
	else
		continue
	fi
done
