CC=gcc
CFLAGS=-Wall

all: reg_test
reg_test: reg_test.o
reg_test.o: reg_test.c

clean:
	rm -f reg_test reg_test.o
run: reg_test
	./reg_test
