#!/bin/bash

grep -l "sample" file* | xargs grep -o "CSC510" | uniq -c | cut -d: -f1 | grep -E -v "[0-2]\s+file" | sed 's/^ *//' | gawk '{count=$1;file=$2;"ls -l " file | getline size; print count, size}' | sort -k1,1nr -k6,6nr | awk '{print $10}' | sed 's/file_/filtered_/'
