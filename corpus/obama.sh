#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

svn checkout https://github.com/pub12/MarkovText/trunk/Data%20-%20Obama
cat Data\ -\ Obama/*.txt > obama.txt

rm -rf Data\ -\ Obama

cd -
