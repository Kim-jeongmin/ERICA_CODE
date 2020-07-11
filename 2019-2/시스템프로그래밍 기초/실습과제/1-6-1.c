#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_degree(int, int**);

int main(void) {
  int n, **adjMat;
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
  
  print_degree(n, adjMat);
  return 0;
}

void print_degree(int n, int **adjMat){
  // your codes here
  for(int i=0;i<n;i++){
    int cnt=0;
    for(int j=0;j<n;j++){
      if(adjMat[i][j]==1) cnt+=1;
    }
    printf("%d",cnt);
  }
}