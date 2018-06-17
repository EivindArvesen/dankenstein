#!/usr/bin/env python2
# encoding: utf-8

import sys
import tweepy #https://github.com/tweepy/tweepy

twitterCredentials = load_src("*", "../../twitterCredentials.py")

if len(sys.argv) <= 1:
    sys.exit('Need string to tweet')

auth = tweepy.OAuthHandler(twitterCredentials.CONSUMER_KEY, twitterCredentials.CONSUMER_SECRET)
auth.set_access_token(twitterCredentials.ACCESS_KEY, twitterCredentials.ACCESS_SECRET)

api = tweepy.API(auth)
api.update_status(sys.argv[1])
