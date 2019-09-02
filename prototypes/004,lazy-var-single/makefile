define lazy-var-single
$(eval $1 = $$(eval $1 := $(value $1))$$($1))
endef

mk-path = $(info   mk-path evaluated)$(shell find $(CURDIR) -name '*.mk' -printf '%f ')
$(call lazy-var-single,mk-path)

all:
	$(info lazy-var-single: $(value lazy-var-single))
	$(info )
	$(info value before: $(value mk-path))
	$(info flavor before: $(flavor mk-path))
	$(info )
	$(info using: $(mk-path))
	$(info )
	$(info value after: $(value mk-path))
	$(info flavor after: $(flavor mk-path))
