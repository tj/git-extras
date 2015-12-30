MAKEFLAGS += --warn-undefined-variables

# Controls how conflicts with aliases are handled. May be: skip, install, or prompt
ALIASCONFLICT = prompt
# Whether the self-update feature is enabled. May be "enable" or "disable"
SELFUPDATE = enable
# Define if you disabled self-update and want to customize the error message
# May not contain double quotes
SELFUPDATE_DISABLED_MSG =
# Commands to disable, as a comma-separated list
DISABLECMDS =
# Set to "true" for additional progress output
VERBOSE = 

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
shlibs = $(wildcard helper/*.sh)
man_html = $(mans:.md=.html)
man_roff = $(mans:.md=.1)
docs_html = $(docs:.md=.html)
bins_out = $(subst bin,build/bin,$(bins))

buildcmd_flags = 
ifeq ($(VERBOSE),true)
buildcmd_flags += --verbose
endif
ifeq ($(SELFUPDATE),disable)
buildcmd_flags += --define SELFUPDATE=disable
endif
ifneq ($(SELFUPDATE_DISABLED_MSG),)
buildcmd_flags += --define SELFUPDATE_DISABLED_MSG="$(SELFUPDATE_DISABLED_MSG)"
endif

installcmds_flags = 
ifneq ($(DISABLECMDS),)
installcmds_flags += --disable-cmds $(DISABLECMDS)
endif

default: install

.PHONY: setup build default docs clean clean-docs install uninstall

# Set up developer tools. Only used by coders hacking on git-extras; not
# required for users or called as part of the normal installation process
setup:
	gem install ronn
	gem install github-markup

build: $(bins_out) build/etc

# Use a .dummy file as a proxy for the build/bin directory to avoid
# depending on the timestamp of build/bin/, which changes whenever a
# file is added
build/bin/.dummy:
	mkdir -p build/bin
	touch build/bin/.dummy

build/bin/%: bin/% $(shlibs) build/bin/.dummy
	./tools/build_command $(buildcmd_flags) $< --out $@

build/etc:
	mkdir -p build/etc/bash_completion.d
	cp etc/bash_completion.sh "build/etc/bash_completion.d/git-extras"

clean:
	rm -rf build

docs: $(man_roff) $(man_html) $(docs_html)

# These ronn commands should match those in man/manning-up.sh
man/%.html: man/%.md
	ronn --manual "Git Extras" --html --pipe $< > $@

man/%.1: man/%.md
	ronn -r --manual "Git Extras" --pipe $< > $@

doc/%.html: doc/%.md
	./tools/render_gh_markdown $<

clean-docs:
	rm -f man/*.1
	rm -f man/*.html
	rm -f doc/*.html

built_mans := $(wildcard man/git-*.1)

install: $(bins_out) build/etc 
	@echo "==> installing bins to $(DESTDIR)$(bindir)"
	@echo "==> installing man pages to $(DESTDIR)$(man1dir)"
ifeq ($(built_mans),)
		echo "WARNING: man pages not created, use 'make docs' (which requires 'ronn' ruby lib)"
endif
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(man1dir)
	./tools/install_commands --bindir "$(DESTDIR)$(bindir)" --man1dir "$(DESTDIR)$(man1dir)" \
		--aliasconflict $(ALIASCONFLICT) $(installcmds_flags)
	mkdir -p $(DESTDIR)$(docdir)
	cp -f doc/*.html $(DESTDIR)$(docdir)
	cp -rf doc/resources $(DESTDIR)$(docdir)
	mkdir -p $(DESTDIR)$(bashcompdir)
	cp -f build/etc/bash_completion.d/git-extras $(DESTDIR)$(bashcompdir)

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


