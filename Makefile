# -*- makefile -*-

TARGET = index.html index_ja.html amulog.html amulog_ja.html
#TARGET = $(shell ls *.md | sed 's/.md/.html/g')
MDSCRIPT = $(shell ls *.md)

all: $(TARGET)
	$(NULL)

%.html: %.md
	pandoc $< --embed-resources --standalone -t html5 -c pandoc-github.css -o $@

index.md:
	python convert.py index_en_base.md > $@

index_ja.md:
	python convert.py index_ja_base.md > $@

clean:
	rm *.html
	rm index.md index_ja.md

