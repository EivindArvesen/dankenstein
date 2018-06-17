#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl -L https://ia800302.us.archive.org/31/items/FreeSoftwareFreeSociety-SelectedEssaysOfRichardM.Stallman2nd/FreeSoftwareFreeSociety_SelectedEs-RichardM.Stallman.txt > "$DIR"/stallman.txt
