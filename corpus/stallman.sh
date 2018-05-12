#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://archive.org/stream/faif-2.0/faif-2.0_djvu.txt > "$DIR"/stallman.txt
