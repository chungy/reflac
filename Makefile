# Makefile for reflac

# This can be changed to "asciidoctor -b manpage" if necessary.
ASCIIDOC?=a2x -f manpage

# Autotools-like prefix, mandir, and DESTDIR variables can be
# overriden to control where files are installed.
prefix?=/usr/local
mandir?=/share/man
target=$(DESTDIR)$(prefix)

all: man

man: reflac.1

reflac.1: reflac.adoc
	$(ASCIIDOC) reflac.adoc

clean:
	rm -f reflac.1

install: reflac.1
	install -Dm 755 reflac "$(target)/bin/reflac"
	install -Dm 644 reflac.1 "$(target)$(mandir)/man1/reflac.1"

uninstall:
	$(RM) "$(target)/bin/reflac"
	$(RM) "$(target)$(mandir)/man1/reflac.1"
