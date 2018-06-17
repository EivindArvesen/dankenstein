#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Steve Jobs" "$DIR"/jobs.txt

curl -L http://osxdaily.com/2014/08/20/famous-steve-jobs-speech-hidden-mac-easter-egg/ | perl -0777 -e 'print <> =~ /<blockquote>.*?\n(.*?)<\/blockquote>.*?/gs;' | sed "s/<[^>]*>//g" | perl -MHTML::Entities -pe 'decode_entities($_);' | sed "s/â/-/g" >> "$DIR"/jobs.txt
