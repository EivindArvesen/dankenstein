#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getTweets.py RealAlexJones "$DIR"/jonesTweets.txt
python "$DIR"/helpers/getWikiQuotes.py "Alex Jones" "$DIR"/jonesQuotes.txt

cat "$DIR"/jonesTweets.txt "$DIR"/jonesQuotes.txt > "$DIR"/jones.txt
rm "$DIR"/jonesTweets.txt "$DIR"/jonesQuotes.txt
