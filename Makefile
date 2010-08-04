
PREFIX = /usr/local

BINS = bin/git-count \
	   bin/git-release

install:
	cp -f $(BINS) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/git-count
	rm -f $(PREFIX)/bin/git-release

.PHONY: install uninstall