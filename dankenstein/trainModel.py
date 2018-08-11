#!/usr/bin/env python2
# encoding: utf-8

import cPickle as pickle
import os
import subprocess
import sys
import markovify
from POSifiedText import *

current_dir = os.path.dirname(os.path.abspath(__file__))

def file_len(fname):
    p = subprocess.Popen(['wc', '-l', fname], stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)
    result, err = p.communicate()
    if p.returncode != 0:
        raise IOError(err)
    return int(result.strip().split()[0])

"""
Script that trains a Markov Model

args: corpus1 corpus2 [(scale1 scale2) stateSize overlapTotal overlapRatio tries sentences modelComplexity]
"""

if len(sys.argv) <= 2:
    sys.exit('Need two corpora!')

else:
    corpus1 = sys.argv[1]
    corpus2 = sys.argv[2]

ratio1 = float(sys.argv[3] if len(sys.argv)>4 else 1)
ratio2 = float(sys.argv[4] if len(sys.argv)>4 else 1)

state_size = int(sys.argv[5]) if len(sys.argv)>5 else 2
overlap_total = int(sys.argv[6]) if len(sys.argv)>6 else 15
overlap_ratio = int(sys.argv[7]) if len(sys.argv)>7 else 70
tries = int(sys.argv[8]) if len(sys.argv)>8 else 10
sentences = int(sys.argv[9]) if len(sys.argv)>9 else 5
model_type = str(sys.argv[10]) if len(sys.argv)>10 and (str(sys.argv[10]) == 'naive' or str(sys.argv[10])) == 'expert' else 'naive'


for candidate in [corpus1, corpus2]:
    if not os.path.isfile(os.path.dirname(current_dir)+"/corpus/"+candidate+".txt"):
        try:
            subprocess.call(os.path.dirname(current_dir) + "/corpus/"+candidate+".sh", shell=True)
        except Exception as e:
            print "Corpora scripts not set as executable!"

# Get sizes of corpora and to make model ratio basis of equal size
corpus1_size=file_len(os.path.dirname(current_dir)+"/corpus/"+corpus1+".txt")
corpus2_size=file_len(os.path.dirname(current_dir)+"/corpus/"+corpus2+".txt")

if corpus1_size >= corpus2_size:
    ratio1base = 1.0
    ratio2base = float(corpus1_size)/float(corpus2_size)
else:
    ratio2base = 1.0
    ratio1base = float(corpus2_size)/float(corpus1_size)

# Get raw text as strings and build models
with open(os.path.dirname(current_dir) + "/corpus/"+sys.argv[1]+".txt") as f:
    text_a = f.read()
with open(os.path.dirname(current_dir) + "/corpus/"+sys.argv[2]+".txt") as f:
    text_b = f.read()

if model_type == 'naive':
    # Naive models
    model_a = markovify.Text(text_a, state_size)
    model_b = markovify.Text(text_b, state_size)
elif model_type == 'expert':
    # Custom models
    model_a = POSifiedText(text_a, state_size=state_size)
    model_b = POSifiedText(text_b, state_size=state_size)

# Combine the models
model_combo = markovify.combine([ model_a, model_b ], [ ratio1base*ratio1, ratio2base*ratio2 ])


# Pickle what we need
pickle.dump( {'model': model_combo, 'overlap_total': overlap_total, 'overlap_ratio': overlap_ratio, 'tries':tries, 'sentences': sentences}, open( current_dir+'/model.pkl', "wb" ) )
