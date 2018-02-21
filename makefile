#SHELL := /bin/bash
PWD=$(shell pwd)
SRC_DIR=${PWD}/src
CODE_DIR=${PWD}/build/code
DOC_DIR=${PWD}/build/docs

all: professor-pages 

init: 
	./init.sh

build: init
	make -f tangle-make -k all

professor-pages:  build
	echo ${DOC_DIR}
	rsync -a ${DOC_DIR}/styles/css/*.css ${CODE_DIR}/styles/css/
	rsync -a ${DOC_DIR}/styles/js/*.js ${CODE_DIR}/styles/js/
	rsync -a ${DOC_DIR}/styles/img/ ${CODE_DIR}/styles/img/
	rsync -a ${DOC_DIR}/styles/lib/ ${CODE_DIR}/styles/lib/
	mv  ${CODE_DIR}/styles ${CODE_DIR}/style
	mv  ${CODE_DIR}/templates ${CODE_DIR}/org-templates
	mv  ${CODE_DIR}/make-tools/* ${CODE_DIR}/
	rm -rf ${CODE_DIR}/make-tools/
	rsync -a ${SRC_DIR}/readme-for-build.org ${CODE_DIR}/README.org
	rsync -a ${SRC_DIR}/templates/tex-macros.org ${CODE_DIR}/org-templates

clean:	
	make -f tangle-make clean
