LANG ?= fr
OUTPUT = output

PDFLATEX_ARGS = 

all: $(OUTPUT)/testimony_$(LANG).pdf

$(OUTPUT):
	mkdir $@

$(OUTPUT)/picture.jpg: $(OUTPUT)
	test -f picture.jpg \
		&& cp picture.jpg $@

$(OUTPUT)/template.tex: $(OUTPUT)
	test -f ../../templates/template.tex \
		&& cp ../../templates/template.tex $@

$(OUTPUT)/testimony.tex: $(OUTPUT)
	test -f testimony.tex \
		&& cp testimony.tex $@ \
		|| cp ../../templates/testimony.tex $@

$(OUTPUT)/austama: $(OUTPUT)
	test -f ../../templates/austama_$(LANG).tex \
		&& cp ../../templates/austama_$(LANG).tex $@

$(OUTPUT)/header: $(OUTPUT)
	test -f ../../templates/header_$(LANG).tex \
		&& cp ../../templates/header_$(LANG).tex $@

$(OUTPUT)/common: $(OUTPUT)
	test -f ../../templates/common.tex \
		&& cp ../../templates/common.tex $@

$(OUTPUT)/content: $(OUTPUT)
	test -f testimony_$(LANG).tex \
		&& cp testimony_$(LANG).tex $@

$(OUTPUT)/metadata: $(OUTPUT)
	touch $@

$(OUTPUT)/testimony.pdf: $(OUTPUT)/picture.jpg $(OUTPUT)/austama $(OUTPUT)/header $(OUTPUT)/content $(OUTPUT)/template.tex $(OUTPUT)/testimony.tex $(OUTPUT)/common $(OUTPUT)/metadata
	cd $(OUTPUT) \
		&& pdflatex $(PDFLATEX_ARGS) testimony

$(OUTPUT)/testimony_$(LANG).pdf: $(OUTPUT)/testimony.pdf
	cp $(OUTPUT)/testimony.pdf $@

.PHONY += clean-testimony
clean-testimony:
	-rm $(OUTPUT)/testimony.tex

.PHONY += clean-austama
clean-austama:
	-rm $(OUTPUT)/austama

.PHONY += clean-header
clean-header:
	-rm $(OUTPUT)/header

.PHONY += clean-content
clean-content:
	-rm $(OUTPUT)/content

.PHONY += clean-files
clean-files: clean-austama clean-header clean-content

.PHONY += clean-garbage
clean-garbage:
	-rm $(OUTPUT)/testimony.snm
	-rm $(OUTPUT)/testimony.toc
	-rm $(OUTPUT)/testimony.nav
	-rm $(OUTPUT)/testimony.out
	-rm $(OUTPUT)/testimony.aux
	-rm $(OUTPUT)/testimony.log

.PHONY += clean-pdf
clean-pdf:
	-rm $(OUTPUT)/*.pdf

.PHONY += clean
clean: clean-files clean-garbage clean-pdf
