#!/bin/bash

function create_file() {
    local FNAME=$1
    touch "${FNAME}"
    ls "${FNAME}"
}

function delete_file() {
    local FNAME=$1
    rm "${FNAME}"
    ls "${FNAME}"
}
