#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source activate dankenstein || conda create -n dankenstein python=2.7 --yes && source activate dankenstein
pip install -r requirements.txt
#python -m nltk.downloader all
python -m "nltk.download('averaged_perceptron_tagger')"

source deactivate
