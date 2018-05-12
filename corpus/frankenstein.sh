#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/files/84/84-0.txt > "$DIR"/frankenstein.txt
