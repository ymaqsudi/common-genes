#!/bin/bash

# extract the description column and omit the column name
myfilelist="$(ls *.csv)"

myarray=( $myfilelist )

for i in ${myarray[@]}
do
	cat $i |awk -F, '{print $7}' | sort -n | uniq >> master.txt

done
# sort and delete duplicates and sent to master file
cat master.txt |grep -vi description |sort |uniq -c |awk '$1 >= 2 {print $0}' | sort -k1 > results.txt
dos2unix results.txt; rm -f master.txt


# extract duplicate extries
