#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/cache/epub/10/pg10.txt > "$DIR"/kjv.txt
