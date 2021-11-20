XARGS_OPTS = -P4
LANG ?= fr

help:
	@echo "Usage: make pdf"

austama.pdf:
	cd src && make LANG=$(LANG)
	ls src/*/output/testimony.pdf | xargs $(XARGS_OPTS) pdfjam --outfile $@ 

.PHONY += pdf
pdf: austama.pdf

.PHONY += clean
clean:
	rm austama.pdf
