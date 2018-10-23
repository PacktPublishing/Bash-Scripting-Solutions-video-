#!/bin/bash
EXIT_PLEASE=0
while :
do
   echo "Pres CTRL+C to stop..."
   sleep 1
   if [ $EXIT_PLEASE != 0 ]; then
      break
    fi
done
exit 0
