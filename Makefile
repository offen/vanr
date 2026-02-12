.PHONY: help
help: # @HELP Print this message
help:
	@echo "TARGETS:"
	@grep -E '^.*: *# *@HELP' $(MAKEFILE_LIST)    \
		| awk '                                   \
			BEGIN {FS = ": *# *@HELP"};           \
			{ printf "  %-20s %s\n", $$1, $$2 };  \
			'

.PHONY: up
up: # @HELP Start the development environment
up:
	@docker compose up

.PHONY: setup
setup: # @HELP Build the development containers and install app dependencies
setup:
	@docker compose build
	@docker compose run --rm jekyll bundle install

.PHONY: build
build: # @HELP Build the static site assets
build:
	@docker compose run -e JEKYLL_REV=$$(git rev-parse --short HEAD) -e JEKYLL_ENV=production --rm jekyll bundle exec jekyll build -d ./../dist -c '_config.yml,_config.prod.yml'
