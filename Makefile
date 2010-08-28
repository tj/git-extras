
PREFIX = /usr/local

BINS = \
	git-count \
	git-ignore \
	git-changelog \
	git-delete-branch \
	git-delete-tag \
	git-fresh-branch \
	git-repl \
	git-commits-since \
	git-summary \
	git-contrib \
	git-update-extras \
	git-extras-version \
	git-release

install:
	@echo "... installing to $(PREFIX)/bin"
	@$(foreach BIN, $(BINS), \
		echo "... installing $(BIN)"; \
		cp -f bin/$(BIN) $(PREFIX)/bin/$(BIN); \
	)

uninstall:
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(PREFIX)/bin/$(BIN)"; \
		rm -f $(PREFIX)/bin/$(BIN); \
	)

.PHONY: install uninstall