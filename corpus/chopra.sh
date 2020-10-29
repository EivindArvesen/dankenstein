#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getTweets.py DeepakChopra "$DIR"/chopra.txt
python "$DIR"/helpers/getWikiQuotes.py "Deepak Chopra" "$DIR"/chopra.txt
