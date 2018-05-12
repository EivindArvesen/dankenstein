#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# dep: poppler
curl http://github.com/user/repository/archive/master.zip icos.zip
unzip icos.zip

find icos -name "*.pdf" -execdir pdftotext {} {}.txt \;
cat $(find . -name "*.txt") > ../icos_all.txt

rm -rf icos icos.zip
cd -
