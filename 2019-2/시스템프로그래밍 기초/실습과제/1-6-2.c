#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int eularianPath(int, int**);

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
  
  int result = eularianPath(n, adjMat);
  printf("%s", result?"True":"False");
  return 0;
}

int eularianPath(int n, int** adjMat){
  // your codes here
  int m=0;
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      int cnt=0;
      for(int k=0;k<n;k++){
        if(adjMat[i][j]==1&&adjMat[j][k]==1) cnt++;
      }
      if(cnt>0) m++;
    }
  }
  if(m>0) return 1;
  else return 0;
}