LANG ?= fr
OUTPUT = output
OUTPUT_LANG = $(OUTPUT)/$(LANG)

PDFLATEX_ARGS = 

all: $(OUTPUT)/testimony_$(LANG).pdf

$(OUTPUT):
	mkdir -p $@

$(OUTPUT_LANG): $(OUTPUT)
	mkdir -p $@

$(OUTPUT_LANG)/picture.jpg: $(OUTPUT_LANG)
	test -f picture.jpg \
		&& cp picture.jpg $@

$(OUTPUT_LANG)/template.tex: $(OUTPUT_LANG)
	test -f ../../templates/template.tex \
		&& cp ../../templates/template.tex $@

$(OUTPUT_LANG)/testimony.tex: $(OUTPUT_LANG)
	test -f testimony.tex \
		&& cp testimony.tex $@ \
		|| cp ../../templates/testimony.tex $@

$(OUTPUT_LANG)/austama: $(OUTPUT_LANG)
	test -f ../../templates/austama.tex \
		&& cp ../../templates/austama.tex $@

$(OUTPUT_LANG)/header: $(OUTPUT_LANG)
	test -f ../../templates/header_$(LANG).tex \
		&& cp ../../templates/header_$(LANG).tex $@

$(OUTPUT_LANG)/common: $(OUTPUT_LANG)
	test -f ../../templates/common.tex \
		&& cp ../../templates/common.tex $@

$(OUTPUT_LANG)/metadata: $(OUTPUT_LANG)
	test -f metadata.tex \
		&& cp metadata.tex $@

$(OUTPUT_LANG)/content: $(OUTPUT_LANG)
	test -f testimony_$(LANG).tex \
		&& cp testimony_$(LANG).tex $@

$(OUTPUT_LANG)/testimony.pdf: $(OUTPUT_LANG)/picture.jpg $(OUTPUT_LANG)/austama $(OUTPUT_LANG)/header $(OUTPUT_LANG)/metadata $(OUTPUT_LANG)/content $(OUTPUT_LANG)/template.tex $(OUTPUT_LANG)/testimony.tex $(OUTPUT_LANG)/common
	cd $(OUTPUT_LANG) \
		&& pdflatex $(PDFLATEX_ARGS) testimony

$(OUTPUT)/testimony_$(LANG).pdf: $(OUTPUT_LANG)/testimony.pdf
	cp $(OUTPUT_LANG)/testimony.pdf $@

.PHONY += clean-austama
clean-austama:
	-rm $(OUTPUT_LANG)/austama

.PHONY += clean-header
clean-header:
	-rm $(OUTPUT_LANG)/header

.PHONY += clean-metadata
clean-metadata:
	-rm $(OUTPUT_LANG)/metadata

.PHONY += clean-content
clean-content:
	-rm $(OUTPUT_LANG)/content
	-rm $(OUTPUT_LANG)/content.aux

clean-template:
	-rm $(OUTPUT_LANG)/template.tex

clean-picture:
	-rm $(OUTPUT_LANG)/picture.jpg

clean-testimony:
	-rm $(OUTPUT_LANG)/testimony.tex

clean-common:
	-rm $(OUTPUT_LANG)/common

.PHONY += clean-files
clean-files: clean-austama clean-header clean-metadata clean-content clean-template clean-picture clean-testimony clean-common

.PHONY += clean-garbage
clean-garbage:
	-rm $(OUTPUT_LANG)/testimony.snm
	-rm $(OUTPUT_LANG)/testimony.toc
	-rm $(OUTPUT_LANG)/testimony.nav
	-rm $(OUTPUT_LANG)/testimony.out
	-rm $(OUTPUT_LANG)/testimony.aux
	-rm $(OUTPUT_LANG)/testimony.log

.PHONY += clean-pdf
clean-pdf:
	-rm $(OUTPUT_LANG)/*.pdf

.PHONY += clean
clean: clean-files clean-garbage clean-pdf

.PHONY += new
new:
	@printf "Create new entry\n"; \
		printf -- "Reference: "; read reference; \
		test -e "$${reference}" && exit 1; \
		printf -- "Name: "; read name; \
		printf -- "Location: "; read location; \
		printf -- "Age: "; read age; \
		printf -- "Vaccine: "; read vaccine; \
		printf -- "Date: "; read date; \
		printf -- "Adr: "; read adr; \
		printf -- "Url; "; read url; \
		printf -- "Picture (url): "; read picture; \
		echo "Create $${reference}..."; \
		mkdir "src/$${reference}/"; \
		echo "include ../../mk/testimony2.mk" > "src/$${reference}"; \
		sed -E  -e "s!%Name%!$${name}!" \
			-e "s!%Location%!$${location}!" \
		        -e "s!%Age%!$${age}!" \
		        -e "s!%Vaccine%!$${vaccine}!" \
		        -e "s!%Dates%!$${date}!" \
		        -e "s!%Adr%!$${adr}!" \
		        -e "s!%Url%!$${url}!" \
			"templates/_model.tex" \
			> "src/$${reference}/metadata.tex"; \
		curl -o "src/$${reference}/picture.jpg" "$${picture}"; \
		echo "include ../../mk/testimony2.mk" > "src/$${reference}/Makefile"; \
		touch "src/$${reference}/testimony_en.tex"
