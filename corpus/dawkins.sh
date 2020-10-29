#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getTweets.py RichardDawkins "$DIR"/dawkins.txt
python "$DIR"/helpers/getWikiQuotes.py "Deepak Chopra" "$DIR"/chopra.txt
