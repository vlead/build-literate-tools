#SHELL := /bin/bash
CODE_DIR=build/code
DOC_DIR=build/docs
PWD=$(shell pwd)
EXIT_FILE=${PWD}/exit.txt
STATUS=0

all:  restructure

init: 
	./init.sh

build: init
	make -f tangle-make -k all

restructure:  build
	echo ${DOC_DIR}
	rsync -a ${DOC_DIR}/styles/css/*.css ${CODE_DIR}/styles/css/
	rsync -a ${DOC_DIR}/styles/js/*.js ${CODE_DIR}/styles/js/
	rsync -a ${DOC_DIR}/styles/img/ ${CODE_DIR}/styles/img/
	rsync -a ${DOC_DIR}/styles/lib/ ${CODE_DIR}/styles/lib/
	mv  ${CODE_DIR}/styles ${CODE_DIR}/style
	mv  ${CODE_DIR}/templates ${CODE_DIR}/org-templates
	mv  ${CODE_DIR}/make-tools/* ${CODE_DIR}/
	rm -rf ${CODE_DIR}/make-tools/

clean:	
	make -f tangle-make clean

