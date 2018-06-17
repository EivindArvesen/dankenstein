#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl http://web.mit.edu/alexmv/6.037/sicp.pdf --output "$DIR"/sicp.pdf
pdftotext "$DIR"/sicp.pdf "$DIR"/sicp.txt
rm "$DIR"/sicp.pdf
