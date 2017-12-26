#SHELL := /bin/bash
CODE_DIR=build/code
PWD=$(shell pwd)
EXIT_FILE=${PWD}/exit.txt
STATUS=0

all:  restructure

init: 
	./init.sh

build: init
	make -f tangle-make -k all

restructure: build
	mv ${CODE_DIR}/styles ${CODE_DIR}/style
	mv ${CODE_DIR}/templates ${CODE_DIR}/org-templates
	mv ${CODE_DIR}/make-tools/* ${CODE_DIR}/
	rm -rf ${CODE_DIR}/make-tools/

clean:	
	make -f tangle-make clean

