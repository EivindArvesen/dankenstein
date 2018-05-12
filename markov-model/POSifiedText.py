#!/usr/bin/env python2
# encoding: utf-8

import markovify
import re
import spacy

nlp = spacy.load("en")

class POSifiedText(markovify.Text):
    def word_split(self, sentence):
        return ["::".join((word.orth_, word.pos_)) for word in nlp(sentence)]

    def word_join(self, words):
        sentence = " ".join(word.split("::")[0] for word in words)
        return sentence
