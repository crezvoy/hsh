
all:

test_cases=$(subst t/,,$(subst .sh,,$(wildcard t/*.sh)))

ifndef $(TEST_SHELL)
TEST_SHELL=$(SHELL)
endif

.PHONY: $(test_cases)
$(test_cases): %: t/%.sh hsh t/testenv
	@printf "%-28s" "$@"
	@t/testenv $(TEST_SHELL) $< >$@.err 2>&1; \
	if [ $$? = 0 ]; then \
		printf ' \033[32m✔\033[0m\n'; \
	    rm "$@.err"; \
		true; \
 	else \
		printf ' \033[31m✘\033[0m\n'; \
		cat "$@.err"; \
	    rm "$@.err"; \
		false; \
	fi

.PHONY: check
check: $(test_cases)

.PHONY: clean
clean:
	@-echo "cleanup"
	@-rm *.err 2>/dev/null

deps=$(wildcard src/*.d)
-include $(deps)
