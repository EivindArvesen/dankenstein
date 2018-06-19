#!/usr/bin/env python2
# encoding: utf-8

import sys
import tweepy #https://github.com/tweepy/tweepy

if len(sys.argv) <= 1:
    sys.exit('Need string to tweet')

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)

api = tweepy.API(auth)
api.update_status(sys.argv[1])
