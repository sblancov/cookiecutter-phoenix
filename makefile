PYTHON_VERSION=3.10

.PHONY: asdf-install-python
asdf-install-python:
	asdf plugin install python

.PHONY: asdf-install-python-version
asdf-install-python-version:
	asdf install python latest:${PYTHON_VERSION}

## Python

.PHONY: python-version
python-version:
	python -V

.PHONY: pip-version
pip-version:
	pip -V

.PHONY: install-cookiecutter
install-cookiecutter:
	pip install cookiecutter

