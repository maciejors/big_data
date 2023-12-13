#!/bin/bash

start_timestamp=$(date -d "November 1, 2023" +%s)

current_timestamp=$(date +%s)

interval=21600

timestamp=$start_timestamp

i=0
while [ $i -lt 300 ]; do
    filename="./data/stackoverflow/questions-${timestamp}.json"

    url="https://api.stackexchange.com/2.3/questions?todate=${timestamp}&order=desc&sort=creation&site=stackoverflow"
    
    curl -k --compressed -X GET $url -o $filename
    
    timestamp=$((timestamp + interval))
    i=$((i + 1))
done
