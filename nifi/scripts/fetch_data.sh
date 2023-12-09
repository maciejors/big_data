#!/bin/bash

timestamp=$(date +%s)
filename="./data/stackoverflow/questiondddddds.json"
url="https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow"

curl -k --compressed -X GET $url -o $filename
