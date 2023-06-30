
#
# makefile for pthread pool
#

CC=gcc
CFLAGS=-Wall
PTHREADS=-lpthread

all: client.o pthread_pool.o
	$(CC) $(CFLAGS) -o client client.o pthread_pool.o $(PTHREADS)

client.o: client.c pthread_pool.h
	$(CC) $(CFLAGS) -c client.c

pthread_pool.o: pthread_pool.c pthread_pool.h
	$(CC) $(CFLAGS) -c pthread_pool.c

clean:
	rm -rf *.o
	rm -rf client
