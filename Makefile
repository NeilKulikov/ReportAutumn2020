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

dump:
	git ls-files -i --exclude-from=.gitignore | xargs git rm -rf

view:
	open main.pdf

