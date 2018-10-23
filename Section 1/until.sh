#!/bin/bash

CTR=1
until [ ${CTR} -gt 9 ]
do
    echo "CTR var: ${CTR}"
    ((CTR++))
done
echo "Finished"
