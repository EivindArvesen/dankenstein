#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Elon Musk" "$DIR"/musk.txt
python $DIR/helpers/getTweets.py elonmusk "$DIR"/musk2.txt
cat "$DIR"/musk2.txt >> "$DIR"/musk.txt
rm "$DIR"/musk2.txt
