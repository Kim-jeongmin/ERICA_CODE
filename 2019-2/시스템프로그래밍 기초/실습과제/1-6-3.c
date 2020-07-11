#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void dfs(int);
int n, *VISITED, **adjMat;

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
  dfs(1);
  return 0;
}
void dfs(int v){
  printf("%d",v);
  extern int *VISITED,n,**adjMat;
  VISITED[v] = 1;
  for(int w=1;w<n+1;w++){
    if(adjMat[v-1][w-1]==1 && VISITED[w]==0) {
      printf("-");
      dfs(w);
    }
  }
}

