LSC=./node_modules/LiveScript/bin/lsc
MOCHA=./node_modules/mocha/bin/mocha

all: install test

metadata: *.json.ls
	@ [ -f "$(LSC)" ] || npm install LiveScript
	@ $(LSC) -c *.json.ls

install: metadata
	@ npm install

test:
	@ $(MOCHA) --compilers ls:LiveScript --reporter dot --ui tdd

.PHONY: test
