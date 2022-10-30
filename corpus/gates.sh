#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getTweets.py BillGates "$DIR"/GatesTweets.txt
python "$DIR"/helpers/getWikiQuotes.py "Bill Gates" "$DIR"/GatesQuotes.txt

cat "$DIR"/GatesTweets.txt "$DIR"/GatesQuotes.txt > "$DIR"/Gates.txt
rm "$DIR"/GatesTweets.txt "$DIR"/GatesQuotes.txt
