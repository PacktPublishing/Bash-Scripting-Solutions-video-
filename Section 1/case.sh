#!/bin/bash

VAR=10
case $VAR in
  1)
    echo "1"
    ;;
  2)
    echo "2"
    ;;
  *)
    echo "What is this var?"
    exit 1
esac
