#! /bin/sh

#mkdir Linux4TmpDirectory
cd ./Linux4TmpDirectory

# task 1
printf "Bat\nGoat\nApple\nDog\nFirst\nEat\nHide" | tee task1.txt task3.txt
find . -type f -name task1.txt \
-exec grep -E '^[A-Z][b-z]*a.*' {} + | sort -r -k 1

# task 2
# ls -y >> logfile 2>&1
# ls -y - такого флага для этой команды не существует, поэтому вывод
# будет отправлен в поток ошибок
# >> logfile - перенаправляет вывод в конец logfile
# 2>&1 - перенаправляет поток вывода и поток ошибок в одно место
# данная команда перенаправит вывод ошибки в logfile

# task 3
read -p "Старт строки: " START;
read -p "Число строк: " NUM;
tail -n +"$START" task3.txt | head -n $((START+NUM-1)) \
> task3output.txt
cat task3output.txt

# task 4
touch task4.txt && echo "Something info" > rask4.txt
ls task4.txt task444.txt 2> tmp.txt
nl tmp.txt > task4errors.txt
rm tmp.txt
cat task4errors.txt

# cd .. && rm -rf Linux4TmpDirectory
# chmod +x Linux4.sh
# ./Linux4.sh
