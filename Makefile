
PREFIX ?= /usr/local
BINS = $(wildcard bin/git-*)

install:
	@echo "... installing to $(PREFIX)/bin"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(PREFIX)/$(BIN); \
	)

uninstall:
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(PREFIX)/$(BIN)"; \
		rm -f $(PREFIX)/$(BIN); \
	)

.PHONY: install uninstall
