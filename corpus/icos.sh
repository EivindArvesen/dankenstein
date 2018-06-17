#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# dep: poppler
curl -L https://github.com/masonicGIT/ico-whitepapers/archive/master.zip --output icos.zip
unzip icos.zip

find ./ico-whitepapers-master/ -name "*.pdf" -execdir pdftotext {} {}.txt \;
cat $(find ./ico-whitepapers-master/ -name "*.txt") > icos.txt

rm -rf ico-whitepapers-master icos.zip
cd -
