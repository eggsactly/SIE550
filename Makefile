SOURCES=$(wildcard $(SRC_DIR)*.tex)
BIBS=$(wildcard $(SRC_DIR)*.bib)
OUTPUT=$(patsubst %.tex, %.pdf, $(SOURCES))

.PHONY: all
all: $(OUTPUT) 

%.pdf: %.tex $(BIBS)
	pdflatex $(patsubst %.tex, %, $<)
ifneq ($(BIBS),)
	bibtex $(patsubst %.tex, %, $<)
	pdflatex $(patsubst %.tex, %, $<)
endif
	pdflatex $(patsubst %.tex, %, $<)

.PHONY: clean
clean:
	-rm -f *.pdf *.log *.out *.aux *.dvi *.blg *.bbl
	