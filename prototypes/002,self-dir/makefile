SELF := $(abspath $(realpath $(lastword $(MAKEFILE_LIST)))/..)

$(info dir: $(SELF))
$(info )

include $(SELF)/*.mk
include $(SELF)/*.mk

.PHONY: all
all: ;
