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
	git clean -nf
	make dump

dump:
	git clean -xnf
	git ls-files -i --exclude-from=.gitignore | xargs git rm -rf

view:
	open main.pdf

