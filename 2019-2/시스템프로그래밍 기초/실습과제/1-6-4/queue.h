#include <stdlib.h>

#define EMPTY 0
#define FULL  10000

typedef unsigned int      data;
typedef enum{false, true} boolean;

typedef struct elem{
  data        d;
  struct elem *next;
} elem;

typedef struct queue{
  int cnt;
  elem *front;
  elem *rear;
} queue;

void initialize(queue *q);
void enqueue(data d, queue *q);
data dequeue(queue *q);
data front(queue *q);
boolean empty(const queue *q);
boolean full(const queue *q);