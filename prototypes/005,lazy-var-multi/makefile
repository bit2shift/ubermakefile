define lazy-var-single
$(eval $1 = $$(eval $1 := $(value $1))$$($1))
endef

define lazy-var
$(foreach var,$1,$(call lazy-var-single,$(var)))
endef

define canned_debug
$(info flavor is '$(flavor $1)')
$(info value is '$(value $1)')
$(info expanding...)
$(info '$($1)')
$(info flavor is '$(flavor $1)')
$(info value is '$(value $1)')
$(info )
$(info )
endef

FOO = $(info stderr: foo)$(shell echo foo kek)
BAR = $(info stderr: bar)$(shell echo bar kek)
DERP = $(info stderr: derp)$(shell echo derp kek)
BLAH = $(info stderr: blah)$(shell echo blah kek)
$(call lazy-var,FOO BAR DERP BLAH)

.PHONY: all
all:
	$(call canned_debug,BAR)
	$(call canned_debug,BLAH)
	$(call canned_debug,DERP)
	$(call canned_debug,FOO)
