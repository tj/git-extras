PREFIX ?= /usr/local
BINPREFIX ?= "$(PREFIX)/bin"
SHELL := bash

OS = $(shell uname)
ifeq ($(OS), FreeBSD)
	MANPREFIX ?= "$(PREFIX)/man/man1"
else
	MANPREFIX ?= "$(PREFIX)/share/man/man1"
endif
ifeq ($(OS), Darwin)
	COMPL_DIR ?= "$(DESTDIR)$(SYSCONFDIR)/bash_completion.d"
else
	COMPL_DIR ?= "$(DESTDIR)$(SYSCONFDIR)/bash-completion/completions"
endif

SYSCONFDIR ?= $(PREFIX)/etc
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.md)
MAN_BINS = $(filter-out man/git-extras.md, $(MANS))
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)
CODE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
INSTALL_VIA ?= source
# Libraries used by all commands
LIB = "helper/reset-env" "helper/git-extra-utility"

COMMANDS = $(subst bin/, , $(BINS))

default: install

docs: $(MAN_HTML) $(MAN_PAGES)

check:
	@echo "Check dependencies before installation"
	@./check_dependencies.sh
	@echo

install: check
	@if [ "$(INSTALL_VIA)" = brew ]; then \
		git apply brew-release.patch || { echo "Can't apply brew release patch"; exit 1; } \
	fi
	@mkdir -p $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)$(BINPREFIX)
	@echo "... installing bins to $(DESTDIR)$(BINPREFIX)"
	@echo "... installing man pages to $(DESTDIR)$(MANPREFIX)"
	$(eval TEMPFILE := $(shell mktemp -q $${TMPDIR:-/tmp}/git-extras.XXXXXX 2>/dev/null || mktemp -q))
	@# chmod from rw-------(default) to rwxrwxr-x, so that users can exec the scripts
	@chmod 775 $(TEMPFILE)
	$(eval EXISTED_ALIASES := $(shell \
		git config --get-regexp 'alias.*' | awk '{print "git-" substr($$1, 7)}'))
	@$(foreach COMMAND, $(COMMANDS), \
		disable=''; \
		if test ! -z "$(filter $(COMMAND), $(EXISTED_ALIASES))"; then \
			read -p "$(COMMAND) conflicts with an alias, still install it and disable the alias? [y/n]" answer; \
			test "$$answer" = 'n' -o "$$answer" = 'N' && disable="true"; \
		fi; \
		if test -z "$$disable"; then \
			echo "... installing $(COMMAND)"; \
			head -1 bin/$(COMMAND) > $(TEMPFILE); \
			cat $(LIB) >> $(TEMPFILE); \
			if ! grep "$(COMMAND)" not_need_git_repo >/dev/null; then \
				cat ./helper/is-git-repo >> $(TEMPFILE); \
			fi; \
			if grep "$(COMMAND)" need_git_commit >/dev/null; then \
				cat ./helper/has-git-commit >> $(TEMPFILE); \
			fi; \
			tail -n +2 bin/$(COMMAND) >> $(TEMPFILE); \
			cp -f $(TEMPFILE) $(DESTDIR)$(BINPREFIX)/$(COMMAND); \
		fi; \
	)
	@if [ -z "$(wildcard man/git-*.1)" ]; then \
		echo "WARNING: man pages not created, use 'make docs' (which requires 'ronn' ruby lib)"; \
	else \
		cp -f man/git-*.1 $(DESTDIR)$(MANPREFIX); \
		echo "cp -f man/git-*.1 $(DESTDIR)$(MANPREFIX)"; \
	fi
	@mkdir -p $(COMPL_DIR)
	cp -f etc/bash_completion.sh $(COMPL_DIR)/git-extras
	@echo ""
	@echo "If you are a zsh user, you may want to 'source $(CODE_DIR)etc/git-extras-completion.zsh'" \
		"and put this line into ~/.zshrc to enable zsh completion"
	@echo "If you are a fish user, you may want to copy or link '$(CODE_DIR)etc/git-extras.fish'" \
		"to '~/.config/fish/completions/'"

man/index.txt: $(MANS)
	echo '# manuals' > $@.tmp
	for file in $(sort $^) ; do \
		extra=$${file%.md} ; \
		extra=$${extra#man/} ; \
		echo "$$extra(1) $$extra" >> $@.tmp ; \
	done
	mv -f $@.tmp $@

man/git-extras.md: $(MAN_BINS)
	ln=$$(awk '/## COMMANDS/{print NR};' $@) ; \
	awk "NR <= $$ln+1" $@ > $@.tmp
	for file in $(sort $^) ; do \
		head -n1 $$file | \
		sed 's/^/   - **/;s/ -- /** /' >> $@.tmp ; \
	done
	ln=$$(awk '/## AUTHOR/{print NR};' $@) ; \
	awk "NR >= $$ln-1" $@ >> $@.tmp
	mv -f $@.tmp $@

man/%.html: man/%.md man/index.txt
	ronn \
		--manual "Git Extras" \
		--html \
		--pipe \
		$< > $@

man/%.1: man/%.md
	ronn -r \
		--manual "Git Extras" \
		--pipe \
		$< > $@

uninstall:
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(DESTDIR)$(BINPREFIX)/$(notdir $(BIN))"; \
		rm -f $(DESTDIR)$(BINPREFIX)/$(notdir $(BIN)); \
	)
	@$(foreach MAN, $(MAN_PAGES), \
		echo "... uninstalling $(DESTDIR)$(MANPREFIX)/$(notdir $(MAN))"; \
		rm -f $(DESTDIR)$(MANPREFIX)/$(notdir $(MAN)); \
	)
	rm -f $(COMPL_DIR)/git-extras

clean: docclean

docclean:
	rm -f man/*.1
	rm -f man/*.html

.PHONY: default docs clean docclean check install uninstall
