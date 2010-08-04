
BINS = bin/git-count
PREFIX = /usr/local

install:
	cp -f $(BINS) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/git-count

.PHONY: install uninstall