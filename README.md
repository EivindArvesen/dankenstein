# Dr. Dankenstein

Markov Chain Twitter Bot generator.

Mashup.
Deps.

Described in URL

Use the source, Luke.

Args for model generator:
corpus1 corpus2 [(scale1 scale2) stateSize overlapTotal overlapRatio tries sentences modelComplexity]

e.g.
```bash
make model ARGS="tcm jobs 3 1 2 15 70 10 5 naive"
make model ARGS="tcm jobs 1.9 1 2 7 42 10 25 expert"
```

make combinations | grep "bush +"
make combinations | grep "picard +"
