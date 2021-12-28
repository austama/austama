help:
	@echo "Usage: make [bootstrap|console]"

all: bootstrap

bootstrap: venv 

venv:
	virtualenv venv
	cd venv && ./bin/pip install -r ../requirements.txt
	cd venv && ./bin/python ../setup.py install

console:
	cd venv && ./bin/python

