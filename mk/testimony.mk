DEFAULT_LANGUAGE = fr
LANGUAGE ?= $(DEFAULT_LANGUAGE)
OUTPUT = output
OUTPUT_LANGUAGE = $(OUTPUT)/$(LANGUAGE)

PDFLATEX_ARGS = 

all: $(OUTPUT)/testimony_$(LANGUAGE).pdf images

$(OUTPUT):
	mkdir -p $@

$(OUTPUT_LANGUAGE): $(OUTPUT)
	mkdir -p $@

$(OUTPUT_LANGUAGE)/picture.jpg: $(OUTPUT_LANGUAGE)
	test -f picture.jpg \
		&& cp picture.jpg $@

$(OUTPUT_LANGUAGE)/template.tex: $(OUTPUT_LANGUAGE)
	test -f ../../templates/template.tex \
		&& cp ../../templates/template.tex $@

$(OUTPUT_LANGUAGE)/testimony.tex: $(OUTPUT_LANGUAGE)
	test -f testimony.tex \
		&& cp testimony.tex $@ \
		|| cp ../../templates/testimony.tex $@

$(OUTPUT_LANGUAGE)/austama: $(OUTPUT_LANGUAGE)
	test -f ../../templates/austama.tex \
		&& cp ../../templates/austama.tex $@

$(OUTPUT_LANGUAGE)/header: $(OUTPUT_LANGUAGE)
	test -f ../../templates/header_$(LANGUAGE).tex \
		&& cp ../../templates/header_$(LANGUAGE).tex $@

$(OUTPUT_LANGUAGE)/common: $(OUTPUT_LANGUAGE)
	test -f ../../templates/common.tex \
		&& cp ../../templates/common.tex $@

$(OUTPUT_LANGUAGE)/metadata: $(OUTPUT_LANGUAGE)
	test -f metadata.tex \
		&& cp metadata.tex $@

$(OUTPUT_LANGUAGE)/content: $(OUTPUT_LANGUAGE)
	test -f testimony_$(LANGUAGE).tex \
		&& cp testimony_$(LANGUAGE).tex $@

$(OUTPUT_LANGUAGE)/testimony.pdf: $(OUTPUT_LANGUAGE)/picture.jpg $(OUTPUT_LANGUAGE)/austama $(OUTPUT_LANGUAGE)/header $(OUTPUT_LANGUAGE)/metadata $(OUTPUT_LANGUAGE)/content $(OUTPUT_LANGUAGE)/template.tex $(OUTPUT_LANGUAGE)/testimony.tex $(OUTPUT_LANGUAGE)/common
	cd $(OUTPUT_LANGUAGE) \
		&& pdflatex $(PDFLATEX_ARGS) testimony

$(OUTPUT)/testimony_$(LANGUAGE).pdf: $(OUTPUT_LANGUAGE)/testimony.pdf
	cp $(OUTPUT_LANGUAGE)/testimony.pdf $@

# images generator
.PHONY += images
images: $(OUTPUT_LANGUAGE)/testimony.pdf png jpeg

.PHONY += png
png: $(OUTPUT)/testimony_$(LANGUAGE).png
$(OUTPUT)/testimony_$(LANGUAGE).png:
	pdftopng -f 1 -l 1 $(OUTPUT_LANGUAGE)/testimony.pdf - > $@

.PHONY += jpeg
jpeg: $(OUTPUT)/testimony_$(LANGUAGE).jpeg
$(OUTPUT)/testimony_$(LANGUAGE).jpeg: $(OUTPUT)/testimony_$(LANGUAGE).png
	convert $(OUTPUT)/testimony_$(LANGUAGE).png $(OUTPUT)/testimony_$(LANGUAGE).jpeg

# cleanup
.PHONY += clean-austama
clean-austama:
	-rm $(OUTPUT_LANGUAGE)/austama

.PHONY += clean-header
clean-header:
	-rm $(OUTPUT_LANGUAGE)/header

.PHONY += clean-metadata
clean-metadata:
	-rm $(OUTPUT_LANGUAGE)/metadata

.PHONY += clean-content
clean-content:
	-rm $(OUTPUT_LANGUAGE)/content
	-rm $(OUTPUT_LANGUAGE)/content.aux

clean-template:
	-rm $(OUTPUT_LANGUAGE)/template.tex

clean-picture:
	-rm $(OUTPUT_LANGUAGE)/picture.jpg

clean-testimony:
	-rm $(OUTPUT_LANGUAGE)/testimony.tex

clean-common:
	-rm $(OUTPUT_LANGUAGE)/common

.PHONY += clean-files
clean-files: clean-austama clean-header clean-metadata clean-content clean-template clean-picture clean-testimony clean-common

.PHONY += clean-garbage
clean-garbage:
	-rm $(OUTPUT_LANGUAGE)/testimony.snm
	-rm $(OUTPUT_LANGUAGE)/testimony.toc
	-rm $(OUTPUT_LANGUAGE)/testimony.nav
	-rm $(OUTPUT_LANGUAGE)/testimony.out
	-rm $(OUTPUT_LANGUAGE)/testimony.aux
	-rm $(OUTPUT_LANGUAGE)/testimony.log

.PHONY += clean-pdf
clean-pdf:
	-rm $(OUTPUT_LANGUAGE)/*.pdf

.PHONY += clean
clean: clean-files clean-garbage clean-pdf
