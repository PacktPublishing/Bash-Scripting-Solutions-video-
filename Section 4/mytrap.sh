#!/bin/bash

function setup() {
  trap "cleanup" SIGINT SIGTERM
  echo "PID of script is $$"
}

function cleanup() {
  echo "cleaning up"
  exit 1
}

setup

while :
do
  sleep 1
done
