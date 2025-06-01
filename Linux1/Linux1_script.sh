#! /bin/bash

# initialization
mkdir ./Linux1;
touch ./file{1..5}.txt;
touch ./file-hello{6..10}.txt;
echo "hello everyone" | tee -a $(ls *hello*);

# move all *.txt files to current directory
mv ./*.txt ./Linux1;

# find all files and paths which has "hello" word inside
sudo grep -r "hello" ./Linux1;

# remove files without execution last 100 days and output remove request
# Enter 'Y' if you wanna delete chosen files
touch -mt 199807081215 ./Linux1/file1.txt ./Linux1/file-hello7.txt;
find ./Linux1 -type f -mtime +100 -exec rm -i {} \;

# in home directory
rm -rf ./Linux1;

# add chmod +x Linux1_script.sh
# ./Linux1_script.sh
