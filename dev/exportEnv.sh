#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source activate dankenstein

pip freeze > $DIR/../requirements.txt

source deactivate
