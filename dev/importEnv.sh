#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source activate dankenstein && conda install --yes --file $DIR/../requirements.txt || while read requirement; do conda install --yes $requirement; done < $DIR/../requirements.txt 2>$DIR/../error.log || conda env create -f $DIR/../dankenstein.yml

source deactivate
