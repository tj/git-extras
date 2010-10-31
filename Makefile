
PREFIX ?= /usr/local
MANPATH ?= "$(PREFIX)/share/man/man1"
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.md)
MAN_HTML = $(MANS:.md=.html)
MAN_PAGES = $(MANS:.md=.1)

install:
	@mkdir -p $(MANPATH)
	@echo "... installing to $(PREFIX)/bin"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(PREFIX)/$(BIN); \
	)

docs: $(MAN_HTML) $(MAN_PAGES)

man/%.html: man/%.md
	@echo "$< > $@"

man/%.1: man/%.md
	@echo "$< > $@"

uninstall:
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(PREFIX)/$(BIN)"; \
		rm -f $(PREFIX)/$(BIN); \
	)

clean:
	rm -f man/*.md
	rm -f man/*.html

.PHONY: docs install uninstall
