
PREFIX = /usr/local

BINS = bin/git-count \
	   bin/git-ignore \
	   bin/git-changelog \
	   bin/git-delete-branch \
	   bin/git-delete-tag \
	   bin/git-release

install:
	cp -f $(BINS) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/git-count
	rm -f $(PREFIX)/bin/git-ignore
	rm -f $(PREFIX)/bin/git-changelog
	rm -f $(PREFIX)/bin/git-release
	rm -f $(PREFIX)/bin/git-delete-branch
	rm -f $(PREFIX)/bin/git-delete-tag

.PHONY: install uninstall