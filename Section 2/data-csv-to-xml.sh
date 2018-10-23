#!/bin/bash

source xml-parent.tpl
source word.tpl

OUTPUT_FILE="words.xml"
INPUT_FILE="words.csv"
DELIMITER=','

echo ${XML_HDR} > ${OUTPUT_FILE}
echo ${SRT_CONTR} >> ${OUTPUT_FILE}

echo ${ELM} | \
sed '{:q;N;s/\n/\\n/g;t q}'| \
awk \
'{ print "awk \x27 BEGIN{FS=\"'${DELIMITER}'\"}{print "$0"}\x27 '${INPUT_FILE}'"}' | \
 sh >> ${OUTPUT_FILE}

echo ${END_CONTR} >> ${OUTPUT_FILE}

cat ${OUTPUT_FILE}
