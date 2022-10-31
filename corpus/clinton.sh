#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getTweets.py BillClinton "$DIR"/ClintonTweets.txt
python "$DIR"/helpers/getWikiQuotes.py "Bill Clinton" "$DIR"/ClintonQuotes.txt

cat "$DIR"/ClintonTweets.txt "$DIR"/ClintonQuotes.txt > "$DIR"/Clinton.txt
rm "$DIR"/ClintonTweets.txt "$DIR"/ClintonQuotes.txt
