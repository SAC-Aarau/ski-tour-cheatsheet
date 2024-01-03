DIST=./dist
CHAPTERS := $(wildcard chapters/*.tex)
MEDIA_TEX := $(wildcard media/*.svg)
MEDIA_TEX_PDF := $(foreach wrd,$(MEDIA_TEX),$(wrd).pdf)

.PHONY: clean init

main.pdf: init main.tex $(CHAPTERS) $(MEDIA_TEX_PDF) bibliography.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex

$(CHAPTERS):
	touch $@

media/%.svg.pdf: media/%.svg
	inkscape --export-area-drawing --export-filename="$@" "$^"

publish: main.pdf
	cp main.pdf $(DIST)/Merkblatt.pdf
	./publish.sh $(DIST)

init:
	mkdir -p $(DIST)
