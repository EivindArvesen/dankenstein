#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"$DIR"/tweet.py $(python "$DIR"/makeSentences.py 1)
