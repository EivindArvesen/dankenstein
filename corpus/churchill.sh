#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getWikiQuotes.py "Winston Churchill" "$DIR"/churchill.txt
