#! /bin/bash

# create working subdirectory
mkdir Linux2TmpDirectory && cd ./Linux2TmpDirectory

# create five files
touch ./file{1..5}.txt

# execute init script
../Linux2_init.sh

# create user.job
touch user.job

# regexp for email searching
# don't start with number
# "." and "-" not in a row
# start with a letter
# has a correct structure: *@*.*
echo "find . -type f -name file\?.txt -exec grep -E '(^|[ (:])([a-zA-Z][a-zA-Z0-9]*([.-][a-zA-Z0-9]+)*@ \\
[0-9a-zA-Z]+(-?[0-9a-zA-Z])*(\.[a-z]{2,}(-[a-z0-9]{1,})?))(?=$|[ ):.])' {} + | \\
sed -E 's/^[^a-zA-Z]//; s/[^a-zA-Z0-9]$//' | \\
tr 'A-Z' 'a-z' > allemails.lst" > user.job

# execute job after one minuite using "at"
at -f user.job now + 1 minute

# write script for getting sorted list of unique email addresses -> allemails.lst
sleep 120
sort allemails.lst | uniq allemails.lst | cat allemails.lst

# remove working subdirectory (if necessary)
# cd .. && rm -rf ./Linux2TmpDirectory

# chmod +x ./Linux2.sh
# chmod +x ./Linux2_init.h
# ./Linux2.sh
