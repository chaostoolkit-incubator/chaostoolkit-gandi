.PHONY: install
install:
	pip install -r requirements.txt

.PHONY: install-dev
install-dev: install
	pip install -r requirements-dev.txt
	python setup.py develop

.PHONY: lint
lint:
	flake8 --ignore=E251 chaosgandi/
	isort --check-only --profile black chaosgandi/ tests/
	black --check --line-length=80 --diff chaosgandi/ tests/

.PHONY: format
format:
	isort --profile black chaosgandi/ tests/
	black --line-length=80 chaosgandi/ tests/

.PHONY: tests
tests:
	pytest
