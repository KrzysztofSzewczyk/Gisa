
CC=gcc
CFLAGS=-Ofast -march=native -funroll-loops -fomit-frame-pointer

.PHONY: clean all asmbf

all: asmbf gisa

gisa: gisac/gisac.o gisac/lexer.o gisac/parser.o
	$(CC) $(CFLAGS) -o $@ $^

gisac/gisac.o: gisac/gisac.c
	$(CC) $(CFLAGS) -c -o $@ $^

gisac/lexer.o: gisac/lexer.c
	$(CC) $(CFLAGS) -c -o $@ $^

gisac/parser.o: gisac/parser.c
	$(CC) $(CFLAGS) -c -o $@ $^

asmbf: asmbf/Makefile
	(cd asmbf && make all && cd ..)

clean:
	rm -f gisac/*.o gisa
	(cd asmbf && make clean && cd ..)

test:
	echo "Coming soon (TM)!"
