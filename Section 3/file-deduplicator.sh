#!/bin/bash

declare -a FILE_ARRAY=()

function add_file() {

  local NUM_OR_ELEMENTS=${#FILE_ARRAY[@]}
  FILE_ARRAY[$NUM_OR_ELEMENTS+1]=$1
}

function del_file() {
  rm "$1" 2>/dev/null
}

function srch_file() {
  local NEW="$1"
  local SUM="0"
  if [ -f $NEW ] && [ ${#FILE_ARRAY[@]} -eq 0 ]; then

    echo $(sha512sum ${NEW} | awk -F' ' '{print $1}')
    return
  fi

  for ELEMENT in ${FILE_ARRAY[@]}
  do
    SUM=$(sha512sum ${NEW} | awk -F' ' '{print $1}')
    if [ "${SUM}" == "${ELEMENT}" ]; then

      return "1"
    else

      continue
    fi
  done


  echo "${SUM}"
}

function begin_search_and_deduplication() {

  local DIR_TO_SRCH="$1"

  for FILE in ${DIR_TO_SRCH}/*
  do

    RET=$(srch_file ${FILE})

    if [[ "${RET}" == "" ]]; then
      del_file $FILE
      continue
    elif [[ "${RET}" == "0" ]]; then

      continue
    elif [[ "${RET}" == "1" ]]; then
      continue
    else

      add_file "${RET}" "${FILE}"
      continue
    fi
  done
}

function dump_array() {
  local ARR=$1
  local SIZE=${#FILE_ARRAY[@]}


  for (( i=1; i <= ${SIZE}; i++ ));
  do
    echo "#$i " ${FILE_ARRAY[$i]}
  done
}


echo "Enter directory name to being searching and deduplicating:"
echo "Press [ENTER] when ready"
echo
read DIR

begin_search_and_deduplication "${DIR}"
dump_array
