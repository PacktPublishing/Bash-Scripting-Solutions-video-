#!/bin/bash

source library.sh
FNAME="my_test_file.txt"
create_file "${FNAME}"
delete_file "${FNAME}"

exit 0
