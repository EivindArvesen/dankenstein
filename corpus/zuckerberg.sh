#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Mark Zuckerberg" "$DIR"/zuckerberg.txt
curl https://raw.githubusercontent.com/Satyam19946/Zuckerbergtestimonyanalysis/master/mark.csv | tr -d '\r\n' | sed 's/\?"/\?"\'$'\n/g' | sed 's/\."/\."\'$'\n/g' | grep 'ZUCKERBERG' | sed 's/ZUCKERBERG\:\,\"//g' | awk '{$1=$1};1' | sed 's/"$//' >> "$DIR"/zuckerberg.txt
