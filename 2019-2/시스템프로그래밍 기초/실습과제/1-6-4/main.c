#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"

void bfs(int);
int n, *VISITED, **adjMat;
queue *q;

int main(void) {
  scanf("%d", &n);  // |V| = n
  
  // make adjavency matrix
  adjMat = (int**)malloc(sizeof(int*)*n);
  for(int i=0; i<n; i++){
    adjMat[i] = (int*)malloc(sizeof(int)*n);
  }
  
  // take ordered pairs
  while(1){
    char pair[20];
    scanf("%s", pair);
    
    if(!strcmp(pair, "END")){
      break;
    }
    
    int xpos = atoi(strtok(pair, " (,)"));
    int ypos = atoi(strtok(NULL, " (,)"));
    
    adjMat[xpos-1][ypos-1] = 1;
    adjMat[ypos-1][xpos-1] = 1;
  }
  
  VISITED = (int*)calloc(n, sizeof(int));
  q = (queue*)malloc(sizeof(queue));
  bfs(1);
  
  return 0;
}

void bfs(int v){
  // your codes here
  extern struct queue *q;
  printf("%d",v);
  VISITED[v] = 1;
  initialize(q);
  enqueue(v, q);
  while(!empty(q)){
    v=dequeue(q);
    for(int w=1;w<n+1;w++){
      if(adjMat[v-1][w-1]==1 && VISITED[w]==0) {
        enqueue(w,q);
        VISITED[w] = 1;
        if(w!=1) printf("-%d",w);
      }
    }
  }
}