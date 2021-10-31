#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Kanye West" "$DIR"/kanye.txt
python "$DIR"/helpers/getTweets.py kanyewest "$DIR"/kanye2.txt
cat "$DIR"/kanye2.txt >> "$DIR"/kanye.txt
rm "$DIR"/kanye2.txt
