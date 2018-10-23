#!/bin/sh
GB_CSV="testdata/garbage.csv"
EM_CSV="testdata/employees.csv"

set IFS=,
set oldIFS = $IFS
readarray -t ARR < ${GB_CSV}

ARRY_ELEM=${#ARR[@]}
echo "We have ${ARRY_ELEM} rows in ${GB_CSV}"

INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]=$(echo $i | sed 's/ //g')
  echo "${ARR[$INC]}"
  INC=$[$INC+1]
done

INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]=$(echo $i | sed 's/.$//' | sed -e 's/.*/\U&/' )
  echo "${ARR[$INC]}"
  INC=$[$INC+1]
done

set IFS=,
set oldIFS = $IFS
readarray -t ARR < ${EM_CSV}

INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]=$(sed -e 's/^/#/' <<< $i )
  echo "${ARR[$INC]}"
  INC=$[$INC+1]
done


sed -i 's/Bob/Robert/' ${EM_CSV}
sed -i 's/^/#/' ${EM_CSV}
cat ${EM_CSV}


awk 'BEGIN { FS=","; OFS="," } {$5="";gsub(",+",",",$0)}1' OFS=, ${EM_CSV}
