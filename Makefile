LSC   = ./node_modules/LiveScript/bin/lsc
MOCHA = ./node_modules/mocha/bin/mocha

SRC = $(shell find src -name '*.ls' -type f | sort)
LIB = $(patsubst src/%.ls, lib/%.js, $(SRC))

.PHONY: all

default: all

all: install clean build

package.json: package.json.ls
	@ [ -f "$(LSC)" ] || npm install LiveScript
	@ $(LSC) -c *.json.ls

lib:
	@ mkdir -p lib

lib/%.js: src/%.ls lib
	@ $(LSC) --compile --bare --output "$(@D)" "$<"

clean:
	@ [ -d lib ] && rm -R lib

build: $(LIB) package.json

install: package.json
	@ npm install

test: build
	@ $(MOCHA) --compilers ls:LiveScript --reporter dot --ui tdd
