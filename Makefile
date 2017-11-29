all: \
	git/revealjs \
	git/headjs

######################
### Load Reveal.js ###
######################

git/revealjs:
	if [ -d $@ ]; \
	then (cd $@ && git pull); \
	else git clone https://github.com/hakimel/reveal.js.git $@; \
	fi

git/headjs:
	if [ -d $@ ]; \
	then (cd $@ && git pull); \
	else git clone https://github.com/headjs/headjs.git $@; \
	fi
