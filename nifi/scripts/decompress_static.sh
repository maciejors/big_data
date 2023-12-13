#!/bin/bash
filename="./data/datascience/datascience.stackexchange.com.7z"
output="./data/datascience/"
7z e $filename -o$output
# fix some files
posts_path="${output}Posts.xml"
posthistory_path="${output}PostHistory.xml"
echo "Fixing large XMLs structures..."
xmllint --format $posts_path --output $posts_path
xmllint --format $posthistory_path --output $posthistory_path
echo "Done."
# split large files
echo "Splitting large XML files..."
python3 ./nifi/scripts/split_large_xmls.py
echo "Done."
echo "Cleanup..."
rm ${output}/Posts.xml
rm ${output}/PostHistory.xml
rm ${output}/Users.xml
echo "Done."
echo "Exiting script."
