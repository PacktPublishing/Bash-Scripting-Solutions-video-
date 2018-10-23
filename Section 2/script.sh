#!/bin/bash

VARIABLE="My test string"
# ${VARIABLE:startingPosition:optionalLength}
echo ${VARIABLE:3:4}
