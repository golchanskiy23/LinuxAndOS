#! /bin/bash

# put email addresses and other information
for i in {1..5}; do
        {
                echo "(naVe$i@ya.ru)"
                echo " na-F.e$i@ya.ru"
                echo ":namW$i@Ya1.ya-2.ru"
                echo "$NOt@ya.ru"
                echo "no.-t$i@ya.ru"
                echo "#abc@cde$i.ef&"
                echo "randomTEXT$inotemail"
                echo "(another.VALID-email@sub.example-domain.org)"
                echo " -wrong..dots@some-domain.com"
                echo ":user-name@suBdoMain.domain.com"
        } > "file$i.txt"
done
