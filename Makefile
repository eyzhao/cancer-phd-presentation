all: \
	git/revealjs \
	git/headjs \
	publications/brca-signatures-paper \
	publications/pog-pancreatic-paper \
	publications/pancreatic-case-paper \
	publications/pog-sarcoma-paper \
	publications/SignIT-paper \
	publications/pog-signatures-paper \
	publications/csh_cancer_book_chapter \
	publications/mutation-signature-tools

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

publications/brca-signatures-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/brca-signature-paper.git $@; \
	fi

publications/pog-pancreatic-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/pog-pancreatic-paper.git $@; \
	fi

publications/pancreatic-case-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/pancreatic-case-paper.git $@; \
	fi

publications/pog-sarcoma-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/pog-sarcoma-paper.git $@; \
	fi

publications/mutation-signature-tools:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/mutation-signature-tools.git $@; \
	fi

publications/SignIT-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/SignIT-paper.git $@; \
	fi

publications/pog-signatures-paper:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/pog-signatures-paper.git $@; \
	fi

publications/csh_cancer_book_chapter:
	if [ -d $@ ]; \
	then(cd $@ && git pull); \
	else git clone git@github.com:eyzhao/csh_cancer_book_chapter.git $@; \
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
