#!/usr/bin/env python2
# encoding: utf-8

import cPickle as pickle
import os
import sys
from POSifiedText import *

current_dir = os.path.dirname(os.path.abspath(__file__))

# Load model and variables from pickle
data = pickle.load( open( current_dir+'/model.p', "rb" ) )

if len(sys.argv) > 1:
    data['sentences'] = int(sys.argv[1])

# Print randomly-generated sentences of no more than 140 characters
for i in range(data['sentences']): #96
    print(data['model'].make_short_sentence(140, max_overlap_total=data['overlap_total'], max_overlap_ratio=data['overlap_ratio'], tries=data['tries'])) # 280
