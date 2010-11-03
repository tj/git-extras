
PREFIX ?= /usr/local
MANPREFIX ?= "$(PREFIX)/share/man/man1"
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.md)
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)

install:
	@mkdir -p $(MANPREFIX)
	@echo "... installing bins to $(PREFIX)/bin"
	@echo "... installing man pages to $(MANPREFIX)"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(PREFIX)/$(BIN); \
	)
	cp -f man/git-*.1 $(MANPREFIX)

docs: $(MAN_HTML) $(MAN_PAGES)

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
		echo "... uninstalling $(PREFIX)/$(BIN)"; \
		rm -f $(PREFIX)/$(BIN); \
	)
	@$(foreach MAN, $(MAN_PAGES), \
		echo "... uninstalling $(MANPREFIX)/$(MAN)"; \
		rm -f $(MANPREFIX)/$(MAN); \
	)

clean: docclean

docclean:
	rm -f man/*.1
	rm -f man/*.html

.PHONY: docs clean docclean install uninstall
