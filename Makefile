CHAPTERS := $(wildcard chapters/*.tex)
MEDIA_TEX := $(wildcard media/*.svg)
MEDIA_TEX_PDF := $(foreach wrd,$(MEDIA_TEX),$(wrd).pdf)

.PHONY: clear

main.pdf: main.tex $(CHAPTERS) $(MEDIA_TEX_PDF) bibliography.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex

$(CHAPTERS):
	touch $@

media/%.svg.pdf: media/%.svg
	inkscape --export-area-drawing --export-filename="$@" "$^"

clear:
	rm main.*