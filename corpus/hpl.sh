#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl -L https://ia802701.us.archive.org/17/items/TheCompleteWorksOfH.P.Lovecraft/The_Complete_Works_of_H.P._Lovecraft_djvu.txt > "$DIR"/hpl.txt
