#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

curl http://www.st-minutiae.com/resources/scripts/scripts_tng.zip --output tng.zip
unzip tng.zip
rm tng.zip

# TNG Movies...
#curl http://www.st-minutiae.com/resources/scripts/gens.txt > tng/gens.txt
#curl http://www.st-minutiae.com/resources/scripts/fc.txt > tng/fx.txt
#curl http://www.st-minutiae.com/resources/scripts/ins.txt > tng/ins.txt
#curl http://www.st-minutiae.com/resources/scripts/nem.txt > tng/nem.txt

for f in Scripts\ -\ TNG/*.txt; do
    cat "$f" | perl -0777 -ne 'while(m/(?<=\tDATA)(.*?|\s?)(?=\n\n)/gsm){print "$&\n";}' | sed "s/([^)]*)//g" | sed $'s/^[ \t]*//' | sed '/^[[:space:]]*$/d' >> data.txt
done

rm -rf Scripts\ -\ TNG/
cd -
