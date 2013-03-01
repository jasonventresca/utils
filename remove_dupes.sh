#!/bin/sh
# @brief:  toggle between two versions of a file (suffixed with .$extension_A and.$extension_B)
# @usage:  ./remove_dupes.sh input_file output_file
set -eux

input_file=$1
output_file=$2

sort $input_file | uniq -d > $output_file && sort $input_file | uniq -u >> $output_file

