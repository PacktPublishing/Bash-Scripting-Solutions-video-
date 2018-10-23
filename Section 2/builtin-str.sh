#!/bin/bash

STR="1234567890asdfghjkl"

echo "first character ${STR:0:1}"
echo "first three characters ${STR:0:3}"

echo "third character onwards ${STR: 3}"
echo "forth to sixth character ${STR: 3: 3}"

echo "last character ${STR: -1}"


STR2="abc"
STR3="bcd"
STR4="Bcd"

if [[ $STR2 < $STR3 ]]; then
 echo "STR2 is less than STR3"
else
 echo "STR3 is greater than STR2"
fi

if [[ $STR3 < $STR4 ]]; then
 echo "STR3 is less than STR4"
else
 echo "STR4 is greater than STR3"
fi
