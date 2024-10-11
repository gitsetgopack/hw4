#!/bin/bash

sed 's/,,/,NULL,/g' titanic.csv | gawk -F',' '$13 ~ /S\s*$/ && $3 == 2' | sed 's/female/F/g; s/male/M/g' | tee /dev/tty | awk -F',' '$7 != "NULL" { sum += $7; count++ } END { if (count > 0) print "Average age: " sum / count;}'
