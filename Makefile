# Makefile for reflac

# asciidoc is required to generate the manpage.

# Autotools-like prefix, mandir, and DESTDIR variables can be
# overriden to control where files are installed.
prefix?=/usr/local
mandir?=/share/man
target=$(DESTDIR)$(prefix)

all: man

man: reflac.1

reflac.1: reflac.adoc
	a2x -f manpage reflac.adoc

install: reflac.1
	install -d "$(target)/bin"
	install -m 755 reflac "$(target)/bin"
	install -d "$(target)$(mandir)/man1"
	install -m 644 reflac.1 "$(target)$(mandir)/man1"

clean:
	rm -f reflac.1
