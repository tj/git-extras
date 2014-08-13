PREFIX ?= /usr/local
BINPREFIX ?= "$(PREFIX)/bin"
MANPREFIX ?= "$(PREFIX)/share/man/man1"
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/man1/git-*.md)
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)

docs: $(MAN_HTML) $(MAN_PAGES)

install:
	@mkdir -p $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)$(BINPREFIX)
	@echo "... installing bins to $(DESTDIR)$(BINPREFIX)"
	@echo "... installing man pages to $(DESTDIR)$(MANPREFIX)"
	@$(foreach BIN, $(BINS), \
		echo "... installing $(notdir $(BIN))"; \
		cp -f $(BIN) $(DESTDIR)$(BINPREFIX); \
	)
	cp -f man/man1/git-*.1 $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)/etc/bash_completion.d
	cp -f etc/bash_completion.sh $(DESTDIR)/etc/bash_completion.d/git-extras

man/man1/%.html: man/man1/%.md
	ronn \
		--manual "Git Extras" \
		--html \
		--pipe \
		$< > $@

man/man1/%.1: man/man1/%.md
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
	rm -f $(DESTDIR)/etc/bash_completion.d/git-extras

clean: docclean

docclean:
	rm -f man/man1/*.1
	rm -f man/man1/*.html

.PHONY: docs clean docclean install uninstall
