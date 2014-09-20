LATEX	:= lualatex
SWEAVE	:= R CMD Sweave
BIBTEX	:= biber
MKIDX	:= makeindex
MKGLS	:= makeglossaries

all: thesis.pdf

thesis.pdf: abstract.tex dedication.tex intro.tex thesis.tex timeline.tex umbcthesis.cls cv.tex acks.tex
	$ $(LATEX) 	thesis
	$ $(BIBTEX) thesis
	$ $(MKGLS) 	thesis
	$ $(LATEX) 	thesis
	$ $(MKGLS) 	thesis
	$ $(LATEX) 	thesis
