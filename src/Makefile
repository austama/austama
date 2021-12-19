LANG ?= fr
OUTPUT = output
XARGS_OPTS ?= -P4

.PHONY += testimonies
testimonies: $(OUTPUT)/testimonies_$(LANG).pdf

.PHONY += release
release: clean-release release/output/release.pdf

release/output/release.pdf:
	cd release && make

$(OUTPUT)/testimonies_$(LANG).pdf: $(OUTPUT) testimonies-$(LANG) release
	ls */output/testimony_$(LANG).pdf  \
		| xargs pdfjam --outfile $@ release/output/release.pdf

.PHONY += testimonies-$(LANG)
testimonies-$(LANG):
	ls */testimony_$(LANG).tex \
		| sed "s:/.*::" \
		| xargs -I%i $(XARGS_OPTS) sh -c "cd %i && make LANG=$(LANG)"

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
