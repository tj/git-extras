PREFIX ?= /usr/local
MANPREFIX ?= "$(PREFIX)/share/man/man1"
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.md)
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)

docs: $(MAN_HTML) $(MAN_PAGES)

install:
	@mkdir -p $(MANPREFIX)
	@mkdir -p $(PREFIX)/bin
	@echo "... installing bins to $(PREFIX)/bin"
	@echo "... installing man pages to $(MANPREFIX)"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(PREFIX)/$(BIN); \
	)
	cp -f man/git-*.1 $(MANPREFIX)
	@mkdir -p $(PREFIX)/etc/bash_completion.d
	cp -f etc/bash_completion.sh $(PREFIX)/etc/bash_completion.d/git-extras

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
	rm -f $(PREFIX)/etc/bash_completion.d/git-extras

clean: docclean

docclean:
	rm -f man/*.1
	rm -f man/*.html

.PHONY: docs clean docclean install uninstall
