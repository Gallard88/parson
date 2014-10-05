CC = gcc
CFLAGS = -O2 -g -Wall -Wextra -std=c89 -pedantic-errors

all: test

lib: parson.c parson.h
	$(CC) $(CFLAGS) -c parson.c
	ar cru libparson.a parson.o	

install:
	install libparson.a /usr/local/lib
	cp parson.h /usr/local/include/

.PHONY: test
test: tests.c parson.c
	$(CC) $(CFLAGS) -o $@ tests.c parson.c
	./$@

clean:
	rm -f test *.o *.a
