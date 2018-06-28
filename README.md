# Dankenstein

Dankenstein is a Markov Chain Twitter Bot generator, based on making a mashup of different corpora.

It is described in [this blogpost](https://www.eivindarvesen.com/blog/2018/06/20/paging-dr--dankenstein).

## Dependencies
The software itself is implemented using Bash, Make, and Python.

You'll need a Twitter Account and a Twitter application. From the latter, you'll need a consumer key, a consumer secret, an access token and an access token secret.

Enter these into `twitterCredentials.sh`

To generate the supported datasets you'll need :

- [Poppler](https://poppler.freedesktop.org/)
    - `brew install poppler` on macOS
    - `sudo apt-get install -y poppler-utils` on Ubuntu

After that, you can run  the `importEnv.sh` script in the `dev`-folder. This will create a Python virtual environment (conda if you have it, virtualenv otherwise) called `dankenstein`, and install all python-dependencies.

If you'd rather install them separately, they are: `Tweepy, darklyrics, wikiquote, markovify; (optionally nltk)`

## Usage

Usage is based around Make. The following options are available:

```
make corpora:
    Builds all corpora

make list:
    Lists all available corpora

make combinations:
    Prints all possible combinations of two candidates - may include duplicates (with switched positions)

make model ARGS="corpus1 corpus2 [(scale1 scale2) stateSize overlapTotal overlapRatio tries sentences modelComplexity]":
    Generates a model based on two corpora (the only required args).

    If you define scale 1, you must define scale 2.

    All options inside the square brackets are optional.

    ARGS:
        corpus1
            string - the name of the first corpus
                no default

        corpus2
            string - the name of the second corpus
                no default

        scale1
            float/int - scale of corpus1 relative to corpus2
                defaults to 1

        scale2
            float/int - scale of corpus2 relative to corpus1
                defaults to 1

        stateSize
            int - state size of the Markov chain
                defaults to 2

        overlapTotal
            int - maximum sequential words that overlap with a sentence from the corpora
                defaults to 15

        overlapRatio
            int - maximum percentage of overlap with a sentence from the corpora
                defaults to 70

        tries
            int - attempts to make an original sentence
                defaults to 10

        sentences
            int - number of sentences
                defaults to 5

        modelComplexity
            string - naive | expert
                defaults to "naive"

    EXAMPLE:
        make model ARGS="tcm jobs 5 1 2 8 80 10 25 expert"

make sentence:
    Outputs one sentence based on an available (previously trained) model.

make sentences:
    Outputs the amount of sentences given as an argument during model generation.

make clean:
    Deletes all corpora.

make tweet:
    Posts a tweet.

```

It is possible to se all combinations for a given candidate, e.g. `make combinations | grep "picard +"`.

## Deployment:

Twitter secrets are set via environment variables, e.g.

```bash
export CONSUMER_KEY="consumer_key"
export CONSUMER_SECRET="consumer_secret"
export ACCESS_KEY="access_token"
export ACCESS_SECRET="access_token_secret"
```

An example deployment is described in the bottom of [this blogpost](https://www.eivindarvesen.com/blog/2018/06/20/paging-dr--dankenstein).
