#!/bin/bash
INPUT_FILE="words.xml"
OUTPUT_FILE="words.json"

xml2json < ${INPUT_FILE} ${OUTPUT_FILE}
