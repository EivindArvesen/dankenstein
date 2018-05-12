#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python "$DIR"/helpers/getArtistCatalog.py "Steve Jobs" "$DIR"/jobs.txt
