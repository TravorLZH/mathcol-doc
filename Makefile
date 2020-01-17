SRC=math-collections.tex

DEP=$(filter-out $(SRC),$(wildcard *.tex))

OUT=$(SRC:.tex=.pdf)
AUX=$(SRC:.tex=.aux)

all:	$(OUT)

clean:
	rm -rf *.aux *.pdf *.log *.bbl *.blg *.toc *.out

run:	$(OUT)
	open $(OUT)

$(AUX):	$(SRC) $(DEP) #refs.bib
	pdflatex $< 2>/dev/null

$(OUT):	$(AUX)
	#bibtex $<
	pdflatex $(SRC) 2>/dev/null
	pdflatex $(SRC)
