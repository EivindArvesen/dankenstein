#!/usr/bin/env python2
# encoding: utf-8

# Adapted from https://gist.github.com/yanofsky/5436496

import tweepy #https://github.com/tweepy/tweepy
import csv
import re
import sys

def load_src(name, fpath):
    # From https://pythonadventures.wordpress.com/tag/import-from-parent-directory/
    import os, imp
    p = fpath if os.path.isabs(fpath) \
        else os.path.join(os.path.dirname(__file__), fpath)
    return imp.load_source(name, p)

twitterCredentials = load_src("*", "../../twitterCredentials.py")


def get_all_tweets(screen_name, file_name=False):
    #Twitter only allows access to a users most recent 3240 tweets with this method

    #authorize twitter, initialize tweepy
    auth = tweepy.OAuthHandler(twitterCredentials.CONSUMER_KEY, twitterCredentials.CONSUMER_SECRET)
    auth.set_access_token(twitterCredentials.ACCESS_KEY, twitterCredentials.ACCESS_SECRET)
    api = tweepy.API(auth)

    #initialize a list to hold all the tweepy Tweets
    alltweets = []

    #make initial request for most recent tweets (200 is the maximum allowed count)
    new_tweets = api.user_timeline(screen_name = screen_name,count=200)

    #save most recent tweets
    alltweets.extend(new_tweets)

    #save the id of the oldest tweet less one
    oldest = alltweets[-1].id - 1

    #keep grabbing tweets until there are no tweets left to grab
    while len(new_tweets) > 0:
        print "getting tweets before %s" % (oldest)

        #all subsiquent requests use the max_id param to prevent duplicates
        new_tweets = api.user_timeline(screen_name = screen_name,count=200,max_id=oldest)

        #save most recent tweets
        alltweets.extend(new_tweets)

        #update the id of the oldest tweet less one
        oldest = alltweets[-1].id - 1

        print "...%s tweets downloaded so far" % (len(alltweets))

    outtweets = [re.sub(r'(www\S*|https?:\/\/\S*|@\S*|\n\S*)', '', tweet.text.encode("utf-8"), flags=re.MULTILINE).strip() for tweet in alltweets if (not tweet.retweeted) and ('RT @' not in tweet.text)]

    #write the csv
    with open(file_name, 'wb') as f:
        #print [line+'\r\n' for line in outtweets]
        f.writelines([line+'\r\n' for line in outtweets if line != ''])


if __name__ == '__main__':
    try:
        if sys.argv[1]:
            if len(sys.argv) > 2:
                file_name = sys.argv[2]
            else:
                file_name = '%s_tweets.txt' % sys.argv[1]

            #pass in the username of the account you want to download
            get_all_tweets(sys.argv[1], file_name)
        else:
            print "Invalid Twitter user: " + sys.argv[1]
    except Exception as e:
        print e
