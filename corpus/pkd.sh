#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://www.gutenberg.org/cache/epub/28554/pg28554.txt > "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/28644/pg28644.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/28698/pg28698.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/28767/pg28767.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/31516/pg31516.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/29132/pg29132.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/41562/pg41562.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/32522/pg32522.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/32832/pg32832.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/32032/pg32032.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/30255/pg30255.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/40964/pg40964.txt >> "$DIR"/pkd.txt
curl https://www.gutenberg.org/cache/epub/32154/pg32154.txt >> "$DIR"/pkd.txt
