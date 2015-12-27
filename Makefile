MAKEFLAGS += --warn-undefined-variables

# Controls how conflicts with aliases are handled. May be: skip, install, or prompt
ALIASCONFLICT = prompt
# Whether the self-update feature is enabled. May be "enable" or "disable"
SELFUPDATE = enable
# Commands to disable, as a comma-separated list
DISABLECMDS =

DESTDIR ?=
PREFIX ?= /usr/local
bindir = $(PREFIX)/bin
datarootdir = $(PREFIX)/share
mandir = $(datarootdir)/man
man1dir = $(mandir)/man1
SYSCONFDIR ?= $(PREFIX)/etc
bashcompdir = $(SYSCONFDIR)/bash_completion.d
docdir = $(datarootdir)/doc/git-extras
bins = $(wildcard bin/git-*)
mans = $(wildcard man/git-*.md)
docs = $(wildcard doc/*.md)
shlibs = $(wildcard helper/*)
man_html = $(mans:.md=.html)
man_roff = $(mans:.md=.1)
docs_html = $(docs:.md=.html)

buildcmds_flags = 
ifeq ($(SELFUPDATE),disable)
buildcmds_flags += --disable-update
endif

ifneq ($(DISABLECMDS),)
buildcmds_flags += --disable-cmds $(DISABLECMDS)
endif

default: install

.PHONY: setup build default docs clean clean-docs install uninstall

# Set up developer tools. Only used by coders hacking on git-extras; not
# required for users or called as part of the normal installation process
setup:
	gem install ronn
	gem install github-markup

# Convenience command to let user force a build
# Should run exact same stuff as build/done, but unconditionally
build:
	./build_commands --aliasconflict $(ALIASCONFLICT) $(buildcmds_flags)

# Build step that's controlled by a sentinel file
build/done: $(bins) $(shlibs)
	./build_commands --aliasconflict $(ALIASCONFLICT) $(buildcmds_flags)

clean:
	rm -rf build

docs: $(man_roff) $(man_html) $(docs_html)

# These ronn commands should match those in man/manning-up.sh
man/%.html: man/%.md
	ronn --manual "Git Extras" --html --pipe $< > $@

man/%.1: man/%.md
	ronn -r --manual "Git Extras" --pipe $< > $@

doc/%.html: doc/%.md
	./render_gh_markdown.rb $<

clean-docs:
	rm -f man/*.1
	rm -f man/*.html
	rm -f doc/*.html

built_mans := $(wildcard man/git-*.1)

install: build/done
	@echo "==> installing bins to $(DESTDIR)$(bindir)"
	mkdir -p $(DESTDIR)$(bindir)
	cp -fp build/bin/* $(DESTDIR)$(bindir)
	@echo "==> installing man pages to $(DESTDIR)$(man1dir)"
	mkdir -p $(DESTDIR)$(man1dir)
	mkdir -p $(DESTDIR)$(docdir)
ifeq ($(built_mans),)
		echo "WARNING: man pages not created, use 'make docs' (which requires 'ronn' ruby lib)"
else
		cp -f build/man1/git-*.1 $(DESTDIR)$(man1dir)
		cp -f doc/*.html $(DESTDIR)$(docdir)
		cp -rf doc/resources $(DESTDIR)$(docdir)
endif
	@mkdir -p $(DESTDIR)$(bashcompdir)
	cp -f build/etc/bash_completion.d/git-extras $(DESTDIR)$(bashcompdir)/git-extras

uninstall:
	@$(foreach BIN, $(bins), \
		echo "rm -f $(DESTDIR)$(bindir)/$(notdir $(BIN))"; \
		rm -f $(DESTDIR)$(bindir)/$(notdir $(BIN)); \
	)
	@$(foreach MAN, $(man_man), \
		echo "rm -f $(DESTDIR)$(man1dir)/$(notdir $(MAN))"; \
		rm -f $(DESTDIR)$(man1dir)/$(notdir $(MAN)); \
	)
	rm -f $(DESTDIR)$(bashcompdir)/git-extras
	rm -rf $(DESTDIR)$(docdir)/*


