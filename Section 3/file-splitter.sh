#!/bin/bash
FNAME=""
LEN=10
TYPE="line"
OPT_ERROR=0
set -f

function determine_type_of_file() {
  local FILE="$1"
  file -b "${FILE}" | grep "ASCII text" > /dev/null
  RES=$?
  if [ $RES -eq 0 ]; then
    echo "ASCII file - continuing"

  else
    echo "Not an ASCII file, perhaps it is Binary?"
  fi
}

function write_to_file() {
  local B_FNAME="$1"
  echo -en "${BUFFER}" > "${B_FNAME}.${F_CNT}"
  echo "Wrote buffer to file: ${B_FNAME}.${F_CNT}"
}

function read_and_split_by_line() {
  local B_FNAME="$1"
  local L_CNT=0
  local F_CNT=0
  local BUFFER=""

  while IFS= read -r LINE;
  do
    BUFFER+="${LINE}\n"
    L_CNT=$((L_CNT+1))

    if [ ${L_CNT} -eq ${LEN} ]; then
      F_CNT=$((F_CNT+1))
      write_to_file "${B_FNAME}" ${F_CNT} "${BUFFER}"
      L_CNT=0
      BUFFER=""
    fi
  done < ${B_FNAME}

  if [ "${BUFFER}" != "" ]; then
    F_CNT=$((F_CNT+1))
    write_to_file "${B_FNAME}" ${F_CNT} "${BUFFER}"
  fi
}

function read_and_write_by_size() {
  local B_FNAME="$1"
  local L_CNT=0
  local F_CNT=0
  local BUFFER=""
  PAGESIZE=$(getconf PAGESIZE)

  while IFS= read -n ${PAGESIZE} LINE;
  do
    BUFFER+="${LINE}"
    L_CNT=$((L_CNT+1))

    if [ $L_CNT -eq ${LEN} ]; then
      F_CNT=$((F_CNT+1))
      write_to_file "${B_FNAME}" ${F_CNT} "${BUFFER}"
      L_CNT=0
      BUFFER=""
    fi
  done < ${B_FNAME}

  if [ "${BUFFER}" != "" ]; then
    F_CNT=$((F_CNT+1))
    write_to_file "${B_FNAME}" ${F_CNT} "${BUFFER}"
  fi
}

while getopts ":i:l:t:" opt; do
  case $opt in
  i)
    FNAME="$OPTARG"
    if [ ! -e $FNAME ] && [ ! -f $FNAME ]; then
      echo "ERROR: Input file parameter does not exit, or is not a file"
      OPT_ERROR+=1
    fi
    ;;
  t)
    TYPE="$OPTARG"
    if [[ "${TYPE}" != "line" && "${TYPE}" != "size" ]]; then
      echo "ERROR: -t must be set to line or size"
      OPT_ERROR+=1
    fi
    ;;
  l)
    LEN="$OPTARG"
    if [ $LEN -le 0 ]; then
      echo "ERROR: -l must be greater than 0"
      OPT_ERROR+=1
    fi
    ;;
  \?)
  echo "Invalid option: -$OPTARG" >&2
    OPT_ERROR+=1
    ;;
  :)
    echo "Option -$OPTARG requires an argument." >&2
    OPT_ERROR+=1
    ;;
  esac
done

if [ "${FNAME}" == "" ]; then
  echo "ERROR: -i input parameter required; filename "
  OPT_ERROR+=1
fi

if [ ${OPT_ERROR} -ne 0 ]; then
  exit 1
fi

determine_type_of_file "${FNAME}"

if [ "${TYPE}" == "size" ]; then
  read_and_write_by_size "${FNAME}"
else
  read_and_split_by_line "${FNAME}"
fi

exit 0
