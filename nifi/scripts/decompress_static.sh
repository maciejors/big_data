#!/bin/bash
filename="./data/datascience/datascience.stackexchange.com.7z"
output="./data/datascience/"
7z e $filename -o$output
# fix some files
posts_path="${output}Posts.xml"
posthistory_path="${output}PostHistory.xml"
xmllint --format $posts_path --output $posts_path
xmllint --format $posthistory_path --output $posthistory_path
