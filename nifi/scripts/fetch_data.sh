#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide a timestamp as an argument."
    exit 1
fi

timestamp=$1

filename="./data/stackoverflow/questions-${timestamp}.json"
url="https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow"

curl -k --compressed -X GET $url -o $filename#!/bin/bash

