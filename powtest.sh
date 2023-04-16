#!/bin/bash

RR="1*2="
ANS="2"
COUNT=0
CORRECT=0

while read -p "$RR" INPUT
do
	COUNT=$(( "${COUNT}" + 1 ))
	if [[ "$ANS" == "$INPUT" ]]
	then
		CORRECT=$(( "${CORRECT}" + 1 ))
		R1=$( shuf -n 1 99.txt )
		R2=$( shuf -n 1 19.txt )
		RR="$R1*$R2="
		ANS=$(( "${R1}" * "${R2}" ))
	else
		continue
	fi
done
echo ''
echo "${CORRECT} correct in ${COUNT}"
