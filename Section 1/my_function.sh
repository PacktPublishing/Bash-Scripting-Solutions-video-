#!/bin/bash

function my_function() {
    local PARAM_1="$1"
    local PARAM_2="$2"
    local PARAM_3="$3"
    echo "${PARAM_1} ${PARAM_2} ${PARAM_3}"
}
my_function "a" "b" "c"
