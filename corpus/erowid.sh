#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

#url -L https://raw.githubusercontent.com/diracdeltas/icowid-generator/master/corpi/scrape-erowid.py | python -
#curl -L https://raw.githubusercontent.com/diracdeltas/icowid-generator/master/corpi/combine_all.sh | bash

svn checkout https://github.com/diracdeltas/icowid-generator/trunk/corpi/text
cat text/*.txt > erowid.txt

rm -rf text/

cd -
