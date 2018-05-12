#!/usr/bin/env python2

import darklyrics
import codecs
import sys
import re


def get_lyrics(artist, file_name):

    with codecs.open(file_name, 'wb', 'utf-8') as f:
        f.write(re.sub('^\s', '', re.sub(r'(?<=[\?\.\!])[\?\.\!]', '', re.sub('\s\.\n\n', '', re.sub('\.\n', '.\n\n', re.sub('(\n){2,}', '\n', re.sub('(\n){3,}', '.\n\n\n', re.sub('\[.*?\]', '', darklyrics.get_all_lyrics(artist), flags=re.DOTALL), flags=re.DOTALL), flags=re.DOTALL), flags=re.DOTALL), flags=re.DOTALL), flags=re.DOTALL), flags=re.DOTALL))


if __name__ == '__main__':
    try:
        if sys.argv[1]:
            if len(sys.argv) > 2:
                file_name = sys.argv[2]
            else:
                file_name = '%s_lyrics.txt' % sys.argv[1]

            # pass in the username of the account you want to download
            get_lyrics(sys.argv[1], file_name)
        else:
            print "Invalid artist: " + sys.argv[1]
    except Exception as e:
        print e
