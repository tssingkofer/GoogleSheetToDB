#!/bin/bash
OLDIFS=$IFS

curl -L "https://docs.google.com/spreadsheets/export?id=1ruAmiMONHHg3VqpmuTL6p3L0Om-qS1nowBkxMx_nE3w&exportFormat=csv&gid=0" -o ./TestSheet

echo
echo
echo "use dash;" > ./insertSQL.sql

IFS=","
while read f1 f2 f3
do
      echo "insert into user (name, birthdate, sex) VALUES($f1,$f2,$f3);" >> ./insertSQL.sql
done < TestSheet
IFS=$OLDIFS
