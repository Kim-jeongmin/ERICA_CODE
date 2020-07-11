#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  
  int arraySize;
  scanf("%d", &arraySize);
  
  // make relational matrix
  int** rMatrix = (int**)malloc(sizeof(int*) * arraySize);
  for(int i=0; i<arraySize; i++){
    rMatrix[i] = (int*)calloc(arraySize, sizeof(int));
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
    
    rMatrix[xpos][ypos] = 1;
  }
  
  // your codes here
  int *array = (int*)malloc(sizeof(int) * arraySize);
  for(int i=0;i<arraySize;i++){
    int cnt=0;
    for(int j=0;j<arraySize;j++){
      if(rMatrix[i][j]==1) cnt+=1;
    }
    array[i]=cnt;
  }
  int cnt1=0;
  for(int i=0;i<arraySize;i++){
    if(array[i]==1) cnt1+=1;
  }
  if(cnt1==arraySize) printf("O");
  else printf("X");
  
  return 0;
}