VPATH = obj
FILES != find obj -name '*.o' -printf '%P '

all: AR = tar
all: ARFLAGS = uf
all: example.tar.gz
example.tar: example.tar($(FILES))

%.gz: %
	gzip -f $<
