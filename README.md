# Merkblatt für Skitouren

Der Inhalt dieses Merkblatt richtet sich in erster Linie an Skitouren Neulinge.
Es handelt sich hier um eine sehr knappe Zusammenfassung der gängigen Fachliteratur, ergänzt durch die eigene Erfahrung der Tourenleitenden.
Die aktuelle Version wird über [GitHub Pages](https://sac-aarau.github.io/ski-tour-cheatsheet/Merkblatt.pdf) publiziert.

## Entwicklungsumgebung

* [Vollständige TeX Live Installation](https://tug.org/texlive/)
* [GNU Make](https://www.gnu.org/software/make/)
* Bash Kommandozeile
* Standard UNIX Werkzeuge

## Bauen & Publizieren

Es wird stets auf dem `master` Branch entwickelt.
Der `page` Branch wird auf GitHub Pages publiziert, dazu das entsprechende Target im [Makefile](./Makefile) verwenden.

```bash
# PDF bauen
make all

# Nach GitHub Pages publizieren
make publish
```
