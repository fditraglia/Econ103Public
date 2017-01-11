TEXFILES = $(wildcard lecture[0-2][0-9].tex)
PREFIXES = $(basename $(TEXFILES))
LECTURES = $(addsuffix _screen.pdf, $(PREFIXES))
HANDOUTS = $(addsuffix _handout.pdf, $(PREFIXES))
OUTFILES = $(LECTURES)
OUTFILES += $(HANDOUTS)

all : $(OUTFILES) 

%.tex : econ103slides.sty


%_screen.pdf : %.tex
	pdflatex -jobname=$*_screen $<
	pdflatex -jobname=$*_screen $<

%_handout.pdf : %.tex
	pdflatex -jobname=$*_handout "\def\ishandout{1}\input{$<}"
	pdflatex -jobname=$*_handout "\def\ishandout{1}\input{$<}"

clean :
	-rm *.aux *.log *.toc *.snm *.out  *.nav *.vrb
