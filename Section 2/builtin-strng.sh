#!/bin/bash

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
  res="${i//[^ ]}"
  TMP_CNT="${#res}"
  while [ ${TMP_CNT} -gt 0 ]; do
    i=${i/, /,}
    TMP_CNT=$[$TMP_CNT-1]
  done
  ARR[$INC]=$i
  INC=$[$INC+1]
done


INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]=${i::-1}
  INC=$[$INC+1]
done


INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]=${i^^}
  printf "%s" "${ARR[$INC]}"
  INC=$[$INC+1]
  echo
done


set IFS=,
set oldIFS = $IFS
readarray -t ARR < ${EM_CSV}

ARRY_ELEM=${#ARR[@]}

echo;echo "We have ${ARRY_ELEM} rows in ${EM_CSV}"

INC=0
for i in "${ARR[@]}"
do
   :
  ARR[$INC]="#${i}"
  printf "%s" "${ARR[$INC]}"
  INC=$[$INC+1]
  echo
done


echo
echo "Let's make Bob, Robert!"
INC=0
for i in "${ARR[@]}"
do
   :

  ARR[$INC]=${i/Bob/Robert}
  printf "%s" "${ARR[$INC]}"
  INC=$[$INC+1]
  echo
done


echo;echo "Lets remove the column: birthday (1-31)"
INC=0
COLUM_TO_REM=4
for i in "${ARR[@]}"
do
   :

  TMP_CNT=0
  STR=""
  IFS=',' read -ra ELEM_ARR <<< "$i"
  for field in "${ELEM_ARR[@]}"; do

    if [ $TMP_CNT -ne 0 ] && [ $TMP_CNT -ne $COLUM_TO_REM ]; then
      STR="${STR},${field}"
    elif [ $TMP_CNT -eq 0 ]; then
      STR="${STR}${field}"
    fi
    TMP_CNT=$[$TMP_CNT+1]
  done

  ARR[$INC]=$STR
  echo "${ARR[$INC]}"
  INC=$[$INC+1]
done
