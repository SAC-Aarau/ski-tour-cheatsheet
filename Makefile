DIST=./dist
CHAPTERS := $(wildcard chapters/*.tex)
MEDIA_TEX := $(wildcard media/*.svg)
MEDIA_TEX_PDF := $(foreach wrd,$(MEDIA_TEX),$(wrd).pdf)

.PHONY: clean init all

main.pdf: main.tex $(CHAPTERS) $(MEDIA_TEX_PDF) bibliography.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex

$(CHAPTERS):
	touch $@

media/%.svg.pdf: media/%.svg
	inkscape --export-area-drawing --export-filename="$@" "$^"

all: init main.pdf

publish: all
	cp main.pdf $(DIST)/Merkblatt.pdf
	./publish.sh $(DIST)

init:
	mkdir -p $(DIST)
 
 clean:
	rm -rf *.pdf
	rm -rf ./media/*.pdf
