#!/bin/sh
### takes a grep pattern as the first argument,
### finds files in the current working directory matching the pattern,
### and sorts them chronologically ascending
set -eu

pattern=$1 # HINT: you can supply switches to grep with an arg in quotes like:
           # $ sh sort_files_chrono.sh '-i ensure'

ls -lh | grep $pattern | awk '{print $6, $7, $8;}' | sort

