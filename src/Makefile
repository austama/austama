SUPPORTED_LANGUAGE = de en es fr ru pt
DEFAULT_LANGUAGE = fr
LANGUAGE ?= $(DEFAULT_LANGUAGE)
OUTPUT = output
XARGS_OPTS ?= -P4
GROUP ?= 5

.PHONY += help
help:
	@echo "Usage: make [all|testimonies|clean]"
	@echo "  all: compile for '$(SUPPORTED_LANGUAGE)' in '$(OUTPUT)' directory."
	@echo "  testimonies: compile only for '$(DEFAULT_LANGUAGE)' or set variable LANGUAGE in '$(OUTPUT)' directory"
	@echo "  clean: clean all compiled files"

.PHONY += all
all:
	@for lang in $(SUPPORTED_LANGUAGE); do \
		printf "build language '$${lang}'... "; \
		(make testimonies LANGUAGE=$${lang} 2>&1) >/dev/null; \
		printf "done\n"; \
		done

.PHONY += testimonies
testimonies: $(OUTPUT)/testimonies_$(LANGUAGE).pdf $(OUTPUT)/testimonies_$(LANGUAGE)_pdf.zip png-zip jpeg-zip

.PHONY += png-zip
png-zip: $(OUTPUT)/testimonies_$(LANGUAGE)_png.zip

.PHONY += jpeg-zip
jpeg-zip: $(OUTPUT)/testimonies_$(LANGUAGE)_jpeg.zip

# This snippet is for testing purpose only
.PHONY += testimonies
grouped: testimonies
	c=0; \
	ls */$(OUTPUT)/testimony_$(LANGUAGE).pdf \
		| perl -ane 'push(@a,@F);END{while(@a){print(join(" ",splice(@a,0,($$ENV{"GROUP"} or 5)))."\n")}}' \
		| while read t; do c=$$((c+1)); pdfjam --outfile $(OUTPUT)/testimonies-$(LANGUAGE)-$$c.pdf $$t; done

.PHONY += release
release: clean-release release/$(OUTPUT)/release.pdf

release/$(OUTPUT)/release.pdf:
	cd release && make

$(OUTPUT)/testimonies_$(LANGUAGE).pdf: $(OUTPUT) testimonies-$(LANGUAGE) release
	ls */$(OUTPUT)/testimony_$(LANGUAGE).pdf  \
		| xargs pdfjam --outfile $@ release/$(OUTPUT)/release.pdf

$(OUTPUT)/testimonies_$(LANGUAGE)_pdf.zip: $(OUTPUT) testimonies-$(LANGUAGE) release
	ls */output/testimony_$(LANGUAGE).pdf \
		| xargs zip $@ 

$(OUTPUT)/testimonies_$(LANGUAGE)_png.zip: $(OUTPUT) testimonies-$(LANGUAGE) release
	ls */$(OUTPUT)/testimony_$(LANGUAGE).png \
		| xargs zip $@ 

$(OUTPUT)/testimonies_$(LANGUAGE)_jpeg.zip: $(OUTPUT) testimonies-$(LANGUAGE) release
	ls */$(OUTPUT)/testimony_$(LANGUAGE).jpeg \
		| xargs zip $@ 

.PHONY += testimonies-$(LANGUAGE)
testimonies-$(LANGUAGE):
	ls */testimony_$(LANGUAGE).tex \
		| sed "s:/.*::" \
		| xargs -I%i $(XARGS_OPTS) sh -c "cd %i && make LANGUAGE=$(LANGUAGE)"

$(OUTPUT):
	mkdir $@

.PHONY += clean-release
clean-release:
	-cd release && make clean

.PHONY += clean
clean:
	ls -p \
		| grep / \
		| xargs -P4 -I%i sh -c "cd %i && make clean"
	rm $(OUTPUT)/*
