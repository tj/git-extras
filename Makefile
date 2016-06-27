PREFIX ?= /usr/local
BINPREFIX ?= "$(PREFIX)/bin"
MANPREFIX ?= "$(PREFIX)/share/man/man1"
SYSCONFDIR ?= $(PREFIX)/etc
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.md)
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)
# Libraries used by all commands
LIB = "helper/reset-env" "helper/git-extra-utility"

COMMANDS = $(subst bin/, , $(BINS))

default: install

docs: $(MAN_HTML) $(MAN_PAGES)

install:
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
	@mkdir -p $(DESTDIR)$(SYSCONFDIR)/bash_completion.d
	cp -f etc/bash_completion.sh $(DESTDIR)$(SYSCONFDIR)/bash_completion.d/git-extras

man/%.html: man/%.md
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
	rm -f $(DESTDIR)$(SYSCONFDIR)/bash_completion.d/git-extras

clean: docclean

docclean:
	rm -f man/*.1
	rm -f man/*.html

.PHONY: default docs clean docclean install uninstall
