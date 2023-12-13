#!/bin/bash

start_timestamp=$(date -d "January 1, 2023" + %s)

current_timestamp=$(date + %s)

interval = 21600

timestamp=$start_timestamp

while [ $timestamp -lt $current_timestamp ]; do
    filename="./data/stackoverflow/questions-${timestamp}.json"

    url="https://api.stackexchange.com/2.3/questions?todate=${timestamp}&order=desc&sort=creation&site=stackoverflow"
    
    curl -k --compressed -X GET $url -o $filename
    
    timestamp=$((timestamp + interval))
