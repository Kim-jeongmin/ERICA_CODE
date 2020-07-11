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
  int same=0,same1=0,same2=0;
  for(int i=0;i<arraySize;i++){
    if(rMatrix[i][i]==1) same+=1;
  }
  if(same==arraySize) printf("reflexive, ");
  else printf("irreflexive, ");
  for(int i=0;i<arraySize;i++){
    for(int j=0;j<arraySize;j++){
      if(rMatrix[i][j]==rMatrix[j][i]) same1+=1;
    }
  }
  if(same1==arraySize*arraySize) printf("symmetric, ");
  else printf("asymmetric, ");
  for(int i=0;i<arraySize;i++){
    for(int j=0;j<arraySize;j++){
      if(rMatrix[i][j]==1){
      	for(int k=0;k<arraySize;k++){
      		if(rMatrix[j][k]==1){
      			if(rMatrix[i][k]==1) same2+=1;
      			else break;
			  }
		  }
	  }
    }
  }
  if(same2==arraySize*arraySize) printf("transitive");
  else printf("intransitive");
  
  
  
  
  return 0;
}