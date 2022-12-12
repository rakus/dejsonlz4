#
# Makefile for dejsonlz4
#

# Phony targets represents recipes, not files
.PHONY: all help

all: deffjsonlz4 ffjsonlz4 ## Build deffjsonlz4 and ffjsonlz4

deffjsonlz4: src/dejsonlz4.c src/lz4.c
	gcc -Wall -o $@ $^

ffjsonlz4: src/ref_compress/jsonlz4.c src/lz4.c
	gcc -Wall -I src -o $@ $^

clean: ## delete build executables deffjsonlz4 and ffjsonlz4
	rm deffjsonlz4 ffjsonlz4


help:               ## Prints targets with help text
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m\n    %s\n", $$1, $$2}'
