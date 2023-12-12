#!/bin/bash

if [ $# -eq 0 ]; then
    timestamp=$(date +%s)
else
    timestamp=$1
fi

filename="./data/stackoverflow/questions-${timestamp}.json"
url="https://api.stackexchange.com/2.3/questions?todate=${timestamp}&order=desc&sort=creation&site=stackoverflow"
echo $url
curl -k --compressed -X GET $url -o $filename

