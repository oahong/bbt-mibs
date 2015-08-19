CC := gcc
CFLAGS := $(shell net-snmp-config --cflags) -fPIC -shared -g -O0
LDFLAGS := $(shell net-snmp-config --libs)

SRC := $(wildcard *.c)
LIB := $(patsubst %.c, %.so, $(notdir ${SRC}))

all:$(LIB)
	
%.so: %.c
	@echo compiling $@
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
clean:
	rm -rf *.so
