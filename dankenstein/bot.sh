#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/tweet.py "$(python "$DIR"/makeSentences.py 1)"

# TODO: Support post-processing (between generator and tweet?)
#     - Grammar check (https://pypi.org/project/grammar-check/)
#     - Word blacklist
