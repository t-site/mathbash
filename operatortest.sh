#!/bin/bash

RR="1 ? 2 = 3 ?=="
ANS="+"
OPERATOR='+
-
*
/'
COUNT=0
CORRECT=0

while read -p "$RR" INPUT
do
	COUNT=$(( "${COUNT}" + 1 ))
	if [[ "$ANS" == "$INPUT" ]]
	then
		CORRECT=$(( "${CORRECT}" + 1 ))
		ANS=$( echo "${OPERATOR}" | shuf -n 1 )
		R2=$( shuf -n 1 29.txt )
		if [[ "${ANS}" == "/" ]]
		then
			RX=$( shuf -n 1 29.txt )
			R1=$(( "${R2}" * "${RX}" ))
		else
			R1=$( shuf -n 1 99.txt )
		fi
		NUM=$(( "${R1}" "${ANS}" "${R2}" ))
		RR="${R1} ? ${R2} = ${NUM}  ?=="
	else
		continue
	fi
done
echo ''
echo "${CORRECT} correct in ${COUNT}"
