#!/bin/bash

RR="1 * 3 + 4 / 2"
ANS="5"
COUNT=0
CORRECT=0
while read -p "${RR}=" INPUT
do
	COUNT=$(( "${COUNT}" + 1 ))
	if [[ "${ANS}" == "${INPUT}" ]]
	then
		CORRECT=$(( "${CORRECT}" + 1 ))
		R1=$( shuf -n 1 19.txt )
		EX=$( shuf -n 1 555.txt )
		EX1=$( echo "${EX}" |cut -d' ' -f1 )
		EX2=$( echo "${EX}" |cut -d' ' -f2 )
		EX3=$( echo "${EX}" |cut -d' ' -f3 )
		if [[ "${EX1}" == "/" ]]
		then
			R2=$( grep "^${R1} " slash.txt | shuf -n 1 | cut -d' ' -f3 )
		else
			R2=$( shuf -n 1 19.txt )
		fi
		if [[ "${EX2}" == "/" ]]
		then
			R3=$( grep "^${R2} " slash.txt | shuf -n 1 | cut -d' ' -f3 )
		else
			R3=$( shuf -n 1 19.txt )
		fi
		if [[ "${EX3}" == "/" ]]
		then
			R4=$( grep "^${R3} " slash.txt | shuf -n 1 | cut -d' ' -f3 )
		else
			R4=$( shuf -n 1 19.txt )
		fi
		RR="${R1} ${EX1} ${R2} ${EX2} ${R3} ${EX3} ${R4}"
		ANS=$(( "${R1}" "${EX1}" "${R2}" "${EX2}" "${R3}" "${EX3}" "${R4}" ))
	else
		continue
	fi
done
echo ''
echo "${CORRECT} correct in ${COUNT}"
