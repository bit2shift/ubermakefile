SELF := $(abspath $(realpath $(lastword $(MAKEFILE_LIST)))/..)

define filter
import "ubermakefile" as uber;
import "ubermakefile" as $$uber;
uber::blah($$uber)
endef

all:
	$(info $(shell jq -nr -L '$(SELF)' '$(filter)'))
