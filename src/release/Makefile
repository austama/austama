OUTPUT ?= output

$(OUTPUT)/release.pdf: $(OUTPUT)/release.tex $(OUTPUT)/version $(OUTPUT)/revision $(OUTPUT)/lang
	cd $(OUTPUT) && pdflatex release

$(OUTPUT):
	mkdir $@

$(OUTPUT)/version: $(OUTPUT)
	git describe --tags > $@

$(OUTPUT)/revision: $(OUTPUT)
	git rev-parse --short HEAD > $@

$(OUTPUT)/lang: $(OUTPUT)
	echo $${LANG:-en} > $@

$(OUTPUT)/release.tex: $(OUTPUT)
	cp release.tex $@

clean:
	-rm $(OUTPUT)/*
