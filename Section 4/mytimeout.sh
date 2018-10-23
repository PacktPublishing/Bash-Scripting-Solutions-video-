#!/bin/bash

SUBPID=0

function func_timer() {
  trap "clean_up" SIGALRM
  sleep $1& wait
  kill -s SIGALRM $$
}

function clean_up() {
  trap - ALRM
  kill -s SIGALRM $SUBPID
  kill $! 2>/dev/null
}

func_timer $1& SUBPID=$!

shift

trap "clean_up" ALRM INT

"$@" & wait $!

kill -ALRM $SUBPID
wait $SUBPID
exit 0
