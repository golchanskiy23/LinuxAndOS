#!/bin/bash

# create tmp directory
mkdir ./Linux3TmpDirectory && cd ./Linux3TmpDirectory

# choose existing dates between given
# 1.1 task
echo -e "2012-09-18 12:10\n2012-09-32 12:30\n2013-09-09 09:09" > task1.txt
start=$(date -d "1000-01-01 00:00" +%s)
end=$(date -d "2012-12-31 23:59" +%s)
i=0
> task1ans.txt

while read -r line; do
	curr=$(date -d "$line" +%s)
	if [ "$curr" -ge "$start" ] && [ "$curr" -le "$end" ]; then
		echo -e "Iteration num $i is correct\n " >> task1ans.txt
	else
		echo -e "Iteration num $i is failed\n" >> task1ans.txt
	fi
	((i++))
done < task1.txt

# 1.2 task
grep -E '^((1[0-9]{3})|(20[0-1][0-2]))-((0[0-9])|(1[0-2]))-(([0-2][0-9])|(30)) ((([0-1][0-9])|(2[0-3])):[0-5][0-9])$' task1.txt >> task1ans.txt
cat task1ans.txt

# 2 task
touch task2.txt
echo -e '*this is italic*"\n**bold text (not italic)**' > task2.txt
sed -r 's/^\*([^*]+)\*"?$/<em>\1<\/em>/' task2.txt

# 3 task
echo -e "abcdefgh ijk\nabbc\nb a c\n a b c" > task3.txt
awk '{cleaned=$0; gsub(/ /,"",cleaned); cmd= "echo \"" cleaned "\" | fold -w1 | sort | uniq | paste -sd \"\" -"; cmd | getline sorted; close(cleaned); if(cleaned==sorted){print cleaned " is Correct string" > "task3output.txt"}else{print cleaned " is Incorrect string" > "task3output.txt"} }' task3.txt && cat task3output.txt

# 4 task
echo -e "Extra      spaces\nSentence.    Sentence." > task4.txt
sed -r 's/[ \t]+/ /g;s/([.?!])+[ ]+/\1  /g' task4.txt > task4output.txt
cat task4output.txt
