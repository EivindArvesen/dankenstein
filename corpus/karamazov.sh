#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/files/28054/28054-0.txt > "$DIR"/karamazov.txt
