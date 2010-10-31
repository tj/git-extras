
PREFIX ?= /usr/local
MANPATH ?= "$(PREFIX)/share/man/man1"
BINS = $(wildcard bin/git-*)
MANS = $(wildcard man/git-*.ronn)

install:
	@echo "... installing to $(PREFIX)/bin"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(PREFIX)/$(BIN); \
	)
	@mkdir -p $(MANPATH)
	@$(foreach MAN, $(MANS), \
		echo "... generating man page `basename $(MAN)`"; \
		ronn --manual="Git Extras" $(MAN); \
	)
	@gzip man/*.1
	@cp -f man/*.1.gz $(MANPATH)

uninstall:
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(PREFIX)/$(BIN)"; \
		rm -f $(PREFIX)/$(BIN); \
	)

clean:
	rm -f man/git-*.gz man/git-*.html

.PHONY: install uninstall
