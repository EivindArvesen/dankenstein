#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/cache/epub/61/pg61.txt > "$DIR"/tcm.txt
