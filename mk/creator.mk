LANG ?= fr
OUTPUT = output
OUTPUT_LANG = $(OUTPUT)/$(LANG)

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
		echo "include ../../mk/testimony.mk" > "src/$${reference}/Makefile"; \
		touch "src/$${reference}/testimony_en.tex"
