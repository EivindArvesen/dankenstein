#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source activate dankenstein

conda env export > $DIR/../dankenstein.yml
conda list -e > requirements.txt

source deactivate
