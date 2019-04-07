# Example (simple)
include über.mk

# Example (advanced)
.PHONY: do_something

.DEFAULT:
	@$(MAKE) -füber.mk $@

do_something:
	@echo 'doing something'
