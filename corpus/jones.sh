#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getArtistCatalog.py RealAlexJones "$DIR"/jonesTweets.txt
python "$DIR"/helpers/getArtistCatalog.py "Alex Jones" "$DIR"/jonesQuotes.txt

cat "$DIR"/jonesTweets.txt "$DIR"/jonesQuotes.txt > "$DIR"/jones.txt
rm "$DIR"/jonesTweets.txt "$DIR"/jonesQuotes.txt
