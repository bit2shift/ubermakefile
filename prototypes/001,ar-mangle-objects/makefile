VPATH = obj
OBJ != find obj -name '*.o' -printf '%P '

all: ARFLAGS = src
all: libexample.a($(addprefix ^,$(subst /,~,$(OBJ))))

.SECONDEXPANSION:
^%.o: $$(subst ~,/,%.o)
	cp -fl $< $@
