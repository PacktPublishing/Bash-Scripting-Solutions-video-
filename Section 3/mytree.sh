#!/bin/bash
CURRENT_LVL=0

function tab_creator() {

  local X=0
  local LVL=$1
  local TABS="."
  while [ $X -lt $LVL ]
  do

    TABS="${TABS}${TABS}"
    X=$[$X+1]
  done
  echo -en "$TABS"
}
function recursive_tree() {

  local ENTRY=$1
  for LEAF in ${ENTRY}/*
  do
    if [ -d $LEAF ];then

      TABS=$(tab_creator $CURRENT_LVL)
      printf "%s\_ %s\n" "$TABS" "$LEAF"
      CURRENT_LVL=$(( CURRENT_LVL + 1 ))
      recursive_tree $LEAF $CURRENT_LVL
      CURRENT_LVL=$(( CURRENT_LVL - 1 ))
    elif [ -f $LEAF ];then


      TABS=$(tab_creator $CURRENT_LVL)
      printf "%s|_%s\n" "$TABS" "$LEAF"
      continue
    fi

  done
}

PARENTDIR=$1
recursive_tree $PARENTDIR 1
