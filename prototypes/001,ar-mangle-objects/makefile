VPATH = obj
ARFLAGS = src
OBJ != find obj -name '*.o' -printf '%P '

all: libexample.a($(addprefix ^,$(subst /,~,$(OBJ))))

.SECONDEXPANSION:
^%.o: $$(subst ~,/,%.o)
	cp -fl $< $@
