# Dr. Dankenstein

Markov Chain Twitter Bot generator.
Mashup.

Dependencies.

Described in URL

Use the source, Luke!

Args for model generator:
corpus1 corpus2 [(scale1 scale2) stateSize overlapTotal overlapRatio tries sentences modelComplexity]

e.g.
```bash
make model ARGS="tcm jobs 2.5 1 2 7 42 10 25 expert"
```

possible args to make...

make combinations | grep "bush +"
make combinations | grep "picard +"

Deployment:

Run:
```bash
heroku config:add CONSUMER_KEY=consumer_key CONSUMER_SECRET=consumer_secret ACCESS_KEY=acces_key ACCESS_SECRET=access_secret
"
```
