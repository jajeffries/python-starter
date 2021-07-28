.PHONY: help build test lint run checks migrations safety
.DEFAULT_GOAL: help

SRC_DIR=src

default: help

help: ## Output available commands
	@echo "Available commands:"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

lint: ## Run flake8 linting across the entire repo
	flake8 $(SRC_DIR) tests

lint-file: ## Run flake8 linting against a specific file. Use `name=testname` to specify a path to lint
	flake8 $(name)

bandit: ## Run code security analysis
	bandit --exclude tests -r $(SRC_DIR)

safety: ## Run the safety package vulnerability checker
	safety check

checks: type-check lint bandit safety check-outdated ## Run all checks

type-check: ## Run the type checker
	mypy --explicit-package-bases . --namespace-packages

check-outdated:
	pip list --outdated

run: ## Run the container
	./run.sh

test: ## Run the tests
	./run-tests.sh