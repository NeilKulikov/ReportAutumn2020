exts = main.tex | main.pdf | Makefile | bibliography.bib

all:
	make tex
	make clean
	make view

tex:
	make aux
	#make ref
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
	echo "clean"

view:
	open main.pdf

