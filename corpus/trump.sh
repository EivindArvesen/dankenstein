#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Donald Trump" "$DIR"/trump.txt
python "$DIR"/helpers/getTweets.py realDonaldTrump "$DIR"/trump2.txt
cat "$DIR"/trump2.txt >> "$DIR"/trump.txt
rm "$DIR"/trump2.txt

mkdir "$DIR"/tmp-trump && cd "$DIR"/tmp-trump
curl -L https://github.com/browndw/keyness/raw/master/Clinton-Trump%20Corpus.zip --output clinton-trump.zip
unzip clinton-trump.zip
rm clinton-trump.zip
cat Clinton-Trump\ Corpus/Trump/*.txt | sed "s/<[^>]*>//g" >> "$DIR"/trump.txt
cd -
rm -rf "$DIR"/tmp-trump
