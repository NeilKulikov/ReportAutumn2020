exts = main.tex | main.pdf | Makefile | bibliography.bib

all:
	make tex
	make clean
	make view

tex:
	make aux
	biber main
	make fin
	make fin

aux:
	xelatex main.tex

ref:
	bibtex main.aux

fin:
	xelatex main.tex

clean:
	make dump
	git rm -rf *.pdf 

dump:
	git rm -rf `git ls-files -i --exclude-from=.gitignore`

view:
	open main.pdf

