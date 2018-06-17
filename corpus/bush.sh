#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

curl --cookie-jar cookies.txt -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" -L "http://www.thegrammarlab.com/?nor-portfolio=corpus-of-presidential-speeches-cops-and-a-clintontrump-corpus"
curl -b cookies.txt -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" -L "http://www.thegrammarlab.com/?wpdmpro=corpus-of-presidential-speeches&wpdmdl=595" --output presidential.zip
rm cookies.txt
unzip presidential.zip
rm presidential.zip

cat Corpus\ of\ Presential\ Speeches/gwbush/*.txt | sed "s/<[^>]*>//g" > bush.txt

rm -rf Corpus\ of\ Presential\ Speeches
cd -
