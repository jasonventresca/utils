#!/bin/sh

file1=dev
file2=prod
output_file=diffed.txt
domain1='http://184.72.182.38:8080'
domain2='http://projoptads.com'
route='index.php/turk/first_round_task/cbaaa358c6047d55596674ea70428e2a/0/300x250/4562005/4561898/4561990/4561923/4562000/4562011/4562008/4561997/4561996/4562015/4562029/4562024/4562028/4562009/4561896/4562012/4561994/4562007/4561998/4562017/4561992/4561926/4562010/4561991/4562013/4562002/4561995/4561986?assignmentId=27UQ45UUKQOYSMC3BJJ8TG03JWZDVO&hitId=2GZHRRLFQ0ONZULOBG8OEEGSUL3QHM&workerId=AAX6OCPZIF9X5&turkSubmitTo=https%3A%2F%2Fwww.mturk.com#'

curl -k -m 5 -o $file1 $domain1/$route || echo "curl $file1 timed out"
curl -k -m 5 -o $file2 $domain2/$route || echo "curl $file2 timed out"

if [ ! -d orig ]; then
    mkdir orig
fi

cp $file1 $file2 orig

# delete all whitespace-only lines
sed -i '/^[ \t]*$/d' $file1
sed -i '/^[ \t]*$/d' $file2

# replace all multi-space segments with a single space
sed -i 's/ \{2,\}/ /g' $file1
sed -i 's/ \{2,\}/ /g' $file2

diff -buw $file1 $file2 > $output_file
echo "diffed output written to $output_file"

