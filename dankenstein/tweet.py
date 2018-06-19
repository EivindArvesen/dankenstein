#!/usr/bin/env python2
# encoding: utf-8

import os
import sys
import tweepy #https://github.com/tweepy/tweepy

if len(sys.argv) <= 1:
    sys.exit('Need string to tweet')

auth = tweepy.OAuthHandler(os.environ['CONSUMER_KEY'], os.environ['CONSUMER_SECRET'])
auth.set_access_token(os.environ['ACCESS_KEY'], os.environ['ACCESS_SECRET'])

api = tweepy.API(auth)
api.update_status(sys.argv[1])
