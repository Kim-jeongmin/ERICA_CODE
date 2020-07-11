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
  for(int i=0;i<arraySize;i++){
    for(int j=0;j<arraySize;j++){
    	for(int k=0;k<arraySize;k++){
    		if(rMatrix[i][k]==1 && rMatrix[j][i]==1) rMatrix[j][k]=1;
    		}
		}	    
	}
	for(int i=0;i<arraySize;i++){
		for(int j=0;j<arraySize;j++){
			printf("%d ",rMatrix[i][j]);
		}
		printf("\n");
	}	

  return 0;
}