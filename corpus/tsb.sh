#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl -L https://archive.org/download/pdfy-S7Va9xWFV5XFybhK/The%20Satanic%20Bible_djvu.txt > "$DIR"/tsb.txt
