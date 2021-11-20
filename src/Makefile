LANG ?= fr
OUTPUT = output
XARGS_OPTS ?= -P4

DIRECTORIES ?= 01c2845dbb7d52e668e1a86f5d30595e89c97358	\
	02148f1beb1488277757dad5f59f6e665fea8cb4 \
	04b12d48531b9aed5dc15313ee78c7fb675dcf76 \
	055196cdb017f180fa598f9f0c17c4a1d3620c2e \
	08fd9693d4247348ddfb4cf195b9a014ea72e903 \
	09e03221cdd66c62587e837d637885c080d046e3 \
	0b2ed9eb3723567c0301690e4b48f5a79a94f96e \
	0c07242121ee9477fc85f6bbb7b430b7680de4a6 \
	0cc2c295d7a5ffea2a761a1388194a3ab45b66dd \
	0e221b81f3d57d62387af2b9a938c6eda358525e \
	0e30e94c2c8f61d30bc59112caf3c23501cd393b \
	11dbba1c12b8d2ca6e4e0d0d05f2ec1390178efb \
	19f6ef86317b972d4a370084f7fcf6c527f14f48 \
	f719215964970e2876c15df4b3a692184e4c229c \
	f7d3e61ed9ebf7239e8ce3fa0b0798b86c5d6f4a \
	f93cd0b6e8815e5d45b1012b759df9ac4e56e3c0 \
	f96d2a807d56e38b51ea6a1eac0e7cf30ca29439 \
	f995ac366f6e0e02b5e1a500f25095a6b4756102 \
	fa31522e05729f702453c0e64abdea400cb73413 \
	fb484c1b2db46f92e16e98bfb1b67ae23ea7ec42 \
	fcfa519032d12ba6ff710822cd379cc3a87eb148 \
	fe22410ff401052fd46cfd4ec895b13dd9f698be \
	ffd7fe3c68ea286a0d4bade11bb219fdc29fa3fe \
	ffeaf7aaf514aa88b611cabce176e6e454e7a0fd

testimonies: $(OUTPUT)/testimonies_$(LANG).pdf

$(OUTPUT)/testimonies_$(LANG).pdf: $(OUTPUT) testimonies-$(LANG)
	ls */output/testimony_$(LANG).pdf \
		| xargs pdfjam --outfile $@ 

.PHONY += testimonies-$(LANG)
testimonies-$(LANG):
	ls */testimony_$(LANG).tex \
		| sed "s:/.*::" \
		| xargs -I%i $(XARGS_OPTS) sh -c "cd %i && make LANG=$(LANG)"

$(OUTPUT):
	mkdir $@

clean:
	ls -p \
		| grep / \
		| xargs -P4 -I%i sh -c "cd %i && make clean"
