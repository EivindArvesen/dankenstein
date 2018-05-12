#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

curl https://raw.githubusercontent.com/diracdeltas/icowid-generator/master/corpi/scrape-erowid.py | python -
curl https://raw.githubusercontent.com/diracdeltas/icowid-generator/master/corpi/combine_all.sh | bash
rm -rf text/

cd -
