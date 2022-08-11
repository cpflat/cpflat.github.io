# -*- makefile -*-

TARGET = $(shell ls *.md | sed 's/.md/.html/g')
MDSCRIPT = $(shell ls *.md)

all: $(TARGET)
	$(NULL)

%.html: %.md
	pandoc $< --standalone --self-contained -t html5 -c pandoc-github.css -o $@

clean:
	rm *.html

