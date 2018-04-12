all: \
	git/revealjs \
	git/headjs \
	content_chapters

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

scripts/pipelines:
	if [ -d $@ ]; \
	then (cd $@ && git pull); \
	else git clone git@github.com:eyzhao/bio-pipelines.git $@; \
	fi

scripts/SignIT:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/SignIT.git $@; \
	fi

content_chapters: \
	papers/csh_cancer_book_chapter \
	papers/mutation-signature-tools \
	chapter/2 \
	chapter/3 \
	chapter/4 \
	chapter/5

papers/csh_cancer_book_chapter:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/csh_cancer_book_chapter.git $@; \
	fi

papers/mutation-signature-tools:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/mutation-signature-tools.git $@; \
	fi

chapter/2:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/phdthesis_brca.git $@; \
	fi

chapter/3:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/phdthesis_signit.git $@; \
	fi

chapter/4:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/phdthesis_hrdtiming.git $@; \
	fi

chapter/5:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/phdthesis_pog500.git $@; \
	fi

#################
### Load Data ###
#################

meta:
	mkdir -p meta

meta/reference_snv_signatures.txt: meta
	cp /projects/ezhao_prj/signatures/reference/wtsi_signatures/v2016-04-05/signatures_probabilities.txt $@

meta/pearson_signature_visualization.svg: meta
	Rscript custom-scripts/pearson_signature_demonstration.R -r manual/reference_snv_signatures.txt -m manual/POG357_catalog.txt -o $@

meta/signit_output.Rds:
	Rscript custom-scripts/signit_demonstration.R

meta/signit_simulated_output.Rds:
	Rscript custom-scripts/signit_simulated_demonstration.R

analysis.html: analysis.Rmd scripts/SignIT
	Rscript -e 'library(knitr); knit(input="$<", output="$@")'
