#!/usr/bin/env python2
# encoding: utf-8

import codecs
import sys
import wikiquotes


def get_quotes(person, file_name):
    with codecs.open(file_name, 'wb', 'utf-8') as f:
        names=person.split(' ')
        quotes = wikiquotes.get_quotes(person, 'english')
        i=0
        for quote in quotes:
            for name in names:
                if name in quote[0: len(person)] and ':' in quote[0: len(person)]:
                    quotes[i] = quote.split(': ', 1)[-1].strip()
            i+=1

        f.writelines([quote+'\n' for quote in quotes])

if __name__ == '__main__':
    try:
        if sys.argv[1]:
            if len(sys.argv) > 2:
                file_name = sys.argv[2]
            else:
                file_name = '%s_quotes.txt' % sys.argv[1]

            # pass in the username of the account you want to download
            get_quotes(sys.argv[1], file_name)
        else:
            print "Invalid person: " + sys.argv[1]
    except Exception as e:
        print e
