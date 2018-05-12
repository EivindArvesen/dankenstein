#!/usr/bin/env python2
# encoding: utf-8

import os
import subprocess
import sys
import markovify
from POSifiedText import *

current_dir = os.path.dirname(os.path.abspath(__file__))


if len(sys.argv) < 2:
    sys.exit()

else:
    for candidate in [sys.argv[1], sys.argv[2]]:
        if not os.path.isfile(os.path.dirname(current_dir) + "/corpus/"+candidate+".txt"):
            try:
                subprocess.call(os.path.dirname(current_dir) + "/corpus/"+candidate+".sh", shell=True)
            except Exception as e:
                print "Corpora scripts not set as executable!"

    # Get raw text as strings and build models
    with open(os.path.dirname(current_dir) + "/corpus/"+sys.argv[1]+".txt") as f:
        text_a = f.read()
    model_a = markovify.Text(text_a) # , state_size=2

    with open(os.path.dirname(current_dir) + "/corpus/"+sys.argv[2]+".txt") as f:
        text_b = f.read()
    model_b = markovify.Text(text_b) # , state_size=2

    # Combine the models
    model_combo = markovify.combine([ model_a, model_b ], [ 1, 1 ]) # 1.7, 1

    #model_json = text_model.to_json()
    # In theory, here you'd save the JSON to disk, and then read it back later.
    #reconstituted_model = markovify.Text.from_json(model_json)
    #reconstituted_model.make_short_sentence(140)
    # You can also export the underlying Markov chain on its own — i.e., excluding the original corpus and the state_size metadata — via my_text_model.chain.to_json().

    # Print five randomly-generated sentences
    #for i in range(5):
    #    print(model_combo.make_sentence()) # , max_overlap_total=15, max_overlap_ratio=70

    # Print three randomly-generated sentences of no more than 140 characters
    for i in range(5): #96
        print(model_combo.make_short_sentence(140)) # 280
