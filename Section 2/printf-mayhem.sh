#!/bin/bash
export LC_NUMERIC="en_US.UTF-8"
printf "This is the same as echo -e with a new line (\\\n)\n"

DECIMAL=10.0
FLOAT=3.333333
FLOAT2=6.6666

printf "%s %.2f\n\n" "This is two decimal places: " ${DECIMAL}

printf "shall we align: \n\n %.3f %-.6f\n" ${FLOAT} ${FLOAT2}
printf " %10f %-6f\n" ${FLOAT} ${FLOAT2}
printf " %-10f %-6f\n" ${FLOAT} ${FLOAT2}

printf '%.0s-' {1..20}; printf "\n"

STR="No place like home!"
CNT=$(wc -c <<< $STR})
TMP_CNT=0

printf "Char Hex\n"

while [ ${TMP_CNT} -lt $[${CNT} -1] ]; do
  printf "%-5s 0x%-2X\n" "${STR:$TMP_CNT:1}" "'${STR:$TMP_CNT:1}"
  TMP_CNT=$[$TMP_CNT+1]
done
