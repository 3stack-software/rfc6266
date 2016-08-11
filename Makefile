MAKE   = make
PYTHON = python
SETUP  = $(PYTHON) ./setup.py

.PHONY: accept clean coverage docs readme register sdist test upload

help:
	@echo "Please use \`make <target>' where <target> is one or more of"
	@echo "  clean     delete intermediate work product and start fresh"
	@echo "  sdist     generate a source distribution into dist/"
	@echo "  bdist     generate a binary distribution into dist/"


clean:
	find . -type f -name \*.pyc -exec rm {} \;
	rm -rf dist *.egg-info .coverage .DS_Store

sdist: clean
	$(SETUP) sdist

bdist: clean
	$(SETUP) bdist_wheel --universal
