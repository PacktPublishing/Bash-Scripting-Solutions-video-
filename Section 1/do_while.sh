#!/bin/bash

CTR=1
while [ ${CTR} -lt 9 ]
do
    echo "CTR var: ${CTR}"
    ((CTR++))
done
echo "Finished"
