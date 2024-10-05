#!/bin/bash
grep -l "sample" file* | xargs grep -o "CSC510" | uniq -c | cut -d: -f1 | grep -E -v "[0-2]\s+file" | sed 's/^ *//' | xargs -I {} sh -c 'count=$(echo "{}" | cut -d" " -f1); file_name=$(echo "{}" | cut -d" " -f2); size=$(ls -l "$file_name"); echo $count $size' | sort -k1,1nr -k6,6nr | gawk '{print $10}' | sed 's\file_\filtered_\'
