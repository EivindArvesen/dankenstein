#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/files/2701/2701-0.txt > "$DIR"/moby.txt
