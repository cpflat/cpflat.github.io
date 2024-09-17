# -*- makefile -*-

TARGET = index.html index_ja.html amulog.html amulog_ja.html
LIST_JA = index_ja_base.md list_journal.md list_conference.md list_tecrep_ja.md list_poster_ja.md
LIST_EN = index_en_base.md list_journal.md list_conference.md list_tecrep_en.md list_poster_en.md
#TARGET = $(shell ls *.md | sed 's/.md/.html/g')
MDSCRIPT = $(shell ls *.md)

all: $(TARGET)
	$(NULL)

%.html: %.md
	pandoc $< --embed-resources --standalone -t html5 -c pandoc-github.css -o $@

index.md: $(LIST_EN)
	python convert.py index_en_base.md > $@

index_ja.md: $(LIST_JA)
	python convert.py index_ja_base.md > $@

clean:
	rm *.html
	rm index.md index_ja.md

