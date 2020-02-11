VPATH = obj
FILES != find obj -name '*.o' -printf '%P '

all: AR = tar
all: ARFLAGS = uf
all: example.tar($(FILES))
