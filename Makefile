XARGS_OPTS = -P4
LANGUAGE ?= fr

.PHONY += help
help:
	@echo "Usage: make [bootstrap|docker|pdf|clean]"

.PHONY += pdf
pdf: austama.pdf

austama.pdf:
	cd src && make LANGUAGE=$(LANGUAGE)
	ls src/*/output/testimony.pdf \
		| xargs $(XARGS_OPTS) pdfjam --outfile $@

.PHONY += docker docker-debian
docker: docker-debian
docker-debian:
	docker build -f Dockerfile -t austama .

.PHONY += bootstrap bootstrap-debian
bootstrap: bootstrap-debian
bootstrap-debian:
	apt-get install -y curl git make texlive-latex-base texlive-extra-utils imagemagick \
		info-beamer wiki2beamer texlive-lang-all texlive-font-utils texlive-fonts-extra

.PHONY += clean
clean:
	rm austama.pdf
