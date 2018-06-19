corpora:
	@for f in ./corpus/*.sh; do bash "$$f" -H; done

list:
	@for f in ./corpus/*.sh; do basename $${f%.*}; done

combinations:
	@ARRAY=(); for f in ./corpus/*.sh; do ARRAY+=($$(basename $${f%.*})); done; for a in $${ARRAY[*]}; do shift; for b in $${ARRAY[*]}; do if [[ $$a != $$b ]]; then printf "%s + %s\n" "$$a" "$$b"; fi; done; done

# Provide arguments like so:
#	make models ARGS="corpus1 corpus2 [(scale1 scale2) stateSize overlapTotal overlapRatio tries sentences modelComplexity]"
model:
	@source twitterCredentials.sh && python ./dankenstein/trainModel.py ${ARGS}

sentence:
	@python ./dankenstein/makeSentences.py 1

sentences:
	@python ./dankenstein/makeSentences.py

clean:
	@rm ./corpus/*.txt

tweet:
	@source twitterCredentials.sh && bash ./dankenstein/bot.sh
