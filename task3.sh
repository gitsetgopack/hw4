#!/bin/bash

sed 's/^,/NULL,/; :a;s/,,/,NULL,/g;ta' titanic.csv > updated_titanic.csv 

gawk -F',' '$13 ~ /S\s*$/ && $3 == 2 { print }' updated_titanic.csv | sed 's/male/M/g; s/female/F/g' | awk -F',' '$7 != "NULL" { sum += $7; count++ } END { if (count > 0) print sum / count;}'